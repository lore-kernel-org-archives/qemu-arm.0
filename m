Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d8sm4591072wre.13.2020.01.08.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:02:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 22CF71FF8F;
	Wed,  8 Jan 2020 15:02:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	keithp@keithp.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 2/6] target/arm: only update pc after semihosting completes
Date: Wed,  8 Jan 2020 15:02:48 +0000
Message-Id: <20200108150252.6216-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108150252.6216-1-alex.bennee@linaro.org>
References: <20200108150252.6216-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7G97TeotXs6M

Before we introduce blocking semihosting calls we need to ensure we
can restart the system on semi hosting exception. To be able to do
this the EXCP_SEMIHOST operation should be idempotent until it finally
completes. Practically this means ensureing we only update the pc
after the semihosting call has completed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>
Tested-by: Keith Packard <keithp@keithp.com>
---
 linux-user/aarch64/cpu_loop.c | 1 +
 linux-user/arm/cpu_loop.c     | 1 +
 target/arm/helper.c           | 2 ++
 target/arm/m_helper.c         | 1 +
 target/arm/translate-a64.c    | 2 +-
 target/arm/translate.c        | 6 +++---
 6 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 31c845a70d4..bbe9fefca81 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -130,6 +130,7 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_SEMIHOST:
             env->xregs[0] = do_arm_semihosting(env);
+            env->pc += 4;
             break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 7be40717518..1fae90c6dfc 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -377,6 +377,7 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_SEMIHOST:
             env->regs[0] = do_arm_semihosting(env);
+            env->regs[15] += env->thumb ? 2 : 4;
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index da22c198006..19a57a17da5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8614,11 +8614,13 @@ static void handle_semihosting(CPUState *cs)
                       "...handling as semihosting call 0x%" PRIx64 "\n",
                       env->xregs[0]);
         env->xregs[0] = do_arm_semihosting(env);
+        env->pc += 4;
     } else {
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
         env->regs[0] = do_arm_semihosting(env);
+        env->regs[15] += env->thumb ? 2 : 4;
     }
 }
 #endif
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 76de317e6af..33d414a684b 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2185,6 +2185,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
         env->regs[0] = do_arm_semihosting(env);
+        env->regs[15] += env->thumb ? 2 : 4;
         return;
     case EXCP_BKPT:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG, false);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe6295..972c28c3c95 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1937,7 +1937,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
 #endif
-            gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         } else {
             unsupported_encoding(s, insn);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2b6c1f91bf9..5185e08641b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1124,7 +1124,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         return;
     }
 
@@ -8457,7 +8457,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
         !IS_USER(s) &&
 #endif
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -10266,7 +10266,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         !IS_USER(s) &&
 #endif
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
         gen_set_pc_im(s, s->base.pc_next);
         s->svc_imm = a->imm;
-- 
2.20.1

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l73sm17172935wma.27.2017.07.10.12.21.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:21:32 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C65D03E0A57;
	Mon, 10 Jul 2017 20:21:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Etienne Carriere <etienne.carriere@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v2 5/5] target/arm: use DISAS_EXIT for eret handling
Date: Mon, 10 Jul 2017 20:21:28 +0100
Message-Id: <20170710192128.9048-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710192128.9048-1-alex.bennee@linaro.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fQSCv9mWtU/o

Previously DISAS_JUMP did ensure this but with the optimisation of
8a6b28c7 (optimize indirect branches) we might not leave the loop.
This means if any pending interrupts are cleared by changing IRQ flags
we might never get around to servicing them. You usually notice this
by seeing the lookup_tb_ptr() helper gainfully chaining TBs together
while cpu->interrupt_request remains high and the exit_request has not
been set.

This breaks amongst other things the OPTEE test suite which executes
an eret from the secure world after a non-secure world IRQ has gone
pending which then never gets serviced.

Instead of using the previously implied semantics of DISAS_JUMP we use
DISAS_EXIT which will always exit the run-loop.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
CC: Etienne Carriere <etienne.carriere@linaro.org>
CC: Joakim Bech <joakim.bech@linaro.org>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Emilio G. Cota <cota@braap.org>
CC: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c | 3 ++-
 target/arm/translate.c     | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ad46d84efb..48825f5722 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1789,7 +1789,8 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             return;
         }
         gen_helper_exception_return(cpu_env);
-        s->is_jmp = DISAS_JUMP;
+        /* Must exit loop to check un-masked IRQs */
+        s->is_jmp = DISAS_EXIT;
         return;
     case 5: /* DRPS */
         if (rn != 0x1f) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 94aa4bbb4d..c67a4f90d4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4484,7 +4484,8 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
      */
     gen_helper_cpsr_write_eret(cpu_env, cpsr);
     tcg_temp_free_i32(cpsr);
-    s->is_jmp = DISAS_JUMP;
+    /* Must exit loop to check un-masked IRQs */
+    s->is_jmp = DISAS_EXIT;
 }
 
 /* Generate an old-style exception return. Marks pc as dead. */
@@ -9528,7 +9529,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     tmp = load_cpu_field(spsr);
                     gen_helper_cpsr_write_eret(cpu_env, tmp);
                     tcg_temp_free_i32(tmp);
-                    s->is_jmp = DISAS_JUMP;
+                    /* Must exit loop to check un-masked IRQs */
+                    s->is_jmp = DISAS_EXIT;
                 }
             }
             break;
-- 
2.13.0

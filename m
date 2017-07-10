Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b30sm7277194wra.42.2017.07.10.08.47.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:47:54 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E2E1F3E0F9A;
	Mon, 10 Jul 2017 16:47:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Etienne Carriere <etienne.carriere@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v1 6/6] target/arm: ensure eret exits the run-loop via DISAS_UPDATE
Date: Mon, 10 Jul 2017 16:47:49 +0100
Message-Id: <20170710154749.13624-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710154749.13624-1-alex.bennee@linaro.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3NqFAJ+v+Z5R

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
DISAS_UPDATE which (now) clearly states that the run-loop should be
exited as wider CPU State other than just the PC has changed.

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
index fd9724b890..9efcba49d6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1791,7 +1791,8 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             return;
         }
         gen_helper_exception_return(cpu_env);
-        s->is_jmp = DISAS_JUMP;
+        /* Must exit loop to check un-masked IRQs */
+        s->is_jmp = DISAS_UPDATE;
         return;
     case 5: /* DRPS */
         if (rn != 0x1f) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f7f5f917c7..75bdc6c7dd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4488,7 +4488,8 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
      */
     gen_helper_cpsr_write_eret(cpu_env, cpsr);
     tcg_temp_free_i32(cpsr);
-    s->is_jmp = DISAS_JUMP;
+    /* Must exit loop to check un-masked IRQs */
+    s->is_jmp = DISAS_UPDATE;
 }
 
 /* Generate an old-style exception return. Marks pc as dead. */
@@ -9534,7 +9535,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     tmp = load_cpu_field(spsr);
                     gen_helper_cpsr_write_eret(cpu_env, tmp);
                     tcg_temp_free_i32(tmp);
-                    s->is_jmp = DISAS_JUMP;
+                    /* Must exit loop to check un-masked IRQs */
+                    s->is_jmp = DISAS_UPDATE;
                 }
             }
             break;
-- 
2.13.0

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z190sm11434839wmz.31.2017.07.10.08.47.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:47:51 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 77CCD3E03FE;
	Mon, 10 Jul 2017 16:47:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v1 2/6] target/arm/translate.c: make DISAS_UPDATE match declared semantics
Date: Mon, 10 Jul 2017 16:47:45 +0100
Message-Id: <20170710154749.13624-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710154749.13624-1-alex.bennee@linaro.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 60lBVi8GzkdA

DISAS_UPDATE should be used when the wider CPU state other than just
the PC has been updated and we should therefor exit the TCG runtime
and return to the main execution loop rather assuming DISAS_JUMP would
do that.

As some DISAS_UPDATE users may update the PC dynamically via a helper
we also push the updating to the PC to hhe call sites which set
->is_jmp to DISAS_UPDATE.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0862f9e4aa..f9c4aee1b6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4430,6 +4430,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     tcg_temp_free_i32(tcg_reg);
+    gen_set_pc_im(s, s->pc);
     s->is_jmp = DISAS_UPDATE;
 }
 
@@ -4452,6 +4453,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     store_reg(s, rn, tcg_reg);
+    gen_set_pc_im(s, s->pc);
     s->is_jmp = DISAS_UPDATE;
 }
 
@@ -8058,6 +8060,7 @@ static void gen_srs(DisasContext *s,
         tcg_temp_free_i32(tmp);
     }
     tcg_temp_free_i32(addr);
+    gen_set_pc_im(s, s->pc);
     s->is_jmp = DISAS_UPDATE;
 }
 
@@ -8146,6 +8149,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             /* setend */
             if (((insn >> 9) & 1) != !!(s->be_data == MO_BE)) {
                 gen_helper_setend(cpu_env);
+                gen_set_pc_im(s, s->pc);
                 s->is_jmp = DISAS_UPDATE;
             }
             return;
@@ -11619,6 +11623,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 ARCH(6);
                 if (((insn >> 3) & 1) != !!(s->be_data == MO_BE)) {
                     gen_helper_setend(cpu_env);
+                    gen_set_pc_im(s, s->pc);
                     s->is_jmp = DISAS_UPDATE;
                 }
                 break;
@@ -12076,7 +12081,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             break;
         case DISAS_NEXT:
         case DISAS_UPDATE:
-            gen_set_pc_im(dc, dc->pc);
             /* fall through */
         default:
             /* FIXME: Single stepping a WFI insn will not halt the CPU. */
@@ -12095,12 +12099,11 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
         case DISAS_NEXT:
             gen_goto_tb(dc, 1, dc->pc);
             break;
-        case DISAS_UPDATE:
-            gen_set_pc_im(dc, dc->pc);
-            /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
+        case DISAS_UPDATE:
+            /* fall through */
         default:
             /* indicate that the hash table must be used to find the next TB */
             tcg_gen_exit_tb(0);
-- 
2.13.0

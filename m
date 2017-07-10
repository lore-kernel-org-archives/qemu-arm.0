Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y35sm11384307wrc.51.2017.07.10.08.47.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:47:52 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A9CFC3E07CF;
	Mon, 10 Jul 2017 16:47:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v1 4/6] target/arm/translate-a64: get rid of DISAS_EXIT
Date: Mon, 10 Jul 2017 16:47:47 +0100
Message-Id: <20170710154749.13624-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710154749.13624-1-alex.bennee@linaro.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5iZqsQteLUDq

We already have an exit condition that declares we should exit to the
run-loop because wider CPU state changes have been made. Use
DISAS_UPDATE and kill the architecture specific DISAS_EXIT.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 3 +--
 target/arm/translate.c     | 6 ++++--
 target/arm/translate.h     | 4 ----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fe1c49b565..bde6ca934e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1425,7 +1425,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         tcg_temp_free_i32(tcg_op);
         /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
         gen_a64_set_pc_im(s->pc);
-        s->is_jmp = (op == 0x1f ? DISAS_EXIT : DISAS_JUMP);
+        s->is_jmp = (op == 0x1f ? DISAS_UPDATE : DISAS_JUMP);
         break;
     }
     default:
@@ -11394,7 +11394,6 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
             tcg_gen_exit_tb(0);
             break;
         case DISAS_UPDATE:
-        case DISAS_EXIT:
         default:
             tcg_gen_exit_tb(0);
             break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f9c4aee1b6..e840499c6f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1194,11 +1194,13 @@ static void gen_exception_insn(DisasContext *s, int offset, int excp,
     s->is_jmp = DISAS_EXC;
 }
 
-/* Force a TB lookup after an instruction that changes the CPU state.  */
+/* Force a TB lookup after an instruction that changes the CPU state.
+ * (other than just the PC)
+ */
 static inline void gen_lookup_tb(DisasContext *s)
 {
     tcg_gen_movi_i32(cpu_R[15], s->pc & ~1);
-    s->is_jmp = DISAS_EXIT;
+    s->is_jmp = DISAS_UPDATE;
 }
 
 static inline void gen_hlt(DisasContext *s, int imm)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 15d383d9af..6b2cc34c33 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -139,10 +139,6 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * custom end-of-TB code)
  */
 #define DISAS_BX_EXCRET 11
-/* For instructions which want an immediate exit to the main loop,
- * as opposed to attempting to use lookup_and_goto_ptr.
- */
-#define DISAS_EXIT 12
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
-- 
2.13.0

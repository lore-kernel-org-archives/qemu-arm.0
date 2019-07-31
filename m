Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n9sm114495893wrp.54.2019.07.31.09.07.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 09:07:20 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A1B441FF8F;
	Wed, 31 Jul 2019 17:07:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	bobby.prani@gmail.com,
	aaron@os.amperecomputing.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v4 02/54] target/arm: handle A-profile T32 semihosting at translate time
Date: Wed, 31 Jul 2019 17:06:27 +0100
Message-Id: <20190731160719.11396-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p6GsTqPOPpJZ

As for the other semihosting calls we can resolve this at translate
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0b02c520395..662d6f49115 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10994,6 +10994,24 @@ static inline void gen_thumb_bkpt(DisasContext *s, int imm8)
     gen_exception_bkpt_insn(s, 2, syn_aa32_bkpt(imm8, true));
 }
 
+/*
+ * Thumb SWI. On A-profile CPUs this may be a semihosting call.
+ */
+static inline void gen_thumb_swi(DisasContext *s, int imm8)
+{
+    if (semihosting_enabled() &&
+#ifndef CONFIG_USER_ONLY
+        s->current_el != 0 &&
+#endif
+        (imm8 == 0xab)) {
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
+        return;
+    }
+    gen_set_pc_im(s, s->pc);
+    s->svc_imm = imm8;
+    s->base.is_jmp = DISAS_SWI;
+}
+
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t val, op, rm, rn, rd, shift, cond;
@@ -11758,10 +11776,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             goto undef;
 
         if (cond == 0xf) {
-            /* swi */
-            gen_set_pc_im(s, s->pc);
-            s->svc_imm = extract32(insn, 0, 8);
-            s->base.is_jmp = DISAS_SWI;
+            /* swi/svc  */
+            gen_thumb_swi(s, extract32(insn, 0, 8));
             break;
         }
         /* generate a conditional jump to next instruction */
-- 
2.20.1

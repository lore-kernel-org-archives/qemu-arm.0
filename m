Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 24sm2124289wmf.10.2019.08.28.09.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 09:53:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A42D71FF90;
	Wed, 28 Aug 2019 17:53:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 3/9] target/arm: handle A-profile A32 semihosting at translate time
Date: Wed, 28 Aug 2019 17:53:01 +0100
Message-Id: <20190828165307.18321-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828165307.18321-1-alex.bennee@linaro.org>
References: <20190828165307.18321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GhRCeaBULQdF

As for the other semihosting calls we can resolve this at translate
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6157e9f52fc..9dc7ec78061 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7657,6 +7657,22 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
     arm_gen_test_cc(cond ^ 1, s->condlabel);
 }
 
+static inline void gen_arm_swi(DisasContext *s, int imm24)
+{
+    if (semihosting_enabled() &&
+#ifndef CONFIG_USER_ONLY
+        s->current_el != 0 &&
+#endif
+        (imm24 == 0x123456)) {
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
+        return;
+    }
+
+    gen_set_pc_im(s, s->base.pc_next);
+    s->svc_imm = imm24;
+    s->base.is_jmp = DISAS_SWI;
+}
+
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
     unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
@@ -9195,9 +9211,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             break;
         case 0xf:
             /* swi */
-            gen_set_pc_im(s, s->base.pc_next);
-            s->svc_imm = extract32(insn, 0, 24);
-            s->base.is_jmp = DISAS_SWI;
+            gen_arm_swi(s, extract32(insn, 0, 24));
             break;
         default:
         illegal_op:
-- 
2.20.1

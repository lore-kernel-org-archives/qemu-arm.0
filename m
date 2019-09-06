Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e3sm9315586wrh.12.2019.09.06.13.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 13:26:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8CC581FF8F;
	Fri,  6 Sep 2019 21:26:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 2/4] target/arm: handle A-profile semihosting at translate time
Date: Fri,  6 Sep 2019 21:26:33 +0100
Message-Id: <20190906202636.28642-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906202636.28642-1-alex.bennee@linaro.org>
References: <20190906202636.28642-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TnPfyDdhIywR

As for the other semihosting calls we can resolve this at translate
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update for change to gen_exception_internal_insn API
v3
  - update for decode tree, merge T32 & A32 commits
  - dropped r-b due to changes
v4
  - !IS_USER and !arm_dc_feature(s, ARM_FEATURE_M)
---
 target/arm/translate.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6689acc911e..d7ee4f88ace 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10219,14 +10219,22 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
 }
 
 /*
- * Supervisor call
+ * Supervisor call - both T32 & A32 come here so we need to check
+ * which mode we are in when checking for semihosting.
  */
 
 static bool trans_SVC(DisasContext *s, arg_SVC *a)
 {
-    gen_set_pc_im(s, s->base.pc_next);
-    s->svc_imm = a->imm;
-    s->base.is_jmp = DISAS_SWI;
+    const uint32_t semihost_imm = s->thumb ? 0xab : 0x123456;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled()
+        && !IS_USER(s) && (a->imm == semihost_imm)) {
+        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+    } else {
+        gen_set_pc_im(s, s->base.pc_next);
+        s->svc_imm = a->imm;
+        s->base.is_jmp = DISAS_SWI;
+    }
     return true;
 }
 
-- 
2.20.1

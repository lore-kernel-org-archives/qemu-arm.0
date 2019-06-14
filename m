Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l19sm2196683wmj.33.2019.06.14.10.28.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 10:28:27 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D06BC1FFAF;
	Fri, 14 Jun 2019 18:12:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v3 26/50] target/arm: call qemu_plugin_insn_append
Date: Fri, 14 Jun 2019 18:11:36 +0100
Message-Id: <20190614171200.21078-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WL8Q8lpEIuvs

From: "Emilio G. Cota" <cota@braap.org>

I considered using translator_ld* from arm_ldl_code
et al. However, note that there's a helper that also calls
arm_ldl_code, so we'd have to change that caller.

In thumb's case I'm also calling plugin_insn_append directly,
since we can't assume that all instructions are 16 bits long.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate-a64.c | 2 ++
 target/arm/translate.c     | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ae739f6575..25dd34a745 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -39,6 +39,7 @@
 #include "trace-tcg.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
+#include "qemu/plugin.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
@@ -14205,6 +14206,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     uint32_t insn;
 
     insn = arm_ldl_code(env, s->pc, s->sctlr_b);
+    plugin_insn_append(&insn, sizeof(insn));
     s->insn = insn;
     s->pc += 4;
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c274c8b460..d049844b4a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12122,6 +12122,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
+    plugin_insn_append(&insn, sizeof(insn));
     dc->insn = insn;
     dc->pc += 4;
     disas_arm_insn(dc, insn);
@@ -12192,11 +12193,16 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, insn);
     dc->pc += 2;
-    if (!is_16bit) {
+    if (is_16bit) {
+        uint16_t insn16 = insn;
+
+        plugin_insn_append(&insn16, sizeof(insn16));
+    } else {
         uint32_t insn2 = arm_lduw_code(env, dc->pc, dc->sctlr_b);
 
         insn = insn << 16 | insn2;
         dc->pc += 2;
+        plugin_insn_append(&insn, sizeof(insn));
     }
     dc->insn = insn;
 
-- 
2.20.1

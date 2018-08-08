Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 8-v6sm9350975wmw.34.2018.08.08.05.39.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Aug 2018 05:39:35 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 90D503E0625;
	Wed,  8 Aug 2018 13:39:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  3/4] target/arm: add a fallback disassemble function
Date: Wed,  8 Aug 2018 13:39:33 +0100
Message-Id: <20180808123934.17450-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808123934.17450-1-alex.bennee@linaro.org>
References: <20180808123934.17450-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xXqn0cE2uLzP

Now we can generate a disassembler we need a function to hook into it.
As we only deal with SVE instructions at the moment we don't need to
differentiate the various decoders.

I special case 0x5af0 as it is used by RISU for checkpoints.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/Makefile.objs |  8 ++++++++
 target/arm/disassemble.c | 22 ++++++++++++++++++++++
 target/arm/internals.h   |  2 ++
 3 files changed, 32 insertions(+)
 create mode 100644 target/arm/disassemble.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 11c7baf8a3..4339353df8 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -20,3 +20,11 @@ target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
 
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
+
+target/arm/disas-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) --disassemble -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
+target/arm/disassemble.o: target/arm/disas-sve.inc.c
+obj-$(TARGET_AARCH64) += disassemble.o
diff --git a/target/arm/disassemble.c b/target/arm/disassemble.c
new file mode 100644
index 0000000000..801f9680cb
--- /dev/null
+++ b/target/arm/disassemble.c
@@ -0,0 +1,22 @@
+/*
+ * Fallback dissasembly
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "decoder.h"
+
+#include "disas-sve.inc.c"
+
+size_t do_aarch64_fallback_disassembly(const uint8_t *insnp, char *ptr, size_t n)
+{
+    uint32_t insn = ldl_p(insnp);
+
+    if (insn == 0x5af0) {
+        snprintf(ptr, n, "illegal insn (risu checkpoint?)");
+    } else if (!decode(ptr, n, insn)) {
+        snprintf(ptr, n, "failed decode");
+    }
+
+    return 4;
+}
diff --git a/target/arm/internals.h b/target/arm/internals.h
index dc9357766c..80796632a2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -796,4 +796,6 @@ static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
     }
 }
 
+size_t do_aarch64_fallback_disassembly(const uint8_t *insn, char *ptr, size_t n);
+
 #endif
-- 
2.17.1

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u14-v6sm4703438wrs.57.2018.08.08.05.39.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Aug 2018 05:39:35 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7B49B3E061C;
	Wed,  8 Aug 2018 13:39:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  2/4] target/arm: move decoder helpers into header
Date: Wed,  8 Aug 2018 13:39:32 +0100
Message-Id: <20180808123934.17450-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808123934.17450-1-alex.bennee@linaro.org>
References: <20180808123934.17450-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z3yJaszKh2c/

We want to re-use these helpers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/decoder.h       | 50 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 50 +-------------------------------------
 2 files changed, 51 insertions(+), 49 deletions(-)
 create mode 100644 target/arm/decoder.h

diff --git a/target/arm/decoder.h b/target/arm/decoder.h
new file mode 100644
index 0000000000..09a043fb2b
--- /dev/null
+++ b/target/arm/decoder.h
@@ -0,0 +1,50 @@
+/*
+ * Helpers for extracting complex instruction fields.
+ *
+ * These are referenced in the .decode file and emitted by decodetree.py
+ */
+
+/* See e.g. ASR (immediate, predicated).
+ * Returns -1 for unallocated encoding; diagnose later.
+ */
+static inline int tszimm_esz(int x)
+{
+    x >>= 3;  /* discard imm3 */
+    return 31 - clz32(x);
+}
+
+static inline int tszimm_shr(int x)
+{
+    return (16 << tszimm_esz(x)) - x;
+}
+
+/* See e.g. LSL (immediate, predicated).  */
+static inline int tszimm_shl(int x)
+{
+    return x - (8 << tszimm_esz(x));
+}
+
+static inline int plus1(int x)
+{
+    return x + 1;
+}
+
+/* The SH bit is in bit 8.  Extract the low 8 and shift.  */
+static inline int expand_imm_sh8s(int x)
+{
+    return (int8_t)x << (x & 0x100 ? 8 : 0);
+}
+
+static inline int expand_imm_sh8u(int x)
+{
+    return (uint8_t)x << (x & 0x100 ? 8 : 0);
+}
+
+/* Convert a 2-bit memory size (msz) to a 4-bit data type (dtype)
+ * with unsigned data.  C.f. SVE Memory Contiguous Load Group.
+ */
+static inline int msz_dtype(int msz)
+{
+    static const uint8_t dtype[4] = { 0, 5, 10, 15 };
+    return dtype[msz];
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 374051cd20..e3ec5c8ec2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -33,7 +33,7 @@
 #include "trace-tcg.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
-
+#include "decoder.h"
 
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t,
                          TCGv_i64, uint32_t, uint32_t);
@@ -47,54 +47,6 @@ typedef void gen_helper_gvec_mem(TCGv_env, TCGv_ptr, TCGv_i64, TCGv_i32);
 typedef void gen_helper_gvec_mem_scatter(TCGv_env, TCGv_ptr, TCGv_ptr,
                                          TCGv_ptr, TCGv_i64, TCGv_i32);
 
-/*
- * Helpers for extracting complex instruction fields.
- */
-
-/* See e.g. ASR (immediate, predicated).
- * Returns -1 for unallocated encoding; diagnose later.
- */
-static int tszimm_esz(int x)
-{
-    x >>= 3;  /* discard imm3 */
-    return 31 - clz32(x);
-}
-
-static int tszimm_shr(int x)
-{
-    return (16 << tszimm_esz(x)) - x;
-}
-
-/* See e.g. LSL (immediate, predicated).  */
-static int tszimm_shl(int x)
-{
-    return x - (8 << tszimm_esz(x));
-}
-
-static inline int plus1(int x)
-{
-    return x + 1;
-}
-
-/* The SH bit is in bit 8.  Extract the low 8 and shift.  */
-static inline int expand_imm_sh8s(int x)
-{
-    return (int8_t)x << (x & 0x100 ? 8 : 0);
-}
-
-static inline int expand_imm_sh8u(int x)
-{
-    return (uint8_t)x << (x & 0x100 ? 8 : 0);
-}
-
-/* Convert a 2-bit memory size (msz) to a 4-bit data type (dtype)
- * with unsigned data.  C.f. SVE Memory Contiguous Load Group.
- */
-static inline int msz_dtype(int msz)
-{
-    static const uint8_t dtype[4] = { 0, 5, 10, 15 };
-    return dtype[msz];
-}
 
 /*
  * Include the generated decoder.
-- 
2.17.1

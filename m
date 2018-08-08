Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l4-v6sm3302266wrv.23.2018.08.08.05.39.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Aug 2018 05:39:35 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A8C713E062B;
	Wed,  8 Aug 2018 13:39:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  4/4] disas: allow capstone to defer to a fallback function on failure
Date: Wed,  8 Aug 2018 13:39:34 +0100
Message-Id: <20180808123934.17450-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808123934.17450-1-alex.bennee@linaro.org>
References: <20180808123934.17450-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P3eST/qBrbLx

We can abuse the CS_OPT_SKIPDATA by providing a call back when
capstone can't disassemble something. The passing of the string to the
dump function is a little clunky but works.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 disas.c             | 30 +++++++++++++++++++++++++++++-
 include/disas/bfd.h | 11 ++++++++++-
 target/arm/cpu.c    |  4 ++++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/disas.c b/disas.c
index 5325b7e6be..dfd2c251c5 100644
--- a/disas.c
+++ b/disas.c
@@ -178,6 +178,20 @@ static int print_insn_od_target(bfd_vma pc, disassemble_info *info)
    to share this across calls and across host vs target disassembly.  */
 static __thread cs_insn *cap_insn;
 
+
+/* Handle fall-back dissasembly. We don't print here but we do set
+ * cap_fallback_str for cap_dump_insn to used*/
+static size_t cap_disas_fallback(const uint8_t *code, size_t code_size,
+                                 size_t offset, void *user_data)
+{
+    disassemble_info *info = (disassemble_info *) user_data;
+    info->cap_fallback_str = g_malloc0(256);
+    size_t skip = info->capstone_fallback_func(code + offset,
+                                               info->cap_fallback_str, 256);
+    return skip;
+}
+
+
 /* Initialize the Capstone library.  */
 /* ??? It would be nice to cache this.  We would need one handle for the
    host and one for the target.  For most targets we can reset specific
@@ -206,6 +220,14 @@ static cs_err cap_disas_start(disassemble_info *info, csh *handle)
         cs_option(*handle, CS_OPT_SYNTAX, CS_OPT_SYNTAX_ATT);
     }
 
+    if (info->capstone_fallback_func) {
+        cs_opt_skipdata skipdata = {
+            .callback = cap_disas_fallback,
+            .user_data = info,
+        };
+        cs_option(*handle, CS_OPT_SKIPDATA_SETUP, (size_t) &skipdata);
+    }
+
     /* "Disassemble" unknown insns as ".byte W,X,Y,Z".  */
     cs_option(*handle, CS_OPT_SKIPDATA, CS_OPT_ON);
 
@@ -281,7 +303,13 @@ static void cap_dump_insn(disassemble_info *info, cs_insn *insn)
     }
 
     /* Print the actual instruction.  */
-    print(info->stream, "  %-8s %s\n", insn->mnemonic, insn->op_str);
+    if (info->cap_fallback_str) {
+        print(info->stream, "  %s\n", info->cap_fallback_str);
+        g_free(info->cap_fallback_str);
+        info->cap_fallback_str = NULL;
+    } else {
+        print(info->stream, "  %-8s %s\n", insn->mnemonic, insn->op_str);
+    }
 
     /* Dump any remaining part of the insn on subsequent lines.  */
     for (i = split; i < n; i += split) {
diff --git a/include/disas/bfd.h b/include/disas/bfd.h
index 1f69a6e9d3..9d99bfef48 100644
--- a/include/disas/bfd.h
+++ b/include/disas/bfd.h
@@ -377,6 +377,12 @@ typedef struct disassemble_info {
   int cap_insn_unit;
   int cap_insn_split;
 
+  /* Fallback function to disassemble things capstone can't. */
+  size_t (*capstone_fallback_func)
+    (const uint8_t *insn, char *ptr, size_t n);
+
+  char *cap_fallback_str;
+
 } disassemble_info;
 
 
@@ -491,7 +497,10 @@ int generic_symbol_at_address(bfd_vma, struct disassemble_info *);
   (INFO).bytes_per_chunk = 0, \
   (INFO).display_endian = BFD_ENDIAN_UNKNOWN, \
   (INFO).disassembler_options = NULL, \
-  (INFO).insn_info_valid = 0
+  (INFO).insn_info_valid = 0, \
+  (INFO).capstone_fallback_func = NULL, \
+  (INFO).cap_fallback_str = NULL
+
 
 #ifndef ATTRIBUTE_UNUSED
 #define ATTRIBUTE_UNUSED __attribute__((unused))
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 64a8005a4b..cfefbfb0b9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -519,6 +519,10 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
         info->cap_arch = CS_ARCH_ARM64;
         info->cap_insn_unit = 4;
         info->cap_insn_split = 4;
+
+#if defined(TARGET_AARCH64)
+        info->capstone_fallback_func = do_aarch64_fallback_disassembly;
+#endif
     } else {
         int cap_mode;
         if (env->thumb) {
-- 
2.17.1

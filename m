Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n17sm3690203wra.6.2017.08.17.11.04.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 11:04:05 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A2A443E08D5;
	Thu, 17 Aug 2017 19:04:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: rth@twiddle.net,
	cota@braap.org,
	batuzovk@ispras.ru
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 2/9] tcg: introduce the concepts of a TCGv_vec register type
Date: Thu, 17 Aug 2017 19:03:57 +0100
Message-Id: <20170817180404.29334-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170817180404.29334-1-alex.bennee@linaro.org>
References: <20170817180404.29334-1-alex.bennee@linaro.org>
X-TUID: UUPI5NfwEXPJ

Currently it only makes sense for globals - i.e. registers directly
mapped to CPUEnv.
---
 tcg/README |  1 +
 tcg/tcg.h  | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/tcg/README b/tcg/README
index f116b7b694..e0868d95b4 100644
--- a/tcg/README
+++ b/tcg/README
@@ -57,6 +57,7 @@ typed. A number of types are supported:
 
   TCGv_i32 - 32 bit integer
   TCGv_i64 - 64 bit integer
+  TCGv_vec - an arbitrary sized vector register
   TCGv     - target pointer (aliased to 32 or 64 bit integer)
   TCGv_ptr - host pointer (used for direct access to host structures)
 
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 17b7750ee6..d75636b6ab 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -256,6 +256,7 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
+    TCG_TYPE_VECTOR,
     TCG_TYPE_COUNT, /* number of different types */
 
     /* An alias for the size of the host register.  */
@@ -431,6 +432,7 @@ typedef tcg_target_ulong TCGArg;
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
 typedef struct TCGv_ptr_d *TCGv_ptr;
+typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
 #if TARGET_LONG_BITS == 32
 #define TCGv TCGv_i32
@@ -450,6 +452,11 @@ static inline TCGv_i64 QEMU_ARTIFICIAL MAKE_TCGV_I64(intptr_t i)
     return (TCGv_i64)i;
 }
 
+static inline TCGv_vec QEMU_ARTIFICIAL MAKE_TCGV_VEC(intptr_t i)
+{
+    return (TCGv_vec)i;
+}
+
 static inline TCGv_ptr QEMU_ARTIFICIAL MAKE_TCGV_PTR(intptr_t i)
 {
     return (TCGv_ptr)i;
@@ -465,6 +472,11 @@ static inline intptr_t QEMU_ARTIFICIAL GET_TCGV_I64(TCGv_i64 t)
     return (intptr_t)t;
 }
 
+static inline intptr_t QEMU_ARTIFICIAL GET_TCGV_VEC(TCGv_vec t)
+{
+    return (intptr_t)t;
+}
+
 static inline intptr_t QEMU_ARTIFICIAL GET_TCGV_PTR(TCGv_ptr t)
 {
     return (intptr_t)t;
@@ -788,6 +800,7 @@ int tcg_global_mem_new_internal(TCGType, TCGv_ptr, intptr_t, const char *);
 
 TCGv_i32 tcg_global_reg_new_i32(TCGReg reg, const char *name);
 TCGv_i64 tcg_global_reg_new_i64(TCGReg reg, const char *name);
+TCGv_vec tcg_global_reg_new_vec(TCGReg reg, const char *name);
 
 TCGv_i32 tcg_temp_new_internal_i32(int temp_local);
 TCGv_i64 tcg_temp_new_internal_i64(int temp_local);
@@ -829,6 +842,13 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return tcg_temp_new_internal_i64(1);
 }
 
+static inline TCGv_vec tcg_global_mem_new_vec(TCGv_ptr reg, intptr_t offset,
+                                              const char *name)
+{
+    int idx = tcg_global_mem_new_internal(TCG_TYPE_VECTOR, reg, offset, name);
+    return MAKE_TCGV_VEC(idx);
+}
+
 #if defined(CONFIG_DEBUG_TCG)
 /* If you call tcg_clear_temp_count() at the start of a section of
  * code which is not supposed to leak any TCG temporaries, then
-- 
2.13.0

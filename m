Received: by 10.25.21.156 with SMTP id 28csp114861lfv;
        Tue, 23 Aug 2016 21:21:24 -0700 (PDT)
X-Received: by 10.55.127.1 with SMTP id a1mr1031761qkd.80.1472012484520;
        Tue, 23 Aug 2016 21:21:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a48si5058151qta.99.2016.08.23.21.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPgp-0008NI-VW
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:21:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfB-0007IW-Ol
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPf7-0004eU-E8
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:40 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPf7-0004e9-8M; Wed, 24 Aug 2016 00:19:37 -0400
Received: by mail-qt0-f195.google.com with SMTP id c52so200017qte.1;
	Tue, 23 Aug 2016 21:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MOZpSKHtag7ve9kn0lIIj4me5SG6e0+XpJXnFKKB3Dg=;
	b=SprMg2RPfKxrXZL3cfEJNa9HYs9kshNjUIQLbomz1t5TEpLkh8D93B3uQSpwWrkD6q
	BH8DiPkl1mpBA4JLLbUXplQkLxIbADzsikOC1Dm9P/u1n5WxsLCtxicMH6mXVOQFBeV4
	5+pGSY3X0bStlIKm//3b8dAb9HItqI8ST/GwRo0AXw+KxikiKlb/iES3RJjVp8dy4Q/P
	o4YRYtKf2GYtkvtKtg0Uyuq+0+Gi4t1PGSgcIUdz0TEshF21TrvRFvmE3JAG7GGnjrSL
	Qh4V/EKeamjflP7DidPBZj93X9pya4Ln1PopHkhriCXXJirQahV1lBeexrgglra3T5h3
	IKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=MOZpSKHtag7ve9kn0lIIj4me5SG6e0+XpJXnFKKB3Dg=;
	b=JXznsiFb4lRCi3dxyDNFsrHwWqYmNx6Y8NQI7EPqiYaW+sPX3AhAWB79rJ0HvU1Gcg
	rTXCvMddX1ErWXRA4fRAfkj4uSJig18VWP+VfVbT/lCEQJ7XdJJuSvT+guw4ELQzMwok
	aIHJXUMHrPhWoE1IG7ITz8oRsqMrTFexZK7ZadAiIK7DP2mHYGCMxySL9ugjl5MldXux
	IsNKiVXvNQuNTOUm7v5MsylTYkRT4dnBJ+fg8hKK/XRAJCpEpBGgjIhRhl3672JCq+lt
	7MQdjgOGt7qxMCyiR+cYEGkVNMoecEIEN4gYVcgOnbcuWpKT1+idBpQG8SrN7iiNzNd+
	lPTQ==
X-Gm-Message-State: AE9vXwNcw9f2DuvqaT+WfvV8ZSF8+ngq+iWnxdfJ6XlueRZ3etfyip+DW+wL5MdgfHvtjQ==
X-Received: by 10.200.50.82 with SMTP id y18mr1055166qta.29.1472012316647;
	Tue, 23 Aug 2016 21:18:36 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:36 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:55 -0700
Message-Id: <1472012279-20581-4-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.195
Subject: [Qemu-devel] [PATCH 3/7] cutils: Rearrange buffer_is_zero
 acceleration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, vijay.kilari@gmail.com,
	peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PzM8usWS1hd1

Allow selection of several acceleration functions
based on the size and alignment of the buffer.
Do not require ifunc support for AVX2 acceleration.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 configure     |  21 +---
 util/cutils.c | 357 +++++++++++++++++++++++++++-------------------------------
 2 files changed, 175 insertions(+), 203 deletions(-)

diff --git a/configure b/configure
index 4b808f9..9f3d1fa 100755
--- a/configure
+++ b/configure
@@ -1788,28 +1788,19 @@ fi
 ##########################################
 # avx2 optimization requirement check
 
-
-if test "$static" = "no" ; then
-  cat > $TMPC << EOF
+cat > $TMPC << EOF
 #pragma GCC push_options
 #pragma GCC target("avx2")
 #include <cpuid.h>
 #include <immintrin.h>
-
 static int bar(void *a) {
-    return _mm256_movemask_epi8(_mm256_cmpeq_epi8(*(__m256i *)a, (__m256i){0}));
+    __m256i x = *(__m256i *)a;
+    return _mm256_testz_si256(x, x);
 }
-static void *bar_ifunc(void) {return (void*) bar;}
-int foo(void *a) __attribute__((ifunc("bar_ifunc")));
-int main(int argc, char *argv[]) { return foo(argv[0]);}
+int main(int argc, char *argv[]) { return bar(argv[0]); }
 EOF
-  if compile_object "" ; then
-      if has readelf; then
-          if readelf --syms $TMPO 2>/dev/null |grep -q "IFUNC.*foo"; then
-              avx2_opt="yes"
-          fi
-      fi
-  fi
+if compile_object "" ; then
+  avx2_opt="yes"
 fi
 
 #########################################
diff --git a/util/cutils.c b/util/cutils.c
index 621ca67..4d2edd6 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -162,243 +162,224 @@ int qemu_fdatasync(int fd)
 }
 
 /* vector definitions */
-#ifdef __ALTIVEC__
-#include <altivec.h>
-/* The altivec.h header says we're allowed to undef these for
- * C++ compatibility.  Here we don't care about C++, but we
- * undef them anyway to avoid namespace pollution.
- */
-#undef vector
-#undef pixel
-#undef bool
-#define VECTYPE        __vector unsigned char
-#define ALL_EQ(v1, v2) vec_all_eq(v1, v2)
-#define VEC_OR(v1, v2) ((v1) | (v2))
-/* altivec.h may redefine the bool macro as vector type.
- * Reset it to POSIX semantics. */
-#define bool _Bool
-#elif defined __SSE2__
-#include <emmintrin.h>
-#define VECTYPE        __m128i
-#define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) == 0xFFFF)
-#define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
-#elif defined(__aarch64__)
-#include "arm_neon.h"
-#define VECTYPE        uint64x2_t
-#define ALL_EQ(v1, v2) \
-        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
-         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
-#define VEC_OR(v1, v2) ((v1) | (v2))
-#else
-#define VECTYPE        unsigned long
-#define ALL_EQ(v1, v2) ((v1) == (v2))
-#define VEC_OR(v1, v2) ((v1) | (v2))
-#endif
-
-#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR 8
-
-static bool
-can_use_buffer_find_nonzero_offset_inner(const void *buf, size_t len)
-{
-    return (len % (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR
-                   * sizeof(VECTYPE)) == 0
-            && ((uintptr_t) buf) % sizeof(VECTYPE) == 0);
-}
-
-/*
- * Searches for an area with non-zero content in a buffer
- *
- * Attention! The len must be a multiple of
- * BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * sizeof(VECTYPE)
- * and addr must be a multiple of sizeof(VECTYPE) due to
- * restriction of optimizations in this function.
- *
- * can_use_buffer_find_nonzero_offset_inner() can be used to
- * check these requirements.
- *
- * The return value is the offset of the non-zero area rounded
- * down to a multiple of sizeof(VECTYPE) for the first
- * BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR chunks and down to
- * BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * sizeof(VECTYPE)
- * afterwards.
- *
- * If the buffer is all zero the return value is equal to len.
- */
 
-static size_t buffer_find_nonzero_offset_inner(const void *buf, size_t len)
+extern void link_error(void);
+
+#define ACCEL_BUFFER_ZERO(NAME, SIZE, VECTYPE, ZERO)            \
+static bool __attribute__((noinline))                           \
+NAME(const void *buf, size_t len)                               \
+{                                                               \
+    const void *end = buf + len;                                \
+    do {                                                        \
+        const VECTYPE *p = buf;                                 \
+        VECTYPE t;                                              \
+        if (SIZE == sizeof(VECTYPE) * 4) {                      \
+            t = (p[0] | p[1]) | (p[2] | p[3]);                  \
+        } else if (SIZE == sizeof(VECTYPE) * 8) {               \
+            t  = p[0] | p[1];                                   \
+            t |= p[2] | p[3];                                   \
+            t |= p[4] | p[5];                                   \
+            t |= p[6] | p[7];                                   \
+        } else {                                                \
+            link_error();                                       \
+        }                                                       \
+        if (unlikely(!ZERO(t))) {                               \
+            return false;                                       \
+        }                                                       \
+        buf += SIZE;                                            \
+    } while (buf < end);                                        \
+    return true;                                                \
+}
+
+typedef bool (*accel_zero_fn)(const void *, size_t);
+
+static bool __attribute__((noinline))
+buffer_zero_base(const void *buf, size_t len)
 {
-    const VECTYPE *p = buf;
-    const VECTYPE zero = (VECTYPE){0};
     size_t i;
 
-    assert(can_use_buffer_find_nonzero_offset_inner(buf, len));
-
-    if (!len) {
-        return 0;
+    /* Check bytes until the buffer is aligned.  */
+    for (i = 0; i < len && ((uintptr_t)buf + i) % sizeof(long); ++i) {
+        const char *p = buf + i;
+        if (*p) {
+            return false;
+        }
     }
 
-    for (i = 0; i < BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR; i++) {
-        if (!ALL_EQ(p[i], zero)) {
-            return i * sizeof(VECTYPE);
+    /* Check longs until we run out.  */
+    for (; i + sizeof(long) <= len; i += sizeof(long)) {
+        const long *p = buf + i;
+        if (*p) {
+            return false;
         }
     }
 
-    for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
-         i < len / sizeof(VECTYPE);
-         i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {
-        VECTYPE tmp0 = VEC_OR(p[i + 0], p[i + 1]);
-        VECTYPE tmp1 = VEC_OR(p[i + 2], p[i + 3]);
-        VECTYPE tmp2 = VEC_OR(p[i + 4], p[i + 5]);
-        VECTYPE tmp3 = VEC_OR(p[i + 6], p[i + 7]);
-        VECTYPE tmp01 = VEC_OR(tmp0, tmp1);
-        VECTYPE tmp23 = VEC_OR(tmp2, tmp3);
-        if (!ALL_EQ(VEC_OR(tmp01, tmp23), zero)) {
-            break;
+    /* Check the last few bytes of the tail.  */
+    for (; i < len; ++i) {
+        const char *p = buf + i;
+        if (*p) {
+            return false;
         }
     }
 
-    return i * sizeof(VECTYPE);
+    return true;
 }
 
-#if defined CONFIG_AVX2_OPT
-#pragma GCC push_options
-#pragma GCC target("avx2")
-#include <cpuid.h>
-#include <immintrin.h>
-
-#define AVX2_VECTYPE        __m256i
-#define AVX2_ALL_EQ(v1, v2) \
-    (_mm256_movemask_epi8(_mm256_cmpeq_epi8(v1, v2)) == 0xFFFFFFFF)
-#define AVX2_VEC_OR(v1, v2) (_mm256_or_si256(v1, v2))
+#define IDENT_ZERO(X)  (X)
+ACCEL_BUFFER_ZERO(buffer_zero_int, 4*sizeof(long), long, IDENT_ZERO)
 
-static bool
-can_use_buffer_find_nonzero_offset_avx2(const void *buf, size_t len)
+static bool select_accel_int(const void *buf, size_t len)
 {
-    return (len % (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR
-                   * sizeof(AVX2_VECTYPE)) == 0
-            && ((uintptr_t) buf) % sizeof(AVX2_VECTYPE) == 0);
+    uintptr_t ibuf = (uintptr_t)buf;
+    /* Note that this condition used to be the input constraint for
+       buffer_is_zero, therefore it is highly likely to be true.  */
+    if (likely(len % (4 * sizeof(long)) == 0)
+        && likely(ibuf % sizeof(long) == 0)) {
+        return buffer_zero_int(buf, len);
+    }
+    return buffer_zero_base(buf, len);
 }
 
-static size_t buffer_find_nonzero_offset_avx2(const void *buf, size_t len)
+#ifdef __ALTIVEC__
+#include <altivec.h>
+/* The altivec.h header says we're allowed to undef these for
+ * C++ compatibility.  Here we don't care about C++, but we
+ * undef them anyway to avoid namespace pollution.
+ * altivec.h may redefine the bool macro as vector type.
+ * Reset it to POSIX semantics.
+ */
+#undef vector
+#undef pixel
+#undef bool
+#define bool _Bool
+#define DO_ZERO(X)  vec_all_eq(X, (__vector unsigned char){ 0 })
+ACCEL_BUFFER_ZERO(buffer_zero_ppc, 128, __vector unsigned char, DO_ZERO)
+
+static bool select_accel_fn(const void *buf, size_t len)
 {
-    const AVX2_VECTYPE *p = buf;
-    const AVX2_VECTYPE zero = (AVX2_VECTYPE){0};
-    size_t i;
+    uintptr_t ibuf = (uintptr_t)buf;
+    if (len % 128 == 0 && ibuf % sizeof(__vector unsigned char) == 0) {
+        return buffer_zero_ppc(buf, len);
+    }
+    return select_accel_int(buf, len);
+}
 
-    assert(can_use_buffer_find_nonzero_offset_avx2(buf, len));
+#elif defined(CONFIG_AVX2_OPT)
+#include <cpuid.h>
+#include <x86intrin.h>
 
-    if (!len) {
-        return 0;
-    }
+#pragma GCC push_options
+#pragma GCC target("avx2")
+#define AVX2_ZERO(X)  _mm256_testz_si256((X), (X))
+ACCEL_BUFFER_ZERO(buffer_zero_avx2, 128, __m256i, AVX2_ZERO)
+#pragma GCC pop_options
 
-    for (i = 0; i < BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR; i++) {
-        if (!AVX2_ALL_EQ(p[i], zero)) {
-            return i * sizeof(AVX2_VECTYPE);
-        }
-    }
+#pragma GCC push_options
+#pragma GCC target("sse2")
+#define SSE2_ZERO(X) \
+    (_mm_movemask_epi8(_mm_cmpeq_epi8((X), _mm_setzero_si128())) == 0xFFFF)
+ACCEL_BUFFER_ZERO(buffer_zero_sse2, 64, __m128i, SSE2_ZERO)
+#pragma GCC pop_options
 
-    for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
-         i < len / sizeof(AVX2_VECTYPE);
-         i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {
-        AVX2_VECTYPE tmp0 = AVX2_VEC_OR(p[i + 0], p[i + 1]);
-        AVX2_VECTYPE tmp1 = AVX2_VEC_OR(p[i + 2], p[i + 3]);
-        AVX2_VECTYPE tmp2 = AVX2_VEC_OR(p[i + 4], p[i + 5]);
-        AVX2_VECTYPE tmp3 = AVX2_VEC_OR(p[i + 6], p[i + 7]);
-        AVX2_VECTYPE tmp01 = AVX2_VEC_OR(tmp0, tmp1);
-        AVX2_VECTYPE tmp23 = AVX2_VEC_OR(tmp2, tmp3);
-        if (!AVX2_ALL_EQ(AVX2_VEC_OR(tmp01, tmp23), zero)) {
-            break;
-        }
-    }
+#define CACHE_SSE2    1
+#define CACHE_SSE4    2
+#define CACHE_AVX1    4
+#define CACHE_AVX2    8
 
-    return i * sizeof(AVX2_VECTYPE);
-}
+static int cpuid_cache;
 
-static bool avx2_support(void)
+static void __attribute__((constructor)) init_cpuid_cache(void)
 {
+    int max = __get_cpuid_max(0, NULL);
     int a, b, c, d;
+    int cache = 0;
 
-    if (__get_cpuid_max(0, NULL) < 7) {
-        return false;
-    }
-
-    __cpuid_count(7, 0, a, b, c, d);
+    if (max >= 1) {
+        __cpuid(1, a, b, c, d);
+        if (d & bit_SSE2) {
+            cache |= CACHE_SSE2;
+        }
+        if (c & bit_SSE4_1) {
+            cache |= CACHE_SSE4;
+        }
 
-    return b & bit_AVX2;
+        /* We must check that AVX is not just available, but usable.  */
+        if ((c & bit_OSXSAVE) && (c & bit_AVX)) {
+            __asm("xgetbv" : "=a"(a), "=d"(d) : "c"(0));
+            if ((a & 6) == 6) {
+                cache |= CACHE_AVX1;
+                if (max >= 7) {
+                    __cpuid_count(7, 0, a, b, c, d);
+                    if (b & bit_AVX2) {
+                        cache |= CACHE_AVX2;
+                    }
+                }
+            }
+        }
+    }
+    cpuid_cache = cache;
 }
 
-static bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len) \
-         __attribute__ ((ifunc("can_use_buffer_find_nonzero_offset_ifunc")));
-static size_t buffer_find_nonzero_offset(const void *buf, size_t len) \
-         __attribute__ ((ifunc("buffer_find_nonzero_offset_ifunc")));
-
-static void *buffer_find_nonzero_offset_ifunc(void)
+static bool select_accel_fn(const void *buf, size_t len)
 {
-    typeof(buffer_find_nonzero_offset) *func = (avx2_support()) ?
-        buffer_find_nonzero_offset_avx2 : buffer_find_nonzero_offset_inner;
-
-    return func;
+    uintptr_t ibuf = (uintptr_t)buf;
+    if (len % 128 == 0 && ibuf % 32 == 0 && (cpuid_cache & CACHE_AVX2)) {
+        return buffer_zero_avx2(buf, len);
+    }
+    if (len % 64 == 0 && ibuf % 16 == 0 && (cpuid_cache & CACHE_SSE2)) {
+        return buffer_zero_sse2(buf, len);
+    }
+    return select_accel_int(buf, len);
 }
 
-static void *can_use_buffer_find_nonzero_offset_ifunc(void)
-{
-    typeof(can_use_buffer_find_nonzero_offset) *func = (avx2_support()) ?
-        can_use_buffer_find_nonzero_offset_avx2 :
-        can_use_buffer_find_nonzero_offset_inner;
+#elif defined __SSE2__
+#include <emmintrin.h>
 
-    return func;
-}
-#pragma GCC pop_options
-#else
-static bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
+#define SSE2_ZERO(X) \
+    (_mm_movemask_epi8(_mm_cmpeq_epi8((X), _mm_setzero_si128())) == 0xFFFF)
+ACCEL_BUFFER_ZERO(buffer_zero_sse2, 64, __m128i, SSE2_ZERO)
+
+static bool select_accel_fn(const void *buf, size_t len)
 {
-    return can_use_buffer_find_nonzero_offset_inner(buf, len);
+    uintptr_t ibuf = (uintptr_t)buf;
+    if (len % 64 == 0 && ibuf % sizeof(__m128i) == 0) {
+        return buffer_zero_sse2(buf, len);
+    }
+    return select_accel_int(buf, len);
 }
 
-static size_t buffer_find_nonzero_offset(const void *buf, size_t len)
+#elif defined(__aarch64__)
+#include "arm_neon.h"
+
+#define DO_ZERO(X)  (vgetq_lane_u64((X), 0) | vgetq_lane_u64((X), 1))
+ACCEL_BUFFER_ZERO(buffer_zero_neon, 128, uint64x2_t, DO_ZERO)
+
+static bool select_accel_fn(const void *buf, size_t len)
 {
-    return buffer_find_nonzero_offset_inner(buf, len);
+    uintptr_t ibuf = (uintptr_t)buf;
+    if (len % 128 == 0 && ibuf % sizeof(uint64x2_t) == 0) {
+        return buffer_zero_neon(buf, len);
+    }
+    return select_accel_int(buf, len);
 }
+
+#else
+#define select_accel_fn  select_accel_int
 #endif
 
 /*
  * Checks if a buffer is all zeroes
- *
- * Attention! The len must be a multiple of 4 * sizeof(long) due to
- * restriction of optimizations in this function.
  */
 bool buffer_is_zero(const void *buf, size_t len)
 {
-    /*
-     * Use long as the biggest available internal data type that fits into the
-     * CPU register and unroll the loop to smooth out the effect of memory
-     * latency.
-     */
-
-    size_t i;
-    long d0, d1, d2, d3;
-    const long * const data = buf;
-
-    /* use vector optimized zero check if possible */
-    if (can_use_buffer_find_nonzero_offset(buf, len)) {
-        return buffer_find_nonzero_offset(buf, len) == len;
+    if (unlikely(len == 0)) {
+        return true;
     }
 
-    assert(len % (4 * sizeof(long)) == 0);
-    len /= sizeof(long);
-
-    for (i = 0; i < len; i += 4) {
-        d0 = data[i + 0];
-        d1 = data[i + 1];
-        d2 = data[i + 2];
-        d3 = data[i + 3];
-
-        if (d0 || d1 || d2 || d3) {
-            return false;
-        }
-    }
-
-    return true;
+    /* Use an optimized zero check if possible.  Note that this also
+       includes a check for an unrolled loop over longs, as well as
+       the unsized, unaligned fallback to buffer_zero_base.  */
+    return select_accel_fn(buf, len);
 }
 
 #ifndef _WIN32
-- 
2.7.4


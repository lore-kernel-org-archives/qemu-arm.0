Received: by 10.25.21.156 with SMTP id 28csp116646lfv;
        Tue, 23 Aug 2016 21:26:53 -0700 (PDT)
X-Received: by 10.55.68.81 with SMTP id r78mr1034088qka.119.1472012813486;
        Tue, 23 Aug 2016 21:26:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 13si5072734qki.173.2016.08.23.21.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:26:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPm8-0005FG-Sx
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:26:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfK-0007P8-MY
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfI-0004nl-8V
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:49 -0400
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPf9-0004gZ-TE; Wed, 24 Aug 2016 00:19:39 -0400
Received: by mail-qk0-f195.google.com with SMTP id r128so401753qkc.1;
	Tue, 23 Aug 2016 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SGH5Wb9OvBuvQy6SuBtCAyNAiD3mmKjxYEiP2SspwGU=;
	b=a7hAZZ4TJh1LLpkykFsYOv/FnFhZOfTR2HeDWFZ0e5lsiVN5WVIUtReZiq+vCJRyY/
	zVDLiO/Qc8jMCwgccRiu+CqMfG/YMIF3Fk/hyJvey4CG9Ey9MvxT2CfuWvV/46LP/H0m
	fjkn8y+O1eoSp5CTGmSx9KYc4NhMXQIQjWMJ61cDYDmojGYYCGb+b5P/zh5mZNQoEu25
	5MIX0MbOobPBNmr+xxTa3sEFVw/NsgBJrESO8AulY4JIXkNxVP/klKsqE62f5MmsxNRq
	GCHsATAKzp8Kc7VWUuzdsGqsxifqZoWAazt493bp7KRxRpLTGl23Y/Jemy46AHp0eBao
	VOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=SGH5Wb9OvBuvQy6SuBtCAyNAiD3mmKjxYEiP2SspwGU=;
	b=YCbEf/2E50SMRu3zDTq3L4Hkh7bUYB3JWqMPoeQ1mgtr1d1By2crbRfuVUI4/IxSfs
	vPEX7aHUo3zxaVBSCl9NmcxnrnWO0bUP77wAa5yhP/w8aqDWzgrBKCL2Q7/p4tTyFTkC
	8A0Q6dheZJsxr3T3bxOqWW5HRA1x72/VMDTpfObUeeB4zFOTIOT/0THr3uKbNYZjByye
	mSrsEIF3/hI09iWipC9hEKvgEZD4yxaf3eWAJ7ullJKhw4gCfa3KucOn7GjEg1SGb6cD
	jlWm2MaPpw1oVXfcHEROpOXHTYMWHup2Geq72+kONwilsTRHFAflABbbCdkU7fvXrjQa
	1cwA==
X-Gm-Message-State: AE9vXwOjogq6SUsvVB5JIQWimqs7g5+a08KUY9gYzhhQjhbflbVosq/e+Ox6LrXfd2OipA==
X-Received: by 10.55.33.130 with SMTP id f2mr1091327qki.141.1472012319420;
	Tue, 23 Aug 2016 21:18:39 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:39 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:57 -0700
Message-Id: <1472012279-20581-6-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.195
Subject: [Qemu-arm] [PATCH 5/7] cutils: Rewrite x86 buffer zero checking
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, vijay.kilari@gmail.com,
	peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X3cr0ZoAAwzJ

Use unaligned load operations.
Add prefetches for the next loop iteration.
Add versions for avx1 and sse4.1.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 util/cutils.c | 169 +++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 145 insertions(+), 24 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index 0f1ce1d..ec4bd78 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -266,21 +266,127 @@ static bool select_accel_fn(const void *buf, size_t len)
     return select_accel_int(buf, len);
 }
 
-#elif defined(CONFIG_AVX2_OPT)
+#elif defined(CONFIG_AVX2_OPT) || defined(__SSE2__)
 #include <cpuid.h>
 #include <x86intrin.h>
 
+#ifdef CONFIG_AVX2_OPT
 #pragma GCC push_options
 #pragma GCC target("avx2")
-#define AVX2_ZERO(X)  _mm256_testz_si256((X), (X))
-ACCEL_BUFFER_ZERO(buffer_zero_avx2, 128, __m256i, AVX2_ZERO)
+
+static bool __attribute__((noinline))
+buffer_zero_avx2(const void *buf, size_t len)
+{
+    const __m256i *p = buf;
+    const __m256i *end = buf + len;
+    __m256i t;
+
+    do {
+        p += 4;
+        __builtin_prefetch(p);
+        /* Note that most AVX insns handle unaligned operands by
+           default; we only need take care for the initial load.  */
+        __asm volatile("vmovdqu -0x80(%1),%0\n\t"
+                       "vpor -0x60(%1),%0,%0\n\t"
+                       "vpor -0x40(%1),%0,%0\n\t"
+                       "vpor -0x20(%1),%0,%0"
+                       : "=x"(t) : "r"(p));
+        if (unlikely(!_mm256_testz_si256(t, t))) {
+            return false;
+        }
+    } while (p < end);
+    return true;
+}
+
+#pragma GCC pop_options
+#pragma GCC push_options
+#pragma GCC target("avx")
+
+static bool __attribute__((noinline))
+buffer_zero_avx(const void *buf, size_t len)
+{
+    const __m128i *p = buf;
+    const __m128i *end = buf + len;
+    __m128i t;
+
+    do {
+        p += 4;
+        __builtin_prefetch(p);
+        /* Note that most AVX insns handle unaligned operands by
+           default; we only need take care for the initial load.  */
+        __asm volatile("vmovdqu -0x40(%1),%0\n\t"
+                       "vpor -0x20(%1),%0,%0\n\t"
+                       "vpor -0x20(%1),%0,%0\n\t"
+                       "vpor -0x10(%1),%0,%0"
+                       : "=x"(t) : "r"(p));
+        if (unlikely(!_mm_testz_si128(t, t))) {
+            return false;
+        }
+    } while (p < end);
+    return true;
+}
+
 #pragma GCC pop_options
+#pragma GCC push_options
+#pragma GCC target("sse4")
 
+static bool __attribute__((noinline))
+buffer_zero_sse4(const void *buf, size_t len)
+{
+    const __m128i *p = buf;
+    const __m128i *end = buf + len;
+    __m128i t0, t1, t2, t3;
+
+    do {
+        p += 4;
+        __builtin_prefetch(p);
+        __asm volatile("movdqu -0x40(%4),%0\n\t"
+                       "movdqu -0x20(%4),%1\n\t"
+                       "movdqu -0x20(%4),%2\n\t"
+                       "movdqu -0x10(%4),%3\n\t"
+                       "por %1,%0\n\t"
+                       "por %3,%2\n\t"
+                       "por %2,%0"
+                       : "=x"(t0), "=x"(t1), "=x"(t2), "=x"(t3) : "r"(p));
+        if (unlikely(!_mm_testz_si128(t0, t0))) {
+            return false;
+        }
+    } while (p < end);
+    return true;
+}
+
+#pragma GCC pop_options
 #pragma GCC push_options
 #pragma GCC target("sse2")
-#define SSE2_ZERO(X) \
-    (_mm_movemask_epi8(_mm_cmpeq_epi8((X), _mm_setzero_si128())) == 0xFFFF)
-ACCEL_BUFFER_ZERO(buffer_zero_sse2, 64, __m128i, SSE2_ZERO)
+#endif /* CONFIG_AVX2_OPT */
+
+static bool __attribute__((noinline))
+buffer_zero_sse2(const void *buf, size_t len)
+{
+    const __m128i *p = buf;
+    const __m128i *end = buf + len;
+    __m128i zero = _mm_setzero_si128();
+    __m128i t0, t1, t2, t3;
+
+    do {
+        p += 4;
+        __builtin_prefetch(p);
+        __asm volatile("movdqu -0x40(%4),%0\n\t"
+                       "movdqu -0x20(%4),%1\n\t"
+                       "movdqu -0x20(%4),%2\n\t"
+                       "movdqu -0x10(%4),%3\n\t"
+                       "por %1,%0\n\t"
+                       "por %3,%2\n\t"
+                       "por %2,%0"
+                       : "=x"(t0), "=x"(t1), "=x"(t2), "=x"(t3) : "r"(p));
+        if (unlikely(_mm_movemask_epi8(_mm_cmpeq_epi8(t0, zero)) == 0xFFFF)) {
+            return false;
+        }
+    } while (p < end);
+    return true;
+}
+
+#ifdef CONFIG_AVX2_OPT
 #pragma GCC pop_options
 
 #define CACHE_SSE2    1
@@ -321,32 +427,47 @@ static void __attribute__((constructor)) init_cpuid_cache(void)
     }
     cpuid_cache = cache;
 }
+#endif /* CONFIG_AVX2_OPT */
 
 static bool select_accel_fn(const void *buf, size_t len)
 {
-    uintptr_t ibuf = (uintptr_t)buf;
-    if (len % 128 == 0 && ibuf % 32 == 0 && (cpuid_cache & CACHE_AVX2)) {
+#ifdef CONFIG_AVX2_OPT
+    int cache = cpuid_cache;
+
+    /* Force bits that the compiler tells us must be there.
+       This allows the compiler to optimize subsequent tests.  */
+#ifdef __AVX2__
+    cache |= CACHE_AVX2;
+#endif
+#ifdef __AVX__
+    cache |= CACHE_AVX1;
+#endif
+#ifdef __SSE4_1__
+    cache |= CACHE_SSE4;
+#endif
+#ifdef __SSE2__
+    cache |= CACHE_SSE2;
+#endif
+
+    if (len % 128 == 0 && (cache & CACHE_AVX2)) {
         return buffer_zero_avx2(buf, len);
     }
-    if (len % 64 == 0 && ibuf % 16 == 0 && (cpuid_cache & CACHE_SSE2)) {
-        return buffer_zero_sse2(buf, len);
+    if (len % 64 == 0) {
+        if (cache & CACHE_AVX1) {
+            return buffer_zero_avx(buf, len);
+        }
+        if (cache & CACHE_SSE4) {
+            return buffer_zero_sse4(buf, len);
+        }
+        if (cache & CACHE_SSE2) {
+            return buffer_zero_sse2(buf, len);
+        }
     }
-    return select_accel_int(buf, len);
-}
-
-#elif defined __SSE2__
-#include <emmintrin.h>
-
-#define SSE2_ZERO(X) \
-    (_mm_movemask_epi8(_mm_cmpeq_epi8((X), _mm_setzero_si128())) == 0xFFFF)
-ACCEL_BUFFER_ZERO(buffer_zero_sse2, 64, __m128i, SSE2_ZERO)
-
-static bool select_accel_fn(const void *buf, size_t len)
-{
-    uintptr_t ibuf = (uintptr_t)buf;
-    if (len % 64 == 0 && ibuf % sizeof(__m128i) == 0) {
+#else
+    if (len % 64 == 0) {
         return buffer_zero_sse2(buf, len);
     }
+#endif
     return select_accel_int(buf, len);
 }
 
-- 
2.7.4


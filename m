Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp405891ejb;
        Thu, 1 Jun 2023 05:33:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IBPQtz1kkCcVXcMdEht7MCDEmx+Pfb/bt8f2Upc069xtnGLxsmtAX/7jhDwkwa0XVqWuQ
X-Received: by 2002:a05:6870:44c5:b0:19a:5e87:fd72 with SMTP id t5-20020a05687044c500b0019a5e87fd72mr7752742oai.4.1685622820118;
        Thu, 01 Jun 2023 05:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685622820; cv=none;
        d=google.com; s=arc-20160816;
        b=yezLVM1Q+NH6sYjY3LNSgbp3fskGyk9YBt/qQl5to5ax8LJu/zDbYJ/Krk3PON8RDk
         D2Q4rV0I7Og0ydNLxZbJRZ8mlISzZQeQ+kwQnyCHcgJkdi1JiF7lhQmWlhgmW8+FS2Lv
         Q2eF94oPCkN6le5+ODLpzvZ3oVowiBIQ2jax0wQTPcMutecLSfkKdOxElvRWJZVl4/60
         OGBN9YKReTJ75JaDUYYKrFfPdm70MJ3CS8bxVQoP9017fkoZWKHQOm9kVK5+KJmPOhYY
         fAUsG4uDTWk07gtptDQpB/ffBecPZQPdMsR3oWT1kcJ92rNKsvgZ69Mo9iRMVvTapKH/
         gugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gs3lJZ5X0nS1wEoi46SJBIt6fEJ+mVI5qkhB2nHvBOI=;
        b=GiW52k9Mjx5HhaIncchKuGrm3pdrh0pZ0w0u09WBoNr34ukf8IBRaXqKBXeYzo1EDc
         3K4OU2/fmWxt5wCiQjfskbeDqFfdQSrMqMKr8cbQ/WMuHtdJJAh9TnA6e5gOtq/tj2On
         i0obMhvJIwn6ek27tYwJjReQJ9Bd17kivT4LqfItGUu+AQa+0bszkAAMgsZlEpv6vGuC
         Fxt18bXJFAGk69qik8VLwH5pEZZYTLY+hjTseZwtZDgveM+Z8VOMiSFR5yLfX+C8W42Q
         ENvl6E1Q/uujgcQFQhHK/zhufe7Fv6M8kel7HBRPTepsu0nk4HpwQVtHwhaC8SjSXUJ3
         UfTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LdBq8ScU;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 189-20020a4a1ec6000000b005586008ccf1si992024ooq.71.2023.06.01.05.33.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Jun 2023 05:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LdBq8ScU;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C445F608D5;
	Thu,  1 Jun 2023 12:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3353C4339C;
	Thu,  1 Jun 2023 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685622819;
	bh=ybhCCaRaMtEWM/hqlDKZlEwr5UC1ZUvXv1DqWaYk9MA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LdBq8ScUOELwb9t043Oo96oEIYYaBTlNLZzhG4nhfAVcb52kUYZIjTynJSAd9o46r
	 6HzLJI6SwsVNM7VxuQZZNWz6JMyARKEObO5CaDx5iUcoiBkOo7E9fp9NuuhvigtC0t
	 ecdDvBCx0HGuvqwcgkXbotefMAXbpj0iQrXZfe+pXOW3uRhxQONBbClWxnLMZBrvwF
	 7+WQLEGPy4L9LuTHEtLoArrb+fcxHvrh4Q7WBMllFQ1OasO7IBa4gV4g+OwJ1pcr+z
	 YhHz4hyxbOxhA73ZK6QvMuwdS3Mmmpez9Fy6Xqb/l7uOLFfQZZ+CLb4a+0TplRDXcl
	 hm0cbzHVqlgxA==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/2] target/arm: Use x86 intrinsics to implement PMULL.P64
Date: Thu,  1 Jun 2023 14:33:31 +0200
Message-Id: <20230601123332.3297404-2-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601123332.3297404-1-ardb@kernel.org>
References: <20230601123332.3297404-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850; i=ardb@kernel.org; h=from:subject; bh=ybhCCaRaMtEWM/hqlDKZlEwr5UC1ZUvXv1DqWaYk9MA=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIaViglixxrJ5/yNtmaMur5FTufNlysLajHyX/+emhLWl6 ig9s3/aUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZSEcrIsHex0Z1na8PK9BYe VgkSTCljm3zOdU/V3KMzHQPs/vCuWsPwVz43oJbD7KbbT4PySzs3nt8qfMdk/cp3zru+TLr8W+z rVnYA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-TUID: wC/yXP3p3Qw3

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 host/include/i386/host/cpuinfo.h |  1 +
 target/arm/tcg/vec_helper.c      | 26 +++++++++++++++++++-
 util/cpuinfo-i386.c              |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/host/include/i386/host/cpuinfo.h b/host/include/i386/host/cpuinfo.h
index 073d0a426f31487d..cf4ced844760d28f 100644
--- a/host/include/i386/host/cpuinfo.h
+++ b/host/include/i386/host/cpuinfo.h
@@ -27,6 +27,7 @@
 #define CPUINFO_ATOMIC_VMOVDQA  (1u << 16)
 #define CPUINFO_ATOMIC_VMOVDQU  (1u << 17)
 #define CPUINFO_AES             (1u << 18)
+#define CPUINFO_PMULL           (1u << 19)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index f59d3b26eacf08f8..fb422627588439b3 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -25,6 +25,14 @@
 #include "qemu/int128.h"
 #include "vec_internal.h"
 
+#ifdef __x86_64__
+#include "host/cpuinfo.h"
+#include <wmmintrin.h>
+#define TARGET_PMULL  __attribute__((__target__("pclmul")))
+#else
+#define TARGET_PMULL
+#endif
+
 /*
  * Data for expanding active predicate bits to bytes, for byte elements.
  *
@@ -2010,12 +2018,28 @@ void HELPER(gvec_pmul_b)(void *vd, void *vn, void *vm, uint32_t desc)
  * Because of the lanes are not accessed in strict columns,
  * this probably cannot be turned into a generic helper.
  */
-void HELPER(gvec_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
+void TARGET_PMULL HELPER(gvec_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, j, opr_sz = simd_oprsz(desc);
     intptr_t hi = simd_data(desc);
     uint64_t *d = vd, *n = vn, *m = vm;
 
+#ifdef __x86_64__
+    if (cpuinfo & CPUINFO_PMULL) {
+	switch (hi) {
+	case 0:
+		*(__m128i *)vd = _mm_clmulepi64_si128(*(__m128i *)vm, *(__m128i *)vn, 0x0);
+		break;
+	case 1:
+		*(__m128i *)vd = _mm_clmulepi64_si128(*(__m128i *)vm, *(__m128i *)vn, 0x11);
+		break;
+	default:
+		g_assert_not_reached();
+	}
+        return;
+    }
+#endif
+
     for (i = 0; i < opr_sz / 8; i += 2) {
         uint64_t nn = n[i + hi];
         uint64_t mm = m[i + hi];
diff --git a/util/cpuinfo-i386.c b/util/cpuinfo-i386.c
index 3043f066c0182dc8..8930e13451201a64 100644
--- a/util/cpuinfo-i386.c
+++ b/util/cpuinfo-i386.c
@@ -40,6 +40,7 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
         info |= (c & bit_MOVBE ? CPUINFO_MOVBE : 0);
         info |= (c & bit_POPCNT ? CPUINFO_POPCNT : 0);
         info |= (c & bit_AES ? CPUINFO_AES : 0);
+        info |= (c & bit_PCLMULQDQ ? CPUINFO_PMULL : 0);
 
         /* For AVX features, we must check available and usable. */
         if ((c & bit_AVX) && (c & bit_OSXSAVE)) {
-- 
2.39.2

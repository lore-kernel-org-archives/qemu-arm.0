Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8D0CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZ0-0001Lq-5w; Wed, 20 May 2026 13:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYu-0001Je-Ck
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:28 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYq-0001sL-De
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:26 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-36900945df5so2569809a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297503; x=1779902303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/kDXd23+ycS383PGeIrgHSsrr0fsby8WIj0IEq0o18=;
 b=guMiDFAhSnBL1Vc+fN+1Xd0BXDtknzQRzxOxoMl/H4Yp6Bd76RcfRvbZl/dlGsgWUY
 gi75IQQjwekxsI2Zp2LWqWFh5PN6iBcSlZnRiLmfzsuc85iQJUThTp6yUeW41L9EloYD
 8ZdrVH+oSSkAngAFiCGs9ZVB1B8MRQSDsdn6lBcg7DVg9fX+okltSJrb92DDLHGRIzvz
 BBkEhgucw0fHwub1tVlqbf5rPmGzG9l91qsYoMYVAr3B9eKVtOvHRDMrdqs1Kk0O+ujz
 xRyN9o9f6r9DzSYmfFNy3y5Lg4BVOUXGQSAJucg516PwfS55In0HYszpqd1LsGKbTLdG
 oM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297503; x=1779902303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u/kDXd23+ycS383PGeIrgHSsrr0fsby8WIj0IEq0o18=;
 b=l6ZcqyLo59CpNcF6EQgKSTz+tOySYQu1gnZCAnzVbB6IBoNI2kbIB8V3uDBH3nOmIz
 3LKlMoj1GCx6S1Vn21lRVaN6egeTksOlkgd7vjcM2HieCW5rdfqCqXHaE/+OkAkPEj71
 AWc9ATj/7GIYSJUJ8i6kaIkFoaOSF8konhrFeo8B+AD8Al1Mo3iN2FegrigbYn8JwQLl
 eI1ymmgDiDpL9p0/SBahDhALsKNAzwZ9eI8zaLOPD/vNjFWVeCV+FChgm1k28/b2G2qp
 C9EjE2cvDeaf04Sd86++rdigrfMbleiFZhTbiPQRlAMypCnc4zJ/NEH5lZjNESAYXuGW
 EcQw==
X-Gm-Message-State: AOJu0YwDmgUW/XxUCfG9eKbo1VfhSSrh8Dr1oo4aBC7bCvQ6c78JEk6b
 sHGoS/cDgVFsyhb52rwALqDSV7txoMqE0YawSPOLlMQ7Alrbf53GnDo/FdQZQkqMM0Y=
X-Gm-Gg: Acq92OHHgARWwhUuFn+9j0qnSx5H48zEDw/YhFDPyiyu7qrs2POGYWQ37uQE1zpEcqm
 /298JNW4K9Zdx5tTjQbSUKh5n6Kbqh4Bc9xXFoj8hIAeuJg+NEwm0EFLVtEgxSHfIkMGC/sM5cd
 ZPkmrWEBXdMh2YhczwJsuHT5rgfP4UMh5bh+GVqGPXSkvnOQ47ZAPeGLcnI8g7D7FWPOS/nOo+H
 T+vBPwEeUVebTz/YWqRysOo3taB8qQoHgC/Wn1tdo5nsKTPw4B6ONmB2DpfXqbXlcWoqEZYgc3w
 9xWgXPivN27bldYv1bRIF7RAvyCkISQp755kiDF8PyCjSBvGnYn2NMGFrtinpKdCg+HV7Iswjgz
 fZkQxdF8jVd9xfRajzvu2iCiBHBUdED6R5NfIpee+HkZm+O+T1DUxpjVZ9llsZr6vuKOeRpAOqV
 c1Wx2LH7ckCGtVbRp65C8DsnXlZ5/5
X-Received: by 2002:a17:90b:5848:b0:35f:b714:e516 with SMTP id
 98e67ed59e1d1-36951a66993mr24337396a91.16.1779297502661; 
 Wed, 20 May 2026 10:18:22 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 01/30] fpu: Return struct from parts{64,128}_scalbn
Date: Wed, 20 May 2026 10:17:51 -0700
Message-ID: <20260520171820.848839-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

At the same time, export.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-parts.h |  3 +++
 fpu/softfloat.c               | 18 +++++++++---------
 fpu/softfloat-parts.c.inc     | 14 ++++++++------
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/include/fpu/softfloat-parts.h b/include/fpu/softfloat-parts.h
index 9504d0daa0..46618d217e 100644
--- a/include/fpu/softfloat-parts.h
+++ b/include/fpu/softfloat-parts.h
@@ -214,4 +214,7 @@ FloatParts128 parts128_round_to_int(const FloatParts128 *a,
 FloatParts64 parts64_round_to_fmt(const FloatParts64 *p, float_status *s,
                                   const FloatFmt *fmt);
 
+FloatParts64 parts64_scalbn(const FloatParts64 *a, int n, float_status *s);
+FloatParts128 parts128_scalbn(const FloatParts128 *a, int n, float_status *s);
+
 #endif
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 90ebd83f69..7fc6df461e 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1910,7 +1910,7 @@ float16 float16_muladd_scalbn(float16 a, float16 b, float16 c,
 
     /* Before rounding, scale. */
     if (scale) {
-        parts64_scalbn(pr, scale, status);
+        *pr = parts64_scalbn(pr, scale, status);
     }
     parts64_uncanon(pr, status, &float16_params, false);
     /* After rounding, apply negate result, especially for -0.0. */
@@ -1937,7 +1937,7 @@ float32_muladd_scalbn(float32 a, float32 b, float32 c,
 
     /* Before rounding, scale. */
     if (scale) {
-        parts64_scalbn(pr, scale, status);
+        *pr = parts64_scalbn(pr, scale, status);
     }
     parts64_uncanon(pr, status, &float32_params, false);
     /* After rounding, apply negate result, especially for -0.0. */
@@ -1958,7 +1958,7 @@ float64_muladd_scalbn(float64 a, float64 b, float64 c,
 
     /* Before rounding, scale. */
     if (scale) {
-        parts64_scalbn(pr, scale, status);
+        *pr = parts64_scalbn(pr, scale, status);
     }
     parts64_uncanon(pr, status, &float64_params, false);
     /* After rounding, apply negate result, especially for -0.0. */
@@ -4312,7 +4312,7 @@ float16 float16_scalbn(float16 a, int n, float_status *status)
 {
     FloatParts64 p = float16_unpack_canonical(a, status);
 
-    parts64_scalbn(&p, n, status);
+    p = parts64_scalbn(&p, n, status);
     return float16_round_pack_canonical(&p, status);
 }
 
@@ -4320,7 +4320,7 @@ float32 float32_scalbn(float32 a, int n, float_status *status)
 {
     FloatParts64 p = float32_unpack_canonical(a, status);
 
-    parts64_scalbn(&p, n, status);
+    p = parts64_scalbn(&p, n, status);
     return float32_round_pack_canonical(&p, status);
 }
 
@@ -4328,7 +4328,7 @@ float64 float64_scalbn(float64 a, int n, float_status *status)
 {
     FloatParts64 p = float64_unpack_canonical(a, status);
 
-    parts64_scalbn(&p, n, status);
+    p = parts64_scalbn(&p, n, status);
     return float64_round_pack_canonical(&p, status);
 }
 
@@ -4336,7 +4336,7 @@ bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
 {
     FloatParts64 p = bfloat16_unpack_canonical(a, status);
 
-    parts64_scalbn(&p, n, status);
+    p = parts64_scalbn(&p, n, status);
     return bfloat16_round_pack_canonical(&p, status);
 }
 
@@ -4344,7 +4344,7 @@ float128 float128_scalbn(float128 a, int n, float_status *status)
 {
     FloatParts128 p = float128_unpack_canonical(a, status);
 
-    parts128_scalbn(&p, n, status);
+    p = parts128_scalbn(&p, n, status);
     return float128_round_pack_canonical(&p, status);
 }
 
@@ -4355,7 +4355,7 @@ floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
     if (!floatx80_unpack_canonical(&p, a, status)) {
         return floatx80_default_nan(status);
     }
-    parts128_scalbn(&p, n, status);
+    p = parts128_scalbn(&p, n, status);
     return floatx80_round_pack_canonical(&p, status);
 }
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 2114797aca..3a9c2748cd 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1633,22 +1633,24 @@ FloatRelation partsN(compare)(const FloatPartsN *a, const FloatPartsN *b,
 /*
  * Multiply A by 2 raised to the power N.
  */
-static void partsN(scalbn)(FloatPartsN *a, int n, float_status *s)
+FloatPartsN partsN(scalbn)(const FloatPartsN *a, int n, float_status *s)
 {
     switch (a->cls) {
     case float_class_snan:
     case float_class_qnan:
-        *a = partsN(return_nan)(a, s);
-        break;
+        return partsN(return_nan)(a, s);
     case float_class_zero:
     case float_class_inf:
-        break;
+        return *a;
     case float_class_denormal:
         float_raise(float_flag_input_denormal_used, s);
         /* fall through */
     case float_class_normal:
-        a->exp += MIN(MAX(n, -0x10000), 0x10000);
-        break;
+        {
+            FloatPartsN r = *a;
+            r.exp += MIN(MAX(n, -0x10000), 0x10000);
+            return r;
+        }
     default:
         g_assert_not_reached();
     }
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AD3FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:42:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjd-0007r3-TQ; Sun, 26 Apr 2026 09:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjc-0007j4-PZ
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:20 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzja-0000Bb-U9
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:20 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2b7d3ecc10dso14931805ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210878; x=1777815678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APzXi2KVCIYa0t0D3NstU7yyhE+V3SOxwz+wKn9uFgg=;
 b=yRFT9c5hTRLMu1GZtS/EIq7KnJchsAeNjx/tih3EJA4UNCqi9VwF6AKk2xYcfa3ofD
 6N4bqNdTTmgwVFStB16I1IuYVoermpcHWmxCR53D373EoyEBGSYxPQazhDu2yf6hhvSO
 mU5IdjL9pHN/D/cjStV5Ry+nG6TNRj+wgl+dvlc6/GFC4tSadTqzqx5YnZsB8y9b6eIl
 CNnOvqvL7+oTE7sMNfQdA5gvglter6uC2/l3o/cVV06RU/iji3YPly+wqMR2BM/u/DoK
 MiY/f0wF9etYIa/oxVUOOHQAkjqFDEP3wjN/k+da/XxKdhx/1itwuk7xu3sPNALVdBQc
 DRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210878; x=1777815678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=APzXi2KVCIYa0t0D3NstU7yyhE+V3SOxwz+wKn9uFgg=;
 b=SQJ4O1saoHpvqPjuULgUxoB/hFywgjwOYOTTboAPF3wMoyuuUyr9Dum5bBZ0fhGvE0
 JXQUOinD9n7fX9Kttx6WkeqGTQw/mdxwu7M+PfpZKjwpNz8WmidHPYAjZl0gEJwpoIwY
 SX3kkzwh7/metCUomvm+upCQJg8EKb8ZXnsd5fKrwkgYCE6pF0jI6RlQCVPGVr3/HvLA
 rvhqrTW+zoZX9frVxJsSpRbGynXEAHbLYuPl1GtwebVaQfYiZNsZyrcIRRa+To+20Lm2
 T0fgFaS1LkDCkH4Zhqr59nlyvluYPA1k3b8pQgpaDPaBrU9uoBWVOvDnAVNDIvJ8F9yc
 0Bwg==
X-Gm-Message-State: AOJu0Yyw2oVCKqrBzoKLcv3Oa2cioXqHLEdRwH21MwL0ycko+cmpn5tv
 /zl8/EB7RwWxZuJ7fLU0CLlnO20awZtoloH3dxPcmY+nVMdxd+fFQOPtslNu560ZhGE=
X-Gm-Gg: AeBDieupJbNGrcSy4xL/9+OP6fn0zzWaEzfCo3tBWhdCmGtBzEyCHPm2fql9vcXR4Xu
 ew6/oWbqFgyzKDW0h/obkwBSV6vxZMErzSrgBEXLRaHRVSoNCotE1QmDes66t+WiHqN7VlnWDRa
 LHMpIa4SRH7t9IRCrJKJASGSh3sBqSLimmLRTIIjUsr9Td5Clj7TYlXRenOriBrKdUU9LFL9PAd
 vc0HyVpQhoXO5XG+Zu4Y39aUI5y8z/p5odi/sgIg670i+gwUmZZKlxVbAt2mhNLnEIMAm5fgQu3
 S94dHNCwNvlhVcZM8ZgN5XlJpkeBJ323uFqJuHIKUiGLzllbwNKwnmeRKvgvMAas2+wEAEcgKbk
 +MoBQJyc0JnnRkRSz+LBiX1hrLiWHvMHawVMPEzrOxjqOSQJgvW9r47OA3+wsmvvVfmaCP0Hipr
 EtiTOQpJNnDlE3p7Ka3+EaM9n4VYQcLMjOk209IJhh
X-Received: by 2002:a17:903:2283:b0:2b0:54dc:63e with SMTP id
 d9443c01a7336-2b5f9fadcd4mr427273585ad.33.1777210874209; 
 Sun, 26 Apr 2026 06:41:14 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 25/84] fpu: Drop parts_compare
Date: Sun, 26 Apr 2026 23:39:02 +1000
Message-ID: <20260426134002.865628-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Use parts{64,128}_compare at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 158d539376..3aebe4a058 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,14 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static FloatRelation parts64_compare(FloatParts64 *a, FloatParts64 *b,
-                                     float_status *s, bool q);
-static FloatRelation parts128_compare(FloatParts128 *a, FloatParts128 *b,
-                                      float_status *s, bool q);
-
-#define parts_compare(A, B, S, Q) \
-    PARTS_GENERIC_64_128(compare, A)(A, B, S, Q)
-
 static void parts64_scalbn(FloatParts64 *a, int n, float_status *s);
 static void parts128_scalbn(FloatParts128 *a, int n, float_status *s);
 
@@ -4494,7 +4486,7 @@ float16_do_compare(float16 a, float16 b, float_status *s, bool is_quiet)
 
     float16_unpack_canonical(&pa, a, s);
     float16_unpack_canonical(&pb, b, s);
-    return parts_compare(&pa, &pb, s, is_quiet);
+    return parts64_compare(&pa, &pb, s, is_quiet);
 }
 
 FloatRelation float16_compare(float16 a, float16 b, float_status *s)
@@ -4514,7 +4506,7 @@ float32_do_compare(float32 a, float32 b, float_status *s, bool is_quiet)
 
     float32_unpack_canonical(&pa, a, s);
     float32_unpack_canonical(&pb, b, s);
-    return parts_compare(&pa, &pb, s, is_quiet);
+    return parts64_compare(&pa, &pb, s, is_quiet);
 }
 
 static FloatRelation QEMU_FLATTEN
@@ -4568,7 +4560,7 @@ float64_do_compare(float64 a, float64 b, float_status *s, bool is_quiet)
 
     float64_unpack_canonical(&pa, a, s);
     float64_unpack_canonical(&pb, b, s);
-    return parts_compare(&pa, &pb, s, is_quiet);
+    return parts64_compare(&pa, &pb, s, is_quiet);
 }
 
 static FloatRelation QEMU_FLATTEN
@@ -4622,7 +4614,7 @@ bfloat16_do_compare(bfloat16 a, bfloat16 b, float_status *s, bool is_quiet)
 
     bfloat16_unpack_canonical(&pa, a, s);
     bfloat16_unpack_canonical(&pb, b, s);
-    return parts_compare(&pa, &pb, s, is_quiet);
+    return parts64_compare(&pa, &pb, s, is_quiet);
 }
 
 FloatRelation bfloat16_compare(bfloat16 a, bfloat16 b, float_status *s)
@@ -4642,7 +4634,7 @@ float128_do_compare(float128 a, float128 b, float_status *s, bool is_quiet)
 
     float128_unpack_canonical(&pa, a, s);
     float128_unpack_canonical(&pb, b, s);
-    return parts_compare(&pa, &pb, s, is_quiet);
+    return parts128_compare(&pa, &pb, s, is_quiet);
 }
 
 FloatRelation float128_compare(float128 a, float128 b, float_status *s)
@@ -4664,7 +4656,7 @@ floatx80_do_compare(floatx80 a, floatx80 b, float_status *s, bool is_quiet)
         !floatx80_unpack_canonical(&pb, b, s)) {
         return float_relation_unordered;
     }
-    return parts_compare(&pa, &pb, s, is_quiet);
+    return parts128_compare(&pa, &pb, s, is_quiet);
 }
 
 FloatRelation floatx80_compare(floatx80 a, floatx80 b, float_status *s)
@@ -5518,7 +5510,7 @@ static void parts_s390_divide_to_integer(FloatParts64 *a, FloatParts64 *b,
                         saved_r_precise_sign = r_precise->sign;
                         r->sign = false;
                         r_precise->sign = false;
-                        if (parts_compare(r, r_precise, status, true) <
+                        if (parts64_compare(r, r_precise, status, true) <
                             float_relation_equal) {
                             *dxc = 0x8;
                         } else {
-- 
2.43.0



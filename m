Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5E7FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:55:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzoP-00061O-9K; Sun, 26 Apr 2026 09:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznc-0005dZ-Bb
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:38 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznZ-0001Lb-4r
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:26 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-35d971fb6f1so7491452a91.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211122; x=1777815922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91KpAxRphFoJ92UJqSPx0ipa0G5SKbiIfR6fXaE6u/Y=;
 b=t4f42DSkNZcGiiM1MDYPGmcbluvwIF77RFm815rRrSqiBbexCYu9gP8B3n+6ctAmqq
 NtPCY5/eDaBvhYfMla6i2L/q4NKQfgPQw37F7DkLmjZoVutOJ1sAXY6908DUdOMi77RJ
 +vt7qxb7jbDfqlee26PPclS4tq1HFdX/jf4vCCs3pycMdhK4Zj3yEtrTnA9rvaR+faZB
 qnmLGzUif/80R9jfjfM8+RxM9ieUaCXV5U/+ofgbWlIgRK9BxmWCUTZ122YaxZlGzJG/
 TiqCURkO6Y8x+kGxJKhZo7X2HArIRhi/m3VIn1dR8FCkGYFDBF/DiZ0oq9sBEYbev6/A
 e8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211122; x=1777815922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=91KpAxRphFoJ92UJqSPx0ipa0G5SKbiIfR6fXaE6u/Y=;
 b=q6qlm1941iuSyU3euh3hwkNZ+aB1GUE5/Kf8qCyclnuISwW3NyOZ1mUcYDdbuL8P9Q
 q/Q+4jY3v7OMGlnDQWkzhTSvECx/+HcNGHJk0gCKSP+rrmQ4TBkCSyQBuOz6rNvMgIAs
 WtOsU1oo/myHVjbOM8x4UYwYaPOs2zmOecvfz63qQLNSxLgJyZ4o+ReOUdo+nkBihf/w
 X2OnhXMQyxY93+aZylpnqBG+fe31chr45aSvpZw5/7ZSK06V0l0iFeizKOfkrfM6nRTt
 l7dmSs/QciVMXnD2cLAUV36bKFashNYw1D/76TIiZQDAFRUkyHDz2ksh3QxebsPwyrhE
 9rpg==
X-Gm-Message-State: AOJu0Yw5SH0PtFwXA8dKuW9WdreIA0p6i9yG4fV5moWXpcRbgcFL9KdF
 mpOz+TnS7RAp6mn+v1AguVxtkcTrw7yi2JREYepmQcsu10FC4IbpFqAjtcs7yWAtNrk=
X-Gm-Gg: AeBDiesghpZQTGpJv4N6qNhaw8dm9ZwI3sFO+oMdGS3Wzylx5BsLt8hT5Gx3X2q01ff
 ImRlcCAiK8/FEZWmBxraZ6KGMKIGgyRkisz4esFhUvEnTx5aFjhRi/XwI4R6tyvcWT91HAshvli
 D6IIrBxHXpfyBt0aTWBatNOy2wIKMIm+IXWDDac8yPlJn9PkFva2Oz0IHayGEHgNxqWs5WPL7sR
 yvrHveD3J8UN5TGc72DyQ4MFQ8mmSe4ttEI0g1ddepm100CyVF5yALCybfcO4XCwAN2E5PU+0WV
 bnWE0pVoY5h/WIXiDQcSfObX9op1Abwc0siykNEph4ax9yagRmkWknEkObD68IuGCQM+6LtCzxr
 qbZ4IwCaPMms/+68IDelER6dtWY9djBfG+uZ8ex/ycWBGIfeEWbs4cjJ/z1KG+xcE+3eIqG+zuc
 hwFfhf5gUbCZl300mjvhroFCjxjQ9K0kpdx50WT6KF
X-Received: by 2002:a17:90b:3e8b:b0:364:6558:99bd with SMTP id
 98e67ed59e1d1-36465589ae7mr3859850a91.23.1777211120546; 
 Sun, 26 Apr 2026 06:45:20 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 48/84] fpu: Change parts_float_to_float_widen to
 parts64_to_parts128
Date: Sun, 26 Apr 2026 23:39:25 +1000
Message-ID: <20260426134002.865628-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Rename and return FloatParts128 structure.
Use switch instead of 2 ifs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 99f0036d0d..5d58caf5ea 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2590,20 +2590,27 @@ static FloatParts64 parts128_to_parts64(FloatParts128 *b, float_status *s)
     return r;
 }
 
-static void parts_float_to_float_widen(FloatParts128 *a, FloatParts64 *b,
-                                       float_status *s)
+static FloatParts128 parts64_to_parts128(FloatParts64 *b, float_status *s)
 {
-    a->cls = b->cls;
-    a->sign = b->sign;
-    a->exp = b->exp;
-    frac64_widen(a, b);
+    FloatParts128 r = {
+        .cls = b->cls,
+        .sign = b->sign,
+        .exp = b->exp,
+        .frac_hi = b->frac,
+    };
 
-    if (is_nan(a->cls)) {
-        parts128_return_nan(a, s);
-    }
-    if (a->cls == float_class_denormal) {
+    switch (r.cls) {
+    case float_class_qnan:
+    case float_class_snan:
+        parts128_return_nan(&r, s);
+        break;
+    case float_class_denormal:
         float_raise(float_flag_input_denormal_used, s);
+        break;
+    default:
+        break;
     }
+    return r;
 }
 
 float8_e4m3 float4_e2m1_to_float8_e4m3(float4_e2m1 a, float_status *s)
@@ -2791,18 +2798,16 @@ float64 float128_to_float64(float128 a, float_status *s)
 float128 float32_to_float128(float32 a, float_status *s)
 {
     FloatParts64 p64 = float32_unpack_canonical(a, s);
-    FloatParts128 p128;
+    FloatParts128 p128 = parts64_to_parts128(&p64, s);
 
-    parts_float_to_float_widen(&p128, &p64, s);
     return float128_round_pack_canonical(&p128, s);
 }
 
 float128 float64_to_float128(float64 a, float_status *s)
 {
     FloatParts64 p64 = float64_unpack_canonical(a, s);
-    FloatParts128 p128;
+    FloatParts128 p128 = parts64_to_parts128(&p64, s);
 
-    parts_float_to_float_widen(&p128, &p64, s);
     return float128_round_pack_canonical(&p128, s);
 }
 
@@ -2847,18 +2852,16 @@ float128 floatx80_to_float128(floatx80 a, float_status *s)
 floatx80 float32_to_floatx80(float32 a, float_status *s)
 {
     FloatParts64 p64 = float32_unpack_canonical(a, s);
-    FloatParts128 p128;
+    FloatParts128 p128 = parts64_to_parts128(&p64, s);
 
-    parts_float_to_float_widen(&p128, &p64, s);
     return floatx80_round_pack_canonical(&p128, s);
 }
 
 floatx80 float64_to_floatx80(float64 a, float_status *s)
 {
     FloatParts64 p64 = float64_unpack_canonical(a, s);
-    FloatParts128 p128;
+    FloatParts128 p128 = parts64_to_parts128(&p64, s);
 
-    parts_float_to_float_widen(&p128, &p64, s);
     return floatx80_round_pack_canonical(&p128, s);
 }
 
-- 
2.43.0



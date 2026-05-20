Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC63CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZ7-0001Sh-LG; Wed, 20 May 2026 13:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ1-0001NK-Fh
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYy-0001vY-6P
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-369576666d5so2406970a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297511; x=1779902311; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yj7ZvwjIiBB1Rcal6z5w1HZi23h74lNdQA/PCnqvLXY=;
 b=mptimgAnBts2Zqwb60T6Q5Sr2vtVne0soxTg6d/93kG/f6gepsn888mClF0ljfbQeW
 BXDICgeaMnp6xT770cpjJ/qmsdNXJ5TWn8c03G/YFfaFxz8brqFKkzFuqHZDjIVufX/3
 0oIt/yLk5d0MgvNM+xEBgB0nJhARv/Bf7uD+tpsQEdHManoBDA1tG+tXKSDOPxkPTHIA
 0+i4i6CcMb3+uGtKy1wR8YOGFVZiyqwCU7YJK2UMLQesma+RFKGkRefHMATnYcX0NU/B
 mRspKOo9F+96h7oRIsvDn4gpGluX6OHOiZDMBF5HkoLtVQ0fLsYTLLgg3YzOV2axsDm3
 uDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297511; x=1779902311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yj7ZvwjIiBB1Rcal6z5w1HZi23h74lNdQA/PCnqvLXY=;
 b=munPTU7TQoIahX2uuj/xpbjwCA/CiHwkagXqsCetp8sXUcAn6IHwTtZ/2Dm/D5Z9fJ
 bQrMw+xCFCmuFWcEM+XI7UzoVPxeKVZv+zicjrEQo0myz7nfvK5PQCRwbRRRJNua6qlX
 DBkDQyf+1PvvXnqZBg5Ye65QPg8q2kswcIES++Go9GYCYsH5vBsBpX8vQ/OQlF+Ywn9y
 gl0xhGrp71mZQNMctTI3SakK59idz28AUY8x6sAq1MxFEvk4gUZtey5nIf9aL7zj//W4
 skKFDDOaMo0+is/r8hdtfmMVgx+DDRHE5GyYpJq7XO4E4KOI+0V5cLbLt2p7hJgwZQo8
 UquQ==
X-Gm-Message-State: AOJu0YwrxBsNdxRSeXeAeuNn+fUwYUaj4E3msqo9TlyewhxdBZ91xt0s
 wpHp95Z7SrbSMr6iPSQIyjCgRK0064n1TWiEGMgwEiqHAb5qD29pe/LVmt8kqZMCpps=
X-Gm-Gg: Acq92OGT7/1KSHuh3R39SR1+s8dqwigp5pabEPSD5DaNmBk5OGyoFnU5OpiMwncgSed
 DRfskIlGlA6jnOAw1LD2v6atzdSqv5npa7Fr3Wrchni9+BO64tkfRzkujgpo/DQxmOCISQHhjBm
 wYZdDd1d0HVttZYQiVwEQLyNUqm5KmgR7dAvSzkX+IXXvxoUz/niVCeDzvFyxqPaAQY9KP9OWEz
 DrlqGez05q5Q9ALnui+n7yEboOM8HuNQmvHJENbG+36+KnfjhUeL4Z5c7JyZURuy15aB/zBClK8
 UcM/pFhXMRGFgiLJsFYECGKTO+Pi8kJ6lgRgkoq+ozAUn61nyuez5A8HM+CKnGZ7qjbiQrxbi4F
 ST5qAM3uqMg+0FIHri3gzxHoZ6JOBa3GtRxNoy8y2oaPjLg0R0S9GL2nTEqdN1UOMnvDjbGYxVd
 foDGQks9+l6nfkXl9acRJFXX3OHyv4
X-Received: by 2002:a17:90b:38d2:b0:35b:9894:f6f9 with SMTP id
 98e67ed59e1d1-36951b82f83mr24025483a91.18.1779297510481; 
 Wed, 20 May 2026 10:18:30 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 12/30] fpu: Introduce frac_msb_is_snan
Date: Wed, 20 May 2026 10:18:02 -0700
Message-ID: <20260520171820.848839-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Unify handling of the two snan parameters, letting the
caller simply extract the msb.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 45 ++++++++++------------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 485f082cf8..e2e3ec0e81 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -104,16 +104,21 @@ static inline bool snan_bit_is_one(float_status *status)
 | if the fraction represents a signalling NaN; otherwise false.
 *----------------------------------------------------------------------------*/
 
-static bool parts_is_snan_frac(uint64_t frac, float_status *status)
+static bool frac_msb_is_snan(bool msb, float_status *status)
 {
     if (no_signaling_nans(status)) {
         return false;
     } else {
-        bool msb = extract64(frac, DECOMPOSED_BINARY_POINT - 1, 1);
         return msb == snan_bit_is_one(status);
     }
 }
 
+static bool parts_is_snan_frac(uint64_t frac, float_status *status)
+{
+    bool msb = extract64(frac, DECOMPOSED_BINARY_POINT - 1, 1);
+    return frac_msb_is_snan(msb, status);
+}
+
 /*----------------------------------------------------------------------------
 | The pattern for a default generated deconstructed floating-point NaN.
 *----------------------------------------------------------------------------*/
@@ -238,11 +243,7 @@ floatx80 floatx80_default_inf(bool zSign, float_status *status)
 
 static bool float16_nan_is_snan(float16 a, float_status *status)
 {
-    if (no_signaling_nans(status)) {
-        return false;
-    }
-    bool frac_msb_is_one = (a >> 9) & 1;
-    return frac_msb_is_one == snan_bit_is_one(status);
+    return frac_msb_is_snan((a >> 9) & 1, status);
 }
 
 /*----------------------------------------------------------------------------
@@ -271,11 +272,7 @@ bool float16_is_signaling_nan(float16 a_, float_status *status)
 
 static bool bfloat16_nan_is_snan(bfloat16 a, float_status *status)
 {
-    if (no_signaling_nans(status)) {
-        return false;
-    }
-    bool frac_msb_is_one = (a >> 6) & 1;
-    return frac_msb_is_one == snan_bit_is_one(status);
+    return frac_msb_is_snan((a >> 6) & 1, status);
 }
 
 /*----------------------------------------------------------------------------
@@ -302,11 +299,7 @@ bool bfloat16_is_signaling_nan(bfloat16 a_, float_status *status)
 
 static bool float32_nan_is_snan(float32 a, float_status *status)
 {
-    if (no_signaling_nans(status)) {
-        return false;
-    }
-    bool frac_msb_is_one = (a >> 22) & 1;
-    return frac_msb_is_one == snan_bit_is_one(status);
+    return frac_msb_is_snan((a >> 22) & 1, status);
 }
 
 /*----------------------------------------------------------------------------
@@ -335,11 +328,7 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
 
 static bool float64_nan_is_snan(float64 a, float_status *status)
 {
-    if (no_signaling_nans(status)) {
-        return false;
-    }
-    bool frac_msb_is_one = (a >> 51) & 1;
-    return frac_msb_is_one == snan_bit_is_one(status);
+    return frac_msb_is_snan((a >> 51) & 1, status);
 }
 
 /*----------------------------------------------------------------------------
@@ -370,11 +359,7 @@ bool float64_is_signaling_nan(float64 a_, float_status *status)
 
 static bool floatx80_nan_is_snan(floatx80 a, float_status *status)
 {
-    if (no_signaling_nans(status)) {
-        return false;
-    }
-    bool frac_msb_is_one = (a.low >> 62) & 1;
-    return frac_msb_is_one == snan_bit_is_one(status);
+    return frac_msb_is_snan((a.low >> 62) & 1, status);
 }
 
 /*----------------------------------------------------------------------------
@@ -416,11 +401,7 @@ floatx80 floatx80_silence_nan(floatx80 a, float_status *status)
 
 static bool float128_nan_is_snan(float128 a, float_status *status)
 {
-    if (no_signaling_nans(status)) {
-        return false;
-    }
-    bool frac_msb_is_one = (a.high >> 47) & 1;
-    return frac_msb_is_one == snan_bit_is_one(status);
+    return frac_msb_is_snan((a.high >> 47) & 1, status);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB79FF8863
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:51:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGznK-0005GS-0B; Sun, 26 Apr 2026 09:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznD-0005Cq-BI
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznB-000114-KN
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:03 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b4650d5f5cso35017685ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211100; x=1777815900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHJzjUFe1w6dTKeKSnIu28qswOkgajlabWRrdUskA+w=;
 b=SlWI8fleIRBqtyPpzcyysUm8kusJ0L7f5yhmvJbOwI8te5Ga2KLeRHrbPQqNU6dZD/
 ZHcyh4pc+cyRFwW/Cps25a67KltQgbKAd4tjDhytJTwpnOkXE+Lby5x5BLTaERErEtHI
 RSVFaS2W+vPVX0q1V45KP1P+k6lc1DlRvtJbGA7w+6FX/AsgW3ra4KOdRSEK0wyIa1oA
 QiaVzOHqUj3+GzCWPigAzfxvdkyB3gEXI/j2AOvjXNdHbzFTvav0k/8m9hdQqXUp2AcM
 Q3jmerfwAttS5kMrDsgPGELxF+1hg8d4oAH6nrb/CAITE4Ug/OJ7iMYCATXLRVqyxBbJ
 BceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211100; x=1777815900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qHJzjUFe1w6dTKeKSnIu28qswOkgajlabWRrdUskA+w=;
 b=FMyyNNhspbQoCz57+zQcWq026xYNK12cur+woNhIgpOkM6dnQfLoqQVHvQgeaVaGFg
 ad4MNjJw6m0s6VpSz5VUQta29SQSfe1iEx0SM4egDotO+tG+WVmn6FTrZJSRMTIj0nWb
 u7x1eTPyT3WP8zfXVI3N7zskCtAYPrXULp8dxp3ircfQlrrdy2R2jCRtFd2Gq6LweTuH
 JDBc6I1ZYtgDdbqiU7jx/6wdU/xZeVkPW8SnelmVEws5YyWS1eeOTZ0M1fsgPufIJvQ1
 ToKpgVGQOuAbeCgIYA5cONr1OhAuxv68L7rwuwpuyCWS2OgKjRIjKJVhKZ6uPDGmMMS1
 PoZQ==
X-Gm-Message-State: AOJu0YzcNBnyUutNaNh0S50VeC6FWydYmUVAH/JBOSPtbItWYfI0GVpl
 FihCeU9xL5tiyI0DHfVfG8H7CQcBrwqOE0Q5RNbV5IiIhb8ICmpQWr+cnA5SBYVjDbM=
X-Gm-Gg: AeBDietdxZZw3gpwCpm1cAYlhbJ9AsuOUxpkNurDJQkOaKPx/AfGoe6gm4GpjtSLB5M
 kPseCv5BjQ9poWI5m7EFQ06ZTTxkBXhu7pC2NaNnqC9ojhSVBSYfZWwtaLVBCFKCferdL5kzYBk
 HeeMGz+08hSnE1QglqO8TX6pjCOB/dczdwlx8hGDAJN80W4RmrWNQ5MsJaq//QynQYLGM8mKR6B
 rjv9xd8yiDCHqi8RTeWXva0/34071+ttX5zVF+Mmepj+hUji0RBGYWoofmjZ7qvpQ14jaf477rZ
 woyuulfe7SyY6XuZ53y3nxOPGo/u1XqWCnNiA2/LHlM3N1BCiIvSPuM0owzlQ4rszwcL830WX3J
 cPul4TqXtkO5ZtzvlLJrAyweNX1mUjnNoZszTwGiUWT79ITp3/1tlIqVTkcXm6HIhH7CqP7nvJL
 K5tiAMq4nosmH0udCLuA6QP+L/BrKHjsQHCcFtWgC5
X-Received: by 2002:a17:903:1aae:b0:2b4:65d8:6a20 with SMTP id
 d9443c01a7336-2b5f9e8e3b5mr395757055ad.2.1777211100142; 
 Sun, 26 Apr 2026 06:45:00 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:44:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 41/84] fpu: Inline float32_unpack_raw into callers
Date: Sun, 26 Apr 2026 23:39:18 +1000
Message-ID: <20260426134002.865628-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 19cca8fb85..5e33eab8d5 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -646,11 +646,6 @@ static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static void QEMU_FLATTEN float32_unpack_raw(FloatParts64 *p, float32 f)
-{
-    *p = unpack_raw64(&float32_params, f);
-}
-
 static void QEMU_FLATTEN float64_unpack_raw(FloatParts64 *p, float64 f)
 {
     *p = unpack_raw64(&float64_params, f);
@@ -1529,7 +1524,7 @@ static bfloat16 bfloat16_round_pack_canonical(FloatParts64 *p,
 static void float32_unpack_canonical(FloatParts64 *p, float32 f,
                                      float_status *s)
 {
-    float32_unpack_raw(p, f);
+    *p = unpack_raw64(&float32_params, f);
     parts64_canonicalize(p, s, &float32_params);
 }
 
@@ -4913,9 +4908,8 @@ float16 float16_silence_nan(float16 a, float_status *status)
 
 float32 float32_silence_nan(float32 a, float_status *status)
 {
-    FloatParts64 p;
+    FloatParts64 p = unpack_raw64(&float32_params, a);
 
-    float32_unpack_raw(&p, a);
     p.frac <<= float32_params.frac_shift;
     parts64_silence_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
@@ -4984,9 +4978,8 @@ float16 float16_squash_input_denormal(float16 a, float_status *status)
 float32 float32_squash_input_denormal(float32 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts64 p;
+        FloatParts64 p = unpack_raw64(&float32_params, a);
 
-        float32_unpack_raw(&p, a);
         if (parts_squash_denormal(p, status)) {
             return float32_set_sign(float32_zero, p.sign);
         }
-- 
2.43.0



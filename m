Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FB0FF8863
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:53:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpI-00072T-Sv; Sun, 26 Apr 2026 09:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznl-0005eB-AO
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznj-0001OD-LJ
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b461310af5so36496005ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211132; x=1777815932; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGDYPjHTYCXHRscWp+hH1FEaFJxCcy/ciGEVQSmwAsc=;
 b=LVRRvnmctvThLWw9w+Xjkd4DQh3ulBfD5+VFdPlOufVMo1pSjXZTjIugY6KqW0ZY+m
 zpfFmRP179TIG0fJNEPRFGmPV91ghY3m3fkrvnvqWDCKizIF5dXz/W4RmG5GZFuUYP+N
 jW/uVTBvchvTLLRP3mVZ5aX+AOds2U+UF+zoj1Tny+KNf3zPx/vbeIX21t+xAtKCY61v
 dmvEBftCG9Jn9qR1g62FdJI6Sxo7s+2fxdqPeiDgZug1dzr9otpaAOBSLaGElQfh8bkl
 Y91G7PnZ0pb+L7X8kUYIvZkZP//swQBPmFziT9+is65ZzxmjBT8DuNMQDVIHmS7xtaxV
 EwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211132; x=1777815932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IGDYPjHTYCXHRscWp+hH1FEaFJxCcy/ciGEVQSmwAsc=;
 b=l48ZYwoHc4lui6YtIZUJpyEZmYVslFJVsxpWvQGxKItQ1lXJtidEwlBiT6hNqQzFYg
 +ldyDN09ddZsBpyPwuMyM0FQdDS/wqTuCUTZHlIHVl2W1zeHl2M7ATZzO19zBGl6vuBJ
 oOaIYAZTtrbZOs4V7L16EvyspIcqgWurs9hlKTkcBuuwAPtDGOO3qwSlHAbD3KhT1BAd
 Yzgm7/fiM993l/tk7ApJQibP7MEohiMNJ3JodS7/kWuh0/oC9vFy+8E1ZnpX/RkdP+5S
 tQuXfAg4ndQhk9mVCBM7zQHeBN7el7wEubmZ3AYgB42WabBHarhrdOflvn6qpZw6KfdU
 IMdQ==
X-Gm-Message-State: AOJu0YwxopRurqQ9NGoG2+bE/yHFwc5oCZzBU5FetXTIYpmgkBPCA21F
 reWglbvtmMBi3Tj8+Ufmq3d6Xey9QKfIKEyY8SpxqaTXQujR311PBv2DuM9s8MX+fJ4=
X-Gm-Gg: AeBDiesIKVzORUIvsBg/kw+PDf0C2iOI5hvP1tHLX4Rg6HSp8xo96DrLD+6a8MtN0H+
 HOuRKiEqrPHPJnSbl0uwODwy5TaaMSnlzvzpR+FLdzNjlLBQFZFG7Zfn6wHCklh6jWlFYg0XrWG
 /KSklh9QjhTgAQnHMcvDV6sZMaMyVX6I7mx9nz8Uq0PevNzCO2rZMeX+vC0w4Vrmio36rbIhqzH
 e5AHGQG20ubHKbnDsY8XrFssRT6t7V/ksBvQJmyW9etRx7tJU8azWiAUKQbyYI6xY5uQ8xa1YOw
 UNUkYhypNbdFQaNSBc6N2lm9sXP3unoTUVLEULGE42+FPH25PFxLhq6t8MKCS9ucdMX1jpNIRgg
 S39TbT4zkwxl3QixYyUMNLZjjFeNoKcXTh5We0cPSkmI60PF0FOBW1LYQTuvyFvwFYARdMWt8xo
 5EF9gQhXl8v28N4YH0aPiMMhCuguZgON4gZe0WU4hA
X-Received: by 2002:a17:903:1110:b0:2b4:636b:dc4f with SMTP id
 d9443c01a7336-2b5f9e950a0mr337443645ad.15.1777211131932; 
 Sun, 26 Apr 2026 06:45:31 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 52/84] fpu: Inline bfloat16_pack_raw into callers
Date: Sun, 26 Apr 2026 23:39:29 +1000
Message-ID: <20260426134002.865628-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 8cfe7f8f4b..6d5125eb1b 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -673,11 +673,6 @@ static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
     return ret;
 }
 
-static bfloat16 QEMU_FLATTEN bfloat16_pack_raw(const FloatParts64 *p)
-{
-    return pack_raw64(p, &bfloat16_params);
-}
-
 static float32 QEMU_FLATTEN float32_pack_raw(const FloatParts64 *p)
 {
     return make_float32(pack_raw64(p, &float32_params));
@@ -1488,7 +1483,7 @@ static bfloat16 bfloat16_round_pack_canonical(FloatParts64 *p,
                                               float_status *s)
 {
     parts64_uncanon(p, s, &bfloat16_params, false);
-    return bfloat16_pack_raw(p);
+    return pack_raw64(p, &bfloat16_params);
 }
 
 static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
@@ -2230,7 +2225,7 @@ bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
     if ((flags & float_muladd_negate_result) && !is_nan(pr->cls)) {
         pr->sign ^= 1;
     }
-    return bfloat16_pack_raw(pr);
+    return pack_raw64(pr, &bfloat16_params);
 }
 
 float128 QEMU_FLATTEN float128_muladd(float128 a, float128 b, float128 c,
@@ -4753,7 +4748,7 @@ bfloat16 bfloat16_default_nan(float_status *status)
 
     parts64_default_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
-    return bfloat16_pack_raw(&p);
+    return pack_raw64(&p, &bfloat16_params);
 }
 
 /*----------------------------------------------------------------------------
@@ -4797,7 +4792,7 @@ bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
     p.frac <<= bfloat16_params.frac_shift;
     parts64_silence_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
-    return bfloat16_pack_raw(&p);
+    return pack_raw64(&p, &bfloat16_params);
 }
 
 float128 float128_silence_nan(float128 a, float_status *status)
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B09FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpJ-00075h-M7; Sun, 26 Apr 2026 09:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoH-0005wT-2X
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoE-0001Xo-BG
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:08 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2b941cd869cso6870315ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211160; x=1777815960; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JqpUFWXlE+yNso214pVWpAnT/3t/2kgkwE5/W87FM+U=;
 b=kfohX+ImAqS1sYo/H8oq8uHfVtZR8DdAd0RgfEd1mY9+Ci1nwQr0ehzK/42HZJ1yZE
 n28xUnF9zE90sj+hkd7q8kUkoA3RNtJqspTLzPaDryBb/Nj7nUMwTuvGHzNLbYS4x1/M
 WBRfU0M3zlurTTabOAZz15e6at8R/fXZ0PbEYxjc4XbYakWHS400Gszpnkjd2Ckcx/go
 iKR5oG9i5keECskULDw0OWsu5EBzKnCOm7GYgWP4O+Fj7zeREF1HzrfBxHtEnqvcYmvI
 F3urPKO0NoExVaOWAuxW/2I9bZmI8tqMA98w6MKZYnz2w5QnPJaW5UD2M+6OVd6vAhfI
 rVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211160; x=1777815960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JqpUFWXlE+yNso214pVWpAnT/3t/2kgkwE5/W87FM+U=;
 b=F5gY8OnAetCWafum5mhIbz6frXKc5qSYkwf9WZBQeZIwKnkt+WmmHDKC3rdCUYKuiy
 R624ZT7YycQ8kN69i9DEdeCVjLNQcuMPFazOHvAJASn8MA8Z2X2ulKrxG4n/+M+jMp/K
 3DM0W0PVTAT7SIflS3uhoN9Je6V1ogrnyL4zhfVNyT1KtqTHgOSpBRXh5Tsq202G18bP
 gEsw3eJL5gwPd1rTZ845fq/8SOaXxGlQaVXEnKD7+ZEUs2HGofAYMtLdr1FHw6Z9zOEC
 w2PfExim/c2G+3YLj1HqhHgOf5RAK4q02ehADnKf2Ugaiqt8eVWS9WilfNu2hbIfrjnB
 vwbA==
X-Gm-Message-State: AOJu0Yz3r8ybQmdZ/Bf8l+4wTea9H0TgdRE70t++462gwBxOpy6bpKmi
 WUE2k0f8Dqad+xY4MDGDhpyQhiftyradKklo/j34VwI3vwzJNPsmEE0qeuY4sdPVP5uaCXuGn73
 ttcXRa0s=
X-Gm-Gg: AeBDietsM5RvNeBgHslJ14GHA5YxiD/fCLcahiXOyQV5df6nsNM6vXHvvEb0qLeXsgn
 nEcuOUHuCNXu0qXrlHUM2BLA/iXB0VKPshwai5F8jNboUWudBzsfiK19v5owUOFLQxP24kSZcKe
 ELBVOHt69DDjsVKLlDmT8Rbh6Se+HdPMmUnlDPJb1pPOWyo8FnbLKIXKFT4qHmkCHN6sh884kb/
 76Zs1NO313iI2xxodUi28998qlqYGUyrkfFk2RSefrkf82tbW70/VS6KLcOPhCrSagq1NVSJdLt
 KppVxZQEfOTvt3rHKQtmfB7sXy+mNIbG855BaKMPV8lw+3UOdULv1XgE2uKEyp0sNsS0jGhEpAi
 RYnUKAjmzPhv01bxBQyZBCWBSp4KTPR79VRbWtoIUXLNJBZVOlrzzJirv9e3R+q/GNVSM9/Ln3X
 3ai69jFNbENMXm90GjpB0hKiAef7k747S7ETw4CCWW
X-Received: by 2002:a17:902:d592:b0:2b0:ccad:de1a with SMTP id
 d9443c01a7336-2b5f9f3aa58mr387107155ad.30.1777211160486; 
 Sun, 26 Apr 2026 06:46:00 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 63/84] fpu: Sink exp_bias adjustment in float64r32_pack_raw
Date: Sun, 26 Apr 2026 23:39:40 +1000
Message-ID: <20260426134002.865628-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Share the float32->float64 bias adjustment from both
the normal and denormal paths.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 7d67e25c17..b7d461bca4 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1412,14 +1412,12 @@ static float64 float64r32_pack_raw(FloatParts64 *p)
              * in normalized form for float64.  Adjust, per canonicalize.
              */
             int shift = frac64_normalize(p);
-            p->exp = (float32_params.frac_shift -
-                      float32_params.exp_bias - shift + 1 +
-                      float64_params.exp_bias);
             frac64_shr(p, float64_params.frac_shift);
+            p->exp = float32_params.frac_shift - shift + 1;
         } else {
             frac64_shl(p, float32_params.frac_shift - float64_params.frac_shift);
-            p->exp += float64_params.exp_bias - float32_params.exp_bias;
         }
+        p->exp += float64_params.exp_bias - float32_params.exp_bias;
         break;
     case float_class_snan:
     case float_class_qnan:
-- 
2.43.0



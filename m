Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01ABCAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:58:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1kbe-0005i8-ED; Thu, 25 Sep 2025 07:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1kbc-0005gq-QV
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:57:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1kbN-0003Sq-0J
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:57:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so6560645e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758801446; x=1759406246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Sg4d6Xi4dn19c1xIRc0y4T4UNJGPBwgkBfHHYUi4ds=;
 b=gVpTvTTZE6LALtau23assPD3qukSD7XRokiR5GqRWN4eo95NOc0rryrjsjN0i77rSF
 7ZV0yrjm5Oy8he7v1dCFUiaSnH3MseyD8HisSbzXLU6s4CUABiN/E3oNb3AHr0/sYxsr
 wmQM2dqAJw9TQvgBLaJp2TFQUZrW4yNqeHmPELl7IOcLxBX1vauj5H9s6PGPIXgffgxc
 x43sY3q1ONI6+dfsTayebvxhITYdXrSZj0T9KDLDeoTMQcFlHObR+d9zXHHtw4YdeNL+
 2RcgI1no30Bc5Y2sDM4kBKOIlguQtRR8UcLQhFzEXy62+H8db9881AdebG9iR622rWDa
 zmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758801446; x=1759406246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Sg4d6Xi4dn19c1xIRc0y4T4UNJGPBwgkBfHHYUi4ds=;
 b=Z9cce4U/JzLP9hwNi4jhtonkHEfrHdjnRbWyHSTpknMBwQJiR/HHYO8JyRhh6o6AXx
 JSiV3CUbWmeh9IZq8YjvvnrA7kX9yjonnMp6dov+PZR1y9xdwtNWshYcKHg5FkNl8iUo
 dSsqX/oJK4riROzheu2+LA18aLq2ZJWVR+xWiHNjaONj14i6aSJmg189fjsn7msKAzaR
 Xr8SuTNmPPtONhn3PLz/tvrmTkjHOjLbj2TS8sUQptamK9nQ0/yB55Nc3ab6rIhHmp5k
 u3FjeYeA52YjcvUrFsD1KfO/CcRUM8keMDFOo07FXXzgcau5sYX5xtv5mx6YByapQR4P
 4Erw==
X-Gm-Message-State: AOJu0Yz0Z66OfhhjBRkGrCto0dx5BnbEHcg4wDdSMqNK+QNmNc8QzJLo
 D0dhKUb0CnMr8Ya3bJq7emUnM6pt7LkJ3Ai+/b6bUAmdW/9Co6E6+6uRbe6X0lfa/daUgN6dYOx
 L8NbS
X-Gm-Gg: ASbGnctQVFtJl05A6oJZqCmYbAAIN3lWQg1lwF7Ort9JS4x9BtrKCp7gPHEdUYuP/v4
 7f075K8UE7r8EF8PJriqMelInKssBFXnzViQ+Noxnk4tzANYjJLX4woAtP0ZAXOyPSxeHuzPxZe
 zmnniM6WHmsAFWYa+1nSwjwSII35G7TitFh4udoKC117tUVrTtRWQbMqOuToFRV7SqWL63qe0iS
 tJz4co6buJ3ueHft5h6netBPEZWwcyeo3d4Kvhpbi0knwMVSqyrbsBcQwVkemjhVlyd27cUKUsw
 wUX+KbEu4k7lcDv/dRmbj+cBVjCFCjQwgDu9Ne9hm3B+CFWEYoDoJKSNneEYPI9ex4OxhDBgXWW
 iSS7jw7CfTy39set3G9YNu7lk1laX
X-Google-Smtp-Source: AGHT+IHvtrbtZH3UVf49CcEc89QNmXANmu1l0FtXAqaXFeQlriuvg/UzLYzVItzm1rU+Ksk7mVv98Q==
X-Received: by 2002:a05:600c:848f:b0:46e:2d8a:d1a1 with SMTP id
 5b1f17b1804b1-46e329b2d10mr37726465e9.10.1758801446115; 
 Thu, 25 Sep 2025 04:57:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33fede76sm28392215e9.14.2025.09.25.04.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 04:57:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't set HCR.RW for AArch32 only CPUs
Date: Thu, 25 Sep 2025 12:57:23 +0100
Message-ID: <20250925115723.1293233-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In commit 39ec3fc0301 we fixed a bug where we were not implementing
HCR_EL2.RW as RAO/WI for CPUs where EL1 doesn't support AArch32.
However, we got the condition wrong, so we now set this bit even on
CPUs which have no AArch64 support at all.  This is wrong because the
AArch32 HCR register defines this bit as RES0.

Correct the condition we use for forcing HCR_RW to be set.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3128
Fixes: 39ec3fc0301 ("target/arm: HCR_EL2.RW should be RAO/WI if EL1 doesn't support AArch32")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c44294711f8..ba1f7296dd0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3695,7 +3695,8 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     value &= valid_mask;
 
     /* RW is RAO/WI if EL1 is AArch64 only */
-    if (!cpu_isar_feature(aa64_aa32_el1, cpu)) {
+    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+        !cpu_isar_feature(aa64_aa32_el1, cpu)) {
         value |= HCR_RW;
     }
 
-- 
2.43.0



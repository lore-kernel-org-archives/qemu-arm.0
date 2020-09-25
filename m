Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1268504lfq;
        Fri, 25 Sep 2020 06:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6ApQeGKlpbXDxl+bsMfP1r7cah9WFzA0AJk1Q6lvBiy/5xp6l/UJEzpsTx/OnsPY+oegQ
X-Received: by 2002:a25:818e:: with SMTP id p14mr5239195ybk.399.1601041175522;
        Fri, 25 Sep 2020 06:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601041175; cv=none;
        d=google.com; s=arc-20160816;
        b=AEqWJGpvE+jI/Si21QIRia0JmPlbw2Z2Qm9Qp75DZiwkY8UBp28oZkb8OGVRGEbfJR
         gJx1wddFcxgpND+MeUncSbDwdLZ3hjAYL6SmjD/UIAJlrNLgIF53KMEDPfZdjtPKKatZ
         5/bjgQzUopsESdyvFmUJ7qNKfl59M+U5rWlOu0H4KbCiqnGv6r/PWg6KRap/tpzgFkp5
         TWseSoNJ/9C6U0eZb7yoqG6OBGznb71o0oB2p7b6FMyIAnq6fsujB3BhQLcSIkFReq4h
         j+WC14yCR35CyfkiaNgDlcHoyI5yLm2tKrvjhTlheKccTALMaPRgBdYib9SRFV7fxoDe
         y89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LEapBT5lGA8vRx16w4G1jp1xfCgBRVKisEf5jOFHwNk=;
        b=IXLPKr4v7ws0hzworhP3IPnBWetFsDo9Ur9/hO2TQCsx79UBlf3MdgXSOMPQqSrL+T
         JyIhtzviBCfXEYcZ+hpgeHdiF2Okj7UYdkbBZteS3579wiTkrc3lZUac28Z6qc4xmCB+
         UhrrBt7chR6oyLm6nRgpBEEZnWI/ST7G8pzKu55PTwt7mkU3WWemiuw9f5h+GPfbvO2B
         5CmRJiYR6DbRrNFrf8c3zxXNM4CvR6Hj7G6Ta6HbIxA0zcbE4SEjdt3X5oSl0/gdsOre
         tBS3m2JWMchmgbzqEwQLkvi2SnS5Ty7pLpxp8BujIMR/6DKOv7dWPWblcootYW3K2RkV
         Y22w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=RLWl3Fcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si3287648ybc.102.2020.09.25.06.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 06:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=RLWl3Fcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLnwk-0001xo-TP
	for alex.bennee@linaro.org; Fri, 25 Sep 2020 09:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kLnwc-0001w0-Mx
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 09:39:26 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kLnwa-0007hB-8J
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 09:39:26 -0400
Received: by mail-wm1-x343.google.com with SMTP id s13so3073200wmh.4
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2020 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEapBT5lGA8vRx16w4G1jp1xfCgBRVKisEf5jOFHwNk=;
 b=RLWl3FczdndaCQi72oSqFi7gKVxG4d3TI/DKrEKNspCwS/LDF2qLUaQAh01iiQWhGh
 BILQvgjftHjqR/mDwjXlzkV/x8Pvzas7ezgn4nUIuOHMKfYLkGXxxY0p3JiIkc7MMMcg
 3g5Sswy1YvQW9yTzjOySfBDpOTAtYBYAU1JN89EWMc1ZHQtO2xTuT0EZNY/S/fVIb8i0
 LXzDj98UbrEOlFIetefcIgJj0dcJawaTGUG0NorQtP4Vd32nex3bq+N+hXob4Twfrcm4
 3gcnPr9EqSEjlXNIU6voD7sBqKBeN8rNo8SgCzk4B8lDwich5zKdlEbUCisF38N9LJf9
 bWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEapBT5lGA8vRx16w4G1jp1xfCgBRVKisEf5jOFHwNk=;
 b=j7A6CVRPOtu7qWs6+/SCvwKdJOwA1kBheb0Eo0qXq7zUDv3ofgj1azo1K954vN7UDH
 3xRXa2ghN1N70nB/buSpvIExz7M29BLnNcuwCN2bZaTzUySIZk1RTGjjmjrs3CHTBeae
 fnLj1ZbudVsHNDRvt/hSCr5evOks26SKyq6rbbciTKmU0CNlIKZhrO5dhodT1Zm2sCU9
 TUBvNudbiaEfxIt/F/Ypw+rzV9B1S3cUUaUV4JUaV2me4JLLXI+MT75VKQR4rZ0UvQ+z
 kFuQgYxR/6OMCZ8VVLpqFT+lSBKhZc+kz0X15YnVkgMt8+wyihVu1LNJyC+V4XLcS6Kw
 coqA==
X-Gm-Message-State: AOAM5332oW7fOih+AC/egMaszW9VPnisI8ocmdkVpMnPJfwrov6s47Hk
 M7FVExmE9m2+ufEkLVIGGpms0V5LnN8/xzHiAasJM54/eTA+gGmGk0EZGV+ETS6VrCTp8u/Vh/z
 xsXb66ijHD4RFHoUSXBtJZSjfu45kzERZE9RGZkLFeLQcgqapsLwlYPab59TLu9icWdAIFA==
X-Received: by 2002:a1c:9d43:: with SMTP id g64mr3536112wme.16.1601041162147; 
 Fri, 25 Sep 2020 06:39:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id d19sm2860921wmd.0.2020.09.25.06.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 06:39:21 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
Date: Fri, 25 Sep 2020 14:39:02 +0100
Message-Id: <20200925133902.28349-1-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 jamie@nuviainc.com, rad@semihalf.com, qemu-devel@nongnu.org, leif@nuviainc.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FxVco9JH/XNL

SMMUv3 has an error in previous patch where a i was transposed to a 1
meaning interrupts would not have been correctly assigned to the SMMUv3
instance.

The code also contained an error in that the IRQs were never allocated
in the irqmap.

Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 257ada9425..9109fb58be 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -138,6 +138,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
+    [SBSA_SMMU] = 12, /* ... to 15 */
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
@@ -530,7 +531,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-                           qdev_get_gpio_in(sms->gic, irq + 1));
+                           qdev_get_gpio_in(sms->gic, irq + i));
     }
 }
 
-- 
2.25.1


Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2795925lfi;
        Tue, 24 Mar 2020 06:50:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsymddfEil9x9ssDC+CT+kNEpl7UoedkeKveK1hR0sJa3HHnq0/bYjVL7guu8Hpgk8m+65w
X-Received: by 2002:ac8:1758:: with SMTP id u24mr27089320qtk.148.1585057802843;
        Tue, 24 Mar 2020 06:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585057802; cv=none;
        d=google.com; s=arc-20160816;
        b=KqqMeX7ygwu0GumNPhuVxjhF1FMAX6voq12iwHoOoZcbfwAdmseICgRxlUDYQMA2mE
         3dQI5ClpEqJrg6t7CdPEntUESgIM+z8ER3JkwneSJEHF3HWDz6bVkEtleRYfN6Vb99M7
         jM5ZIxWBg+3soEnevkag6lx73vvXtyj5eqKFRhuHUsJGCQIhVgDM/T+6hc3dt2tmGwV2
         40vmEXVqTJy1KxLwM7Yl10Gdj7H1GW6Og7V0tzMAWysEtKjqfcQ0cYX2Fka16bARqW/Q
         szD9bO+xE6MDi9dW++tBzdECX5SssmOMiP4k3BiSJuGTHOQB7kfCtGG388rYrmNFGGVo
         F5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GqrPP4sW4bKrCjaavS5T9m3kc5HNFO7tik0hAhfsKeY=;
        b=RqEdjkaDPISbzMd3jdVouDVVwlDcIA6gggN2m7lz7k4+Mj1AvBr/RijyyJAK4vjbfx
         2KxRvD0KRF108KTwyZ2aF4hCauaeg+d1SsHKFMzVivSDU9wacezlY21eXpnSInK+B6at
         n5ovzitLyAdrXT8vpa8qh61LFO8U7mD3W50wM5H0F/0wdh/jZQqVCOR9vBSGkl8jgUSD
         m+Viu8osjfaSxcnBV6E0wGtdD5Ki/8rlDSoELdWYI4UGYDEPEo8bZiypu1Wx8rvvf3R9
         g9L2POi+j1Wsv++uwDVY5+uEpr6H5zjyPMlwz68MuWLrTu2wV7q1mHEEf98Ude/M7efT
         iJmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z9Z+3Gon;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si9492970qtj.176.2020.03.24.06.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 06:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z9Z+3Gon;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGjwQ-0000vU-83
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 09:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjwH-0000t9-Et
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:49:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjwG-00027f-He
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:49:53 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGjwG-00026d-Bv
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:49:52 -0400
Received: by mail-wm1-x344.google.com with SMTP id z18so3274850wmk.2
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2020 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GqrPP4sW4bKrCjaavS5T9m3kc5HNFO7tik0hAhfsKeY=;
 b=Z9Z+3Gonj2GW1vFcxpVaAkbvqTN8qTAyzdqj0A+WeDx3Cz/EkWfhir19uda75BcmKH
 i8qxvWSPw0WAnR4sdYINwpViCCYcMEVm6ufVG3XjQ/T+Si0I4YGnbl8in5f+KLeghend
 xgz7h9qjyP+nwgpvMuPwTBa+/GEkYXR3xUgOsrgFPrOig00OsTdInNmZ4sGz0BXNAvLa
 ebhUTvVA6VTzNggKhSoNZFZfysVOw6er1c2IEjiN72c02kTiZOhuh/MmT5s92sRAku1P
 5i34mRzt/7NevNelTYSoVCWXQIHX1w0Qdy+dDA5LFg3XJOFxxxF28JjS1bKBRCSgHLnG
 /moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GqrPP4sW4bKrCjaavS5T9m3kc5HNFO7tik0hAhfsKeY=;
 b=Ly6sJ1S11N8cC3f2gUy9KsbnaMpqq97T/0NU2Zg8zjPA2FzesyX8JG6ADQgHKq+uaT
 6WcMdhBZSYTq3SQWYlFNjfxBpbIjcf4/kv9wgO28RktBCwFts7ZNJSlnSafB4rlmX/H8
 f0oWhqPXXEamWh/AcgCJ7VOV/ahZXdh/VSbODU07RBWBb7n7ezACjnUc26UqJzC/gbOc
 KqzzbMap3yPQ/16YORr97xWQBkpChOM6TfSM2dYvtiLguToH2Bc80gFqFvunjZVFCGgW
 IzcbnKPp5iA9YbMVeDK1q+4i/Gs0VLR80WmPR15MHNBdSExeFw2jCPgTtIlOmXNi6Bbn
 VDuw==
X-Gm-Message-State: ANhLgQ2rgz8BmmunNPOqsZsFYENv/mkudR4t2mg6dSOHnqa8mE/7yuQR
 pFbJBW+s46UA8ae5e6nmYVlnotr7Xn5g4w==
X-Received: by 2002:a1c:6745:: with SMTP id b66mr5780321wmc.30.1585057791092; 
 Tue, 24 Mar 2020 06:49:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k3sm4332067wmf.16.2020.03.24.06.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 06:49:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/xlnx-zynqmp.c: Avoid memory leak in error-return
 path
Date: Tue, 24 Mar 2020 13:49:46 +0000
Message-Id: <20200324134947.15384-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324134947.15384-1-peter.maydell@linaro.org>
References: <20200324134947.15384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DjiblvynoUY6

In xlnx_zynqmp_realize() if the attempt to realize the SD
controller object fails then the error-return path will leak
the 'bus_name' string. Fix this by deferring the allocation
until after the realize has succeeded.

Fixes: Coverity CID 1421911
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-zynqmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 49f1c8d0de2..a13dbeeacec 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -520,7 +520,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
-        char *bus_name = g_strdup_printf("sd-bus%d", i);
+        char *bus_name;
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
         Object *sdhci = OBJECT(&s->sdhci[i]);
 
@@ -541,6 +541,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
 
         /* Alias controller SD bus to the SoC itself */
+        bus_name = g_strdup_printf("sd-bus%d", i);
         object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
                                   &error_abort);
         g_free(bus_name);
-- 
2.20.1


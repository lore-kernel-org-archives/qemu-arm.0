Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3365533wrx;
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdQVRMp13OVNmIpNVqVfLRQNvHJ/1pkUgwU0Dh0kEYJwonKnP7LuOsvN3u2KijVeX5rfln
X-Received: by 2002:a1c:658a:: with SMTP id z132mr24501736wmb.92.1555378790803;
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555378790; cv=none;
        d=google.com; s=arc-20160816;
        b=IaIly7YaIleDXddolER3bOHOeFBbAq2EbnH00pecLRduGv/liVO6pQ/FpGIXgYCuRj
         VvnBsu/jVbRYHwrhAWZF0zhm21A5heHRFiYcfTIvTn2EGkNrvr5pFntRRngIIg9aHtgK
         lO5eEA7SlkY6sU9JI2rReN8Iyh6hNIhjPqp/nqinQEQ1IHrUs/zbUguwT720mgvgJQvt
         mP4uDEgKiH7n+OrfWfXEs4YEM8h2hDh8ZBwimiPDFbuqPKlqFE56sTyECDJh2Mj5vBV6
         lQ25Lp6E2+ifO+HxZR3vjZ8biwSw3ZRK2f+zLxRSphpImP3jpjIQsSquqbemzQKcC3af
         fp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=apAWNpdsoKze6QgfaW5xAIkNAJRGaK2WIkM9N7G5qZw=;
        b=0NAy3qA/gzsZjCQ2BDoKpPVT8ThQbM05YsnBIfgQroB86vPxBP/GE66N1rBF+22/xi
         Hy+iNqavulRhqm2mR0GVWuEcfKN+6OFzDRNVeI9x9vdro4+9/uMQ8Cl5XLUTaIWTiCqq
         CkfnRKNk7MlMPrce8GtSr5KWQZAEL1BLchGk1O9e/3QZmWeAPZXBCpFiLSx9sn3Wwc2K
         l2pgAyMRlklkJ1BFWsLW6m5Ufwt+eQmHzBeEpA1KKzj+g9NXmJQNQWGnmnuCnZuPHQ9l
         7ce2iqEXCwyb+sLFym7vCKQvdp79/I43ED6YnaO3l+s+Y90hC/4c9Em52t/t04dDToCf
         MXog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pHhsinVG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si33822895wrx.235.2019.04.15.18.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pHhsinVG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGD4f-0006SO-Ri
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 21:39:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4P-0006Rh-NV
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4O-0007mk-OF
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1hGD4O-0007mL-HX; Mon, 15 Apr 2019 21:39:32 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f36so9478408plb.5;
	Mon, 15 Apr 2019 18:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=apAWNpdsoKze6QgfaW5xAIkNAJRGaK2WIkM9N7G5qZw=;
	b=pHhsinVGlxUPde6+a7KgisNBWZZ09bGNeGC+YxR0cW+cIVs7xj6aKMPlTWFxFmtuWo
	euItAaFr8oocO7F4b5Jej5GXdwL1+ustQiaksZiImt/Hb+spGrcBzd8cI25tEiY/Vulf
	9vFMAIS41eHb9WeZlHLNbOrUiOlmohd0ly1fASvjO+Nm8KT1tE/OTXxWE5ijuXaaM15n
	bj3VxkbwKiNDXObrTW48s2/s0pmtvr2vSCK628dsAX4afdJXWUqnERYHJ4dLQg/CiKRC
	OiraUz0sW4k5gPoW7vP6K6lvBQEji8CUzl+MdwKozIF77eKae2V3JobcRqtqYXyRABHX
	Ck1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=apAWNpdsoKze6QgfaW5xAIkNAJRGaK2WIkM9N7G5qZw=;
	b=bD0o6AGx6Wpy1PtVHsW2KPnicHOdTjAM/t8gd72T+QKMhCd2ETdhInSeYGXjo5+DwQ
	6H4DPTj2j3WX14UGCigHh+Cv4HJtRhDrkF0BVWfRvfCXO9UoVep7LbMKqy/T8Cnaf/mo
	kkYJm7wTJ13DQl6vIcu/ggrxoqsaTAIAGds7/u/S5+hYOemoJjvFQ8S6O7cgQr4vZOrq
	6L9gtjhp4EUywcC65wsgBoYqmN7VoM9qmvqXcE6wRO6Q34UBEool/xBophKNEDHxrO4P
	XR3ZmBlMBxHTt1LOmgVIvEW9TMc4H+n7aQ4hFXbNDni8n6Hu3BXlkLdvWdZyntWlmYY0
	IsMA==
X-Gm-Message-State: APjAAAVKMJpF67ou9qYendA9ly5u9iYq9giUKdKfnX+ykyWhs6gr9AcL
	9dd3ZCjpAOJa7tvNN74cdqRwGMcC
X-Received: by 2002:a17:902:2e83:: with SMTP id
	r3mr78978640plb.153.1555378771333; 
	Mon, 15 Apr 2019 18:39:31 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	v20sm74710362pfn.116.2019.04.15.18.39.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 18:39:30 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 18:38:59 -0700
Message-Id: <20190416013902.4941-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416013902.4941-1-andrew.smirnov@gmail.com>
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62f
Subject: [Qemu-arm] [PATCH 2/5] i.mx7d: Add no-op/unimplemented PCIE PHY IP
 block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /KX6FWe9wuui

Add no-op/unimplemented PCIE PHY IP block. Needed by new kernels to
use PCIE.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 include/hw/arm/fsl-imx7.h | 3 +++
 hw/arm/fsl-imx7.c         | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index aae4f860fc..3efa697adc 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -125,6 +125,9 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_ADC2_ADDR            = 0x30620000,
     FSL_IMX7_ADCn_SIZE            = 0x1000,
 
+    FSL_IMX7_PCIE_PHY_ADDR        = 0x306D0000,
+    FSL_IMX7_PCIE_PHY_SIZE        = 0x10000,
+
     FSL_IMX7_GPC_ADDR             = 0x303A0000,
 
     FSL_IMX7_I2C1_ADDR            = 0x30A20000,
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 1abfa5910c..813fb55ca9 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -532,6 +532,11 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("dma-apbh", FSL_IMX7_DMA_APBH_ADDR,
                                 FSL_IMX7_DMA_APBH_SIZE);
+    /*
+     * PCIe PHY
+     */
+    create_unimplemented_device("pcie-phy", FSL_IMX7_PCIE_PHY_ADDR,
+                                FSL_IMX7_PCIE_PHY_SIZE);
 }
 
 static void fsl_imx7_class_init(ObjectClass *oc, void *data)
-- 
2.20.1


Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2116606ejb;
        Mon, 26 Dec 2022 02:15:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtrDKNbMoVQVfVldtnx7wgaAIhBpV9bZWJlWTbRvwFHfZim47fmgPemwGS2xy6YahKc3lvN
X-Received: by 2002:ac8:7cac:0:b0:39c:da20:f6fa with SMTP id z12-20020ac87cac000000b0039cda20f6famr21180702qtv.30.1672049706767;
        Mon, 26 Dec 2022 02:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672049706; cv=none;
        d=google.com; s=arc-20160816;
        b=jTy7Nvq6DSzCVrGAa2omO2DA1lCdwH5A2+LACvnWACVVW+8TSPBeCZinbyiss942n+
         yL2vMc61dAhCfFp4v7nxdUGxbU0ZaHmrILQaY5f09AmpvOOwpLfruDAlvtuEiw0+il7z
         eVZDMn6XNRYpx+PLvCMk+N07atyjApmtRKa5CeH17eeDeHwoCe09i5EZRufdTkTusWsi
         nasuDiOh+Vjvc3baxkp+whgGFCIzb6Ul6AmeGiIValp+gcrF5L0vSdjDE+m7SrGhST/N
         iDk6M2v/w8aSkqfkSjkeupjTREQKYYaG/1FoXbhfSgx+7pZvI4B5e0zBO/g+Dgx4ZMD6
         cPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=uDET/aN57pMX4iIdM4caUl3ZfnNBpu9dqFYZDUm9oto=;
        b=Y2q208Q87rp4/YXVf52jZUqiz1sQGOpoV/BL7PsrGdn65aJVlrX2MD7JZhI+sF5fTD
         +0d+kKQjcmdKmqlMt50vNgCNo7a/Y4fNDQrtaNcaGIx4wJQa/FrCYg8ENG+Xih3f2w8D
         ItTUrBfO2YR63WOuN5Dpb+Zj7lYO/RkU980o4YAM856oVOofZpMwulDcXoYjJFozN3bu
         JJW4eoR8tPGzLBXK0I5s+EAq4buolV0d6iKiOWSQnH8ItRqADSXJoLEDdbBpRp8WbuXk
         xemGQT3GLNXq9cF51+33X5E6gyI0WngMTrfon8LuiKTIpCMQy5L153lqB4cmcUC1iBbu
         75nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc17-20020a05620a841100b006fc970ac538si3632075qkn.87.2022.12.26.02.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Dec 2022 02:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p9kVE-0007zD-S6; Mon, 26 Dec 2022 05:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p9kVD-0007yy-7x; Mon, 26 Dec 2022 05:14:39 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p9kVB-000481-Ez; Mon, 26 Dec 2022 05:14:38 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 3775E240007;
 Mon, 26 Dec 2022 10:14:28 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org
Subject: [PATCH] i.MX7D: Connect IRQs to GPIO devices.
Date: Mon, 26 Dec 2022 11:14:18 +0100
Message-Id: <20221226101418.415170-1-jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.178.230; envelope-from=jcd@tribudubois.net;
 helo=relay10.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0oQHzG76HRIU

IRQs were not associated to the various GPIO devices inside i.MX7D.
This patch brings the i.MX7D on par with i.MX6.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx7.c         | 31 ++++++++++++++++++++++++++++++-
 include/hw/arm/fsl-imx7.h | 15 +++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index cc6fdb9373..5629ee249d 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -235,8 +235,37 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_GPIO7_ADDR,
         };
 
+        static const int FSL_IMX7_GPIOn_LOW_IRQ[FSL_IMX7_NUM_GPIOS] = {
+            FSL_IMX7_GPIO1_LOW_IRQ,
+            FSL_IMX7_GPIO2_LOW_IRQ,
+            FSL_IMX7_GPIO3_LOW_IRQ,
+            FSL_IMX7_GPIO4_LOW_IRQ,
+            FSL_IMX7_GPIO5_LOW_IRQ,
+            FSL_IMX7_GPIO6_LOW_IRQ,
+            FSL_IMX7_GPIO7_LOW_IRQ,
+        };
+
+        static const int FSL_IMX7_GPIOn_HIGH_IRQ[FSL_IMX7_NUM_GPIOS] = {
+            FSL_IMX7_GPIO1_HIGH_IRQ,
+            FSL_IMX7_GPIO2_HIGH_IRQ,
+            FSL_IMX7_GPIO3_HIGH_IRQ,
+            FSL_IMX7_GPIO4_HIGH_IRQ,
+            FSL_IMX7_GPIO5_HIGH_IRQ,
+            FSL_IMX7_GPIO6_HIGH_IRQ,
+            FSL_IMX7_GPIO7_HIGH_IRQ,
+        };
+
         sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, FSL_IMX7_GPIOn_ADDR[i]);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                        FSL_IMX7_GPIOn_ADDR[i]);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_GPIOn_LOW_IRQ[i]));
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_GPIOn_HIGH_IRQ[i]));
     }
 
     /*
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 1c5fa6fd67..852eb0d238 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -235,6 +235,21 @@ enum FslIMX7IRQs {
     FSL_IMX7_USB2_IRQ     = 42,
     FSL_IMX7_USB3_IRQ     = 40,
 
+    FSL_IMX7_GPIO1_LOW_IRQ  = 64,
+    FSL_IMX7_GPIO1_HIGH_IRQ = 65,
+    FSL_IMX7_GPIO2_LOW_IRQ  = 66,
+    FSL_IMX7_GPIO2_HIGH_IRQ = 67,
+    FSL_IMX7_GPIO3_LOW_IRQ  = 68,
+    FSL_IMX7_GPIO3_HIGH_IRQ = 69,
+    FSL_IMX7_GPIO4_LOW_IRQ  = 70,
+    FSL_IMX7_GPIO4_HIGH_IRQ = 71,
+    FSL_IMX7_GPIO5_LOW_IRQ  = 72,
+    FSL_IMX7_GPIO5_HIGH_IRQ = 73,
+    FSL_IMX7_GPIO6_LOW_IRQ  = 74,
+    FSL_IMX7_GPIO6_HIGH_IRQ = 75,
+    FSL_IMX7_GPIO7_LOW_IRQ  = 76,
+    FSL_IMX7_GPIO7_HIGH_IRQ = 77,
+
     FSL_IMX7_WDOG1_IRQ    = 78,
     FSL_IMX7_WDOG2_IRQ    = 79,
     FSL_IMX7_WDOG3_IRQ    = 10,
-- 
2.34.1


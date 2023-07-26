Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp594146ejb;
        Wed, 26 Jul 2023 07:38:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlESJg5kUpYwrKrAa/ovSGdEVD3OX+TqqabuF8NdgXcVTSFGPirVfVYAsmo11jwQ2xSYyw+C
X-Received: by 2002:a67:f611:0:b0:447:574f:c8c2 with SMTP id k17-20020a67f611000000b00447574fc8c2mr1104838vso.30.1690382314471;
        Wed, 26 Jul 2023 07:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690382314; cv=none;
        d=google.com; s=arc-20160816;
        b=sSumMyhNzpY2nbxm2wsqUTY8cgc5bi4WF9++3o1TrUd/r4B+MInM91tsXiB0iBUm7o
         t1QdDYeb9bBTwf9uslW+SZVieTOZbNdaqJPm15AnpTeOP0PGhz+agBoS+WakTmbgo7uF
         6LK8gwcg+X8hoLmmIgB/5o8kFjP4xX9OJho0wK2kXltmw1kX9/1AoS3snF0hNpuiNlzA
         imuyvtSeNnnz1QWK5EGrjOk3BcW6fFDqikJ0L5i9Iu4UDCRrAhf5K/1cUis6pOO24kPh
         ylGUNysuDRQw5ktvvyut/CxWd/p0WUNofN2NYghoq1uAd9AEmVdtr73jLWWHbvmQ5tSx
         9qyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2v///SXT6nzxBdpvTOiPeZfhL7YDvFOSz17Y+vH0g0s=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=NHeeI6i72t7F8KlXuLATCa/4tooDPdyZEpCnCJHI3/ocOKz2Ntf+hRzNVbMbX1NN4A
         8VfwlOzO658c9hpeZUgN1A3zVtLhw4XIId2NEhMCTVL84Fy2Qhe6yZBrrcVYC+iS7pTZ
         yzRL9ZretfEwDy+5Y/ehUf40kAUFgMnedrl+TMXtptOj2aFYWTOYhO27tDbAX3MaAl0d
         OYKbH9umabGbLRqHF9rY9V54ZLDTu6zzFbjyVo2XExhIXnKrM0vwz4bnmYtnLSRxhquv
         3hO0fC1WfkvdXDsb5YQp4Ijmel9JIAM/GvFs2ns3I8lWjXqSPE2fXfniQXgsI7x0l4FO
         mveQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=ASWbFG7f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020a0cf348000000b0063d35258175si170qvm.257.2023.07.26.07.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 07:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=ASWbFG7f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOeWS-0002lD-UH; Wed, 26 Jul 2023 09:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWE-0002iB-Hi; Wed, 26 Jul 2023 09:25:35 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWC-0003Bg-8G; Wed, 26 Jul 2023 09:25:33 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe0e23a4b1so1592762e87.3; 
 Wed, 26 Jul 2023 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377929; x=1690982729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2v///SXT6nzxBdpvTOiPeZfhL7YDvFOSz17Y+vH0g0s=;
 b=ASWbFG7fcJS+U8dy8lA+XXdnAHzendDpv6Q9aNeeomtQEqnOAuoxU8iYIVxjTBWOQZ
 ffu7PkiM5FeXJjFWryNuL7+O5YupS9Toj83+LyPdHn52cz+qal4/M344nuLEGyRqbtFH
 5gVZA+YjoJHMbZfFlp6eSZLbc6y6yZuMqWhf1cri7mFKiRQ2XIMsQ0wx7VKf2Ih9pxon
 6b6XcX+PrBSokfOn49UGF5WVuZwI24DveaxZJ/HXDSAjDZUtO2sj0A6K72xWBm2sW+zS
 NT4LxLS0oUwdh2w3Lruv8UprXAQd5cZ1MdbzC9bHEantDRuMK3CuezBmACHqk41OLib4
 y/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377929; x=1690982729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2v///SXT6nzxBdpvTOiPeZfhL7YDvFOSz17Y+vH0g0s=;
 b=XbDpzRxYzVgmlUQzJdaa9Q9SsbBcPPiasqgPYy7jm+KidrSrCLPyDfML64eCHiyPFx
 MS851t+0FiQb2JFbbb7mDAq2LO2RaPVPCMYWvfSWya2M3LeZ5TGSqFl9d9monVpnRCJO
 6YHBfhjrWpDazsGe+so5M3bvDJY4DUwWLaC/b0C9RydkS3hnQfXRg/2xP7A5VN0qI0GK
 AQrrgdncFKUNvE1/4WkbUPbe9o1/Gnp/fnMe+8fe/Mpnwyxr98IBAhkEC3ZrUzuTequW
 0F0giy9Lqu0gSez1MX3pIaeGBscWY3BTMhnohposBFzotQUUYTsKMozGBL607JeVtysM
 1n4A==
X-Gm-Message-State: ABy/qLYQdNO2FFVCu6tYwjal0jMZTRaZVDdARhSR+elz9zATdh+mdB0X
 tS/bD1C5n803g3efviewSKgeUppnrC8=
X-Received: by 2002:a05:6512:368d:b0:4f8:77f1:299a with SMTP id
 d13-20020a056512368d00b004f877f1299amr1387236lfs.42.1690377929357; 
 Wed, 26 Jul 2023 06:25:29 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:25:28 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 09/44] Add GPIO and SD to BCM2838 periph
Date: Wed, 26 Jul 2023 16:24:37 +0300
Message-Id: <20230726132512.149618-10-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hbbmpUn4lLpS

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 140 +++++++++++++++++++++++++++
 include/hw/arm/bcm2838_peripherals.h |   9 ++
 2 files changed, 149 insertions(+)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 864941c231..0c5e716853 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -15,22 +15,53 @@
 /* Lower peripheral base address on the VC (GPU) system bus */
 #define BCM2838_VC_PERI_LOW_BASE 0x7c000000
 
+/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
+#define BCM2835_SDHC_CAPAREG 0x52134b4
+
 static void bcm2838_peripherals_init(Object *obj)
 {
     BCM2838PeripheralState *s = BCM2838_PERIPHERALS(obj);
     BCM2838PeripheralClass *bc = BCM2838_PERIPHERALS_GET_CLASS(obj);
+    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(obj);
 
     /* Lower memory region for peripheral devices (exported to the Soc) */
     memory_region_init(&s->peri_low_mr, obj, "bcm2838-peripherals",
                        bc->peri_low_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_low_mr);
 
+    /* Extended Mass Media Controller 2 */
+    object_initialize_child(obj, "emmc2", &s->emmc2, TYPE_SYSBUS_SDHCI);
+
+    /* GPIO */
+    object_initialize_child(obj, "gpio", &s->gpio, TYPE_BCM2838_GPIO);
+
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
+                                   OBJECT(&s_base->sdhci.sdbus));
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
+                                   OBJECT(&s_base->sdhost.sdbus));
+
+    object_initialize_child(obj, "mmc_irq_orgate", &s->mmc_irq_orgate,
+                            TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->mmc_irq_orgate), "num-lines", 2,
+                            &error_abort);
+
+    object_initialize_child(obj, "dma_7_8_irq_orgate", &s->dma_7_8_irq_orgate,
+                            TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->dma_7_8_irq_orgate), "num-lines", 2,
+                            &error_abort);
+
+    object_initialize_child(obj, "dma_9_10_irq_orgate", &s->dma_9_10_irq_orgate,
+                            TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->dma_9_10_irq_orgate), "num-lines", 2,
+                            &error_abort);
 }
 
 static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
 {
+    MemoryRegion *mphi_mr;
     BCM2838PeripheralState *s = BCM2838_PERIPHERALS(dev);
     RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(dev);
+    int n;
 
     raspi_peripherals_common_realize(dev, errp);
 
@@ -42,6 +73,115 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
                                         BCM2838_VC_PERI_LOW_BASE,
                                         &s->peri_low_mr_alias, 1);
 
+    /* Extended Mass Media Controller 2 */
+    object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->emmc2), "capareg",
+                             BCM2835_SDHC_CAPAREG, &error_abort);
+    object_property_set_bool(OBJECT(&s->emmc2), "pending-insert-quirk", true,
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc2), errp)) {
+        return;
+    }
+
+    memory_region_add_subregion(
+        &s_base->peri_mr, EMMC2_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->emmc2), 0));
+
+    /* According to DTS, EMMC and EMMC2 share one irq */
+    if (!qdev_realize(DEVICE(&s->mmc_irq_orgate), NULL, errp)) {
+        return;
+    }
+
+    DeviceState *mmc_irq_orgate = DEVICE(&s->mmc_irq_orgate);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc2), 0,
+                        qdev_get_gpio_in(mmc_irq_orgate, 0));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->sdhci), 0,
+                        qdev_get_gpio_in(mmc_irq_orgate, 1));
+
+   /* Connect EMMC and EMMC2 to the interrupt controller */
+    qdev_connect_gpio_out(mmc_irq_orgate, 0,
+                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 INTERRUPT_ARASANSDIO));
+
+    /* Connect DMA 0-6 to the interrupt controller */
+    for (n = 0; n < 7; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  GPU_INTERRUPT_DMA0 + n));
+    }
+
+   /* According to DTS, DMA 7 and 8 share one irq */
+    if (!qdev_realize(DEVICE(&s->dma_7_8_irq_orgate), NULL, errp)) {
+        return;
+    }
+    DeviceState *dma_7_8_irq_orgate = DEVICE(&s->dma_7_8_irq_orgate);
+
+    /* Connect DMA 7-8 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 7,
+                       qdev_get_gpio_in(dma_7_8_irq_orgate, 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 8,
+                       qdev_get_gpio_in(dma_7_8_irq_orgate, 1));
+
+    qdev_connect_gpio_out(dma_7_8_irq_orgate, 0,
+                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 GPU_INTERRUPT_DMA7_8));
+
+     /* According to DTS, DMA 9 and 10 share one irq */
+    if (!qdev_realize(DEVICE(&s->dma_9_10_irq_orgate), NULL, errp)) {
+        return;
+    }
+    DeviceState *dma_9_10_irq_orgate = DEVICE(&s->dma_9_10_irq_orgate);
+
+   /* Connect DMA 9-10 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 9,
+                       qdev_get_gpio_in(dma_9_10_irq_orgate, 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 10,
+                       qdev_get_gpio_in(dma_9_10_irq_orgate, 1));
+
+    qdev_connect_gpio_out(dma_9_10_irq_orgate, 0,
+                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 GPU_INTERRUPT_DMA9_10));
+
+    /* Connect DMA 11-14 to the interrupt controller */
+    for (n = 11; n < 15; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  GPU_INTERRUPT_DMA11 + n
+                                                  - 11));
+    }
+
+    /*
+     * Connect DMA 15 to the interrupt controller, it is physically removed
+     * from other DMA channels and exclusively used by the GPU
+     */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 15,
+                        qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                               BCM2835_IC_GPU_IRQ,
+                                               GPU_INTERRUPT_DMA15));
+
+    /* Map MPHI to BCM2838 memory map */
+    mphi_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s_base->mphi), 0);
+    memory_region_init_alias(&s->mphi_mr_alias, OBJECT(s), "mphi", mphi_mr, 0,
+                             BCM2838_MPHI_SIZE);
+    memory_region_add_subregion(&s_base->peri_mr, BCM2838_MPHI_OFFSET,
+                                &s->mphi_mr_alias);
+
+    /* GPIO */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s_base->peri_mr, GPIO_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
+
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
 }
 
 static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 0aed6f1bec..aba38a18f0 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -10,6 +10,8 @@
 #define BCM2838_PERIPHERALS_H
 
 #include "hw/arm/bcm2835_peripherals.h"
+#include "hw/sd/sdhci.h"
+#include "hw/gpio/bcm2838_gpio.h"
 
 #define GENET_OFFSET            0x1580000
 
@@ -47,6 +49,9 @@
 #define GPU_INTERRUPT_DMA14     28
 #define GPU_INTERRUPT_DMA15     31
 
+#define BCM2838_MPHI_OFFSET     0xb200
+#define BCM2838_MPHI_SIZE       0x200
+
 #define TYPE_BCM2838_PERIPHERALS "bcm2838-peripherals"
 OBJECT_DECLARE_TYPE(BCM2838PeripheralState, BCM2838PeripheralClass,
                     BCM2838_PERIPHERALS)
@@ -60,6 +65,10 @@ struct BCM2838PeripheralState {
     MemoryRegion peri_low_mr_alias;
     MemoryRegion mphi_mr_alias;
 
+    SDHCIState emmc2;
+    UnimplementedDeviceState clkisp;
+    BCM2838GpioState gpio;
+
     OrIRQState mmc_irq_orgate;
     OrIRQState dma_7_8_irq_orgate;
     OrIRQState dma_9_10_irq_orgate;
-- 
2.34.1


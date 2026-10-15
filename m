Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6121FC2D0A6
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 18:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHPvG-0000u5-4S; Thu, 15 Oct 2026 14:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvD-0000lK-44
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:19 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvA-0001Nv-Np
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:18 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-93e6fb35f91so528751385a.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792087875; x=1792692675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9tEI/VlpifxCpLIHjflVDNdBvw+9haRZiBYD7yczmRQ=;
 b=MLI2rj8lK1dgTLiHIyMbQNl3SJox5I7Z6YnAi45EWSu6yduXQQb73Xn8P5mmFlBsJs
 BoOlpG7Z9HoFTBUOoDfKEB76lTsdTfdbmGCtv/LKaSmRuC9RADmMeFS78CkJVPmc6fXN
 ru6IHrYYda6dyo/mTIupohY5y+ZdAF4FX+giZNR7A8bUBwnbVaixFiEX5K9OSjSJDuXf
 Y6EUCAc3Fhvu6Qsvg2UrrYEQntJ1TiiCDce9f2GYFROll/enwVIpybfooO2BBCn+JViQ
 DFH7hst3DesiNMXClFOvsxERcUEIpx7M+hHOcxvNlwvN8398BovXSWMjIdjn4Rix5vM8
 GTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792087875; x=1792692675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9tEI/VlpifxCpLIHjflVDNdBvw+9haRZiBYD7yczmRQ=;
 b=R15ZeAkSIfaWx4txA2HktY3tUrtmar4Rdxvi7u9yDsSRm7EgzbZvUC1bSoulu0rmxb
 UmUffji9ETqVdz7FzSlFqU6gDUjoAmv0+ceiI/jbr50Zb5FJv7xnkl4TYD6u/4NhU//4
 pwKZnv+HvA2cWboiCHRnD7NTmUlUWm0YgGawnHFTG57yNuvmP8yc5ha9x+mdGDI/hg72
 GQDCYHAfMbWfoKaOvuKcAekq709O4BMVJY3HDOcoExKRmFOpQ+aEggfesipK/S3b4/mq
 rdNMeErQjY+BAJPwNZ1Mi4ZgQk+Xp8Nuzwrh7huMSR5LcbfHoYu4jA09iHajqKlIMOlB
 NsMg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxT83zpQBUcuBiYKVwan2yuiXcMDXOABrnZnn1vwC1MLSGVNewW8XQT40iGDFKsD6Q3RlplgcjY9g==@nongnu.org
X-Gm-Message-State: AFq9FYLrWm1flga0yrsKjA22rtHo0B/ynuPrhDm44fNSFzxs+QjBhuYr
 qff/VzBDEMuTyJhG+nBbhXfa3FIc2DCnU/b06MbQYnOwCg6LVbVfyE49
X-Gm-Gg: AYBFou0GnGrJE/9lSzT0DlWViUPLpNyp6L1XLet4H+AzdHNISxFvNyw3hQ6xggwY2qK
 5UKHv7k49oJfNpkLdwzUDMlvwXPwvSIgRinYacgTBbs1E7hhJJ8ahzWVL/ADox7W8DhaflSGm3c
 PRbLY3/KeIwIAMvEtJX3TT4X8cKqsLX6GmCu4B1JhjD330/q21wlySEtenrjQdcVCmPOHzNTI+O
 dMD6s2t2/w1lblOwZ1EjLcousyiKmIouKROOrWaB+4T3P8UFdfW7JyZVAcwrmdCJb9VfRucS3GA
 RB9vBUnJmpvghY0SNDl0i/E2sztfpciuLYxAfzJ1QYvLH+zSaX8LXhiVroZbqmIi3sVihOtL8Tz
 gRdoJJ2StN7tDtyHQcsxcTUw/SWNpKk8/QpE1to3Qcxc5tfNpZNs5Y545WB0dQzoo6D8gk9z1IQ
 6Sxhw+vF184UsKGlsh9mY4WGeDdGVc0k0qhnVHzCk+D0cJ50h16r7tKJqbCRuJPnAVI433BsRUU
 QX9FsfUeEyG0UNaJE4kNdei1vAvnhvQ1w9g1plr5taciy7027cI2FXXO0g9JSePd9fnrw==
X-Received: by 2002:a05:620a:7005:b0:93e:c12c:9dc5 with SMTP id
 af79cd13be357-93f01fc22c7mr1115065685a.69.1792087875143; 
 Thu, 15 Oct 2026 11:11:15 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:919:5388:4e10:5949])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bcba45dffsm1816206d6.12.2026.10.15.11.11.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Oct 2026 11:11:14 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v2 2/5] hw/arm/bcm2838: enable BCM2838 RNG200
Date: Thu, 15 Oct 2026 14:11:08 -0400
Message-ID: <20261015181111.60491-3-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015181111.60491-1-marcelomanzo@gmail.com>
References: <20261015181111.60491-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Wire the BCM2838 RNG200 device (added in the previous patch) into
the SoC: instantiate it in the peripherals block, map its register
region at the real BCM2711 physical address, and connect its
interrupt through both the GIC and the legacy GPU interrupt
controller path (matching how the device's own realize() wires it,
mirroring the pattern used for the older BCM2835 RNG on raspi0-3).
Also stop raspi4b from masking out the "brcm,bcm2711-rng200"
device-tree node, now that the controller it describes is actually
implemented.

Adapted from patch 16/41 of Sergey Kambalin's Raspberry Pi 4B series
(patchwork series 829638) against current QEMU master.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2838.c                     |  4 ++++
 hw/arm/bcm2838_peripherals.c         | 17 +++++++++++++++++
 hw/arm/raspi4b.c                     |  1 -
 include/hw/arm/bcm2838_peripherals.h |  2 ++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index 089af412a3..218bebc0e8 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -209,6 +209,10 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->dwc2), 0,
                        qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_DWC2));
 
+    /* Connect RNG200 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps->rng200), 0,
+                       qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_RNG200));
+
     /* Connect DMA 0-6 to the interrupt controller */
     for (int n = GIC_SPI_INTERRUPT_DMA_0; n <= GIC_SPI_INTERRUPT_DMA_6; n++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->dma),
diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 812b5b8480..35e2fc005c 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -35,6 +35,9 @@ static void bcm2838_peripherals_init(Object *obj)
     /* Extended Mass Media Controller 2 */
     object_initialize_child(obj, "emmc2", &s->emmc2, TYPE_SYSBUS_SDHCI);
 
+    /* Random Number Generator */
+    object_initialize_child(obj, "rng200", &s->rng200, TYPE_BCM2838_RNG200);
+
     /* GPIO */
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_BCM2838_GPIO);
 
@@ -67,6 +70,8 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     MemoryRegion *mphi_mr;
     BCM2838PeripheralState *s = BCM2838_PERIPHERALS(dev);
     BCMSocPeripheralBaseState *s_base = BCM_SOC_PERIPHERALS_BASE(dev);
+    MemoryRegion *rng200_mr;
+    qemu_irq rng_200_irq;
     int n;
 
     bcm_soc_peripherals_common_realize(dev, errp);
@@ -79,6 +84,18 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
                                         BCM2838_VC_PERI_LOW_BASE,
                                         &s->peri_low_mr_alias, 1);
 
+    /* Random Number Generator */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rng200), errp)) {
+        return;
+    }
+
+    rng200_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng200), 0);
+    memory_region_add_subregion(&s_base->peri_mr, RNG_OFFSET, rng200_mr);
+
+    rng_200_irq = qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                         BCM2835_IC_GPU_IRQ, INTERRUPT_RNG);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng200), 0, rng_200_irq);
+
     /* Extended Mass Media Controller 2 */
     object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
                              &error_abort);
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 566d64572d..87fcba036d 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -64,7 +64,6 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
     /* Temporarily disable following devices until they are implemented */
     const char *nodes_to_remove[] = {
         "brcm,bcm2711-pcie",
-        "brcm,bcm2711-rng200",
         "brcm,bcm2711-thermal",
         "brcm,bcm2711-genet-v5",
     };
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 0be97e67c7..15423527e8 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -10,6 +10,7 @@
 #define BCM2838_PERIPHERALS_H
 
 #include "hw/arm/bcm2835_peripherals.h"
+#include "hw/misc/bcm2838_rng200.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
 
@@ -64,6 +65,7 @@ struct BCM2838PeripheralState {
     MemoryRegion peri_low_mr_alias;
     MemoryRegion mphi_mr_alias;
 
+    BCM2838Rng200State rng200;
     SDHCIState emmc2;
     BCM2838GpioState gpio;
 
-- 
2.55.0



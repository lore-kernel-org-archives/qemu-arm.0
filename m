Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11972C5CFCF
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:37:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnak-0000bX-Lq; Tue, 11 Aug 2026 10:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaH-0000FZ-7m
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:05 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaF-0001r2-Au
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:04 -0400
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-8efef6533aaso19243616d6.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458962; x=1787063762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wpoBHHJBT7Q2HpQYj8PGJ7orlbyWW8U9PIu0a8OEoFU=;
 b=BBctoIaCwL72IdB2P76JPx7Z1lwluhYSLqpL8W+KX74M3QlN3KBczali9OSaV/Ds8K
 tJ9I9VO7iIZhG+Dd+n7q6IEPQYm41emFLYq3SN0/nZYkeqe2QmOb9HPw6xY5sey3mvLA
 L323wKXG/Z+pLERf3T/v3sVMwJBSnChmFnzoILdRXdFdNjVj8RodpRRFjawaI+cdExCu
 POlqM0giewupghy4NcuDSSTAxcZRtDGwygcuFB10uWY67ukWQ6UXIX3Ff33+DH+zXHqG
 0d3AREgzY6K5p8q4agPMdwxV+xMR0Tr1m23RbNikFMG2olGcimIEJmqg+PT1nYsuqKcQ
 H4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458962; x=1787063762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wpoBHHJBT7Q2HpQYj8PGJ7orlbyWW8U9PIu0a8OEoFU=;
 b=RPw3yrMHpuWsGm+0VGk0MXLD2VmC44qUo2lx8p6/8ch8nJbuIyGJhUcdC3rvEUHZm5
 PjOGOUdZATpILhjaKwveid/MTM8Q6W5EKJFwiG3Th8++rG/xjdVmNlg38tfK/LwrADab
 Um7+/nopkEhwvYwF6v2FZCRyPDKMNfO7Bg5W7p5D/5UYwt42qIcIgrqTHfkqGH53uP7o
 +wNN17VJh03vQi9Np947fMGLe8+yxAlWFX0ozLRnS29TK+kav1MOWZ2OEQAyvP8R0ICk
 6JcQhTBGEe0zTkl5501YcOlM45if5N2I6/rkolYP7IhFiIIFtoxOYVWt4giILGVNgVgQ
 ZP9w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLE/5gkLrP0+bvXl7FT8ERMKVFeyNwBEf26xxKCKwotBcSCsVAA0OiPMipecWbwnF9rh4/yQMgNQ==@nongnu.org
X-Gm-Message-State: AOJu0YwA8HOEt4QnTAW1RuWUTLCBXOFCAvZPXmjeD6WucbsWZi2kbHL0
 XCOp8Lh/ArZdQJPshXxc1CCgjPjhiCwgbcXVLF0rOykM0W4yaOAyjYcCJJ2pGg==
X-Gm-Gg: AR+sD12Jewh3mxa4cILcv5YVvlIGswgzsZU8DMpWjp84BbAOTBnN+4oxvdSGZqIOHru
 s4lj4xmjkHKTqZwz9harLuR+SuSiRO6Iq2+cg7pIEYeTM9NhGxQCo9lRpALsVtwTkRYfOs7/jOT
 pI7rmLJFF/tvEdS9hp5zwwcQNHbhH+RsNi2gLALf7L/rauKgsqvuQMGtnNusbC2fEJ++4DeGNwF
 8BZC4mzf0gYWJAtmhe2IbnHC9YKTkHye/teWA3C29lmedDCp7GmCd+0rv3zXKEJRpPL3ldth8K4
 7aM8J5dXzXQX+X5VsaD97BSL/DSaf/PI+9tJanZ7HkGP/wGjlVnyzAPplWqODAQs4HuEjpZF4s7
 riHVN4/s2HG5hcZL7f9a+r2wuZQM3QhLTL/sDF32wggVwMoQ2Km8ynjNB2Nc0JC6stJJ/muXNOw
 xNzr/cRC5hRZpCikTteaPldrbwKL+wIyjRLtDu1UBuegceqxwHcXDY1lclU1LiGsps9uurxZVT3
 qUR3Y/6wnfdiZWJG6I=
X-Received: by 2002:a05:6214:1316:b0:907:5aa8:ceb2 with SMTP id
 6a1803df08f44-90a668d9ce8mr34290126d6.18.1786458962216; 
 Tue, 11 Aug 2026 07:36:02 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c26e074sm681286d6.2.2026.08.11.07.36.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:36:01 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 03/19] hw/arm/bcm2838: enable BCM2838 PCIe host bridge
Date: Tue, 11 Aug 2026 10:35:40 -0400
Message-ID: <20260811143557.7862-4-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf34.google.com
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

Wire the BCM2838 PCIe host bridge into the SoC's peripheral block:
instantiate it, map its RC registers and MMIO window.

Per Peter Maydell's review of a later follow-up series, fold in the
remaining defect from what was originally a separate bugfix here,
since this device isn't in upstream git yet: the PCI MMIO window was
mapped at the ARM base address with no address translation, even
though PCIE_MMIO_OFFSET was defined for exactly that purpose (and
otherwise unused). The DTB declares CPU 0x600000000 as mapping to PCI
0xc0000000, so a guest would read PCI address 0 where it expected a
device BAR. Map an alias at the correct PCI offset instead.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/arm/bcm2838.c                     |  9 +++++++
 hw/arm/bcm2838_peripherals.c         | 35 ++++++++++++++++++++++++++++
 hw/arm/raspi4b.c                     |  1 -
 include/hw/arm/bcm2838_peripherals.h |  3 +++
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index 089af412a3..fc56f87934 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -230,6 +230,15 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(dma_9_10_irq_orgate, 0,
                           qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_DMA_9_10));
 
+    /* Connect PCIe host bridge to the interrupt controller */
+    for (int n = 0; n < BCM2838_PCIE_NUM_IRQS; n++) {
+        int int_n = GIC_SPI_INTERRUPT_PCI_INT_A + n;
+        sysbus_connect_irq(SYS_BUS_DEVICE(&ps->pcie_host), n,
+                           qdev_get_gpio_in(gicdev, int_n));
+        bcm2838_pcie_host_set_irq_num(BCM2838_PCIE_HOST(&ps->pcie_host), n,
+                                      int_n);
+    }
+
     /* Pass through inbound GPIO lines to the GIC */
     qdev_init_gpio_in(dev, bcm2838_gic_set_irq, GIC_NUM_IRQS);
 
diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 812b5b8480..d923ba968a 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -15,6 +15,11 @@
 #define CLOCK_ISP_OFFSET        0xc11000
 #define CLOCK_ISP_SIZE          0x100
 
+#define PCIE_RC_OFFSET          0x1500000
+#define PCIE_MMIO_OFFSET        0xc0000000
+#define PCIE_MMIO_ARM_OFFSET    0x600000000
+#define PCIE_MMIO_SIZE          0x40000000
+
 /* Lower peripheral base address on the VC (GPU) system bus */
 #define BCM2838_VC_PERI_LOW_BASE 0x7c000000
 
@@ -35,6 +40,10 @@ static void bcm2838_peripherals_init(Object *obj)
     /* Extended Mass Media Controller 2 */
     object_initialize_child(obj, "emmc2", &s->emmc2, TYPE_SYSBUS_SDHCI);
 
+    /* PCIe Host Bridge */
+    object_initialize_child(obj, "pcie-host", &s->pcie_host,
+                            TYPE_BCM2838_PCIE_HOST);
+
     /* GPIO */
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_BCM2838_GPIO);
 
@@ -67,6 +76,8 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     MemoryRegion *mphi_mr;
     BCM2838PeripheralState *s = BCM2838_PERIPHERALS(dev);
     BCMSocPeripheralBaseState *s_base = BCM_SOC_PERIPHERALS_BASE(dev);
+    MemoryRegion *regs_mr;
+    MemoryRegion *mmio_mr;
     int n;
 
     bcm_soc_peripherals_common_realize(dev, errp);
@@ -182,6 +193,30 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     create_unimp(s_base, &s->clkisp, "bcm2835-clkisp", CLOCK_ISP_OFFSET,
                  CLOCK_ISP_SIZE);
 
+    /* PCIe Root Complex */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->pcie_host), errp)) {
+        return;
+    }
+    /* RC registers region */
+    regs_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pcie_host), 0);
+    memory_region_add_subregion(&s->peri_low_mr, PCIE_RC_OFFSET, regs_mr);
+    /*
+     * MMIO region.
+     *
+     * The BCM2711 PCIe controller translates addresses between the ARM and
+     * PCI address spaces: the DTB declares CPU 0x600000000 as mapping to PCI
+     * 0xc0000000. Map an alias of the PCI window starting at that PCI offset
+     * so accesses land on the right addresses; mapping the window directly
+     * would expose PCI address 0 at the ARM base instead, and every BAR
+     * behind the root port would be read at the wrong address.
+     */
+    mmio_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pcie_host), 1);
+    memory_region_init_alias(&s->pcie_mmio_alias, OBJECT(s),
+                             "bcm2838_pcie_mmio_alias", mmio_mr,
+                             PCIE_MMIO_OFFSET, PCIE_MMIO_SIZE);
+    memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
+                                &s->pcie_mmio_alias);
+
     /* GPIO */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 06aeb8db01..038eefb234 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -64,7 +64,6 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
 
     /* Temporarily disable following devices until they are implemented */
     const char *nodes_to_remove[] = {
-        "brcm,bcm2711-pcie",
         "brcm,bcm2711-rng200",
         "brcm,bcm2711-thermal",
         "brcm,bcm2711-genet-v5",
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 0be97e67c7..7fe92789e8 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -10,6 +10,7 @@
 #define BCM2838_PERIPHERALS_H
 
 #include "hw/arm/bcm2835_peripherals.h"
+#include "hw/arm/bcm2838_pcie.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
 
@@ -65,6 +66,8 @@ struct BCM2838PeripheralState {
     MemoryRegion mphi_mr_alias;
 
     SDHCIState emmc2;
+    MemoryRegion pcie_mmio_alias;
+    BCM2838PcieHostState pcie_host;
     BCM2838GpioState gpio;
 
     OrIRQState mmc_irq_orgate;
-- 
2.47.1



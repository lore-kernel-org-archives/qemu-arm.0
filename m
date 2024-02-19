Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp424575ejb;
        Sun, 18 Feb 2024 17:22:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcjeZAJI6bizOrPMUEoVsTYPia823qFEHgu3W7Ov3+ovGZi4sHry+DJC8SwiULrabjyeox/t++BjVexfOjqkZR863Oc3Rm
X-Google-Smtp-Source: AGHT+IGApmpxq5daJ//QAoPrk7h40uE7UL3HJtGrU5gvgXi5B3Tz2VIXilcuBTOlwRzK6VjXazcz
X-Received: by 2002:a05:620a:34a:b0:787:2b66:a088 with SMTP id t10-20020a05620a034a00b007872b66a088mr12251459qkm.1.1708305742843;
        Sun, 18 Feb 2024 17:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305742; cv=none;
        d=google.com; s=arc-20160816;
        b=hyB251UW0tx1ReutEAJlrk1GZ5sRgrHDN3n+ruv4JAaJbEquRs6nIGdWddcn2/5Egu
         8aZQ3RzOLbG9Dbr8x0DnPFMflZkR32w6qTdwIPfQsXeNZo73fwPtkE6WYhwcvs37g7JL
         QxG5R7D7BYwh83Su6YMhTP6hh+b+4fywe2cfX/w5FLDPufMaqWnIcmxN7hfYmRaKOaMU
         qX2GVjtvJbxhlTC8I73QJv1N5RTuW1YFpV4qPvTQdrUB2DhsxQfYMh9Dc9XCkjtVbyaH
         dx8LOVrNhky2QlL6xrAXot8R8a1+f+Sjy6mm39/asTN4VV6IBt6k6ZyCJjo3+M2SpHDN
         rmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=stiEOlRkRXhmxahSJK9Jfc3pwjVA9/BcAdFAWXFMkus=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=pkAbOPlFZx+wd5hMiWjOSXnpzd/4awU/Dq7BCIhhErC3fDQVcAAbH6kWrUOHjJX3qL
         75ka8OIdae0QaRuRh85o8gmRTAZ6cq3U8w1GfExxH9tJUwSaCq9b8owaw1WVU7pkBTYU
         kK89e9zCnmRy40vpml6CuvCp1hvWZYZ7STMNRayb2kBw66794Ol8q0yiB5igDM8yyvJI
         L9fdij376npmEbN7w6bU0AbkHJ1gaR0SS0g4m0EzyH93Lp0kevCFUe0NZH4302LOiSnE
         QjT5GYnwAKh/yhO17uHBiq2c/y4yxCgvd2qvwPpxfun9RsQN99ZHtuBko073NAxRq+BK
         W4kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGs0Wxc9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a14aa00b0078730b26229si5381174qkj.210.2024.02.18.17.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGs0Wxc9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rbsIy-0003zY-AS; Sun, 18 Feb 2024 20:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIO-0003MW-2q; Sun, 18 Feb 2024 20:18:12 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsII-0004Gy-Qd; Sun, 18 Feb 2024 20:18:08 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-607f8482b88so22612977b3.0; 
 Sun, 18 Feb 2024 17:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305485; x=1708910285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stiEOlRkRXhmxahSJK9Jfc3pwjVA9/BcAdFAWXFMkus=;
 b=MGs0Wxc9KnhX8v1PTB/kY2b6OfExKIWbQYTBbtaFRIYBxF1m/3lS9iIDwli9BIgvdI
 qSYDVRrbTUSfC2nQOthRph3ISqk0KDNVoW34EUlMLe/4tvwafcFQ7dgN81EgfXSPWOw7
 8CadhLlzaggdwPM+YyyYSZqFpwBD1vYFEMNSKAGVI3wpclcpGEpg7FoPjBv92HClXdbM
 Om5D/SuOEv3H+SRUHFgqMQEOxNyFBtcKW+VNSM1qNritacdq8MBHGWTftMp2IiRU+0Q0
 zgJRnahRxscx9HICt12zAa1JgqhiEo6bPatLg3qlwXzEjHQPc+HONhzYdntF0FEaN/ZO
 zVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305485; x=1708910285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=stiEOlRkRXhmxahSJK9Jfc3pwjVA9/BcAdFAWXFMkus=;
 b=t9DiMcC6tkaQrL2LcYLvRcXw2WBbp2ouPo8dSnA0oUxLB8f/FJjBPLn6uD5hq6MZHT
 /D0oV7KLdQNz1yb3BQeuDO/eqobqkr8wxYQDHQDdYeICLW1odUp6bhMj5mymvaG1h7i1
 MJlNyuXVUhtlW85f9MU5FWFVeb4fCrEZwe7pkT4zjSeg0NZHiWWH7uhXUQBSOG30h4rO
 bZXU2kYb4uQB1hRB1nz7m++kN1kpA/m28EkUeR5IOnCIczgFyqkVYYcJyLCeN2skBDYq
 XbF1eg/akvHXJldHH9V7TLSXTJoBfIBMrC8+axAIOUEpj7dzdW+D5TNRLXS3fu9u3JoB
 iYXw==
X-Gm-Message-State: AOJu0YzC2JmASnvQINpNMrwOWkc8cG1ixPEG/0kfKVgA9US6PT4v3cnH
 j8IHG1ZRlTkq5ghyc9HEUONUx/nXnHJ479x3HrwMMDeGTon9uWdyZJ3sAAyFMW8=
X-Received: by 2002:a05:690c:93:b0:607:d5c7:6a8a with SMTP id
 be19-20020a05690c009300b00607d5c76a8amr12766148ywb.25.1708305485094; 
 Sun, 18 Feb 2024 17:18:05 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:04 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 15/41] Enable BCM2838 PCIE
Date: Sun, 18 Feb 2024 19:17:13 -0600
Message-Id: <20240219011739.2316619-16-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1132.google.com
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
X-TUID: oNB+e/4AdAJI

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838.c                     |  9 +++++++++
 hw/arm/bcm2838_peripherals.c         | 23 +++++++++++++++++++++++
 hw/arm/meson.build                   |  7 ++++---
 hw/arm/raspi4b.c                     |  1 -
 include/hw/arm/bcm2838_peripherals.h |  2 ++
 5 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index ddb7c5f757..481b262b02 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -226,6 +226,15 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
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
index ca2f37b260..7e86ebb555 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -12,6 +12,11 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/arm/bcm2838_peripherals.h"
 
+#define PCIE_RC_OFFSET          0x1500000
+#define PCIE_MMIO_OFFSET        0xc0000000
+#define PCIE_MMIO_ARM_OFFSET    0x600000000
+#define PCIE_MMIO_SIZE          0x40000000
+
 /* Lower peripheral base address on the VC (GPU) system bus */
 #define BCM2838_VC_PERI_LOW_BASE 0x7c000000
 
@@ -29,6 +34,10 @@ static void bcm2838_peripherals_init(Object *obj)
                        bc->peri_low_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_low_mr);
 
+    /* PCIe Host Bridge */
+    object_initialize_child(obj, "pcie-host", &s->pcie_host,
+                            TYPE_BCM2838_PCIE_HOST);
+
     /* Extended Mass Media Controller 2 */
     object_initialize_child(obj, "emmc2", &s->emmc2, TYPE_SYSBUS_SDHCI);
 
@@ -64,6 +73,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     MemoryRegion *mphi_mr;
     BCM2838PeripheralState *s = BCM2838_PERIPHERALS(dev);
     BCMSocPeripheralBaseState *s_base = BCM_SOC_PERIPHERALS_BASE(dev);
+    MemoryRegion *regs_mr;
+    MemoryRegion *mmio_mr;
+
     int n;
 
     bcm_soc_peripherals_common_realize(dev, errp);
@@ -175,6 +187,17 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
                              BCM2838_MPHI_SIZE);
     memory_region_add_subregion(&s_base->peri_mr, BCM2838_MPHI_OFFSET,
                                 &s->mphi_mr_alias);
+    /* PCIe Root Complex */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->pcie_host), errp)) {
+        return;
+    }
+    /* RC registers region */
+    regs_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pcie_host), 0);
+    memory_region_add_subregion(&s->peri_low_mr, PCIE_RC_OFFSET, regs_mr);
+    /* MMIO region */
+    mmio_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pcie_host), 1);
+    memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
+                                mmio_mr);
 
     /* GPIO */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 39f6df7431..4d11ec0eae 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -32,7 +32,6 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bana
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files(
   'bcm2838.c',
-  'bcm2838_pcie.c',
   'raspi4b.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
@@ -70,8 +69,10 @@ system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 system_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 system_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap2.c'))
-system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
-system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2838_peripherals.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files(
+    'bcm2835_peripherals.c',
+    'bcm2838_peripherals.c',
+    'bcm2838_pcie.c'))
 system_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
 system_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 system_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 49dec6e53a..2431b0b8c3 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -67,7 +67,6 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
 
     /* Temporarily disable following devices until they are implemented */
     const char *nodes_to_remove[] = {
-        "brcm,bcm2711-pcie",
         "brcm,bcm2711-rng200",
         "brcm,bcm2711-thermal",
         "brcm,bcm2711-genet-v5",
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index af085934c9..bbd8387cff 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -10,6 +10,7 @@
 #define BCM2838_PERIPHERALS_H
 
 #include "hw/arm/bcm2835_peripherals.h"
+#include "hw/arm/bcm2838_pcie.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
 
@@ -64,6 +65,7 @@ struct BCM2838PeripheralState {
     MemoryRegion mphi_mr_alias;
 
     SDHCIState emmc2;
+    BCM2838PcieHostState pcie_host;
     BCM2838GpioState gpio;
 
     OrIRQState mmc_irq_orgate;
-- 
2.34.1


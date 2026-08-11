Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F48C5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:40:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnas-00015L-L3; Tue, 11 Aug 2026 10:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaU-0000Jv-TQ
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:21 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaR-0001vL-C8
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:18 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-8ef1dc934d1so8194656d6.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458974; x=1787063774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZqAgbrrx/Se7VyDdoTAUZkumPcNidkyq5uRNc6l2ZDI=;
 b=CGIPTVaA25VFeCTiXzlA23CaKjoDbn4cLt+ILW7NnTHEHFzuR22M989t2LgI9LvIwb
 9AqrFeHm10z3KP4fc51HTpy4aAvFRefojYB/Zsf4fpNWUJ/OYU0i5o0tQMTDTxrEVj39
 k7XU2Kpq6Yvl/72sdVJm8IB28xfmeNErwvrTlN/TekM+Cp8Zs/QffyBJGch1HUrenTK/
 FQV4/R3C3Iw70UUp3Qqup+/E4myoNooJmHHpHopx40okKkXnbn33OCJ8JihE+P7wWdCu
 b7amoDlpBUVVx7yq0CW53ufMEUawQZJq52X3d8Mu0ISB08V/zaR88JeE5BdYMGrix4I0
 vW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458974; x=1787063774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZqAgbrrx/Se7VyDdoTAUZkumPcNidkyq5uRNc6l2ZDI=;
 b=UqkImIv2vkJqk0Pq3mwKpfZKm8nJnsIpBpLp4S5gIYWXhc58rlpwekB2xcF1hsN/hN
 y4mx9mZhCc2BHRxBb7/DICy3mxkpCoibQjR1tFlmuMDKxwI9+3ZFGKIc1o4Qpst9FeG7
 cXAU+M50odDqcjgGWck0phebh078RpSQhdg8Do9EqU84pqoChAjR0JjniAVyOZA2CgRd
 +iZpjrxsB3EnTz4Nl24gCb9JG/dbzZ2BTJ2vauDsIe4sN5KX3VdTcUnNQOysCcd3aSQk
 j0nHR4OT+Q2a7uI0cr+0x2SuaN5SlJggQr8VOLXL1Lw74ltZExOt84nXGFHoBllyGiuA
 yD0g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpoLdnl6kJTHNFs4Zth25K8aiT4FEzVCq0GvAWXYFi2yA1hGSYBn7+7xoM1wXL9eBIt35CBD5yhig==@nongnu.org
X-Gm-Message-State: AOJu0Yzq58L2DIFcTnH0we8RSYrN/o3l1sZoSRXz7q7cMIu+3IpG30WZ
 EcqhqZMC4ba73sG2dyFixsJsYuI0E+7K1GWQq8/3Qo0pWY4F6tbzPxi/oW39CQ==
X-Gm-Gg: AR+sD12Glv9O9ef2E0aSYctAxcwZ0buvJSUut+nl6DoqDR4Cf7N0ZmyP07YdvD3SWw3
 Xoz03eTGWqSHfdLKjJj37cgEIreZo1edtyLAAnjqv0L1/bKpLKfpcEi1YfwgKN1z7kbBLI/Imdq
 Dh3AlVYMXGYhLkn3tliscqocNt+gwFfbLVSdNVldt7GGYoN/qAh3vf8eT17leL2ldF2MeqIGdHL
 mpDz22ZvPdaoTxBenjHkzokiRPOHzm6HgtYaFP0Liighf15gwxNI2sN7/52rtt4S/8o4mZyz1gh
 Z2YkKO0tVUOb4bDnTbYgIxPf3Y363GmcpZ8GdF4W8y901kZdol8ZCh3hMXpIemghdFzvJTaRysT
 mHjxdE9LyHA/H4eJFzE1AE85wS8V4ff8qi61XTwbSZrpIX1sCX1gcnRI/Bb69M5/gqkiVXYCnsu
 3vbpDiXMm0wLwYCnnu6gVw95z5U/GlSUbz2SkngebWzA7pIt+8suWQhcsdO6Re8hh0w6VTQAhKV
 CPCOmih6sQKlpanf3k=
X-Received: by 2002:a05:6214:1306:b0:8ee:d9b8:8538 with SMTP id
 6a1803df08f44-90a6c0f994fmr4174626d6.9.1786458974473; 
 Tue, 11 Aug 2026 07:36:14 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c26e074sm681286d6.2.2026.08.11.07.36.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:36:14 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 14/19] hw/arm/bcm2838: enable BCM2838 GENET controller
Date: Tue, 11 Aug 2026 10:35:51 -0400
Message-ID: <20260811143557.7862-15-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2c.google.com
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

Wire the BCM2838 GENET device (added in the previous patches) into
the SoC: instantiate it in the peripherals block with
qemu_configure_nic_device() so it picks up a -nic/-netdev from the
command line, map its register region at the real BCM2711 physical
offset, and route its two interrupt lines through the GIC. Also stop
raspi4b from masking out the "brcm,bcm2711-genet-v5" device-tree
node, now that the controller it describes is actually implemented.

Adapted from patches 19-29/41 of Sergey Kambalin's Raspberry Pi 4B
series (patchwork series 829638) against current QEMU master.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/arm/bcm2838.c                     |  6 ++++++
 hw/arm/bcm2838_peripherals.c         | 11 +++++++++++
 hw/arm/raspi4b.c                     |  1 -
 include/hw/arm/bcm2838_peripherals.h |  2 ++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index fc56f87934..f47b96c3bf 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -239,6 +239,12 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
                                       int_n);
     }
 
+    /* Connect Gigabit Ethernet controller to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps->genet), 0,
+                       qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_GENET_A));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps->genet), 1,
+                       qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_GENET_B));
+
     /* Pass through inbound GPIO lines to the GIC */
     qdev_init_gpio_in(dev, bcm2838_gic_set_irq, GIC_NUM_IRQS);
 
diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index d923ba968a..012a4567e7 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -44,6 +44,10 @@ static void bcm2838_peripherals_init(Object *obj)
     object_initialize_child(obj, "pcie-host", &s->pcie_host,
                             TYPE_BCM2838_PCIE_HOST);
 
+    /* Gigabit Ethernet */
+    object_initialize_child(obj, "genet", &s->genet, TYPE_BCM2838_GENET);
+    qemu_configure_nic_device(DEVICE(&s->genet), true, NULL);
+
     /* GPIO */
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_BCM2838_GPIO);
 
@@ -217,6 +221,13 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
                                 &s->pcie_mmio_alias);
 
+    /* Gigabit Ethernet */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->genet), errp)) {
+        return;
+    }
+    regs_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->genet), 0);
+    memory_region_add_subregion(&s->peri_low_mr, GENET_OFFSET, regs_mr);
+
     /* GPIO */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 038eefb234..79f60932f7 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -66,7 +66,6 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
     const char *nodes_to_remove[] = {
         "brcm,bcm2711-rng200",
         "brcm,bcm2711-thermal",
-        "brcm,bcm2711-genet-v5",
     };
 
     for (int i = 0; i < ARRAY_SIZE(nodes_to_remove); i++) {
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 2a4307bed7..deddab50d2 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -11,6 +11,7 @@
 
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/arm/bcm2838_pcie.h"
+#include "hw/net/bcm2838_genet.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
 
@@ -70,6 +71,7 @@ struct BCM2838PeripheralState {
     SDHCIState emmc2;
     MemoryRegion pcie_mmio_alias;
     BCM2838PcieHostState pcie_host;
+    BCM2838GenetState genet;
     BCM2838GpioState gpio;
 
     OrIRQState mmc_irq_orgate;
-- 
2.47.1



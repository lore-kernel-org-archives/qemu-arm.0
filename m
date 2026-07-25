Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F49FC531FC
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 01:02:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnQlT-0000sm-Vt; Fri, 24 Jul 2026 21:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQTP-00070v-NN
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:39 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQTO-0000r4-1p
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:39 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-736eea06c3eso384528137.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 17:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784940157; x=1785544957; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1U3fZj9dgRgALDfDMiL9lvcCJHyc0ghvPvHqdJct8fQ=;
 b=Bw5Fn5Rh22FyRjT++bjqUHZVLfazzf0yytVolvYz0lJN2yXKbIre6yFVlJjgcx8uMv
 0ZZYwZAZ8eQXp8AcABkGqNPa8p3IRPpvDJ8WSW1N+Tle8P7QJATpmyMcs3YWIyrhVqfd
 TOVVH3rp8I6YGh8fcJmGmo6giaySdV41/3enVzO2yEVpl5JbRAH34GBCROvLU+jJtIZn
 nAa4Pe6H6+sG0cLnHYOBdGtcKOvUHoIe/44Y/GBi8emS9XRsln5clT3QZypyBjji8Yyh
 VFYqoyaJPHmbSr2CYs0/beJBHEoddiWkZbhJp9ASxRovD0VRF7S0nOb8ZMuuhGy1KRr3
 iiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784940157; x=1785544957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1U3fZj9dgRgALDfDMiL9lvcCJHyc0ghvPvHqdJct8fQ=;
 b=k0sE3NNXXIM5M3WG1+8kOvGekLSq9mwikIzUlGVQoYpbFL58+T0/doTbymccmVNvGo
 p/BRnlUz02scPiaGc/gEEIuj3iLsSH6mdyuD63sc8/GVurcA+NE0AfafQztusj98NVDa
 pJ480cVBswtXOXn5FbfEiUXrALWQfSMjcHjjMYatnUmamWJrLyG05U+I06cyiCeeWfKR
 enOvPTwiTMVUDuEy+yaO8qE2SrSNHU40QhUSqPhVwnD5qfp05nMweegTeVstzJFBXnF9
 xR1jri+26kkBdMzJszkqF13UZHDYHszr/igkmPmJwCYuiLab0AXp++JACZoY7C9sbA1H
 YjTA==
X-Gm-Message-State: AOJu0YzelpchFjKYrsktF5ycrtTbqJ7quBedbtQCfS+D3aVZ8j1+s2/h
 MAnEjtAO8N4yiB3llC15be3dAVw87WVcJCjkgVQWcGextz5gGX3LireE
X-Gm-Gg: AR+sD13/Tc3CLxCOujNzIDF34zQfXtgckTaoWYShBdRf+5YX9UqNf16ejzaoPlYpNH0
 3fjIPZVdqJzGBzJhxa7XUp7eEJpbnjSvZCCDua2CHhLH5h34w/77IlxM4o9ttMHEdUVTAbEp6Rg
 6ekxlM5zpGkvfs/U9dGA2di8VhQCRJOd3g0lMTyZcMDf2oTqMTvX3FSU3bMwbHgZkKeBeYA/owX
 eD9F1EnlbM+XiPYI398CJoaN566O3yD3zWyLr54VRrH/JhX5e5jTEbs7j6DmRmmJta146WRtATu
 0xhcFpl3FXzpo1UVPuwN2d50XN8ZOgwX7nYycWTbgI7DOUENm57JGF4Uuv+dHr9kQlvbk/mChHk
 pOdGg8mfZDcW9dYITKQCYADf7jVq3q9w4t5+goCBgCl21+SmP6QsKTDca7sYZwyfibWLncVW085
 kMgeNAJClwvOWWz0dWFTx3wFW8fvXZ2hmS
X-Received: by 2002:a05:6102:149a:b0:745:6721:8c2e with SMTP id
 ada2fe7eead31-7503df5cc2dmr710793137.2.1784940156893; 
 Fri, 24 Jul 2026 17:42:36 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-97774f12690sm930591241.12.2026.07.24.17.42.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jul 2026 17:42:36 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jason Wang <jasowangio@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 14/19] hw/arm/bcm2838: enable BCM2838 GENET controller
Date: Fri, 24 Jul 2026 20:42:13 -0400
Message-ID: <20260725004219.66222-15-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260725004219.66222-1-marcelomanzo@gmail.com>
References: <20260725004219.66222-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 21:00:28 -0400
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
index fc56f879..f47b96c3 100644
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
index f71937ae..de49f48b 100644
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
 
@@ -205,6 +209,13 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
                                 mmio_mr);
 
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
index 038eefb2..79f60932 100644
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
index 903970a3..5da340f2 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -11,6 +11,7 @@
 
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/arm/bcm2838_pcie.h"
+#include "hw/net/bcm2838_genet.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
 
@@ -69,6 +70,7 @@ struct BCM2838PeripheralState {
 
     SDHCIState emmc2;
     BCM2838PcieHostState pcie_host;
+    BCM2838GenetState genet;
     BCM2838GpioState gpio;
 
     OrIRQState mmc_irq_orgate;
-- 
2.47.1



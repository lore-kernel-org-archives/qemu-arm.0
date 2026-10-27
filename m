Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D385606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj+xSFOJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLiDQ-00081H-34; Tue, 27 Oct 2026 10:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCg-0007KJ-IZ
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:31:13 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCe-0005C0-Rn
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:31:06 -0400
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-93f2b8cf037so358845685a.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793111463; x=1793716263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BJsB6fS6z4gzM4CvmbXU27cB5kn+bKI9xPT6Y+2F2Zk=;
 b=Fj+xSFOJkOHNBc3d3Oay97fzxERrWJpUp+4xJFv3ZrKyCi1N/E0JCvUetPxpLmdYl/
 kRuAOfIE0Y0n/eoApW+npuZY8Y9ZXAi72PyjJQZ7WP0FCraUx8/d1ZOADJFwhkpB0PgW
 +Uhl3bQHg5oddnwMCcDVRfUhLr8SBnan73d7tlgie72mOzqfnoeRU9qps7xRs5+KNnpL
 xAnIYNdi86jHi48ejnDO6LsizORnq+DS5HU6oTfnKF9KpgdaTUL3NeVGctetKcWsCe7i
 fLRUFS8883L+Wb81AN4/zTj91L8KZw6oRJjnayrooR8wMfbed1EZ5saTkH7dTE3cQOhg
 rQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793111463; x=1793716263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BJsB6fS6z4gzM4CvmbXU27cB5kn+bKI9xPT6Y+2F2Zk=;
 b=lMGJ3DAd0Y4sb+utCRL8xhaOEfG4vY/zEIT26eKlQdIqhkpotQMPTxHat3UKcB0MJ7
 X/c0OZsz/sMhn+IvqOm/+tCwg5ZWesgtFi38Rrq3ih4ew74CgTsufwecP5J0CMJCvNux
 RXev15bQKjujmUsxwxf+2WKjvnRl/GQQpc32CJpAzWJcouxmdqv9+vEUoVvKGtuqqabe
 WZGIOeqMZmkn3CBY+NBZJsWfj1wq29m6KVvGCRPhHIbxPaY4HCjMq5pBc6efrKZAcDfb
 XTQOwDEe8rLS/IXSFewughOmv3ijRJo75pBi4l7j/oSxLzb0dbRXrzVRh5TF4QVKBAil
 0Tdw==
X-Gm-Message-State: AFq9FYK07HTnqFtQD9pzC4YPQhQEs4Oat4LgVGKqoyuuOI8kg4n75qQQ
 d7IjnB+zlkleuV3gBCxcDo07l14xiIgNRQ4evPiQwo5M29VwjfQS3RHxfVCcKU81
X-Gm-Gg: AYBFou0kaKgy+Xq3mc3vLSX4XuAFBESHsHb9Srsp+jagYWi+dDoF9Bbt6y0/awaYpGn
 xwMpnK/iNJA1Nk9mH3swwKTM+dBtqxJ6H1ozrmlVhdwNfy5g9aGL8JvL/RemVqgHc70WuSjZkPR
 /G7nUJK05H5+7jgYk5nrWgOKJd0z+fUL/uei2hjAro64g8BHzQNXY70EHBHSxKCane+3lCroenJ
 mPZqR9lGNg5slrrmRi1cjABfWq2e+6ycRIV409/l+Q2hAwT1biwqqKFCrwjbuWoj+IdoG9l5DhO
 p4XKM7bliElH0ctYS9u2iBuEBEt7Qq+8QwkwsbDzhI+bWitEz9vjX8gR6a80vdJo35AHrivgHva
 xuvTZV2gDP2qYnIbU202aIERVnW2UBMPm/ZiM4qcWrGCD63TSAp41U1ukoAOAHgIOvXatVl2fYn
 BNBeC30wQ1g0Fhx4nUh8pPH0N5+sxkYPh45yv8wKFej6PQJYxNXbnWd44JGZP1qw5WHdPNTL78Q
 +VHMkZfR00Yj/sk+BNAhjaQhFXqzqgrE9yue/0rZH2joGW8O9UmpF8MHEJxlOZlbsNT/uf9UcYF
 02MaeDtF8JxXQDAy+IZC382M/noTZoM5zMhhWzMXldD9hLP78zIdZcW5//Ax5ijHbgOYDKWBFaF
 3UV4/OXIcCKG4j9BzTUJ5Sr50
X-Received: by 2002:a05:620a:4001:b0:939:7fc4:fb1a with SMTP id
 af79cd13be357-940ef9021e7mr1444893085a.27.1793111463152; 
 Tue, 27 Oct 2026 07:31:03 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:9872:3600:589:5f3a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f0a78c06sm986400885a.35.2026.10.27.07.31.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Oct 2026 07:31:02 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v6 15/17] hw/arm/bcm2838: enable BCM2838 GENET controller
Date: Tue, 27 Oct 2026 10:30:34 -0400
Message-ID: <20261027143036.44973-16-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027143036.44973-1-marcelomanzo@gmail.com>
References: <20261027143036.44973-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2838.c                     |  6 ++++++
 hw/arm/bcm2838_peripherals.c         | 11 +++++++++++
 hw/arm/raspi4b.c                     |  1 -
 include/hw/arm/bcm2838_peripherals.h |  2 ++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index 8f8e107c56..f0076a08ce 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -237,6 +237,12 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(gicdev, int_n));
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
index 931f2cca67..6076b43922 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -65,7 +65,6 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
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
2.55.0



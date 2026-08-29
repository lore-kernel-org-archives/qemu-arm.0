Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5490C61DBE
	for <qemu-arm@archiver.kernel.org>; Sat, 29 Aug 2026 12:56:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0IbS-0001Wr-9m; Sat, 29 Aug 2026 08:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x0IbR-0001WC-6P
 for qemu-arm@nongnu.org; Sat, 29 Aug 2026 08:56:09 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x0IbP-00021T-52
 for qemu-arm@nongnu.org; Sat, 29 Aug 2026 08:56:08 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5b4a9994c20so1849061e87.0
 for <qemu-arm@nongnu.org>; Sat, 29 Aug 2026 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788008165; x=1788612965; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=n+bFI7NMOKFyTqZjD2J643gd9nkuw7CEQP5XcBksxKI=;
 b=MuzSJwlhESODcvR5nPs0HmZ2W+otvkelkG0uu/3RRyRSBVp+J1zN3geryXQ9luBBNp
 3VsILVMTqqKa0y2EJGQ+CcacPS6c5PE/nFi/bAiV7e8W7NBexqJmFvn4LmamMKOgr5+s
 /yzo+ZEjjVyIH0gGuqpiRE35N9xh1TUNSK++Vcm2aPtzevjdRCdo8Lq4tjHE32uAPvS2
 V3yGWop+zcDCSfh1kKGyc0d6rGHvaXx96opLfHDv61JQc3PFoWGRfebpTjgJEn1YMKpd
 rcw9OsC2ishL/CpklT3fHATF2z1bPh6cCwgmqqU1OfDDW7n/0pHcgqehAE62AzD2mh5z
 Y/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788008165; x=1788612965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=n+bFI7NMOKFyTqZjD2J643gd9nkuw7CEQP5XcBksxKI=;
 b=jJs6ECUiiCUk5oRJH3EJrtac6lXLEDV11+UdZRxZow3iIhB8avI75utmMAbMFgsKpm
 bVUFbhRo+usQ7KGkxvLKVKuk7Vn+AzeUQop28xxY6/cRqOzTWESSCeOTXviccEZTLa9w
 +4s8K7I1SJ3Lw7nciJ00iTyUz6LfAGkSQy0upwVTHXIoAkscHSuqkbhxVHwiV7AcNsW4
 rjbG35fc5wZnzIUq5tRu9abrxIHMcLQWp1YRQ2y4kmfhRB+1EwMcBO2A9oncK1e0bXKe
 LbuMhZDiLxjMThvsFWgxMhspNXRLmgYTA7oRq2HcSWKB+Pcvf1nmSFAsmasb2zKlG3Zz
 ZEXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxusfWpeSXbzinZDTZKsfmhzIntRZaw09CpqfH/5iaJKK8OJ4f7OdDNK+pTvJenp5Kfr/6CXzm5iA==@nongnu.org
X-Gm-Message-State: AFuF++k6McJZuNRhTPgvB3Cklsrq8Fi1K5GgDWpW8YRB2neI2Sm6EbmO
 YlVL838D3M8NGw9t5ww6f358Z3X9mAXT+608veXWQt74+jqTqsKkLf4C
X-Gm-Gg: AYBFou0ZvfoHu2ed6apTtzli90qPOeCXZyAKNGUOYMOpxASVc0d6kV4CJVDE3TdWvmX
 dOVItdzWPUZ7IbKRuu2SG1FDhLqiadhdSqxoR81tn2n+L0C8SU0uXg0MC8VZ4AVE1ot9BgksZ32
 taiycNaYmX9Ejj/S0PnbzbeR4PxsDPxbAhbpeVLJlQYo5x2fEy8EDtCwRLqtMhhItsCXZW/jWsK
 8bC+sShtNYvQVwtKrEdBi1uZCFk1e24fPauS8LM9DiFNTNVSfQ9SGeVE5oRlORQBdTeJqKtCgr7
 fS7dWUz2xXasBh4WahykJvO+CQlDS9YXkM6WqgNOwXh8G3oQRj9FQQCLs/6iaktlHN/33FMfxqY
 n3V7LWJR1eScshRMFsNCKZDZNP2W4Nr64Nk4p1jAl1EMFh7MNqjux18KqCjXI+zV8dW3sYeG1ZK
 VeE5PKE1Cr9wvcTc44iJsH3ZVBzjffh2ZFRNfB3C/5RL+Vfk5Ee8OsVYJLfAo2E/6z2v2+pvJ58
 qHQAgA7OMXYPPdWT2/JagBnfv4H7CUiwVHRXpKOb3K4G8pO
X-Received: by 2002:a05:6512:3b8f:b0:5b5:e2f1:e6f9 with SMTP id
 2adb3069b0e04-5b5e68bc823mr4450450e87.11.1788008164992; 
 Sat, 29 Aug 2026 05:56:04 -0700 (PDT)
Received: from [192.168.31.141] (213-65-111-204-no600.tbcn.telia.com.
 [213.65.111.204]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b5e8a0ce42sm968866e87.57.2026.08.29.05.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2026 05:56:04 -0700 (PDT)
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Date: Sat, 29 Aug 2026 14:55:44 +0200
Subject: [PATCH v2 2/3] hw/arm: Add GPIO to Allwinner A10 model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-allwinner-gpio-v2-2-f0ebcb07302e@gmail.com>
References: <20260829-allwinner-gpio-v2-0-f0ebcb07302e@gmail.com>
In-Reply-To: <20260829-allwinner-gpio-v2-0-f0ebcb07302e@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Jack wang <163wangjack@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
X-Mailer: b4 0.14.3
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=strahinja.p.jankovic@gmail.com; helo=mail-lf1-x12b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The Allwinner A10 GPIO is added to the Allwinner A10
description, so it is available when Cubieboard is emulated.

Update the documentation for Cubieboard to indicate GPIO availability.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 docs/system/arm/cubieboard.rst | 1 +
 hw/arm/Kconfig                 | 1 +
 hw/arm/allwinner-a10.c         | 8 ++++++++
 include/hw/arm/allwinner-a10.h | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
index 90d24c73a1..ee9f489ead 100644
--- a/docs/system/arm/cubieboard.rst
+++ b/docs/system/arm/cubieboard.rst
@@ -12,6 +12,7 @@ Emulated devices:
 - RTC
 - EMAC
 - SDHCI
+- GPIO
 - USB controller
 - SATA controller
 - TWI (I2C) controller
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 260d2f0751..6d326746c9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -311,6 +311,7 @@ config ALLWINNER_A10
     select ALLWINNER_EMAC
     select ALLWINNER_I2C
     select ALLWINNER_A10_SPI
+    select ALLWINNER_GPIO
     select AXP2XX_PMU
     select SERIAL_MM
     select UNIMP
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 66f30757dd..66fe484ae0 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -41,6 +41,7 @@
 #define AW_A10_EHCI_BASE        0x01c14000
 #define AW_A10_OHCI_BASE        0x01c14400
 #define AW_A10_SATA_BASE        0x01c18000
+#define AW_A10_GPIO_BASE        0x01c20800
 #define AW_A10_WDT_BASE         0x01c20c90
 #define AW_A10_RTC_BASE         0x01c20d00
 #define AW_A10_I2C0_BASE        0x01c2ac00
@@ -83,6 +84,8 @@ static void aw_a10_init(Object *obj)
 
     object_initialize_child(obj, "spi0", &s->spi0, TYPE_AW_A10_SPI);
 
+    object_initialize_child(obj, "gpio", &s->gpio, TYPE_AW_GPIO);
+
     for (size_t i = 0; i < AW_A10_NUM_USB; i++) {
         object_initialize_child(obj, "ehci[*]", &s->ehci[i],
                                 TYPE_PLATFORM_EHCI);
@@ -203,6 +206,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi0), 0, AW_A10_SPI0_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi0), 0, qdev_get_gpio_in(dev, 10));
 
+    /* GPIO */
+    sysbus_realize(SYS_BUS_DEVICE(&s->gpio), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, AW_A10_GPIO_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0, qdev_get_gpio_in(dev, 28));
+
     /* WDT */
     sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0, AW_A10_WDT_BASE, 1);
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 445ba1be21..8b7736c7bd 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -13,6 +13,7 @@
 #include "hw/misc/allwinner-a10-dramc.h"
 #include "hw/i2c/allwinner-i2c.h"
 #include "hw/ssi/allwinner-a10-spi.h"
+#include "hw/gpio/allwinner-gpio.h"
 #include "hw/watchdog/allwinner-wdt.h"
 #include "system/block-backend.h"
 
@@ -42,6 +43,7 @@ struct AwA10State {
     AwSdHostState mmc0;
     AWI2CState i2c0;
     AWA10SPIState spi0;
+    AWGPIOState gpio;
     AwRtcState rtc;
     AwWdtState wdt;
     MemoryRegion sram_a;

-- 
2.55.0



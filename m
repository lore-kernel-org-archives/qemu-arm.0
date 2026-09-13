Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FD0C88E63
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Sep 2026 18:18:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5omF-0005jE-Bk; Sun, 13 Sep 2026 14:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x5omB-0005i3-G0
 for qemu-arm@nongnu.org; Sun, 13 Sep 2026 14:18:04 -0400
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x5om9-00022f-Ha
 for qemu-arm@nongnu.org; Sun, 13 Sep 2026 14:18:03 -0400
Received: by mail-lr2-x10.google.com with SMTP id
 38308e7fff4ca-3a2ff176d7eso12722371fa.3
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2026 11:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789323480; x=1789928280; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0HzlsMupkT43STyFi+zWkNuXYuyJLKJmneYJJfz5S2w=;
 b=q/CGLTR1J0WnvYWqhEiyaImmUIDO1gMeFTAAgoBeGnkZ5vW2Gyntlflcr1OKnXUL6Y
 doHwu+eFkbKFwOvC2Wo1ioRLGfwpN3FlGJwqayYzsVnh00g7hNJwSJy5AhIepswV5tIQ
 RcpWkg1OjJVzpIB5XMD1bY9I7GjmfFvRaC/4ttouXerYCmwOtZF4RyC+bwgdE0HOyQmQ
 GFuM8KEWjuqdAFGvvd8NPOpPm4qZhFEQZsaagDwxs1yPcC2UcmzqbOGBtU2gyIbvoU0/
 gTk0VR23m5WcswIEwJif1m7wr7TqIabiHplsdA4alYOUI11QLvxc+TQinJlQuw/IWQzk
 5DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789323480; x=1789928280;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0HzlsMupkT43STyFi+zWkNuXYuyJLKJmneYJJfz5S2w=;
 b=d5NpDjyXFWuzkzwWko5jRXnwhuLDl3b/AcS5u7eK5yi6kGECmSNCe0lxRXSWJFpqxK
 iwbhL5SsPhee1/iXRJZ7ESvYOxXMfkRC8wBjsBk32qWuI9MJU1wijsinzYjUyWfEo2Mo
 5laxu509igY7DzPR0NX5NqzwLbQ+fsHYWdY6VIxe9U0rrHpmhKIC8B2ZyKGSvqdfpD1L
 47+5zDjjzBqMaV6DX84SUP0vGIKy9F0THfmuNNeCrsk/D1Kzyjjh4CNRAEz0wJMxkErI
 SsObvPP9uk5fQTbnJMqNe33yuC9sPY7E4wxZT/03e3PxuFVkfRKmQAIwDylWFe35GQaf
 c1kg==
X-Forwarded-Encrypted: i=1;
 AKwUvByYWw13pg3i6hw/TKC+MLcKTEEN9CRl7u/bQjy3Ohaj1ksSX6x/4PiLR1ce24YDMIJ1nc2NCxLPUQ==@nongnu.org
X-Gm-Message-State: AFuF++nHcjjIbGI50fEq5PtThrcj91TVVAn7fRV3uX16k+wAnnRnjuGE
 HJ6Qfoce8NjN5ljcsr2g71VoGtWc8gLYLTxeFKqDuopLY9hSst8inV32
X-Gm-Gg: AYBFou05vGFHwMq9tVts1v9eK3wIsR7riRHk0udJkna4SWl/qIwNKIGDlo+koKVww9K
 hC+IbwZoTrmEDiTmG2wQG4CoFn6AN02qlfHa7ZJkIsrt3Pdfr80Rw9u/xghZkDTlZheQKKrqXaI
 n0qeRB1aDtP0pq8sQr6hNjdG9mzTfK1p4lL/xPDDDaNkc7Na1PbPwUR96ygL0nqIMzKyfSXvdrn
 IiZUGyCmYbd3+FZbJ3754cfTgQBKJUZILFnlHB4Uqf7zSzmRxnBeYWQDTPxAFl0FImelVXU1Lg9
 HcnxpthgpNukCgs8lww3dV/HULgb2QFrP2lWzfmaM/nmfd/u628iT+Vu3ucGKbn0SDI0AUXfJ2G
 ZKO+mOTVnDVA2+E7oaJLVO5+hFRNHhbaK2xQKrf2nflKbjuv8YuxtfcMd4ULzpSHUyVFjUcFJsQ
 +l5cUAlc9pZctBuDv0JZHnYGQTDDYoBQXHkxhRfNo7O4eBEyXweYBSdX+PArP/qYiaxA+ECy4m2
 mPwUjCUlsCVF2dJ7nGupcqiPLkZK2CvX1/TWLnA3U7H2ayvRA+osloiFb4=
X-Received: by 2002:a05:651c:1503:b0:3a4:99ed:beac with SMTP id
 38308e7fff4ca-3a5a51c9fc4mr37246061fa.4.1789323479624; 
 Sun, 13 Sep 2026 11:17:59 -0700 (PDT)
Received: from [192.168.31.141] (213-65-111-204-no600.tbcn.telia.com.
 [213.65.111.204]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a5a3326aecsm21122951fa.19.2026.09.13.11.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2026 11:17:59 -0700 (PDT)
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Date: Sun, 13 Sep 2026 20:17:31 +0200
Subject: [PATCH v3 2/3] hw/arm: Add GPIO to Allwinner A10 model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-allwinner-gpio-v3-2-a9affa474b3b@gmail.com>
References: <20260913-allwinner-gpio-v3-0-a9affa474b3b@gmail.com>
In-Reply-To: <20260913-allwinner-gpio-v3-0-a9affa474b3b@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Jack wang <163wangjack@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
X-Mailer: b4 0.14.3
Received-SPF: pass client-ip=2a00:1450:4864:38::10;
 envelope-from=strahinja.p.jankovic@gmail.com; helo=mail-lr2-x10.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index eae06369b0..4445f16f45 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -295,6 +295,7 @@ config ALLWINNER_A10
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



Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5253256lff;
        Mon, 16 Dec 2019 15:39:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzTFTsDXUdK5gU23PbjgELoct8j2zJTkmHC1476rOuQqRK0Jczd+pOAk6EPy34B4PVe6ZSz
X-Received: by 2002:ac8:34b5:: with SMTP id w50mr2010793qtb.107.1576539584944;
        Mon, 16 Dec 2019 15:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576539584; cv=none;
        d=google.com; s=arc-20160816;
        b=XH+BoptKU/64D27TMGClZk2KiQQRyG0k2FwjSAY6KlUWvPJ4mGJ3qHbSk6Al/9UHjU
         yLjJVlmybfAn8l4FuLiw/i6Nh0GcjL0x9TCTI6fXycMkXAbJ4145kRtkDS28iHbzlwha
         yAY/ll96Vz/Z5KSCMtJUWhgqUS8UGM8TqOSENnZ5z0ea5UOpS1ca9zqydepWkgZVfXkb
         rk3MCs/RUIJg/PHaXsXUvWp2RWO/3x1H+YcpCYOG8c3R4y1d6hASlLRir+n3Mh4G19xp
         YyXgRTOvylLMYja17pDQ0+u2hzh/KVE0KLdpETXG8Y7z5PPTKlgpHZDxNZe9+Agep2SS
         n5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=SmQGHNsBURH4ZGvWc+jJV85ra1jitK2x3YLYu4ESBHA=;
        b=p4OVc+lC/e/zC1j3t9p8pf8FVz+R6W+gNrZu+Wdn0NyJNxJM24gWB32ehH89KigVkL
         2hDs9UKxOrahQW87nkLWMRbm9iNES4+88wYCQf2p1YOdM1aCHDwegCRddWgEoMikXas6
         23hLen/DXp53L0J456J1qnfiFxohsAj5gU9r0I0+bN/J6ronE1Bjr243U3rQGBQn2WEY
         lbbDtse3CvhwiW/A5rohz1ymDSzlbBEPH4KSJWeIv5xsYEJKFnVEmgnQ+5R459rLz9Cn
         GkzVlOKzPNMYgJxLzMSSmenRXjM4e03x//WCL2z+sl7sKvmbArPNtYH/mMJGXxtYF0z3
         twVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eebgMRtO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si5795092qvx.115.2019.12.16.15.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 15:39:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eebgMRtO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igzxo-0003I9-3R
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 18:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1igzuE-0006aG-GK
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 18:36:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1igzuD-0002ef-5P
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 18:36:02 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40622)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1igzuC-0002dj-VS; Mon, 16 Dec 2019 18:36:01 -0500
Received: by mail-wm1-x342.google.com with SMTP id t14so1089575wmi.5;
 Mon, 16 Dec 2019 15:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SmQGHNsBURH4ZGvWc+jJV85ra1jitK2x3YLYu4ESBHA=;
 b=eebgMRtOxy/MIixwrQ7v/tJFD5RvEvCgFrI/G5lyGQjhVl2R/WPOL+SmDdH8JW5AOI
 v6Y/5KgLr4tseL8EduoDkw3k0d2kgLJjJgUGrm+VchDM9FiDkOA5bsJp5MA4p3EwxNDi
 LmrnxWtA7DnLR37goPp2BVCEWi4+z2kL9wReqzyhR3RoVdXGanmjoTkWenVCMAYzJ/XR
 kUN1qKvxy3lEnU66DyOPDY02JaASCf/IBByDhJ5f9P5owl8pDCpTSnDbmTeV/oAq+ehU
 5D0k+iJ2BP/ujHSOIlJAIs6DVNZjg7p1psrmK1/Bs9Zn15WZr4A8Pfmk1JTA1JW/ejyw
 Tamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SmQGHNsBURH4ZGvWc+jJV85ra1jitK2x3YLYu4ESBHA=;
 b=WoJCBBjXguzYGrkZyjOyGUB/CriY/l+NYAT+6JvA0okQnEF59DmTrozEBuCWLSyPFz
 8C2/hHrRivPnlKgauO48XA/XH2mqHpAeSfO5eUKsIxGfgtO0qw/ssYQB/Fyn8Ef/55QN
 JWllBv99xGMNB96ho+0JVOWP+0SxO5bDuI1GTBeuQtHndu5r9R3S5j4IXaD+pStAWsyl
 DqbjbMRLeFz4LL3id3ZL6uM3RKHpEcmXuQ67+5C4/99oV5+5MwgAF82O3N4bGitZIyS8
 QavC4Ql/EEIcWus9micOpCp+S39mEJNUGKBzTIDLt9U/7JmWgWYPX6MaQTyuqUQ5cA2S
 8myg==
X-Gm-Message-State: APjAAAVidfUI+XGUsopPjVn0DIuKm27uR4jOHJGT84TaMW3O3YoAQstN
 omBQxBh8FO061V262Ql+Lrmw+tD0
X-Received: by 2002:a1c:8095:: with SMTP id b143mr1759229wmd.7.1576539359747; 
 Mon, 16 Dec 2019 15:35:59 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id z83sm984501wmg.2.2019.12.16.15.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 15:35:59 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/10] arm: allwinner-h3: add USB host controller
Date: Tue, 17 Dec 2019 00:35:13 +0100
Message-Id: <20191216233519.29030-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216233519.29030-1-nieklinnenbank@gmail.com>
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n+vQEcz3w+1o

The Allwinner H3 System on Chip contains multiple USB 2.0 bus
connections which provide software access using the Enhanced
Host Controller Interface (EHCI) and Open Host Controller
Interface (OHCI) interfaces. This commit adds support for
both interfaces in the Allwinner H3 System on Chip.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.h        |  1 +
 hw/arm/allwinner-h3.c    | 28 ++++++++++++++++++++++++++++
 hw/usb/hcd-ehci-sysbus.c | 17 +++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 0298238f0b..edb59311c4 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -342,6 +342,7 @@ typedef struct EHCIPCIState {
 #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
 #define TYPE_PLATFORM_EHCI "platform-ehci-usb"
 #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
+#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
 #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
 #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
 #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 0da09188d1..f0ea088852 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -26,6 +26,7 @@
 #include "hw/sysbus.h"
 #include "hw/arm/allwinner-h3.h"
 #include "hw/misc/unimp.h"
+#include "hw/usb/hcd-ehci.h"
 #include "sysemu/sysemu.h"
 
 /* Memory map */
@@ -317,6 +318,33 @@ static void aw_h3_realize(DeviceState *dev, Error **errp)
     qdev_init_nofail(DEVICE(&s->ccu));
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_H3_CCU]);
 
+    /* Universal Serial Bus */
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI0));
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI1],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI1));
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI2],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI2));
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI3],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI3));
+
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI0],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI0));
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI1],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI1));
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI2],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI2));
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI3],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI3));
+
     /* UART0 */
     serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART0], 2,
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART0),
diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 020211fd10..174c3446ef 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info = {
     .class_init    = ehci_exynos4210_class_init,
 };
 
+static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)
+{
+    SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    sec->capsbase = 0x0;
+    sec->opregbase = 0x10;
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+}
+
+static const TypeInfo ehci_aw_h3_type_info = {
+    .name          = TYPE_AW_H3_EHCI,
+    .parent        = TYPE_SYS_BUS_EHCI,
+    .class_init    = ehci_aw_h3_class_init,
+};
+
 static void ehci_tegra2_class_init(ObjectClass *oc, void *data)
 {
     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
@@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(void)
     type_register_static(&ehci_platform_type_info);
     type_register_static(&ehci_xlnx_type_info);
     type_register_static(&ehci_exynos4210_type_info);
+    type_register_static(&ehci_aw_h3_type_info);
     type_register_static(&ehci_tegra2_type_info);
     type_register_static(&ehci_ppc4xx_type_info);
     type_register_static(&ehci_fusbh200_type_info);
-- 
2.17.1


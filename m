Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5902362wrq;
        Wed, 27 Jun 2018 00:40:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfH7qT6aIXD1OPXoOrc5YSNcleG09tbzp+xyQnYX5kAaZPwY4nJACkl17AkdBgTjzWCkwOT
X-Received: by 2002:aed:220e:: with SMTP id n14-v6mr4426522qtc.68.1530085218369;
        Wed, 27 Jun 2018 00:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530085218; cv=none;
        d=google.com; s=arc-20160816;
        b=rNNZFsF64oaTrYOd2y3nIqLMpt3k1RSExwrhvmfdlosQj3lSSqzzbmK+deDaROiulx
         FW5Qi5mfZT3pEW7h+bWsDmfn0WCKJgVg/TR1C8kJeTHnc5sBrayJmP52zzeEBdp/cFqb
         zB8hFU4vJ5mf9GcShV2ZMPKS9sXDL1r7v5arEXTUXPn4ULgAyN/szaOA1zHSMtSutQgP
         xpaVWWqqrt9IJKPIx2+gfv3ncNR8Lbyo9JQa3xvZsGuT/0vP9QzCBEoenlmQr68ps2KJ
         0gxRBGDsPF+DhGxQm4jizCKl2Jbkh4LwIqkoaTd0LT6BBKvks5ZkkV8QBEb5D7VRKvBf
         0ndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=h2ozpD/6Z9z0pDvZXnvzO1uZuErVmwaROMON1M8gUl8=;
        b=bUy0BXePfqjbSlge4+NydJlEodDMa+ejH7Ajm1P8RGM+tCoEL5r3wukDt/DOTLek/Y
         SFNL3HnsjFGJhhbYoy7zEkMZDT8W4vwyp21L9Go8equjb7NJo0pl3GccT0Y9aA0nCRXu
         yKqMBRiOF5qISyqG/VTLqRZzsqnbSDJDZDRhNpPR/msAsjrzbeSDpUB67gtim23VDD03
         d8gWPk8ByTauIVVV5U2O6SWmQNhXGVwhj+Va0QLaIoGE4huooBDzeek+Wx+Te/E6iled
         aBj2GzekLsHyCaGdvVpYl5ahvqYNif1AfG0J3G8LqbRnntnIwRoySgd1oKpHeems7ilf
         8qeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11-v6si3440502qvb.73.2018.06.27.00.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 00:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY53p-0004MH-Pj
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 03:40:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1fY4y4-0007jm-7X
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 03:34:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1fY4y2-0005sB-U7
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 03:34:20 -0400
Received: from steffen-goertz.de ([88.198.119.201]:51510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1fY4y2-0005r7-IE; Wed, 27 Jun 2018 03:34:18 -0400
Received: from localhost.localdomain (tmo-096-88.customers.d1-online.com
	[80.187.96.88])
	by steffen-goertz.de (Postfix) with ESMTPSA id 7BF8A4936F;
	Wed, 27 Jun 2018 09:32:50 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Wed, 27 Jun 2018 09:33:51 +0200
Message-Id: <20180627073351.856-9-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627073351.856-1-contrib@steffen-goertz.de>
References: <20180627073351.856-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [RFC 8/8] arm: Instantiate NVMC in NRF51.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v8XcCWXrMclI

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c         | 50 +++++++++++++++++++++++---------------
 include/hw/arm/nrf51_soc.h |  3 ++-
 2 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 82e4c2d833..9ff622b792 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -40,6 +40,9 @@
 #define UART_SIZE       0x1000
 #define UART_INT        2
=20
+#define NVMC_BASE       0x4001E000
+#define NVMC_SIZE       0x1000
+
 #define RNG_BASE        0x4000D000
=20
 #define PAGE_SIZE       1024
@@ -182,23 +185,6 @@ static const MemoryRegionOps clock_ops =3D {
     .write =3D clock_write
 };
=20
-static uint64_t nvmc_read(void *opaque, hwaddr addr, unsigned int size)
-{
-    qemu_log_mask(LOG_TRACE, "%s: 0x%" HWADDR_PRIx " [%u]\n", __func__, =
addr, size);
-    return 1;
-}
-
-static void nvmc_write(void *opaque, hwaddr addr, uint64_t data, unsigne=
d int size)
-{
-    qemu_log_mask(LOG_TRACE, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n", __func__, addr, data, size);
-}
-
-
-static const MemoryRegionOps nvmc_ops =3D {
-    .read =3D nvmc_read,
-    .write =3D nvmc_write
-};
-
 static void nrf51_soc_init(Object *obj)
 {
     NRF51State *s =3D NRF51_SOC(obj);
@@ -223,6 +209,10 @@ static void nrf51_soc_init(Object *obj)
     object_property_add_child(obj, "uart", OBJECT(&s->uart), &error_abor=
t);
     qdev_set_parent_bus(DEVICE(&s->uart), sysbus_get_default());
=20
+    object_initialize(&s->nvmc, sizeof(s->nvmc), TYPE_NRF51_NVMC);
+    object_property_add_child(obj, "nvmc", OBJECT(&s->nvmc), &error_abor=
t);
+    qdev_set_parent_bus(DEVICE(&s->nvmc), sysbus_get_default());
+
     object_initialize(&s->rng, sizeof(s->rng), TYPE_NRF51_RNG);
     object_property_add_child(obj, "rng", OBJECT(&s->rng), &error_abort)=
;
     qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
@@ -309,6 +299,29 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
     qdev_connect_gpio_out_named(DEVICE(&s->uart), "irq", 0,
             qdev_get_gpio_in(DEVICE(&s->armv7m), BASE_TO_IRQ(UART_BASE))=
);
=20
+    /* NVMC */
+    object_property_set_link(OBJECT(&s->nvmc), OBJECT(&s->container),
+                                         "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_uint(OBJECT(&s->nvmc),
+            NRF51VariantAttributes[s->part_variant].flash_size, "code_si=
ze",
+            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->nvmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvmc), 0);
+    memory_region_add_subregion_overlap(&s->container, NVMC_BASE, mr, 0)=
;
+
     /* RNG */
     object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
     if (err) {
@@ -324,9 +337,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     /* STUB Peripherals */
     memory_region_init_io(&s->clock, NULL, &clock_ops, NULL, "nrf51_soc.=
clock", 0x1000);
     memory_region_add_subregion_overlap(&s->container, IOMEM_BASE, &s->c=
lock, -1);
-
-    memory_region_init_io(&s->nvmc, NULL, &nvmc_ops, NULL, "nrf51_soc.nv=
mc", 0x1000);
-    memory_region_add_subregion_overlap(&s->container, 0x4001E000, &s->n=
vmc, -1);
 }
=20
 static Property nrf51_soc_properties[] =3D {
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 35dd71c3db..70d9f5863c 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -15,6 +15,7 @@
 #include "hw/arm/armv7m.h"
 #include "hw/misc/unimp.h"
 #include "hw/char/nrf51_uart.h"
+#include "hw/nvram/nrf51_nvmc.h"
 #include "hw/misc/nrf51_rng.h"
=20
=20
@@ -32,6 +33,7 @@ typedef struct NRF51State {
=20
     UnimplementedDeviceState mmio;
     Nrf51UART uart;
+    Nrf51NVMCState nvmc;
     Nrf51RNGState rng;
=20
     MemoryRegion container;
@@ -40,7 +42,6 @@ typedef struct NRF51State {
     MemoryRegion ficr;
     MemoryRegion uicr;
     MemoryRegion clock;
-    MemoryRegion nvmc;
=20
     /* Properties */
     int32_t part_variant;
--=20
2.17.1


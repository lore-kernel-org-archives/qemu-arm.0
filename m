Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3618081wrw;
        Mon, 12 Nov 2018 13:43:03 -0800 (PST)
X-Google-Smtp-Source: AJdET5en8TSSmTOIRTtxoS6SA80J4KPlXBxwsY65AXSLdBclMhvikqM39CQ9NlH/wWRulA7633M5
X-Received: by 2002:a37:1ad9:: with SMTP id l86mr2458901qkh.54.1542058982998;
        Mon, 12 Nov 2018 13:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542058982; cv=none;
        d=google.com; s=arc-20160816;
        b=FrTHbb7gJTAYr33lvKu14Zlo7C4Kg7vTW/D3VUMBlRFYab673p6680mwKX/5iOpNeo
         18c3h6ggKbTzUGfQI4NGXpdCydPsp5Y2dbFED7zfy8NHgOVp9c8zFVFMCpU8rsrDjk+g
         1mNFpnAaBtIp1wyXvmF+Aub/CNGFqU5Zes3hqaaC1QOjeRN4vKcm50NJIBnVbLpBE1L2
         HK/xJAz+2nqLvezAqTOXMkBgSQ7wnRR8lXTu+XJsIOapoJrTt+GDSi5NGYdTk6LDZALx
         kYxmZQPsMmSieJaMGjYpVEq5wlrOCxAkiDorhVpfg0eItnQQ/19BqKu9a7y4p4u/X1bU
         b13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5+SJ3mGKv0YNS1iSSEj5nKRkR4MFSUZj7zN2bGOPseg=;
        b=WBVbLCougXDH/TdmmoigpkyQVm5AmWtNqa4N87FUJYUW9HP+j6cLR/cf2ENRSniBkK
         6olS/ZcI6zY0AzqZWGBGi+sSUMiV88c+FjbnPntydu3T+ujonYQaEOKxEV8yLxrQfl5Z
         3bg6MpOnMBLHneoo9/g7lOv6FYy5nkhbydQVaCyb388iz66HHXmtokL59dFiOnAygiwj
         eLCSKbWE0u7qpCELoGlmVz/rFdVHqWB9vuJ5c1SYPVXyhIEfOgdoqSS+Pg2Ev0nnrIfx
         9HdulExjijy5cpwn9l4HNREnaATv49I3xuowfaJAFIWuRKgpeRWPLCBx3kRmXwgk3/c+
         F8Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si2234095qtd.85.2018.11.12.13.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 13:43:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMJz4-0006QF-8s
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 16:43:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJyj-0005in-Gu
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 16:42:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJyh-0002Zk-Vd
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 16:42:41 -0500
Received: from steffen-goertz.de ([88.198.119.201]:35534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gMJyh-0002YW-Hi; Mon, 12 Nov 2018 16:42:39 -0500
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 2D97250717;
	Mon, 12 Nov 2018 22:39:35 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Mon, 12 Nov 2018 16:42:16 -0500
Message-Id: <20181112214224.31560-7-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181112214224.31560-1-contrib@steffen-goertz.de>
References: <20181112214224.31560-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v5 06/14] arm: Instantiate NRF51 special NVM's
 and NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Yp8Nw0CJIRo

Instantiates UICR, FICR, FLASH and NVMC in nRF51 SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c         | 43 +++++++++++++++++++++++++++-----------
 include/hw/arm/nrf51_soc.h |  2 ++
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index d2a19b8ead..e6956f9ef7 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -29,8 +29,10 @@
  * are supported in the future, add a sub-class of NRF51SoC for
  * the specific variants
  */
-#define NRF51822_FLASH_SIZE     (256 * NRF51_PAGE_SIZE)
-#define NRF51822_SRAM_SIZE      (16 * NRF51_PAGE_SIZE)
+#define NRF51822_FLASH_PAGES    256
+#define NRF51822_SRAM_PAGES     16
+#define NRF51822_FLASH_SIZE     (NRF51822_FLASH_PAGES * NRF51_PAGE_SIZE)
+#define NRF51822_SRAM_SIZE      (NRF51822_SRAM_PAGES * NRF51_PAGE_SIZE)
=20
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
=20
@@ -59,14 +61,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Er=
ror **errp)
=20
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memor=
y, -1);
=20
-    memory_region_init_rom(&s->flash, OBJECT(s), "nrf51.flash", s->flash=
_size,
-            &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->fla=
sh);
-
     memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &=
err);
     if (err) {
         error_propagate(errp, err);
@@ -99,10 +93,32 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
                        qdev_get_gpio_in(DEVICE(&s->cpu),
                        BASE_TO_IRQ(NRF51_RNG_BASE)));
=20
+    /* UICR, FICR, NVMC, FLASH */
+    object_property_set_uint(OBJECT(&s->nvm), s->flash_size, "flash-size=
",
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&s->nvm), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 0);
+    memory_region_add_subregion_overlap(&s->container, NRF51_NVMC_BASE, =
mr, 0);
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 1);
+    memory_region_add_subregion_overlap(&s->container, NRF51_FICR_BASE, =
mr, 0);
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 2);
+    memory_region_add_subregion_overlap(&s->container, NRF51_UICR_BASE, =
mr, 0);
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 3);
+    memory_region_add_subregion_overlap(&s->container, NRF51_FLASH_BASE,=
 mr, 0);
+
+
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
-    create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
-                                NRF51_FICR_SIZE);
     create_unimplemented_device("nrf51_soc.private",
                                 NRF51_PRIVATE_BASE, NRF51_PRIVATE_SIZE);
 }
@@ -126,6 +142,9 @@ static void nrf51_soc_init(Object *obj)
=20
     sysbus_init_child_obj(obj, "rng", &s->rng, sizeof(s->rng),
                            TYPE_NRF51_RNG);
+
+    sysbus_init_child_obj(obj, "nvm", &s->nvm, sizeof(s->nvm), TYPE_NRF5=
1_NVM);
+
 }
=20
 static Property nrf51_soc_properties[] =3D {
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 9e3ba916bd..c3f4d5bcdc 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -14,6 +14,7 @@
 #include "hw/arm/armv7m.h"
 #include "hw/char/nrf51_uart.h"
 #include "hw/misc/nrf51_rng.h"
+#include "hw/nvram/nrf51_nvm.h"
=20
 #define TYPE_NRF51_SOC "nrf51-soc"
 #define NRF51_SOC(obj) \
@@ -28,6 +29,7 @@ typedef struct NRF51State {
=20
     NRF51UARTState uart;
     NRF51RNGState rng;
+    NRF51NVMState nvm;
=20
     MemoryRegion iomem;
     MemoryRegion sram;
--=20
2.19.1


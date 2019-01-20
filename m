Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5099263wrt;
        Sun, 20 Jan 2019 06:36:15 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6ZQGmzYlxAZLEcFFbmbmuex+tLERgftxcZPNf/FZU9nPrPbOpwP66nKzex5RnWr/Wsu6Pr
X-Received: by 2002:a1c:400b:: with SMTP id n11mr22439913wma.85.1547994975646;
        Sun, 20 Jan 2019 06:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547994975; cv=none;
        d=google.com; s=arc-20160816;
        b=HNds25xxlixyX8+bjNanejafHkeuuZCT5dLxdLULGNQxezd7Q+odn25UGXVToZt+zu
         TFr/GCabahnVeZQdNILfZxTp+oSu+4Eop/Pi2w4u14SoEdOQBaeCUguNrDsS2YjyglAQ
         b6gs9ggdfXujyDBS+0dKRjtIklCAKEz9CwG67VF7qfUhJlzy2vEwhsrMUjLLIApU7Zn4
         sbbGE88PYWABAy7mBJYVirg28yyoiIoMG/B6dIdzxtKQtP0rPG0t1KvuER+scWFnNBF8
         6fy6eSYOcyLrhVuClcZTxI2qv8k/hAKYrI0EZ0W5DcGAqi0wOm4+0IFHQqNhOaFvAr7t
         Az6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uHzvPqgizJtHnhU9EcFrPVQWI+TlrhYL1xWnLvme8dE=;
        b=rjttGT7spMp8Ib5Ik1RpoR3KMsMpwOJoswKn8f2FHZyVveXQHVPK3+TIluLj2tdMtF
         LAsXx4Zw4ONptHGrEggKtRpdFsRve0m76B4YV2APxg2rVbLApYNN3zVfJZPEUY344J4j
         bmN7GHZKdZoVCdIe6bhvpK7edP2V0qIWiTwsVF9Pm2L5MXimqi1xcfmUeGNVd09m7GsE
         mWf057OI4cX8/sobIlPd9bg32olLwUzdKXh9rCtMWvYHGmLSqv1B9tsgBoy/J67258iE
         ZD5mYiMVPWTfGgtG+TWc0xMtXFTuU7ImJ/OqDSPWcZb7esZS/6asJsXsCE5DmSzjMn1F
         nT1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si63816196wrn.416.2019.01.20.06.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Jan 2019 06:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glECs-0002tK-K6
	for alex.bennee@linaro.org; Sun, 20 Jan 2019 09:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECM-0002rU-76
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECK-0002X3-46
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1glECC-0002QQ-2e; Sun, 20 Jan 2019 09:35:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 216B887620;
	Sun, 20 Jan 2019 14:35:30 +0000 (UTC)
Received: from localhost (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D3F6679E4;
	Sun, 20 Jan 2019 14:35:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 20 Jan 2019 14:34:51 +0000
Message-Id: <20190120143452.21683-4-stefanha@redhat.com>
In-Reply-To: <20190120143452.21683-1-stefanha@redhat.com>
References: <20190120143452.21683-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sun, 20 Jan 2019 14:35:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] arm: Instantiate NRF51 special NVM's and
 NVMC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HPSR1N1PHKgs

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Instantiates UICR, FICR, FLASH and NVMC in nRF51 SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/arm/nrf51_soc.h |  2 ++
 hw/arm/nrf51_soc.c         | 41 +++++++++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index e06f0304b4..c8c91cf9ff 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -15,6 +15,7 @@
 #include "hw/char/nrf51_uart.h"
 #include "hw/misc/nrf51_rng.h"
 #include "hw/gpio/nrf51_gpio.h"
+#include "hw/nvram/nrf51_nvm.h"
 #include "hw/timer/nrf51_timer.h"
=20
 #define TYPE_NRF51_SOC "nrf51-soc"
@@ -32,6 +33,7 @@ typedef struct NRF51State {
=20
     NRF51UARTState uart;
     NRF51RNGState rng;
+    NRF51NVMState nvm;
     NRF51GPIOState gpio;
     NRF51TimerState timer[NRF51_NUM_TIMERS];
=20
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 1630c27594..b839daea8b 100644
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
@@ -81,14 +83,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Er=
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
@@ -121,6 +115,29 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
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
     /* GPIO */
     object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
     if (err) {
@@ -158,8 +175,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
=20
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
-    create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
-                                NRF51_FICR_SIZE);
     create_unimplemented_device("nrf51_soc.private",
                                 NRF51_PRIVATE_BASE, NRF51_PRIVATE_SIZE);
 }
@@ -186,6 +201,8 @@ static void nrf51_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "rng", &s->rng, sizeof(s->rng),
                            TYPE_NRF51_RNG);
=20
+    sysbus_init_child_obj(obj, "nvm", &s->nvm, sizeof(s->nvm), TYPE_NRF5=
1_NVM);
+
     sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
                           TYPE_NRF51_GPIO);
=20
--=20
2.20.1


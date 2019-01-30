Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5341992wrt;
        Tue, 29 Jan 2019 23:22:09 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7mJ8P2TaM44OG691ERTAOTpxFgWLfx0jKh//ZG4HXDzSX8Vn9WNFJ6/Iqz6jhjWhkGNw+I
X-Received: by 2002:a25:3295:: with SMTP id y143mr27021644yby.75.1548832929575;
        Tue, 29 Jan 2019 23:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548832929; cv=none;
        d=google.com; s=arc-20160816;
        b=cgi2quwk+zgHW+LmsnriLbq64GlSaaTIbZzWQIwUb0t7oCurXHv/wbcqdAJ1dOtVwb
         zkjla/9uwjZaLQW/5Qx54sw4Jo34wJ1xK91Hntk0GHbDrS3CCyq6MO13xbqe7VmFdg6z
         MW3oG1cqbhZTmQ05csrKhCWwf/DejmUCP6vUSQbDnfW8B+Xq2ll06ODhIlp8I+wdLAun
         Yu8KPRJm9fFGvtPmoBiNV0PPC4+cFtP5pemd7nHq8B9N2ZL44WYHzlj5acdE0Eyt+jZ3
         pGRZ4t2XvwiNaTc+IrEhFsBlBLLDbQmW+q3h75nDZIj+RJdwOgZR2vM9nAibK0+TsdJC
         lg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QpfJWOyERZDpicf2/ND1vdWqwMkVyKKeOLyFfoQPv1U=;
        b=PohkxO/PBAQTJA8aFHqvGTIn7PHunCv2FFrp8byM2S6Df3XWuORt8k/1bqDXnsfWWO
         32uW/MZbm9+Kv2wJhvEgrc4t6tWn+FbBfhGmJzTKQJfu5T7EBSUj9RrsQVuX5FCAVx5f
         A7ohf3/y+GHgiDVa5cSJ4CF3Ar3kC2YzceXRL5mRjJApSO4kVaovXVw6h2hgvkEMHur5
         Lnw8YhEUkaKbvqXFl092TIjhhHGbhT19qFPH5s36OV6xSoXOzCNfau0To0a4EbL3T8k1
         DWIjnfvaFvCbJfj3IZiNQcT/s2hOLvjPyIzoC2buzWue2y4Z554fHdGggCQ/gY3p7zsF
         QTFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k189si411862ywg.81.2019.01.29.23.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 23:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gokCG-0000wR-Se
	for alex.bennee@linaro.org; Wed, 30 Jan 2019 02:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gokC3-0000v6-3z
	for qemu-arm@nongnu.org; Wed, 30 Jan 2019 02:21:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gokC1-0002KI-7k
	for qemu-arm@nongnu.org; Wed, 30 Jan 2019 02:21:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56490)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gokBz-0002If-8v; Wed, 30 Jan 2019 02:21:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF132D3C2B;
	Wed, 30 Jan 2019 07:21:48 +0000 (UTC)
Received: from localhost (unknown [10.64.242.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0572C5C231;
	Wed, 30 Jan 2019 07:21:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 30 Jan 2019 15:21:30 +0800
Message-Id: <20190130072131.13247-3-stefanha@redhat.com>
In-Reply-To: <20190130072131.13247-1-stefanha@redhat.com>
References: <20190130072131.13247-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 30 Jan 2019 07:21:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 2/3] arm: Instantiate NRF51 special NVM's and
 NVMC
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
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MPkc2eQwHaE3

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
index fbdefc07e4..fd7fcc71a5 100644
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


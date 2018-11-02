Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2360987wro;
        Fri, 2 Nov 2018 10:14:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5etDZV1c/Ok6NOo2gYbiOkbPWBa7KjRk3QFQ5LpXl7UVc4vg5d15cfU74ZItH1UDEC1fQRR
X-Received: by 2002:a37:2881:: with SMTP id o1mr11577384qko.130.1541178845788;
        Fri, 02 Nov 2018 10:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541178845; cv=none;
        d=google.com; s=arc-20160816;
        b=Bc7IQx+xAajYF/N9I+uYdJwI6K/dJW1gMk089/hfLEn+vdTdMHZhr4re1seZi3UAqZ
         QdM1tx5D03DM3TY8lZGOlJXRwIJiBnhXJB0jKsBq+eY1Dwl5Q083IO1iJQO6CTn8FkqK
         UhC/ydvpC/4SbDZqlB+xHP/hj3NZReG2mA7MPliEybGj3OC21z783AbgjWvknLY66XP6
         EkUTOukAmO4YQrXReKeKNYDLqmZ/682zICigFOjJ+t6SNlHnCKuXwhz4+cl7kM0B1wSp
         MWSVsGj12v6nqljBQZoybH/9bDfEOO7D0VWjj+lGOn6C+Al1lpj1W0yIBgwsi5hR8bZb
         bNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=twOpnKYbA6ybauyxBOWSBdLtbPVjpgscjWuSeCWBKNQ=;
        b=b4msOVVRns3As+WVDGohKyrgTi3HkFwXQm/upXrk2BUrFXLlfM2VyecwTpDECA1hs5
         W1SJn8AMsaEh6ULa2VRBLetF6atVybZqCPcnhV5oCf99ox/QmFHQbHRjwnLCZ9eYEphj
         /6V/vDSsEPI3b+nJK4gC0yOtYbCaeEq3QpFpzchF5Ze9ovlUtXQ0WcwbFNcAzkbTJC56
         rQ59qUQ3CUF22lujRv8HAhugnYoUmovbQKb2d2b8A+4n9ols/NmnpYxWcoAPUZozoqIh
         us5U+b+G2r5xCBn0CVdFvabPrhogXN6jnVjWUmW/+8fHhJr3yN/12KIEpOU4yox2jzxA
         KSgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k63si2658563qkk.82.2018.11.02.10.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 10:14:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gId1I-0005EQ-GV
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 13:14:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvj-0007DQ-8j
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvd-0004Y7-Ch
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:19 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33350)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gIcvX-0004I5-FH; Fri, 02 Nov 2018 13:08:11 -0400
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id A950B4FF53;
	Fri,  2 Nov 2018 18:05:01 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:07:23 -0400
Message-Id: <20181102170730.12432-7-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102170730.12432-1-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v4 06/13] arm: Instantiate NRF51 special NVM's
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WEEo30+LUoF2

Instantiates UICR, FICR and NVMC in nRF51 SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/nrf51_soc.c         | 37 ++++++++++++++++++++++++++++++++++---
 include/hw/arm/nrf51_soc.h |  2 ++
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index d2a19b8ead..d11bb2b99f 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -29,7 +29,8 @@
  * are supported in the future, add a sub-class of NRF51SoC for
  * the specific variants
  */
-#define NRF51822_FLASH_SIZE     (256 * NRF51_PAGE_SIZE)
+#define NRF51822_FLASH_PAGES    256
+#define NRF51822_FLASH_SIZE     (NRF51822_FLASH_PAGES * NRF51_PAGE_SIZE)
 #define NRF51822_SRAM_SIZE      (16 * NRF51_PAGE_SIZE)
=20
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
@@ -99,10 +100,37 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->cpu),
                        BASE_TO_IRQ(NRF51_RNG_BASE)));
=20
+    /* UICR, FICR, NVMC */
+    object_property_set_link(OBJECT(&s->nvm), OBJECT(&s->container), "me=
mory",
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_uint(OBJECT(&s->nvm), NRF51822_FLASH_PAGES, "cod=
e-size",
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
+
+
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
-    create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
-                                NRF51_FICR_SIZE);
     create_unimplemented_device("nrf51_soc.private",
                                 NRF51_PRIVATE_BASE, NRF51_PRIVATE_SIZE);
 }
@@ -126,6 +154,9 @@ static void nrf51_soc_init(Object *obj)
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


Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp6269063wro;
        Tue, 30 Oct 2018 17:29:32 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fsfJBGntJJ40oFkylQZLkVhQ2hfcS8BhjzwTfG6+aW0HLC35jARN8fvMO2YRFvg1A7+F0x
X-Received: by 2002:a0c:f313:: with SMTP id j19mr830070qvl.200.1540945772385;
        Tue, 30 Oct 2018 17:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540945772; cv=none;
        d=google.com; s=arc-20160816;
        b=fXXdUv4H38jcupcNdhGiVNn8R+6GayEziGJRvJOA6HsV5wa0hhn4bOAg18RvoQ0Y/K
         ZiNrXWE/EWvm67JmjypE0Sf2ZpRFDCSQgzsuht70MWkPnE/HQ8piFbnbIQbmaHGpUPmK
         kzZZvaAcIe448KC2+HsSgxds51r/UhrVgJcDpBxMjKVCFtCjsUiUjW92P11yFaEUReWj
         pLqEuWyl5/MS3ZXiv5sn7aoRUSQa8RROAMBElmoFbrYp/I6fQkWRj8jKnS0p3haUr8sd
         q7qY2753n1J43fS/wehEK63yajZSjotrnfvUPi3scs/JatX0X3UKaudSHH7u0iFuGZ2J
         UkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=eUjbP5/ZNff66dEqwXrbjqtklRTAnm1M6A9K7iQ0flM=;
        b=nvvw4Yfl/XQ2xh0iP+ike1i4qHirqbhtHIqJbaoTa36DDcI5JkanzSGocW6hiM0yOr
         JlyGwaFhuaKhBn8AoibBP165s4K9rngBrHVWDlKoYIrcdPihqhTwf+GOHcNhxskl6Vpy
         Hv7L7LRaHQFtvkxsRP/qMRFDbDy4x7Mq03qI/qXDx8E4GDdvUBBnb6kQmNCWltUx4mPs
         BUAdRLDaxcrtRCDBSxugS320TV7VGThiNaSNfFuyIDawwCr8d0hAF6+YEMnetzbz8nF/
         wx2vZlYOSioxOM1CcZa8RNdZOm0NroFxNpY1U51ChD0BGqWYp1zgDOBjQEVUaufqFpc1
         cn1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m65si2310595qke.232.2018.10.30.17.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 17:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHeO3-0000Dp-Ol
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 20:29:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeKh-0004ph-K6
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeKg-0000Ce-NM
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:03 -0400
Received: from steffen-goertz.de ([88.198.119.201]:60428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gHeKg-0000C9-Cl; Tue, 30 Oct 2018 20:26:02 -0400
Received: from gouranga.fios-router.home
	(pool-71-183-97-129.nycmny.fios.verizon.net [71.183.97.129])
	by steffen-goertz.de (Postfix) with ESMTPSA id 7E5584FB6E;
	Wed, 31 Oct 2018 01:23:27 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Tue, 30 Oct 2018 20:25:20 -0400
Message-Id: <20181031002526.14262-7-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031002526.14262-1-contrib@steffen-goertz.de>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v3 06/13] arm: Instantiate NRF51 special NVM's
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
X-TUID: BzlJmpT6q0mh

Instantiates UICR, FICR and NVMC in nRF51 SOC.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c         | 37 ++++++++++++++++++++++++++++++++++---
 include/hw/arm/nrf51_soc.h |  2 ++
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index d2a19b8ead..fd0efd0ee8 100644
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
e_size",
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


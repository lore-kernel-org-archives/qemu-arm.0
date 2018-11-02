Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2354893wro;
        Fri, 2 Nov 2018 10:08:33 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fN1R8x98Ax+oWM/h+/uVGBkIG3ZmRQ7L1a6D0iTRRquLPwoKIzu019iE2Ut0+tYjZLqDRu
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr10920570qkg.184.1541178513558;
        Fri, 02 Nov 2018 10:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541178513; cv=none;
        d=google.com; s=arc-20160816;
        b=nsXuwFFZga2UbNOrlbCIzLf1CobIm1W8pc+AviMSwZGqxxWY6dLCvHIDn8QcqvqG3P
         PXr948a6jdC0K07qErvuLUNf6TbtcfxI76w3Xnsp5v0IuwDvYkJYvAL6gCwAdKj6E8l1
         16T2mOop92pSmtG/l/QpkITKfbYb3J5nS82J2/chuZD7rb3oUEaqisZv8yYwKiCLoLXb
         onvqOqxh+KWV9gtwfNLMdpW/IB/1Xt69lz2v9hYT1O187/CdvAAEcBEtTeIQw04D6jv2
         5ZUy8z4sXvRPNuUUCgQAdTTRP4g3NMiqZW5EekCwksLAa/S8GMbljJqhPFoCImq0OOtQ
         XPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=cHc56yxF3wqMJLIaRxShiTNxotpzPQRf495J6LnvKXg=;
        b=bLsispbp1hvAtJWVEnEz+ewIrGrMVscdPk8qxuyepdW0gJRpziWMovLgkJ7Q3/Bgc/
         E6tEi8KmcwURBw5FqxwT4VajyFnqff7TW9N/07BkBR0gcV3a6cSF3HxfOz6tMTTeN/DB
         Dvsuf6b08QXcosqXj6FCOIr2K5v1aXprZ6nohx0kHauaXU92hNUOfGZ0Uj/S40bxW9mD
         Y6LAokKjvPiTnwXJjA2DrYxdmLQH2NT326ze1KwaDHlN7tLM+Awl7XmizC/7ztYJarV1
         mNtp9RBdm7r3y5r5jlXJ3QIjVh9p16MzqAGXJR20W79u343jC4zyUuby+/vEwN2Fra5o
         w2iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h189-v6si5309430qkf.234.2018.11.02.10.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 10:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIcvw-0007AG-Vs
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 13:08:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvd-00071i-7h
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvS-0004Qe-Ay
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:09 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gIcvJ-0004Ct-Pk; Fri, 02 Nov 2018 13:07:55 -0400
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 294964FF50;
	Fri,  2 Nov 2018 18:04:57 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:07:19 -0400
Message-Id: <20181102170730.12432-3-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102170730.12432-1-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v4 02/13] arm: Add header to host common
 definition for nRF51 SOC peripherals
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
X-TUID: KHWeSUN7FX2f

Adds a header that provides definitions that are used
across nRF51 peripherals

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/nrf51_soc.c           | 33 ++++++++++----------------
 include/hw/arm/nrf51.h       | 45 ++++++++++++++++++++++++++++++++++++
 include/hw/char/nrf51_uart.h |  1 -
 3 files changed, 57 insertions(+), 22 deletions(-)
 create mode 100644 include/hw/arm/nrf51.h

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index b89c1bdea0..55f8eaafcb 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -21,27 +21,16 @@
 #include "qemu/log.h"
 #include "cpu.h"
=20
+#include "hw/arm/nrf51.h"
 #include "hw/arm/nrf51_soc.h"
=20
-#define IOMEM_BASE      0x40000000
-#define IOMEM_SIZE      0x20000000
-
-#define FICR_BASE       0x10000000
-#define FICR_SIZE       0x000000fc
-
-#define FLASH_BASE      0x00000000
-#define SRAM_BASE       0x20000000
-
-#define PRIVATE_BASE    0xF0000000
-#define PRIVATE_SIZE    0x10000000
-
 /*
  * The size and base is for the NRF51822 part. If other parts
  * are supported in the future, add a sub-class of NRF51SoC for
  * the specific variants
  */
-#define NRF51822_FLASH_SIZE     (256 * 1024)
-#define NRF51822_SRAM_SIZE      (16 * 1024)
+#define NRF51822_FLASH_SIZE     (256 * NRF51_PAGE_SIZE)
+#define NRF51822_SRAM_SIZE      (16 * NRF51_PAGE_SIZE)
=20
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
=20
@@ -76,14 +65,14 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
+    memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->fla=
sh);
=20
     memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &=
err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
+    memory_region_add_subregion(&s->container, NRF51_SRAM_BASE, &s->sram=
);
=20
     /* UART */
     object_property_set_bool(OBJECT(&s->uart), true, "realized", &err);
@@ -92,15 +81,17 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
         return;
     }
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart), 0);
-    memory_region_add_subregion_overlap(&s->container, UART_BASE, mr, 0)=
;
+    memory_region_add_subregion_overlap(&s->container, NRF51_UART_BASE, =
mr, 0);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu),
-                       BASE_TO_IRQ(UART_BASE)));
+                       BASE_TO_IRQ(NRF51_UART_BASE)));
=20
-    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
-    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
+    create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
+                                NRF51_IOMEM_SIZE);
+    create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
+                                NRF51_FICR_SIZE);
     create_unimplemented_device("nrf51_soc.private",
-                                PRIVATE_BASE, PRIVATE_SIZE);
+                                NRF51_PRIVATE_BASE, NRF51_PRIVATE_SIZE);
 }
=20
 static void nrf51_soc_init(Object *obj)
diff --git a/include/hw/arm/nrf51.h b/include/hw/arm/nrf51.h
new file mode 100644
index 0000000000..175bb6c301
--- /dev/null
+++ b/include/hw/arm/nrf51.h
@@ -0,0 +1,45 @@
+/*
+ * Nordic Semiconductor nRF51 Series SOC Common Defines
+ *
+ * This file hosts generic defines used in various nRF51 peripheral devi=
ces.
+ *
+ * Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.=
pdf
+ * Product Spec: http://infocenter.nordicsemi.com/pdf/nRF51822_PS_v3.1.p=
df
+ *
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef NRF51_H
+#define NRF51_H
+
+#define NRF51_FLASH_BASE      0x00000000
+#define NRF51_FICR_BASE       0x10000000
+#define NRF51_FICR_SIZE       0x00000100
+#define NRF51_UICR_BASE       0x10001000
+#define NRF51_SRAM_BASE       0x20000000
+
+#define NRF51_IOMEM_BASE      0x40000000
+#define NRF51_IOMEM_SIZE      0x20000000
+
+#define NRF51_UART_BASE       0x40002000
+#define NRF51_TIMER_BASE      0x40008000
+#define NRF51_TIMER_SIZE      0x00001000
+#define NRF51_RNG_BASE        0x4000D000
+#define NRF51_NVMC_BASE       0x4001E000
+#define NRF51_GPIO_BASE       0x50000000
+
+#define NRF51_PRIVATE_BASE    0xF0000000
+#define NRF51_PRIVATE_SIZE    0x10000000
+
+#define NRF51_PAGE_SIZE       1024
+
+/* Trigger */
+#define NRF51_TRIGGER_TASK 0x01
+
+/* Events */
+#define NRF51_EVENT_CLEAR  0x00
+
+#endif
diff --git a/include/hw/char/nrf51_uart.h b/include/hw/char/nrf51_uart.h
index e3ecb7c81c..eb1c15b490 100644
--- a/include/hw/char/nrf51_uart.h
+++ b/include/hw/char/nrf51_uart.h
@@ -16,7 +16,6 @@
 #include "hw/registerfields.h"
=20
 #define UART_FIFO_LENGTH 6
-#define UART_BASE 0x40002000
 #define UART_SIZE 0x1000
=20
 #define TYPE_NRF51_UART "nrf51_soc.uart"
--=20
2.19.1


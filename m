Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp422229wrt;
        Thu, 3 Jan 2019 01:13:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6o7R4iBmsEGqRV7rcIBqz4l1Nj/X6XzEavvHxh38NCQMwt8s3kGw2qe5ZOtvwW9SyR3QUA
X-Received: by 2002:a0c:fa46:: with SMTP id k6mr45345028qvo.36.1546506785528;
        Thu, 03 Jan 2019 01:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546506785; cv=none;
        d=google.com; s=arc-20160816;
        b=z1LUA4I6xh+ZGX/g3F1VeBAzLnSDrBzupHjidYIdL2bZj6mdTiozAmBZEgcMURZNTA
         jgmjMCrz9DLdrwCRviPTxuVI5wDjRAZfajtSPCVrgYsGT8aMT6SRskiVU016e0UDVAhY
         +JCmrvNf9yWXUWPGU1L5RlvKaxIvn7nQN5DRUEBfqJeaUT3qCN37XPLw/XHaabJ3oFPR
         WoDBPJhtfRMzWnT3M8+MDi4QEkjlZzOn4/OaIS3SuJTvMgFS+2CaBiEMiRdAoxOJsXnt
         P3Be4rzH6ilikBNq9EhZ0ZHn6uno7V4dxxKC9ZMlg3al7bp3app6np+QSdKi1Nwax5LL
         Uuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KxCQE5lTnM5CuAV49gCTBi8kRwTeOVL3YGbYnaF8eg8=;
        b=wseekcasG/sCOJ95WV6FpuRjjtTteQ6JGjHGG4ASq0duxFme0sPTfaThy7pmLAXunS
         0yDon8d+DazbeDoznA5B/n6shHw4oVYZCGw3HMV/5L99C1Trp+H3H3i3gkf/V86I+9bp
         gesMVXd/shmvCjT/ZKlSaKi7upU37+FFr7n4rH9AavZqPRju1IRiXLTbyeXI11mUjBpZ
         mQfHnFYlyu0B3okuTtngnDnx4tuQ1YIgrhsyiYEiSp8j8SaYXtcqaWJV12u9wbW9texh
         JOpU8LujNFJZaSzSl0ScTDJ4OghKnKTkBCR9jFUPn46nLgOURa9Vip6/KLtrNUlGzxoL
         F6WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t82si3035923qkl.141.2019.01.03.01.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:13:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez3o-0003RI-Or
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:13:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3T-0003H2-M6
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3P-0006Rl-MS
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3P-0006RI-FC; Thu, 03 Jan 2019 04:12:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C54A87E43B;
	Thu,  3 Jan 2019 09:12:37 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F45F608DA;
	Thu,  3 Jan 2019 09:12:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:10 +0000
Message-Id: <20190103091119.9367-3-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 03 Jan 2019 09:12:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 02/11] arm: Add header to host common definition
 for nRF51 SOC peripherals
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
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHfVVzR1pVg1

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Adds a header that provides definitions that are used
across nRF51 peripherals

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/arm/nrf51.h       | 45 ++++++++++++++++++++++++++++++++++++
 include/hw/char/nrf51_uart.h |  1 -
 hw/arm/nrf51_soc.c           | 33 ++++++++++----------------
 3 files changed, 57 insertions(+), 22 deletions(-)
 create mode 100644 include/hw/arm/nrf51.h

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
--=20
2.19.2


Received: by 10.25.44.15 with SMTP id s15csp4680807lfs;
        Tue, 11 Jul 2017 04:17:33 -0700 (PDT)
X-Received: by 10.237.48.49 with SMTP id 46mr10366103qte.101.1499771853095;
        Tue, 11 Jul 2017 04:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499771853; cv=none;
        d=google.com; s=arc-20160816;
        b=CjQh7J88alkr/xuMby+t0kteSWGU9+VG6Hds5xsnF6w/HnpvugqZWV5gwgJCqWxvRX
         +YIn5/1EMPMYqedBoJ7I2fQ89rkqY3/HlmVzBJ94jxyNUFmK8IzE6qSTIgMnmEqKTVVh
         CYZgr55YWx2rnF1sYoZH1JE+jkXaqWKwkblDYRn90G2jdobWOV5o/QswOqEsAcsuQkuu
         zRAe8VZXOnZNxtW5HwNpb8iSY4GuitwmNXMSqobH9hD55n+HUbmNQ5ZljWvLHEbmNx0U
         3Pn+oXe+qssnz93oaF/z9Pkp+TezIVZku/WCHvIy6uNjh+2V+AqYSM0sPz8+cibTiTOW
         0EPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SPKBivQb+I5jPXPQ41V4G6K5G+7v3evmJNMr7oiZg8Q=;
        b=a6US83kVdFNSO6ZsIfQnPSF8ch0FQWY+YvgYPUKi/iBXRmzjWRL8pyrwTeDYfKQWZL
         wbDxctF2gVKMbnU0ma092DpFPEcd9tCXn2klT25WsMjKg7GUlaJPifGzrYYC8RgSDlal
         GLcYZhyvDakWpv0y+bn4Z7QvuUl46mf2+JlCKb60kQYn2wzWKAPEwZRrFtpUvkHsAKDq
         Ltz9ZCXQ+DD8Lu9+qj3+YurUQDngbCyfj+hy0rI6oKK/ELQzvzn2POwvM6SPCZBB79TQ
         1tCvaOUiAHzUgwtpCUfQrlUHrrqjhGoTeCQ45UA7NCsTrkYQgpm8dPNXArDIqMtgpRyd
         pWCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q23si13600345qtq.155.2017.07.11.04.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 04:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUtAY-00079w-Gn
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 07:17:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAT-00079U-Ps
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAS-00082c-Lc
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:17:25 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUtAS-00081N-E0; Tue, 11 Jul 2017 07:17:24 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUtAP-00032n-FK; Tue, 11 Jul 2017 12:17:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 12:17:15 +0100
Message-Id: <1499771839-32518-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/7] hw/arm/mps2: Add UARTs
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s9ojdLYNiINV

Add the UARTs to the MPS2 board models.

Unfortunately the details of the wiring of the interrupts through
various OR gates differ between AN511 and AN385 so this can't
be purely a data-driven difference.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 28838bc..1b60b12 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -27,9 +27,12 @@
 #include "qemu/error-report.h"
 #include "hw/arm/arm.h"
 #include "hw/arm/armv7m.h"
+#include "hw/or-irq.h"
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
 #include "hw/misc/unimp.h"
+#include "hw/char/cmsdk-apb-uart.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
@@ -208,6 +211,89 @@ static void mps2_common_init(MachineState *machine)
     create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
     create_unimplemented_device("VGA", 0x41000000, 0x0200000);
 
+    switch (mmc->fpga_type) {
+    case FPGA_AN385:
+    {
+        /* The overflow IRQs for UARTs 0, 1 and 2 are ORed together.
+         * Overflow for UARTs 4 and 5 doesn't trigger any interrupt.
+         */
+        Object *orgate;
+        DeviceState *orgate_dev;
+        int i;
+
+        orgate = object_new(TYPE_OR_IRQ);
+        object_property_set_int(orgate, 6, "num-lines", &error_fatal);
+        object_property_set_bool(orgate, true, "realized", &error_fatal);
+        orgate_dev = DEVICE(orgate);
+        qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12));
+
+        for (i = 0; i < 5; i++) {
+            hwaddr uartbase[] = {0x40004000, 0x40005000, 0x40006000,
+                                 0x40007000, 0x40009000};
+            Chardev *uartchr = i < MAX_SERIAL_PORTS ? serial_hds[i] : NULL;
+            /* RX irq number; TX irq is always one greater */
+            int uartirq[] = {0, 2, 4, 18, 20};
+            qemu_irq txovrint = NULL, rxovrint = NULL;
+
+            if (i < 3) {
+                txovrint = qdev_get_gpio_in(orgate_dev, i * 2);
+                rxovrint = qdev_get_gpio_in(orgate_dev, i * 2 + 1);
+            }
+
+            cmsdk_apb_uart_create(uartbase[i],
+                                  qdev_get_gpio_in(armv7m, uartirq[i] + 1),
+                                  qdev_get_gpio_in(armv7m, uartirq[i]),
+                                  txovrint, rxovrint,
+                                  NULL,
+                                  uartchr, SYSCLK_FRQ);
+        }
+        break;
+    }
+    case FPGA_AN511:
+    {
+        /* The overflow IRQs for all UARTs are ORed together.
+         * Tx and Rx IRQs for each UART are ORed together.
+         */
+        Object *orgate;
+        DeviceState *orgate_dev;
+        int i;
+
+        orgate = object_new(TYPE_OR_IRQ);
+        object_property_set_int(orgate, 10, "num-lines", &error_fatal);
+        object_property_set_bool(orgate, true, "realized", &error_fatal);
+        orgate_dev = DEVICE(orgate);
+        qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12));
+
+        for (i = 0; i < 5; i++) {
+            /* system irq numbers for the combined tx/rx for each UART */
+            const int uart_txrx_irqno[] = {0, 2, 45, 46, 56};
+            hwaddr uartbase[] = {0x40004000, 0x40005000, 0x4002c000,
+                                 0x4002d000, 0x4002e000};
+            Chardev *uartchr = i < MAX_SERIAL_PORTS ? serial_hds[i] : NULL;
+            Object *txrx_orgate;
+            DeviceState *txrx_orgate_dev;
+
+            txrx_orgate = object_new(TYPE_OR_IRQ);
+            object_property_set_int(txrx_orgate, 2, "num-lines", &error_fatal);
+            object_property_set_bool(txrx_orgate, true, "realized",
+                                     &error_fatal);
+            txrx_orgate_dev = DEVICE(txrx_orgate);
+            qdev_connect_gpio_out(txrx_orgate_dev, 0,
+                                  qdev_get_gpio_in(armv7m, uart_txrx_irqno[i]));
+            cmsdk_apb_uart_create(uartbase[i],
+                                  qdev_get_gpio_in(txrx_orgate_dev, 0),
+                                  qdev_get_gpio_in(txrx_orgate_dev, 1),
+                                  qdev_get_gpio_in(orgate_dev, 0),
+                                  qdev_get_gpio_in(orgate_dev, 1),
+                                  NULL,
+                                  uartchr, SYSCLK_FRQ);
+        }
+        break;
+    }
+    default:
+        g_assert_not_reached();
+    }
+
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-- 
2.7.4


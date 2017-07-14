Received: by 10.25.44.15 with SMTP id s15csp761158lfs;
        Fri, 14 Jul 2017 03:52:58 -0700 (PDT)
X-Received: by 10.200.9.55 with SMTP id t52mr10403541qth.107.1500029578454;
        Fri, 14 Jul 2017 03:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500029578; cv=none;
        d=google.com; s=arc-20160816;
        b=qZABlIy9h/QlQuX/D8P8ANU97AJ8NQcnzgQHu12ulTHpuW1aKIRt//3nvp9r+It9ab
         n+9ddMO5BqhfMeXiuXlTGbRZ3fcK/yaxmMTQ5zSzk80qyNWMjI894H19M5l3k5nB6DPi
         EhdVt46BFeZz5HF5F0ZyaD2947PMf5sC0ZVeGi8p6atKPnWaFJEKqEy+2f/dIv3HuID2
         V4OIgHiDWY46odaf6C1V4LAbfkIYMRNIrDGP5IBKGc/XbMtCxd0GAMJYPeJFMxG7hUHy
         RbqiyAfeAKRkKy8XR1RZth46x1u2Kbb2Dge+gqMVmxuNm4Ic15glOuLTsjxEmGMYwSv+
         9FzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=z4/fTT/pmsnXzSM0zFLnDUTgAAkWScl5TL+n/1hgCjQ=;
        b=PxWwbdZoSMaQCHCCL27Pw0yTmUeMJFVEaQ8qQQ9VYISdqdBqvOXPnTm/csDaHSGoU2
         5pzdb2O37TkVPEmfvZWFjLX+gYp7Y/qhTlyy42iHIUyzJlH1j1BtWGXxOukc6oZvVhPK
         /AgITlfpuL05f4oZlByepyWIXF9eQRSBB9+pHI/GJR7BcA5Drq39g8yx+OF4OYn8drX2
         QIP67X/m970LelZfOhwGxLQ9LI+TueH6sbQMDkHTnVJGdTPsLXy1sf+AGKnG8Finitcm
         3epcHSpVLw715SN4uzOz3sN1A5vioR4L+iNZYKjevyEflQjSMvHvMzp91mEWXzTsOZxk
         xalQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n72si7757368qka.180.2017.07.14.03.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 03:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyDP-0005oN-ND
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 06:52:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCR-0004xD-Te
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCN-0007F6-Ky
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:55 -0400
Received: from [2001:8b0:1d0::2] (port=37583 helo=orth.archaic.org.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dVyCN-00072e-E4; Fri, 14 Jul 2017 06:51:51 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dVyC0-0007kA-Sl; Fri, 14 Jul 2017 11:51:28 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 11:51:21 +0100
Message-Id: <1500029487-14822-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 3/9] hw/arm/mps2: Add UARTs
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JzRkJDvLXWI/

Add the UARTs to the MPS2 board models.

Unfortunately the details of the wiring of the interrupts through
various OR gates differ between AN511 and AN385 so this can't
be purely a data-driven difference.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/mps2.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 3dad02d..180c5d2 100644
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
@@ -206,6 +209,89 @@ static void mps2_common_init(MachineState *machine)
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


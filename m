Received: by 10.25.30.65 with SMTP id e62csp1243179lfe;
        Wed, 25 May 2016 04:13:09 -0700 (PDT)
X-Received: by 10.55.167.6 with SMTP id q6mr2889788qke.95.1464174789593;
        Wed, 25 May 2016 04:13:09 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j35si7310865qtb.121.2016.05.25.04.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5WkO-0004NF-Qa
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:13:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWs-0000bp-J1
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWk-0002OW-3i
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:59:09 -0400
Received: from m12-18.163.com ([220.181.12.18]:39501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b5WWj-0002K6-9I; Wed, 25 May 2016 06:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=RA1IxJXkMPykH04Puq
	NCC0idhxuiHnuCoOXWwpWQuDo=; b=GAO7zX3fABmiYYnMUmmJ3VV9Vdo/NPUg1O
	v+BeWDOypjW4PEKcLA4m+A+yj0CwH8WpS+wsbeQoCCXMX1zvITf2XzE+G72gXD5Q
	h/Hc//g8ty1cW0w7n9Az8/TREFXzP3wCA6MAQDW4t4r3pEaCBvWjzSVzL/Kc/4mD
	EZyaLaEtw=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZp0pKhUVXzcaKAA--.5553S4;
	Wed, 25 May 2016 18:58:52 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 18:58:12 +0800
Message-Id: <1464173896-4088-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZp0pKhUVXzcaKAA--.5553S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4rAFW3Kw1xury3Zry5urg_yoWrAr1xpF
	WkCFZxGrWUuanrX3yfAw1rGF45Jw1ru3W8CF42krWru347Cr40yFnFqa1Y93y7Wayvqryf
	uFZrXr98ta1fCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jT6wAUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiqAx0xlc64AUQyQAAsH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 2/6] hw/char: QOM'ify cadence_uart model
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
Cc: robh@kernel.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	antonynpavlov@gmail.com, pbonzini@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tZowe6+cCwG+

* drop qemu_char_get_next_serial and use chardev prop
* create cadence_uart_create wrapper function to create
  cadence_uart_device
* change affected board code to use the new way

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/xilinx_zynq.c           |  5 +++--
 hw/arm/xlnx-zynqmp.c           |  1 +
 hw/char/cadence_uart.c         | 13 +++++++------
 include/hw/char/cadence_uart.h | 17 +++++++++++++++++
 4 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 98b17c9..aefebcf 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -32,6 +32,7 @@
 #include "hw/ssi/ssi.h"
 #include "qemu/error-report.h"
 #include "hw/sd/sd.h"
+#include "hw/char/cadence_uart.h"
 
 #define NUM_SPI_FLASHES 4
 #define NUM_QSPI_FLASHES 2
@@ -235,8 +236,8 @@ static void zynq_init(MachineState *machine)
     sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET]);
     sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET]);
 
-    sysbus_create_simple("cadence_uart", 0xE0000000, pic[59-IRQ_OFFSET]);
-    sysbus_create_simple("cadence_uart", 0xE0001000, pic[82-IRQ_OFFSET]);
+    cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hds[0]);
+    cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hds[1]);
 
     sysbus_create_varargs("cadence_ttc", 0xF8001000,
             pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], NULL);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 4d504da..9b893d7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -308,6 +308,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
+        qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hds[i]);
         object_property_set_bool(OBJECT(&s->uart[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 442dac5..c856fc3 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -468,9 +468,6 @@ static void cadence_uart_realize(DeviceState *dev, Error **errp)
     s->fifo_trigger_handle = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                           fifo_trigger_update, s);
 
-    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */
-    s->chr = qemu_char_get_next_serial();
-
     if (s->chr) {
         qemu_chr_add_handlers(s->chr, uart_can_receive, uart_receive,
                               uart_event, s);
@@ -517,6 +514,11 @@ static const VMStateDescription vmstate_cadence_uart = {
     }
 };
 
+static Property cadence_uart_properties[] = {
+    DEFINE_PROP_CHR("chardev", CadenceUARTState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void cadence_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -524,9 +526,8 @@ static void cadence_uart_class_init(ObjectClass *klass, void *data)
     dc->realize = cadence_uart_realize;
     dc->vmsd = &vmstate_cadence_uart;
     dc->reset = cadence_uart_reset;
-    /* Reason: realize() method uses qemu_char_get_next_serial() */
-    dc->cannot_instantiate_with_device_add_yet = true;
-}
+    dc->props = cadence_uart_properties;
+  }
 
 static const TypeInfo cadence_uart_info = {
     .name          = TYPE_CADENCE_UART,
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
index 6310f52..a12773c 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -49,5 +49,22 @@ typedef struct {
     QEMUTimer *fifo_trigger_handle;
 } CadenceUARTState;
 
+static inline DeviceState *cadence_uart_create(hwaddr addr,
+                                        qemu_irq irq,
+                                        CharDriverState *chr)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    dev = qdev_create(NULL, TYPE_CADENCE_UART);
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(s, 0, addr);
+    sysbus_connect_irq(s, 0, irq);
+
+    return dev;
+}
+
 #define CADENCE_UART_H
 #endif
-- 
2.1.4



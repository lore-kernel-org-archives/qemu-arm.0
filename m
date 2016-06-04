Received: by 10.25.27.66 with SMTP id b63csp616618lfb;
        Sat, 4 Jun 2016 01:17:06 -0700 (PDT)
X-Received: by 10.200.33.229 with SMTP id 34mr7062253qtz.100.1465028225996;
        Sat, 04 Jun 2016 01:17:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m61si5915587qtd.72.2016.06.04.01.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Jun 2016 01:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b96lV-0002Ie-BE
	for alex.bennee@linaro.org; Sat, 04 Jun 2016 04:17:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jo-00018C-EG
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jf-00025C-Ta
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:19 -0400
Received: from m12-18.163.com ([220.181.12.18]:58676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b96jd-0001x1-No; Sat, 04 Jun 2016 04:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=TCZsvpl66ZIhogVWXV
	01dDA42GFRk0GXFPXybiRyCpI=; b=jS3nUyAlFVy9b3K963ZyrgVWOdeojQS2JH
	kbdT1juOcwKAAYg55RXNcz/t6D5DcgsI9nDSyFQysNBTxGvjFgPIXMk6rtz1iYv3
	Ix1L9z6Y0t7B/uHWIWj87IEkdxo3+o38fM7lmh3lT3vYR3YMn3Bc0qobluayhxuV
	cKhhgaNGI=
Received: from debian.lan (unknown [114.111.167.200])
	by smtp14 (Coremail) with SMTP id EsCowECpfUbfjVJXKXU9AA--.28040S4;
	Sat, 04 Jun 2016 16:14:35 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 Jun 2016 16:14:21 +0800
Message-Id: <1465028065-5855-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
References: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECpfUbfjVJXKXU9AA--.28040S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4rAFW3Kw1xury3Zry5urg_yoWrAr1xpF
	WkCFZxGrWUuanrX3yfAw1rGF45Jw1ru3W8CF42krWru347Cr40yFnFqa1Y93y7Wayvqryf
	uFZrXr98ta1fCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bwHqcUUUUU=
X-Originating-IP: [114.111.167.200]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiqAt+xlc64Ky07QAAsj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH v2 2/6] hw/char: QOM'ify cadence_uart model
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
	armbru@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com,
	pbonzini@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6j+L9t/ZKiB

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
2.8.1



Received: by 10.25.30.65 with SMTP id e62csp1248197lfe;
        Wed, 25 May 2016 04:23:02 -0700 (PDT)
X-Received: by 10.55.65.74 with SMTP id o71mr2931060qka.133.1464175382313;
        Wed, 25 May 2016 04:23:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si7355541qkc.189.2016.05.25.04.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Wtx-000505-Gg
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:23:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWr-0000bB-Vn
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:59:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWj-0002Nh-RD
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:59:08 -0400
Received: from m12-18.163.com ([220.181.12.18]:39497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b5WWj-0002K3-80; Wed, 25 May 2016 06:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=rWlSo9zeazvbuvJTaN
	2j+fqvG5fTcLHeiyjof3PmmJQ=; b=jA8yizQ35qRWUFLbWfYIVOV4stZpYtWqJ4
	DRH2cqBCOI9lAhjxl+Fosux0jXrlgfLOakOaTeI4rFFOBqrRXjk45D4bcE2Usem1
	2xDwCY1TsCiYaYAumXtp64lsJEBU6YXB0Gcjc/i1IbfOTtI6SKaD7sS2QgqGOFzN
	RpAl++nMM=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZp0pKhUVXzcaKAA--.5553S7;
	Wed, 25 May 2016 18:58:52 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 18:58:15 +0800
Message-Id: <1464173896-4088-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZp0pKhUVXzcaKAA--.5553S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1rurWfCr4DGw45Ww18AFb_yoWrXF1UpF
	WkG3Z8Gr9rJFy7JayfAr129Fs8GF97ur1jvryxGr10vw13KrWFy3Z8Ka10yrW3XrWxZ34U
	ZrZ8WryDGF12vrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcF4iUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgx0xlZXx--fXwAAsV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 5/6] hw/char: QOM'ify xilinx_uartlite model
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
X-TUID: rHL9BC6PzHyx

* drop qemu_char_get_next_serial and use chardev prop
* create xilinx_uartlite_create wrapper function to create
  xilinx_uartlite device
* change affected board code to use the new way

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/char/xilinx_uartlite.c                | 10 +++++----
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  5 +++--
 include/hw/char/xilinx_uartlite.h        | 35 ++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 6 deletions(-)
 create mode 100644 include/hw/char/xilinx_uartlite.h

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 911af4a..4847efb 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -172,6 +172,11 @@ static const MemoryRegionOps uart_ops = {
     }
 };
 
+static Property xilinx_uartlite_properties[] = {
+    DEFINE_PROP_CHR("chardev", XilinxUARTLite, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void uart_rx(void *opaque, const uint8_t *buf, int size)
 {
     XilinxUARTLite *s = opaque;
@@ -206,8 +211,6 @@ static void xilinx_uartlite_realize(DeviceState *dev, Error **errp)
 {
     XilinxUARTLite *s = XILINX_UARTLITE(dev);
 
-    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */
-    s->chr = qemu_char_get_next_serial();
     if (s->chr)
         qemu_chr_add_handlers(s->chr, uart_can_rx, uart_rx, uart_event, s);
 }
@@ -229,8 +232,7 @@ static void xilinx_uartlite_class_init(ObjectClass *klass, void *data)
 
     dc->reset = xilinx_uartlite_reset;
     dc->realize = xilinx_uartlite_realize;
-    /* Reason: realize() method uses qemu_char_get_next_serial() */
-    dc->cannot_instantiate_with_device_add_yet = true;
+    dc->props = xilinx_uartlite_properties;
 }
 
 static const TypeInfo xilinx_uartlite_info = {
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index f821e1c..423bcd7 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -36,6 +36,7 @@
 #include "hw/boards.h"
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
+#include "hw/char/xilinx_uartlite.h"
 
 #include "boot.h"
 
@@ -103,8 +104,8 @@ petalogix_s3adsp1800_init(MachineState *machine)
         irq[i] = qdev_get_gpio_in(dev, i);
     }
 
-    sysbus_create_simple("xlnx.xps-uartlite", UARTLITE_BASEADDR,
-                         irq[UARTLITE_IRQ]);
+    xilinx_uartlite_create(UARTLITE_BASEADDR, irq[UARTLITE_IRQ],
+                           serial_hds[0]);
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_create(NULL, "xlnx.xps-timer");
diff --git a/include/hw/char/xilinx_uartlite.h b/include/hw/char/xilinx_uartlite.h
new file mode 100644
index 0000000..8b4fc54
--- /dev/null
+++ b/include/hw/char/xilinx_uartlite.h
@@ -0,0 +1,35 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef XILINX_UARTLITE_H
+#define XILINX_UARTLITE_H
+
+static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
+                                        qemu_irq irq,
+                                        CharDriverState *chr)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    dev = qdev_create(NULL, "xlnx.xps-uartlite");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(s, 0, addr);
+    sysbus_connect_irq(s, 0, irq);
+
+    return dev;
+}
+
+#endif
-- 
2.1.4



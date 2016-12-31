Received: by 10.25.205.13 with SMTP id d13csp7512296lfg;
        Fri, 30 Dec 2016 17:24:46 -0800 (PST)
X-Received: by 10.200.0.132 with SMTP id c4mr44394861qtg.44.1483147486575;
        Fri, 30 Dec 2016 17:24:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si26885474qkd.235.2016.12.30.17.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Dec 2016 17:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cN8Pd-0005v1-Uc
	for alex.bennee@linaro.org; Fri, 30 Dec 2016 20:24:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1cN8JW-0000xx-1E
	for qemu-devel@nongnu.org; Fri, 30 Dec 2016 20:18:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1cN8JV-0008VP-4F
	for qemu-devel@nongnu.org; Fri, 30 Dec 2016 20:18:25 -0500
Received: from m12-14.163.com ([220.181.12.14]:44215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1cN8JU-0008UF-Ha; Fri, 30 Dec 2016 20:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JZ0m4OPGr0x++rowxv
	IIzyLxEmBmIDmdB7QqKDJ+hMo=; b=GQHix4m5YlsdndDaxQXamsFvBnu0dmCQyu
	v01d0CRvaUirlEUcnMoWF80TMfJZTOij93HdTBWl+yDcC5kjXnQUz/T1EEuFStWx
	fZCj5xmvvaBzUnr3u2hPxspP8fdn8OSxq48awU1rPXlqQEW2ET1YRJspZ4jTz+v+
	foqzCi87Y=
Received: from localhost.localdomain (unknown [223.104.3.243])
	by smtp10 (Coremail) with SMTP id DsCowACnzZpQB2dYbQqVFw--.11118S4;
	Sat, 31 Dec 2016 09:18:15 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat, 31 Dec 2016 09:18:08 +0800
Message-Id: <20161231011808.4037-3-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161231011808.4037-1-zxq_yx_007@163.com>
References: <20161231011808.4037-1-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowACnzZpQB2dYbQqVFw--.11118S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1rJr17uw4fZFy5uFWDtwb_yoW8uw4Dpr
	WxGFnYyF4DAa1xAF43tFyUGan8Jrn7tF48Jr17Cr4fG397GrnrtF1YkrsIyFW5JrWkAFyr
	Ca1rKr1UK3WDKr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQEf5UUUUU=
X-Originating-IP: [223.104.3.243]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMxdRxlXljrws0gAAsP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 220.181.12.14
Subject: [Qemu-devel] [PATCH 2/2] hw/char: QOM'ify grlib_apbuart.c
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
Cc: i.mitsyanko@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
	chouteau@adacore.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cv9TTRnhj3wR

Drop the old Sysbus init and use instance_init and
DeviceClass::realize instead

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/char/grlib_apbuart.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index db686e6a6f..620b801f34 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -239,24 +239,28 @@ static const MemoryRegionOps grlib_apbuart_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int grlib_apbuart_init(SysBusDevice *dev)
+static void grlib_apbuart_init(Object *obj)
 {
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     UART *uart = GRLIB_APB_UART(dev);
 
-    qemu_chr_fe_set_handlers(&uart->chr,
-                             grlib_apbuart_can_receive,
-                             grlib_apbuart_receive,
-                             grlib_apbuart_event,
-                             uart, NULL, true);
-
     sysbus_init_irq(dev, &uart->irq);
 
-    memory_region_init_io(&uart->iomem, OBJECT(uart), &grlib_apbuart_ops, uart,
+    memory_region_init_io(&uart->iomem, obj, &grlib_apbuart_ops, uart,
                           "uart", UART_REG_SIZE);
 
     sysbus_init_mmio(dev, &uart->iomem);
+}
 
-    return 0;
+static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
+{
+    UART *uart = GRLIB_APB_UART(dev);
+
+    qemu_chr_fe_set_handlers(&uart->chr,
+                             grlib_apbuart_can_receive,
+                             grlib_apbuart_receive,
+                             grlib_apbuart_event,
+                             uart, NULL, true);
 }
 
 static void grlib_apbuart_reset(DeviceState *d)
@@ -280,9 +284,8 @@ static Property grlib_apbuart_properties[] = {
 static void grlib_apbuart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = grlib_apbuart_init;
+    dc->realize = grlib_apbuart_realize;
     dc->reset = grlib_apbuart_reset;
     dc->props = grlib_apbuart_properties;
 }
@@ -291,6 +294,7 @@ static const TypeInfo grlib_apbuart_info = {
     .name          = TYPE_GRLIB_APB_UART,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(UART),
+    .instance_init = grlib_apbuart_init,
     .class_init    = grlib_apbuart_class_init,
 };
 
-- 
2.11.0



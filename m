Received: by 10.25.205.13 with SMTP id d13csp7511050lfg;
        Fri, 30 Dec 2016 17:18:35 -0800 (PST)
X-Received: by 10.237.41.161 with SMTP id o30mr41101838qtd.209.1483147115216;
        Fri, 30 Dec 2016 17:18:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f130si9419806qkb.145.2016.12.30.17.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Dec 2016 17:18:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cN8Je-0000ze-I9
	for alex.bennee@linaro.org; Fri, 30 Dec 2016 20:18:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1cN8JW-0000y1-1b
	for qemu-arm@nongnu.org; Fri, 30 Dec 2016 20:18:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1cN8JV-0008VZ-7V
	for qemu-arm@nongnu.org; Fri, 30 Dec 2016 20:18:26 -0500
Received: from m12-14.163.com ([220.181.12.14]:44145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1cN8JS-0008TY-KW; Fri, 30 Dec 2016 20:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=+QiExHgp0bawUhO4UU
	5ZMKPAg4gW16VdI2JGBPE33pU=; b=YEpIFce6UhrP9C+67vbWkgbMeQislI12Ze
	n3wjnxtAvdms0nZPpYsOMtDmaXy+WZZH7rwz3Pcw+wW1NKPUVQlwL2cPEpZZ8Pgi
	b+Flo62u1tEmKLq2UQ137imOSitlUjCdhmMhVppHMMhtzdJv9JNwhaefz25xMTPR
	5N1PXpp+s=
Received: from localhost.localdomain (unknown [223.104.3.243])
	by smtp10 (Coremail) with SMTP id DsCowACnzZpQB2dYbQqVFw--.11118S3;
	Sat, 31 Dec 2016 09:18:15 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat, 31 Dec 2016 09:18:07 +0800
Message-Id: <20161231011808.4037-2-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161231011808.4037-1-zxq_yx_007@163.com>
References: <20161231011808.4037-1-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowACnzZpQB2dYbQqVFw--.11118S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1rJr1UGr4ktr45ZrWrZrb_yoW8uFWUpr
	Z7uF4DJw13JrZ7JF4S9r18GFs5AFs3Crs0qrn3CrWIyryDKrW7tr1rKFWYya17trs5AFyr
	Aa17JF15C3W7J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVLvtUUUUU=
X-Originating-IP: [223.104.3.243]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBdRxlUL-1gs+AAAs9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 220.181.12.14
Subject: [Qemu-arm] [PATCH 1/2] hw/char: QOM'ify exynos4210_uart.c
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
Cc: i.mitsyanko@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
	chouteau@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QL+x24g5zQyC

Drop the old Sysbus init and use instance_init and
DeviceClass::realize instead

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/char/exynos4210_uart.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 571c324004..820d1abeb9 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -629,22 +629,26 @@ DeviceState *exynos4210_uart_create(hwaddr addr,
     return dev;
 }
 
-static int exynos4210_uart_init(SysBusDevice *dev)
+static void exynos4210_uart_init(Object *obj)
 {
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     Exynos4210UartState *s = EXYNOS4210_UART(dev);
 
     /* memory mapping */
-    memory_region_init_io(&s->iomem, OBJECT(s), &exynos4210_uart_ops, s,
+    memory_region_init_io(&s->iomem, obj, &exynos4210_uart_ops, s,
                           "exynos4210.uart", EXYNOS4210_UART_REGS_MEM_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
 
     sysbus_init_irq(dev, &s->irq);
+}
+
+static void exynos4210_uart_realize(DeviceState *dev, Error **errp)
+{
+    Exynos4210UartState *s = EXYNOS4210_UART(dev);
 
     qemu_chr_fe_set_handlers(&s->chr, exynos4210_uart_can_receive,
                              exynos4210_uart_receive, exynos4210_uart_event,
                              s, NULL, true);
-
-    return 0;
 }
 
 static Property exynos4210_uart_properties[] = {
@@ -658,9 +662,8 @@ static Property exynos4210_uart_properties[] = {
 static void exynos4210_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = exynos4210_uart_init;
+    dc->realize = exynos4210_uart_realize;
     dc->reset = exynos4210_uart_reset;
     dc->props = exynos4210_uart_properties;
     dc->vmsd = &vmstate_exynos4210_uart;
@@ -670,6 +673,7 @@ static const TypeInfo exynos4210_uart_info = {
     .name          = TYPE_EXYNOS4210_UART,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210UartState),
+    .instance_init = exynos4210_uart_init,
     .class_init    = exynos4210_uart_class_init,
 };
 
-- 
2.11.0



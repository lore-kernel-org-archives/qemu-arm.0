Received: by 10.25.208.211 with SMTP id h202csp1237287lfg;
        Sun, 6 Mar 2016 23:10:21 -0800 (PST)
X-Received: by 10.140.94.106 with SMTP id f97mr26137994qge.95.1457334620934;
        Sun, 06 Mar 2016 23:10:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w107si15698594qge.8.2016.03.06.23.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:10:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:54026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpJ6-0007Wi-CY
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:10:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGl-0003Js-UP
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGi-0004Iu-P3
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:55 -0500
Received: from m12-15.163.com ([220.181.12.15]:49594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGi-0004IQ-7J; Mon, 07 Mar 2016 02:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=e5cdqhYiKY7ufHEpqj
	QCHkTxdtT4O947P/NlX/wiVks=; b=j4FkoCou1B8PKgZ24gtfE2wVsVa+fwnEDF
	r3wY3Dk3NwsCLRHyeP07Y/YE4bQkUuVrQUR8f5N+KcN4/sCTWTjugAln9E+Ig1NH
	hd7egExACFV7sj6JnUv/Q6CjoHAU/F90Zd3SHy+87hQyX9ZoX83RwTH1zeYhsIfQ
	WLz8AfRto=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S6;
	Mon, 07 Mar 2016 15:07:06 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:45 +0800
Message-Id: <1457334350-5675-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr48Xw4rur18XFW3urW3Jrb_yoW5Zr1Dpa
	92qFyvgr4UJFsrJr93GF1DGFyDXwn3CrWxKr1xJ3Zak3Wkur1FyF1kA3yayFWqgrZ3ua15
	Xw4kAw1fJw1Uuw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsfHUUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhslxlWBPfCR7wABsI
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 4/9] hw/arm: QOM'ify pxa2xx.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yHY1bGPaOhK/

Drop the use of old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/pxa2xx.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index ff6ac7a..8bdffca 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1103,9 +1103,10 @@ static const MemoryRegionOps pxa2xx_rtc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int pxa2xx_rtc_init(SysBusDevice *dev)
+static void pxa2xx_rtc_init(Object *obj)
 {
-    PXA2xxRTCState *s = PXA2XX_RTC(dev);
+    PXA2xxRTCState *s = PXA2XX_RTC(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     struct tm tm;
     int wom;
 
@@ -1134,11 +1135,9 @@ static int pxa2xx_rtc_init(SysBusDevice *dev)
 
     sysbus_init_irq(dev, &s->rtc_irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &pxa2xx_rtc_ops, s,
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_rtc_ops, s,
                           "pxa2xx-rtc", 0x10000);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static void pxa2xx_rtc_pre_save(void *opaque)
@@ -1191,9 +1190,7 @@ static const VMStateDescription vmstate_pxa2xx_rtc_regs = {
 static void pxa2xx_rtc_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pxa2xx_rtc_init;
     dc->desc = "PXA2xx RTC Controller";
     dc->vmsd = &vmstate_pxa2xx_rtc_regs;
 }
@@ -1202,6 +1199,7 @@ static const TypeInfo pxa2xx_rtc_sysbus_info = {
     .name          = TYPE_PXA2XX_RTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PXA2xxRTCState),
+    .instance_init = pxa2xx_rtc_init,
     .class_init    = pxa2xx_rtc_sysbus_class_init,
 };
 
@@ -1497,19 +1495,18 @@ PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
     return s;
 }
 
-static int pxa2xx_i2c_initfn(SysBusDevice *sbd)
+static void pxa2xx_i2c_initfn(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    PXA2xxI2CState *s = PXA2XX_I2C(dev);
+    DeviceState *dev = DEVICE(obj);
+    PXA2xxI2CState *s = PXA2XX_I2C(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->bus = i2c_init_bus(dev, "i2c");
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &pxa2xx_i2c_ops, s,
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_i2c_ops, s,
                           "pxa2xx-i2c", s->region_size);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
-
-    return 0;
 }
 
 I2CBus *pxa2xx_i2c_bus(PXA2xxI2CState *s)
@@ -1526,9 +1523,7 @@ static Property pxa2xx_i2c_properties[] = {
 static void pxa2xx_i2c_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pxa2xx_i2c_initfn;
     dc->desc = "PXA2xx I2C Bus Controller";
     dc->vmsd = &vmstate_pxa2xx_i2c;
     dc->props = pxa2xx_i2c_properties;
@@ -1538,6 +1533,7 @@ static const TypeInfo pxa2xx_i2c_info = {
     .name          = TYPE_PXA2XX_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PXA2xxI2CState),
+    .instance_init = pxa2xx_i2c_initfn,
     .class_init    = pxa2xx_i2c_class_init,
 };
 
-- 
2.1.4



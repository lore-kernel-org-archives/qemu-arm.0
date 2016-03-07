Received: by 10.25.208.211 with SMTP id h202csp1237752lfg;
        Sun, 6 Mar 2016 23:11:36 -0800 (PST)
X-Received: by 10.141.6.136 with SMTP id i130mr27772163qhd.21.1457334696130;
        Sun, 06 Mar 2016 23:11:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si15675510qka.72.2016.03.06.23.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:54035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpKJ-0000x7-Ik
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:11:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGl-0003Jv-VP
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGk-0004J9-El
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:55 -0500
Received: from m12-15.163.com ([220.181.12.15]:49363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGh-0004IN-Sq; Mon, 07 Mar 2016 02:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=0RlQwrC14P/TdGZs8u
	cPPIBIBuUVlEoB9/ppRGkjCXQ=; b=THUPlet94eH2oQKkz8+ayd70kuzxk8VYSj
	VptHKOUEfqv4BrbeHPdMF2dNgVBVf6YEZnyTZfXa6/cvIsR4jRipg1Whdjuu+YnG
	yUu+VEfEnzXmpR4MJSEq3TQ2kM4NHraKze7UcUcCDjpwu65XHoXTGHy1KOVMQORB
	NL7N+1tQ8=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S9;
	Mon, 07 Mar 2016 15:07:09 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:48 +0800
Message-Id: <1457334350-5675-8-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr1DKr45Zr4kJw13JF47Arb_yoWrKw15pa
	sxXan8uF4DGF4kXF17trZ7GFn5Cwn7Ww1fKFn7Grsav3Wqkry5XFn5Cay7KFZrArW0ya45
	CFW8Ja4UWa1Ykw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxucNUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOx0lxlXlSMIJ-wAAsJ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 7/9] hw/arm: QOM'ify stellaris.c
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
X-TUID: BV0sNOkLCleZ

* Drop the use of old SysBus init function and use instance_init
* Use DeviceClass::vmsd instead of 'vmstate_register' function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/stellaris.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index de8dbb2..cc0e0ae 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -315,23 +315,22 @@ static const VMStateDescription vmstate_stellaris_gptm = {
     }
 };
 
-static int stellaris_gptm_init(SysBusDevice *sbd)
+static void stellaris_gptm_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    gptm_state *s = STELLARIS_GPTM(dev);
+    DeviceState *dev = DEVICE(obj);
+    gptm_state *s = STELLARIS_GPTM(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(sbd, &s->irq);
     qdev_init_gpio_out(dev, &s->trigger, 1);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &gptm_ops, s,
+    memory_region_init_io(&s->iomem, obj, &gptm_ops, s,
                           "gptm", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
 
     s->opaque[0] = s->opaque[1] = s;
     s->timer[0] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[0]);
     s->timer[1] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[1]);
-    vmstate_register(dev, -1, &vmstate_stellaris_gptm, s);
-    return 0;
 }
 
 
@@ -872,23 +871,22 @@ static const VMStateDescription vmstate_stellaris_i2c = {
     }
 };
 
-static int stellaris_i2c_init(SysBusDevice *sbd)
+static void stellaris_i2c_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    stellaris_i2c_state *s = STELLARIS_I2C(dev);
+    DeviceState *dev = DEVICE(obj);
+    stellaris_i2c_state *s = STELLARIS_I2C(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
     sysbus_init_irq(sbd, &s->irq);
     bus = i2c_init_bus(dev, "i2c");
     s->bus = bus;
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &stellaris_i2c_ops, s,
+    memory_region_init_io(&s->iomem, obj, &stellaris_i2c_ops, s,
                           "i2c", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     /* ??? For now we only implement the master interface.  */
     stellaris_i2c_reset(s);
-    vmstate_register(dev, -1, &vmstate_stellaris_i2c, s);
-    return 0;
 }
 
 /* Analogue to Digital Converter.  This is only partially implemented,
@@ -1159,23 +1157,22 @@ static const VMStateDescription vmstate_stellaris_adc = {
     }
 };
 
-static int stellaris_adc_init(SysBusDevice *sbd)
+static void stellaris_adc_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    stellaris_adc_state *s = STELLARIS_ADC(dev);
+    DeviceState *dev = DEVICE(obj);
+    stellaris_adc_state *s = STELLARIS_ADC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int n;
 
     for (n = 0; n < 4; n++) {
         sysbus_init_irq(sbd, &s->irq[n]);
     }
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &stellaris_adc_ops, s,
+    memory_region_init_io(&s->iomem, obj, &stellaris_adc_ops, s,
                           "adc", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     stellaris_adc_reset(s);
     qdev_init_gpio_in(dev, stellaris_adc_trigger, 1);
-    vmstate_register(dev, -1, &vmstate_stellaris_adc, s);
-    return 0;
 }
 
 static
@@ -1424,43 +1421,46 @@ machine_init(stellaris_machine_init)
 
 static void stellaris_i2c_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
-    sdc->init = stellaris_i2c_init;
+    dc->vmsd = &vmstate_stellaris_i2c;
 }
 
 static const TypeInfo stellaris_i2c_info = {
     .name          = TYPE_STELLARIS_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(stellaris_i2c_state),
+    .instance_init = stellaris_i2c_init,
     .class_init    = stellaris_i2c_class_init,
 };
 
 static void stellaris_gptm_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
-    sdc->init = stellaris_gptm_init;
+    dc->vmsd = &vmstate_stellaris_gptm;
 }
 
 static const TypeInfo stellaris_gptm_info = {
     .name          = TYPE_STELLARIS_GPTM,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(gptm_state),
+    .instance_init = stellaris_gptm_init,
     .class_init    = stellaris_gptm_class_init,
 };
 
 static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
-    sdc->init = stellaris_adc_init;
+    dc->vmsd = &vmstate_stellaris_adc;
 }
 
 static const TypeInfo stellaris_adc_info = {
     .name          = TYPE_STELLARIS_ADC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(stellaris_adc_state),
+    .instance_init = stellaris_adc_init,
     .class_init    = stellaris_adc_class_init,
 };
 
-- 
2.1.4



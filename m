Received: by 10.25.208.211 with SMTP id h202csp1238041lfg;
        Sun, 6 Mar 2016 23:12:30 -0800 (PST)
X-Received: by 10.140.154.198 with SMTP id a189mr26900321qha.44.1457334750175;
        Sun, 06 Mar 2016 23:12:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18si15695498qkb.8.2016.03.06.23.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:54042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpLB-0002M2-J9
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:12:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGe-00034J-4Z
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGc-0004GB-6F
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:48 -0500
Received: from m12-15.163.com ([220.181.12.15]:47935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGb-0004Ao-2C; Mon, 07 Mar 2016 02:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=CD0tvGNe1FkiY84dp+
	97n4jfLbrLUJ1be4QM7nC8y4Q=; b=kvJi7yXHuDDN5WPPAXC70vXpzbt4CwVo0z
	QKiEQco51dr1zQguWlAOyVlQdDfc7VWV42ILvA4QlUs2e5lF1aA09G8tnsN31hcS
	qhxNrd/GANP+jJRb6ZV2hid0nx0NIEzMkVirM6qRtLM4mL/OUJASe77opvRzWhJn
	tIh3mMkgs=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S10;
	Mon, 07 Mar 2016 15:07:09 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:49 +0800
Message-Id: <1457334350-5675-9-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S10
X-Coremail-Antispam: 1Uf129KBjvJXoW3GrWkAr1UZr48Aw48ZFWrZrb_yoW3ZFy3pF
	yxZ3WDWr48JFsxXr1ftryDWF18twn7Krn7tFn2yrn2kw4293yYvFWvya9IkFyUt3y8C3Z0
	yrWrWr97Gan8Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxucNUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEB4lxlUL7FywHwAAss
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 8/9] hw/arm: QOM'ify strongarm.c
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
X-TUID: cNzIrQI+Ac3K

Drop the use of old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/strongarm.c | 66 +++++++++++++++++++++++-------------------------------
 1 file changed, 28 insertions(+), 38 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 3b17a21..78f58c6 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -177,19 +177,18 @@ static const MemoryRegionOps strongarm_pic_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int strongarm_pic_initfn(SysBusDevice *sbd)
+static void strongarm_pic_initfn(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    StrongARMPICState *s = STRONGARM_PIC(dev);
+    DeviceState *dev = DEVICE(obj);
+    StrongARMPICState *s = STRONGARM_PIC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     qdev_init_gpio_in(dev, strongarm_pic_set_irq, SA_PIC_SRCS);
-    memory_region_init_io(&s->iomem, OBJECT(s), &strongarm_pic_ops, s,
+    memory_region_init_io(&s->iomem, obj, &strongarm_pic_ops, s,
                           "pic", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     sysbus_init_irq(sbd, &s->fiq);
-
-    return 0;
 }
 
 static int strongarm_pic_post_load(void *opaque, int version_id)
@@ -215,9 +214,7 @@ static VMStateDescription vmstate_strongarm_pic_regs = {
 static void strongarm_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = strongarm_pic_initfn;
     dc->desc = "StrongARM PIC";
     dc->vmsd = &vmstate_strongarm_pic_regs;
 }
@@ -226,6 +223,7 @@ static const TypeInfo strongarm_pic_info = {
     .name          = TYPE_STRONGARM_PIC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(StrongARMPICState),
+    .instance_init = strongarm_pic_initfn,
     .class_init    = strongarm_pic_class_init,
 };
 
@@ -379,9 +377,10 @@ static const MemoryRegionOps strongarm_rtc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int strongarm_rtc_init(SysBusDevice *dev)
+static void strongarm_rtc_init(Object *obj)
 {
-    StrongARMRTCState *s = STRONGARM_RTC(dev);
+    StrongARMRTCState *s = STRONGARM_RTC(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     struct tm tm;
 
     s->rttr = 0x0;
@@ -398,11 +397,9 @@ static int strongarm_rtc_init(SysBusDevice *dev)
     sysbus_init_irq(dev, &s->rtc_irq);
     sysbus_init_irq(dev, &s->rtc_hz_irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &strongarm_rtc_ops, s,
+    memory_region_init_io(&s->iomem, obj, &strongarm_rtc_ops, s,
                           "rtc", 0x10000);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static void strongarm_rtc_pre_save(void *opaque)
@@ -441,9 +438,7 @@ static const VMStateDescription vmstate_strongarm_rtc_regs = {
 static void strongarm_rtc_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = strongarm_rtc_init;
     dc->desc = "StrongARM RTC Controller";
     dc->vmsd = &vmstate_strongarm_rtc_regs;
 }
@@ -452,6 +447,7 @@ static const TypeInfo strongarm_rtc_sysbus_info = {
     .name          = TYPE_STRONGARM_RTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(StrongARMRTCState),
+    .instance_init = strongarm_rtc_init,
     .class_init    = strongarm_rtc_sysbus_class_init,
 };
 
@@ -644,16 +640,17 @@ static DeviceState *strongarm_gpio_init(hwaddr base,
     return dev;
 }
 
-static int strongarm_gpio_initfn(SysBusDevice *sbd)
+static void strongarm_gpio_initfn(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    StrongARMGPIOInfo *s = STRONGARM_GPIO(dev);
+    DeviceState *dev = DEVICE(obj);
+    StrongARMGPIOInfo *s = STRONGARM_GPIO(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int i;
 
     qdev_init_gpio_in(dev, strongarm_gpio_set, 28);
     qdev_init_gpio_out(dev, s->handler, 28);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &strongarm_gpio_ops, s,
+    memory_region_init_io(&s->iomem, obj, &strongarm_gpio_ops, s,
                           "gpio", 0x1000);
 
     sysbus_init_mmio(sbd, &s->iomem);
@@ -661,8 +658,6 @@ static int strongarm_gpio_initfn(SysBusDevice *sbd)
         sysbus_init_irq(sbd, &s->irqs[i]);
     }
     sysbus_init_irq(sbd, &s->irqX);
-
-    return 0;
 }
 
 static const VMStateDescription vmstate_strongarm_gpio_regs = {
@@ -685,9 +680,7 @@ static const VMStateDescription vmstate_strongarm_gpio_regs = {
 static void strongarm_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = strongarm_gpio_initfn;
     dc->desc = "StrongARM GPIO controller";
     dc->vmsd = &vmstate_strongarm_gpio_regs;
 }
@@ -696,6 +689,7 @@ static const TypeInfo strongarm_gpio_info = {
     .name          = TYPE_STRONGARM_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(StrongARMGPIOInfo),
+    .instance_init = strongarm_gpio_initfn,
     .class_init    = strongarm_gpio_class_init,
 };
 
@@ -822,20 +816,19 @@ static const MemoryRegionOps strongarm_ppc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int strongarm_ppc_init(SysBusDevice *sbd)
+static void strongarm_ppc_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    StrongARMPPCInfo *s = STRONGARM_PPC(dev);
+    DeviceState *dev = DEVICE(obj);
+    StrongARMPPCInfo *s = STRONGARM_PPC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     qdev_init_gpio_in(dev, strongarm_ppc_set, 22);
     qdev_init_gpio_out(dev, s->handler, 22);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &strongarm_ppc_ops, s,
+    memory_region_init_io(&s->iomem, obj, &strongarm_ppc_ops, s,
                           "ppc", 0x1000);
 
     sysbus_init_mmio(sbd, &s->iomem);
-
-    return 0;
 }
 
 static const VMStateDescription vmstate_strongarm_ppc_regs = {
@@ -857,9 +850,7 @@ static const VMStateDescription vmstate_strongarm_ppc_regs = {
 static void strongarm_ppc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = strongarm_ppc_init;
     dc->desc = "StrongARM PPC controller";
     dc->vmsd = &vmstate_strongarm_ppc_regs;
 }
@@ -868,6 +859,7 @@ static const TypeInfo strongarm_ppc_info = {
     .name          = TYPE_STRONGARM_PPC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(StrongARMPPCInfo),
+    .instance_init = strongarm_ppc_init,
     .class_init    = strongarm_ppc_class_init,
 };
 
@@ -1229,11 +1221,12 @@ static const MemoryRegionOps strongarm_uart_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int strongarm_uart_init(SysBusDevice *dev)
+static void strongarm_uart_init(Object *obj)
 {
-    StrongARMUARTState *s = STRONGARM_UART(dev);
+    StrongARMUARTState *s = STRONGARM_UART(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &strongarm_uart_ops, s,
+    memory_region_init_io(&s->iomem, obj, &strongarm_uart_ops, s,
                           "uart", 0x10000);
     sysbus_init_mmio(dev, &s->iomem);
     sysbus_init_irq(dev, &s->irq);
@@ -1248,8 +1241,6 @@ static int strongarm_uart_init(SysBusDevice *dev)
                         strongarm_uart_event,
                         s);
     }
-
-    return 0;
 }
 
 static void strongarm_uart_reset(DeviceState *dev)
@@ -1319,9 +1310,7 @@ static Property strongarm_uart_properties[] = {
 static void strongarm_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = strongarm_uart_init;
     dc->desc = "StrongARM UART controller";
     dc->reset = strongarm_uart_reset;
     dc->vmsd = &vmstate_strongarm_uart_regs;
@@ -1332,6 +1321,7 @@ static const TypeInfo strongarm_uart_info = {
     .name          = TYPE_STRONGARM_UART,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(StrongARMUARTState),
+    .instance_init = strongarm_uart_init,
     .class_init    = strongarm_uart_class_init,
 };
 
-- 
2.1.4



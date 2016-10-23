Received: by 10.80.166.35 with SMTP id d32csp2124066edc;
        Sun, 23 Oct 2016 02:20:47 -0700 (PDT)
X-Received: by 10.200.56.67 with SMTP id r3mr10033439qtb.120.1477214447412;
        Sun, 23 Oct 2016 02:20:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6si7479094qtd.65.2016.10.23.02.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 02:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byExS-0000ku-R6
	for alex.bennee@linaro.org; Sun, 23 Oct 2016 05:20:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvi-0008GB-Bq
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvd-0002cW-Sb
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:58 -0400
Received: from m12-11.163.com ([220.181.12.11]:39479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1byEvc-0002ah-Oh; Sun, 23 Oct 2016 05:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=V/uJ6WnXGc+HIUZ4F4
	Ao4Yd8/hsdfzCvXL4MT9m709M=; b=KuEb0NIiTLYRVjXvIWIp+zdZFBEx354iWR
	ihid8Z/mUvBst4tXY0jHbG0cXYRkzIY/ewfGEFVZx4gIamtb1nKuqPNOQj3LHtx9
	m87FL3yKnE+862PeStrbchVRdJUUSvmUckl/oYPHfsICqXE3QHWQ0jybXc4xM2Cj
	cLZaO5+N8=
Received: from debian.lan (unknown [114.111.167.207])
	by smtp7 (Coremail) with SMTP id C8CowACHR3FSgAxYG4EdBQ--.32654S3;
	Sun, 23 Oct 2016 17:18:20 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Oct 2016 17:18:13 +0800
Message-Id: <20161023091816.3839-2-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161023091816.3839-1-zxq_yx_007@163.com>
References: <20161023091816.3839-1-zxq_yx_007@163.com>
X-CM-TRANSID: C8CowACHR3FSgAxYG4EdBQ--.32654S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3tFWftry5uw4DXry8tr4Dtwb_yoWDtw1xpF
	9xZFnIqa1DJFZrXrZ3Xr1kKF95Cws2kF18Kw1Igrs7Cr47KryrJFs3C3yYyw1YgrWFv3W5
	Xa40yFyxXayUGw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bnnm_UUUUU=
X-Originating-IP: [114.111.167.207]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEhwMxlZX0PE78wAAss
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Subject: [Qemu-devel] [PATCH 1/4] hw/arm: QOM'ify musicpal.c
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KrFS84eZEtCa

Drop the old Sysbus init and use instance_init and
DeviceClass::realize instead

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/musicpal.c | 88 ++++++++++++++++++++++++++++---------------------------
 1 file changed, 45 insertions(+), 43 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 7527037..cbbca4e 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -384,18 +384,24 @@ static NetClientInfo net_mv88w8618_info = {
     .cleanup = eth_cleanup,
 };
 
-static int mv88w8618_eth_init(SysBusDevice *sbd)
+static void mv88w8618_eth_init(Object *obj)
 {
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     DeviceState *dev = DEVICE(sbd);
     mv88w8618_eth_state *s = MV88W8618_ETH(dev);
 
     sysbus_init_irq(sbd, &s->irq);
-    s->nic = qemu_new_nic(&net_mv88w8618_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
-    memory_region_init_io(&s->iomem, OBJECT(s), &mv88w8618_eth_ops, s,
+    memory_region_init_io(&s->iomem, obj, &mv88w8618_eth_ops, s,
                           "mv88w8618-eth", MP_ETH_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
-    return 0;
+}
+
+static void mv88w8618_eth_realize(DeviceState *dev, Error **errp)
+{
+    mv88w8618_eth_state *s = MV88W8618_ETH(dev);
+
+    s->nic = qemu_new_nic(&net_mv88w8618_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), dev->id, s);
 }
 
 static const VMStateDescription mv88w8618_eth_vmsd = {
@@ -423,17 +429,17 @@ static Property mv88w8618_eth_properties[] = {
 static void mv88w8618_eth_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = mv88w8618_eth_init;
     dc->vmsd = &mv88w8618_eth_vmsd;
     dc->props = mv88w8618_eth_properties;
+    dc->realize = mv88w8618_eth_realize;
 }
 
 static const TypeInfo mv88w8618_eth_info = {
     .name          = TYPE_MV88W8618_ETH,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(mv88w8618_eth_state),
+    .instance_init = mv88w8618_eth_init,
     .class_init    = mv88w8618_eth_class_init,
 };
 
@@ -615,23 +621,26 @@ static const GraphicHwOps musicpal_gfx_ops = {
     .gfx_update  = lcd_refresh,
 };
 
-static int musicpal_lcd_init(SysBusDevice *sbd)
+static void musicpal_lcd_realize(DeviceState *dev, Error **errp)
+{
+    musicpal_lcd_state *s = MUSICPAL_LCD(dev);
+    s->con = graphic_console_init(dev, 0, &musicpal_gfx_ops, s);
+    qemu_console_resize(s->con, 128 * 3, 64 * 3);
+}
+
+static void musicpal_lcd_init(Object *obj)
 {
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     DeviceState *dev = DEVICE(sbd);
     musicpal_lcd_state *s = MUSICPAL_LCD(dev);
 
     s->brightness = 7;
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &musicpal_lcd_ops, s,
+    memory_region_init_io(&s->iomem, obj, &musicpal_lcd_ops, s,
                           "musicpal-lcd", MP_LCD_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
 
-    s->con = graphic_console_init(dev, 0, &musicpal_gfx_ops, s);
-    qemu_console_resize(s->con, 128*3, 64*3);
-
     qdev_init_gpio_in(dev, musicpal_lcd_gpio_brightness_in, 3);
-
-    return 0;
 }
 
 static const VMStateDescription musicpal_lcd_vmsd = {
@@ -652,16 +661,16 @@ static const VMStateDescription musicpal_lcd_vmsd = {
 static void musicpal_lcd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = musicpal_lcd_init;
     dc->vmsd = &musicpal_lcd_vmsd;
+    dc->realize = musicpal_lcd_realize;
 }
 
 static const TypeInfo musicpal_lcd_info = {
     .name          = TYPE_MUSICPAL_LCD,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(musicpal_lcd_state),
+    .instance_init = musicpal_lcd_init,
     .class_init    = musicpal_lcd_class_init,
 };
 
@@ -748,16 +757,16 @@ static const MemoryRegionOps mv88w8618_pic_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int mv88w8618_pic_init(SysBusDevice *dev)
+static void mv88w8618_pic_init(Object *obj)
 {
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     mv88w8618_pic_state *s = MV88W8618_PIC(dev);
 
     qdev_init_gpio_in(DEVICE(dev), mv88w8618_pic_set_irq, 32);
     sysbus_init_irq(dev, &s->parent_irq);
-    memory_region_init_io(&s->iomem, OBJECT(s), &mv88w8618_pic_ops, s,
+    memory_region_init_io(&s->iomem, obj, &mv88w8618_pic_ops, s,
                           "musicpal-pic", MP_PIC_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-    return 0;
 }
 
 static const VMStateDescription mv88w8618_pic_vmsd = {
@@ -774,9 +783,7 @@ static const VMStateDescription mv88w8618_pic_vmsd = {
 static void mv88w8618_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = mv88w8618_pic_init;
     dc->reset = mv88w8618_pic_reset;
     dc->vmsd = &mv88w8618_pic_vmsd;
 }
@@ -785,6 +792,7 @@ static const TypeInfo mv88w8618_pic_info = {
     .name          = TYPE_MV88W8618_PIC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(mv88w8618_pic_state),
+    .instance_init = mv88w8618_pic_init,
     .class_init    = mv88w8618_pic_class_init,
 };
 
@@ -913,8 +921,9 @@ static const MemoryRegionOps mv88w8618_pit_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int mv88w8618_pit_init(SysBusDevice *dev)
+static void mv88w8618_pit_init(Object *obj)
 {
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     mv88w8618_pit_state *s = MV88W8618_PIT(dev);
     int i;
 
@@ -924,10 +933,9 @@ static int mv88w8618_pit_init(SysBusDevice *dev)
         mv88w8618_timer_init(dev, &s->timer[i], 1000000);
     }
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &mv88w8618_pit_ops, s,
+    memory_region_init_io(&s->iomem, obj, &mv88w8618_pit_ops, s,
                           "musicpal-pit", MP_PIT_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-    return 0;
 }
 
 static const VMStateDescription mv88w8618_timer_vmsd = {
@@ -955,9 +963,7 @@ static const VMStateDescription mv88w8618_pit_vmsd = {
 static void mv88w8618_pit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = mv88w8618_pit_init;
     dc->reset = mv88w8618_pit_reset;
     dc->vmsd = &mv88w8618_pit_vmsd;
 }
@@ -966,6 +972,7 @@ static const TypeInfo mv88w8618_pit_info = {
     .name          = TYPE_MV88W8618_PIT,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(mv88w8618_pit_state),
+    .instance_init = mv88w8618_pit_init,
     .class_init    = mv88w8618_pit_class_init,
 };
 
@@ -1018,15 +1025,15 @@ static const MemoryRegionOps mv88w8618_flashcfg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int mv88w8618_flashcfg_init(SysBusDevice *dev)
+static void mv88w8618_flashcfg_init(Object *obj)
 {
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     mv88w8618_flashcfg_state *s = MV88W8618_FLASHCFG(dev);
 
     s->cfgr0 = 0xfffe4285; /* Default as set by U-Boot for 8 MB flash */
-    memory_region_init_io(&s->iomem, OBJECT(s), &mv88w8618_flashcfg_ops, s,
+    memory_region_init_io(&s->iomem, obj, &mv88w8618_flashcfg_ops, s,
                           "musicpal-flashcfg", MP_FLASHCFG_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-    return 0;
 }
 
 static const VMStateDescription mv88w8618_flashcfg_vmsd = {
@@ -1042,9 +1049,7 @@ static const VMStateDescription mv88w8618_flashcfg_vmsd = {
 static void mv88w8618_flashcfg_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = mv88w8618_flashcfg_init;
     dc->vmsd = &mv88w8618_flashcfg_vmsd;
 }
 
@@ -1052,6 +1057,7 @@ static const TypeInfo mv88w8618_flashcfg_info = {
     .name          = TYPE_MV88W8618_FLASHCFG,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(mv88w8618_flashcfg_state),
+    .instance_init = mv88w8618_flashcfg_init,
     .class_init    = mv88w8618_flashcfg_class_init,
 };
 
@@ -1350,22 +1356,21 @@ static void musicpal_gpio_reset(DeviceState *d)
     s->isr = 0;
 }
 
-static int musicpal_gpio_init(SysBusDevice *sbd)
+static void musicpal_gpio_init(Object *obj)
 {
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     DeviceState *dev = DEVICE(sbd);
     musicpal_gpio_state *s = MUSICPAL_GPIO(dev);
 
     sysbus_init_irq(sbd, &s->irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &musicpal_gpio_ops, s,
+    memory_region_init_io(&s->iomem, obj, &musicpal_gpio_ops, s,
                           "musicpal-gpio", MP_GPIO_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
 
     qdev_init_gpio_out(dev, s->out, ARRAY_SIZE(s->out));
 
     qdev_init_gpio_in(dev, musicpal_gpio_pin_event, 32);
-
-    return 0;
 }
 
 static const VMStateDescription musicpal_gpio_vmsd = {
@@ -1386,9 +1391,7 @@ static const VMStateDescription musicpal_gpio_vmsd = {
 static void musicpal_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = musicpal_gpio_init;
     dc->reset = musicpal_gpio_reset;
     dc->vmsd = &musicpal_gpio_vmsd;
 }
@@ -1397,6 +1400,7 @@ static const TypeInfo musicpal_gpio_info = {
     .name          = TYPE_MUSICPAL_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(musicpal_gpio_state),
+    .instance_init = musicpal_gpio_init,
     .class_init    = musicpal_gpio_class_init,
 };
 
@@ -1516,12 +1520,13 @@ static void musicpal_key_event(void *opaque, int keycode)
     s->kbd_extended = 0;
 }
 
-static int musicpal_key_init(SysBusDevice *sbd)
+static void musicpal_key_init(Object *obj)
 {
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     DeviceState *dev = DEVICE(sbd);
     musicpal_key_state *s = MUSICPAL_KEY(dev);
 
-    memory_region_init(&s->iomem, OBJECT(s), "dummy", 0);
+    memory_region_init(&s->iomem, obj, "dummy", 0);
     sysbus_init_mmio(sbd, &s->iomem);
 
     s->kbd_extended = 0;
@@ -1530,8 +1535,6 @@ static int musicpal_key_init(SysBusDevice *sbd)
     qdev_init_gpio_out(dev, s->out, ARRAY_SIZE(s->out));
 
     qemu_add_kbd_event_handler(musicpal_key_event, s);
-
-    return 0;
 }
 
 static const VMStateDescription musicpal_key_vmsd = {
@@ -1548,9 +1551,7 @@ static const VMStateDescription musicpal_key_vmsd = {
 static void musicpal_key_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = musicpal_key_init;
     dc->vmsd = &musicpal_key_vmsd;
 }
 
@@ -1558,6 +1559,7 @@ static const TypeInfo musicpal_key_info = {
     .name          = TYPE_MUSICPAL_KEY,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(musicpal_key_state),
+    .instance_init = musicpal_key_init,
     .class_init    = musicpal_key_class_init,
 };
 
-- 
2.9.3



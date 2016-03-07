Received: by 10.25.208.211 with SMTP id h202csp1238277lfg;
        Sun, 6 Mar 2016 23:13:11 -0800 (PST)
X-Received: by 10.140.252.197 with SMTP id x188mr27956140qhc.81.1457334783615;
        Sun, 06 Mar 2016 23:13:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y206si15675508qka.77.2016.03.06.23.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:13:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:54054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpLj-00034c-2y
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:13:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGx-0003gG-6l
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 02:08:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGw-0004M2-1m
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 02:08:07 -0500
Received: from m12-15.163.com ([220.181.12.15]:50064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGq-0004Ja-Po; Mon, 07 Mar 2016 02:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=mO/uwxqs5Jj9LZMTVM
	9g80qRu5AJUTrxdnwEvOng4mc=; b=C2IU9Y5EQDrpmFGdE/GiJHY1BVWf+WfXCe
	H1wzqJYTgyHaauFUT/m2k724ia6PozcLXnGYCk0TlwLqMOT4LGpHJMIrE6XpFJY3
	NBul4T8Y3hVJGFetaVyYJtskjd4za7cwYmPYujYNKnTUt3GUDHw2emAqntzDde/U
	hW5FDsxcE=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S8;
	Mon, 07 Mar 2016 15:07:08 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:47 +0800
Message-Id: <1457334350-5675-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr48Xw4DuF17ZFy7Aw48Crg_yoW5Zr1UpF
	Z7ZFs7CrWjqF4DXr4ftFsxuF4UAwn3CFyxKrnrWr9ak3srCryUXFsIyayayFWDJaykAF15
	Xr48Wa48G3W8Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxucNUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0h0lxlUL91wjdgAAsM
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, balrogg@gmail.com,
	peter.maydell@linaro.org
Subject: [Qemu-arm] [PATCH 6/9] hw/arm: QOM'ify spitz.c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5uuoD5t3/Ru1

Drop the use of old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/spitz.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 607cb58..670acc5 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -163,9 +163,10 @@ static void sl_flash_register(PXA2xxState *cpu, int size)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, FLASH_BASE);
 }
 
-static int sl_nand_init(SysBusDevice *dev)
+static void sl_nand_init(Object *obj)
 {
-    SLNANDState *s = SL_NAND(dev);
+    SLNANDState *s = SL_NAND(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     DriveInfo *nand;
 
     s->ctl = 0;
@@ -174,10 +175,8 @@ static int sl_nand_init(SysBusDevice *dev)
     s->nand = nand_init(nand ? blk_by_legacy_dinfo(nand) : NULL,
                         s->manf_id, s->chip_id);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &sl_ops, s, "sl", 0x40);
+    memory_region_init_io(&s->iomem, obj, &sl_ops, s, "sl", 0x40);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 /* Spitz Keyboard */
@@ -500,10 +499,10 @@ static void spitz_keyboard_register(PXA2xxState *cpu)
     qemu_add_kbd_event_handler(spitz_keyboard_handler, s);
 }
 
-static int spitz_keyboard_init(SysBusDevice *sbd)
+static void spitz_keyboard_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    SpitzKeyboardState *s = SPITZ_KEYBOARD(dev);
+    DeviceState *dev = DEVICE(obj);
+    SpitzKeyboardState *s = SPITZ_KEYBOARD(obj);
     int i, j;
 
     for (i = 0; i < 0x80; i ++)
@@ -518,8 +517,6 @@ static int spitz_keyboard_init(SysBusDevice *sbd)
     s->kbdtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, spitz_keyboard_tick, s);
     qdev_init_gpio_in(dev, spitz_keyboard_strobe, SPITZ_KEY_STROBE_NUM);
     qdev_init_gpio_out(dev, s->sense, SPITZ_KEY_SENSE_NUM);
-
-    return 0;
 }
 
 /* LCD backlight controller */
@@ -1064,9 +1061,7 @@ static Property sl_nand_properties[] = {
 static void sl_nand_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = sl_nand_init;
     dc->vmsd = &vmstate_sl_nand_info;
     dc->props = sl_nand_properties;
     /* Reason: init() method uses drive_get() */
@@ -1077,6 +1072,7 @@ static const TypeInfo sl_nand_info = {
     .name          = TYPE_SL_NAND,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SLNANDState),
+    .instance_init = sl_nand_init,
     .class_init    = sl_nand_class_init,
 };
 
@@ -1096,9 +1092,7 @@ static VMStateDescription vmstate_spitz_kbd = {
 static void spitz_keyboard_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = spitz_keyboard_init;
     dc->vmsd = &vmstate_spitz_kbd;
 }
 
@@ -1106,6 +1100,7 @@ static const TypeInfo spitz_keyboard_info = {
     .name          = TYPE_SPITZ_KEYBOARD,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SpitzKeyboardState),
+    .instance_init = spitz_keyboard_init,
     .class_init    = spitz_keyboard_class_init,
 };
 
-- 
2.1.4



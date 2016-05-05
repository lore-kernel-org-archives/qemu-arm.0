Received: by 10.25.208.137 with SMTP id h131csp492670lfg;
        Wed, 4 May 2016 20:10:03 -0700 (PDT)
X-Received: by 10.28.47.206 with SMTP id v197mr707521wmv.87.1462417803725;
        Wed, 04 May 2016 20:10:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u123si1054608wmu.54.2016.05.04.20.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 20:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay9fe-000734-GU
	for alex.bennee@linaro.org; Wed, 04 May 2016 23:09:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9d0-0001ll-6O
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9co-0002Qs-HN
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:06:56 -0400
Received: from m12-12.163.com ([220.181.12.12]:48193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay9cI-00025m-Ja; Wed, 04 May 2016 23:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=DYTM39KvO4gAoeRpef
	vWzkanCIN4RMQfuwmYPFnXgBE=; b=HnM2H8ag7xQSBDzfBjXHjc3qjyeq9p5aJ4
	y2nwEZx+3ZY0x8r5oiBCj5Z61cJgftrKtAKpuOfjdWtCb1R15oIlAlBu6+iqRd9q
	PMgpAM0lp6XbwiQqJCrjux6vVdTjT2K/K1rQj4WI/2mj/4LqNfYvtxj41qInxZ7d
	a5MYrh1KM=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXJrdyuCpXst8DBg--.1983S4;
	Thu, 05 May 2016 11:05:46 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 May 2016 11:04:46 +0800
Message-Id: <1462417489-28603-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXJrdyuCpXst8DBg--.1983S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKw1UtF1fJr17GFg_yoW8CrW5pr
	93ZFs5C3y5tFs3Jw4fGF1DWF4DJ3WkCF18trZrGwn29w45Cr4qkr17Aw43uayrKFW0vF13
	Xay8ta48AF4DZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jtGYLUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwxgxlXlTVyF+QAAsM
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Subject: [Qemu-arm] [PATCH RESEND 2/5] hw/display: QOM'ify jazz_led.c
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
Cc: i.mitsyanko@gmail.com, michael@walle.cc, qemu-arm@nongnu.org,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BfRfh+kW75+I

* Drop the old SysBus init function and use instance_init
* Move graphic_console_init into realize stage

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/display/jazz_led.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 09dcdb4..b72fdb1 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -267,16 +267,20 @@ static const GraphicHwOps jazz_led_ops = {
     .text_update = jazz_led_text_update,
 };
 
-static int jazz_led_init(SysBusDevice *dev)
+static void jazz_led_init(Object *obj)
 {
-    LedState *s = JAZZ_LED(dev);
+    LedState *s = JAZZ_LED(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &led_ops, s, "led", 1);
+    memory_region_init_io(&s->iomem, obj, &led_ops, s, "led", 1);
     sysbus_init_mmio(dev, &s->iomem);
+}
 
-    s->con = graphic_console_init(DEVICE(dev), 0, &jazz_led_ops, s);
+static void jazz_led_realize(DeviceState *dev, Error **errp)
+{
+    LedState *s = JAZZ_LED(dev);
 
-    return 0;
+    s->con = graphic_console_init(dev, 0, &jazz_led_ops, s);
 }
 
 static void jazz_led_reset(DeviceState *d)
@@ -291,18 +295,18 @@ static void jazz_led_reset(DeviceState *d)
 static void jazz_led_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = jazz_led_init;
     dc->desc = "Jazz LED display",
     dc->vmsd = &vmstate_jazz_led;
     dc->reset = jazz_led_reset;
+    dc->realize = jazz_led_realize;
 }
 
 static const TypeInfo jazz_led_info = {
     .name          = TYPE_JAZZ_LED,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(LedState),
+    .instance_init = jazz_led_init,
     .class_init    = jazz_led_class_init,
 };
 
-- 
2.1.4



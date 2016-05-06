Received: by 10.25.208.137 with SMTP id h131csp213961lfg;
        Fri, 6 May 2016 04:03:54 -0700 (PDT)
X-Received: by 10.194.123.102 with SMTP id lz6mr20743058wjb.2.1462532634026;
        Fri, 06 May 2016 04:03:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4si17731472wjl.81.2016.05.06.04.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 04:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aydXk-0006yB-1W
	for alex.bennee@linaro.org; Fri, 06 May 2016 07:03:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydXW-0006XU-AW
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:03:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydXK-0001sd-Ka
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:03:16 -0400
Received: from m12-16.163.com ([220.181.12.16]:50791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aydWz-0001dy-Gb; Fri, 06 May 2016 07:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=DYTM39KvO4gAoeRpef
	vWzkanCIN4RMQfuwmYPFnXgBE=; b=YWLvg+hHLSnG02MzKHF8ydlh5C9vfKqyYc
	XdpUqPVMRrazG40oHkbuWOWfFuknLqZnIHc5OGCkFmYLXz84tkgV4vVa79mjtTnq
	MncJUWwXBcjwfyChXTtig8DLejsaQmVG2KiBM/adahzHGyMGpPZY06UsivTWOszF
	ca2XIDbeQ=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowACXRsM7eSxXsYpAAA--.18847S4;
	Fri, 06 May 2016 19:01:55 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 May 2016 18:59:32 +0800
Message-Id: <1462532375-29264-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
References: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowACXRsM7eSxXsYpAAA--.18847S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKw1UtF1fJr17GFg_yoW8CrW5pr
	93ZFs5C3y5tFs3Jw4fGF1DWF4DJ3WkCF18trZrGwn29w45Cr4qkr17Aw43uayrKFW0vF13
	Xay8ta48AF4DZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkjjDUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMwNhxlXlgH2hNAAAsP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-arm] [PATCH v2 2/5] hw/display: QOM'ify jazz_led.c
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
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com, armbru@redhat.com,
	michael@walle.cc, qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3R35Giv2XwL

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



Received: by 10.25.208.211 with SMTP id h202csp533970lfg;
        Thu, 24 Mar 2016 03:32:58 -0700 (PDT)
X-Received: by 10.55.79.79 with SMTP id d76mr9315169qkb.76.1458815578254;
        Thu, 24 Mar 2016 03:32:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z68si5952843qhb.87.2016.03.24.03.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 03:32:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj2ZV-0000gu-O8
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 06:32:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yh-0007wx-Q6
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 06:32:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yd-0005c5-66
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 06:32:07 -0400
Received: from m12-16.163.com ([220.181.12.16]:34294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aj2Yc-0005W8-7z; Thu, 24 Mar 2016 06:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=DYTM39KvO4gAoeRpef
	vWzkanCIN4RMQfuwmYPFnXgBE=; b=FRJmq0Sor7MXV3pgnZvr42KMSoJXa/doRt
	MLqs+XhLikmLZOmWBpinLeysR1gAdxbGre/MWn7BFiPdxl+lGMvNHz8lqoKDJiLQ
	ezGVZf3VKFY0wXuh8Px7Awiw94Sq+ZxVUVCOR4k3IYeLGxz41sr30grxA2HJOCDq
	x/j6AxpmM=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp12 (Coremail) with SMTP id EMCowEDpR1DcwfNWAMmNAA--.623S4;
	Thu, 24 Mar 2016 18:31:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 18:29:27 +0800
Message-Id: <1458815374-22279-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEDpR1DcwfNWAMmNAA--.623S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKw1UtF1fJr17GFg_yoW8CrW5pr
	93ZFs5C3y5tFs3Jw4fGF1DWF4DJ3WkCF18trZrGwn29w45Cr4qkr17Aw43uayrKFW0vF13
	Xay8ta48AF4DZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSHq7UUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEAc2xlWBUY8n4QAAsr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, michael@walle.cc,
	qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Subject: [Qemu-devel] [PATCH 2/5] hw/display: QOM'ify jazz_led.c
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
X-TUID: m8/obX7PfLaY

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



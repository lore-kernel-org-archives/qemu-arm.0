Received: by 10.25.208.211 with SMTP id h202csp970167lfg;
        Sun, 21 Feb 2016 19:18:14 -0800 (PST)
X-Received: by 10.55.49.11 with SMTP id x11mr10445399qkx.86.1456111094707;
        Sun, 21 Feb 2016 19:18:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x198si27595261qka.46.2016.02.21.19.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:18:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh0o-0002Ap-1W
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:18:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzu-0000mT-R1
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzr-0007VW-J4
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:18 -0500
Received: from m12-16.163.com ([220.181.12.16]:54227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXgzp-0007Re-KT; Sun, 21 Feb 2016 22:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=eRTRGllFQNVen4F5+b
	836GfaEGcLTNG06MZ2YuO7kAI=; b=UDdNkYx2Q25ZaEXgl7z1EApUw1DEHC/E8v
	pRaQusk5xTUGpWEZ9+plCitjgeja3HL0mramfRqUnZPgCPFFpNc2jk79gPa6l+Kv
	cdBz/v1qJcviHN9viqIZULbCecVnn9HyWV0lLmGjqVhEn18iewqvr3v+QVIiVtcz
	nD+hli5fk=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S11;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:33 +0800
Message-Id: <1456110933-5457-10-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF45JrWkGw4kGFW3ZrW7twb_yoW8tw47pF
	yxZ3ZrAw48tFZrJw4fJrnFgF15Cwn7Ka4rtrnxXrnavw1xCa9xGF1kAFs8JrZ0qayF9F13
	JFW8JFy7CF45Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkOzsUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEB4XxlWBTyTM-AAAsQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v4 9/9] hw/timer: QOM'ify tusb6010
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
X-TUID: MsXIxM3YUS5T

Move majority of old SysBus init's work the into instance_init.

Note:
musb_init must be called in SysBus's init, otherwise it will
break "make check" with error message as follows:

qom/object.c:1576:object_get_canonical_path_component: assertion failed: (obj->parent != NULL)

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/tusb6010.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
index 9f6af90..2d6bdd3 100644
--- a/hw/timer/tusb6010.c
+++ b/hw/timer/tusb6010.c
@@ -776,21 +776,29 @@ static void tusb6010_reset(DeviceState *dev)
     musb_reset(s->musb);
 }
 
-static int tusb6010_init(SysBusDevice *sbd)
+static void tusb6010_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    TUSBState *s = TUSB(dev);
+    DeviceState *dev = DEVICE(obj);
+    TUSBState *s = TUSB(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->otg_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_otg_tick, s);
     s->pwr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_power_tick, s);
-    memory_region_init_io(&s->iomem[1], OBJECT(s), &tusb_async_ops, s,
+    memory_region_init_io(&s->iomem[1], obj, &tusb_async_ops, s,
                           "tusb-async", UINT32_MAX);
     sysbus_init_mmio(sbd, &s->iomem[0]);
     sysbus_init_mmio(sbd, &s->iomem[1]);
     sysbus_init_irq(sbd, &s->irq);
     qdev_init_gpio_in(dev, tusb6010_irq, musb_irq_max + 1);
-    s->musb = musb_init(dev, 1);
-    return 0;
+}
+
+static int tusb6010_bus_init(SysBusDevice *sbd)
+{
+   TUSBState *s = TUSB(sbd);
+   DeviceState *dev = DEVICE(sbd);
+
+   s->musb = musb_init(dev, 1);
+   return 0;
 }
 
 static void tusb6010_class_init(ObjectClass *klass, void *data)
@@ -798,7 +806,7 @@ static void tusb6010_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = tusb6010_init;
+    k->init = tusb6010_bus_init;
     dc->reset = tusb6010_reset;
 }
 
@@ -806,6 +814,7 @@ static const TypeInfo tusb6010_info = {
     .name          = TYPE_TUSB6010,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(TUSBState),
+    .instance_init = tusb6010_init,
     .class_init    = tusb6010_class_init,
 };
 
-- 
2.1.4



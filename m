Received: by 10.80.166.35 with SMTP id d32csp2124627edc;
        Sun, 23 Oct 2016 02:22:50 -0700 (PDT)
X-Received: by 10.200.42.130 with SMTP id b2mr9982961qta.102.1477214570010;
        Sun, 23 Oct 2016 02:22:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s21si7456325qka.249.2016.10.23.02.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 02:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byEzR-0002l1-Cg
	for alex.bennee@linaro.org; Sun, 23 Oct 2016 05:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvk-0008Gv-EL
	for qemu-arm@nongnu.org; Sun, 23 Oct 2016 05:19:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvj-0002du-KZ
	for qemu-arm@nongnu.org; Sun, 23 Oct 2016 05:19:00 -0400
Received: from m12-11.163.com ([220.181.12.11]:39481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1byEvc-0002ae-IC; Sun, 23 Oct 2016 05:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=PCcuG6ZVZs6Pj+1UkT
	uA7cdBZFS0y1x0mQLpE64HPuA=; b=qQj60yfCZR/Hn/OINIH+dHYK+y1KbRMXVJ
	gYoKiQd3FVYTHc1WbHnYmm7whH9LoRPlzQgvbklIkVpwXHxEoBDC47JXwTt/7LE+
	suEt/Y5Q2zJOoh7LEdP7VPeIGVtm9Hn/60AKy4mKr1wdoZfpiIIpoNBqKpJ7B+Dh
	FuqsLQuBE=
Received: from debian.lan (unknown [114.111.167.207])
	by smtp7 (Coremail) with SMTP id C8CowACHR3FSgAxYG4EdBQ--.32654S4;
	Sun, 23 Oct 2016 17:18:20 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Oct 2016 17:18:14 +0800
Message-Id: <20161023091816.3839-3-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161023091816.3839-1-zxq_yx_007@163.com>
References: <20161023091816.3839-1-zxq_yx_007@163.com>
X-CM-TRANSID: C8CowACHR3FSgAxYG4EdBQ--.32654S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1rJr18Gw1xuFy5AFW5KFg_yoW8tryfp3
	s7Wa4F9r15GFsrJ3yfWr18CryfAws2kF4xtrW7Ga4Sk3W09r15tr17JFyava90grZrC3W5
	X34rJFW8Xr1Duw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bzJP_UUUUU=
X-Originating-IP: [114.111.167.207]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEB0MxlWBX0yS0AAAsC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Subject: [Qemu-arm] [PATCH 2/4] hw/arm: QOM'ify pxa2xx_gpio.c
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de,
	balrogg@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qJyEdQDWp7y1

Drop the old Sysbus init and use instance_init and
DeviceClass::realize instead

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/pxa2xx_gpio.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index 576a8eb..521dbad 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -280,23 +280,28 @@ DeviceState *pxa2xx_gpio_init(hwaddr base,
     return dev;
 }
 
-static int pxa2xx_gpio_initfn(SysBusDevice *sbd)
+static void pxa2xx_gpio_initfn(Object *obj)
 {
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     DeviceState *dev = DEVICE(sbd);
     PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
 
-    s->cpu = ARM_CPU(qemu_get_cpu(s->ncpu));
-
-    qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
-    qdev_init_gpio_out(dev, s->handler, s->lines);
-
-    memory_region_init_io(&s->iomem, OBJECT(s), &pxa_gpio_ops, s, "pxa2xx-gpio", 0x1000);
+    memory_region_init_io(&s->iomem, obj, &pxa_gpio_ops,
+                          s, "pxa2xx-gpio", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq0);
     sysbus_init_irq(sbd, &s->irq1);
     sysbus_init_irq(sbd, &s->irqX);
+}
 
-    return 0;
+static void pxa2xx_gpio_realize(DeviceState *dev, Error **errp)
+{
+    PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
+
+    s->cpu = ARM_CPU(qemu_get_cpu(s->ncpu));
+
+    qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
+    qdev_init_gpio_out(dev, s->handler, s->lines);
 }
 
 /*
@@ -336,18 +341,18 @@ static Property pxa2xx_gpio_properties[] = {
 static void pxa2xx_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pxa2xx_gpio_initfn;
     dc->desc = "PXA2xx GPIO controller";
     dc->props = pxa2xx_gpio_properties;
     dc->vmsd = &vmstate_pxa2xx_gpio_regs;
+    dc->realize = pxa2xx_gpio_realize;
 }
 
 static const TypeInfo pxa2xx_gpio_info = {
     .name          = TYPE_PXA2XX_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PXA2xxGPIOInfo),
+    .instance_init = pxa2xx_gpio_initfn,
     .class_init    = pxa2xx_gpio_class_init,
 };
 
-- 
2.9.3



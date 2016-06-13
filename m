Received: by 10.25.85.209 with SMTP id j200csp1132908lfb;
        Mon, 13 Jun 2016 03:57:26 -0700 (PDT)
X-Received: by 10.140.34.133 with SMTP id l5mr13145611qgl.28.1465815446061;
        Mon, 13 Jun 2016 03:57:26 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n88si14827335qte.70.2016.06.13.03.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPYb-0005db-Dz
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:57:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWk-0004Qm-6X
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWe-0003HQ-4H
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:29 -0400
Received: from m50-134.163.com ([123.125.50.134]:47832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWd-0003GA-2r; Mon, 13 Jun 2016 06:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=FftodqGL51UnRlLzbK
	8Pc7mfdqf/tuYNxjB2BAqRVHg=; b=LYWdQFdvkeH1v48+K4Ftqe1y7C8ZhYCAHV
	xujC0zFrWpOnpl5JMcQGmBADybbtPsIJqVPV0QgHqQ1hOWMrAseHGFahWSZNYJzO
	qS06/JMTzg3b/YxLuxWKfju0Sw4PyyEBkjkw2nWXiGqYdRKPDPhTkRqC7xwJzdjx
	vryT+vtrQ=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowADHQpfkkF5X+0_jBA--.36165S7;
	Mon, 13 Jun 2016 18:54:32 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:08 +0800
Message-Id: <1465815255-21776-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DtGowADHQpfkkF5X+0_jBA--.36165S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4UZw4rAFy5AryUWw4UArb_yoWruF4DpF
	9IgFnxW3ykXFsrZFs3Jr17uFn3Jwn7Ka17Jw12v3sakFnFkw4ayF10ka4YvryUtrWvyF13
	JFWrJF97GF1kAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqLvtUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFgiHxlWBRV1LOwABsi
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-devel] [RESEND PATCH 05/12] hw/gpio: QOM'ify omap_gpio.c
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XZaLf+9Q+zdU

* Split the old SysBus init into an instance_init and
  DeviceClass::realize function
* Drop the SysBus init function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/gpio/omap_gpio.c | 61 +++++++++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 9b1b004..dabef4a 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -23,6 +23,7 @@
 #include "hw/arm/omap.h"
 #include "hw/sysbus.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 
 struct omap_gpio_s {
     qemu_irq irq;
@@ -678,48 +679,46 @@ static const MemoryRegionOps omap2_gpif_top_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int omap_gpio_init(SysBusDevice *sbd)
+static void omap_gpio_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    struct omap_gpif_s *s = OMAP1_GPIO(dev);
+    DeviceState *dev = DEVICE(obj);
+    struct omap_gpif_s *s = OMAP1_GPIO(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    if (!s->clk) {
-        error_report("omap-gpio: clk not connected");
-        return -1;
-    }
     qdev_init_gpio_in(dev, omap_gpio_set, 16);
     qdev_init_gpio_out(dev, s->omap1.handler, 16);
     sysbus_init_irq(sbd, &s->omap1.irq);
-    memory_region_init_io(&s->iomem, OBJECT(s), &omap_gpio_ops, &s->omap1,
+    memory_region_init_io(&s->iomem, obj, &omap_gpio_ops, &s->omap1,
                           "omap.gpio", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    return 0;
 }
 
-static int omap2_gpio_init(SysBusDevice *sbd)
+static void omap_gpio_realize(DeviceState *dev, Error **errp)
+{
+    struct omap_gpif_s *s = OMAP1_GPIO(dev);
+
+    if (!s->clk) {
+        error_setg(errp, "omap-gpio: clk not connected");
+    }
+}
+
+static void omap2_gpio_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(sbd);
     struct omap2_gpif_s *s = OMAP2_GPIO(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
     if (!s->iclk) {
-        error_report("omap2-gpio: iclk not connected");
-        return -1;
+        error_setg(errp, "omap2-gpio: iclk not connected");
+        return;
     }
 
     s->modulecount = s->mpu_model < omap2430 ? 4
-                   : s->mpu_model < omap3430 ? 5
-                   : 6;
-
-    for (i = 0; i < s->modulecount; i++) {
-        if (!s->fclk[i]) {
-            error_report("omap2-gpio: fclk%d not connected", i);
-            return -1;
-        }
-    }
+        : s->mpu_model < omap3430 ? 5
+        : 6;
 
     if (s->mpu_model < omap3430) {
-        memory_region_init_io(&s->iomem, OBJECT(s), &omap2_gpif_top_ops, s,
+        memory_region_init_io(&s->iomem, OBJECT(dev), &omap2_gpif_top_ops, s,
                               "omap2.gpio", 0x1000);
         sysbus_init_mmio(sbd, &s->iomem);
     }
@@ -732,17 +731,20 @@ static int omap2_gpio_init(SysBusDevice *sbd)
     for (i = 0; i < s->modulecount; i++) {
         struct omap2_gpio_s *m = &s->modules[i];
 
+        if (!s->fclk[i]) {
+            error_setg(errp, "omap2-gpio: fclk%d not connected", i);
+            return;
+        }
+
         m->revision = (s->mpu_model < omap3430) ? 0x18 : 0x25;
         m->handler = &s->handler[i * 32];
         sysbus_init_irq(sbd, &m->irq[0]); /* mpu irq */
         sysbus_init_irq(sbd, &m->irq[1]); /* dsp irq */
         sysbus_init_irq(sbd, &m->wkup);
-        memory_region_init_io(&m->iomem, OBJECT(s), &omap2_gpio_module_ops, m,
+        memory_region_init_io(&m->iomem, OBJECT(dev), &omap2_gpio_module_ops, m,
                               "omap.gpio-module", 0x1000);
         sysbus_init_mmio(sbd, &m->iomem);
     }
-
-    return 0;
 }
 
 /* Using qdev pointer properties for the clocks is not ideal.
@@ -766,9 +768,8 @@ static Property omap_gpio_properties[] = {
 static void omap_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = omap_gpio_init;
+    dc->realize = omap_gpio_realize;
     dc->reset = omap_gpif_reset;
     dc->props = omap_gpio_properties;
     /* Reason: pointer property "clk" */
@@ -779,6 +780,7 @@ static const TypeInfo omap_gpio_info = {
     .name          = TYPE_OMAP1_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(struct omap_gpif_s),
+    .instance_init = omap_gpio_init,
     .class_init    = omap_gpio_class_init,
 };
 
@@ -797,9 +799,8 @@ static Property omap2_gpio_properties[] = {
 static void omap2_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = omap2_gpio_init;
+    dc->realize = omap2_gpio_realize;
     dc->reset = omap2_gpif_reset;
     dc->props = omap2_gpio_properties;
     /* Reason: pointer properties "iclk", "fclk0", ..., "fclk5" */
-- 
2.1.4



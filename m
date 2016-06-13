Received: by 10.25.85.209 with SMTP id j200csp1136604lfb;
        Mon, 13 Jun 2016 04:04:50 -0700 (PDT)
X-Received: by 10.140.137.136 with SMTP id 130mr13721994qhj.100.1465815890409;
        Mon, 13 Jun 2016 04:04:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k137si14829971qhc.67.2016.06.13.04.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPfl-0004GO-Ob
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:04:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPX8-0004oz-9T
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWz-0003Ot-T0
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:55:53 -0400
Received: from m50-134.163.com ([123.125.50.134]:47874)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWe-0003GC-4R; Mon, 13 Jun 2016 06:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=V9I94wK7MIdkAa/jrv
	rNwtlH46doMmSfpyERYIf+joM=; b=EvQCDjE+Zl7khk3FMaEroq3qRHr8gvUaZV
	ttmiPBoiOPSkziB9HGYTiyt5hMvWVkuBczqzg2zliMc8xgyCH0BSvhnq2d/8GS8H
	uWhEsUX78RCXVNDO23p6r0YHEJQMx3hECQ7TyJ/LBoSt3d1vWfBdE0SYW1JbWu1n
	jHlh219Xk=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowADHQpfkkF5X+0_jBA--.36165S5;
	Mon, 13 Jun 2016 18:54:32 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:06 +0800
Message-Id: <1465815255-21776-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DtGowADHQpfkkF5X+0_jBA--.36165S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1Dtr4DJF17Zr1xCrW7urg_yoW5AFyfpF
	9xtFn3GrWkJFs7XrZaqr4DCFs5Xw4kK348tr13Jwnavr1DuwsIyw4vyF4Yv34UG392ya13
	XayrJFy8GF48AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlg4hUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgiHxlZXyT3J5wAAsA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-arm] [RESEND PATCH 03/12] hw/i2c: QOM'ify omap_i2c.c
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	balrogg@gmail.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7xQ2PcpIzBVM

* Split the omap_i2c_init into an instance_init and realize function
* Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/i2c/omap_i2c.c | 44 ++++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 67fbbff..f7c92ea 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -22,6 +22,7 @@
 #include "hw/arm/omap.h"
 #include "hw/sysbus.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 
 #define TYPE_OMAP_I2C "omap_i2c"
 #define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
@@ -445,29 +446,35 @@ static const MemoryRegionOps omap_i2c_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int omap_i2c_init(SysBusDevice *sbd)
+static void omap_i2c_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    OMAPI2CState *s = OMAP_I2C(dev);
-
-    if (!s->fclk) {
-        error_report("omap_i2c: fclk not connected");
-        return -1;
-    }
-    if (s->revision >= OMAP2_INTR_REV && !s->iclk) {
-        /* Note that OMAP1 doesn't have a separate interface clock */
-        error_report("omap_i2c: iclk not connected");
-        return -1;
-    }
+    DeviceState *dev = DEVICE(obj);
+    OMAPI2CState *s = OMAP_I2C(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(sbd, &s->irq);
     sysbus_init_irq(sbd, &s->drq[0]);
     sysbus_init_irq(sbd, &s->drq[1]);
-    memory_region_init_io(&s->iomem, OBJECT(s), &omap_i2c_ops, s, "omap.i2c",
-                          (s->revision < OMAP2_INTR_REV) ? 0x800 : 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     s->bus = i2c_init_bus(dev, NULL);
-    return 0;
+}
+
+static void omap_i2c_realize(DeviceState *dev, Error **errp)
+{
+    OMAPI2CState *s = OMAP_I2C(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &omap_i2c_ops, s, "omap.i2c",
+                          (s->revision < OMAP2_INTR_REV) ? 0x800 : 0x1000);
+
+    if (!s->fclk) {
+        error_setg(errp, "omap_i2c: fclk not connected");
+        return;
+    }
+    if (s->revision >= OMAP2_INTR_REV && !s->iclk) {
+        /* Note that OMAP1 doesn't have a separate interface clock */
+        error_setg(errp, "omap_i2c: iclk not connected");
+        return;
+    }
 }
 
 static Property omap_i2c_properties[] = {
@@ -480,18 +487,19 @@ static Property omap_i2c_properties[] = {
 static void omap_i2c_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
-    k->init = omap_i2c_init;
+
     dc->props = omap_i2c_properties;
     dc->reset = omap_i2c_reset;
     /* Reason: pointer properties "iclk", "fclk" */
     dc->cannot_instantiate_with_device_add_yet = true;
+    dc->realize = omap_i2c_realize;
 }
 
 static const TypeInfo omap_i2c_info = {
     .name = TYPE_OMAP_I2C,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(OMAPI2CState),
+    .instance_init = omap_i2c_init,
     .class_init = omap_i2c_class_init,
 };
 
-- 
2.1.4



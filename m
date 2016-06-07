Received: by 10.25.27.66 with SMTP id b63csp1931580lfb;
        Tue, 7 Jun 2016 03:36:06 -0700 (PDT)
X-Received: by 10.237.49.227 with SMTP id 90mr6736545qth.44.1465295766258;
        Tue, 07 Jun 2016 03:36:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n74si11284078qki.31.2016.06.07.03.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEMf-0004g8-IQ
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:36:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMX-0004cM-7x
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMV-0002NP-6j
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:35:56 -0400
Received: from m12-18.163.com ([220.181.12.18]:45285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEM8-0002Gn-Ry; Tue, 07 Jun 2016 06:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=V9I94wK7MIdkAa/jrv
	rNwtlH46doMmSfpyERYIf+joM=; b=TzvEDCY8X41eoIDMCFYJV1Deynid5RzsW3
	/0FN0VHqbDwDPdVdYq/Fjch/TbxWxE7bOEJh6didvKZrNfS4dsB0Ko6Ai6A+K4p1
	NuZ9kqlwVp2L+yGXUkKAQEll1/nNviBMQX/j01UDwbIzWXzRINVkl/0Q1ID0Nlwq
	i0WNNj2QQ=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEAJmUVLo1ZXMS8LAA--.4188S5;
	Tue, 07 Jun 2016 18:35:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:34:40 +0800
Message-Id: <1465295683-11505-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowEAJmUVLo1ZXMS8LAA--.4188S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1Dtr4DJF17Zr1xCrW7urg_yoW5AFyfpF
	9xtFn3GrWkJFs7XrZaqr4DCFs5Xw4kK348tr13Jwnavr1DuwsIyw4vyF4Yv34UG392ya13
	XayrJFy8GF48AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDHUDUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEhaBxlZXyNwR0AABsW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 03/17] hw/i2c: QOM'ify omap_i2c.c
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
X-TUID: TxpW594061Bs

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



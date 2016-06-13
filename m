Received: by 10.25.85.209 with SMTP id j200csp1125310lfb;
        Mon, 13 Jun 2016 03:35:18 -0700 (PDT)
X-Received: by 10.55.155.18 with SMTP id d18mr14143778qke.103.1465814118254;
        Mon, 13 Jun 2016 03:35:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k64si14749999qhc.118.2016.06.13.03.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPDB-0002cN-HR
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:35:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPB6-00019S-DW
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPAx-000544-10
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:08 -0400
Received: from m12-17.163.com ([220.181.12.17]:35244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-000523-An; Mon, 13 Jun 2016 06:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=V9I94wK7MIdkAa/jrv
	rNwtlH46doMmSfpyERYIf+joM=; b=o45CYH2GcOxDMvF6mKkOEI2mN3w1quIpu6
	r85932W2I+hf8th5Qv3LpQg+d1z3XEJPU5H7Sl6Nb/6oAw3RXZYn+ZHdExnryxy0
	5XnzkrI0QwF7emoXp4FfBVd0JMr1c7Pr/DXKCiUo/nWAg8a7jbnyAi8y3DhkZTS4
	Gk4kouyJk=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S5;
	Mon, 13 Jun 2016 18:32:28 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:02 +0800
Message-Id: <1465813931-20534-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1Dtr4DJF17Zr1xCrW7urg_yoW5AFyfpF
	9xtFn3GrWkJFs7XrZaqr4DCFs5Xw4kK348tr13Jwnavr1DuwsIyw4vyF4Yv34UG392ya13
	XayrJFy8GF48AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdo7tUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEByHxlUL88jDpAAAsP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-devel] [PATCH 03/12] hw/i2c: QOM'ify omap_i2c.c
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
X-TUID: V/uYnEi6T9nW

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



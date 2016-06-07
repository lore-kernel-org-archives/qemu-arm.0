Received: by 10.25.27.66 with SMTP id b63csp1935970lfb;
        Tue, 7 Jun 2016 03:48:19 -0700 (PDT)
X-Received: by 10.55.65.210 with SMTP id o201mr13606354qka.133.1465296499579;
        Tue, 07 Jun 2016 03:48:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si5211945qhc.100.2016.06.07.03.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEYU-0006jn-UD
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:48:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENJ-0005JV-UW
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENH-0002XF-V7
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:44 -0400
Received: from m12-18.163.com ([220.181.12.18]:51408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENA-0002V2-PL; Tue, 07 Jun 2016 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=tS0utbdAs3QMsQ5xlt
	XtVFvRg79y2jCxOZJPm3LzNNg=; b=B+xJ3PyLrQnn5d2Yl8HGweJUWZcWrSPhJa
	OZAr5HXJ/DoCmngSzfk0z9Kq8cBk4XfEDL28oIXEcoNrFHe1rR9RrC0IcdgjZtW5
	96rihBmM7RsgmxJtulxenQ2FXH3zjshNg7YXLvALEETeh+drrNSNdI22ZxjdaSM6
	upO7V/jH0=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S9;
	Tue, 07 Jun 2016 18:36:12 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:47 +0800
Message-Id: <1465295747-11651-8-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
References: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47Gw4xGFyxZry3Aw1rXrb_yoW8tFy7pF
	Z29Fn8Ar4UJFsrW34xJr1xG3Z5Gws5Cw1xGr97XrnYy34qkFn8Zw4kJ3ySyFyq9rZ7AFW5
	GF95trW8AFs7J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jD5rcUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMxyBxlXlgs1VfwAAs9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 17/17] hw/sd: QOM'ify pl181.c
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
X-TUID: Qj8CRwEXFfM2

split the old SysBus init function into an instance_init
and a Device realize function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/sd/pl181.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index eb783c6..82c63a4 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -13,6 +13,7 @@
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 
 //#define DEBUG_PL181 1
 
@@ -481,43 +482,48 @@ static void pl181_reset(DeviceState *d)
     sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
 }
 
-static int pl181_init(SysBusDevice *sbd)
+static void pl181_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    PL181State *s = PL181(dev);
-    DriveInfo *dinfo;
+    DeviceState *dev = DEVICE(obj);
+    PL181State *s = PL181(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &pl181_ops, s, "pl181", 0x1000);
+    memory_region_init_io(&s->iomem, obj, &pl181_ops, s, "pl181", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq[0]);
     sysbus_init_irq(sbd, &s->irq[1]);
     qdev_init_gpio_out(dev, s->cardstatus, 2);
+}
+
+static void pl181_realize(DeviceState *dev, Error **errp)
+{
+    PL181State *s = PL181(dev);
+    DriveInfo *dinfo;
+
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
     s->card = sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, false);
     if (s->card == NULL) {
-        return -1;
+        error_setg(errp, "sd_init failed");
     }
-
-    return 0;
 }
 
 static void pl181_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
     DeviceClass *k = DEVICE_CLASS(klass);
 
-    sdc->init = pl181_init;
     k->vmsd = &vmstate_pl181;
     k->reset = pl181_reset;
     /* Reason: init() method uses drive_get_next() */
     k->cannot_instantiate_with_device_add_yet = true;
+    k->realize = pl181_realize;
 }
 
 static const TypeInfo pl181_info = {
     .name          = TYPE_PL181,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL181State),
+    .instance_init = pl181_init,
     .class_init    = pl181_class_init,
 };
 
-- 
2.1.4



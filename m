Received: by 10.25.85.209 with SMTP id j200csp1135094lfb;
        Mon, 13 Jun 2016 04:01:53 -0700 (PDT)
X-Received: by 10.55.200.152 with SMTP id t24mr14304090qkl.197.1465815713828;
        Mon, 13 Jun 2016 04:01:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m26si14824812qkh.116.2016.06.13.04.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPcv-0001QK-7a
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWl-0004Rj-Gf
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWj-0003Ja-2v
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:30 -0400
Received: from m50-134.163.com ([123.125.50.134]:48254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWi-0003IB-3e; Mon, 13 Jun 2016 06:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=tS0utbdAs3QMsQ5xlt
	XtVFvRg79y2jCxOZJPm3LzNNg=; b=NleuxReNxYnxlcXkZMzwgiIwJOwJx7CbIk
	ZJ74E/EVWj7M0RSM/+dvCCyEF7tYOzZ8fDUDrrf127Ezxfs9TKc2tbhwmHy9MsO9
	/XdN0fYiOyQ4p4bB0y3j7smABbj+vlpaxhfIHKCWK8SZvme0kZ3JM0ditVA1FJaO
	elAqTZ9Oo=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowACXcZbukF5XtlLjBA--.36710S2;
	Mon, 13 Jun 2016 18:54:39 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:15 +0800
Message-Id: <1465815255-21776-13-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DtGowACXcZbukF5XtlLjBA--.36710S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47Gw4xGFyxZry3Aw1rXrb_yoW8tFy7pF
	Z29Fn8Ar4UJFsrW34xJr1xG3Z5Gws5Cw1xGr97XrnYy34qkFn8Zw4kJ3ySyFyq9rZ7AFW5
	GF95trW8AFs7J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFuWdUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0g6HxlUL-VqvsgABs4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-devel] [RESEND PATCH 12/12] hw/sd: QOM'ify pl181.c
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
X-TUID: 8vwnbf75PQ05

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



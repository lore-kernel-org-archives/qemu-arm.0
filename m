Received: by 10.25.27.66 with SMTP id b63csp1932989lfb;
        Tue, 7 Jun 2016 03:39:59 -0700 (PDT)
X-Received: by 10.237.55.137 with SMTP id j9mr20412587qtb.33.1465295998439;
        Tue, 07 Jun 2016 03:39:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w186si5080529qkd.222.2016.06.07.03.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEQP-0007hl-PZ
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:39:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMJ-0004QA-5O
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEM9-0002ID-KX
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:35:42 -0400
Received: from m12-18.163.com ([220.181.12.18]:45283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEM8-0002Gm-Qe; Tue, 07 Jun 2016 06:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=RO86TxpynSTC7clDlZ
	V6GtRzGMw7NlEiupNTNHyE5dA=; b=He7nQ6ExGEoUpJ4sQSfEQtds53I8oLkvP2
	+EpCOi4HIWD/drxaxBnl7eD5DtVv8iENTcTEulMKFxHh1SNgFw2Dsp2KlhVl8Duv
	1oXGPLyIfKuOJBKri7d6rQGcagEJ6U1yCS+yyXALxCFbz5aOkZPpjYK2onRkatP5
	zeGPCqNCs=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEAJmUVLo1ZXMS8LAA--.4188S6;
	Tue, 07 Jun 2016 18:35:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:34:41 +0800
Message-Id: <1465295683-11505-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowEAJmUVLo1ZXMS8LAA--.4188S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47AF1rZF1kCw43tF48Xrb_yoW8WF1fpr
	93WF9xWFW7Grs7Wry7tFs8WF1rCas7GF4rtr4xXF10y3Z8uw1FvrnrG3yrCayDKay093WY
	qrW8CFy7AF47Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxMa8UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBaBxlUL82dPigAAsO
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 04/17] hw/i2c: QOM'ify versatile_i2c.c
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
X-TUID: +0MEVXxd8u0n

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/i2c/versatile_i2c.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 0bce524..da9f298 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -79,32 +79,25 @@ static const MemoryRegionOps versatile_i2c_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int versatile_i2c_init(SysBusDevice *sbd)
+static void versatile_i2c_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    VersatileI2CState *s = VERSATILE_I2C(dev);
+    DeviceState *dev = DEVICE(obj);
+    VersatileI2CState *s = VERSATILE_I2C(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
     bus = i2c_init_bus(dev, "i2c");
     s->bitbang = bitbang_i2c_init(bus);
-    memory_region_init_io(&s->iomem, OBJECT(s), &versatile_i2c_ops, s,
+    memory_region_init_io(&s->iomem, obj, &versatile_i2c_ops, s,
                           "versatile_i2c", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    return 0;
-}
-
-static void versatile_i2c_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
-
-    k->init = versatile_i2c_init;
 }
 
 static const TypeInfo versatile_i2c_info = {
     .name          = TYPE_VERSATILE_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(VersatileI2CState),
-    .class_init    = versatile_i2c_class_init,
+    .instance_init = versatile_i2c_init,
 };
 
 static void versatile_i2c_register_types(void)
-- 
2.1.4



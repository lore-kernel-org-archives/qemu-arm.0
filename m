Received: by 10.25.85.209 with SMTP id j200csp1125335lfb;
        Mon, 13 Jun 2016 03:35:22 -0700 (PDT)
X-Received: by 10.140.181.70 with SMTP id c67mr13971251qha.20.1465814122886;
        Mon, 13 Jun 2016 03:35:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16si7160887qhc.116.2016.06.13.03.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:35:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPDG-0002gz-4k
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:35:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPB5-00017x-FQ
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPAx-00053z-0o
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:06 -0400
Received: from m12-17.163.com ([220.181.12.17]:35246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-000524-7o; Mon, 13 Jun 2016 06:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=RO86TxpynSTC7clDlZ
	V6GtRzGMw7NlEiupNTNHyE5dA=; b=NuIB7IZpb/mZzCzrgUOIIqrdcSv+ZEh3am
	VGnLoQtfmCpcmPFL2hT2MxEo617Aj5p0o4mdIoBmEg/fFxBi9bnT4AaxAiGoOipg
	H6enGsiT5QM3tFzE0XVoC9QHOJwmjyXQYxTw4AhIcXko/wyyU/oH4oTkdVklnv+R
	TTN0D0G4c=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S6;
	Mon, 13 Jun 2016 18:32:28 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:03 +0800
Message-Id: <1465813931-20534-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47AF1rZF1kCw43tF48Xrb_yoW8WF1fpr
	93WF9xWFW7Grs7Wry7tFs8WF1rCas7GF4rtr4xXF10y3Z8uw1FvrnrG3yrCayDKay093WY
	qrW8CFy7AF47Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDTmhUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiqByHxlc64UJzswAAs7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-devel] [PATCH 04/12] hw/i2c: QOM'ify versatile_i2c.c
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
X-TUID: lrXZIX3kSS60

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



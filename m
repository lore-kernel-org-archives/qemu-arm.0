Received: by 10.25.27.66 with SMTP id b63csp1941478lfb;
        Tue, 7 Jun 2016 04:02:24 -0700 (PDT)
X-Received: by 10.55.142.132 with SMTP id q126mr19832787qkd.81.1465297344835;
        Tue, 07 Jun 2016 04:02:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d80si13663731qkj.249.2016.06.07.04.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 04:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEm8-0001yP-7E
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 07:02:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENK-0005L2-BV
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENB-0002VJ-33
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:46 -0400
Received: from m12-18.163.com ([220.181.12.18]:51389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENA-0002Uq-G2; Tue, 07 Jun 2016 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=6nCkRycDuGN0cNnJTd
	L7E8TcTKz8X1UVIsI2ZFcZTiA=; b=j8wrPcetavMS/dgwq8ijlS8T56HBKjO7T2
	Vs3selBT0iWPGuyhQVONwv7l8QZf1nu+1cZtbSC69Hr96wHnD8TaYFTD6pb3ehxt
	owd8Q7TOp6tlSY0ib/cp+PX0tbRuUyPH74XiXAK4wdpWSQLC4NvAgwZUve95gj5S
	RhHVvIp9E=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S2;
	Tue, 07 Jun 2016 18:36:11 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:40 +0800
Message-Id: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rGw18Jr1DXF4UAw4Utwb_yoW8urWxpF
	Z7WFn5Zrs5KFZ7JrWftr1DC3W8A397G34xKr1xJr1Syw43Gr45tFWDuayay34DtrWvv3WY
	q3yrGa47Aa12kw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxqXdUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0huBxlUL-PlFIwAAsz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 10/17] hw/misc: QOM'ify eccmemctl.c
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
X-TUID: 8v47fiNjD6hh

* Split the old SysBus init into an instance_init and a
  DeviceClass::realize function
* Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/misc/eccmemctl.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
index a0071f3..bb7cc52 100644
--- a/hw/misc/eccmemctl.c
+++ b/hw/misc/eccmemctl.c
@@ -295,22 +295,29 @@ static void ecc_reset(DeviceState *d)
     s->regs[ECC_ECR1] = 0;
 }
 
-static int ecc_init1(SysBusDevice *dev)
+static void ecc_init(Object *obj)
 {
-    ECCState *s = ECC_MEMCTL(dev);
+    ECCState *s = ECC_MEMCTL(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(dev, &s->irq);
-    s->regs[0] = s->version;
-    memory_region_init_io(&s->iomem, OBJECT(dev), &ecc_mem_ops, s, "ecc", ECC_SIZE);
+
+    memory_region_init_io(&s->iomem, obj, &ecc_mem_ops, s, "ecc", ECC_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
+}
+
+static void ecc_realize(DeviceState *dev, Error **errp)
+{
+    ECCState *s = ECC_MEMCTL(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    s->regs[0] = s->version;
 
     if (s->version == ECC_MCC) { // SS-600MP only
         memory_region_init_io(&s->iomem_diag, OBJECT(dev), &ecc_diag_mem_ops, s,
                               "ecc.diag", ECC_DIAG_SIZE);
-        sysbus_init_mmio(dev, &s->iomem_diag);
+        sysbus_init_mmio(sbd, &s->iomem_diag);
     }
-
-    return 0;
 }
 
 static Property ecc_properties[] = {
@@ -321,9 +328,8 @@ static Property ecc_properties[] = {
 static void ecc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = ecc_init1;
+    dc->realize = ecc_realize;
     dc->reset = ecc_reset;
     dc->vmsd = &vmstate_ecc;
     dc->props = ecc_properties;
@@ -333,6 +339,7 @@ static const TypeInfo ecc_info = {
     .name          = TYPE_ECC_MEMCTL,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ECCState),
+    .instance_init = ecc_init,
     .class_init    = ecc_class_init,
 };
 
-- 
2.1.4



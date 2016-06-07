Received: by 10.25.27.66 with SMTP id b63csp1934956lfb;
        Tue, 7 Jun 2016 03:45:32 -0700 (PDT)
X-Received: by 10.55.39.141 with SMTP id n135mr21106009qkn.149.1465296332243;
        Tue, 07 Jun 2016 03:45:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n84si14745250qhn.110.2016.06.07.03.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEVn-0003yj-Iv
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:45:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMk-0004oL-QZ
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMe-0002Pv-CA
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:09 -0400
Received: from m12-17.163.com ([220.181.12.17]:54856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEMd-0002P9-PW; Tue, 07 Jun 2016 06:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=IGE68HmdNlKMimCZ+U
	nFOPKqBmXVW8CwWAFbhs7Wde0=; b=TFz+AgM/hqFYBPU9XJuBKXRzCGlLpK1fWg
	LdEmFaQA6qhxRPZiF6q9cxGRXhjxIIw9EDazz99VMKpMdDsMsywj++uGhwEa/9c4
	UFp5r6mZka4Fin/smT3fvsY0SxPQMgprwxFvpewWiGG88HXco0yL6NHHKMxpzPzy
	qhC/DKKrs=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowACn18too1ZXX6l+AQ--.13818S2;
	Tue, 07 Jun 2016 18:35:37 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:10 +0800
Message-Id: <1465295712-11582-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EcCowACn18too1ZXX6l+AQ--.13818S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45KF4rCrWUJF43CrWfZrb_yoW8AF18pr
	Z7uFnrZrW8tFsrAr93tw17Wr1qyws7Ka18XrnrtFn2yw1q9rnxtFn2y34avr9rtrW8ZF1Y
	9ryrGF4xJF1rZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxGYdUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBmBxlWBVzbf5AAAsA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-devel] [PATCH 07/17] hw/gpio: QOM'ify pl061.c
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
X-TUID: 5gj8orjJCeTk

* Merge the pl061_initfn into pl061_init
* Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/gpio/pl061.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 44faeb2..4ae2aa1 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -341,20 +341,6 @@ static const MemoryRegionOps pl061_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int pl061_initfn(SysBusDevice *sbd)
-{
-    DeviceState *dev = DEVICE(sbd);
-    PL061State *s = PL061(dev);
-
-    memory_region_init_io(&s->iomem, OBJECT(s), &pl061_ops, s, "pl061", 0x1000);
-    sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq);
-    qdev_init_gpio_in(dev, pl061_set_irq, 8);
-    qdev_init_gpio_out(dev, s->out, 8);
-
-    return 0;
-}
-
 static void pl061_luminary_init(Object *obj)
 {
     PL061State *s = PL061(obj);
@@ -366,17 +352,23 @@ static void pl061_luminary_init(Object *obj)
 static void pl061_init(Object *obj)
 {
     PL061State *s = PL061(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->id = pl061_id;
     s->rsvd_start = 0x424;
+
+    memory_region_init_io(&s->iomem, obj, &pl061_ops, s, "pl061", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+    qdev_init_gpio_in(dev, pl061_set_irq, 8);
+    qdev_init_gpio_out(dev, s->out, 8);
 }
 
 static void pl061_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pl061_initfn;
     dc->vmsd = &vmstate_pl061;
     dc->reset = &pl061_reset;
 }
-- 
2.1.4



Received: by 10.25.85.209 with SMTP id j200csp1124551lfb;
        Mon, 13 Jun 2016 03:33:19 -0700 (PDT)
X-Received: by 10.237.53.115 with SMTP id b48mr13099989qte.67.1465813999102;
        Mon, 13 Jun 2016 03:33:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k53si14784885qta.39.2016.06.13.03.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:33:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPBG-0001MV-EI
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:33:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPBB-0001I2-Ib
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPB9-00056N-LC
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:12 -0400
Received: from m12-17.163.com ([220.181.12.17]:35251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-000529-Lh; Mon, 13 Jun 2016 06:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=IGE68HmdNlKMimCZ+U
	nFOPKqBmXVW8CwWAFbhs7Wde0=; b=QvZXYFzjUhda/7PrgDByfbSrEyLGhl2Fql
	Ov5T+VmAwfYxQ3b+HW5q/lNrhnPWwbnjeYjEE5abfEXeeA3IRbHEmhFuav+val2J
	lH+BUwrS5rXfYeTPBM9/LEeYGTySsrod4ajB0ctYkrFGCaqBeaHSURlHxIWn+P/E
	CfSvmVrtM=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S8;
	Mon, 13 Jun 2016 18:32:29 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:05 +0800
Message-Id: <1465813931-20534-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45KF4rCrWUJF43CrWfZrb_yoW8AF18pr
	Z7uFnrZrW8tFsrAr93tw17Wr1qyws7Ka18XrnrtFn2yw1q9rnxtFn2y34avr9rtrW8ZF1Y
	9ryrGF4xJF1rZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDVyxUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEByHxlUL88jDpgAAsN
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-arm] [PATCH 06/12] hw/gpio: QOM'ify pl061.c
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
X-TUID: qPSDmjGOCS/5

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



Received: by 10.25.208.211 with SMTP id h202csp1239623lfg;
        Tue, 16 Feb 2016 03:12:45 -0800 (PST)
X-Received: by 10.140.155.196 with SMTP id b187mr28037726qhb.14.1455621164966;
        Tue, 16 Feb 2016 03:12:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s104si40113045qgd.51.2016.02.16.03.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:12:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdYi-0007zV-8h
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:12:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXq-0006nv-Qt
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXl-0006la-QX
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:50 -0500
Received: from m12-13.163.com ([220.181.12.13]:48220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXk-0006k6-P5; Tue, 16 Feb 2016 06:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=3DdFgd04zJaCGejlRX
	IOrAW9JL2vPqqnu7x+cZECFtI=; b=kU5PHDHIEs486aO52tesgju+fProispHET
	Qr61Krda8kRbIsNXUx17JxvcPJbaQJcg6rdXTsQMoz1+964v6MYPCqGHQiDroNf+
	ybAKzIs9RokOPKDETAJm8d/Iak8yNqO+ATa2syN4eVeQVVlc30b7GLAr/zFuJMui
	taX3Ouo20=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S3;
	Tue, 16 Feb 2016 19:11:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:33 +0800
Message-Id: <1455620981-13868-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1UAF1fuw47AF45XFyfCrg_yoW5Kr1fpF
	Z7XF13AFW8KFsrXrs3JFn7WFn5Awn7Cw18Gr17GrnakFZFkryaqFn5C3yakFW7J3yxZFy3
	t3yrJFy2kF4UGw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsIDcUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhQRxlWBPIuGHwAAsv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 01/16] hw/timer: QOM'ify arm_timer (pass 1)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RkPNkLZrjfH4

* assign icp_pit_init to icp_pit_info.instance_init
* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/arm_timer.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index ba390ad..5bd2d75 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -277,21 +277,26 @@ static const VMStateDescription vmstate_sp804 = {
     }
 };
 
-static int sp804_init(SysBusDevice *sbd)
+static void sp804_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    SP804State *s = SP804(dev);
+    SP804State *s = SP804(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(sbd, &s->irq);
+    memory_region_init_io(&s->iomem, obj, &sp804_ops, s,
+                          "sp804", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void sp804_realize(DeviceState *dev, Error **errp)
+{
+    SP804State *s = SP804(dev);
+
     s->timer[0] = arm_timer_init(s->freq0);
     s->timer[1] = arm_timer_init(s->freq1);
     s->timer[0]->irq = qemu_allocate_irq(sp804_set_irq, s, 0);
     s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
-    memory_region_init_io(&s->iomem, OBJECT(s), &sp804_ops, s,
-                          "sp804", 0x1000);
-    sysbus_init_mmio(sbd, &s->iomem);
     vmstate_register(dev, -1, &vmstate_sp804, s);
-    return 0;
 }
 
 /* Integrator/CP timer module.  */
@@ -344,9 +349,10 @@ static const MemoryRegionOps icp_pit_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int icp_pit_init(SysBusDevice *dev)
+static void icp_pit_init(Object *obj)
 {
-    icp_pit_state *s = INTEGRATOR_PIT(dev);
+    icp_pit_state *s = INTEGRATOR_PIT(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     /* Timer 0 runs at the system clock speed (40MHz).  */
     s->timer[0] = arm_timer_init(40000000);
@@ -358,26 +364,18 @@ static int icp_pit_init(SysBusDevice *dev)
     sysbus_init_irq(dev, &s->timer[1]->irq);
     sysbus_init_irq(dev, &s->timer[2]->irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &icp_pit_ops, s,
+    memory_region_init_io(&s->iomem, obj, &icp_pit_ops, s,
                           "icp_pit", 0x1000);
     sysbus_init_mmio(dev, &s->iomem);
     /* This device has no state to save/restore.  The component timers will
        save themselves.  */
-    return 0;
-}
-
-static void icp_pit_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
-
-    sdc->init = icp_pit_init;
 }
 
 static const TypeInfo icp_pit_info = {
     .name          = TYPE_INTEGRATOR_PIT,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(icp_pit_state),
-    .class_init    = icp_pit_class_init,
+    .instance_init = icp_pit_init,
 };
 
 static Property sp804_properties[] = {
@@ -388,10 +386,9 @@ static Property sp804_properties[] = {
 
 static void sp804_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
     DeviceClass *k = DEVICE_CLASS(klass);
 
-    sdc->init = sp804_init;
+    k->realize = sp804_realize;
     k->props = sp804_properties;
 }
 
@@ -399,6 +396,7 @@ static const TypeInfo sp804_info = {
     .name          = TYPE_SP804,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SP804State),
+    .instance_init = sp804_init,
     .class_init    = sp804_class_init,
 };
 
-- 
2.1.4



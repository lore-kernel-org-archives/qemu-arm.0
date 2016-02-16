Received: by 10.25.208.211 with SMTP id h202csp1242577lfg;
        Tue, 16 Feb 2016 03:19:00 -0800 (PST)
X-Received: by 10.140.171.215 with SMTP id r206mr28479902qhr.51.1455621540124;
        Tue, 16 Feb 2016 03:19:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l77si21351607qki.80.2016.02.16.03.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:19:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdel-0001yK-Gk
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:18:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXv-0006vh-Gi
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXq-0006nm-SK
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:55 -0500
Received: from m12-12.163.com ([220.181.12.12]:35772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXq-0006n9-Hi; Tue, 16 Feb 2016 06:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=AjPg4uaLH2pb/p7hCS
	BTzdARtCuZYd9sBjOIQTdUrUk=; b=PnbAKYztGf390+DOAf+FvpxoieoYIOQGlU
	zkoBsEXS9E6O8WmkEOZ6JeVTnkzZ9DkFjlQrtToNHPyWTmOoTkoJECWB7uYv36XY
	O3i2oGIYexGLBNdcDcQGw2ubfITUYvVU9kToHFtmu5IlG+M42+bTXraUcK3U5hF9
	0WycrKzgQ=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXn_PgA8NWODCxBQ--.25459S6;
	Tue, 16 Feb 2016 19:11:33 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:10:25 +0800
Message-Id: <1455621027-13927-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXn_PgA8NWODCxBQ--.25459S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1UAF1fuw4UKw48XFWDJwb_yoW5CF4Up3
	97CFn2kr4IvrsrXryxGFsrJr98Jr1fAw1xGr1xGF4Sk34xJr45KF1kArWayFW29FZa9a43
	AFyFyF1Fyr1UXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgYRxlZXwGucQQABs1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 14/16] hw/timer: QOM'ify pxa2xx_timer
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
X-TUID: D0TYmt7FmQMv

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/pxa2xx_timer.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 0daa69c..33449e6 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -433,10 +433,10 @@ static int pxa25x_timer_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static int pxa2xx_timer_init(SysBusDevice *dev)
+static void pxa2xx_timer_init(Object *obj)
 {
-    PXA2xxTimerInfo *s = PXA2XX_TIMER(dev);
-    int i;
+    PXA2xxTimerInfo *s = PXA2XX_TIMER(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     s->irq_enabled = 0;
     s->oldclock = 0;
@@ -444,16 +444,28 @@ static int pxa2xx_timer_init(SysBusDevice *dev)
     s->lastload = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     s->reset3 = 0;
 
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_timer_ops, s,
+                          "pxa2xx-timer", 0x00001000);
+    sysbus_init_mmio(dev, &s->iomem);
+}
+
+static void pxa2xx_timer_realize(DeviceState *dev, Error **errp)
+{
+    PXA2xxTimerInfo *s = PXA2XX_TIMER(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    int i;
+
     for (i = 0; i < 4; i ++) {
         s->timer[i].value = 0;
-        sysbus_init_irq(dev, &s->timer[i].irq);
+        sysbus_init_irq(sbd, &s->timer[i].irq);
         s->timer[i].info = s;
         s->timer[i].num = i;
         s->timer[i].qtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                        pxa2xx_timer_tick, &s->timer[i]);
+                                          pxa2xx_timer_tick, &s->timer[i]);
     }
+
     if (s->flags & (1 << PXA2XX_TIMER_HAVE_TM4)) {
-        sysbus_init_irq(dev, &s->irq4);
+        sysbus_init_irq(sbd, &s->irq4);
 
         for (i = 0; i < 8; i ++) {
             s->tm4[i].tm.value = 0;
@@ -462,15 +474,9 @@ static int pxa2xx_timer_init(SysBusDevice *dev)
             s->tm4[i].freq = 0;
             s->tm4[i].control = 0x0;
             s->tm4[i].tm.qtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                        pxa2xx_timer_tick4, &s->tm4[i]);
+                                               pxa2xx_timer_tick4, &s->tm4[i]);
         }
     }
-
-    memory_region_init_io(&s->iomem, OBJECT(s), &pxa2xx_timer_ops, s,
-                          "pxa2xx-timer", 0x00001000);
-    sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static const VMStateDescription vmstate_pxa2xx_timer0_regs = {
@@ -573,9 +579,8 @@ static const TypeInfo pxa27x_timer_dev_info = {
 static void pxa2xx_timer_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(oc);
 
-    sdc->init = pxa2xx_timer_init;
+    dc->realize  = pxa2xx_timer_realize;
     dc->vmsd = &vmstate_pxa2xx_timer_regs;
 }
 
@@ -583,6 +588,7 @@ static const TypeInfo pxa2xx_timer_type_info = {
     .name          = TYPE_PXA2XX_TIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PXA2xxTimerInfo),
+    .instance_init = pxa2xx_timer_init,
     .abstract      = true,
     .class_init    = pxa2xx_timer_class_init,
 };
-- 
2.1.4



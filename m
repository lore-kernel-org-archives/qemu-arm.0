Received: by 10.25.208.211 with SMTP id h202csp2730290lfg;
        Thu, 25 Feb 2016 02:34:35 -0800 (PST)
X-Received: by 10.140.101.70 with SMTP id t64mr54436906qge.61.1456396475193;
        Thu, 25 Feb 2016 02:34:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w132si7494481qka.53.2016.02.25.02.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtFi-0001Bx-LY
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:34:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtE1-0006V0-AV
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtDv-0001Xy-94
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:32:49 -0500
Received: from m12-14.163.com ([220.181.12.14]:53008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYtDn-0001Mu-5p; Thu, 25 Feb 2016 05:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=zqmVIOeIGZVDm0zKyF
	H1qfUAnxee1f8e8GiVMPFYgx8=; b=i3ETFtssnjnHOHKZNvF1K9MaozykS1atNq
	qZRq/j7+tPJ5sPO61RvyTaolgdrXQP5MaW0h/vHAsb6y50XcY93G5Z+4R24KSC+f
	5tfK1yGjjoLjQw1F+CLuBslXSgH3qqBwlmy3XQhyQQOKdXE59gbzrgWZMkyMXLi7
	w/GaXCNH8=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp10 (Coremail) with SMTP id DsCowAB3JtoL2M5WrXOWCA--.37006S10;
	Thu, 25 Feb 2016 18:31:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Feb 2016 18:30:36 +0800
Message-Id: <1456396236-2759-9-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowAB3JtoL2M5WrXOWCA--.37006S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1kJrWxGw18Ww47GFyDWrg_yoW5Xr47pa
	1fXFn2y3W5XF4xX3yxJFnrJFZxJwn7Gr48GrnrJrWI9ws7Jr98KFyxArZrtFsFyrWSva13
	JrZ5Kw15CFyUKr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOTmhUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBkaxlWBT2U2LwAAsy
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-arm] [PATCH v5 8/8] hw/timer: QOM'ify grlib_gptimer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mDCd8V2aYu6g

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/grlib_gptimer.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index dd000f5..95d5b0d 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -348,16 +348,29 @@ static void grlib_gptimer_reset(DeviceState *d)
     }
 }
 
-static int grlib_gptimer_init(SysBusDevice *dev)
+static void grlib_gptimer_init(Object *obj)
 {
-    GPTimerUnit  *unit = GRLIB_GPTIMER(dev);
-    unsigned int  i;
+    GPTimerUnit  *unit = GRLIB_GPTIMER(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     assert(unit->nr_timers > 0);
     assert(unit->nr_timers <= GPTIMER_MAX_TIMERS);
 
     unit->timers = g_malloc0(sizeof unit->timers[0] * unit->nr_timers);
 
+    memory_region_init_io(&unit->iomem, obj, &grlib_gptimer_ops,
+                          unit, "gptimer",
+                          UNIT_REG_SIZE + GPTIMER_REG_SIZE * unit->nr_timers);
+
+    sysbus_init_mmio(dev, &unit->iomem);
+}
+
+static void grlib_gptimer_realize(DeviceState *dev, Error **errp)
+{
+    GPTimerUnit  *unit = GRLIB_GPTIMER(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    unsigned int  i;
+
     for (i = 0; i < unit->nr_timers; i++) {
         GPTimer *timer = &unit->timers[i];
 
@@ -367,17 +380,10 @@ static int grlib_gptimer_init(SysBusDevice *dev)
         timer->id     = i;
 
         /* One IRQ line for each timer */
-        sysbus_init_irq(dev, &timer->irq);
+        sysbus_init_irq(sbd, &timer->irq);
 
         ptimer_set_freq(timer->ptimer, unit->freq_hz);
     }
-
-    memory_region_init_io(&unit->iomem, OBJECT(unit), &grlib_gptimer_ops,
-                          unit, "gptimer",
-                          UNIT_REG_SIZE + GPTIMER_REG_SIZE * unit->nr_timers);
-
-    sysbus_init_mmio(dev, &unit->iomem);
-    return 0;
 }
 
 static Property grlib_gptimer_properties[] = {
@@ -390,9 +396,8 @@ static Property grlib_gptimer_properties[] = {
 static void grlib_gptimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = grlib_gptimer_init;
+    dc->realize = grlib_gptimer_realize;
     dc->reset = grlib_gptimer_reset;
     dc->props = grlib_gptimer_properties;
 }
@@ -401,6 +406,7 @@ static const TypeInfo grlib_gptimer_info = {
     .name          = TYPE_GRLIB_GPTIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(GPTimerUnit),
+    .instance_init = grlib_gptimer_init,
     .class_init    = grlib_gptimer_class_init,
 };
 
-- 
2.1.4



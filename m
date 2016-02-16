Received: by 10.25.208.211 with SMTP id h202csp1240484lfg;
        Tue, 16 Feb 2016 03:14:41 -0800 (PST)
X-Received: by 10.140.23.81 with SMTP id 75mr26468158qgo.35.1455621280962;
        Tue, 16 Feb 2016 03:14:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t138si39978096qhb.115.2016.02.16.03.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdaa-00036d-Dy
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:14:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXq-0006o4-SP
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXn-0006lw-9p
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:50 -0500
Received: from m12-13.163.com ([220.181.12.13]:48217)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXm-0006k7-HY; Tue, 16 Feb 2016 06:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=hdEUvD6xUZpPNZbZ7J
	3xDT9UUslsV2Mbf6PeUxW5ibc=; b=WK86UxJ+2Udgt5IRRlOMqtWmQisKz0WK5H
	WzKM36rUKuhDoX8eY53BzwqQr9Tc5WWRs7I2ocbR6EZeWJuYCn1HK1/OErJ7VFse
	NvJf3XplOkc9kT+DP9e8mwgVx4O+do6RS5cwL2PEPPtjS+Fe5vqWulkZ7T2GFBmb
	XkiiJaKjA=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S9;
	Tue, 16 Feb 2016 19:11:17 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:39 +0800
Message-Id: <1455620981-13868-8-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1UAF1fuFykGF1kuFWUXFb_yoW5GF47pw
	4fXFn2y3W5XF4xXa1xJFnrGF9xArn7Gw48Grn7JrZ29ws7JryDKFy7Ar4ktFsFkr4Fva13
	trWrKw15CFyUKr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U09a9UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMxURxlXlemCMWQAAsO
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 07/16] hw/timer: QOM'ify grlib_gptimer
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
X-TUID: y5sJXIN9YPPP

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/grlib_gptimer.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index dd000f5..02a19c9 100644
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
+static void grlib_gptimer_realize(DeviceState *dev, Error *errp)
+{
+    GPTimerUnit  *unit = GRLIB_GPTIMER(dev);
+    SysBusDevice *dev = SYS_BUS_DEVICE(dev);
+    unsigned int  i;
+
     for (i = 0; i < unit->nr_timers; i++) {
         GPTimer *timer = &unit->timers[i];
 
@@ -371,13 +384,6 @@ static int grlib_gptimer_init(SysBusDevice *dev)
 
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



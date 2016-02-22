Received: by 10.25.208.211 with SMTP id h202csp969956lfg;
        Sun, 21 Feb 2016 19:17:25 -0800 (PST)
X-Received: by 10.140.236.68 with SMTP id h65mr33598414qhc.13.1456111045293;
        Sun, 21 Feb 2016 19:17:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t191si27498907qhb.81.2016.02.21.19.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh00-0000vP-LQ
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:17:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzx-0000pe-4L
	for qemu-arm@nongnu.org; Sun, 21 Feb 2016 22:17:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzw-0007X5-5f
	for qemu-arm@nongnu.org; Sun, 21 Feb 2016 22:17:21 -0500
Received: from m12-16.163.com ([220.181.12.16]:54314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXgzq-0007Rz-0p; Sun, 21 Feb 2016 22:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=OFXOh0xWPDR9+RvJd6
	u+6FMsc0QnRM6p1sV1Tb4yDSE=; b=D9yK8et+CAl90wRrccseyj7ineueiU241U
	L+xYTi17ed2w5M1xuTxE1bt/4gwv2KuIoKGCYTmC1UBibLfdRE4pDFaufshyQauY
	wH9RGPf3C8+PTVOS4ysMXHiKAUOUqm4C1Zn2GYsEn0uKNl0I6Lx1H306dZaYbe1/
	6NL8h14L8=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S4;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:26 +0800
Message-Id: <1456110933-5457-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1kJryDKFy5Xw1xWry7trb_yoW5Gr17pw
	4fXFnay3W5XF4xXa1xJFnrGFZxAwn7GrW8Grn7JrWI9ws7JryDKa47Ars8tFsFkr4Fva13
	JrZ5Kw15CFy7Kr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jl9akUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEh0XxlZXwMnXMgAAsz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-arm] [PATCH v4 2/9] hw/timer: QOM'ify grlib_gptimer
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
X-TUID: B6s+QPBhWwOh

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

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



Received: by 10.25.208.211 with SMTP id h202csp970701lfg;
        Sun, 21 Feb 2016 19:20:20 -0800 (PST)
X-Received: by 10.140.240.87 with SMTP id l84mr33574336qhc.69.1456111220381;
        Sun, 21 Feb 2016 19:20:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d89si6978176qga.124.2016.02.21.19.20.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:20:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh2p-0006Pu-Ic
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:20:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXh0f-0002Of-KD
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:18:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXh0b-0007ju-Ia
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:18:05 -0500
Received: from m12-16.163.com ([220.181.12.16]:59030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXh0a-0007jM-Q3; Sun, 21 Feb 2016 22:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=9Q6MdIcGCFRSq0iIu3
	ZsGnbvfJNDd74XNfSTDrpUdzs=; b=keR52QNyOLrOnlnDazVi2bvtFUe6orCpuW
	FXNwiL9z2LCg/F148zdQRUpUvN6YSxe82bS/suh4O8FRpm9/e5mjtE/JsXA0cYzh
	dLTfTNEjFzhgH3eY1KI4v73rHiuWWZsOryRb73YZmKlZb5at1McJKVuYPrhtfk48
	5A+Ui20zY=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S10;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:32 +0800
Message-Id: <1456110933-5457-9-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF18KF45GFyfZw47WrWUtwb_yoW8ur18pF
	WxWF9rArnFyr4Dtw4xJF1DGFW8XFn7CF45Cw4ktwsrAFn7W3WDJ3WUJrZ7tFWxJFWv9Fy3
	A3yrWr13Zr45Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkOzsUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEh4XxlZXwMnXNwAAs1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v4 8/9] hw/timer: QOM'ify slavio_timer
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
X-TUID: oP8ILOKK8U/X

rename slavio_timer_init1 to slavio_timer_init and assign
it to slavio_timer_info.instance_init, then we drop the
SysBusDeviceClass::init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/slavio_timer.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index fb3e08b..b2c9364 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -373,9 +373,10 @@ static void slavio_timer_reset(DeviceState *d)
     s->cputimer_mode = 0;
 }
 
-static int slavio_timer_init1(SysBusDevice *dev)
+static void slavio_timer_init(Object *obj)
 {
-    SLAVIO_TIMERState *s = SLAVIO_TIMER(dev);
+    SLAVIO_TIMERState *s = SLAVIO_TIMER(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     QEMUBH *bh;
     unsigned int i;
     TimerContext *tc;
@@ -394,14 +395,12 @@ static int slavio_timer_init1(SysBusDevice *dev)
 
         size = i == 0 ? SYS_TIMER_SIZE : CPU_TIMER_SIZE;
         snprintf(timer_name, sizeof(timer_name), "timer-%i", i);
-        memory_region_init_io(&tc->iomem, OBJECT(s), &slavio_timer_mem_ops, tc,
+        memory_region_init_io(&tc->iomem, obj, &slavio_timer_mem_ops, tc,
                               timer_name, size);
         sysbus_init_mmio(dev, &tc->iomem);
 
         sysbus_init_irq(dev, &s->cputimer[i].irq);
     }
-
-    return 0;
 }
 
 static Property slavio_timer_properties[] = {
@@ -412,9 +411,7 @@ static Property slavio_timer_properties[] = {
 static void slavio_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = slavio_timer_init1;
     dc->reset = slavio_timer_reset;
     dc->vmsd = &vmstate_slavio_timer;
     dc->props = slavio_timer_properties;
@@ -424,6 +421,7 @@ static const TypeInfo slavio_timer_info = {
     .name          = TYPE_SLAVIO_TIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SLAVIO_TIMERState),
+    .instance_init = slavio_timer_init,
     .class_init    = slavio_timer_class_init,
 };
 
-- 
2.1.4



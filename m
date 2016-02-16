Received: by 10.25.208.211 with SMTP id h202csp1242664lfg;
        Tue, 16 Feb 2016 03:19:10 -0800 (PST)
X-Received: by 10.55.78.131 with SMTP id c125mr26391263qkb.71.1455621550235;
        Tue, 16 Feb 2016 03:19:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a141si40158012qkb.16.2016.02.16.03.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:19:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdev-0002HJ-KL
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:19:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdY1-00076R-4C
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXx-0006rP-9I
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:00 -0500
Received: from m12-12.163.com ([220.181.12.12]:35713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXt-0006on-MK; Tue, 16 Feb 2016 06:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=R5e1abxZC6C5KFFIlE
	Grxpuqrt9DV4I+s8qrJaAl+Ek=; b=X1DTD7gxhUL7UljnmDMXI/BV2vLDaR5xKq
	YguOpV03mwZHtTM+qqZPyLZMgt4aH7rjBP2j3ccabBVSSAChILWbxX1KiDQ6VL/1
	AiJGU2euG7eofqT249JRipFxZJ3WCThONSqpw5JFqv4ofVUT8tx3VHzL43qNf5xF
	i+YLileHw=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXn_PgA8NWODCxBQ--.25459S7;
	Tue, 16 Feb 2016 19:11:33 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:10:26 +0800
Message-Id: <1455621027-13927-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXn_PgA8NWODCxBQ--.25459S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF18KF4DAFWrCw48Aw4DXFb_yoW8uF48pa
	yxWF9rArnFyr4Dtw4xJFnrWFW8XFn7CF45Cw4ktwsrAFn7W3WDJ3WUJrZ7tFWxXFWv9Fy3
	A3yrWr13Zr45Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8PEfUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEAYRxlUL6veM1AAAsa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 15/16] hw/timer: QOM'ify slavio_timer
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
X-TUID: 1uVFBPIcOXRv

rename slavio_timer_init1 to slavio_timer_init and assign
it to slavio_timer_info.instance_init, then we drop the
SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



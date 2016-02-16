Received: by 10.25.208.211 with SMTP id h202csp1240550lfg;
        Tue, 16 Feb 2016 03:14:47 -0800 (PST)
X-Received: by 10.55.20.12 with SMTP id e12mr23386524qkh.41.1455621283942;
        Tue, 16 Feb 2016 03:14:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m12si40109591qkl.83.2016.02.16.03.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdad-0003Be-1d
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:14:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXq-0006o7-Rz
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXn-0006mV-TI
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:50 -0500
Received: from m12-13.163.com ([220.181.12.13]:48216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXm-0006k8-FA; Tue, 16 Feb 2016 06:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=pSASUmQdan9d1a3mj4
	SfVJotdT5TDeBdbrg8N8VAbEM=; b=KnoF64dfXq6AzOogIWAGRQ76HsJki18F5A
	A6w/yHUJR44fSTUhfuIXoKuxM3HhkqbhQz6YwpgKQ+C8LLj4WyGzZi4vunqhGtQj
	xAaXxIK0n/mWHcp+mgNoHyd2o6U5paZEAJVmeKVyY1FK/LmjO8xxr1STZ8i+v/MZ
	b9PBOE1Rw=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S5;
	Tue, 16 Feb 2016 19:11:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:35 +0800
Message-Id: <1455620981-13868-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF45ArWxJw4UWr13Kw45ZFb_yoW8CryDpa
	97GFsrGr4vqFs8ArZ7KFn7WF98JF97CryfKw18Jws2yw1fAFWDXFn5A3y7KFW7JFZ5uFW3
	ZrWFyr13Aa1jyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UaNtsUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBQRxlWBTsbjcwAAsf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 03/16] hw/timer: QOM'ify etraxfs_timer
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
X-TUID: zI5ORO2SG+U2

assign etraxfs_timer_init to etraxfs_timer_info.instance_init
and drop the SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/etraxfs_timer.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 36d8f46..4f115c7 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -315,9 +315,10 @@ static void etraxfs_timer_reset(void *opaque)
     qemu_irq_lower(t->irq);
 }
 
-static int etraxfs_timer_init(SysBusDevice *dev)
+static void etraxfs_timer_init(Object *obj)
 {
-    ETRAXTimerState *t = ETRAX_TIMER(dev);
+    ETRAXTimerState *t = ETRAX_TIMER(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     t->bh_t0 = qemu_bh_new(timer0_hit, t);
     t->bh_t1 = qemu_bh_new(timer1_hit, t);
@@ -329,24 +330,23 @@ static int etraxfs_timer_init(SysBusDevice *dev)
     sysbus_init_irq(dev, &t->irq);
     sysbus_init_irq(dev, &t->nmi);
 
-    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
+    memory_region_init_io(&t->mmio, obj, &timer_ops, t,
                           "etraxfs-timer", 0x5c);
     sysbus_init_mmio(dev, &t->mmio);
-    qemu_register_reset(etraxfs_timer_reset, t);
-    return 0;
 }
 
 static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
-    sdc->init = etraxfs_timer_init;
+    dc->reset = etraxfs_timer_reset;
 }
 
 static const TypeInfo etraxfs_timer_info = {
     .name          = TYPE_ETRAX_FS_TIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ETRAXTimerState),
+    .instance_init = etraxfs_timer_init,
     .class_init    = etraxfs_timer_class_init,
 };
 
-- 
2.1.4



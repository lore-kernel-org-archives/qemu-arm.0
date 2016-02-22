Received: by 10.25.208.211 with SMTP id h202csp971028lfg;
        Sun, 21 Feb 2016 19:21:36 -0800 (PST)
X-Received: by 10.140.138.71 with SMTP id 68mr34249616qhk.8.1456111295016;
        Sun, 21 Feb 2016 19:21:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q67si16629086qgd.110.2016.02.21.19.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:21:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh42-000141-GM
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:21:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXh0h-0002Sc-N0
	for qemu-arm@nongnu.org; Sun, 21 Feb 2016 22:18:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXh0g-0007kV-Me
	for qemu-arm@nongnu.org; Sun, 21 Feb 2016 22:18:07 -0500
Received: from m12-16.163.com ([220.181.12.16]:58922)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXh0b-0007ii-BK; Sun, 21 Feb 2016 22:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Yo5GsNLv1x9uBfmlNa
	tHURq7rMuHBKPi1SG4mg74wfM=; b=cCxr5KGAjwHCWtgxNJfdP+vwu3qLHRX30w
	uemm+2Mi3NyNUgCo3n+f8557S2S738fGxrqwJDonTon2K90umxjG7wgA/Mz8yLKD
	wmdmQkcj+eNjBvdxYcUqmZ73Inq9UAa/yF8gGZirlT+2XsKIXHA8aLUDb4ZfSYkE
	TnU5wvu7I=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S3;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:25 +0800
Message-Id: <1456110933-5457-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF45WF1rKF1kZF1UKF15Jwb_yoW8CrW5pa
	92kFsrGr4vqFs8ArZ7KFn7WF98JF97CryfKw18Jws2yw1fAFWDXF1kA3y7KF47Jrs5ZFW3
	ZrWFyF13Aa1jyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jddb8UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEB0XxlUL61WOsAABsD
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-arm] [PATCH v4 1/9] hw/timer: QOM'ify etraxfs_timer
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
X-TUID: jg5Wai+Y7iaC

assign etraxfs_timer_init to etraxfs_timer_info.instance_init
and drop the SysBusDeviceClass::init

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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



Received: by 10.25.208.211 with SMTP id h202csp1240577lfg;
        Tue, 16 Feb 2016 03:14:50 -0800 (PST)
X-Received: by 10.140.253.2 with SMTP id y2mr27993700qhc.89.1455621288446;
        Tue, 16 Feb 2016 03:14:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p133si40015965qhp.53.2016.02.16.03.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:14:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdah-0003Kh-Sd
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:14:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXz-00072T-B8
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXv-0006qY-6n
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:59 -0500
Received: from m12-13.163.com ([220.181.12.13]:48617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXu-0006pH-FX; Tue, 16 Feb 2016 06:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=yRuwDppIEWSibHboQ5
	irX19Nrd+9q5s0cU6eDXX57Ic=; b=O/OfQ7rAwKe92dtNkrdZfOpxXmLA/2Uvc0
	RlYRLYVtga5IXvvNaPvD2PeitwAiHu8TChO1OPa/UKv6KB1SJ0ny+j98qIqsxCpe
	7bZPvaocTeHoBX4mZOnQDHJ9U3g+rkpUg0TgSemJFTRInNqfD5PFo9UDQoQDqSKv
	+MWihKZ+c=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S6;
	Tue, 16 Feb 2016 19:11:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:36 +0800
Message-Id: <1455620981-13868-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4xtF1rWF1rAry5JF4kCrg_yoW8CrWkpF
	ZruF1xA3yfJrZ7AF4IyFnrW3WDC3Z5Crs2qrZ3CrykAw12gr9Fy3WkJFW7Aa18JrZ5AF15
	AFy8Jr15CF4UG3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U0hFxUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hURxlUL9fb6RQAAsy
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 04/16] hw/timer: QOM'ify exynos4210_mct
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
X-TUID: u1fdV0RN7VVq

assign exynos4210_mct_init to exynos4210_mct_info.instance_init
and drop the SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/exynos4210_mct.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 73e547c..ae69345 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1422,10 +1422,11 @@ static const MemoryRegionOps exynos4210_mct_ops = {
 };
 
 /* MCT init */
-static int exynos4210_mct_init(SysBusDevice *dev)
+static void exynos4210_mct_init(Object *obj)
 {
     int i;
-    Exynos4210MCTState *s = EXYNOS4210_MCT(dev);
+    Exynos4210MCTState *s = EXYNOS4210_MCT(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     QEMUBH *bh[2];
 
     /* Global timer */
@@ -1450,19 +1451,15 @@ static int exynos4210_mct_init(SysBusDevice *dev)
         sysbus_init_irq(dev, &s->l_timer[i].irq);
     }
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &exynos4210_mct_ops, s,
+    memory_region_init_io(&s->iomem, obj, &exynos4210_mct_ops, s,
                           "exynos4210-mct", MCT_SFR_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static void exynos4210_mct_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = exynos4210_mct_init;
     dc->reset = exynos4210_mct_reset;
     dc->vmsd = &vmstate_exynos4210_mct_state;
 }
@@ -1471,6 +1468,7 @@ static const TypeInfo exynos4210_mct_info = {
     .name          = TYPE_EXYNOS4210_MCT,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210MCTState),
+    .instance_init = exynos4210_mct_init,
     .class_init    = exynos4210_mct_class_init,
 };
 
-- 
2.1.4



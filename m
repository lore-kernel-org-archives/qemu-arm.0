Received: by 10.25.27.66 with SMTP id b63csp1935931lfb;
        Tue, 7 Jun 2016 03:48:13 -0700 (PDT)
X-Received: by 10.55.11.6 with SMTP id 6mr20846359qkl.160.1465296491776;
        Tue, 07 Jun 2016 03:48:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l83si13674644qki.30.2016.06.07.03.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEYN-0006ew-5e
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:48:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENI-0005Hx-Dj
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENG-0002Wq-FR
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:43 -0400
Received: from m12-18.163.com ([220.181.12.18]:51390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENA-0002Us-GB; Tue, 07 Jun 2016 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=x17t2WrVh8fSlGXjYS
	YIUDDSxAaymV7uXwjZe3io21A=; b=GOcTeu0cwBX2RTXh6zvTla5H2Shn1WwImM
	O+isUVmuxkfEYGOq61T9IzM8+zJ9Aj2wVuI7qcblrsE6FmCTabE9MZecp1uaUCPi
	uVXIG5/UKmpfcOpwfe+gvQujIZFylz4C3I4tpuzO4xl0nX30OY+OMk70jZbbkHhq
	Z6oofCvzM=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S3;
	Tue, 07 Jun 2016 18:36:11 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:41 +0800
Message-Id: <1465295747-11651-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
References: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47GFW8GryrJw1UCFWDCFg_yoW8ArWrpr
	Z7CF1kJw13JrWkJa92yr1kGF1DA3Z5CrsF9rZ3Cr1xJF13KFyIq3WkGay5ta4DArZ5ZF13
	Ar4Iyr9xA3WUA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSpB-UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOxuBxlXlT8pNvAAAsj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 11/17] hw/misc: QOM'ify exynos4210_pmu.c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	balrogg@gmail.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qmHZQZnh3mMy

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/misc/exynos4210_pmu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index 889abad..e30dbc7 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -457,15 +457,15 @@ static void exynos4210_pmu_reset(DeviceState *dev)
     }
 }
 
-static int exynos4210_pmu_init(SysBusDevice *dev)
+static void exynos4210_pmu_init(Object *obj)
 {
-    Exynos4210PmuState *s = EXYNOS4210_PMU(dev);
+    Exynos4210PmuState *s = EXYNOS4210_PMU(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     /* memory mapping */
-    memory_region_init_io(&s->iomem, OBJECT(dev), &exynos4210_pmu_ops, s,
+    memory_region_init_io(&s->iomem, obj, &exynos4210_pmu_ops, s,
                           "exynos4210.pmu", EXYNOS4210_PMU_REGS_MEM_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-    return 0;
 }
 
 static const VMStateDescription exynos4210_pmu_vmstate = {
@@ -481,9 +481,7 @@ static const VMStateDescription exynos4210_pmu_vmstate = {
 static void exynos4210_pmu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = exynos4210_pmu_init;
     dc->reset = exynos4210_pmu_reset;
     dc->vmsd = &exynos4210_pmu_vmstate;
 }
@@ -492,6 +490,7 @@ static const TypeInfo exynos4210_pmu_info = {
     .name          = TYPE_EXYNOS4210_PMU,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210PmuState),
+    .instance_init = exynos4210_pmu_init,
     .class_init    = exynos4210_pmu_class_init,
 };
 
-- 
2.1.4



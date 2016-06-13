Received: by 10.25.85.209 with SMTP id j200csp1126927lfb;
        Mon, 13 Jun 2016 03:39:52 -0700 (PDT)
X-Received: by 10.200.38.38 with SMTP id u35mr14228982qtu.43.1465814392017;
        Mon, 13 Jun 2016 03:39:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a72si14760161qha.127.2016.06.13.03.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPHb-000708-6z
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:39:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPB6-00019K-9P
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPAw-00053M-25
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:08 -0400
Received: from m12-17.163.com ([220.181.12.17]:35262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-00052B-O4; Mon, 13 Jun 2016 06:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=x17t2WrVh8fSlGXjYS
	YIUDDSxAaymV7uXwjZe3io21A=; b=fZymCfjYSbmlqOCs1QIWXKCFZAW7ZgsV5Z
	9VbHhf1x2ZOyiPoF/6ISUtW0JKGbrkj62klGtNJpMb6fh0sQ8Mnhq1JLyEJE3tKN
	jfA3i8/THv+GHhxlmZCzf6vC6NFbM86kzNwduT7+kvomKv+ajbXBzPF3Ql9Pxs41
	5KNfQ8Y0k=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S11;
	Mon, 13 Jun 2016 18:32:29 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:08 +0800
Message-Id: <1465813931-20534-10-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47GFW8GryrJw1UCFWDCFg_yoW8ArWrpr
	Z7CF1kJw13JrWkJa92yr1kGF1DA3Z5CrsF9rZ3Cr1xJF13KFyIq3WkGay5ta4DArZ5ZF13
	Ar4Iyr9xA3WUA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDxhLUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEByHxlUL88jDqQAAsC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-devel] [PATCH 09/12] hw/misc: QOM'ify exynos4210_pmu.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sALc/WJ2YiKK

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



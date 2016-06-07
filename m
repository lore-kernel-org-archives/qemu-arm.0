Received: by 10.25.27.66 with SMTP id b63csp1937652lfb;
        Tue, 7 Jun 2016 03:52:47 -0700 (PDT)
X-Received: by 10.140.41.83 with SMTP id y77mr17224325qgy.100.1465296767544;
        Tue, 07 Jun 2016 03:52:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y189si13653766qky.234.2016.06.07.03.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEco-0002SB-RB
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENM-0005N1-Eo
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENL-0002Y7-L4
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:48 -0400
Received: from m12-18.163.com ([220.181.12.18]:51439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENB-0002V5-6X; Tue, 07 Jun 2016 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=k7hQJanC1P/lsjipsA
	c6NAqq/8CFNVTA9oRYClmdTzc=; b=qUPApEn5JQu/XJ464nGQ5I0dy4FIJUDAow
	70of/adFV5l9yCTCbOjcMLeksTBRYJghIe243UuXQh+qiljjQclyYBvujwO46v44
	hM9Cy2NXNYdXBCWi1/0K1WB3ptd1JgTbxEWsuHoHTxLj99RWyTbt63kgVY7ILjcT
	e3/EHzmbA=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S8;
	Tue, 07 Jun 2016 18:36:11 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:46 +0800
Message-Id: <1465295747-11651-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
References: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47Cw1rWr48tw4UXw1DZFb_yoW8Wr4xpF
	93uF1kZrWUtFs7JFy7J3Z2kF10qw1kKa47GrWfGrsagF17GrW5Wanay34SvrWUJrWvv3Wf
	Xw1rGF9rJF4Iyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jD5rcUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hyBxlUL-PlFKgAAs9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 16/17] hw/dma: QOM'ify sun4m_iommu.c
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
X-TUID: UGWcrJoGLD9U

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/dma/sun4m_iommu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/dma/sun4m_iommu.c b/hw/dma/sun4m_iommu.c
index b3cbc54..335ef63 100644
--- a/hw/dma/sun4m_iommu.c
+++ b/hw/dma/sun4m_iommu.c
@@ -349,17 +349,16 @@ static void iommu_reset(DeviceState *d)
     s->regs[IOMMU_MASK_ID] = IOMMU_TS_MASK;
 }
 
-static int iommu_init1(SysBusDevice *dev)
+static void iommu_init(Object *obj)
 {
-    IOMMUState *s = SUN4M_IOMMU(dev);
+    IOMMUState *s = SUN4M_IOMMU(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(dev, &s->irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &iommu_mem_ops, s, "iommu",
+    memory_region_init_io(&s->iomem, obj, &iommu_mem_ops, s, "iommu",
                           IOMMU_NREGS * sizeof(uint32_t));
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static Property iommu_properties[] = {
@@ -370,9 +369,7 @@ static Property iommu_properties[] = {
 static void iommu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = iommu_init1;
     dc->reset = iommu_reset;
     dc->vmsd = &vmstate_iommu;
     dc->props = iommu_properties;
@@ -382,6 +379,7 @@ static const TypeInfo iommu_info = {
     .name          = TYPE_SUN4M_IOMMU,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(IOMMUState),
+    .instance_init = iommu_init,
     .class_init    = iommu_class_init,
 };
 
-- 
2.1.4



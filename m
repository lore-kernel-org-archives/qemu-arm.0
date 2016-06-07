Received: by 10.25.27.66 with SMTP id b63csp1939212lfb;
        Tue, 7 Jun 2016 03:57:09 -0700 (PDT)
X-Received: by 10.141.0.133 with SMTP id b127mr2314816qhd.9.1465297029312;
        Tue, 07 Jun 2016 03:57:09 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si13679608qkh.110.2016.06.07.03.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEh2-0005nf-Lu
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:57:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENH-0005HN-Kl
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENB-0002Va-7c
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:42 -0400
Received: from m12-18.163.com ([220.181.12.18]:51399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENA-0002V0-LE; Tue, 07 Jun 2016 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=u8fMScUYVk9LdTBULi
	PPVuu1Bk62Y1uAXggLpDTScog=; b=g2FbFC8Zd8nOff/VEfxMTCFpr7tY5yBBDh
	1xrr4e2L2g5+CP4u40QZoYwPDYin1E355y7B0nKICebPS5QsItoPiXwRj9G0vrF8
	WhTDF9DkJlToH51Ap2dQaJxy7Pou49FsaKMNB3bcTmdMfErqtkydXDNDRPhmMTR+
	W68gaVv7k=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S7;
	Tue, 07 Jun 2016 18:36:11 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:45 +0800
Message-Id: <1465295747-11651-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
References: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rtr45tryftF13Xw15XFb_yoW8try5pF
	93uFs5Wry5KFZrGr4fXan2gF1kJwnYk3yS9rW3Jrn2qFsrWr15ta4vyrySyr909rZ7ZF4F
	ga95Jw45ur17Cw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jD5rcUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEByBxlUL82dTtAAAsm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 15/17] hw/dma: QOM'ify sparc32_dma.c
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
X-TUID: 5tyMTH1bWmMX

Drop the old SysBus init function and use instance_init
and an realize function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/dma/sparc32_dma.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 9d545e4..ef4c6a9 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -270,23 +270,28 @@ static const VMStateDescription vmstate_dma = {
     }
 };
 
-static int sparc32_dma_init1(SysBusDevice *sbd)
+static void sparc32_dma_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    DMAState *s = SPARC32_DMA(dev);
-    int reg_size;
+    DeviceState *dev = DEVICE(obj);
+    DMAState *s = SPARC32_DMA(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(sbd, &s->irq);
 
-    reg_size = s->is_ledma ? DMA_ETH_SIZE : DMA_SIZE;
-    memory_region_init_io(&s->iomem, OBJECT(s), &dma_mem_ops, s,
-                          "dma", reg_size);
     sysbus_init_mmio(sbd, &s->iomem);
 
     qdev_init_gpio_in(dev, dma_set_irq, 1);
     qdev_init_gpio_out(dev, s->gpio, 2);
+}
 
-    return 0;
+static void sparc32_dma_realize(DeviceState *dev, Error **errp)
+{
+    DMAState *s = SPARC32_DMA(dev);
+    int reg_size;
+
+    reg_size = s->is_ledma ? DMA_ETH_SIZE : DMA_SIZE;
+    memory_region_init_io(&s->iomem, OBJECT(dev), &dma_mem_ops, s,
+                          "dma", reg_size);
 }
 
 static Property sparc32_dma_properties[] = {
@@ -298,12 +303,11 @@ static Property sparc32_dma_properties[] = {
 static void sparc32_dma_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = sparc32_dma_init1;
     dc->reset = dma_reset;
     dc->vmsd = &vmstate_dma;
     dc->props = sparc32_dma_properties;
+    dc->realize = sparc32_dma_realize;
     /* Reason: pointer property "iommu_opaque" */
     dc->cannot_instantiate_with_device_add_yet = true;
 }
@@ -312,6 +316,7 @@ static const TypeInfo sparc32_dma_info = {
     .name          = TYPE_SPARC32_DMA,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(DMAState),
+    .instance_init = sparc32_dma_init,
     .class_init    = sparc32_dma_class_init,
 };
 
-- 
2.1.4



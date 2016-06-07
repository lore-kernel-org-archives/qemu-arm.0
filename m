Received: by 10.25.27.66 with SMTP id b63csp1936754lfb;
        Tue, 7 Jun 2016 03:50:17 -0700 (PDT)
X-Received: by 10.237.35.152 with SMTP id j24mr20360068qtc.95.1465296617609;
        Tue, 07 Jun 2016 03:50:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si13677143qkf.107.2016.06.07.03.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:50:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEaO-00089A-W2
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENK-0005Kz-Ap
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENB-0002VK-3k
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:46 -0400
Received: from m12-18.163.com ([220.181.12.18]:51391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENA-0002Uu-H0; Tue, 07 Jun 2016 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=8sIYql+ZyGEkIAhM5K
	eeaLbRraOtCzapdKNoLeEakKo=; b=duMTNZX4edejpd1Ly69TZNT31StzR/Cemq
	VlZsCv2zd0IB8m8+Iq+okO1JXKGk6YxuQDKSlCGumDfAUqHeCvdD1qpSp1ukQeIN
	jlnQ8vBRJFppJEGG68b4/NDdXlt8zAMVL9KSDxNYVGbVhpYcRuakIL7JxkkWNQoo
	ClBqva7yU=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S4;
	Tue, 07 Jun 2016 18:36:11 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:42 +0800
Message-Id: <1465295747-11651-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
References: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47uF17Xr4DCFW5uF18Grg_yoW8CFWUpF
	93Z3WDur4rXrsFqrWfXrn8WF48Kws7Gws5tr10yws3ua4xGFWFq3Z2k3y2yrWUArWkXF4Y
	9F18WFyftayUCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jpYLkUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhuBxlWBRPuW+gAAsN
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 12/17] hw/misc: QOM'ify mst_fpga.c
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
X-TUID: ONWcNoDaO9q4

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/misc/mst_fpga.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index 48d7dfb..a10f049 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -200,10 +200,11 @@ static int mst_fpga_post_load(void *opaque, int version_id)
 	return 0;
 }
 
-static int mst_fpga_init(SysBusDevice *sbd)
+static void mst_fpga_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    mst_irq_state *s = MAINSTONE_FPGA(dev);
+    DeviceState *dev = DEVICE(obj);
+    mst_irq_state *s = MAINSTONE_FPGA(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->pcmcia0 = MST_PCMCIAx_READY | MST_PCMCIAx_nCD;
     s->pcmcia1 = MST_PCMCIAx_READY | MST_PCMCIAx_nCD;
@@ -213,10 +214,9 @@ static int mst_fpga_init(SysBusDevice *sbd)
     /* alloc the external 16 irqs */
     qdev_init_gpio_in(dev, mst_fpga_set_irq, MST_NUM_IRQS);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &mst_fpga_ops, s,
+    memory_region_init_io(&s->iomem, obj, &mst_fpga_ops, s,
                           "fpga", 0x00100000);
     sysbus_init_mmio(sbd, &s->iomem);
-    return 0;
 }
 
 static VMStateDescription vmstate_mst_fpga_regs = {
@@ -245,9 +245,7 @@ static VMStateDescription vmstate_mst_fpga_regs = {
 static void mst_fpga_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = mst_fpga_init;
     dc->desc = "Mainstone II FPGA";
     dc->vmsd = &vmstate_mst_fpga_regs;
 }
@@ -256,6 +254,7 @@ static const TypeInfo mst_fpga_info = {
     .name          = TYPE_MAINSTONE_FPGA,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(mst_irq_state),
+    .instance_init = mst_fpga_init,
     .class_init    = mst_fpga_class_init,
 };
 
-- 
2.1.4



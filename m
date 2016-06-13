Received: by 10.25.85.209 with SMTP id j200csp1127459lfb;
        Mon, 13 Jun 2016 03:41:25 -0700 (PDT)
X-Received: by 10.140.143.79 with SMTP id 76mr13513151qhp.72.1465814485408;
        Mon, 13 Jun 2016 03:41:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66si14811401qgb.105.2016.06.13.03.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPJ6-0008OE-Lc
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:41:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPBB-0001HJ-EU
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPAv-00052u-OZ
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:12 -0400
Received: from m12-17.163.com ([220.181.12.17]:35249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-000528-Do; Mon, 13 Jun 2016 06:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=8sIYql+ZyGEkIAhM5K
	eeaLbRraOtCzapdKNoLeEakKo=; b=YQszPAbs8wxJGtwToTVLJGrOnEMVAYTsm5
	87LcE6lC2eDIVHsT3NZATW7wFW8KLCzPJwStDmm+8JQdLFZy6O1ZymB3Zd0s/x+l
	PxProgmkT9RTM1zQOH7S+rLhPZ9bJE9zidb4OQP42jqbOQ9YGdOxgJtd3qBKUMmk
	WchMeLe3c=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S12;
	Mon, 13 Jun 2016 18:32:29 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:09 +0800
Message-Id: <1465813931-20534-11-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S12
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47uF17Xr4DCFW5uF18Grg_yoW8CFWUpF
	93Z3WDur4rXrsFqrWfXrn8WF48Kws7Gws5tr10yws3ua4xGFWFq3Z2k3y2yrWUArWkXF4Y
	9F18WFyftayUCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDsqXUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEByHxlWBV5hlvAAAsP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-devel] [PATCH 10/12] hw/misc: QOM'ify mst_fpga.c
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
X-TUID: pcCsIqQ8pOan

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



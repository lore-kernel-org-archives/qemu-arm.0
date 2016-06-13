Received: by 10.25.85.209 with SMTP id j200csp1136534lfb;
        Mon, 13 Jun 2016 04:04:43 -0700 (PDT)
X-Received: by 10.140.84.42 with SMTP id k39mr12875850qgd.21.1465815883529;
        Mon, 13 Jun 2016 04:04:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f194si14851938qke.19.2016.06.13.04.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPfe-0004A7-U2
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:04:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWz-0004ht-Gp
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWy-0003OS-LZ
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:55:45 -0400
Received: from m50-134.163.com ([123.125.50.134]:48168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWg-0003Hg-MQ; Mon, 13 Jun 2016 06:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=8sIYql+ZyGEkIAhM5K
	eeaLbRraOtCzapdKNoLeEakKo=; b=iRoX0MrlQucTfCySQkQtE5YmhByLwBhLTT
	+OtXRAO1AeRWSZhtDB48q0MPCL8mZ/qFNjwKfARt5EeDBFhxTUleXz0nIYwmXwpf
	7hLEzfB8BehnUVpLtBd44tEU21onNn39MnDpbO0K24t/PEhAT9U4KarUzstjfajI
	zL3YL8vfM=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowABHnZnpkF5XcVHjBA--.36675S6;
	Mon, 13 Jun 2016 18:54:35 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:13 +0800
Message-Id: <1465815255-21776-11-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DtGowABHnZnpkF5XcVHjBA--.36675S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47uF17Xr4DCFW5uF18Grg_yoW8CFWUpF
	93Z3WDur4rXrsFqrWfXrn8WF48Kws7Gws5tr10yws3ua4xGFWFq3Z2k3y2yrWUArWkXF4Y
	9F18WFyftayUCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqLvtUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTA6HxlSIPnTM3gAAsH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-arm] [RESEND PATCH 10/12] hw/misc: QOM'ify mst_fpga.c
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
X-TUID: Qo49hW+tTS5v

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



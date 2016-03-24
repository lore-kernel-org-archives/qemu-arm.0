Received: by 10.25.208.211 with SMTP id h202csp534544lfg;
        Thu, 24 Mar 2016 03:34:08 -0700 (PDT)
X-Received: by 10.140.104.19 with SMTP id z19mr9299405qge.68.1458815648354;
        Thu, 24 Mar 2016 03:34:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h94si4516230qkh.108.2016.03.24.03.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 03:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj2ad-0003P6-S0
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 06:34:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Ym-00081O-OX
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 06:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yl-0005eh-Q9
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 06:32:12 -0400
Received: from m12-16.163.com ([220.181.12.16]:34290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aj2Yc-0005W2-E4; Thu, 24 Mar 2016 06:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Ydir3o/mrkRkhYbxxP
	EfjLdME+G3928pz7soKOBc5NA=; b=TM7q+WPZB21DS+evNhMMNVWe48+A3yLFHP
	l1BUO0wvN0rnImzKZ2zR7tboH+R16J/AbqaC9OMfITVR+XlyEgd62edOeEI8IeRi
	iIsJ9s+/NSU9EVoHZ6VOoHfmPlSK1WF5nEsFqLfYn392lcSpal7x8Kg7VlzClOuv
	zVhIfm8Rg=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp12 (Coremail) with SMTP id EMCowEDpR1DcwfNWAMmNAA--.623S3;
	Thu, 24 Mar 2016 18:31:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 18:29:26 +0800
Message-Id: <1458815374-22279-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEDpR1DcwfNWAMmNAA--.623S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKw4fXFW5Wr45Wrg_yoW8tryUpr
	Z7CF1rtw1fWrWkGFWSkF1DK3Z8A3Z5Cr40qrs3Cw1xJw1UKr9Iva48Ja1UJ3Z8JrZ3ZF15
	ZFW8GFyru3WDK3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jr2-5UUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgc2xlZXwzSq8gAAsL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, michael@walle.cc,
	qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Subject: [Qemu-arm] [PATCH 1/5] hw/display: QOM'ify exynos4210_fimd.c
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
X-TUID: lZJtc4xdUf/3

* Drop the old SysBus init function and use instance_init
* Move graphic_console_init into realize stage

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/display/exynos4210_fimd.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 728eb21..e5be713 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1909,9 +1909,10 @@ static const GraphicHwOps exynos4210_fimd_ops = {
     .gfx_update  = exynos4210_fimd_update,
 };
 
-static int exynos4210_fimd_init(SysBusDevice *dev)
+static void exynos4210_fimd_init(Object *obj)
 {
-    Exynos4210fimdState *s = EXYNOS4210_FIMD(dev);
+    Exynos4210fimdState *s = EXYNOS4210_FIMD(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     s->ifb = NULL;
 
@@ -1919,28 +1920,32 @@ static int exynos4210_fimd_init(SysBusDevice *dev)
     sysbus_init_irq(dev, &s->irq[1]);
     sysbus_init_irq(dev, &s->irq[2]);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &exynos4210_fimd_mmio_ops, s,
+    memory_region_init_io(&s->iomem, obj, &exynos4210_fimd_mmio_ops, s,
             "exynos4210.fimd", FIMD_REGS_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-    s->console = graphic_console_init(DEVICE(dev), 0, &exynos4210_fimd_ops, s);
+}
 
-    return 0;
+static void exynos4210_fimd_realize(DeviceState *dev, Error **errp)
+{
+    Exynos4210fimdState *s = EXYNOS4210_FIMD(dev);
+
+    s->console = graphic_console_init(dev, 0, &exynos4210_fimd_ops, s);
 }
 
 static void exynos4210_fimd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
     dc->vmsd = &exynos4210_fimd_vmstate;
     dc->reset = exynos4210_fimd_reset;
-    k->init = exynos4210_fimd_init;
+    dc->realize = exynos4210_fimd_realize;
 }
 
 static const TypeInfo exynos4210_fimd_info = {
     .name = TYPE_EXYNOS4210_FIMD,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210fimdState),
+    .instance_init = exynos4210_fimd_init,
     .class_init = exynos4210_fimd_class_init,
 };
 
-- 
2.1.4



Received: by 10.25.208.137 with SMTP id h131csp491806lfg;
        Wed, 4 May 2016 20:07:28 -0700 (PDT)
X-Received: by 10.194.113.3 with SMTP id iu3mr13066094wjb.149.1462417648314;
        Wed, 04 May 2016 20:07:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a136si1023531wmd.61.2016.05.04.20.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 20:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay9d8-00024W-OQ
	for alex.bennee@linaro.org; Wed, 04 May 2016 23:07:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cy-0001hg-BU
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cm-0002PE-Eb
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:06:54 -0400
Received: from m12-12.163.com ([220.181.12.12]:48194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay9cI-00025i-Gz; Wed, 04 May 2016 23:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Ydir3o/mrkRkhYbxxP
	EfjLdME+G3928pz7soKOBc5NA=; b=krwjmUZcYddcHJIB10U1GUi/ajkwwzb796
	/LfL+jpilBgntaEd/7tuudhWhi+zuOUnnjjNS2L25HZTpyPTn2xJObUAWke8qvZt
	GDY9T8YdsaZUY5VLUtXkCXjWtZolM1RNG/FuVNEEVj8ZdaZxfyIehs5v8N1KgIoi
	nsCR2KA+s=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXJrdyuCpXst8DBg--.1983S3;
	Thu, 05 May 2016 11:05:46 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 May 2016 11:04:45 +0800
Message-Id: <1462417489-28603-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXJrdyuCpXst8DBg--.1983S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKw4fXFW5Wr45Wrg_yoW8tryUpr
	Z7CF1rtw1fWrWkGFWSkF1DK3Z8A3Z5Cr40qrs3Cw1xJw1UKr9Iva48Ja1UJ3Z8JrZ3ZF15
	ZFW8GFyru3WDK3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jvsjUUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFgxgxlWBQo0V2wAAsp
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Subject: [Qemu-arm] [PATCH RESEND 1/5] hw/display: QOM'ify exynos4210_fimd.c
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
Cc: i.mitsyanko@gmail.com, michael@walle.cc, qemu-arm@nongnu.org,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rAvlcz1O2K1y

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



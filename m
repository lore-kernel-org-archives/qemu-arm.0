Received: by 10.25.208.137 with SMTP id h131csp215029lfg;
        Fri, 6 May 2016 04:05:38 -0700 (PDT)
X-Received: by 10.28.133.129 with SMTP id h123mr8736533wmd.33.1462532738358;
        Fri, 06 May 2016 04:05:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id ka3si17712986wjb.136.2016.05.06.04.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 04:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aydZR-0001Jq-5h
	for alex.bennee@linaro.org; Fri, 06 May 2016 07:05:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydXG-0006Ek-PL
	for qemu-devel@nongnu.org; Fri, 06 May 2016 07:03:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydX2-0001mv-4W
	for qemu-devel@nongnu.org; Fri, 06 May 2016 07:03:01 -0400
Received: from m12-16.163.com ([220.181.12.16]:50793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aydX0-0001dz-Ei; Fri, 06 May 2016 07:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Ydir3o/mrkRkhYbxxP
	EfjLdME+G3928pz7soKOBc5NA=; b=XbOTz88eBsul7mtxAc96DjWMumvYYQKUXv
	vMnBYYSgRUkat33SIua6IM+CwSEjXRtDekfs0R+AIu5brD6CHUqkQCep/7RM6AuE
	UttLoY3TMYRtUCYaSYK+rddqIdgOOZyPASZu8gJJ61aGQdMxQYpoXRH7H2B31bBU
	YFpqZ2EWI=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowACXRsM7eSxXsYpAAA--.18847S3;
	Fri, 06 May 2016 19:01:55 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 May 2016 18:59:31 +0800
Message-Id: <1462532375-29264-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
References: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowACXRsM7eSxXsYpAAA--.18847S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKw4fXFW5Wr45Wrg_yoW8tryUpr
	Z7CF1rtw1fWrWkGFWSkF1DK3Z8A3Z5Cr40qrs3Cw1xJw1UKr9Iva48Ja1UJ3Z8JrZ3ZF15
	ZFW8GFyru3WDK3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc9N3UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwNhxlXlTXqTVwABsd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-devel] [PATCH v2 1/5] hw/display: QOM'ify exynos4210_fimd.c
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
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com, armbru@redhat.com,
	michael@walle.cc, qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wi4fOWedwsth

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



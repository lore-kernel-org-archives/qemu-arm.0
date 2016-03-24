Received: by 10.25.208.211 with SMTP id h202csp533978lfg;
        Thu, 24 Mar 2016 03:32:59 -0700 (PDT)
X-Received: by 10.55.52.211 with SMTP id b202mr9376579qka.27.1458815578510;
        Thu, 24 Mar 2016 03:32:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5si5956921qkl.103.2016.03.24.03.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 03:32:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj2ZW-0000gX-0C
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 06:32:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yj-0007x7-QU
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 06:32:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yd-0005cj-Po
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 06:32:09 -0400
Received: from m12-16.163.com ([220.181.12.16]:34296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aj2Yc-0005W6-RM; Thu, 24 Mar 2016 06:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JZp7kQDC/e4W8akK/S
	Xnq6B9NcM5Wuw/rOUFem9R1b0=; b=MnZeZMGzzCVQmvOpvtXldQQjMqRNP7YnpS
	2/ucRfe+5EU2lqeaTo6E+GYpA/8Nq1/7ChdtE6P7abVJ/Op3KUvYNT0NMDPcV76V
	+aFmHw1uGs+APUPXlSqohbDMg7Qrm278lQ4zI2qa684CF8eZZgkayNEkteLt/ZKi
	0qvW6G9xg=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp12 (Coremail) with SMTP id EMCowEDpR1DcwfNWAMmNAA--.623S8;
	Thu, 24 Mar 2016 18:31:03 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 18:29:31 +0800
Message-Id: <1458815374-22279-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEDpR1DcwfNWAMmNAA--.623S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKFW3GF13tF48tFb_yoW8ur48pF
	Z7ZFZ09r47GFsxWrWxJF1vgF15Awn2yFyxWry0yw1xJa17Jryfu3ZrZF1rZr4DtFZFva43
	XFWkt3WUKr45tw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwvtAUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgc2xlZXwzSq-AAAsF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, michael@walle.cc,
	qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Subject: [Qemu-devel] [PATCH 4/5] hw/display: QOM'ify milkymist-vgafb.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jY2apuG/XPTD

* Drop the old SysBus init function and use instance_init
* Move graphic_console_init into realize stage

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/display/milkymist-vgafb.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index 19ca256..39e16d6 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -292,17 +292,21 @@ static const GraphicHwOps vgafb_ops = {
     .gfx_update  = vgafb_update_display,
 };
 
-static int milkymist_vgafb_init(SysBusDevice *dev)
+static void milkymist_vgafb_init(Object *obj)
 {
-    MilkymistVgafbState *s = MILKYMIST_VGAFB(dev);
+    MilkymistVgafbState *s = MILKYMIST_VGAFB(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     memory_region_init_io(&s->regs_region, OBJECT(s), &vgafb_mmio_ops, s,
             "milkymist-vgafb", R_MAX * 4);
     sysbus_init_mmio(dev, &s->regs_region);
+}
 
-    s->con = graphic_console_init(DEVICE(dev), 0, &vgafb_ops, s);
+static void milkymist_vgafb_realize(DeviceState *dev, Error **errp)
+{
+    MilkymistVgafbState *s = MILKYMIST_VGAFB(dev);
 
-    return 0;
+    s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
 }
 
 static int vgafb_post_load(void *opaque, int version_id)
@@ -331,18 +335,18 @@ static Property milkymist_vgafb_properties[] = {
 static void milkymist_vgafb_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = milkymist_vgafb_init;
     dc->reset = milkymist_vgafb_reset;
     dc->vmsd = &vmstate_milkymist_vgafb;
     dc->props = milkymist_vgafb_properties;
+    dc->realize = milkymist_vgafb_realize;
 }
 
 static const TypeInfo milkymist_vgafb_info = {
     .name          = TYPE_MILKYMIST_VGAFB,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MilkymistVgafbState),
+    .instance_init = milkymist_vgafb_init,
     .class_init    = milkymist_vgafb_class_init,
 };
 
-- 
2.1.4



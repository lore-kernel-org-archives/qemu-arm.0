Received: by 10.25.208.137 with SMTP id h131csp491839lfg;
        Wed, 4 May 2016 20:07:35 -0700 (PDT)
X-Received: by 10.194.201.37 with SMTP id jx5mr11220850wjc.60.1462417655907;
        Wed, 04 May 2016 20:07:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si8743832wjp.9.2016.05.04.20.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 20:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay9dG-0002KC-Fm
	for alex.bennee@linaro.org; Wed, 04 May 2016 23:07:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9d5-0001xB-GW
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:07:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9co-0002Qy-I2
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:07:02 -0400
Received: from m12-12.163.com ([220.181.12.12]:48198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay9cJ-00025n-Cm; Wed, 04 May 2016 23:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JZp7kQDC/e4W8akK/S
	Xnq6B9NcM5Wuw/rOUFem9R1b0=; b=VAiKCFWBTwPTeR76wjFPzFpy+2b1/Qq/2m
	p8sy1dkrryjn1aoD19rlGC/5qKeD/ItXhggIyija+7LkP6caZHITX9nnQZyqMvNt
	fD0BfLjSf+nN/+3QU1t96S+HoHU1K6+vdh0w0SSuwI/lrfb6CIVAM7i8nNpOXKd8
	8BPIdI6qU=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXJrdyuCpXst8DBg--.1983S6;
	Thu, 05 May 2016 11:05:47 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 May 2016 11:04:48 +0800
Message-Id: <1462417489-28603-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXJrdyuCpXst8DBg--.1983S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKFW3GF13tF48tFb_yoW8ur48pF
	Z7ZFZ09r47GFsxWrWxJF1vgF15Awn2yFyxWry0yw1xJa17Jryfu3ZrZF1rZr4DtFZFva43
	XFWkt3WUKr45tw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jP_-PUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFgxgxlWBQo0V3wAAst
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Subject: [Qemu-arm] [PATCH RESEND 4/5] hw/display: QOM'ify milkymist-vgafb.c
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
X-TUID: WTcvhmwe8BsT

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



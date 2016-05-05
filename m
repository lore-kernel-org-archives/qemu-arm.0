Received: by 10.25.208.137 with SMTP id h131csp491812lfg;
        Wed, 4 May 2016 20:07:29 -0700 (PDT)
X-Received: by 10.194.95.198 with SMTP id dm6mr12001284wjb.136.1462417649734;
        Wed, 04 May 2016 20:07:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j123si1008971wmb.118.2016.05.04.20.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 20:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay9dA-0001k1-2d
	for alex.bennee@linaro.org; Wed, 04 May 2016 23:07:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cU-0000vf-KG
	for qemu-devel@nongnu.org; Wed, 04 May 2016 23:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cI-0002Ev-UB
	for qemu-devel@nongnu.org; Wed, 04 May 2016 23:06:25 -0400
Received: from m12-12.163.com ([220.181.12.12]:48196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay9cH-00025j-76; Wed, 04 May 2016 23:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=WyCV9gM3Fx4CSTgIr+
	xzOd7MvieUVLhuwCv/eFi5M8U=; b=C/EkKRaYlD/7zeOHZjgfHOEHlsv3glQYWv
	gmgymD5P4Ze49vGF7GubkTFFJvJMZMVgsKa2dFjtgijruWxeKJyyxvAwOyvSlp8k
	vW08Fz+2g34V5BL6qBuGtxcijQtydd9z0orZ8uT0zK64te/aZSzSvEXztCJsUAYe
	PfOuBGlH4=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXJrdyuCpXst8DBg--.1983S5;
	Thu, 05 May 2016 11:05:46 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 May 2016 11:04:47 +0800
Message-Id: <1462417489-28603-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXJrdyuCpXst8DBg--.1983S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXw1UJr15AF47ur4fAFb_yoW8urWfpF
	WxZF4Ykw47KFsrXrWavr1qgr1UAa1kKry8KF1xtwn2yF1UJr9xJan7uw43Ar4DtFWv9FW3
	Jayvyry7ta1Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jtEfOUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAxgxlSIO6JwOAAAsr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Subject: [Qemu-devel] [PATCH RESEND 3/5] hw/display: QOM'ify milkymist-tmu2.c
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
Cc: i.mitsyanko@gmail.com, michael@walle.cc, qemu-arm@nongnu.org,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Id8IbTlzke3

* Drop the old SysBus init function and use instance_init
* Move tmu2_glx_init into realize stage

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/display/milkymist-tmu2.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 9bc88f9..df10bf4 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -443,21 +443,25 @@ static void milkymist_tmu2_reset(DeviceState *d)
     }
 }
 
-static int milkymist_tmu2_init(SysBusDevice *dev)
+static void milkymist_tmu2_init(Object *obj)
 {
-    MilkymistTMU2State *s = MILKYMIST_TMU2(dev);
-
-    if (tmu2_glx_init(s)) {
-        return 1;
-    }
+    MilkymistTMU2State *s = MILKYMIST_TMU2(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(dev, &s->irq);
 
-    memory_region_init_io(&s->regs_region, OBJECT(s), &tmu2_mmio_ops, s,
+    memory_region_init_io(&s->regs_region, obj, &tmu2_mmio_ops, s,
             "milkymist-tmu2", R_MAX * 4);
     sysbus_init_mmio(dev, &s->regs_region);
+}
 
-    return 0;
+static void milkymist_tmu2_realize(DeviceState *dev, Error **errp)
+{
+    MilkymistTMU2State *s = MILKYMIST_TMU2(dev);
+
+    if (tmu2_glx_init(s)) {
+        error_setg(errp, "tmu2_glx_init failed.");
+    }
 }
 
 static const VMStateDescription vmstate_milkymist_tmu2 = {
@@ -473,9 +477,8 @@ static const VMStateDescription vmstate_milkymist_tmu2 = {
 static void milkymist_tmu2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = milkymist_tmu2_init;
+    dc->realize = milkymist_tmu2_realize;
     dc->reset = milkymist_tmu2_reset;
     dc->vmsd = &vmstate_milkymist_tmu2;
 }
@@ -484,6 +487,7 @@ static const TypeInfo milkymist_tmu2_info = {
     .name          = TYPE_MILKYMIST_TMU2,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MilkymistTMU2State),
+    .instance_init = milkymist_tmu2_init,
     .class_init    = milkymist_tmu2_class_init,
 };
 
-- 
2.1.4



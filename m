Received: by 10.25.208.211 with SMTP id h202csp535353lfg;
        Thu, 24 Mar 2016 03:35:43 -0700 (PDT)
X-Received: by 10.140.160.214 with SMTP id g205mr9892521qhg.88.1458815743382;
        Thu, 24 Mar 2016 03:35:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si5969829qhw.69.2016.03.24.03.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 03:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj2cA-0006FT-UF
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 06:35:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yt-0008GN-JW
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 06:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yn-0005fP-W1
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 06:32:19 -0400
Received: from m12-16.163.com ([220.181.12.16]:34298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aj2Yb-0005WA-Ad; Thu, 24 Mar 2016 06:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=adi6MFd3LjPcrQl7We
	1iwrgrge+bj4nh3LKjBC6nSfc=; b=Flz807XVk/0NLlEDhco2dH2HFDvMCamEJ4
	aGDidp5p98yop5QrdA0wzn1MfOCH7beM1SQ9xK8M5x4s9xWIJD7A4+q4Ur4KCCn0
	hdf+uk9t0Cn/7fQ00ksLp8xZ/YvlN3D0Ahip/EHTPDxjpMkdkV65P0EFFGqYsg5Y
	ULt73eXDY=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp12 (Coremail) with SMTP id EMCowEDpR1DcwfNWAMmNAA--.623S9;
	Thu, 24 Mar 2016 18:31:03 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 18:29:32 +0800
Message-Id: <1458815374-22279-8-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEDpR1DcwfNWAMmNAA--.623S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW3AF4fXry5ur4DAr45trb_yoW8Ww17pF
	Z3ZF90vF47JFsxXrWxAr1vgF15Awn7tFn7Wry0yrn3J3W7Jry7W3ZrXFyYqr4DtFZ2va43
	XFW0yw47Kr45tw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwvtAUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAc2xlSIOGT1ywAAsF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, michael@walle.cc,
	qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Subject: [Qemu-arm] [PATCH 5/6] hw/display/milkymist-vgafb.c
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
X-TUID: y6UkuRxAhwVE

---
 hw/display/milkymist-vgafb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index 19ca256..cc1245e 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -292,17 +292,16 @@ static const GraphicHwOps vgafb_ops = {
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
 
     s->con = graphic_console_init(DEVICE(dev), 0, &vgafb_ops, s);
-
-    return 0;
 }
 
 static int vgafb_post_load(void *opaque, int version_id)
@@ -331,9 +330,7 @@ static Property milkymist_vgafb_properties[] = {
 static void milkymist_vgafb_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = milkymist_vgafb_init;
     dc->reset = milkymist_vgafb_reset;
     dc->vmsd = &vmstate_milkymist_vgafb;
     dc->props = milkymist_vgafb_properties;
@@ -343,6 +340,7 @@ static const TypeInfo milkymist_vgafb_info = {
     .name          = TYPE_MILKYMIST_VGAFB,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MilkymistVgafbState),
+    .instance_init = milkymist_vgafb_init,
     .class_init    = milkymist_vgafb_class_init,
 };
 
-- 
2.1.4



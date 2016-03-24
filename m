Received: by 10.25.208.211 with SMTP id h202csp534848lfg;
        Thu, 24 Mar 2016 03:34:42 -0700 (PDT)
X-Received: by 10.55.31.215 with SMTP id n84mr944422qkh.93.1458815682612;
        Thu, 24 Mar 2016 03:34:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si5982231qhw.26.2016.03.24.03.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 03:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj2bC-0004Pb-3n
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 06:34:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yp-00087n-P1
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 06:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yl-0005eU-MO
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 06:32:15 -0400
Received: from m12-16.163.com ([220.181.12.16]:34289)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aj2Yb-0005W3-OC; Thu, 24 Mar 2016 06:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JiZOJgcbgS609cqPcB
	euCcZeh62y6DgQZP8TG5/tr4Q=; b=enVH6707xCWNZjt8/mRY0tBU4bqMXZ4slH
	SxdIFNE79AAoxqxdv4Lngm9Zy13UcGWkXfcJ+NR2EPRdP+hO6Q8YtcKkDXhDkPN+
	DDr09M33YMTyCK46GS7d/T4Ni7ZXPozieeIG4xfEqWAz8uQ94mMNEnzyDj2hIfuZ
	VKFIUS2QI=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp12 (Coremail) with SMTP id EMCowEDpR1DcwfNWAMmNAA--.623S11;
	Thu, 24 Mar 2016 18:31:03 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 18:29:34 +0800
Message-Id: <1458815374-22279-10-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEDpR1DcwfNWAMmNAA--.623S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr45CF4rKFy5XFWkZF4kCrg_yoW8Gw4rpF
	Z3uF18Z3yrJFsrJw1ft3WkWFn0kw1kGw4rtrW2ywnYy342kw4rta4DJ3yIyrWUtay0vF1Y
	9FWrJFW7tr18Aw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwyCJUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMwc2xlXlfSdQuQAAsH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, michael@walle.cc,
	qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Subject: [Qemu-arm] [PATCH 6/6] QOM hw/display/pl110.c
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
X-TUID: PVae1YKqSQiW

---
 hw/display/pl110.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index d589959..342e7ed 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -465,23 +465,17 @@ static const GraphicHwOps pl110_gfx_ops = {
     .gfx_update  = pl110_update_display,
 };
 
-static int pl110_initfn(SysBusDevice *sbd)
+static void pl110_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    PL110State *s = PL110(dev);
+    DeviceState *dev = DEVICE(obj);
+    PL110State *s = PL110(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &pl110_ops, s, "pl110", 0x1000);
+    memory_region_init_io(&s->iomem, obj, &pl110_ops, s, "pl110", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     qdev_init_gpio_in(dev, pl110_mux_ctrl_set, 1);
     s->con = graphic_console_init(dev, 0, &pl110_gfx_ops, s);
-    return 0;
-}
-
-static void pl110_init(Object *obj)
-{
-    PL110State *s = PL110(obj);
-
     s->version = PL110;
 }
 
@@ -502,9 +496,7 @@ static void pl111_init(Object *obj)
 static void pl110_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pl110_initfn;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->vmsd = &vmstate_pl110;
 }
-- 
2.1.4



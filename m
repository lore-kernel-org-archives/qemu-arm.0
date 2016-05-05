Received: by 10.25.208.137 with SMTP id h131csp491955lfg;
        Wed, 4 May 2016 20:07:59 -0700 (PDT)
X-Received: by 10.28.63.148 with SMTP id m142mr645520wma.85.1462417679386;
        Wed, 04 May 2016 20:07:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si8712660wjb.107.2016.05.04.20.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 20:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay9dd-0002lM-SN
	for alex.bennee@linaro.org; Wed, 04 May 2016 23:07:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cl-0001Gc-1R
	for qemu-devel@nongnu.org; Wed, 04 May 2016 23:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cK-0002Fv-1p
	for qemu-devel@nongnu.org; Wed, 04 May 2016 23:06:40 -0400
Received: from m12-12.163.com ([220.181.12.12]:48195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay9cI-00025l-JN; Wed, 04 May 2016 23:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=QkWGLfZHnfx3jjk1Yl
	OOFkB1YB7z80mYWJ2gqNwhOtg=; b=kFmHGUNNTlI5JW21c+aXkWUnaxrCcV42pX
	yey/a/Qwi9xl4OtoSNjomnd01Xrq8p0YH8N0myK3qpzZT/vPxPWDNAAsSj0dq1q+
	i1BodDVu6aH2+FmlUF1FpVMlLe7nqL7TczUbCM1gm/lo/neCsDo/TA/EV7pyxad9
	SekgFlawQ=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXJrdyuCpXst8DBg--.1983S7;
	Thu, 05 May 2016 11:05:47 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 May 2016 11:04:49 +0800
Message-Id: <1462417489-28603-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXJrdyuCpXst8DBg--.1983S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKw1UGrWfJw1DJrb_yoW8CFyUpF
	Z3uFyjvrWrXFsrCw4xt3WkWFn8Gw1kGw45tr9Fyw1xJ34jkws5tas7A3yay3yqgay0vF1Y
	9FWrtF17Jr4kAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBVbgUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEAxgxlWBVMh2KQAAst
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Subject: [Qemu-devel] [PATCH RESEND 5/5] hw/display: QOM'ify pl110.c
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
X-TUID: PIbNGqyir08F

* Drop the old SysBus init function and use instance_init
* Move graphic_console_init into realize stage

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/display/pl110.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index d589959..61418da 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -465,24 +465,24 @@ static const GraphicHwOps pl110_gfx_ops = {
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
-    s->con = graphic_console_init(dev, 0, &pl110_gfx_ops, s);
-    return 0;
 }
 
-static void pl110_init(Object *obj)
+static void pl110_realize(DeviceState *dev, Error **errp)
 {
-    PL110State *s = PL110(obj);
+    PL110State *s = PL110(dev);
 
     s->version = PL110;
+    s->con = graphic_console_init(dev, 0, &pl110_gfx_ops, s);
 }
 
 static void pl110_versatile_init(Object *obj)
@@ -502,11 +502,10 @@ static void pl111_init(Object *obj)
 static void pl110_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pl110_initfn;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->vmsd = &vmstate_pl110;
+    dc->realize = pl110_realize;
 }
 
 static const TypeInfo pl110_info = {
-- 
2.1.4



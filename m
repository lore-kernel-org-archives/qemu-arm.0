Received: by 10.25.208.137 with SMTP id h131csp214062lfg;
        Fri, 6 May 2016 04:04:05 -0700 (PDT)
X-Received: by 10.28.212.8 with SMTP id l8mr4619670wmg.11.1462532645208;
        Fri, 06 May 2016 04:04:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h201si10016625wme.86.2016.05.06.04.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 04:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aydXv-0007Jp-4Q
	for alex.bennee@linaro.org; Fri, 06 May 2016 07:03:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydXZ-0006cl-W7
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:03:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydXN-0001tp-46
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:03:20 -0400
Received: from m12-16.163.com ([220.181.12.16]:50794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aydWz-0001eL-D3; Fri, 06 May 2016 07:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=E43lye1wFxA7VmJ3Ex
	JTTenp5zZyC6DvFkdA7kzdnNM=; b=DpUmZFUeQblRIktQ2kYh9eN1F2nb+zpaOg
	siP2s7/0zeKGZCG+QPeeSaboRLwEQZ4fbQ/1njNeQ5uzyrxRy6m9obJucQYoUOLa
	pn0a6LvbZEY83KBxAk/34LG3ykEQQvaSSOuwZXBThmlGL2d+4nE7rM5pFod/polF
	F6SKHq8ac=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowACXRsM7eSxXsYpAAA--.18847S7;
	Fri, 06 May 2016 19:01:56 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 May 2016 18:59:35 +0800
Message-Id: <1462532375-29264-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
References: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowACXRsM7eSxXsYpAAA--.18847S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXFWkKFW5JFWUKF4xCrg_yoW8Cw1DpF
	Z3uF13ArW8XFsrGw4ftF1kGF90kws7G3y5trZFyw1fA34jkws5ta4kA3ySyrWqqay0vF1Y
	9FWrtF17Jr48Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxMa8UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwRhxlXlTXqTWQAAsV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-arm] [PATCH v2 5/5] hw/display: QOM'ify pl110.c
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
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com, armbru@redhat.com,
	michael@walle.cc, qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rM76G/AdYmOH

* Drop the old SysBus init function and use instance_init
* Move graphic_console_init into realize stage

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/display/pl110.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index d589959..73453b9 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -465,24 +465,26 @@ static const GraphicHwOps pl110_gfx_ops = {
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
+    /* subclass instance_init may override this */
+    s->version = PL110;
+
+    memory_region_init_io(&s->iomem, obj, &pl110_ops, s, "pl110", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     qdev_init_gpio_in(dev, pl110_mux_ctrl_set, 1);
+}
+
+static void pl110_realize(DeviceState *dev, Error **errp)
+{
+    PL110State *s = PL110(dev);
+
     s->con = graphic_console_init(dev, 0, &pl110_gfx_ops, s);
-    return 0;
-}
-
-static void pl110_init(Object *obj)
-{
-    PL110State *s = PL110(obj);
-
-    s->version = PL110;
 }
 
 static void pl110_versatile_init(Object *obj)
@@ -502,11 +504,10 @@ static void pl111_init(Object *obj)
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



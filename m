Received: by 10.80.166.35 with SMTP id d32csp2124771edc;
        Sun, 23 Oct 2016 02:23:25 -0700 (PDT)
X-Received: by 10.55.158.6 with SMTP id h6mr9699931qke.41.1477214605183;
        Sun, 23 Oct 2016 02:23:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p88si7482633qtd.69.2016.10.23.02.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 02:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byF00-0002jB-Ld
	for alex.bennee@linaro.org; Sun, 23 Oct 2016 05:23:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvi-0008GC-CJ
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvd-0002b9-CQ
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:58 -0400
Received: from m12-11.163.com ([220.181.12.11]:39476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1byEvc-0002ad-IH; Sun, 23 Oct 2016 05:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=FoxPM+xdroYTOOInnV
	bXp9AUjigBI2ArmGxSrifnbn0=; b=Qse83ggWzQJqi0nJPwxM3uQH12tn3ljIOp
	6VQmL3t7DlcdvGMTyAMkob0iMbqPqgsAhkXd1onm/1k8H3G+mj7WIFeuhHgV1m+u
	vntp0TzMPPA9l2Zz3MPZHlqiSKfkY6a9tSIydz1YwbqTUMzmRYoezvTYZ2bKahdd
	+FJtbY0oE=
Received: from debian.lan (unknown [114.111.167.207])
	by smtp7 (Coremail) with SMTP id C8CowACHR3FSgAxYG4EdBQ--.32654S6;
	Sun, 23 Oct 2016 17:18:21 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Oct 2016 17:18:16 +0800
Message-Id: <20161023091816.3839-5-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161023091816.3839-1-zxq_yx_007@163.com>
References: <20161023091816.3839-1-zxq_yx_007@163.com>
X-CM-TRANSID: C8CowACHR3FSgAxYG4EdBQ--.32654S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1rJr1xuw4fXF4kZFyUtrb_yoW8Xr1DpF
	WfuF1jy3yrXF4DJw4xtF1kWr1DCan7G34rtrZ2yw1fZ34jkrsxta4kC3yayr4jgay8Z3WF
	9FWrtF47tr48Aw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07beKZJUUUUU=
X-Originating-IP: [114.111.167.207]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0h0MxlUMBQbehQAAsE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Subject: [Qemu-devel] [PATCH 4/4] hw/display: QOM'ify pl110.c
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1fG6KBeCXD71

Drop the old Sysbus init and use instance_init and
DeviceClass::realize instead

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/display/pl110.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index c069c0b..eae4cde 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -466,17 +466,15 @@ static const GraphicHwOps pl110_gfx_ops = {
     .gfx_update  = pl110_update_display,
 };
 
-static int pl110_initfn(SysBusDevice *sbd)
+static void pl110_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(sbd);
     PL110State *s = PL110(dev);
-
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     memory_region_init_io(&s->iomem, OBJECT(s), &pl110_ops, s, "pl110", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     qdev_init_gpio_in(dev, pl110_mux_ctrl_set, 1);
     s->con = graphic_console_init(dev, 0, &pl110_gfx_ops, s);
-    return 0;
 }
 
 static void pl110_init(Object *obj)
@@ -503,11 +501,10 @@ static void pl111_init(Object *obj)
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
2.9.3



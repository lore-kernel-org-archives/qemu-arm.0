Received: by 10.25.85.209 with SMTP id j200csp1127783lfb;
        Mon, 13 Jun 2016 03:42:21 -0700 (PDT)
X-Received: by 10.55.212.133 with SMTP id s5mr12999574qks.85.1465814540982;
        Mon, 13 Jun 2016 03:42:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r185si14796044qke.5.2016.06.13.03.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPK0-0001C3-7Y
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:42:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPBF-0001ML-89
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPBD-00057a-A2
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:16 -0400
Received: from m12-17.163.com ([220.181.12.17]:35245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-000527-7x; Mon, 13 Jun 2016 06:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=cjM2kj3T3p6VFDK9N8
	GZyrkCrYTKSFTm8jhGwbQCt3s=; b=qWEHBJYluj9cQj66WCU7SwhihgPP/8Wqh5
	bnXpRSLeDQP5QidxmjFn1bV/Xg4NwKEsKoWlLq7BAZV79pdE6xdwIgzIkkKSus+5
	ED29cUKWmfyx9nVJiFBAUHxe+jGPiRwc6XGexpIGLQBU7iMCfjX8RhW+iZgLc9Ua
	ql+H9hjyo=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S9;
	Mon, 13 Jun 2016 18:32:29 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:06 +0800
Message-Id: <1465813931-20534-8-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rWF4UGryUXFyUWF18uFg_yoW8AryxpF
	Z7WF1DCFn5WFsrXryftr4qgF1rGws7Wwn7Zr1xKr1Ik3WUKFy5ZFs7Aa4avrs8J3ykZF1Y
	9rWrGFyxAr4Yyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDTmhUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMxyHxlXlgy63sAAAs0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-arm] [PATCH 07/12] hw/gpio: QOM'ify zaurus.c
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	balrogg@gmail.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sET6ADbWuFeJ

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/gpio/zaurus.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 555da28..15865e1 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -167,19 +167,18 @@ static void scoop_gpio_set(void *opaque, int line, int level)
         s->gpio_level &= ~(1 << line);
 }
 
-static int scoop_init(SysBusDevice *sbd)
+static void scoop_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    ScoopInfo *s = SCOOP(dev);
+    DeviceState *dev = DEVICE(obj);
+    ScoopInfo *s = SCOOP(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->status = 0x02;
     qdev_init_gpio_out(dev, s->handler, 16);
     qdev_init_gpio_in(dev, scoop_gpio_set, 16);
-    memory_region_init_io(&s->iomem, OBJECT(s), &scoop_ops, s, "scoop", 0x1000);
+    memory_region_init_io(&s->iomem, obj, &scoop_ops, s, "scoop", 0x1000);
 
     sysbus_init_mmio(sbd, &s->iomem);
-
-    return 0;
 }
 
 static int scoop_post_load(void *opaque, int version_id)
@@ -239,9 +238,7 @@ static const VMStateDescription vmstate_scoop_regs = {
 static void scoop_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = scoop_init;
     dc->desc = "Scoop2 Sharp custom ASIC";
     dc->vmsd = &vmstate_scoop_regs;
 }
@@ -250,6 +247,7 @@ static const TypeInfo scoop_sysbus_info = {
     .name          = TYPE_SCOOP,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ScoopInfo),
+    .instance_init = scoop_init,
     .class_init    = scoop_sysbus_class_init,
 };
 
-- 
2.1.4



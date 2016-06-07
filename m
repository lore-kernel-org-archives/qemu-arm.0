Received: by 10.25.27.66 with SMTP id b63csp1932279lfb;
        Tue, 7 Jun 2016 03:38:05 -0700 (PDT)
X-Received: by 10.55.201.154 with SMTP id m26mr20791888qkl.18.1465295885444;
        Tue, 07 Jun 2016 03:38:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w188si13627185qkc.171.2016.06.07.03.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEOa-00061B-Oo
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:38:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMj-0004n8-2Y
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMc-0002Ph-MJ
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:36:08 -0400
Received: from m12-17.163.com ([220.181.12.17]:54845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEMc-0002OX-Ax; Tue, 07 Jun 2016 06:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=cjM2kj3T3p6VFDK9N8
	GZyrkCrYTKSFTm8jhGwbQCt3s=; b=XwaiH6Z1vxQDtrIKuCmh4h8b+5hC+LOKis
	GIcjZyLEvzICj8qfZOpW3PyLC4VnI3SD3Atqtp2n/5NnPEeXs6muyvSVxfiW1M/U
	LPwgK/Xh13Qe2K76F+4LWYcark3UfpGvsNmPM4FVieieE+CzVKjXiV18Eez6wo6+
	sdtJKhHLs=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowACn18too1ZXX6l+AQ--.13818S3;
	Tue, 07 Jun 2016 18:35:37 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:11 +0800
Message-Id: <1465295712-11582-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295712-11582-1-git-send-email-zxq_yx_007@163.com>
References: <1465295712-11582-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowACn18too1ZXX6l+AQ--.13818S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rWF4UGryUXFyUWF18uFg_yoW8AryxpF
	Z7WF1DCFn5WFsrXryftr4qgF1rGws7Wwn7Zr1xKr1Ik3WUKFy5ZFs7Aa4avrs8J3ykZF1Y
	9rWrGFyxAr4Yyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhrchUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBmBxlWBVzbf5AABsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-devel] [PATCH 08/17] hw/gpio: QOM'ify zaurus.c
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UhP/Uf5llu42

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



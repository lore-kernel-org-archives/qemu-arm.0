Received: by 10.25.85.209 with SMTP id j200csp1130819lfb;
        Mon, 13 Jun 2016 03:51:13 -0700 (PDT)
X-Received: by 10.55.105.130 with SMTP id e124mr13347652qkc.16.1465815073217;
        Mon, 13 Jun 2016 03:51:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si12532207qkd.160.2016.06.13.03.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPSa-0008Ua-JB
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:51:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPB5-00018o-Dy
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPAw-00053J-2N
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:33:07 -0400
Received: from m12-17.163.com ([220.181.12.17]:35252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-00052A-O6; Mon, 13 Jun 2016 06:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=VlUShdRzSOCwIkrtOP
	LjsOw8cKtpOve2jIi46S7VuMk=; b=CnoFWEqDKV86hBaUFXcIf7wwMosJJrCfiC
	w7zPLjFJ/M8mGlP6Pds9WloekDCYoCzEt+KTr7GrtLN5kNaWetJwKGhed2FMWYlz
	UArQF45Mr4h1sfUw3iWtda65dRodF2zBVCQbTA3I60b71nEVcDo8J8SM7eSLi3eV
	qwSZt2a3s=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S4;
	Mon, 13 Jun 2016 18:32:28 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:01 +0800
Message-Id: <1465813931-20534-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4rKFyDuFWktFW8XFy5urg_yoW8AF4kpr
	Z3uF15Cr13JFW8XrWIyF1DGFn8A3ZYkw4vvrs3urn2qwnFgry2yrykJa1Yya4DJrZYyF15
	ZFyxt3W5AF4UGrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jpSoJUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hyHxlUL-VpqIQAAs9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-devel] [PATCH 02/12] hw/i2c: QOM'ify exynos4210_i2c.c
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
X-TUID: Y0C5y7cMaA4R

* Rename the exynos4210_i2c_realize to exynos4210_i2c_init
* Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/i2c/exynos4210_i2c.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index 8c2a2c1..c96fa7d 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -299,33 +299,32 @@ static void exynos4210_i2c_reset(DeviceState *d)
     s->scl_free = true;
 }
 
-static int exynos4210_i2c_realize(SysBusDevice *sbd)
+static void exynos4210_i2c_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    Exynos4210I2CState *s = EXYNOS4_I2C(dev);
+    DeviceState *dev = DEVICE(obj);
+    Exynos4210I2CState *s = EXYNOS4_I2C(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &exynos4210_i2c_ops, s,
+    memory_region_init_io(&s->iomem, obj, &exynos4210_i2c_ops, s,
                           TYPE_EXYNOS4_I2C, EXYNOS4_I2C_MEM_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     s->bus = i2c_init_bus(dev, "i2c");
-    return 0;
 }
 
 static void exynos4210_i2c_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *sbdc = SYS_BUS_DEVICE_CLASS(klass);
 
     dc->vmsd = &exynos4210_i2c_vmstate;
     dc->reset = exynos4210_i2c_reset;
-    sbdc->init = exynos4210_i2c_realize;
 }
 
 static const TypeInfo exynos4210_i2c_type_info = {
     .name = TYPE_EXYNOS4_I2C,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210I2CState),
+    .instance_init = exynos4210_i2c_init,
     .class_init = exynos4210_i2c_class_init,
 };
 
-- 
2.1.4



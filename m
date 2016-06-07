Received: by 10.25.27.66 with SMTP id b63csp1934361lfb;
        Tue, 7 Jun 2016 03:43:53 -0700 (PDT)
X-Received: by 10.140.236.83 with SMTP id h80mr20541118qhc.74.1465296233895;
        Tue, 07 Jun 2016 03:43:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si13665404qkc.48.2016.06.07.03.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEUD-00033T-A8
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:43:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMe-0004jt-GL
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMV-0002NU-7I
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:04 -0400
Received: from m12-18.163.com ([220.181.12.18]:45286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEM8-0002Go-Qa; Tue, 07 Jun 2016 06:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=VlUShdRzSOCwIkrtOP
	LjsOw8cKtpOve2jIi46S7VuMk=; b=b2CWqa/oAHlH8DvrtHLHvmKHRqGzK2vDZW
	9T3oOC3dIgT56jYcgGI2iqWfCawBpOHzJbqH2/KKI+ssyR6EJtE1NxBS5rDlgCUl
	ku2OuCwHRlQIBz5qHEWMaZAfb5NwjcoLct86hcc/ICa9H13MG3nZwHNBtrRcs1fB
	rddsXlcww=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEAJmUVLo1ZXMS8LAA--.4188S4;
	Tue, 07 Jun 2016 18:35:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:34:39 +0800
Message-Id: <1465295683-11505-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowEAJmUVLo1ZXMS8LAA--.4188S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4rKFyDuFWktFW8XFy5urg_yoW8AF4kpr
	Z3uF15Cr13JFW8XrWIyF1DGFn8A3ZYkw4vvrs3urn2qwnFgry2yrykJa1Yya4DJrZYyF15
	ZFyxt3W5AF4UGrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jy_M3UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEhaBxlZXyNwR0AAAsX
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 02/17] hw/i2c: QOM'ify exynos4210_i2c.c
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
X-TUID: oVgJuVEZVjjt

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



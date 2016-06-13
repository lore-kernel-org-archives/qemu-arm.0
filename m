Received: by 10.25.85.209 with SMTP id j200csp1134322lfb;
        Mon, 13 Jun 2016 04:00:17 -0700 (PDT)
X-Received: by 10.140.94.7 with SMTP id f7mr13279698qge.68.1465815617649;
        Mon, 13 Jun 2016 04:00:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4si14811664qkl.235.2016.06.13.04.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPbN-0008Ue-0b
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:00:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWm-0004Ss-0E
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWe-0003Hc-D4
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:31 -0400
Received: from m50-134.163.com ([123.125.50.134]:47817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWd-0003G7-9l; Mon, 13 Jun 2016 06:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=VlUShdRzSOCwIkrtOP
	LjsOw8cKtpOve2jIi46S7VuMk=; b=LOSuwgck4Iz8+Qyi2NCWPEqsAJVb/aBWlW
	CYr5qX6bsn9F9eHbzISNL0qj/zPZidYq1UMfRvhlKwnoxyMipArDdea20M+Ofi/L
	nEQSNboufjGu1eXMWn7KvYM3W14HWHyjHPbIrEmNwcYjXFIl5N4I1ucWFUBiZjD8
	wDBhOR+yI=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowADHQpfkkF5X+0_jBA--.36165S4;
	Mon, 13 Jun 2016 18:54:32 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:05 +0800
Message-Id: <1465815255-21776-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DtGowADHQpfkkF5X+0_jBA--.36165S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4rKFyDuFWktFW8XFy5urg_yoW8AF4kpr
	Z3uF15Cr13JFW8XrWIyF1DGFn8A3ZYkw4vvrs3urn2qwnFgry2yrykJa1Yya4DJrZYyF15
	ZFyxt3W5AF4UGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJManUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFgiHxlWBRV1LOAABsh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-devel] [RESEND PATCH 02/12] hw/i2c: QOM'ify exynos4210_i2c.c
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
X-TUID: 5Hk6KsgUjE3a

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



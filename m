Received: by 10.25.85.209 with SMTP id j200csp1124487lfb;
        Mon, 13 Jun 2016 03:33:08 -0700 (PDT)
X-Received: by 10.140.36.167 with SMTP id p36mr13167050qgp.24.1465813988673;
        Mon, 13 Jun 2016 03:33:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v29si12876324qta.107.2016.06.13.03.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPB6-00017y-3g
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:33:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPB2-00015d-Td
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPB1-00054V-01
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:03 -0400
Received: from m12-17.163.com ([220.181.12.17]:35242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-000522-42; Mon, 13 Jun 2016 06:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=hwkBkP8cdi0S0zwQPT
	ykJy7XKkwEyReBbcVVevqbB3g=; b=C6z1G4O6Bs+HL6WQbyNzTFBElueDdGASwx
	r95Ca1Ee6mj+sknF07Yiwpx4AueNQks+Exsgb1zlTEL2V79nbm5CLUuSid0lDmFl
	wNYUvZx6c6ZKpCm+Jx+h753rwCqDlFUIBNaNcX7zGSwcuK+Ob/1Y8bQlkL84r5wB
	loHrQI7M4=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S3;
	Mon, 13 Jun 2016 18:32:28 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:32:00 +0800
Message-Id: <1465813931-20534-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47AF1DWryUZFWfZFyftFb_yoW8Ar48pa
	yfZFn5u3y5XFZ7Wry2qFs3GF18Jws7WFZ3Cw4Ikr1093WDurWqyr1DAayavw1UJrWku3WS
	qw4rJay7AF4vkw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jh18PUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhyHxlWBRV0FaQAAsr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-arm] [PATCH 01/12] hw/i2c: QOM'ify bitbang_i2c.c
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
X-TUID: yEzEZ3dhXiFR

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/i2c/bitbang_i2c.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 6ed2060..d3a2989 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -210,13 +210,14 @@ static void bitbang_i2c_gpio_set(void *opaque, int irq, int level)
     }
 }
 
-static int gpio_i2c_init(SysBusDevice *sbd)
+static void gpio_i2c_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    GPIOI2CState *s = GPIO_I2C(dev);
+    DeviceState *dev = DEVICE(obj);
+    GPIOI2CState *s = GPIO_I2C(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-    memory_region_init(&s->dummy_iomem, OBJECT(s), "gpio_i2c", 0);
+    memory_region_init(&s->dummy_iomem, obj, "gpio_i2c", 0);
     sysbus_init_mmio(sbd, &s->dummy_iomem);
 
     bus = i2c_init_bus(dev, "i2c");
@@ -224,16 +225,12 @@ static int gpio_i2c_init(SysBusDevice *sbd)
 
     qdev_init_gpio_in(dev, bitbang_i2c_gpio_set, 2);
     qdev_init_gpio_out(dev, &s->out, 1);
-
-    return 0;
 }
 
 static void gpio_i2c_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = gpio_i2c_init;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->desc = "Virtual GPIO to I2C bridge";
 }
@@ -242,6 +239,7 @@ static const TypeInfo gpio_i2c_info = {
     .name          = TYPE_GPIO_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(GPIOI2CState),
+    .instance_init = gpio_i2c_init,
     .class_init    = gpio_i2c_class_init,
 };
 
-- 
2.1.4



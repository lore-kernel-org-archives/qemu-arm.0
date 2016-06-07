Received: by 10.25.27.66 with SMTP id b63csp1933634lfb;
        Tue, 7 Jun 2016 03:41:43 -0700 (PDT)
X-Received: by 10.200.37.15 with SMTP id 15mr11180291qtm.68.1465296103388;
        Tue, 07 Jun 2016 03:41:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11si14746930qhd.94.2016.06.07.03.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAES6-0000u2-Nm
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMK-0004RX-SB
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:35:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEM9-0002IP-Lg
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:35:43 -0400
Received: from m12-18.163.com ([220.181.12.18]:45287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEM9-0002Gp-1q; Tue, 07 Jun 2016 06:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=hwkBkP8cdi0S0zwQPT
	ykJy7XKkwEyReBbcVVevqbB3g=; b=S0UqGxavDCHUNnC+63tq/DgUbsk3nVIOEn
	JUsuTjPj1TiOGMp92r9k2rHyqv2EiQ+Z1BOjv8O2kW53uc7falobOEHvE10zqo3V
	19UL1yjXogN0lGlSL6gygsY/c8rJ2p8hc+azJB9vDS66sZOTNUWkJeBWP99bYNE2
	9BjvC4/F4=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEAJmUVLo1ZXMS8LAA--.4188S3;
	Tue, 07 Jun 2016 18:35:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:34:38 +0800
Message-Id: <1465295683-11505-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowEAJmUVLo1ZXMS8LAA--.4188S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47AF1DWryUZFWfZFyftFb_yoW8Ar48pa
	yfZFn5u3y5XFZ7Wry2qFs3GF18Jws7WFZ3Cw4Ikr1093WDurWqyr1DAayavw1UJrWku3WS
	qw4rJay7AF4vkw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcgA7UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMxaBxlXlgs1RVgAAsa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 01/17] hw/i2c: QOM'ify bitbang_i2c.c
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
X-TUID: M9AFZRtOn+Z6

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



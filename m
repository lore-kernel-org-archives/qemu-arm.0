Received: by 10.25.27.66 with SMTP id b63csp1931454lfb;
        Tue, 7 Jun 2016 03:35:45 -0700 (PDT)
X-Received: by 10.55.33.40 with SMTP id h40mr20098718qkh.148.1465295745286;
        Tue, 07 Jun 2016 03:35:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i48si13684258qgd.46.2016.06.07.03.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEMK-0004Or-N1
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEME-0004NI-KC
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:35:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMD-0002JO-Ge
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:35:38 -0400
Received: from m12-18.163.com ([220.181.12.18]:45712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEM8-0002H1-8x; Tue, 07 Jun 2016 06:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=DthYEp+g4aKFASeXVk
	dAcvPmp2jJqJI+J0/w+IpeZq8=; b=XMj8ewGNuFDo9Xib30ljpAIdTHKipzN1OT
	tIZ71ngzEOQicSP1HfAvNknGs/Ahnh4Kxt2FYVi+uiGENkF6w5Ro5JRBeeALWiLV
	qiUfPTLjacJn/2OMetJkAUkGOMQYTr+WUQ6NHhogWvMzypkpldz2rJXknqG9ksc2
	CPGlfIT44=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEAJmUVLo1ZXMS8LAA--.4188S7;
	Tue, 07 Jun 2016 18:35:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:34:42 +0800
Message-Id: <1465295683-11505-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowEAJmUVLo1ZXMS8LAA--.4188S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWkZFW8ur4ktr4fJw4xZwb_yoW8uF43pF
	yDuF1rur4YyF4DJr43JF1kCr1kCwn7Kr1xtrZrA3sayF1YgFWjvr9Fya93Xrs8trW8Z3W3
	X3ykJFyDJF1DAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxucNUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEhaBxlZXyNwR0gAAsV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 05/17] hw/gpio: QOM'ify mpc8xxx.c
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
X-TUID: GCeEl30rQy+W

* Drop the old SysBus init function and use instance_init
* Change mpc8xxx_gpio_reset to a DeviceClass::reset function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/gpio/mpc8xxx.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
index d149719..e12edb4 100644
--- a/hw/gpio/mpc8xxx.c
+++ b/hw/gpio/mpc8xxx.c
@@ -143,8 +143,10 @@ static void mpc8xxx_gpio_write(void *opaque, hwaddr offset,
     mpc8xxx_gpio_update(s);
 }
 
-static void mpc8xxx_gpio_reset(MPC8XXXGPIOState *s)
+static void mpc8xxx_gpio_reset(DeviceState *dev)
 {
+    MPC8XXXGPIOState *s = MPC8XXX_GPIO(dev);
+
     s->dir = 0;
     s->odr = 0;
     s->dat = 0;
@@ -180,33 +182,33 @@ static const MemoryRegionOps mpc8xxx_gpio_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static int mpc8xxx_gpio_initfn(SysBusDevice *sbd)
+static void mpc8xxx_gpio_initfn(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    MPC8XXXGPIOState *s = MPC8XXX_GPIO(dev);
+    DeviceState *dev = DEVICE(obj);
+    MPC8XXXGPIOState *s = MPC8XXX_GPIO(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &mpc8xxx_gpio_ops, s, "mpc8xxx_gpio", 0x1000);
+    memory_region_init_io(&s->iomem, obj, &mpc8xxx_gpio_ops,
+                          s, "mpc8xxx_gpio", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     qdev_init_gpio_in(dev, mpc8xxx_gpio_set_irq, 32);
     qdev_init_gpio_out(dev, s->out, 32);
-    mpc8xxx_gpio_reset(s);
-    return 0;
 }
 
 static void mpc8xxx_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = mpc8xxx_gpio_initfn;
     dc->vmsd = &vmstate_mpc8xxx_gpio;
+    dc->reset = mpc8xxx_gpio_reset;
 }
 
 static const TypeInfo mpc8xxx_gpio_info = {
     .name          = TYPE_MPC8XXX_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MPC8XXXGPIOState),
+    .instance_init = mpc8xxx_gpio_initfn,
     .class_init    = mpc8xxx_gpio_class_init,
 };
 
-- 
2.1.4



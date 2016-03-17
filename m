Received: by 10.25.208.211 with SMTP id h202csp441564lfg;
        Thu, 17 Mar 2016 06:27:25 -0700 (PDT)
X-Received: by 10.140.104.242 with SMTP id a105mr14311848qgf.1.1458221245861;
        Thu, 17 Mar 2016 06:27:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si7813140qka.117.2016.03.17.06.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 06:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agXxV-0005kw-B6
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 09:27:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1agXwh-0004fK-Un
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:26:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1agXwg-0000H6-Lk
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:26:35 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:8646)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1agXwX-0000AS-Nk; Thu, 17 Mar 2016 09:26:26 -0400
Received: from 172.24.1.49 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDR74278; Thu, 17 Mar 2016 21:26:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 17 Mar 2016 21:25:55 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <wei@redhat.com>
Date: Thu, 17 Mar 2016 21:25:39 +0800
Message-ID: <1458221140-15232-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
References: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56EAB06E.0209, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 38bd23b0a45ff1b67603fcd50e665a87
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Subject: [Qemu-devel] [PATCH 1/2] hw/gpio: Add the emulation of gpio_key
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pcI0/qmbALTy

From: Shannon Zhao <shannon.zhao@linaro.org>

This will be used by ARM virt machine as a power button.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/gpio/Makefile.objs           |   1 +
 hw/gpio/gpio_key.c              | 100 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 hw/gpio/gpio_key.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2bcd236..c63cdd0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -111,3 +111,4 @@ CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
+CONFIG_GPIO_KEY=y
diff --git a/hw/gpio/Makefile.objs b/hw/gpio/Makefile.objs
index 52233f7..a43c7cf 100644
--- a/hw/gpio/Makefile.objs
+++ b/hw/gpio/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_PL061) += pl061.o
 common-obj-$(CONFIG_PUV3) += puv3_gpio.o
 common-obj-$(CONFIG_ZAURUS) += zaurus.o
 common-obj-$(CONFIG_E500) += mpc8xxx.o
+common-obj-$(CONFIG_GPIO_KEY) += gpio_key.o
 
 obj-$(CONFIG_OMAP) += omap_gpio.o
 obj-$(CONFIG_IMX) += imx_gpio.o
diff --git a/hw/gpio/gpio_key.c b/hw/gpio/gpio_key.c
new file mode 100644
index 0000000..41639fa
--- /dev/null
+++ b/hw/gpio/gpio_key.c
@@ -0,0 +1,100 @@
+/*
+ * GPIO key
+ *
+ * Copyright (c) 2016 Linaro Limited
+ *
+ * Author: Shannon Zhao <shannon.zhao@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+
+#define TYPE_GPIOKEY "gpio_key"
+#define GPIOKEY(obj) OBJECT_CHECK(GPIOKEYState, (obj), TYPE_GPIOKEY)
+#define GPIO_KEY_LATENCY 100 /* 100ms */
+
+typedef struct GPIOKEYState {
+    SysBusDevice parent_obj;
+
+    QEMUTimer *timer;
+    qemu_irq irq;
+} GPIOKEYState;
+
+static const VMStateDescription vmstate_gpio_key = {
+    .name = "gpio_key",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER_PTR(timer, GPIOKEYState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void gpio_key_reset(DeviceState *dev)
+{
+    GPIOKEYState *s = GPIOKEY(dev);
+
+    timer_del(s->timer);
+}
+
+static void gpio_key_timer_expired(void *opaque)
+{
+    GPIOKEYState *s = (GPIOKEYState *)opaque;
+
+    qemu_set_irq(s->irq, 0);
+    timer_del(s->timer);
+}
+
+static void gpio_key_set_irq(void *opaque, int irq, int level)
+{
+    GPIOKEYState *s = (GPIOKEYState *)opaque;
+
+    qemu_set_irq(s->irq, 1);
+    timer_mod(s->timer,
+              qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + GPIO_KEY_LATENCY);
+}
+
+static void gpio_key_realize(DeviceState *dev, Error **errp)
+{
+    GPIOKEYState *s = GPIOKEY(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+    qdev_init_gpio_in(dev, gpio_key_set_irq, 1);
+    s->timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, gpio_key_timer_expired, s);
+}
+
+static void gpio_key_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = gpio_key_realize;
+    dc->vmsd = &vmstate_gpio_key;
+    dc->reset = &gpio_key_reset;
+}
+
+static const TypeInfo gpio_key_info = {
+    .name          = TYPE_GPIOKEY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(GPIOKEYState),
+    .class_init    = gpio_key_class_init,
+};
+
+static void gpio_key_register_types(void)
+{
+    type_register_static(&gpio_key_info);
+}
+
+type_init(gpio_key_register_types)
-- 
2.0.4



Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id gn8sm2676578ejc.23.2022.01.10.09.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:51:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6044A1FFB8;
	Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  1/6] hw/arm: arm initial boilerplate for RP2040 SoC
Date: Mon, 10 Jan 2022 17:50:59 +0000
Message-Id: <20220110175104.2908956-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iQc0WfN5c07I

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/devices/arm-softmmu/default.mak |  1 +
 include/hw/arm/rp2040.h                 | 32 ++++++++++
 hw/arm/rp2040.c                         | 79 +++++++++++++++++++++++++
 hw/arm/Kconfig                          |  3 +
 hw/arm/meson.build                      |  1 +
 5 files changed, 116 insertions(+)
 create mode 100644 include/hw/arm/rp2040.h
 create mode 100644 hw/arm/rp2040.c

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 6985a25377..dce1c39aad 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -32,6 +32,7 @@ CONFIG_NETDUINO2=y
 CONFIG_NETDUINOPLUS2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
+CONFIG_RP2040=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
diff --git a/include/hw/arm/rp2040.h b/include/hw/arm/rp2040.h
new file mode 100644
index 0000000000..6bf4a4e57e
--- /dev/null
+++ b/include/hw/arm/rp2040.h
@@ -0,0 +1,32 @@
+/*
+ * RP2040 SoC Emulation
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _RP2040_H_
+#define _RP2040_H_
+
+#include "target/arm/cpu.h"
+#include "hw/arm/armv7m.h"
+#include "qom/object.h"
+
+#define TYPE_RP2040 "rp2040"
+OBJECT_DECLARE_TYPE(RP2040State, RP2040Class, RP2040)
+
+#define RP2040_NCPUS 2
+
+struct RP2040State {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    ARMv7MState armv7m[RP2040_NCPUS];
+
+    MemoryRegion container;
+};
+
+
+#endif /* _RP2040_H_ */
diff --git a/hw/arm/rp2040.c b/hw/arm/rp2040.c
new file mode 100644
index 0000000000..2feedc0da8
--- /dev/null
+++ b/hw/arm/rp2040.c
@@ -0,0 +1,79 @@
+/*
+ * RP2040 SoC Emulation
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/arm/armv7m.h"
+#include "hw/arm/rp2040.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+
+typedef struct RP2040Class {
+    /*< private >*/
+    DeviceClass parent_class;
+    /*< public >*/
+    const char *name;
+    const char *cpu_type;
+} RP2040Class;
+
+#define RP2040_CLASS(klass) \
+    OBJECT_CLASS_CHECK(RP2040Class, (klass), TYPE_RP2040)
+#define RP2040_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(RP2040Class, (obj), TYPE_RP2040)
+
+static void rp2040_init(Object *obj)
+{
+    RP2040State *s = RP2040(obj);
+    int n;
+
+    for (n = 0; n < RP2040_NCPUS; n++) {
+        g_autofree char *name = g_strdup_printf("cpu[%d]", n);
+        object_initialize_child(obj, name, &s->armv7m[n], TYPE_ARMV7M);
+        qdev_prop_set_string(DEVICE(&s->armv7m[n]), "cpu-type",
+                             ARM_CPU_TYPE_NAME("cortex-m0"));
+    }
+}
+
+static void rp2040_realize(DeviceState *dev, Error **errp)
+{
+    RP2040State *s = RP2040(dev);
+    Object *obj = OBJECT(dev);
+    int n;
+
+    for (n = 0; n < RP2040_NCPUS; n++) {
+        Object *cpuobj = OBJECT(&s->armv7m[n]);
+        if (!sysbus_realize(SYS_BUS_DEVICE(cpuobj), errp)) {
+            return;
+        }
+    }
+}
+
+static void rp2040_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    RP2040Class *bc = RP2040_CLASS(oc);
+
+    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m0");
+    dc->realize = rp2040_realize;
+    /* any props? */
+};
+
+static const TypeInfo rp2040_types[] = {
+    {
+        .name           = TYPE_RP2040,
+        /* .parent         = TYPE_SYS_BUS_DEVICE, */
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(RP2040State),
+        .instance_init  = rp2040_init,
+        .class_size     = sizeof(RP2040Class),
+        .class_init     = rp2040_class_init,
+    }
+};
+
+DEFINE_TYPES(rp2040_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e652590943..1c5150c180 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -203,6 +203,9 @@ config REALVIEW
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
 
+config RP2040
+    bool
+
 config SBSA_REF
     bool
     imply PCI_DEVICES
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..9f1b040c57 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -40,6 +40,7 @@ arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_RP2040', if_true: files('rp2040.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
-- 
2.30.2

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a1sm3828963edu.17.2022.01.10.09.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:51:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7DE8B1FFBA;
	Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  2/6] hw/arm: add boilerplate for machines based on the RP2040
Date: Mon, 10 Jan 2022 17:51:00 +0000
Message-Id: <20220110175104.2908956-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B6gVDiHOcCpj

Currently we are only targeting the official RaspberryPi Pico although
I suspect most RP2040 based boards will look broadly the same.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/devices/arm-softmmu/default.mak |  1 +
 hw/arm/raspi_pico.c                     | 77 +++++++++++++++++++++++++
 hw/arm/Kconfig                          |  3 +
 hw/arm/meson.build                      |  1 +
 4 files changed, 82 insertions(+)
 create mode 100644 hw/arm/raspi_pico.c

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index dce1c39aad..7322213127 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -32,6 +32,7 @@ CONFIG_NETDUINO2=y
 CONFIG_NETDUINOPLUS2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
+CONFIG_RASPI_PICO=y
 CONFIG_RP2040=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
diff --git a/hw/arm/raspi_pico.c b/hw/arm/raspi_pico.c
new file mode 100644
index 0000000000..9826f4d608
--- /dev/null
+++ b/hw/arm/raspi_pico.c
@@ -0,0 +1,77 @@
+/*
+ * Raspberry Pi Pico emulation
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "hw/arm/rp2040.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/arm/boot.h"
+#include "qom/object.h"
+
+struct PiPicoMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+    /*< public >*/
+    RP2040State soc;
+};
+typedef struct PiPicoMachineState PiPicoMachineState;
+
+struct PiPicoMachineClass {
+    /*< private >*/
+    MachineClass parent_obj;
+    /*< public >*/
+};
+
+typedef struct PiPicoMachineClass PiPicoMachineClass;
+
+#define TYPE_PIPICO_MACHINE       MACHINE_TYPE_NAME("raspi-pico")
+DECLARE_OBJ_CHECKERS(PiPicoMachineState, PiPicoMachineClass,
+                     PIPICO_MACHINE, TYPE_PIPICO_MACHINE)
+
+
+static void pipico_machine_init(MachineState *machine)
+{
+    PiPicoMachineState *s = PIPICO_MACHINE(machine);
+
+    /* Setup the SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RP2040);
+    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
+}
+
+static void pipico_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = g_strdup_printf("Raspberry Pi Pico");
+    mc->init = pipico_machine_init;
+    mc->block_default_type = IF_PFLASH;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_sdcard = 1;
+    mc->min_cpus = 2;
+    mc->default_cpus = 2;
+    mc->max_cpus = 2;
+};
+
+
+static const TypeInfo pipico_machine_types[] = {
+    {
+        .name           = TYPE_PIPICO_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(PiPicoMachineState),
+        .class_size     = sizeof(PiPicoMachineClass),
+        .class_init     = pipico_machine_class_init,
+    }
+};
+
+DEFINE_TYPES(pipico_machine_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1c5150c180..288a03f428 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -336,6 +336,9 @@ config RASPI
     select SDHCI
     select USB_DWC2
 
+config RASPI_PICO
+    bool
+
 config STM32F100_SOC
     bool
     select ARM_V7M
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 9f1b040c57..4913cd1a50 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -41,6 +41,7 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubi
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_RP2040', if_true: files('rp2040.c'))
+arm_ss.add(when: 'CONFIG_RASPI_PICO', if_true: files('raspi_pico.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
-- 
2.30.2

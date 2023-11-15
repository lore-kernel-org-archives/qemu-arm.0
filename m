Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1924521ejb;
        Thu, 7 Dec 2023 13:57:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZh6naqFFatoL0MCmzeW1dGfQGzD+POYmAmsBhxQ8LahH+gyVu1sfSMO3qCb5nSFlU6/8A
X-Received: by 2002:a05:620a:158e:b0:77f:3f7d:b4a9 with SMTP id d14-20020a05620a158e00b0077f3f7db4a9mr1476637qkk.61.1701986254102;
        Thu, 07 Dec 2023 13:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701986254; cv=none;
        d=google.com; s=arc-20160816;
        b=WdfcC2S0TAUaT+bzzNMQP4FXRjQx78B7Aj7TE5i/5wpL1nicPx5LtPTxTg7aZtgOzx
         eThpGY6o/dppzhEvCF4+Wwrl57D1rOB00+PojWItAHU0cfOK32Uc72BZSMU349rXnEqO
         875VMOUVIK94IG1i/z9kZY4Za6TA1+MlsA0+u+y8ySAYSK3I0bgntQ7NpVqGx5rFxTzO
         nk5hSCKqG5y0dhY1r5HV/kmm/EeOloit5jbdH8F2l8fl+qA9N9GRRfOnbcUMoUSVGJ2k
         k2lBjmk3qf7NsTPjRXY4PcIb944GMWZxcrn7HSOtEBcBLc/3OAJ5ZOE7JqMkU/JjLYiS
         P19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:in-reply-to:reply-to:message-id
         :mime-version:subject:date:from;
        bh=6lsV6zsySbXxPisDL+d+nm2RrcsehEOjYDqIHVjAl0Y=;
        fh=khUezUY/JNW/BZIO0F66rH03qTDpfe26zpWBFwOyzg8=;
        b=UNrJWTNCj4qEw83wB2AsrMOIEkVCUI09SH9idFks9clmRCZf70VD0Xn8dx9EZG9DWk
         XuzjyRc0ntuT98bZQid43x+BK4RCsb4tUe293HxvYfKY4e2mvLcOKdPbSRCUqBICesei
         CWwjPIlQSKOq3OoCikwoIaNyGj7qhlHUu7g6m5lPFB/EcT/e/e+n5J+MdeqpQxIfYK4H
         Zf1ThxLd1dTR4IPxVTGdLqodcTDFiTW1JmNn7GnR6hPkv/tkWqpfF5Ej9SDezcMcTG3o
         RrUg8XEahiqD316dzxQ9SE9JGUunCB9xIsjqggWOzQG60JVKteX2xKLwr6sumkR5dcNO
         +Z+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of outgoing@sr.ht designates 173.195.146.151 as permitted sender) smtp.mailfrom=outgoing@sr.ht;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <outgoing@sr.ht>
Received: from mail-b.sr.ht (mail-b.sr.ht. [173.195.146.151])
        by mx.google.com with ESMTPS id c26-20020a05620a269a00b007788d758a18si676303qkp.511.2023.12.07.13.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:57:34 -0800 (PST)
Received-SPF: pass (google.com: domain of outgoing@sr.ht designates 173.195.146.151 as permitted sender) client-ip=173.195.146.151;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of outgoing@sr.ht designates 173.195.146.151 as permitted sender) smtp.mailfrom=outgoing@sr.ht;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
	by mail-b.sr.ht (Postfix) with ESMTPSA id 7E17E11EFF3;
	Thu,  7 Dec 2023 21:57:33 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Wed, 15 Nov 2023 09:04:50 +0100
Subject:
 [PATCH qemu v2 2/2] hw/arm: Add minimal support for the B-L475E-IOT01A board
MIME-Version: 1.0
Message-ID: <170198625302.23093.6056065304261752852-2@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~inesvarhol <inesvarhol@proton.me>
In-Reply-To: <170198625302.23093.6056065304261752852-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, alex.bennee@linaro.org,
 ines.varhol@telecom-paris.fr, arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MgC9M6ST9Br/

From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

This commit adds a new B-L475E-IOT01A board using the STM32L475VG SoC.
The implementation is derived from the Netduino Plus 2 machine.
There are no peripherals implemented yet, only memory regions.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 MAINTAINERS                             |  7 +++
 configs/devices/arm-softmmu/default.mak |  1 +
 hw/arm/Kconfig                          |  6 ++
 hw/arm/b-l475e-iot01a.c                 | 79 +++++++++++++++++++++++++
 hw/arm/meson.build                      |  1 +
 5 files changed, 94 insertions(+)
 create mode 100644 hw/arm/b-l475e-iot01a.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 32458d41dd..6ae9ca3ef4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1130,6 +1130,13 @@ S: Maintained
 F: hw/arm/stm32l4x5_soc.c
 F: include/hw/arm/stm32l4x5_soc.h
=20
+B-L475E-IOT01A IoT Node
+M: Arnaud Minier <arnaud.minier@telecom-paris.fr>
+M: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/b-l475e-iot01a.c
+
 SmartFusion2
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-so=
ftmmu/default.mak
index 980c48a7d9..023faa2f75 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -19,6 +19,7 @@ CONFIG_ARM_VIRT=3Dy
 # CONFIG_NSERIES=3Dn
 # CONFIG_STELLARIS=3Dn
 # CONFIG_STM32VLDISCOVERY=3Dn
+# CONFIG_B_L475E_IOT01A=3Dn
 # CONFIG_REALVIEW=3Dn
 # CONFIG_VERSATILE=3Dn
 # CONFIG_VEXPRESS=3Dn
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d2b94d9a47..7520dc5cc0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -448,6 +448,12 @@ config STM32F405_SOC
     select STM32F4XX_SYSCFG
     select STM32F4XX_EXTI
=20
+config B_L475E_IOT01A
+    bool
+    default y
+    depends on TCG && ARM
+    select STM32L4X5_SOC
+
 config STM32L4X5_SOC
     bool
     select ARM_V7M
diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
new file mode 100644
index 0000000000..72fdb6f0f8
--- /dev/null
+++ b/hw/arm/b-l475e-iot01a.c
@@ -0,0 +1,79 @@
+/*
+ * B-L475E-IOT01A Discovery Kit machine
+ * (B-L475E-IOT01A IoT Node)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2023 Ines Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a c=
opy
+ * of this software and associated documentation files (the "Software"), to =
deal
+ * in the Software without restriction, including without limitation the rig=
hts
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING F=
ROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
+ * Heavily inspired by the netduinoplus2 by Alistair Francis.
+ * The reference used is the STMicroElectronics UM2153 User manual
+ * Discovery kit for IoT node, multi-channel communication with STM32L4.
+ * https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html#documentation
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
+#include "qemu/error-report.h"
+#include "hw/arm/stm32l4x5_soc.h"
+#include "hw/arm/boot.h"
+
+/* Main SYSCLK frequency in Hz (80MHz) */
+#define SYSCLK_FRQ 80000000ULL
+
+static void b_l475e_iot01a_init(MachineState *machine)
+{
+    const Stm32l4x5SocClass *sc;
+    DeviceState *dev;
+    Clock *sysclk;
+
+    /* This clock doesn't need migration because it is fixed-frequency */
+    sysclk =3D clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
+    dev =3D qdev_new(TYPE_STM32L4X5XG_SOC);
+    sc =3D STM32L4X5_SOC_GET_CLASS(dev);
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       0, sc->flash_size);
+}
+
+static void b_l475e_iot01a_machine_init(MachineClass *mc)
+{
+    static const char *machine_valid_cpu_types[] =3D {
+        ARM_CPU_TYPE_NAME("cortex-m4"),
+        NULL};
+    mc->desc =3D "B-L475E-IOT01A Discovery Kit (Cortex-M4)";
+    mc->init =3D b_l475e_iot01a_init;
+    mc->valid_cpu_types =3D machine_valid_cpu_types;
+
+    /* SRAM pre-allocated as part of the SoC instantiation */
+    mc->default_ram_size =3D 0;
+}
+
+DEFINE_MACHINE("b-l475e-iot01a", b_l475e_iot01a_machine_init)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 9766da10c4..bb92b27db3 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -42,6 +42,7 @@ arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c'=
, 'raspi.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
+arm_ss.add(when: 'CONFIG_B_L475E_IOT01A', if_true: files('b-l475e-iot01a.c'))
 arm_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_soc.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', '=
xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx=
-versal-virt.c'))
--=20
2.38.5

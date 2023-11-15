Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2399768ejo;
        Thu, 14 Dec 2023 07:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeftPhmlPXy1sZ25233euCf1K5VQiL1BbrVjfPprqSRH6baBfwDPB99ilt5P0wrSffcjmB
X-Received: by 2002:a05:6214:4d:b0:67a:d69f:a84e with SMTP id c13-20020a056214004d00b0067ad69fa84emr11014997qvr.109.1702567457701;
        Thu, 14 Dec 2023 07:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702567457; cv=none;
        d=google.com; s=arc-20160816;
        b=gR6SQ5BMc4FWAye6t/nSExEcw9rmHdTCY/Y7tbbpYHEI0QebAjMA5KK8rXDBoTaIv2
         PAJgDhJyqN7F038HX/VkTGW2VpWNRsHyzzT/Bif+Ef0sml6eaPfQvprBaRwLW09vqUcD
         ATmGwbg8TLrGV/4bz/DiOwKPSBl2nOBi0lX1bh3hut2CE03Z16PLIm3GWcn5QvU9ZFMd
         rqxUWfWMjJbzlYvBOVd+qW0acfuPGcSCEPQXm5sfY+fkwX3pBLsdVH+OYKVzwh15wxJV
         DW32zFXC4n5ZSPYDFMfIU/lF1TivyZM2i9PzPdCXUozybp+m1j7t7qGBI6IoiGtelTNL
         BWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:in-reply-to:message-id:mime-version
         :subject:date:from;
        bh=H5Fx7rKGndgLJE10R6USGxbY7fQLaN3gKTRQ4n6kKyc=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=EwPptI8u5JFj/YEimpJebXl48onaxgIEGUID/ettISbj3GGrXkJBsEKjAysg1Kuzzq
         xWGJ7lWm9bRfZDZx/pzIlHN4kOcINY2uZoG3l08FHd12pI+y0e3cVptYYzu0ND3QXWwa
         z7Lf9iofVjObNwGdH5MZIlUa/jmpIFUol7jzpavNRdr72INCY/uit9saWwKp36ReJf60
         4KSKkE2kVSmnyWjpRjmRbOV9nP+qBoNIT2ecPEsjMMFIHTwzDXmlXpvWvj1IAoioEtPc
         4k6BmfocNqWg4EPBs8uXC5lhFzjsttFNNWNWydIv+8x0mq+HKDUyaT9cGSnxiUXF+BNu
         8Scw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a056214016600b0067eeb5d5cdbsi5786570qvs.605.2023.12.14.07.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 07:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDnYf-0003C6-MM; Thu, 14 Dec 2023 10:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rDnYW-0003Ak-S8; Thu, 14 Dec 2023 10:23:20 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rDnYU-0000xk-GZ; Thu, 14 Dec 2023 10:23:20 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 27A2211EEFB;
 Thu, 14 Dec 2023 15:23:16 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Wed, 15 Nov 2023 09:04:50 +0100
Subject: [PATCH qemu v3 2/2] hw/arm: Add minimal support for the
 B-L475E-IOT01A board
MIME-Version: 1.0
Message-ID: <170256739558.25729.14053113716470464567-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <170256739558.25729.14053113716470464567-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, ines.varhol@telecom-paris.fr,
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ybIcNdcE4umU

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
 hw/arm/Kconfig                          |  6 +++
 hw/arm/b-l475e-iot01a.c                 | 70 +++++++++++++++++++++++++
 hw/arm/meson.build                      |  1 +
 5 files changed, 85 insertions(+)
 create mode 100644 hw/arm/b-l475e-iot01a.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e5b28aee28..3f3831c92a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1131,6 +1131,13 @@ S: Maintained
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
index 0000000000..c3790e3dc8
--- /dev/null
+++ b/hw/arm/b-l475e-iot01a.c
@@ -0,0 +1,70 @@
+/*
+ * B-L475E-IOT01A Discovery Kit machine
+ * (B-L475E-IOT01A IoT Node)
+ *
+ * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * This work is heavily inspired by the netduinoplus2 by Alistair Francis.
+ * Original code is licensed under the MIT License:
+ *
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
+ */
+
+/*
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

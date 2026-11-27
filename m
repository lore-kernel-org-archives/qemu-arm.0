Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB982606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 04:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacecubics-com.20260707.gappssmtp.com header.i=@spacecubics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TpjfwvoW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWnEc-0002LP-8M; Thu, 26 Nov 2026 23:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTX-0001pg-Bi
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:11 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTU-0001HH-RG
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:11 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-cdb2e0062bbso2960589a12.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 18:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spacecubics-com.20260707.gappssmtp.com; s=20260707; t=1795745647;
 x=1796350447; darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/SGutH2RseqW5+M/W6vxJyraVmCuqdYfHzw8URkfsTo=;
 b=TpjfwvoWeH2O/YN6FHsI0J+q4lezW/LTN5Zg2EwuG3lskjpu652Zgp/wIqanza15LX
 NcE/A/hJxnOH1DMksHS0liOM/JTkyv0iRUs/lURcNNbV7bn2Cv25tV0PSpgxtG8CAWrX
 h6kRfupexckuGjSXjmxulclvQEzNp6BTY+M1uKW2ZxQfSTPoiGG/RZi5OeEzFg7MnLUL
 UaUAZIgW7bj37c6eWi2wrWAXvwkEFjemnc2+tmjswm+3N/jGJV34YYZRcG0SCJJhK6ZS
 IwgzFBpZU8KksJKBnxZQOp+dVeJymTya7ZrVM4m+B9oGXAcWNWO94Z+d0q15LnPC4CLJ
 p5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795745647; x=1796350447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/SGutH2RseqW5+M/W6vxJyraVmCuqdYfHzw8URkfsTo=;
 b=n9Lflg7ewijMX6I1N584zot4IFYpJFkEOJNq+vUztiVulnZt/QhWyQ7+K02GIYiIpK
 NtYn0BW82FtlfnmeYBWi7GSKFHFxvCiw0TXAa4MdIqScaURvkibvO+QB6OovXF8SrV94
 mknZOe/sCd/2usc4YYImb23n+mZhtWaOrAjxdJPKQAPz1NAzSO+uT0OdIDyyHAPow0dy
 ntCS45ADQ+KFS+BpOBB5Gphc80PTOLxYzyLZ9l33nRA63aIM6mOp62qziSwAn/oq2g/6
 A+zF/7BCIXrz5Jvl3/ecqXA0m51onOYrx/F+tP46WrM+Z8GLl0e/QbDXF+h1ICcBY/sy
 QMuA==
X-Forwarded-Encrypted: i=1;
 AL+hErGRXH8MrMgVMRG/C3WqCBM22HSp8WOmzxxWxfalAMLOFW2yPHpulU95f56pj42HLKJgMTrerTB6yQ==@nongnu.org
X-Gm-Message-State: APuU4Z/33HnRYYWHWw2SZbB51sEI+aaVotVbnXe3WZqVqE3jromy+KA2
 VyXN4tzN5LskCkcTaRU/QTJ5499QGduSY1wRFCKjgdeRUClv4lUIUjgScX9w50YdIc6YQV50/7D
 +RCGSY4Q=
X-Gm-Gg: AZFdTZerQZaONdcZnpgsDTDvYe/bYf9LY4saVtpIOjcrCNTACqhyTrMdFwYgM9ST0Sa
 tFhk5X1sYpo2gfloHBk8eqGDxgA4e7pmb84MNDIvFCnLu3nMZLb5T7wxddGwmUkIO7eXV1JF2Ws
 zFdxnw/9uytGQMhJ6a1LgFxdVEOsdKsX4laNhBVuKS6PLDv+qYFUFCE6baICsqi085QtD+3h4mP
 iei22w6yUJYV5ZNdl+Nxh4EEIO9fxEdZsdGXnrl6BCqczAbJs2ipA4+eVuf5UGy3QmQuYRwrCcd
 Exqo8EBHPn/BIHHaC5pkhOGyes8UOwl3jryAyfRfKSKyMKHBP/bndaEoTsevReg+2VrsQbBGJbM
 LtEw/NkbUmXqZlfvhvBwW5BR9z4Wf/pXBdMI3OKDlJrK34Bbl8WPAgVtS9iPlgknQW40WFdqoT5
 emXkqQ+fxAFvfRV3fZeTFHI6xsJNIDyMyzlOQLm7R8vd3+aV/I7AkFZlnWyXzrvLn6xYmLOirOq
 fFuvXYTK7icmRNUeNQ3BH6l9VCTSLwbhUJ3JHswADpkLGuIsG1Bbl1eB+LjeSk3zET59Xco/Bwb
 c/Ea0Bpj5xjSOxxQu55nfKBY+iNHAWrJbNFFjVqn394caoMxsURc1UPbYhvs+3ulQA==
X-Received: by 2002:a17:90b:2516:b0:3b4:c9f8:abce with SMTP id
 98e67ed59e1d1-3b4c9f8abe0mr8342561a91.35.1795745647215; 
 Thu, 26 Nov 2026 18:14:07 -0800 (PST)
Received: from [127.0.0.2] (182-166-200-88f1.hyg1.eonet.ne.jp.
 [182.166.200.88]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b53479b149sm1368372a91.6.2026.11.26.18.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 18:14:06 -0800 (PST)
From: Maximilian Zimmermann <maxz@spacecubics.com>
Date: Fri, 27 Nov 2026 11:13:34 +0900
Subject: [PATCH 1/3] hw/arm: Add Space Cubics SC-OBC Module A1 board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-add-scobc-a1-board-v1-1-b572280dcde1@spacecubics.com>
References: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
In-Reply-To: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Maximilian Zimmermann <maxz@spacecubics.com>
X-Mailer: b4 0.15.2
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=maxz@spacecubics.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Nov 2026 23:06:53 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT,WEIRD_QUOTING autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SC-OBC Module A1 is an on-board computer module for CubeSats. Its
processing system is implemented in an Artix-7 FPGA, which hosts a
Cortex-M3 with 4 MiB of main memory (HRMEM) and a set of peripherals.
Modelling it allows firmware for the module to be developed and tested
without hardware.

Add the module as the scobc-a1 machine. It models the default FPGA image
provided by Space Cubics, which defines the system peripherals as well
as the user customizable mission bus between 0x5000_0000 and
0x6000_0000. The HRMEM is mirrored at 0x6000_0000. Apart from the
console UART, all devices are currently left unimplemented.

Signed-off-by: Maximilian Zimmermann <maxz@spacecubics.com>
---
 MAINTAINERS                  |   7 +++
 docs/system/arm/scobc-a1.rst |  49 ++++++++++++++++
 docs/system/target-arm.rst   |   1 +
 hw/arm/Kconfig               |   8 +++
 hw/arm/meson.build           |   1 +
 hw/arm/scobc_a1.c            | 137 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 203 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40bf63651c..bc02f6e1be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1098,6 +1098,13 @@ F: hw/gpio/zaurus.c
 F: docs/system/arm/collie.rst
 F: tests/functional/arm/test_collie.py
 
+Space Cubics SC-OBC Module A1
+M: Maximilian Zimmermann <maxz@spacecubics.com>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/scobc_a1.c
+F: docs/system/arm/scobc-a1.rst
+
 Stellaris
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
diff --git a/docs/system/arm/scobc-a1.rst b/docs/system/arm/scobc-a1.rst
new file mode 100644
index 0000000000..0f4f3a757a
--- /dev/null
+++ b/docs/system/arm/scobc-a1.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Space Cubics SC-OBC Module A1 (``scobc-a1``)
+============================================
+
+The Space Cubics OBC Module A1 (SC-OBC Module A1) is an on-board computer
+module for spacecraft, particularly 3U CubeSats. It is based on a Xilinx
+Artix-7 FPGA, which implements an Arm Cortex-M3 as the main CPU.
+
+The module must be mounted on a base I/O board. The ``scobc-a1`` machine
+models only the module running the default FPGA image provided by Space
+Cubics. The base board and its devices are not modelled.
+
+The peripherals between ``0x5000_0000`` and ``0x6000_0000`` form the mission
+bus, which users can customize by building their own FPGA image.
+
+Supported devices
+"""""""""""""""""
+
+- Cortex-M3 CPU core
+- 4 MiB HRMEM main memory
+- HRMEM mirror (``0x6000_0000``)
+- Xilinx UART Lite console UART (``0x4f01_0000``)
+
+Missing devices
+"""""""""""""""
+
+The following devices are present in the memory map but not implemented:
+
+- QSPI controllers for configuration flash, data flash and FRAM
+- CAN controller
+- HRMEM ECC and scrubbing registers
+- System registers
+- I2C controllers
+- System monitor (FPGA watchdog, SEM controller, XADC and board health
+  monitor)
+- General purpose timer
+- Mission bus UARTs, I2C, SPI and GPIO controllers
+
+Boot options
+""""""""""""
+
+The machine only supports direct boot into HRMEM. A firmware image
+can be loaded with the ``-kernel`` option, for example a Zephyr application
+built for the ``scobc_a1`` board:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M scobc-a1 -nographic -kernel zephyr.elf
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 260cd7e4d6..71f9e1a3cb 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -98,6 +98,7 @@ Board-specific documentation
    arm/raspi
    arm/collie
    arm/sx1
+   arm/scobc-a1
    arm/stellaris
    arm/stm32
    arm/virt
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e9f796f718..0bef724a47 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -183,6 +183,14 @@ config SABRELITE
     select FSL_IMX6
     select SSI_M25P80
 
+config SCOBC_A1
+    bool
+    default y
+    depends on TCG && ARM
+    select ARM_V7M
+    select UNIMP
+    select XILINX # UART Lite
+
 config STELLARIS
     bool
     default y
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index f3c1b0e00f..2401c7811d 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -16,6 +16,7 @@ arm_common_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 arm_common_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 arm_common_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
 arm_common_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
+arm_common_ss.add(when: 'CONFIG_SCOBC_A1', if_true: files('scobc_a1.c'))
 
 arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_common_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
diff --git a/hw/arm/scobc_a1.c b/hw/arm/scobc_a1.c
new file mode 100644
index 0000000000..877bc2e41f
--- /dev/null
+++ b/hw/arm/scobc_a1.c
@@ -0,0 +1,137 @@
+/*
+ * Space Cubics SC-OBC Module A1 board
+ *
+ * Copyright (c) 2026 Space Cubics Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/cutils.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "system/address-spaces.h"
+#include "system/system.h"
+#include "hw/core/boards.h"
+#include "hw/core/qdev-clock.h"
+#include "hw/core/qdev-properties.h"
+#include "hw/core/sysbus.h"
+#include "hw/arm/armv7m.h"
+#include "hw/arm/boot.h"
+#include "hw/char/xilinx_uartlite.h"
+#include "hw/misc/unimp.h"
+
+struct SCOBCA1MachineState {
+    MachineState parent_obj;
+
+    ARMv7MState armv7m;
+    Clock *cpuclk;
+    MemoryRegion hrmem_mirror;
+};
+
+#define TYPE_SCOBC_A1_MACHINE MACHINE_TYPE_NAME("scobc-a1")
+OBJECT_DECLARE_SIMPLE_TYPE(SCOBCA1MachineState, SCOBC_A1_MACHINE)
+
+/* CPU clock frequency in Hz */
+#define CPUCLK_FRQ 48000000
+
+#define SCOBC_A1_NUM_IRQ 32
+
+#define SCOBC_A1_HRMEM_BASE   0x00000000
+#define SCOBC_A1_HRMEM_MIRROR 0x60000000
+#define SCOBC_A1_UART_BASE    0x4f010000
+#define SCOBC_A1_UART_IRQ     0
+
+static void scobc_a1_init(MachineState *machine)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    SCOBCA1MachineState *s = SCOBC_A1_MACHINE(machine);
+    DeviceState *uart;
+
+    /* Check the amount of memory is compatible with the board */
+    if (machine->ram_size != mc->default_ram_size) {
+        g_autofree char *sz = size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        exit(EXIT_FAILURE);
+    }
+
+    /* Only direct boot into HRMEM is currently supported */
+    memory_region_add_subregion(get_system_memory(), SCOBC_A1_HRMEM_BASE,
+                                machine->ram);
+
+    /* HRMEM is mirrored at 0x6000_0000 */
+    memory_region_init_alias(&s->hrmem_mirror, OBJECT(s),
+                             "scobc-a1.hrmem-mirror", machine->ram,
+                             0, mc->default_ram_size);
+    memory_region_add_subregion(get_system_memory(), SCOBC_A1_HRMEM_MIRROR,
+                                &s->hrmem_mirror);
+
+    s->cpuclk = clock_new(OBJECT(machine), "cpuclk");
+    clock_set_hz(s->cpuclk, CPUCLK_FRQ);
+
+    object_initialize_child(OBJECT(s), "armv7m", &s->armv7m, TYPE_ARMV7M);
+    qdev_prop_set_string(DEVICE(&s->armv7m), "cpu-type", machine->cpu_type);
+    qdev_prop_set_uint32(DEVICE(&s->armv7m), "num-irq", SCOBC_A1_NUM_IRQ);
+    qdev_prop_set_uint8(DEVICE(&s->armv7m), "num-prio-bits", 3);
+    qdev_connect_clock_in(DEVICE(&s->armv7m), "cpuclk", s->cpuclk);
+    object_property_set_link(OBJECT(&s->armv7m), "memory",
+                             OBJECT(get_system_memory()), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_fatal);
+
+    uart = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_enum(uart, "endianness", ENDIAN_MODE_LITTLE);
+    qdev_prop_set_chr(uart, "chardev", serial_hd(0));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(uart), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(uart), 0, SCOBC_A1_UART_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(uart), 0,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m), SCOBC_A1_UART_IRQ));
+
+    /* System peripherals */
+    create_unimplemented_device("scobc-a1.qspi-config", 0x40000000, 0x10000);
+    create_unimplemented_device("scobc-a1.qspi-data", 0x40100000, 0x10000);
+    create_unimplemented_device("scobc-a1.qspi-fram", 0x40200000, 0x10000);
+    create_unimplemented_device("scobc-a1.can", 0x40400000, 0x10000);
+    create_unimplemented_device("scobc-a1.hrmem-regs", 0x40500000, 0x10000);
+    create_unimplemented_device("scobc-a1.sysreg", 0x4f000000, 0x10000);
+    create_unimplemented_device("scobc-a1.i2c0", 0x4f030000, 0x10000);
+    create_unimplemented_device("scobc-a1.sysmon", 0x4f040000, 0x10000);
+    create_unimplemented_device("scobc-a1.timer", 0x4f050000, 0x10000);
+
+    /* Mission AXI bus peripherals (as defined in standard FPGA image) */
+    create_unimplemented_device("scobc-a1.uartlite1", 0x50000000, 0x10000);
+    create_unimplemented_device("scobc-a1.uartlite2", 0x50010000, 0x10000);
+    create_unimplemented_device("scobc-a1.uartlite3", 0x50020000, 0x10000);
+    create_unimplemented_device("scobc-a1.uartlite4", 0x50030000, 0x10000);
+    create_unimplemented_device("scobc-a1.uartlite5", 0x50040000, 0x10000);
+    create_unimplemented_device("scobc-a1.uartlite6", 0x50050000, 0x10000);
+    create_unimplemented_device("scobc-a1.i2c1", 0x50060000, 0x10000);
+    create_unimplemented_device("scobc-a1.i2c2", 0x50070000, 0x10000);
+    create_unimplemented_device("scobc-a1.qspi", 0x50080000, 0x10000);
+    create_unimplemented_device("scobc-a1.gpio", 0x50090000, 0x10000);
+
+    armv7m_load_kernel(s->armv7m.cpu, machine->kernel_filename,
+                       SCOBC_A1_HRMEM_BASE, machine->ram_size);
+}
+
+static void scobc_a1_machine_init(MachineClass *mc)
+{
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
+
+    mc->desc = "Space Cubics SC-OBC Module A1 (Cortex-M3)";
+    mc->init = scobc_a1_init;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = valid_cpu_types;
+    mc->max_cpus = 1;
+    mc->default_ram_size = 4 * MiB;
+    mc->default_ram_id = "scobc-a1.hrmem";
+    mc->no_parallel = true;
+    mc->no_floppy = true;
+    mc->no_cdrom = true;
+}
+
+DEFINE_MACHINE_EXTENDED("scobc-a1", MACHINE, SCOBCA1MachineState,
+                        scobc_a1_machine_init, false, false, NULL)

-- 
2.55.0



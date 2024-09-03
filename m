Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500325njf;
        Tue, 3 Sep 2024 09:09:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkVlH63J/nVa0UCiGpSfqLDtVXhPTYwQY9vm43/uNuMmVvcGDBhSS2smninJ/+HgH1coFFUArV5JOsWw==@linaro.org
X-Google-Smtp-Source: AGHT+IFnXE0HL1bGZhMUYb99Jg8je3sypInnbWuPTQckr3S7+1rmN7wAHN25HGtxNdn6n7/t4V46
X-Received: by 2002:a05:6830:3692:b0:709:3431:94c3 with SMTP id 46e09a7af769-710af7060e6mr1955092a34.23.1725379771572;
        Tue, 03 Sep 2024 09:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379771; cv=none;
        d=google.com; s=arc-20160816;
        b=AMqhbncwWkkMXkPxjqEjxHu7FV9d4h3Xhao/GHhm4VwQUXDnFJM3FgWTHMhZ4pP16v
         wQY1BgyakzPtdkIzGXAf0f/zxnFVELiMPUCAFXeNbDt4isnLSSDPlKk7nFqosXt+7Jig
         aipt7qdFKGY3ceBNdP48OwkBf/iwFBfRuQFawrkVbDVCPrzFlgjO3CIQn3FOxP40bWFk
         HnNBX6cdG/vFeaCy3FYgeIMUJhgwogsJ8qfTyGQ7Ww6YguMSQLAeF8C3W085PiS0IbiY
         9StWaRsfrE26M56T6yafLU5lfK2gzGox6ws/uk5Y5lR8uD3rusI24DuPF2KWCvGXRv7Z
         NAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2aydQID0IvRZpJDoAElwkwj3hjmSAGgIkWQyks+OEzI=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Dzk8xw7d/WfYyYnl8CBKNnm3QAEEyc0FOOswgOMW1wxKgrOpP2WmNWD4yiljOqN83h
         tZOkW0Xuta1Ay3Mx3KM7aaZR91kKiYf/WiMO7v986u3/81hFpu7Zx9yemV8qfqozPlJ8
         wMYPsofi6dA48NjLPUNufyAfajaQ+hphJe594hXxpiOTCEia73Zdx2h/82IEd6nm4imZ
         sGCfOmxLrPoYS8WPuMcGz9fK7MbKzzJ01dBwtFzWyypOr97eWYuaPO3WTAp58WKf5ch+
         W1jlxOBI1hd+mmWl7EUAXVvZv57/AaGUGRFpaheE19AA9JKwpvtO5k+8jdHZzlHMbwlQ
         BTiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgeQ14Z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-500965236a1si2438087e0c.171.2024.09.03.09.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgeQ14Z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW4q-0005vr-CE; Tue, 03 Sep 2024 12:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4n-0005en-E1
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4i-0002jR-Nm
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bb8c6e250so42190165e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379691; x=1725984491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2aydQID0IvRZpJDoAElwkwj3hjmSAGgIkWQyks+OEzI=;
 b=RgeQ14Z2YVXjL773O5Dz7NIQAs5i6Y4NyppUDMFqNcMYNuswIZU1B3ai4LfMywv7he
 RPGQERWNRG44rasFKxzETNPyPUPwYUne2BceEKvM3z/Rv2zSvYnEIwno0zyF58eMEytm
 cidubi1lIta8Hqo9wHSQflyxQ50bpvw1TbZzL4vGcr/p3YbnxlKjKAbqmm43EYVGZI9Z
 Gou0yM2Cg2XXRKC4Nik1/mbHU4WU4n3eeySIi806v7wllhAGlR2MUvgT+bfYoiMQjbcN
 FOT/LTX4IvvxtTQfQv3mxEyTyEcbVDo8DraqO/EA5Vp9VN7UtqYcCX8SfaPRrq271pW1
 9hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379691; x=1725984491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2aydQID0IvRZpJDoAElwkwj3hjmSAGgIkWQyks+OEzI=;
 b=qytTujL9snjOyMMcGIDGs4KEew+7Y0NIxbtdmahnHtzHMPnsOSvO+WbS8HuhedZiN6
 oN36kjDh0Qun25Qqq5Ik9CG7jeoBDf7MSlCpUUrxY+cpu1GtOZO2Lk5Mve+BNNFQgEcY
 X5/xzaOplkZ0rQK2WZdrXOCC0j6wbHjjCAFS0I42GWNBtzNfadgWB2hQ5e1XS7Yko2AY
 eegoYPHPbbBtn+CxDnVnF13xlpyFZoGAQXDAhadE2fZrqnIQV11A6IxrR4X8g9Lof8gz
 eg4cWp9MIHcF95swewM1cGOXfy/fGGV6a2WxxzC7yGXqtSNcw09Pmsz4BePzTZMT4ETP
 x1vg==
X-Gm-Message-State: AOJu0YwEaNnDpG6eTdIgUEsNw2FlZStaMCg3MODz0LRMaK4HNJxJ+7Ap
 QCtIJGEc03KMBMfKSI66aKOYRwVSUNkXnxmjnL90k4/Hu6kjvSOxxskAaidpw39xDDKdm7A2NqA
 d
X-Received: by 2002:a05:600c:1f86:b0:426:58cb:8ca3 with SMTP id
 5b1f17b1804b1-42c82f56a98mr59500095e9.21.1725379691203; 
 Tue, 03 Sep 2024 09:08:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 10/53] hw/arm: Remove 'mainstone' machine
Date: Tue,  3 Sep 2024 17:07:08 +0100
Message-Id: <20240903160751.4100218-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tD1yMxdLTyio

The 'mainstone' machine has been deprecated since 9.0, and
so we can remove it for the 9.2 release.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS                             |   2 -
 docs/system/arm/mainstone.rst           |  25 ----
 docs/system/target-arm.rst              |   1 -
 configs/devices/arm-softmmu/default.mak |   1 -
 hw/arm/mainstone.c                      | 175 ------------------------
 hw/arm/Kconfig                          |   8 --
 hw/arm/meson.build                      |   1 -
 7 files changed, 213 deletions(-)
 delete mode 100644 docs/system/arm/mainstone.rst
 delete mode 100644 hw/arm/mainstone.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 13685711f61..bfc0868aa64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -907,12 +907,10 @@ PXA2XX
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
-F: hw/arm/mainstone.c
 F: hw/arm/z2.c
 F: hw/*/pxa2xx*
 F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
-F: docs/system/arm/mainstone.rst
 
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/docs/system/arm/mainstone.rst b/docs/system/arm/mainstone.rst
deleted file mode 100644
index 05310f42c7f..00000000000
--- a/docs/system/arm/mainstone.rst
+++ /dev/null
@@ -1,25 +0,0 @@
-Intel Mainstone II board (``mainstone``)
-========================================
-
-The ``mainstone`` board emulates the Intel Mainstone II development
-board, which uses a PXA270 CPU.
-
-Emulated devices:
-
-- Flash memory
-- Keypad
-- MMC controller
-- 91C111 ethernet
-- PIC
-- Timer
-- DMA
-- GPIO
-- FIR
-- Serial
-- LCD controller
-- SSP
-- USB controller
-- RTC
-- PCMCIA
-- I2C
-- I2S
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index ddaf1675dcc..28af58135e4 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -91,7 +91,6 @@ undocumented; you can get a complete list by running
    arm/cubieboard
    arm/emcraft-sf2
    arm/musicpal
-   arm/mainstone
    arm/kzm
    arm/nseries
    arm/nrf
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 490ef4b3943..547100a06f3 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -27,7 +27,6 @@
 # CONFIG_VERSATILE=n
 # CONFIG_VEXPRESS=n
 # CONFIG_ZYNQ=n
-# CONFIG_MAINSTONE=n
 # CONFIG_Z2=n
 # CONFIG_NPCM7XX=n
 # CONFIG_COLLIE=n
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
deleted file mode 100644
index 3a6c22fddbc..00000000000
--- a/hw/arm/mainstone.c
+++ /dev/null
@@ -1,175 +0,0 @@
-/*
- * PXA270-based Intel Mainstone platforms.
- *
- * Copyright (c) 2007 by Armin Kuster <akuster@kama-aina.net> or
- *                                    <akuster@mvista.com>
- *
- * Code based on spitz platform by Andrzej Zaborowski <balrog@zabor.org>
- *
- * This code is licensed under the GNU GPL v2.
- *
- * Contributions after 2012-01-13 are licensed under the terms of the
- * GNU GPL, version 2 or (at your option) any later version.
- */
-#include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
-#include "hw/arm/pxa.h"
-#include "hw/arm/boot.h"
-#include "net/net.h"
-#include "hw/net/smc91c111.h"
-#include "hw/boards.h"
-#include "hw/block/flash.h"
-#include "hw/sysbus.h"
-#include "exec/address-spaces.h"
-
-/* Device addresses */
-#define MST_FPGA_PHYS	0x08000000
-#define MST_ETH_PHYS	0x10000300
-#define MST_FLASH_0		0x00000000
-#define MST_FLASH_1		0x04000000
-
-/* IRQ definitions */
-#define MMC_IRQ       0
-#define USIM_IRQ      1
-#define USBC_IRQ      2
-#define ETHERNET_IRQ  3
-#define AC97_IRQ      4
-#define PEN_IRQ       5
-#define MSINS_IRQ     6
-#define EXBRD_IRQ     7
-#define S0_CD_IRQ     9
-#define S0_STSCHG_IRQ 10
-#define S0_IRQ        11
-#define S1_CD_IRQ     13
-#define S1_STSCHG_IRQ 14
-#define S1_IRQ        15
-
-static const struct keymap map[0xE0] = {
-    [0 ... 0xDF] = { -1, -1 },
-    [0x1e] = {0,0}, /* a */
-    [0x30] = {0,1}, /* b */
-    [0x2e] = {0,2}, /* c */
-    [0x20] = {0,3}, /* d */
-    [0x12] = {0,4}, /* e */
-    [0x21] = {0,5}, /* f */
-    [0x22] = {1,0}, /* g */
-    [0x23] = {1,1}, /* h */
-    [0x17] = {1,2}, /* i */
-    [0x24] = {1,3}, /* j */
-    [0x25] = {1,4}, /* k */
-    [0x26] = {1,5}, /* l */
-    [0x32] = {2,0}, /* m */
-    [0x31] = {2,1}, /* n */
-    [0x18] = {2,2}, /* o */
-    [0x19] = {2,3}, /* p */
-    [0x10] = {2,4}, /* q */
-    [0x13] = {2,5}, /* r */
-    [0x1f] = {3,0}, /* s */
-    [0x14] = {3,1}, /* t */
-    [0x16] = {3,2}, /* u */
-    [0x2f] = {3,3}, /* v */
-    [0x11] = {3,4}, /* w */
-    [0x2d] = {3,5}, /* x */
-    [0x34] = {4,0}, /* . */
-    [0x15] = {4,2}, /* y */
-    [0x2c] = {4,3}, /* z */
-    [0x35] = {4,4}, /* / */
-    [0xc7] = {5,0}, /* Home */
-    [0x2a] = {5,1}, /* shift */
-    /*
-     * There are two matrix positions which map to space,
-     * but QEMU can only use one of them for the reverse
-     * mapping, so simply use the second one.
-     */
-    /* [0x39] = {5,2}, space */
-    [0x39] = {5,3}, /* space */
-    /*
-     * Matrix position {5,4} and other keys are missing here.
-     * TODO: Compare with Linux code and test real hardware.
-     */
-    [0x1c] = {5,4}, /* enter */
-    [0x0e] = {5,5}, /* backspace */
-    [0xc8] = {6,0}, /* up */
-    [0xd0] = {6,1}, /* down */
-    [0xcb] = {6,2}, /* left */
-    [0xcd] = {6,3}, /* right */
-};
-
-enum mainstone_model_e { mainstone };
-
-#define MAINSTONE_RAM_SIZE      (64 * MiB)
-#define MAINSTONE_ROM_SIZE      (8 * MiB)
-#define MAINSTONE_FLASH_SIZE    (32 * MiB)
-
-static struct arm_boot_info mainstone_binfo = {
-    .loader_start = PXA2XX_SDRAM_BASE,
-    .ram_size = MAINSTONE_RAM_SIZE,
-};
-
-#define FLASH_SECTOR_SIZE   (256 * KiB)
-
-static void mainstone_common_init(MachineState *machine,
-                                  enum mainstone_model_e model, int arm_id)
-{
-    hwaddr mainstone_flash_base[] = { MST_FLASH_0, MST_FLASH_1 };
-    PXA2xxState *mpu;
-    DeviceState *mst_irq;
-    DriveInfo *dinfo;
-    int i;
-    MemoryRegion *rom = g_new(MemoryRegion, 1);
-
-    /* Setup CPU & memory */
-    mpu = pxa270_init(mainstone_binfo.ram_size, machine->cpu_type);
-    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM_SIZE,
-                           &error_fatal);
-    memory_region_add_subregion(get_system_memory(), 0x00000000, rom);
-
-    /* There are two 32MiB flash devices on the board */
-    for (i = 0; i < 2; i ++) {
-        dinfo = drive_get(IF_PFLASH, 0, i);
-        pflash_cfi01_register(mainstone_flash_base[i],
-                              i ? "mainstone.flash1" : "mainstone.flash0",
-                              MAINSTONE_FLASH_SIZE,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                              FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
-    }
-
-    mst_irq = sysbus_create_simple("mainstone-fpga", MST_FPGA_PHYS,
-                    qdev_get_gpio_in(mpu->gpio, 0));
-
-    /* setup keypad */
-    pxa27x_register_keypad(mpu->kp, map, 0xe0);
-
-    /* MMC/SD host */
-    pxa2xx_mmci_handlers(mpu->mmc, NULL, qdev_get_gpio_in(mst_irq, MMC_IRQ));
-
-    pxa2xx_pcmcia_set_irq_cb(mpu->pcmcia[0],
-            qdev_get_gpio_in(mst_irq, S0_IRQ),
-            qdev_get_gpio_in(mst_irq, S0_CD_IRQ));
-    pxa2xx_pcmcia_set_irq_cb(mpu->pcmcia[1],
-            qdev_get_gpio_in(mst_irq, S1_IRQ),
-            qdev_get_gpio_in(mst_irq, S1_CD_IRQ));
-
-    smc91c111_init(MST_ETH_PHYS, qdev_get_gpio_in(mst_irq, ETHERNET_IRQ));
-
-    mainstone_binfo.board_id = arm_id;
-    arm_load_kernel(mpu->cpu, machine, &mainstone_binfo);
-}
-
-static void mainstone_init(MachineState *machine)
-{
-    mainstone_common_init(machine, mainstone, 0x196);
-}
-
-static void mainstone2_machine_init(MachineClass *mc)
-{
-    mc->desc = "Mainstone II (PXA27x)";
-    mc->init = mainstone_init;
-    mc->ignore_memory_transaction_failures = true;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c5");
-    mc->deprecation_reason = "machine is old and unmaintained";
-}
-
-DEFINE_MACHINE("mainstone", mainstone2_machine_init)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d3e07262b14..84cc34f016c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -94,14 +94,6 @@ config INTEGRATOR
     select PL181 # display
     select SMC91C111
 
-config MAINSTONE
-    bool
-    default y
-    depends on TCG && ARM
-    select PXA2XX
-    select PFLASH_CFI01
-    select SMC91C111
-
 config MPS3R
     bool
     default y
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 7b474ad518b..72afb9e62a7 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -6,7 +6,6 @@ arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
-arm_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mainstone.c'))
 arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
 arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
-- 
2.34.1


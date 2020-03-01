Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1709106lfg;
        Sun, 1 Mar 2020 13:50:38 -0800 (PST)
X-Received: by 2002:adf:e809:: with SMTP id o9mr17698889wrm.405.1583099438073;
        Sun, 01 Mar 2020 13:50:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583099438; cv=none;
        d=google.com; s=arc-20160816;
        b=LwMk4joTfLArY+WkVoxi1zG2YzXr/3TKPEQ+qrcifolkQuttRMWLXlj1opfsHoQ7wd
         0nruCWTq17SoygyR2p5ySx6Wdu4B2Be3iDoAAJSwPL7EwlFTn2N/gv5QdOnkUG3SlfMu
         wvOlrbYQGZojk9uWH2rWf4SZnA+kBa/FwczClcY2SGWxLqZxJOZHL5Z6UQBk4g6/fcay
         q/RIJMCYaCEp2eJiBGfndW53gthczKoA2MDgFSMTz7/91vurYt/g1ZFh/vXC9JnCttkA
         xJRZWUorw09bOjVvrBiD0wGVIsZxu1UmYmPcA3i8gvUMRcI+0XYV3FNvscTSgZDfd0FH
         UX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IFu09zjFZXOrx+SQLeCSOYzoT5crbhYU7BuHzhJ71XA=;
        b=xsl2zosVkq7KZ1eb+V6eGqU8Tk805pPbOTGD4MBNXxPvPGeCC5/ERkpz1R0t2/2r/J
         auw63dxiqUCVBWEK76JKIEbY9jWGu7Zccp/4cugCqyVfpe2uQedS3RvRSgJqicqE2J6N
         oyCA18tuYjx5JIppr5UzK2SUm0mDgCqYKUS4Rv5ECGkwYeKtfrCipfVZzVN9ZboMwCuF
         E+swHiG3eblig0tFY4EXd/cna7NvvHucaeK4g68TsCLW/ZwS7y8OI7LiDhxbL6zenPcY
         44SRtjqt0IDu9U4nuV8U3vm0KSf/bZCQ5FRHQP+lgA5fttO+kvyWJtWU9Lnn4S+b1cWb
         1XDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JRhWoD1t;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v5sor4731378wrf.56.2020.03.01.13.50.37
        (Google Transport Security);
        Sun, 01 Mar 2020 13:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JRhWoD1t;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IFu09zjFZXOrx+SQLeCSOYzoT5crbhYU7BuHzhJ71XA=;
        b=JRhWoD1tn8y/hL/iNgCBabPtXOVelWcvTLaNbVFIbcVwy/o9oelesIyyOpai927Ayh
         461yIKIHmjsTErpvBf8fQvPNPoEYC9EPteNgDO/tZgD4Rim1HuMvVfy2LivRufStp38p
         H+0e2elVDI/K7LHEufylJ9hRUVJMcOc9qGje9mfescZMfIHj2UaY78NwTKX61fs84vbl
         f6h4glhsHbxJzEbcHPRdNFjXqwLtiNaZC8bEESrZhflKWfx0FQ75c0sLC/lLIuOcdzlR
         GnD5Aru5A8ZANA8jEHlCMvqRr/YOy8X/Lt4LrRedc6lmZIWNKScgYVcZSU8WSFvz/xCS
         xNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IFu09zjFZXOrx+SQLeCSOYzoT5crbhYU7BuHzhJ71XA=;
        b=ERbuxIWYAw2L8q6n2ypWATrKw3aXJKLAs3BfSfwfclo77tb1RfczisFEvcg+eEUBJk
         RPcPoiQp6cVWzPfmECP6SMP+JAsFjFNAEgeAahqvbrTMubSLhMh64b23r8ogGoVNCQuJ
         su+ysgNJL+Mk6SUf3DoqvuViWh2+UFg5g/lgA0uVtcf196NERvUSq9IJBJRbnZgRlSBG
         UpujR8rv58qghxnJNboO0p9DC55v1Gprfk969B5g2DYvI5jgD6h5QzeNvKTNe37SBatS
         seYsCKTGUXA93vF+aQx06qMuTILpSG7PL/fxUcuKllVRab0fFeNU30vEIo8Dq9jmZ9xc
         GbTQ==
X-Gm-Message-State: APjAAAV3xsj9jDywZAU39IDgWW7OPe1RLFzjI8rCJw2aadiIlMoUHlHH
	Pclr+l6EiE1scHdcVT3FS50=
X-Google-Smtp-Source: APXvYqxUkqKkp5KbXBEyYiA3krYLA3HoEYIwcSdnNDoq/9tD7yOKW107fELgoxPWHFalP1pSZFzO8Q==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr17747059wrr.322.1583099437689;
        Sun, 01 Mar 2020 13:50:37 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id e8sm25033124wrr.69.2020.03.01.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 13:50:37 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v6 02/18] hw/arm: add Xunlong Orange Pi PC machine
Date: Sun,  1 Mar 2020 22:50:13 +0100
Message-Id: <20200301215029.15196-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301215029.15196-1-nieklinnenbank@gmail.com>
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KHR58DFRDA6+

The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
based embedded computer with mainline support in both U-Boot
and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
various other I/O. This commit add support for the Xunlong
Orange Pi PC machine.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/orangepi.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS          |  1 +
 hw/arm/Makefile.objs |  2 +-
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/orangepi.c

diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
new file mode 100644
index 0000000000..19adfca917
--- /dev/null
+++ b/hw/arm/orangepi.c
@@ -0,0 +1,89 @@
+/*
+ * Orange Pi emulation
+ *
+ * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "exec/address-spaces.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "hw/sysbus.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "hw/arm/allwinner-h3.h"
+#include "sysemu/sysemu.h"
+
+static struct arm_boot_info orangepi_binfo = {
+    .nb_cpus = AW_H3_NUM_CPUS,
+};
+
+static void orangepi_init(MachineState *machine)
+{
+    AwH3State *h3;
+
+    /* BIOS is not supported by this board */
+    if (bios_name) {
+        error_report("BIOS not supported for this machine");
+        exit(1);
+    }
+
+    /* This board has fixed size RAM */
+    if (machine->ram_size != 1 * GiB) {
+        error_report("This machine can only be used with 1GiB of RAM");
+        exit(1);
+    }
+
+    /* Only allow Cortex-A7 for this board */
+    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
+        error_report("This board can only be used with cortex-a7 CPU");
+        exit(1);
+    }
+
+    h3 = AW_H3(object_new(TYPE_AW_H3));
+
+    /* Setup timer properties */
+    object_property_set_int(OBJECT(h3), 32768, "clk0-freq",
+                            &error_abort);
+    object_property_set_int(OBJECT(h3), 24 * 1000 * 1000, "clk1-freq",
+                            &error_abort);
+
+    /* Mark H3 object realized */
+    object_property_set_bool(OBJECT(h3), true, "realized", &error_abort);
+
+    /* SDRAM */
+    memory_region_add_subregion(get_system_memory(), h3->memmap[AW_H3_SDRAM],
+                                machine->ram);
+
+    orangepi_binfo.loader_start = h3->memmap[AW_H3_SDRAM];
+    orangepi_binfo.ram_size = machine->ram_size;
+    arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
+}
+
+static void orangepi_machine_init(MachineClass *mc)
+{
+    mc->desc = "Orange Pi PC";
+    mc->init = orangepi_init;
+    mc->min_cpus = AW_H3_NUM_CPUS;
+    mc->max_cpus = AW_H3_NUM_CPUS;
+    mc->default_cpus = AW_H3_NUM_CPUS;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    mc->default_ram_size = 1 * GiB;
+    mc->default_ram_id = "orangepi.ram";
+}
+
+DEFINE_MACHINE("orangepi-pc", orangepi_machine_init)
diff --git a/MAINTAINERS b/MAINTAINERS
index d5c0c25cc4..02ecba8d9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -496,6 +496,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/allwinner-h3*
 F: include/hw/*/allwinner-h3*
+F: hw/arm/orangepi.c
 
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index ae577e875f..534a6a119e 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -35,7 +35,7 @@ obj-$(CONFIG_DIGIC) += digic.o
 obj-$(CONFIG_OMAP) += omap1.o omap2.o
 obj-$(CONFIG_STRONGARM) += strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3.o
+obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3.o orangepi.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_STM32F405_SOC) += stm32f405_soc.o
-- 
2.17.1

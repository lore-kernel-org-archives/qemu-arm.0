Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294319lfc;
        Wed, 11 Mar 2020 15:19:06 -0700 (PDT)
X-Received: by 2002:a05:600c:146:: with SMTP id w6mr811656wmm.75.1583965145901;
        Wed, 11 Mar 2020 15:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965145; cv=none;
        d=google.com; s=arc-20160816;
        b=kHcip6WCxtNgQudDMz0D/AGkMrF/lJGEFXskNFtZUVOIRf5avdPPnsqlycZVfTt/hy
         wMhzjrqLjgow3/ghdyvb7QAVjkIOljLWaEguC/Erer77ZCUr3Igc4mbolFTRwYS1sDZK
         Nnh3p42A4XqvcKpnvuzMSDAd9p4J9pifuOe3M3RksmsyoZmcQIYRcEI3yL41oWDPL110
         1j2o7RjC71eiNfvgMIU7vGRo3K2ejt5eaol3rLVQhh+dRtXqeEQBi7uUhDJEXvZzhlBv
         hdJmyrL7e3DvnXCUYRrw7qeqQfTtPm6ubsRd4iasM3enADw1w22YZOmQz/gsxCA6/zBF
         SCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UtIN3x5l051YdZdHHrtD1lDNRMNei/x4kU6t41vzRkk=;
        b=R+vUGrNt2WPY8LMuRlJswyOdQXmguRbt4b8jpDrzy2i2ub17vjcsGuv6SJRzW+YMrR
         N3+Hod2avUnge205K3VTcn2fSIART2RG+tojPZhTWhUL3RlgdhdUDKsjJdZkZE8phlN+
         ehfEn1YPx5T44UiYUXxhcI0dqCY/laTMR/c/GI+uXhMMWUI+/RYeodHYFwRacfYUHuHB
         JIji64AhD/3mhixHaispXHbz3Ba3KJzr/zW5ew/54/s7LEPucuznxqG+j5yy53WNNNXx
         xt5w1EGLVkevqIpe2E6AzP6CXbU127YToTDYdb0r9pnL6Pg+ZhC2/F3KtP0rX5o1bcul
         o/Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="C2/lYh1l";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q22sor2058095wmj.20.2020.03.11.15.19.05
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="C2/lYh1l";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UtIN3x5l051YdZdHHrtD1lDNRMNei/x4kU6t41vzRkk=;
        b=C2/lYh1l+ejc+5dwzmicaxJ87bqugnJV9LrzdJPeCfCKO4SK0R7SncfIaw9rwUyYSO
         +pxdSwKWYkSDXBqJ7EQVrF6rCCj1Uh5ASr1+NUK3rl+88QqkxEss2izKKjFn32jByPu8
         9mNyz6zQI0FfmQ3IcQs8GqenxHW15v8JrkNOKwvBc4XY7s65Bs9LVHv6OeIxp+Dw+lex
         OLnxYauO8faXFfKsyxbuMtT8p70eo6p6/dpQ0cGngzXC8+cRzhYUb/kGPVfhuEzEe8i8
         fEw4maXFz/InV0RiimOxLs0Q+OhjgENRjAT7qLLylIf6ndCJBYPnWzSqyJyLJRHrKM5b
         lnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UtIN3x5l051YdZdHHrtD1lDNRMNei/x4kU6t41vzRkk=;
        b=Cc0+I5X+bg1V0YVLOWVGCo58HjurpeI30PuIo+7d+1lUcu8B/q2sBLIPg1zM0bjN6r
         jmmyLZr7ih4C6maYdANYmo9gWalLH6Nyzhz9xle66qqAa6EYtOQa3j+L4A2RzxGcejLH
         aDBp20NkV2IYfEEynfeYXsWhNBOg6utzbIRDWJu9VYQsUO4CuE2rxT+zcnboQ9QeJozW
         1/m6zFVZFevY3ToQSfz1cFLcU3/b94ockcw9silleYii+PxgkhRgCqRzlGiFT61msUss
         3bmgbU+Xj7jX/pPa1vDNnrCkwwjAAbhJp5x70rmnaathT+AdeMZTqWa9xlzbQBn2JrMs
         psLg==
X-Gm-Message-State: ANhLgQ0CK9vJrYdDz78kF4vycWXFpxhFiXvp+a/WOVEoPtjqsKpz5cCp
	xOFMkEDc2TdNsJBUaG/+NJA=
X-Google-Smtp-Source: ADFU+vsFJQt+O3hQz8uibqIJoaSstHF/7BM7O+Q4qCRUVN6dl/G4L5R7znVF+Ju784TPTXYpYDZ28Q==
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr867208wmc.5.1583965145484;
        Wed, 11 Mar 2020 15:19:05 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:05 -0700 (PDT)
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
Subject: [PATCH v8 02/18] hw/arm: add Xunlong Orange Pi PC machine
Date: Wed, 11 Mar 2020 23:18:38 +0100
Message-Id: <20200311221854.30370-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +W5qVqiIvyB2

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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/orangepi.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS          |  1 +
 hw/arm/Makefile.objs |  2 +-
 3 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/orangepi.c

diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
new file mode 100644
index 0000000000..3fcec1944e
--- /dev/null
+++ b/hw/arm/orangepi.c
@@ -0,0 +1,92 @@
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
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(h3),
+                              &error_abort);
+    object_unref(OBJECT(h3));
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
index c27fe8a4be..ba46545464 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -497,6 +497,7 @@ L: qemu-arm@nongnu.org
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

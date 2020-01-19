Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969806lff;
        Sat, 18 Jan 2020 16:51:16 -0800 (PST)
X-Received: by 2002:a1c:c919:: with SMTP id f25mr12000438wmb.49.1579395076385;
        Sat, 18 Jan 2020 16:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395076; cv=none;
        d=google.com; s=arc-20160816;
        b=K6KvlX7bmO+CeKi2ELDsBxEZeaTX0CAMulgipDerG3o6ig4elpqfYEN9jQg+bHrmch
         ZKKmlhgqJHIlnT7+kppejLSa5yIMtNhOI2Rz9Q+i1ivmApkZkPfQ5NK6oPeZmfm3t7Vf
         DBPl6yrNpRa9Pn5ajXLJtcmB0LsVBRt2z/40BoZKXdLYHyGMfpMIrTYoJh/GMlKzZtTY
         glDvvDPcy3vUfXEt8pPZK2d/Cq5a8OhcdSweL0TxLBH0Q+Z02fOILZScNOW0t8GdoAem
         oRURQ/hKPYLj0AEmy5jHoHGUg0UqwnCtSbVW53IXrsfl6bHv+Px/51aQE9Wxgmxjb1n+
         9eJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZOrlrdoaDbbU1sYz+9Op9dsE9K8ocbeL+jVWJxJU1ss=;
        b=jcXC/2PUGgU4JFzXIbFD1BG2Wz8wvEeTfVtURBPeWGh3Ey2rrHBWsvzyvVlRcZDrws
         +ZBIQ7DUvPn4PVUsAm7JijD3zaKqxsgkH5Xjb/oeFAyVDJ3SKrWw32AfmVTCEqEh1hLz
         1I6vlQfYDEBTQSrlLLl3UCHG2YK81Xyc+iJFYR9VZH6sL3xUdCZ5X/reftN9Q3LAJUg9
         P0d4Ckc8DpYkCUgo+vHaNzwA9azaKHZ/wiiB2Rtin/chMD3ZHejvz5hCkiXVG8E1Eb6m
         8oP8CDmWafHDPMF+OgO6McvyjfnqUUGD+Vz8iQnRNbpQEf+O2ATKgl3zn1/yp4ptxuAC
         B36A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tpYhXtGS;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a18sor6432904wmj.5.2020.01.18.16.51.15
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:16 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tpYhXtGS;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZOrlrdoaDbbU1sYz+9Op9dsE9K8ocbeL+jVWJxJU1ss=;
        b=tpYhXtGS9gwPjUhkDBuAkK/tH4hzvFgjkYv8j2IPR8LD+/TfjJbMfrkNCIeBdsC7m6
         +Te/6Ivg/tawSSCaHy36X9McxQImAe6h4KVmoWcMtDX+irM6hwMg3JEmD7gJKAEcS7/4
         WZQu2MuABXdK8V7PPy33EU6o9V1hVdQlaL1XGcOwVBSpb5lxC8B65XN5sD++2lCnATRD
         RPZQjQpHjwsV/0QiKWbQJJmJwATk5HhUvnHURQf27n6ejBbsDi1TjwMyxKIEG18bmLz+
         e59nvlvzDynTbsI9Ifg2FcETJd02EPR5apHt0ZEvxTrlFpV4vLL2nEyb2XsX2u9PoDh2
         aLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZOrlrdoaDbbU1sYz+9Op9dsE9K8ocbeL+jVWJxJU1ss=;
        b=lBntfPJm4zPRBAWYfABt3eaZclB2iGupBZ2+VkaX0+LQLiQ4PaunfVwXEnWJB/Zo8t
         TSq9cr5YUqw/bExhJkM2+64Ck81n6rPzy+vOgEdoEzpIJ4HwAqsTNK1qlBhZYrLroHzA
         m0CiE6tJJTX5YPUnSH6rkZdvUa75EBoGiO2M4LhfG22+dEBTYMVY1QCE+uk1P0a3LPDk
         nPossWWGxT+PQJAzxS9ILFM14L5kRY2Vgl0+U/CSbcv1IuLf5wEd8qMc7gReVl4D6I1N
         jbOhi8K3zeYLI4XTwYsJSgF+TCW5FAwZwb7BIt7UJYeWEg7ZOm1xpMx5OgFwgNcHI9SB
         +TJg==
X-Gm-Message-State: APjAAAV2NAErlJQHlQiqRmYheI/hkCWjfnMGxmlfdVjk0gBuYanWnV83
	VvskXAzS6RStTF8EaDV2Mso=
X-Google-Smtp-Source: APXvYqxs8RPI8G/F9XXQtrUSAT9u4Qm2PH2jgjzitPtv9f6omWQfMfan1GhkcuhSefhuiH6pFGmVeA==
X-Received: by 2002:a05:600c:146:: with SMTP id w6mr12417524wmm.180.1579395075759;
        Sat, 18 Jan 2020 16:51:15 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:15 -0800 (PST)
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
Subject: [PATCH v4 02/20] hw/arm: add Xunlong Orange Pi PC machine
Date: Sun, 19 Jan 2020 01:50:44 +0100
Message-Id: <20200119005102.3847-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p2zsypDhmYXf

The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
based embedded computer with mainline support in both U-Boot
and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
various other I/O. This commit add support for the Xunlong
Orange Pi PC machine.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/orangepi.c    | 93 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS          |  1 +
 hw/arm/Makefile.objs |  2 +-
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/orangepi.c

diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
new file mode 100644
index 0000000000..866f5f7cd6
--- /dev/null
+++ b/hw/arm/orangepi.c
@@ -0,0 +1,93 @@
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
+typedef struct OrangePiState {
+    AwH3State *h3;
+    MemoryRegion sdram;
+} OrangePiState;
+
+static void orangepi_init(MachineState *machine)
+{
+    OrangePiState *s = g_new(OrangePiState, 1);
+
+    /* BIOS is not supported by this board */
+    if (bios_name) {
+        error_report("BIOS not supported for this machine");
+        exit(1);
+    }
+
+    /* Only allow Cortex-A7 for this board */
+    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
+        error_report("This board can only be used with cortex-a7 CPU");
+        exit(1);
+    }
+
+    s->h3 = AW_H3(object_new(TYPE_AW_H3));
+
+    /* Setup timer properties */
+    object_property_set_int(OBJECT(s->h3), 32768, "clk0-freq",
+                            &error_abort);
+    object_property_set_int(OBJECT(s->h3), 24 * 1000 * 1000, "clk1-freq",
+                            &error_abort);
+
+    /* Mark H3 object realized */
+    object_property_set_bool(OBJECT(s->h3), true, "realized", &error_abort);
+
+    /* SDRAM */
+    if (machine->ram_size != 1 * GiB) {
+        error_report("This machine can only be used with 1GiB of RAM");
+        exit(1);
+    }
+    memory_region_allocate_system_memory(&s->sdram, NULL, "sdram",
+                                         machine->ram_size);
+    memory_region_add_subregion(get_system_memory(), s->h3->memmap[AW_H3_SDRAM],
+                                &s->sdram);
+
+    orangepi_binfo.loader_start = s->h3->memmap[AW_H3_SDRAM];
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
+}
+
+DEFINE_MACHINE("orangepi-pc", orangepi_machine_init)
diff --git a/MAINTAINERS b/MAINTAINERS
index 225582704d..e99797eec9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -487,6 +487,7 @@ L: qemu-arm@nongnu.org
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

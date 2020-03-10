Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226582lfc;
        Tue, 10 Mar 2020 14:32:13 -0700 (PDT)
X-Received: by 2002:a5d:5691:: with SMTP id f17mr13717305wrv.74.1583875933269;
        Tue, 10 Mar 2020 14:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875933; cv=none;
        d=google.com; s=arc-20160816;
        b=fgcooh2bgUyMCAA3oT4M5iyQ/bYGjDS+p1SETgJvGvmDZ5oRtp6Xf4ncfq+6mN8pFr
         ZrEyBw+UZFRLNNWtISPb2dfLGyqmNw8AY8Z/vMMEyoURL4xUzNyjmQ6/q8p2KFnynZLM
         6VpXhCBkSDcL5ibDpsAXRnC2d9hv/SwcTd9aAZ+8xz9BnOmF9G7n6vnxb4g8F9xNwmuD
         G44K2WfUFnKji7Uq05txWendvwaMXCy2NDjrjFrM7NphP4jCgFp5RXSnDwa0KWWYC89m
         LihR18BRAYnqAqnwWx9HXll4ku3gSsHd3aMy9ADbm/X3wIsCC7Ozo6qGdc+vbqC1Bhzi
         CKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EYESvQKR6+bdGUWiimfuvI4qx8oJxk2o+hyf6M3zJvM=;
        b=dycdP+koUzJMI88xlFddqNXT/we4Oi2fYie/e70z5MHIH2tsXLyu6Cx2gcjIr8jvze
         mqa8Oql26FO8PqjIkOPHokhJlwX6WKobIAbnr2qkB6zPg0O8LfqkZCk3is80ICXcExEc
         J5kqDVub8JnHVNV5nUptZmLUIV59JjK4Esct1o82oOsZNw3plV3CCWx3uyoO5+DpCU19
         Rpay/eAaiav9Yd7WpMjPVinKRftPkM+n5KQCx6NTGrTrQOaQvoewTPX3fQjFHYp2IfZw
         4mVNqegqsMEscugOFFnSmgIGISZJsMv0LKkE9r2s08KkVK3kxVbuPhVBkqyMS1aCgxwG
         7kMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QLLXvMMD;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m22sor2682027wml.22.2020.03.10.14.32.13
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QLLXvMMD;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EYESvQKR6+bdGUWiimfuvI4qx8oJxk2o+hyf6M3zJvM=;
        b=QLLXvMMD9ZiaYOCZw9vOGfemp9xz2KRtV2+xNtHhi+ftfLxo280uegwUcKnHY235rU
         Du5gGGv+Z8dovAWLAIQfEF3VeIwfcPxsxZ8rPVsDM5Ef15+VZHYFgKgPMd1M003RzNkH
         uDjO1SFF2tKeeWRzMAwN4q8MQQg4+gIg1r7T73bqqKsgnvNK39PjwKAvD+zxOK4YkNAk
         IEdhDYaoi0IbR/WvP7j0F3lc8X8Lwp8qtgZ28IqBu3YLTBbiRo+AT4gtItozqEjuM/PL
         5rU9JYkQZKlqupAQ1xkkzU8CBEIoL3syAU8eMtBuJ5H39dHovvHdIRpZKMadOnBdfp2E
         blvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EYESvQKR6+bdGUWiimfuvI4qx8oJxk2o+hyf6M3zJvM=;
        b=kO71fZTZe21LL0Eo3LW83EoNOGfm30vIxPxHkYUMz1pMN+ZI6H2mv7VeWNaRBy5L/1
         eDYr+YRtD59FvO7drCdGNJtv/RS9///6hJE6UKSQ91i9FVgebJM9crTvH5MgdRO3wZhX
         Ui0716MMQBvkfyEnJMS4eiseqqSglMS+PuEG0H5JoWA57/7zvPMqzqMliSUd0uz+5JvT
         nuQf2ah0FhFVvljOGdo0VZVLq3YO6T/HLiuAg+VjC2/eEBTK5OsU/87lhRhla2DjEU7g
         k+bEH0Sq5wG8um7Ywe38qmo4VuQCQpUaWIDNYmjXlI+5vlC2HSKrlV0k/gABuNYMsEiV
         Erqw==
X-Gm-Message-State: ANhLgQ1hfr62o2tAudlHckA/q6+5mJY5PkrUiT2bHBr8EW27wsz6VyxH
	KheZdYuhKeQlxA3sov7hgYE=
X-Google-Smtp-Source: ADFU+vuT3Dps0gHbKVrW/uVauAJEfYJBBdxXfmi2SMIFoqMPp4owEULQe74dlJsie5MucYJKe2WjHw==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr3822827wma.114.1583875932855;
        Tue, 10 Mar 2020 14:32:12 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:12 -0700 (PDT)
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
Subject: [PATCH v7 02/18] hw/arm: add Xunlong Orange Pi PC machine
Date: Tue, 10 Mar 2020 22:31:47 +0100
Message-Id: <20200310213203.18730-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8L7EYjT5yP+u

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
index 4730fe2b95..53040ceab3 100644
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

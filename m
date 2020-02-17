Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518552lfp;
        Mon, 17 Feb 2020 15:24:28 -0800 (PST)
X-Received: by 2002:a05:6000:124b:: with SMTP id j11mr22743386wrx.285.1581981868562;
        Mon, 17 Feb 2020 15:24:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981868; cv=none;
        d=google.com; s=arc-20160816;
        b=h3JrhuBVRgvJFudOeKNiF5dw7vxtVkbfjWSU9pCOTApqzkpypBMLV4dVKko07MCpLU
         6iZ+9orRV3P/lylqIguW6xS531WjWC6Jc4FKmgTm7gE7AxSZl+p858Aue4ixHiTygx9N
         m/9uavXthLIy3L4YjH+iUti1ErMRH15N9ikh5hvponKx3a0JlfXrzgcTjr0WKZGyYpFI
         8RJLMGsPN9ED5W6XXVSWPDYJnqBv8SmTCUOl9PjZlMgxzINBwwpsp2T9mSn471LwNdr/
         kx284EVH2HEkAdQiV3TxcAEljk+Shm9cxD2cgO0AI3kLO7VueOiK53tDfWgmuLG/TdAk
         9QVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9KRGMjBmfVZHW8toUIOEGgaXk/XlLAeO5unm82llSoQ=;
        b=TEqw8GbMzsiZyGFg+3C+lkPNOXd2NaPkVLX8DodGap0GsIDwCUyeZEHXucCffLbbec
         EAC/dWspmj+T+OfB3VCm2GVc859chGMFBAlDoTpcb/B451h8jA9k6z+gO1/3r79/SISP
         xiWRYtlQu6LmoAwzPakW/UP9gi0pOvb8y6PFFZNJcr8JWX4bel2OB2UFaO5nu89S1Si7
         mO7d5L3dsKn5RZL4dk93P3ipqm1+YWeezretRjhvqIOzdC6jra4suzNGd2JcQkTyVShj
         pd4vzPp05rGC+LbHzEoCTKQnsog3pcxosnI/mWgrl7aEVEL+3JFCUDX0E45d2ozR0f1h
         07Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=O69QAPZM;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 10sor556095wmk.9.2020.02.17.15.24.28
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:28 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=O69QAPZM;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9KRGMjBmfVZHW8toUIOEGgaXk/XlLAeO5unm82llSoQ=;
        b=O69QAPZMgyiaR3uZywpMG22Ir5TLLeShk5gl++fRKjKvmE3yFFQCx9Hrl0Fv1D3dju
         kRz03bvVawyd1tIHTawnqe9klCugKPTeAn/SUyn3Pm6SeOXiljpPskqSRNR7IWeo6QB3
         z3e2prObeuKm/8cFMEOs7AflKh28y+y8q0GyrvBTR2wv1wkLq8GL+p1mLyRmP616fWzd
         3WpYQDiVKCcZr77QzOHyoroinYEqj49kShS9HAw4cCqp0qPJ+FtL/Z9BaZ3O516e3eO7
         Qtf+LSRsS+h5o2d2ZI6CtmKMKNHYTPOK5nSmQ2xViWUzAhI4rfSMzF4FS4aghtnM3Clz
         u4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9KRGMjBmfVZHW8toUIOEGgaXk/XlLAeO5unm82llSoQ=;
        b=MVcdrMK5FktxF37gc0sdavDURtYTKYkuuI5e+FZc0omlteOE8Fm2Rdzwmnn6kWMlTB
         cfOuz1OLdufsSXMe4xZKyDktZW0LCrzfee70DXOm1bEQk4U6HHnsWU9lLylU5UjjfdyR
         qCwcKE43Hch6g6hE6hDYAYOk/MGwvNnXgWKqGu/SKXcy9YXShoKYqqhjsZlnQFmHYhMz
         ZABNy/ABGWXTLwolDGd3LRxbtfYbn/6AsU91djV3iokJG9saf+mIoAuNDoonoS6Y/VCq
         P9uqftFn+Jly4XmyffkDxEZnTniQon8437c1EySAoFZKQP8cHJ/Zjna4ZRKTd/wGvh5w
         ydNg==
X-Gm-Message-State: APjAAAX/VLzPS4xjYMPE6meaPrPu1BT3bhwddpPfR53c1Kje12AaxbB1
	WiY2KDrc3qQYfsMwNc5Jyso=
X-Google-Smtp-Source: APXvYqxF35/5Bj1MUVZCN2S54gM8h3rfBb3WgzcVoy/kEUulfKZv17TmBnOxSyPavG8FpQmkxYJs7g==
X-Received: by 2002:a05:600c:1009:: with SMTP id c9mr1215004wmc.162.1581981867862;
        Mon, 17 Feb 2020 15:24:27 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:27 -0800 (PST)
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
Subject: [PATCH v5 02/18] hw/arm: add Xunlong Orange Pi PC machine
Date: Tue, 18 Feb 2020 00:23:55 +0100
Message-Id: <20200217232411.30096-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FfV00XheRS6g

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
 hw/arm/orangepi.c    | 95 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS          |  1 +
 hw/arm/Makefile.objs |  2 +-
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/orangepi.c

diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
new file mode 100644
index 0000000000..839cd4873c
--- /dev/null
+++ b/hw/arm/orangepi.c
@@ -0,0 +1,95 @@
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
index a1ab79bdfb..8a93797b72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -489,6 +489,7 @@ L: qemu-arm@nongnu.org
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

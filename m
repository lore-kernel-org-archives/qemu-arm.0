Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472257njb;
        Mon, 3 Feb 2025 16:22:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFZOblapev2f7BHR9xmIF/19ixArUA+DWgmtH+lPCGb8+NGm6IYdv36eMajeY4JhR4w0ICsuWlcyzfEw==@linaro.org
X-Received: by 2002:a5d:560b:0:b0:38a:418e:21c7 with SMTP id ffacd0b85a97d-38c520ba470mr14344642f8f.53.1738628576024;
        Mon, 03 Feb 2025 16:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628576; cv=none;
        d=google.com; s=arc-20240605;
        b=alpovT4NLaLxCzM8quJdOeco445RFcabrEkUyrVEksbXQ5gUkT46C2d8Yk7WgNyT6A
         ZmDDcVsw5N5vEt5KizR18NDTJFfnHRq+XWErsFnst6B9YDhrc/AeSwMC7zL/9weEwGyZ
         hR/45hKb0rbdL5Ag6svpDGpuMfZlIWgCj5ObJr3jGysJHb8y8l/sTnCxgxraAy4DUsGI
         K+XWxDp6Qk/nnQ9eOKfHa4LsIbw2UDze6bYByD5h07CWmhkiRdavrhpJIAS4LPxpDwGr
         n2huAggfM10FX9q1tWmpIBb/is1GunCTMH6t8rYzDgNfzRXSgD480YUPSP6QfgCyHAWu
         6uNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vsIKyI+e9av35VOR6IuoP5pHXQj36xoMmsdPAwqdbVY=;
        fh=mg0nQfX+MYGkTc4gOHMQoEXs+MUHGaqGChA8n1jsT8I=;
        b=PKEUJctFjuCM5LmZnyqSK0CWq2I3N3YPF1lWzDqYT/w4HbweCs3FQgf0tZs9Axdf/u
         Sp7sAgZaVK8IW0uOJdswSGbe3qd9YyeJOr1WqVX8+IOSE1oVNN1wCl1dmmKAKFglckrT
         RLUGcuIOsldEqCj7SnoQMHKaFTmuX9cbcebHWt6Eql6cNfhzUGLBUNLGkDu9Np2DXIUa
         hhRjohcwUW/l41c6iSZsYSuz1Z34VZx51u+rJ8fDSKrsW3Xf6lCgT2CJYzyFOiSDqOZ5
         BjoflI2UCtgPeKQTz8N4Oup93BcrT9dAWB+Y5e0HVs4NMsOHuBoyAGGGIpMZlBjkx3pe
         SoVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WH+d29Fj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0dd859sor3277890f8f.1.2025.02.03.16.22.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WH+d29Fj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628575; x=1739233375; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsIKyI+e9av35VOR6IuoP5pHXQj36xoMmsdPAwqdbVY=;
        b=WH+d29FjhPV1cWgZXkINSFx6hVM0//H/UCjJ/a4PEK3/7p3sVSaH/BzstmqTPrvKqO
         wuUYJv2orA7cFB7uYSYHL2RPyEXaO/5VfMolrZmgJoNt3WthKMzxUmfBw37/2980ZZiZ
         2Y3H8730hn6UxUVeq2MfJakNlIY6jxi/PNkfuxMsGZrFwZB1yiKLVk0CiEmZYRt4p/iB
         eGmtd/kreABv+Catg56ehNl4L3dxeZggWqhM3HBxmUf0HSjkYSFiZWytUBT1Pd2irMaG
         LFindnRhJ59ge7cs8OeyMogCQETDiRfJ+dD4PoujG6xhhRGo+UYuyiRmctcGGGLSUvFm
         jN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628575; x=1739233375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsIKyI+e9av35VOR6IuoP5pHXQj36xoMmsdPAwqdbVY=;
        b=qlV+dJ6mKQiEOsjZuEYaUfFG9v0QS3pbae+B4vCm+u5wcHJgPj5Ma+vx+zxwH0op2H
         v9APABub6V7Fn519qCfQYIWgFIAcDQUPYMibcXELrYIdQmiolQjqDd9ymA2DqP+j69JR
         Z4CrNWng+7UuP7kOK2j5NSm8Pf05c4K9VCb+agtSkqzZhKtEGC7IFWhV7OxBBju+t0Hn
         DIsvBilMGZewUhr9e+FEIwqSoGnUFbm7s8XIOo9fSiPnXUBH9O2Dp9UTKnWoyB8pWrlK
         4euBULhyNZgq/UHmPgFpszqCNpVmAjB4B7sKS+5MSIFpTuXa6uYGmY2L77wQksDDEQlH
         yaeg==
X-Forwarded-Encrypted: i=1; AJvYcCWYNDmDi8rLZgnr1cYFgDIOprY91ghVdj81jbTFERYT/nuqK0tZpMOZn7YcaRsH2Yfqsekgtijvpw0bJA==@linaro.org
X-Gm-Message-State: AOJu0YyCIzJZ4GL36LMyUeq48evA+YEj+YE5a8t6IGovs0YxloxCaAjS
	77wu9XSm0KegRKljTlpZmSXKghqV1eUIhjE4/pbwTWBGvfwT/kdonyorPpjoL4ekgg==
X-Gm-Gg: ASbGncsZZ/HE8VcJj4oTEuQasv9pHj7CpzQMMk2OijroAJXMEvVVnZ0hkjXhjuINncS
	NUg7MOg4qIpySHPsmQrXwIyP3tOkokpGwdYuEXUXwm4xlY5EtbZDzm5iZsaulLYZ4ePEb9vMrmL
	qrtxJaGoa6IcRsn03X/lOG41tc+4/lzQlmWgVYYKq+A2R+kYchBgvumPgmdbQcgRuJ3ME9odIE0
	lm3Tjo3S3sxqis8N+L7uXFgm6PBUwpGL1PKr8Z+tZYRcEGCEGoyOM34zEhNfluDbxEADUODSFhq
	MEchgeozbS9yxKLROn4rtWlA019iVPpXK+LGFoqA/t/coJ9mDtMSb9P6/OPr1SncZg==
X-Google-Smtp-Source: AGHT+IHjNmmsTMwFvgzRhtIJozEro1HlPr24eqil0s/FSv2CSBrheY5n6kgxKDAO4uVJteUcr+rZ4g==
X-Received: by 2002:a05:6000:1942:b0:386:1cd3:8a0e with SMTP id ffacd0b85a97d-38c520b96f8mr16092847f8f.48.1738628575462;
        Mon, 03 Feb 2025 16:22:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42d4sm176306255e9.6.2025.02.03.16.22.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:22:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 02/12] hw/arm/raspi: Merge model 4B with other models
Date: Tue,  4 Feb 2025 01:22:30 +0100
Message-ID: <20250204002240.97830-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MnapO0MBpjAE

Except we alter the device tree blob, the 4B
is just another raspi model.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c     | 114 ++++++++++++++++++++++++++++++++++++-
 hw/arm/raspi4b.c   | 136 ---------------------------------------------
 hw/arm/meson.build |   2 +-
 3 files changed, 114 insertions(+), 138 deletions(-)
 delete mode 100644 hw/arm/raspi4b.c

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 508f90479e2..3fa382d62ce 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -8,6 +8,10 @@
  * Raspberry Pi 3 emulation Copyright (c) 2018 Zoltán Baldaszti
  * Upstream code cleanup (c) 2018 Pekka Enberg
  *
+ * Raspberry Pi 4 emulation Copyright (C) 2022 Ovchinnikov Vitalii
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
@@ -16,20 +20,27 @@
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/bcm2838.h"
 #include "hw/arm/raspi_platform.h"
+#include "hw/display/bcm2835_fb.h"
 #include "hw/registerfields.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/arm/boot.h"
 #include "qom/object.h"
+#include "system/device_tree.h"
+#include <libfdt.h>
 
 #define TYPE_RASPI_MACHINE  MACHINE_TYPE_NAME("raspi-common")
 OBJECT_DECLARE_SIMPLE_TYPE(RaspiMachineState, RASPI_MACHINE)
 
+#define TYPE_RASPI4B_MACHINE MACHINE_TYPE_NAME("raspi4b")
+OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
+
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
 #define MVBAR_ADDR      0x400 /* secure vectors */
 #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
@@ -44,6 +55,11 @@ struct RaspiMachineState {
     BCM283XState soc;
 };
 
+struct Raspi4bMachineState {
+    RaspiBaseMachineState parent_obj;
+    BCM2838State soc;
+};
+
 /*
  * Board revision codes:
  * www.raspberrypi.org/documentation/hardware/raspberrypi/revision-codes/
@@ -301,6 +317,83 @@ void raspi_base_machine_init(MachineState *machine,
                boot_ram_size);
 }
 
+#ifdef TARGET_AARCH64
+/*
+ * Add second memory region if board RAM amount exceeds VC base address
+ * (see https://datasheets.raspberrypi.com/bcm2711/bcm2711-peripherals.pdf
+ * 1.2 Address Map)
+ */
+static int raspi4_add_memory_node(void *fdt, hwaddr mem_base, hwaddr mem_len)
+{
+    int ret;
+    uint32_t acells, scells;
+    char *nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+
+    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
+                                   NULL, &error_fatal);
+    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
+                                   NULL, &error_fatal);
+    if (acells == 0 || scells == 0) {
+        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
+        ret = -1;
+    } else {
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                           acells, mem_base,
+                                           scells, mem_len);
+    }
+
+    g_free(nodename);
+    return ret;
+}
+
+static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
+{
+    uint64_t ram_size;
+
+    /* Temporarily disable following devices until they are implemented */
+    const char *nodes_to_remove[] = {
+        "brcm,bcm2711-pcie",
+        "brcm,bcm2711-rng200",
+        "brcm,bcm2711-thermal",
+        "brcm,bcm2711-genet-v5",
+    };
+
+    for (int i = 0; i < ARRAY_SIZE(nodes_to_remove); i++) {
+        const char *dev_str = nodes_to_remove[i];
+
+        int offset = fdt_node_offset_by_compatible(fdt, -1, dev_str);
+        if (offset >= 0) {
+            if (!fdt_nop_node(fdt, offset)) {
+                warn_report("bcm2711 dtc: %s has been disabled!", dev_str);
+            }
+        }
+    }
+
+    ram_size = board_ram_size(info->board_id);
+
+    if (info->ram_size > UPPER_RAM_BASE) {
+        raspi4_add_memory_node(fdt, UPPER_RAM_BASE, ram_size - UPPER_RAM_BASE);
+    }
+}
+
+static void raspi4b_machine_init(MachineState *machine)
+{
+    Raspi4bMachineState *s = RASPI4B_MACHINE(machine);
+    RaspiBaseMachineState *s_base = RASPI_BASE_MACHINE(machine);
+    RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
+    BCM2838State *soc = &s->soc;
+
+    s_base->binfo.modify_dtb = raspi4_modify_dtb;
+    s_base->binfo.board_id = mc->board_rev;
+
+    object_initialize_child(OBJECT(machine), "soc", soc,
+                            board_soc_type(mc->board_rev));
+    raspi_base_machine_init(machine, BCM283X_BASE(soc));
+}
+#endif /* TARGET_AARCH64 */
+
 void raspi_machine_init(MachineState *machine)
 {
     RaspiMachineState *s = RASPI_MACHINE(machine);
@@ -382,6 +475,20 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     rmc->board_rev = 0xa02082;
     raspi_machine_class_init(mc, rmc->board_rev);
 };
+
+static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+#if HOST_LONG_BITS == 32
+    rmc->board_rev = 0xa03111; /* Revision 1.1, 1 Gb RAM */
+#else
+    rmc->board_rev = 0xb03115; /* Revision 1.5, 2 Gb RAM */
+#endif
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+    mc->init = raspi4b_machine_init;
+}
 #endif /* TARGET_AARCH64 */
 
 static const TypeInfo raspi_machine_types[] = {
@@ -406,7 +513,12 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
-#endif
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi4"),
+        .parent         = TYPE_RASPI_BASE_MACHINE,
+        .instance_size  = sizeof(Raspi4bMachineState),
+        .class_init     = raspi4b_machine_class_init,
+#endif /* TARGET_AARCH64 */
     }, {
         .name           = TYPE_RASPI_MACHINE,
         .parent         = TYPE_RASPI_BASE_MACHINE,
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
deleted file mode 100644
index 9b08a598f39..00000000000
--- a/hw/arm/raspi4b.c
+++ /dev/null
@@ -1,136 +0,0 @@
-/*
- * Raspberry Pi 4B emulation
- *
- * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "qemu/cutils.h"
-#include "qapi/error.h"
-#include "qapi/visitor.h"
-#include "hw/arm/raspi_platform.h"
-#include "hw/display/bcm2835_fb.h"
-#include "hw/registerfields.h"
-#include "qemu/error-report.h"
-#include "system/device_tree.h"
-#include "hw/boards.h"
-#include "hw/loader.h"
-#include "hw/arm/boot.h"
-#include "qom/object.h"
-#include "hw/arm/bcm2838.h"
-#include <libfdt.h>
-
-#define TYPE_RASPI4B_MACHINE MACHINE_TYPE_NAME("raspi4b")
-OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
-
-struct Raspi4bMachineState {
-    RaspiBaseMachineState parent_obj;
-    BCM2838State soc;
-};
-
-/*
- * Add second memory region if board RAM amount exceeds VC base address
- * (see https://datasheets.raspberrypi.com/bcm2711/bcm2711-peripherals.pdf
- * 1.2 Address Map)
- */
-static int raspi_add_memory_node(void *fdt, hwaddr mem_base, hwaddr mem_len)
-{
-    int ret;
-    uint32_t acells, scells;
-    char *nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
-
-    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
-                                   NULL, &error_fatal);
-    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
-                                   NULL, &error_fatal);
-    if (acells == 0 || scells == 0) {
-        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
-        ret = -1;
-    } else {
-        qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
-        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
-                                           acells, mem_base,
-                                           scells, mem_len);
-    }
-
-    g_free(nodename);
-    return ret;
-}
-
-static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
-{
-    uint64_t ram_size;
-
-    /* Temporarily disable following devices until they are implemented */
-    const char *nodes_to_remove[] = {
-        "brcm,bcm2711-pcie",
-        "brcm,bcm2711-rng200",
-        "brcm,bcm2711-thermal",
-        "brcm,bcm2711-genet-v5",
-    };
-
-    for (int i = 0; i < ARRAY_SIZE(nodes_to_remove); i++) {
-        const char *dev_str = nodes_to_remove[i];
-
-        int offset = fdt_node_offset_by_compatible(fdt, -1, dev_str);
-        if (offset >= 0) {
-            if (!fdt_nop_node(fdt, offset)) {
-                warn_report("bcm2711 dtc: %s has been disabled!", dev_str);
-            }
-        }
-    }
-
-    ram_size = board_ram_size(info->board_id);
-
-    if (info->ram_size > UPPER_RAM_BASE) {
-        raspi_add_memory_node(fdt, UPPER_RAM_BASE, ram_size - UPPER_RAM_BASE);
-    }
-}
-
-static void raspi4b_machine_init(MachineState *machine)
-{
-    Raspi4bMachineState *s = RASPI4B_MACHINE(machine);
-    RaspiBaseMachineState *s_base = RASPI_BASE_MACHINE(machine);
-    RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
-    BCM2838State *soc = &s->soc;
-
-    s_base->binfo.modify_dtb = raspi4_modify_dtb;
-    s_base->binfo.board_id = mc->board_rev;
-
-    object_initialize_child(OBJECT(machine), "soc", soc,
-                            board_soc_type(mc->board_rev));
-
-    raspi_base_machine_init(machine, BCM283X_BASE(soc));
-}
-
-static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
-
-#if HOST_LONG_BITS == 32
-    rmc->board_rev = 0xa03111; /* Revision 1.1, 1 Gb RAM */
-#else
-    rmc->board_rev = 0xb03115; /* Revision 1.5, 2 Gb RAM */
-#endif
-    raspi_machine_class_common_init(mc, rmc->board_rev);
-    mc->init = raspi4b_machine_init;
-}
-
-static const TypeInfo raspi4b_machine_type = {
-    .name           = TYPE_RASPI4B_MACHINE,
-    .parent         = TYPE_RASPI_BASE_MACHINE,
-    .instance_size  = sizeof(Raspi4bMachineState),
-    .class_init     = raspi4b_machine_class_init,
-};
-
-static void raspi4b_machine_register_type(void)
-{
-    type_register_static(&raspi4b_machine_type);
-}
-
-type_init(raspi4b_machine_register_type)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 490234b3b84..5177260d42b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -27,7 +27,7 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubi
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bananapi_m2u.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
-arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files('bcm2838.c', 'raspi4b.c'))
+arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files('bcm2838.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
-- 
2.47.1

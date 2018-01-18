Received: by 10.28.173.206 with SMTP id w197csp6869177wme;
        Thu, 18 Jan 2018 10:42:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBovc0O3F4VeJuSLzla96tYtNRclWkiNCOuiXWXZzGGA2/qpI8dlk08OtT2IvqB/RfouMuNMA
X-Received: by 10.129.106.213 with SMTP id f204mr7204533ywc.198.1516300966799;
        Thu, 18 Jan 2018 10:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516300966; cv=none;
        d=google.com; s=arc-20160816;
        b=YjIjRUrUpxtsMbFJnudO5vHy1TyjYNhBHYNunLGWzGpmcmHhJUT63XUlZbj4TnHSzw
         +xfHihGq2gbLGGZ+ejUBEWVJ0Oh1Z4tw5Fjs0pjIMeFqmJPyypNJJ2uyPfGEfHyMK4aq
         rz7O7a6flf3FQyrtWeFCbm2eDqDNVA2UOGlz0AeJC0Aea2XkUUyUekutU4JlH1Tv+e/q
         v6loFNMj6xMB29KN3gQNI+Q0/F4C1WI1WO64+cmM8toQfGgNlxNmbCmJpQabiFkH4zMf
         52M+XCDuaryIdCp4c/8GfSoa5sOc1XcEydrVZWSKTHQmvqI3n1VT72m46nzqLLX4W3fl
         BN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DVWFHJPUwgQ+3kgB3q991tAQNhIal3fXQX2kPrJ22SU=;
        b=HPBYaNgrgG7KubwfJfpLX/zcwJ8cJegaYB2qN07tvMzIATYas9HBhGdoiqw5qeIZZR
         CnHbCLWK5WlbtTp5TBPmFMcyCwnXEJC7po9oGfGdzmnCOfrDqfq3XdvhY7/ovquGWTRJ
         R+vvAcD0tw8VVzSYqno26I+3GShepxYZGirXF+76PXCbwbL0pI816qE26G71IDvBCxyU
         VRcx3btU4eiklXHUVfeiJFxxHUhDf8lJIZ+Sce9yAFIwwxZh+NNfMpzfj1JFrhql+t3S
         BaZ4nZvkTGEWsjEfKdJsvX+iWnFJyRmO12tFjQj0AjoLGY/BX63SZg1B8OViKtcU242h
         73Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hKnLOdLG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b128si248632ybc.540.2018.01.18.10.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hKnLOdLG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecF9C-0007hm-3b
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:42:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8y-0007el-Ke
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8x-00035b-Hd
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:32 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:38468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF8q-0002zH-GZ; Thu, 18 Jan 2018 13:42:24 -0500
Received: by mail-pg0-x243.google.com with SMTP id y27so8993037pgc.5;
	Thu, 18 Jan 2018 10:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DVWFHJPUwgQ+3kgB3q991tAQNhIal3fXQX2kPrJ22SU=;
	b=hKnLOdLGFI8QNAzSrABbBnyL3Pd25RkEBqqBZixFy3vSpdtPG+QC6nztHACykOfhr/
	0v6uCq7LEaUF+FA6YemlsjwojGfr/RwCtcopfNFk02V4bOD1cEjpNMC6rZEjjpJI2CHO
	xoPFvKsmKMNm0/sYOwS7xwg3nsGk2LMsfp+ntmwAENk6yGdgLKfN74AwwZE8AeBwhSG/
	k2L/sQx/4JaxPS1MUaxYbadlLg/O55tL2nBOiIZsIQrg1PUkMeknDzdZPuKA30o7NDlT
	x057Ynj5ZVsvaE0Vr9W0yMtV6kT3/OUieFLUcvwLWH0CA4G3HUEnx0YBBq/OdiPAhK1b
	mWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=DVWFHJPUwgQ+3kgB3q991tAQNhIal3fXQX2kPrJ22SU=;
	b=E3r7GK4We4mVCYvZ76NMu84G/jsRqHXvEdARZuxqFvX+LdvxV1C0f3Gu66Ug8F1Jip
	7gpVT9M+8ocihwho02IQAMIv1ViBaR0Apb3FzXHpw53HitBoVCSJSMMdb8+Qs+CYW8L6
	R5n73uhJrDryhXQ/Jij3ib5U9+3k/5EWyU5BceMlulKZuRqSol9UIjFrfnxMGQUPx/pJ
	eU1y4VcKI6ZbHJ+AvLmcWpk1j6NnTUKvFNMqAB13zGvRoDis6DSk7yUAMOG/1KEvlfYA
	OB7eB1WF3uhDlb8n7d4CKWi9fxvgyg2Mu7Dakfu5LLwGCV/JGDHh9eVcxDLfbaIDx3rC
	GnNA==
X-Gm-Message-State: AKwxytenM1Mu/SLO4Eo9+oS4hY2UmFSPpNRVKYtgFkUZM5UnQOqSjL8n
	xPYuOTOMCsA64AbEoDhoIi2OAsHeYCk=
X-Received: by 2002:a17:902:8607:: with SMTP id
	f7-v6mr239458plo.273.1516300943251; 
	Thu, 18 Jan 2018 10:42:23 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	n128sm13178495pga.57.2018.01.18.10.42.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:22 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:37:57 -0800
Message-Id: <0a8d39fc3fd536d9470ba74ecfb1ad0b05171ae4.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v6 3/9] xlnx-zynqmp-pmu: Add the CPU and memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EYjodj7TNJH6

Connect the MicroBlaze CPU and the ROM and RAM memory regions.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

V6:
 - Pass initrd instead of kernel to microblaze_load_kernel()
V4:
 - Remove the ZCU102 name
V2:
 - Fix the pmu-cpu name
 - Use err and errp for CPU realise instead of error_fatal

 hw/microblaze/xlnx-zynqmp-pmu.c | 70 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index ac0f78928a..145837b372 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -18,8 +18,11 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "exec/address-spaces.h"
 #include "hw/boards.h"
+#include "hw/qdev-properties.h"
 #include "cpu.h"
+#include "boot.h"
 
 /* Define the PMU device */
 
@@ -27,21 +30,56 @@
 #define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
                                               TYPE_XLNX_ZYNQMP_PMU_SOC)
 
+#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
+#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
+#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
+    MicroBlazeCPU cpu;
 }  XlnxZynqMPPMUSoCState;
 
 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 {
+    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
 
+    object_initialize(&s->cpu, sizeof(s->cpu),
+                      TYPE_MICROBLAZE_CPU);
+    object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
+                              &error_abort);
 }
 
 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
 {
-
+    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(dev);
+    Error *err = NULL;
+
+    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
+                             "base-vectors", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
+                             &error_abort);
+    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
+                            &error_abort);
+    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
@@ -70,7 +108,35 @@ type_init(xlnx_zynqmp_pmu_soc_register_types)
 
 static void xlnx_zynqmp_pmu_init(MachineState *machine)
 {
-
+    XlnxZynqMPPMUSoCState *pmu = g_new0(XlnxZynqMPPMUSoCState, 1);
+    MemoryRegion *address_space_mem = get_system_memory();
+    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
+    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
+
+    /* Create the ROM */
+    memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
+                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
+                                pmu_rom);
+
+    /* Create the RAM */
+    memory_region_init_ram(pmu_ram, NULL, "xlnx-zynqmp-pmu.ram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                                pmu_ram);
+
+    /* Create the PMU device */
+    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQMP_PMU_SOC);
+    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
+                              &error_abort);
+    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
+
+    /* Load the kernel */
+    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
+                           machine->ram_size,
+                           machine->initrd_filename,
+                           machine->dtb,
+                           NULL);
 }
 
 static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
-- 
2.14.1


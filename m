Received: by 10.28.71.27 with SMTP id u27csp3200156wma;
        Mon, 22 Jan 2018 11:52:05 -0800 (PST)
X-Google-Smtp-Source: AH8x227dOVK2QNkbBcnM9/FJDRCgdgCUhfI3KOGZfL0fcAUhxclHa1KX/7fCNgMj668RIkr/f81R
X-Received: by 10.37.115.3 with SMTP id o3mr8772650ybc.211.1516650725015;
        Mon, 22 Jan 2018 11:52:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650725; cv=none;
        d=google.com; s=arc-20160816;
        b=f8baWVLvis5+DRNELIeBvULmSY+tMdnJuGOEeeYe6qVmdOiT6ZfW0QE8+gDVCzxkXX
         FKsJqxP/qzp+1WDCvLOGAD5brvtlUX0qtDZgYvIsZXX3rSJZQl1TtCOavyx1eNP2I9Do
         UuatkuWJ9fHUpKSjOFO+lzHs+X+hmayL7OhpHZcRzB6i9X5RyMQ1pa8Sjzfk65R/qrkf
         voHS4+tLwcLPTjVqp7CAyxVcKrJ5KL+jzE/lchYDpJAhdpSEwryyLzE/cwFKSJ7V4H93
         5+RPtxrZzrxhciVaxvAvisZK30LWN6aL5IQmjIpQpUrjTmx2iVcIrXPoVFg9JglJh+Wz
         XZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DVWFHJPUwgQ+3kgB3q991tAQNhIal3fXQX2kPrJ22SU=;
        b=ZjXC78Iya8sVowLcfiq5kzjxF4DmjfQe3qjoYn77lHCVg8Xmohx5C2OGBM1yusStm+
         Hja6gMv8z8OcfutAy3iXSYvcSN+mOHSD1GbqoUAUx19YDlMOhxoPeFG+GOI6BIOMH1+P
         e9VYMA6AwWkaO9P0yflKk0sKXHn/eQ/XsNZCPAq4A6DnXkK/HuzAwd13bgdcl7VFRoGo
         QHghagq/Cm0FMz0iKGP9vpxnI7vkZCeY/VPlN0dR//UsCxEKX3wCh1y3kQJfedqft3hD
         +dYmgDOZo6xLCEWvD7Tvv+fzRYo6Z6tQqWcHO77w5IwzkPn8+YOPK8w258t2aiVRP4q6
         07kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yb1dqPvN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201si2097467ybd.61.2018.01.22.11.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yb1dqPvN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi8S-00017U-CA
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:52:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4O-0006qw-68
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:47:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4N-0005v3-6x
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:47:52 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:46266)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4M-0005uW-Um; Mon, 22 Jan 2018 14:47:51 -0500
Received: by mail-pg0-x242.google.com with SMTP id s9so7867336pgq.13;
	Mon, 22 Jan 2018 11:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DVWFHJPUwgQ+3kgB3q991tAQNhIal3fXQX2kPrJ22SU=;
	b=Yb1dqPvNCUX16XXvesogWHMrOZHAflF4HDzK1O1ZsAPJTXtKMrBSdDKXC3W08AEMsV
	Nmmc/jtAXwA1zqmRygFQ18nG9tWKBAXWJCgoXU9b+OQo5QEijuBYsqZKcL2A01iK22/Y
	tFd8yJ8FcO/lpGTtw3NqbtiFmP4rJpbdJgiwzeNgB0IR3pR2vCSsgO6f/lck2cyS6UtY
	Dm7hW7HUHqjS0sGr/iMNgo/XL9LvA6GqRfvn1PIGbmEkgSVLLgUDBFVLyNavWFsoPWe9
	uLGYA4sUnP5dJ8+j+friwNawBGNAWE+z2gq7M5TpEMrBojs+LpTpAIOjy1efw1gzajOw
	nEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=DVWFHJPUwgQ+3kgB3q991tAQNhIal3fXQX2kPrJ22SU=;
	b=ZpSXd4p69AiLfm5n4MRm82IlwNgip9HenZOCflO4ltz2SF6R79a6wrHjN/ozbOnl9J
	ekB2J93S+nMLosWQTXK0dn9zNF47cgvC98U3yu7xUuxkdtv4qwwoRm0ZsT75av2fCvzS
	GiyS3bWC7eXhrBccNCV4ISQoKL2AgYe3KWMtEedVKBr+xfBxRCvHqo7vvYu9YxkQ1O3W
	bIocZtdfpwSeYgrY299M9ZDKJi4JU8dMv+ngQdVikpjEpe9Ljn8fJsuwZrWwZfleJJvJ
	KhjVXOr67YNMHDED2PZ0uO77g1/2stJqU7uQm2OpqoBClSKaCselcClAM7s9I5DeL9Q8
	rknA==
X-Gm-Message-State: AKwxytf65Hj9DW8Lk5XBShnB3u6gpKig9qVtMCgnfd7KWp+Ve0fbK+Yx
	s4c6m/NpBzzTxwo/kfDllgHWzBm2
X-Received: by 10.99.142.76 with SMTP id k73mr7629479pge.89.1516650469623;
	Mon, 22 Jan 2018 11:47:49 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	q2sm16863370pgf.10.2018.01.22.11.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:47:48 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:25 -0800
Message-Id: <3a974495bbab40c66cf3f1edc9fbfcee31f3a178.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v7 3/9] xlnx-zynqmp-pmu: Add the CPU and memory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jXv8kg/xV50r

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


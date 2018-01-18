Received: by 10.28.173.206 with SMTP id w197csp6872583wme;
        Thu, 18 Jan 2018 10:46:23 -0800 (PST)
X-Google-Smtp-Source: ACJfBovEUsqyelbB+IVjM4JDNCmoIZDJdivSWDrANdK2O+O2qw5VQ6aTTS/QdlnXoUFvecrEZ1kl
X-Received: by 10.129.73.142 with SMTP id w136mr6775017ywa.437.1516301183273;
        Thu, 18 Jan 2018 10:46:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301183; cv=none;
        d=google.com; s=arc-20160816;
        b=M8y0kIwgQGV9FYr+SN+KyrsHIxrpjPRPv56rsssx9pFQuIQE3Pl8BRrHZgcsOtZd1I
         Y+VgVXcaK5XxNs4fCNlNZjZCvqBjT3Bj8Nb+tWfo0A27MCvJhcwpQVe0B8MjfMsBXXMR
         o0feqiU+0jhySpAJhULL5USD4G/ukIyH488eM05gsUas0kWFwT9+gRy/dMcaCQxYr/w3
         EBYNug4/lpJqiob4BMA+KlyshFRaRczueO1aoTh7F4VNA60+fmjPWrAeG7t3gM0tqd0K
         hfqlV6q9V3u16XR2JdiVWNNc3ejnEFztSGPyr//h6G/zyJGff/wSYBa2vvDdPhh6PsxB
         yNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ziPNeaNVZJqh7F/X7tlD2WjijnRpnQIxmXMcOPgStBE=;
        b=YaAfAjGQKj76BkOjDvFk7bqjcyDVi+Gm8OBKk/Zhn7C5VQq4nyfX8Uyi7R4PCaSqEk
         ZunCdBZDVxD5IXEBW4ZWMn+qQO9yJSmMsnpXOLipJMetQwjWQS4pLjUjg7V9Wv+NMVjl
         rJmD2Rb2JvSwxWelSQOoJF74wPDgB2cJ8rgX8tnrL4bLVuAN37AWOLMNIi2FOllSFEPy
         yOZ+ADpivPJNOaHzrU9wFZpWCWof7p/quI+4ZjIg/FCZ3cBX/uwYvhnYQjPDkSc4evxv
         zW3FRF5tp0bvwvvxoBmThnGzJ5bPY1XL2megOuOZM46i0+rha52C88aXnDnLI3RdGUSz
         L8kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gcGnwR0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v198si248918ybb.518.2018.01.18.10.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:46:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gcGnwR0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFCg-0002Z8-K8
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:46:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF9H-00080i-4y
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF9G-0003Jz-5r
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:51 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:40036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF9C-0003GN-0p; Thu, 18 Jan 2018 13:42:46 -0500
Received: by mail-pf0-x243.google.com with SMTP id i66so15312936pfd.7;
	Thu, 18 Jan 2018 10:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ziPNeaNVZJqh7F/X7tlD2WjijnRpnQIxmXMcOPgStBE=;
	b=gcGnwR0HhCU7rQaKfByhOYiEg3mNhDY8Xn6AVdkMt9n7XXT1diBJ0dwB3QDosf4N+E
	k5hNUUF8mAy6/o3070FOdIVNgnG9/v/XPrOryCbkR6u+DLNZ/bcwOZZjZj4BiIhBFN3Z
	OUv9a3HdvIjGEGiQNNd4pvd4V7R5JiNbUX7Uu2mi+gJJY4JcGiNYduspBIeYjSOvoIwe
	r8qxHkphLYntA9RhIKGlrxEfNfwFaQehAhKc6odzYc1jc3clgEk7A1j+ZDl0FSiaWml7
	f1EF8cPcxH4rTViSDQZHPlMgw9Olb0eOyc1ZROI7qT7UXuojdOZTUZpBXAK+yMuibbo+
	JQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=ziPNeaNVZJqh7F/X7tlD2WjijnRpnQIxmXMcOPgStBE=;
	b=ExOfjcP8fTEh1Kis7t1r6BYmvqYGyV6dt1eHYei421QCS4oop/YO24+PlTobXreRDl
	boA+Aa9KXRCtGCmxhywb69PT2R8LI5n7qQEs49yqytNYXswtljQPu8iLaqgwUtKiqdNU
	xyNdtVuClqPP5n+3wKFtPRoQtMDTtw5VkcBo/aZtKD/oEujX+lQXXSwNSthP1IHWsf8v
	oxGvWQamFAZkaJXXGw4WkTJcKPI4xgVs+xlvjVjFBj2AVcYUzXM9ozfAD2+sILTdkKYZ
	1Cm0nVBB4IdkzJA6cBl09xXH3tQzKF2oc3Q+gcXEyI9brX2T+20PAHEoxklzcej07IqQ
	Cxew==
X-Gm-Message-State: AKwxytdkmWqzH2cxRDpOocR4KkO2pwHuVDGibGOU7MVmulKwtw+c3Hj8
	pQlVFd/VLOFq2icd48BN0BTxNPHKjv0=
X-Received: by 10.99.152.84 with SMTP id l20mr18423580pgo.382.1516300964825;
	Thu, 18 Jan 2018 10:42:44 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	m12sm12686533pga.68.2018.01.18.10.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:43 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:38:18 -0800
Message-Id: <f5426a36d6a0d997d5f6445201861445d8e857da.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v6 8/9] xlnx-zynqmp-pmu: Connect the IPI device
 to the PMU
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
X-TUID: TP+g2ulg0mFp

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
V4:
 - Move the IPI to the machine instead of the SoC

 hw/microblaze/xlnx-zynqmp-pmu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 7312bfe23e..999a5657cf 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/intc/xlnx-pmu-iomod-intc.h"
 
 /* Define the PMU device */
@@ -38,6 +39,15 @@
 
 #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
 
+#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
+
+static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
+};
+static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    19, 20, 21, 22,
+};
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
@@ -136,6 +146,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
     MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
+    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
+    qemu_irq irq[32];
+    int i;
 
     /* Create the ROM */
     memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
@@ -155,6 +168,24 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
                               &error_abort);
     object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
 
+    for (i = 0; i < 32; i++) {
+        irq[i] = qdev_get_gpio_in(DEVICE(&pmu->intc), i);
+    }
+
+    /* Create and connect the IPI device */
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        ipi[i] = g_new0(XlnxZynqMPIPI, 1);
+        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
+        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
+    }
+
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
+    }
+
     /* Load the kernel */
     microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
                            machine->ram_size,
-- 
2.14.1


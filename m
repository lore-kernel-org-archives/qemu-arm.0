Received: by 10.25.44.15 with SMTP id s15csp4681244lfs;
        Tue, 11 Jul 2017 04:17:56 -0700 (PDT)
X-Received: by 10.55.214.135 with SMTP id p7mr8978038qkl.182.1499771876515;
        Tue, 11 Jul 2017 04:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499771876; cv=none;
        d=google.com; s=arc-20160816;
        b=cJyFn1S6vEsO8QOfpxbH+QOSQS9eu1klqOCmulIK0xnUWQ4n4dYzc1bMX6uDYxbTvF
         et+MbtqLyucF829AVDk1h86I7fxa330g8sWwMcZMagItPwTFiE9ptuaki9j/xYN7jTQD
         5gidP0V7wrc54XnxjEABxwDB4TGPFRDwi8Qpc2p2Bf2joOBYmkQ8nf8lDpfBzMU/qpu1
         h/+IY+7hUMG62H8HCdP6U0JozEI6yWdYqmksZprhbObGFCuO6bdegHQsCcD7Hl+H7uCK
         zXx9HQqoh3hsg0PccJbz3KNkvXYsDQdHHtpCOF1p2TH7BaIJU8JtWKIMLsvyw5+PX/Hs
         UKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+2Vp9ciZVb7ZgYIxwtNjGr08igMPtZjtdSvIvtHbhqY=;
        b=N6bfioPiRMQkrAlfpDISK94mTn3+Rrk0qTcfE6FIUwtxlLZJyQ6JxwbAiocYwIpL4x
         l/dbsWms6N7K7e1WBRtLEUZGcwIyjCZykNlvQaxN5M/PEzekgivDQpsHJtaGKR9D2AMt
         ITbJLujWEZaWea99uTNHOVYq1a6wP4mAlZwlayJ4V6oHlS4ZrxjApZokmqIXTPfR6i+Y
         hL6y9Uxz4dNLsQ+nL2rrsVSjUFCNjCjHXOXD6++SN/uW48/o7TTQOHVMcd9j0yLGdCsv
         SAiJAxCaJWohFjW38T2VB9EfYX6NXOhJE1XvRRDABZE7gHFOHvkurP9HZHl+MH91PgSs
         baOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e32si12971983qtb.177.2017.07.11.04.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 04:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUtAa-0007BY-Nh
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 07:17:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAU-00079X-Gy
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:17:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAT-000833-Hl
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:17:26 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUtAT-00081N-9u; Tue, 11 Jul 2017 07:17:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUtAR-00033v-Hh; Tue, 11 Jul 2017 12:17:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 12:17:19 +0100
Message-Id: <1499771839-32518-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 7/7] hw/arm/mps2: Add SCC
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 35EyyuMHfuvM

Add the SCC to the MPS2 board models.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index b1a0df9..3dd61fe 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -34,6 +34,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/char/cmsdk-apb-uart.h"
 #include "hw/timer/cmsdk-apb-timer.h"
+#include "hw/misc/mps2-scc.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
@@ -44,6 +45,7 @@ typedef struct {
     MachineClass parent;
     MPS2FPGAType fpga_type;
     const char *cpu_model;
+    uint32_t scc_id;
 } MPS2MachineClass;
 
 typedef struct {
@@ -60,6 +62,7 @@ typedef struct {
     MemoryRegion blockram_m2;
     MemoryRegion blockram_m3;
     MemoryRegion sram;
+    MPS2SCC scc;
 } MPS2MachineState;
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -114,7 +117,7 @@ static void mps2_common_init(MachineState *machine)
 
     MemoryRegion *system_memory = get_system_memory();
 
-    DeviceState *armv7m;
+    DeviceState *armv7m, *sccdev;
 
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
@@ -298,6 +301,16 @@ static void mps2_common_init(MachineState *machine)
     cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
     cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
 
+    object_initialize(&mms->scc, sizeof(mms->scc), TYPE_MPS2_SCC);
+    sccdev = DEVICE(&mms->scc);
+    qdev_set_parent_bus(armv7m, sysbus_get_default());
+    qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
+    qdev_prop_set_uint32(sccdev, "scc-aid", 0x02000008);
+    qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
+    object_property_set_bool(OBJECT(&mms->scc), true, "realized",
+                             &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
+
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
@@ -320,6 +333,7 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM MPS2 with AN385 FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN385;
     mmc->cpu_model = "cortex-m3";
+    mmc->scc_id = 0x41040000 | (385 << 4);
 }
 
 static void mps2_an511_class_init(ObjectClass *oc, void *data)
@@ -330,6 +344,7 @@ static void mps2_an511_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN511;
     mmc->cpu_model = "cortex-m3";
+    mmc->scc_id = 0x4104000 | (511 << 4);
 }
 
 static const TypeInfo mps2_info = {
-- 
2.7.4


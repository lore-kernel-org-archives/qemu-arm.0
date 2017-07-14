Received: by 10.25.44.15 with SMTP id s15csp762910lfs;
        Fri, 14 Jul 2017 03:54:49 -0700 (PDT)
X-Received: by 10.55.20.144 with SMTP id 16mr10987271qku.51.1500029688984;
        Fri, 14 Jul 2017 03:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500029688; cv=none;
        d=google.com; s=arc-20160816;
        b=FfK7kossZXg48nlCCYIggKSZnxWOXmbnOJGXlcM4ckBflwxSeat0K7HT3LAG4BaRuE
         +VfmFpDJJ5MgdKv5qOxtLYOImKsMQd7zaImOPLt/UVCFCjxJ6KRXfjx5Q0D9ChluUQli
         m4cXrQpRsUWiNMrWaoD1CQGQh+tX9DyLzxFY1YblZvGm2IVzMHXJQlqOBf0tRN8CrO2u
         seFvyalGFUzJ/rtk0RHUBxFGzpmqPXIeCkxYBANxm/G1Zsu9l4h+kLyoioPhQcAX9HPK
         sClx61bNdMU1YDn5UKfgNNX3mjC/lDvvWbMs3Z6nZYIR6JH9DA9qxH51t7f2w0dzhNH3
         wpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1B+F7XrHoM26UDT01XTx3mvZHtTLclp+kIPrBJ5cWZ0=;
        b=yRLsrrkrYEe5qF+GCXsOggBOjeTJbEMRpSvUBMbvSMt6P7rlnCxye0Ufvo1fQzJaCN
         Nuoa1bFJnhyt/WNJXV6P2sIkKMEnckTVCSY2joTQj9pIf8M3mSqspp10NFGEkpf1JABd
         0lpdF0RT7JKbSyxFx7ab4HuW8ue2ACafAPJ288ztzZwgTGybReKkBl4HqFMQH3sR4UzE
         eQ+i3whtUDyADtWxtMaJpH7JFf/sJeGe8Axr7rph3GITqblVZTOoHQd0IY8ubBdCZNnj
         nD0LRgR5NkWG7rJsR/YjOOeEoCLu1bJt5LHy48bLuPi/xuS+2qWQnYSFn7cZo+n3FVHI
         2Sdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si8141148qtg.11.2017.07.14.03.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 03:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyFC-0007MS-7J
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 06:54:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCU-0004zF-0q
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 06:52:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCS-0007Nu-B3
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 06:51:58 -0400
Received: from [2001:8b0:1d0::2] (port=37583 helo=orth.archaic.org.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dVyCJ-00072e-T7; Fri, 14 Jul 2017 06:51:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dVyC3-0007l8-9O; Fri, 14 Jul 2017 11:51:31 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 11:51:25 +0100
Message-Id: <1500029487-14822-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH v2 7/9] hw/arm/mps2: Add SCC
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d62ZiZrOxU4z

Add the SCC to the MPS2 board models.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 0de0ffcb..bdc631a 100644
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
@@ -103,7 +106,7 @@ static void mps2_common_init(MachineState *machine)
     MPS2MachineState *mms = MPS2_MACHINE(machine);
     MPS2MachineClass *mmc = MPS2_MACHINE_GET_CLASS(machine);
     MemoryRegion *system_memory = get_system_memory();
-    DeviceState *armv7m;
+    DeviceState *armv7m, *sccdev;
 
     if (!machine->cpu_model) {
         machine->cpu_model = mmc->cpu_model;
@@ -296,6 +299,16 @@ static void mps2_common_init(MachineState *machine)
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
@@ -318,6 +331,7 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM MPS2 with AN385 FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN385;
     mmc->cpu_model = "cortex-m3";
+    mmc->scc_id = 0x41040000 | (385 << 4);
 }
 
 static void mps2_an511_class_init(ObjectClass *oc, void *data)
@@ -328,6 +342,7 @@ static void mps2_an511_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN511;
     mmc->cpu_model = "cortex-m3";
+    mmc->scc_id = 0x4104000 | (511 << 4);
 }
 
 static const TypeInfo mps2_info = {
-- 
2.7.4


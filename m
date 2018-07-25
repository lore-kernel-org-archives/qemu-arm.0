Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp464808wru;
        Wed, 25 Jul 2018 02:00:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcIRaNZLQjCQbHzKQgHx6hGgqpUQMWfzZnGLPE17laD1ZY/wcQVDApJzA1V1bO9YU+rNKju
X-Received: by 2002:aed:3f17:: with SMTP id p23-v6mr19688246qtf.185.1532509213745;
        Wed, 25 Jul 2018 02:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509213; cv=none;
        d=google.com; s=arc-20160816;
        b=t8+ShYdZvowByDc3U2RtP7JsBFegLOSEtQCwHRCNoLPxFsHM6EvN51cRGn4iCy6+Dd
         qmxD0+vlvFaNE459iG26H5OdSk5QzCxd9bqEfJJ2t4MmtNIAFq6D84PK22KsQ/AtlO2c
         jbnglBToUWUK6CPij+yVl0F4iLYArgPGYZ03LEeaXp//DuIQ0ptXGj95RCLlYq5TgiOM
         /8PqF2W3WJcRBWRPYIMadL7HuoMzGRaJw0h7Cj5np3qBHH+RYw/ZACSPeV5oF0oUg9/H
         nohXuvAU7SiDWtsB44nSmESVixIUq8/NT5Y+izgJirPbyOlkIrRByhGTuw1EtskLHS1W
         6VmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hcYwup13Gj4vTDK83z6ArdoCwc0EASbdcQwwJfnjw68=;
        b=m0RUDe8/PO9c5qTyy3A0I/ThTkRyY0YvAL3/IcRQk3UQE52GoLyA7w4c3ZGwhwKOfM
         +vnPtR/aDI+SQUAkN3JisbBDRAOIV8fAWhzu0hZOrq1sCCmZcj62TB5S4nnBFuA3tqSm
         NYsCru1h1XDBKgjLWHm9ZiDIji0hShrBVY56HlzsY92W+z22aASqz3mHDKg6C3udww/U
         9lwLtz50kIlz1mdqO9fzfvlQUGBWwgWLCDoeGEkUjLaEaAu/WmUAbNzr01oq5BDt/OcC
         HWEWS0gSo0bKvFzIy6Fc1r/YRRxDATw5q1tafWt1BFro+y1zTLxa3+jdyxd9qmRpexNE
         oaTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e28-v6si4466014qtf.175.2018.07.25.02.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 02:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiFeX-000872-5H
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 05:00:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeC-00080B-VY
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 04:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeA-0001qc-1r
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 04:59:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40790 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fiFe9-0001pV-SJ; Wed, 25 Jul 2018 04:59:49 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3414D407572B;
	Wed, 25 Jul 2018 08:59:49 +0000 (UTC)
Received: from localhost (ovpn-117-157.ams2.redhat.com [10.36.117.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B80D02156898;
	Wed, 25 Jul 2018 08:59:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Jul 2018 09:59:38 +0100
Message-Id: <20180725085944.11856-2-stefanha@redhat.com>
In-Reply-To: <20180725085944.11856-1-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 25 Jul 2018 08:59:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 25 Jul 2018 08:59:49 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 1/7] hw/arm: rename armv7m_load_kernel()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TQE4HkGm2nqm

ARMv6-M and ARMv8-M need the same kernel loading functionality as
ARMv7-M.  Rename armv7m_load_kernel() to arm_m_profile_load_kernel() so
it's clear that this function isn't specific to ARMv7-M.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/Makefile.objs            |  1 +
 include/hw/arm/arm.h            | 11 +++--
 hw/arm/arm-m-profile.c          | 81 +++++++++++++++++++++++++++++++++
 hw/arm/armv7m.c                 | 60 ------------------------
 hw/arm/mps2-tz.c                |  3 +-
 hw/arm/mps2.c                   |  4 +-
 hw/arm/msf2-som.c               |  4 +-
 hw/arm/netduino2.c              |  4 +-
 hw/arm/stellaris.c              |  3 +-
 default-configs/arm-softmmu.mak |  1 +
 10 files changed, 99 insertions(+), 73 deletions(-)
 create mode 100644 hw/arm/arm-m-profile.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index d51fcecaf2..2c43d34c64 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -16,6 +16,7 @@ obj-$(CONFIG_STRONGARM) += collie.o
 obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
 obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
 
+obj-$(CONFIG_ARM_M_PROFILE) += arm-m-profile.o
 obj-$(CONFIG_ARM_V7M) += armv7m.o
 obj-$(CONFIG_EXYNOS4) += exynos4210.o
 obj-$(CONFIG_PXA2XX) += pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index ffed39252d..2b919e57ee 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -24,16 +24,17 @@ typedef enum {
 } arm_endianness;
 
 /**
- * armv7m_load_kernel:
+ * arm_m_profile_load_kernel:
  * @cpu: CPU
  * @kernel_filename: file to load
- * @mem_size: mem_size: maximum image size to load
+ * @mem_size: maximum image size to load
  *
- * Load the guest image for an ARMv7M system. This must be called by
- * any ARMv7M board. (This is necessary to ensure that the CPU resets
+ * Load the guest image for an ARM M Profile system. This must be called by
+ * any ARM M Profile board. (This is necessary to ensure that the CPU resets
  * correctly on system reset, as well as for kernel loading.)
  */
-void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
+void arm_m_profile_load_kernel(ARMCPU *cpu, const char *kernel_filename,
+                               int mem_size);
 
 /* arm_boot.c */
 struct arm_boot_info {
diff --git a/hw/arm/arm-m-profile.c b/hw/arm/arm-m-profile.c
new file mode 100644
index 0000000000..262706ed62
--- /dev/null
+++ b/hw/arm/arm-m-profile.c
@@ -0,0 +1,81 @@
+/*
+ * ARM M Profile System emulation.
+ *
+ * Copyright (C) 2018 Red Hat, Inc.
+ *
+ * Copyright (c) 2006-2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/sysbus.h"
+#include "hw/arm/arm.h"
+#include "hw/loader.h"
+#include "elf.h"
+#include "sysemu/qtest.h"
+#include "qemu/error-report.h"
+#include "exec/address-spaces.h"
+
+static void arm_m_profile_reset(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    cpu_reset(CPU(cpu));
+}
+
+void arm_m_profile_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
+{
+    int image_size;
+    uint64_t entry;
+    uint64_t lowaddr;
+    int big_endian;
+    AddressSpace *as;
+    int asidx;
+    CPUState *cs = CPU(cpu);
+
+#ifdef TARGET_WORDS_BIGENDIAN
+    big_endian = 1;
+#else
+    big_endian = 0;
+#endif
+
+    if (!kernel_filename && !qtest_enabled()) {
+        error_report("Guest image must be specified (using -kernel)");
+        exit(1);
+    }
+
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
+        asidx = ARMASIdx_S;
+    } else {
+        asidx = ARMASIdx_NS;
+    }
+    as = cpu_get_address_space(cs, asidx);
+
+    if (kernel_filename) {
+        image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
+                                 NULL, big_endian, EM_ARM, 1, 0, as);
+        if (image_size < 0) {
+            image_size = load_image_targphys_as(kernel_filename, 0,
+                                                mem_size, as);
+            lowaddr = 0;
+        }
+        if (image_size < 0) {
+            error_report("Could not load kernel '%s'", kernel_filename);
+            exit(1);
+        }
+    }
+
+    /* CPU objects (unlike devices) are not automatically reset on system
+     * reset, so we must always register a handler to do so. Unlike
+     * A-profile CPUs, we don't need to do anything special in the
+     * handler to arrange that it starts correctly.
+     * This is arguably the wrong place to do this, but it matches the
+     * way A-profile does it. Note that this means that every M profile
+     * board must call this function!
+     */
+    qemu_register_reset(arm_m_profile_reset, cpu);
+}
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 6b07666057..7405a1ec69 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -258,66 +258,6 @@ static const TypeInfo armv7m_info = {
     .class_init = armv7m_class_init,
 };
 
-static void armv7m_reset(void *opaque)
-{
-    ARMCPU *cpu = opaque;
-
-    cpu_reset(CPU(cpu));
-}
-
-void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
-{
-    int image_size;
-    uint64_t entry;
-    uint64_t lowaddr;
-    int big_endian;
-    AddressSpace *as;
-    int asidx;
-    CPUState *cs = CPU(cpu);
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    big_endian = 1;
-#else
-    big_endian = 0;
-#endif
-
-    if (!kernel_filename && !qtest_enabled()) {
-        error_report("Guest image must be specified (using -kernel)");
-        exit(1);
-    }
-
-    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
-        asidx = ARMASIdx_S;
-    } else {
-        asidx = ARMASIdx_NS;
-    }
-    as = cpu_get_address_space(cs, asidx);
-
-    if (kernel_filename) {
-        image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
-                                 NULL, big_endian, EM_ARM, 1, 0, as);
-        if (image_size < 0) {
-            image_size = load_image_targphys_as(kernel_filename, 0,
-                                                mem_size, as);
-            lowaddr = 0;
-        }
-        if (image_size < 0) {
-            error_report("Could not load kernel '%s'", kernel_filename);
-            exit(1);
-        }
-    }
-
-    /* CPU objects (unlike devices) are not automatically reset on system
-     * reset, so we must always register a handler to do so. Unlike
-     * A-profile CPUs, we don't need to do anything special in the
-     * handler to arrange that it starts correctly.
-     * This is arguably the wrong place to do this, but it matches the
-     * way A-profile does it. Note that this means that every M profile
-     * board must call this function!
-     */
-    qemu_register_reset(armv7m_reset, cpu);
-}
-
 static Property bitband_properties[] = {
     DEFINE_PROP_UINT32("base", BitBandState, base, 0),
     DEFINE_PROP_LINK("source-memory", BitBandState, source_memory,
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 22180c56fb..af10ee0cc9 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -487,7 +487,8 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
+    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                              0x400000);
 }
 
 static void mps2tz_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index c3946da317..bcc7070104 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -315,8 +315,8 @@ static void mps2_common_init(MachineState *machine)
 
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       0x400000);
+    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                              0x400000);
 }
 
 static void mps2_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 2432b5e935..cb21ced472 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -91,8 +91,8 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
     sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       soc->envm_size);
+    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                              soc->envm_size);
 }
 
 static void emcraft_sf2_machine_init(MachineClass *mc)
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index f936017d4a..e18d377f94 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -37,8 +37,8 @@ static void netduino2_init(MachineState *machine)
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       FLASH_SIZE);
+    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                              FLASH_SIZE);
 }
 
 static void netduino2_machine_init(MachineClass *mc)
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index dc521b4a5a..68e52367c0 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1440,7 +1440,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
     create_unimplemented_device("flash-control", 0x400fd000, 0x1000);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, flash_size);
+    arm_m_profile_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename,
+                              flash_size);
 }
 
 /* FIXME: Figure out how to generate these from stellaris_boards.  */
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 834d45cfaf..e704cb6e34 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -48,6 +48,7 @@ CONFIG_ARM11MPCORE=y
 CONFIG_A9MPCORE=y
 CONFIG_A15MPCORE=y
 
+CONFIG_ARM_M_PROFILE=y
 CONFIG_ARM_V7M=y
 CONFIG_NETDUINO2=y
 
-- 
2.17.1


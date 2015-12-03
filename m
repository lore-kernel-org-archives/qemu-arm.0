Received: by 10.182.158.201 with SMTP id ww9csp3417342obb;
        Wed, 2 Dec 2015 16:32:30 -0800 (PST)
X-Received: by 10.140.42.70 with SMTP id b64mr7839505qga.62.1449102750288;
        Wed, 02 Dec 2015 16:32:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si2535027qkh.31.2015.12.02.16.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hoz-0003ut-Hs
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:32:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcD-0004Z2-Ui
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcC-00025k-69
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:17 -0500
Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231]:33501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4HcC-00025S-0M; Wed, 02 Dec 2015 19:19:16 -0500
Received: by qgea14 with SMTP id a14so48165713qge.0;
	Wed, 02 Dec 2015 16:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+uXWiAZg4TXvosnwzx726u/EpHxFgXEbb0lZyh9Lqb8=;
	b=B5CfTWRvRuglwMA7nF5R158YZpfH5LcNYQf0KIT3Si+iqCSA51hRf8yWNMYJNgFOTM
	R/aXkLcdWm2s99YOmjXzVCvgC1FtJRa0i0sQ2gR13LMRm2sWDKkURiEQA9h2QcLL8icV
	E1cfn8a9qAXpm/huFNs9Cwvk4bFcAyKTQUcY+UzyI/ndK+IMsJVb+NmXbJol9h6H9By0
	2780SQly+GaIneYgVzFS5xqnKUJ9l3GUCgVYmhl9N2de1RIPy67w+Vl4vzBono36u+kC
	JdqO2VffRApfJGbmWhzaeXy0zhRWaeDUGVbZ7sst+PPHYybHmIgZngaeOq2Cdj0hW7b7
	gbIQ==
X-Received: by 10.140.109.100 with SMTP id k91mr7834296qgf.23.1449101955636;
	Wed, 02 Dec 2015 16:19:15 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:15 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:51 -0500
Message-Id: <1449101933-24928-25-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 24/26] armv7m: split armv7m_init in two parts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PVtT5ojXDF4G

Separate init and realize phases to allow
board code the opportunity to set properties
on the cpu and nvic.

Assign names for cpu, nvic, and bitband regions.

update stellaris and stm32 board code accordingly.
---
 hw/arm/armv7m.c        | 42 +++++++++++++++++++++++++++---------------
 hw/arm/stellaris.c     | 18 +++++-------------
 hw/arm/stm32f205_soc.c |  6 ++++--
 include/hw/arm/arm.h   |  4 ++--
 4 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 68146de..fb805fe 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -144,11 +144,15 @@ static void armv7m_bitband_init(void)
 
     dev = qdev_create(NULL, TYPE_BITBAND);
     qdev_prop_set_uint32(dev, "base", 0x20000000);
+    object_property_add_child(qdev_get_machine(), "bitband22",
+                              &dev->parent_obj, &error_fatal);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x22000000);
 
     dev = qdev_create(NULL, TYPE_BITBAND);
     qdev_prop_set_uint32(dev, "base", 0x40000000);
+    object_property_add_child(qdev_get_machine(), "bitband42",
+                              &dev->parent_obj, &error_fatal);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x42000000);
 }
@@ -162,39 +166,48 @@ static void armv7m_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-/* Init CPU and memory for a v7-M based board.
-   mem_size is in bytes.
-   Returns the NVIC array.  */
-
-DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
-                      const char *kernel_filename, const char *cpu_model)
+void armv7m_init(const char *cpu_model)
 {
     ARMCPU *cpu;
     CPUARMState *env;
     DeviceState *nvic;
-    int image_size;
-    uint64_t entry;
-    uint64_t lowaddr;
-    int big_endian;
 
     if (cpu_model == NULL) {
-	cpu_model = "cortex-m3";
+        cpu_model = "cortex-m3";
     }
-    cpu = cpu_arm_init(cpu_model);
+    cpu = ARM_CPU(cpu_generic_init_unrealized(TYPE_ARM_CPU, cpu_model));
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
         exit(1);
     }
     env = &cpu->env;
 
+    object_property_add_child(qdev_get_machine(), "cpu[*]", OBJECT(cpu),
+                              &error_fatal);
+
     armv7m_bitband_init();
 
     nvic = qdev_create(NULL, "armv7m_nvic");
-    qdev_prop_set_uint32(nvic, "num-irq", num_irq);
+    object_property_add_child(qdev_get_machine(), "nvic", &nvic->parent_obj,
+                              &error_fatal);
     env->nvic = nvic;
-    qdev_init_nofail(nvic);
+
     sysbus_connect_irq(SYS_BUS_DEVICE(nvic), 0,
                        qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
+}
+
+
+void armv7m_realize(int mem_size, const char *kernel_filename)
+{
+    ARMCPU *cpu = ARM_CPU(first_cpu);
+    DeviceState *nvic = DEVICE(object_resolve_path("/machine/nvic", NULL));
+    int image_size;
+    uint64_t entry;
+    uint64_t lowaddr;
+    int big_endian;
+
+    qdev_init_nofail(DEVICE(cpu));
+    qdev_init_nofail(nvic);
 
 #ifdef TARGET_WORDS_BIGENDIAN
     big_endian = 1;
@@ -221,7 +234,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
     }
 
     qemu_register_reset(armv7m_reset, cpu);
-    return nvic;
 }
 
 static Property bitband_properties[] = {
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 7e56f02..3f12b57 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1249,23 +1249,15 @@ static void stellaris_init(const char *kernel_filename, const char *cpu_model,
     vmstate_register_ram_global(sram);
     memory_region_add_subregion(system_memory, 0x20000000, sram);
 
-    nvic = armv7m_init(system_memory, flash_size, NUM_IRQ_LINES,
-                      kernel_filename, cpu_model);
+    armv7m_init(cpu_model);
+    qdev_prop_set_uint32(&first_cpu->parent_obj, "pmsav7-dregion", 8);
+    nvic = DEVICE(object_resolve_path("/machine/nvic", NULL));
+    qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
+    armv7m_realize(flash_size, kernel_filename);
 
     qdev_connect_gpio_out_named(nvic, "SYSRESETREQ", 0,
                                 qemu_allocate_irq(&do_sys_reset, NULL, 0));
 
-    {
-        /* hack to change the number of MPU regions.
-         * Less of a hack than messing with cpu_model string.
-         * Safe as long as the number is being reduced.
-         */
-        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
-        assert(cpu->pmsav7_dregion>=8);
-        cpu->pmsav7_dregion = 8;
-    }
-
-
     if (board->dc1 & (1 << 16)) {
         dev = sysbus_create_varargs(TYPE_STELLARIS_ADC, 0x40038000,
                                     qdev_get_gpio_in(nvic, 14),
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 3f99340..01ae1e7 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -87,8 +87,10 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     vmstate_register_ram_global(sram);
     memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
 
-    nvic = armv7m_init(get_system_memory(), FLASH_SIZE, 96,
-                       s->kernel_filename, s->cpu_model);
+    armv7m_init(s->cpu_model);
+    nvic = DEVICE(object_resolve_path("/machine/nvic", NULL));
+    qdev_prop_set_uint32(nvic, "num-irq", 96);
+    armv7m_realize(FLASH_SIZE, s->kernel_filename);
 
     /* System configuration controller */
     syscfgdev = DEVICE(&s->syscfg);
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index c26b0e3..2d81ff1 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -17,8 +17,8 @@
 #include "cpu.h"
 
 /* armv7m.c */
-DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
-                      const char *kernel_filename, const char *cpu_model);
+void armv7m_init(const char *cpu_model);
+void armv7m_realize(int mem_size, const char *kernel_filename);
 
 /*
  * struct used as a parameter of the arm_load_kernel machine init
-- 
2.1.4


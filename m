Received: by 10.182.158.201 with SMTP id ww9csp379951obb;
        Thu, 10 Dec 2015 02:19:32 -0800 (PST)
X-Received: by 10.140.95.109 with SMTP id h100mr14138336qge.8.1449742772134;
        Thu, 10 Dec 2015 02:19:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n88si14144522qkh.48.2015.12.10.02.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 02:19:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6yJv-0004b4-Lv
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 05:19:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a6yJr-0004WB-O7
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:19:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a6yJo-0004YO-F2
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:19:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a6yJo-0004YH-5P; Thu, 10 Dec 2015 05:19:24 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D4F2FA0B40;
	Thu, 10 Dec 2015 10:19:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAAJLg5025492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 05:19:22 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5DED6303F916; Thu, 10 Dec 2015 11:19:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 10 Dec 2015 11:19:20 +0100
Message-Id: <1449742760-6310-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-arm] [PATCH] Use error_fatal to simplify obvious fatal errors
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gxAvQBet1m02

Done with this admittedly crude Coccinelle semantic patch with manual
burial of dead Error * variables squashed in:

    @@
    identifier FUN;
    expression ERR, EC;
    @@
    -    FUN(&ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    FUN(&error_fatal);
    @@
    identifier FUN;
    expression ARG1, ERR, EC;
    @@
    -    FUN(ARG1, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    FUN(ARG1, &error_fatal);
    @@
    identifier FUN;
    expression ARG1, ARG2, ERR, EC;
    @@
    -    FUN(ARG1, ARG2, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    FUN(ARG1, ARG2, &error_fatal);
    @@
    identifier FUN;
    expression ARG1, ARG2, ARG3, ERR, EC;
    @@
    -    FUN(ARG1, ARG2, ARG3, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    FUN(ARG1, ARG2, ARG3, &error_fatal);
    @@
    identifier FUN;
    expression RET, ERR, EC;
    @@
    -    RET = FUN(&ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    RET = FUN(&error_fatal);
    @@
    identifier FUN;
    expression RET, ARG1, ERR, EC;
    @@
    -    RET = FUN(ARG1, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    RET = FUN(ARG1, &error_fatal);
    @@
    identifier FUN;
    expression RET, ARG1, ARG2, ERR, EC;
    @@
    -    RET = FUN(ARG1, ARG2, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    RET = FUN(ARG1, ARG2, &error_fatal);
    @@
    identifier FUN;
    expression RET, ARG1, ARG2, ARG3, ERR, EC;
    @@
    -    RET = FUN(ARG1, ARG2, ARG3, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    RET = FUN(ARG1, ARG2, ARG3, &error_fatal);
    @@
    type T;
    identifier FUN, RET;
    expression ERR, EC;
    @@
    -    T RET = FUN(&ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    T RET = FUN(&error_fatal);
    @@
    type T;
    identifier FUN, RET;
    expression ARG1, ERR, EC;
    @@
    -    T RET = FUN(ARG1, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    T RET = FUN(ARG1, &error_fatal);
    @@
    type T;
    identifier FUN, RET;
    expression ARG1, ARG2, ERR, EC;
    @@
    -    T RET = FUN(ARG1, ARG2, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    T RET = FUN(ARG1, ARG2, &error_fatal);
    @@
    type T;
    identifier FUN, RET;
    expression ARG1, ARG2, ARG3, ERR, EC;
    @@
    -    T RET = FUN(ARG1, ARG2, ARG3, &ERR);
    -    if (ERR != NULL) {
    -        error_report_err(ERR);
    -        exit(EC);
    -    }
    +    T RET = FUN(ARG1, ARG2, ARG3, &error_fatal);

Cc: qemu-arm@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/exynos4210.c              | 13 ++----------
 hw/arm/highbank.c                |  7 +------
 hw/arm/integratorcp.c            | 13 ++----------
 hw/arm/realview.c                | 20 ++++---------------
 hw/arm/versatilepb.c             | 13 ++----------
 hw/arm/vexpress.c                |  7 +------
 hw/arm/xilinx_zynq.c             | 31 +++++++++--------------------
 hw/char/serial.c                 | 14 ++-----------
 hw/core/qdev-properties-system.c |  8 +-------
 hw/i386/pc.c                     | 14 ++-----------
 hw/smbios/smbios.c               | 43 +++++++---------------------------------
 numa.c                           |  8 ++------
 vl.c                             | 21 +++-----------------
 13 files changed, 38 insertions(+), 174 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index d934980..79b7c5a 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -150,27 +150,18 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
 
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
         Object *cpuobj = object_new(object_class_get_name(cpu_oc));
-        Error *err = NULL;
 
         /* By default A9 CPUs have EL3 enabled.  This board does not currently
          * support EL3 so the CPU EL3 property is disabled before realization.
          */
         if (object_property_find(cpuobj, "has_el3", NULL)) {
-            object_property_set_bool(cpuobj, false, "has_el3", &err);
-            if (err) {
-                error_report_err(err);
-                exit(1);
-            }
+            object_property_set_bool(cpuobj, false, "has_el3", &error_fatal);
         }
 
         s->cpu[n] = ARM_CPU(cpuobj);
         object_property_set_int(cpuobj, EXYNOS4210_SMP_PRIVATE_BASE_ADDR,
                                 "reset-cbar", &error_abort);
-        object_property_set_bool(cpuobj, true, "realized", &err);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+        object_property_set_bool(cpuobj, true, "realized", &error_fatal);
     }
 
     /*** IRQs ***/
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 85ae69e..a0a5a06 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -279,7 +279,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         ObjectClass *oc = cpu_class_by_name(TYPE_ARM_CPU, cpu_model);
         Object *cpuobj;
         ARMCPU *cpu;
-        Error *err = NULL;
 
         cpuobj = object_new(object_class_get_name(oc));
         cpu = ARM_CPU(cpuobj);
@@ -297,11 +296,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
             object_property_set_int(cpuobj, MPCORE_PERIPHBASE,
                                     "reset-cbar", &error_abort);
         }
-        object_property_set_bool(cpuobj, true, "realized", &err);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+        object_property_set_bool(cpuobj, true, "realized", &error_fatal);
         cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ);
         cpu_fiq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_FIQ);
     }
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 421bde9..96dedce 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -533,7 +533,6 @@ static void integratorcp_init(MachineState *machine)
     qemu_irq pic[32];
     DeviceState *dev, *sic, *icp;
     int i;
-    Error *err = NULL;
 
     if (!cpu_model) {
         cpu_model = "arm926";
@@ -552,18 +551,10 @@ static void integratorcp_init(MachineState *machine)
      * realization.
      */
     if (object_property_find(cpuobj, "has_el3", NULL)) {
-        object_property_set_bool(cpuobj, false, "has_el3", &err);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+        object_property_set_bool(cpuobj, false, "has_el3", &error_fatal);
     }
 
-    object_property_set_bool(cpuobj, true, "realized", &err);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
+    object_property_set_bool(cpuobj, true, "realized", &error_fatal);
 
     cpu = ARM_CPU(cpuobj);
 
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index e14828d..2d6952c 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -99,33 +99,21 @@ static void realview_init(MachineState *machine,
 
     for (n = 0; n < smp_cpus; n++) {
         Object *cpuobj = object_new(object_class_get_name(cpu_oc));
-        Error *err = NULL;
 
         /* By default A9,A15 and ARM1176 CPUs have EL3 enabled.  This board
          * does not currently support EL3 so the CPU EL3 property is disabled
          * before realization.
          */
         if (object_property_find(cpuobj, "has_el3", NULL)) {
-            object_property_set_bool(cpuobj, false, "has_el3", &err);
-            if (err) {
-                error_report_err(err);
-                exit(1);
-            }
+            object_property_set_bool(cpuobj, false, "has_el3", &error_fatal);
         }
 
         if (is_pb && is_mpcore) {
-            object_property_set_int(cpuobj, periphbase, "reset-cbar", &err);
-            if (err) {
-                error_report_err(err);
-                exit(1);
-            }
+            object_property_set_int(cpuobj, periphbase, "reset-cbar",
+                                    &error_fatal);
         }
 
-        object_property_set_bool(cpuobj, true, "realized", &err);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+        object_property_set_bool(cpuobj, true, "realized", &error_fatal);
 
         cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpuobj), ARM_CPU_IRQ);
     }
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 912c290..70eefe9 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -192,7 +192,6 @@ static void versatile_init(MachineState *machine, int board_id)
     int n;
     int done_smc = 0;
     DriveInfo *dinfo;
-    Error *err = NULL;
 
     if (!machine->cpu_model) {
         machine->cpu_model = "arm926";
@@ -211,18 +210,10 @@ static void versatile_init(MachineState *machine, int board_id)
      * realization.
      */
     if (object_property_find(cpuobj, "has_el3", NULL)) {
-        object_property_set_bool(cpuobj, false, "has_el3", &err);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+        object_property_set_bool(cpuobj, false, "has_el3", &error_fatal);
     }
 
-    object_property_set_bool(cpuobj, true, "realized", &err);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
+    object_property_set_bool(cpuobj, true, "realized", &error_fatal);
 
     cpu = ARM_CPU(cpuobj);
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 058abbd..ea9a984 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -211,7 +211,6 @@ static void init_cpus(const char *cpu_model, const char *privdev,
     /* Create the actual CPUs */
     for (n = 0; n < smp_cpus; n++) {
         Object *cpuobj = object_new(object_class_get_name(cpu_oc));
-        Error *err = NULL;
 
         if (!secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
@@ -221,11 +220,7 @@ static void init_cpus(const char *cpu_model, const char *privdev,
             object_property_set_int(cpuobj, periphbase,
                                     "reset-cbar", &error_abort);
         }
-        object_property_set_bool(cpuobj, true, "realized", &err);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+        object_property_set_bool(cpuobj, true, "realized", &error_fatal);
     }
 
     /* Create the private peripheral devices (including the GIC);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1c1a445..409f5f0 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -156,7 +156,6 @@ static void zynq_init(MachineState *machine)
     DeviceState *dev;
     SysBusDevice *busdev;
     qemu_irq pic[64];
-    Error *err = NULL;
     int n;
 
     if (!cpu_model) {
@@ -171,29 +170,17 @@ static void zynq_init(MachineState *machine)
      * realization.
      */
     if (object_property_find(OBJECT(cpu), "has_el3", NULL)) {
-        object_property_set_bool(OBJECT(cpu), false, "has_el3", &err);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+        object_property_set_bool(OBJECT(cpu), false, "has_el3", &error_fatal);
     }
 
-    object_property_set_int(OBJECT(cpu), ZYNQ_BOARD_MIDR, "midr", &err);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
-
-    object_property_set_int(OBJECT(cpu), MPCORE_PERIPHBASE, "reset-cbar", &err);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
-    object_property_set_bool(OBJECT(cpu), true, "realized", &err);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
+    object_property_set_int(OBJECT(cpu), ZYNQ_BOARD_MIDR, "midr",
+                            &error_fatal);object_property_set_int(OBJECT(cpu),
+                                                                  MPCORE_PERIPHBASE,
+                                                                  "reset-cbar",
+                                                                  &error_fatal);object_property_set_bool(OBJECT(cpu),
+                                                                                                         true,
+                                                                                                         "realized",
+                                                                                                         &error_fatal);
 
     /* max 2GB ram */
     if (ram_size > 0x80000000) {
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 513d73c..566e9ef 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -888,18 +888,13 @@ SerialState *serial_init(int base, qemu_irq irq, int baudbase,
                          CharDriverState *chr, MemoryRegion *system_io)
 {
     SerialState *s;
-    Error *err = NULL;
 
     s = g_malloc0(sizeof(SerialState));
 
     s->irq = irq;
     s->baudbase = baudbase;
     s->chr = chr;
-    serial_realize_core(s, &err);
-    if (err != NULL) {
-        error_report_err(err);
-        exit(1);
-    }
+    serial_realize_core(s, &error_fatal);
 
     vmstate_register(NULL, base, &vmstate_serial, s);
 
@@ -949,7 +944,6 @@ SerialState *serial_mm_init(MemoryRegion *address_space,
                             CharDriverState *chr, enum device_endian end)
 {
     SerialState *s;
-    Error *err = NULL;
 
     s = g_malloc0(sizeof(SerialState));
 
@@ -958,11 +952,7 @@ SerialState *serial_mm_init(MemoryRegion *address_space,
     s->baudbase = baudbase;
     s->chr = chr;
 
-    serial_realize_core(s, &err);
-    if (err != NULL) {
-        error_report_err(err);
-        exit(1);
-    }
+    serial_realize_core(s, &error_fatal);
     vmstate_register(NULL, base, &vmstate_serial, s);
 
     memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 921e799..d515e99 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -367,13 +367,7 @@ void qdev_prop_set_drive(DeviceState *dev, const char *name,
 void qdev_prop_set_drive_nofail(DeviceState *dev, const char *name,
                                 BlockBackend *value)
 {
-    Error *err = NULL;
-
-    qdev_prop_set_drive(dev, name, value, &err);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
+    qdev_prop_set_drive(dev, name, value, &error_fatal);
 }
 
 void qdev_prop_set_chr(DeviceState *dev, const char *name,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5e20e07..3025ca5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -433,7 +433,6 @@ void pc_cmos_init(PCMachineState *pcms,
 {
     int val;
     static pc_cmos_init_late_arg arg;
-    Error *local_err = NULL;
 
     /* various important CMOS locations needed by PC/Bochs bios */
 
@@ -481,11 +480,7 @@ void pc_cmos_init(PCMachineState *pcms,
     object_property_set_link(OBJECT(pcms), OBJECT(s),
                              "rtc_state", &error_abort);
 
-    set_boot_dev(s, MACHINE(pcms)->boot_order, &local_err);
-    if (local_err) {
-        error_report_err(local_err);
-        exit(1);
-    }
+    set_boot_dev(s, MACHINE(pcms)->boot_order, &error_fatal);
 
     val = 0;
     val |= 0x02; /* FPU is there */
@@ -1122,7 +1117,6 @@ void pc_cpus_init(PCMachineState *pcms)
     int i;
     X86CPU *cpu = NULL;
     MachineState *machine = MACHINE(pcms);
-    Error *error = NULL;
     unsigned long apic_id_limit;
 
     /* init CPUs */
@@ -1143,11 +1137,7 @@ void pc_cpus_init(PCMachineState *pcms)
 
     for (i = 0; i < smp_cpus; i++) {
         cpu = pc_new_cpu(machine->cpu_model, x86_cpu_apic_id_from_index(i),
-                         &error);
-        if (error) {
-            error_report_err(error);
-            exit(1);
-        }
+                         &error_fatal);
         object_unref(OBJECT(cpu));
     }
 
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index b81a1d3..a3e575a 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -937,7 +937,6 @@ static void save_opt(const char **dest, QemuOpts *opts, const char *name)
 
 void smbios_entry_add(QemuOpts *opts)
 {
-    Error *local_err = NULL;
     const char *val;
 
     assert(!smbios_immutable);
@@ -948,11 +947,7 @@ void smbios_entry_add(QemuOpts *opts)
         int size;
         struct smbios_table *table; /* legacy mode only */
 
-        qemu_opts_validate(opts, qemu_smbios_file_opts, &local_err);
-        if (local_err) {
-            error_report_err(local_err);
-            exit(1);
-        }
+        qemu_opts_validate(opts, qemu_smbios_file_opts, &error_fatal);
 
         size = get_image_size(val);
         if (size == -1 || size < sizeof(struct smbios_structure_header)) {
@@ -1034,11 +1029,7 @@ void smbios_entry_add(QemuOpts *opts)
 
         switch (type) {
         case 0:
-            qemu_opts_validate(opts, qemu_smbios_type0_opts, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            qemu_opts_validate(opts, qemu_smbios_type0_opts, &error_fatal);
             save_opt(&type0.vendor, opts, "vendor");
             save_opt(&type0.version, opts, "version");
             save_opt(&type0.date, opts, "date");
@@ -1054,11 +1045,7 @@ void smbios_entry_add(QemuOpts *opts)
             }
             return;
         case 1:
-            qemu_opts_validate(opts, qemu_smbios_type1_opts, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            qemu_opts_validate(opts, qemu_smbios_type1_opts, &error_fatal);
             save_opt(&type1.manufacturer, opts, "manufacturer");
             save_opt(&type1.product, opts, "product");
             save_opt(&type1.version, opts, "version");
@@ -1076,11 +1063,7 @@ void smbios_entry_add(QemuOpts *opts)
             }
             return;
         case 2:
-            qemu_opts_validate(opts, qemu_smbios_type2_opts, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            qemu_opts_validate(opts, qemu_smbios_type2_opts, &error_fatal);
             save_opt(&type2.manufacturer, opts, "manufacturer");
             save_opt(&type2.product, opts, "product");
             save_opt(&type2.version, opts, "version");
@@ -1089,11 +1072,7 @@ void smbios_entry_add(QemuOpts *opts)
             save_opt(&type2.location, opts, "location");
             return;
         case 3:
-            qemu_opts_validate(opts, qemu_smbios_type3_opts, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            qemu_opts_validate(opts, qemu_smbios_type3_opts, &error_fatal);
             save_opt(&type3.manufacturer, opts, "manufacturer");
             save_opt(&type3.version, opts, "version");
             save_opt(&type3.serial, opts, "serial");
@@ -1101,11 +1080,7 @@ void smbios_entry_add(QemuOpts *opts)
             save_opt(&type3.sku, opts, "sku");
             return;
         case 4:
-            qemu_opts_validate(opts, qemu_smbios_type4_opts, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            qemu_opts_validate(opts, qemu_smbios_type4_opts, &error_fatal);
             save_opt(&type4.sock_pfx, opts, "sock_pfx");
             save_opt(&type4.manufacturer, opts, "manufacturer");
             save_opt(&type4.version, opts, "version");
@@ -1114,11 +1089,7 @@ void smbios_entry_add(QemuOpts *opts)
             save_opt(&type4.part, opts, "part");
             return;
         case 17:
-            qemu_opts_validate(opts, qemu_smbios_type17_opts, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            qemu_opts_validate(opts, qemu_smbios_type17_opts, &error_fatal);
             save_opt(&type17.loc_pfx, opts, "loc_pfx");
             save_opt(&type17.bank, opts, "bank");
             save_opt(&type17.manufacturer, opts, "manufacturer");
diff --git a/numa.c b/numa.c
index fdfe294..bbdf5b8 100644
--- a/numa.c
+++ b/numa.c
@@ -450,17 +450,13 @@ void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
 
     memory_region_init(mr, owner, name, ram_size);
     for (i = 0; i < MAX_NODES; i++) {
-        Error *local_err = NULL;
         uint64_t size = numa_info[i].node_mem;
         HostMemoryBackend *backend = numa_info[i].node_memdev;
         if (!backend) {
             continue;
         }
-        MemoryRegion *seg = host_memory_backend_get_memory(backend, &local_err);
-        if (local_err) {
-            error_report_err(local_err);
-            exit(1);
-        }
+        MemoryRegion *seg = host_memory_backend_get_memory(backend,
+                                                           &error_fatal);
 
         if (memory_region_is_mapped(seg)) {
             char *path = object_get_canonical_path_component(OBJECT(backend));
diff --git a/vl.c b/vl.c
index 4211ff1..5cc6bfd 100644
--- a/vl.c
+++ b/vl.c
@@ -4329,12 +4329,7 @@ int main(int argc, char **argv, char **envp)
     configure_accelerator(current_machine);
 
     if (qtest_chrdev) {
-        Error *local_err = NULL;
-        qtest_init(qtest_chrdev, qtest_log, &local_err);
-        if (local_err) {
-            error_report_err(local_err);
-            exit(1);
-        }
+        qtest_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
     machine_opts = qemu_get_machine_opts();
@@ -4345,24 +4340,14 @@ int main(int argc, char **argv, char **envp)
 
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
-        Error *local_err = NULL;
-
         boot_order = qemu_opt_get(opts, "order");
         if (boot_order) {
-            validate_bootdevices(boot_order, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            validate_bootdevices(boot_order, &error_fatal);
         }
 
         boot_once = qemu_opt_get(opts, "once");
         if (boot_once) {
-            validate_bootdevices(boot_once, &local_err);
-            if (local_err) {
-                error_report_err(local_err);
-                exit(1);
-            }
+            validate_bootdevices(boot_once, &error_fatal);
         }
 
         boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
-- 
2.4.3


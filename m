Received: by 10.25.208.211 with SMTP id h202csp1241914lfg;
        Fri, 19 Feb 2016 08:22:16 -0800 (PST)
X-Received: by 10.55.80.86 with SMTP id e83mr16695760qkb.91.1455898935923;
        Fri, 19 Feb 2016 08:22:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k73si14995666qkh.65.2016.02.19.08.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 08:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWnot-0001wt-BQ
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 11:22:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWnol-0001jy-4Q
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:22:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWnoj-00076T-V0
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:22:07 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:38477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWnog-00074c-Fo; Fri, 19 Feb 2016 11:22:02 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWnof-00031z-36; Fri, 19 Feb 2016 16:22:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 16:21:59 +0000
Message-Id: <1455898919-13868-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH] hw/arm/virt: Assume EL3 boot rom will handle
	PSCI if one is provided
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
X-TUID: tMsIRfCWm/6q

If the user passes us an EL3 boot rom, then it is going to want to
implement the PSCI interface itself. In this case, disable QEMU's
internal PSCI implementation so it does not get in the way, and
instead start all CPUs in an SMP configuration at once (the boot
rom will catch them all and pen up the secondaries until needed).
The boot rom code is also responsible for editing the device tree
to include any necessary information about its own PSCI implementation
before eventually passing it to a NonSecure guest.

(This "start all CPUs at once" approach is what both ARM Trusted
Firmware and UEFI expect, since it is what the ARM Foundation Model
does; the other approach would be to provide some emulated hardware
for "start the secondaries" but this is simplest.)

This is a compatibility break, but I don't believe that anybody
was using a secure boot ROM with an SMP configuration. Such a setup
would be somewhat broken since there was nothing preventing nonsecure
guest code from calling the QEMU PSCI function to start up a secondary
core in a way that completely bypassed the secure world.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is slightly RFC-ish because I don't actually have any secure boot
rom code that will cope with SMP right now. But I think that since this
is a compat break we're better off putting it into 2.6 than not.

 hw/arm/virt.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4499e2c..0f01902 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -73,6 +73,7 @@ typedef struct VirtBoardInfo {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t v2m_phandle;
+    bool using_psci;
 } VirtBoardInfo;
 
 typedef struct {
@@ -231,6 +232,10 @@ static void fdt_add_psci_node(const VirtBoardInfo *vbi)
     void *fdt = vbi->fdt;
     ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
 
+    if (!vbi->using_psci) {
+        return;
+    }
+
     qemu_fdt_add_subnode(fdt, "/psci");
     if (armcpu->psci_version == 2) {
         const char comp[] = "arm,psci-0.2\0arm,psci";
@@ -342,7 +347,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
         qemu_fdt_setprop_string(vbi->fdt, nodename, "compatible",
                                     armcpu->dtb_compatible);
 
-        if (vbi->smp_cpus > 1) {
+        if (vbi->using_psci && vbi->smp_cpus > 1) {
             qemu_fdt_setprop_string(vbi->fdt, nodename,
                                         "enable-method", "psci");
         }
@@ -1081,6 +1086,7 @@ static void machvirt_init(MachineState *machine)
     VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
     VirtGuestInfo *guest_info = &guest_info_state->info;
     char **cpustr;
+    bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
 
     if (!cpu_model) {
         cpu_model = "cortex-a15";
@@ -1146,6 +1152,16 @@ static void machvirt_init(MachineState *machine)
         memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
                            UINT64_MAX);
         memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
+
+        if (firmware_loaded) {
+            /* If we have an EL3 boot ROM then the assumption is that it will
+             * implement PSCI itself, so disable QEMU's internal implementation
+             * so it doesn't get in the way. Instead of starting secondary
+             * CPUs in PSCI powerdown state we will start them all running and
+             * let the boot ROM sort them out.
+             */
+            vbi->using_psci = false;
+        }
     }
 
     create_fdt(vbi);
@@ -1175,12 +1191,15 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
 
-        object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_HVC, "psci-conduit",
-                                NULL);
+        if (vbi->using_psci) {
+            object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_HVC,
+                                    "psci-conduit", NULL);
 
-        /* Secondary CPUs start in PSCI powered-down state */
-        if (n > 0) {
-            object_property_set_bool(cpuobj, true, "start-powered-off", NULL);
+            /* Secondary CPUs start in PSCI powered-down state */
+            if (n > 0) {
+                object_property_set_bool(cpuobj, true,
+                                         "start-powered-off", NULL);
+            }
         }
 
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
@@ -1249,7 +1268,7 @@ static void machvirt_init(MachineState *machine)
     vbi->bootinfo.board_id = -1;
     vbi->bootinfo.loader_start = vbi->memmap[VIRT_MEM].base;
     vbi->bootinfo.get_dtb = machvirt_dtb;
-    vbi->bootinfo.firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    vbi->bootinfo.firmware_loaded = firmware_loaded;
     arm_load_kernel(ARM_CPU(first_cpu), &vbi->bootinfo);
 
     /*
-- 
1.9.1


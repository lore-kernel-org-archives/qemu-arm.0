Received: by 10.25.205.13 with SMTP id d13csp2116863lfg;
        Tue, 13 Dec 2016 02:36:50 -0800 (PST)
X-Received: by 10.200.50.202 with SMTP id a10mr92224919qtb.232.1481625410710;
        Tue, 13 Dec 2016 02:36:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o53si27867190qtc.303.2016.12.13.02.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkRz-0004p5-Ps
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:36:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkRt-0004ll-GK
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:36:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkRs-0008CA-CP
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:36:41 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkRs-0008BI-3Y; Tue, 13 Dec 2016 05:36:40 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRr-0002ON-2h; Tue, 13 Dec 2016 10:36:39 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:22 +0000
Message-Id: <1481625384-15077-22-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 21/23] hw/arm/virt: Support using SMC for PSCI
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
Cc: Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: znm+oPt3ZGno

If we are giving the guest a CPU with EL2, it is likely to
want to use the HVC instruction itself, for instance for
providing PSCI to inner guest VMs. This makes using HVC
as the PSCI conduit for the outer QEMU a bad idea. We will
want to use SMC instead is this case: this makes sense
because QEMU's PSCI implementation is effectively an
emulation of functionality provided by EL3 firmware.

Add code to support selecting the PSCI conduit to use,
rather than hardcoding use of HVC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7adb58b..cce8d2e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -88,7 +88,7 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
-    bool using_psci;
+    int psci_conduit;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
@@ -266,9 +266,19 @@ static void fdt_add_psci_node(const VirtMachineState *vms)
     uint32_t migrate_fn;
     void *fdt = vms->fdt;
     ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
+    const char *psci_method;
 
-    if (!vms->using_psci) {
+    switch (vms->psci_conduit) {
+    case QEMU_PSCI_CONDUIT_DISABLED:
         return;
+    case QEMU_PSCI_CONDUIT_HVC:
+        psci_method = "hvc";
+        break;
+    case QEMU_PSCI_CONDUIT_SMC:
+        psci_method = "smc";
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     qemu_fdt_add_subnode(fdt, "/psci");
@@ -300,7 +310,7 @@ static void fdt_add_psci_node(const VirtMachineState *vms)
      * However, the device tree binding uses 'method' instead, so that is
      * what we should use here.
      */
-    qemu_fdt_setprop_string(fdt, "/psci", "method", "hvc");
+    qemu_fdt_setprop_string(fdt, "/psci", "method", psci_method);
 
     qemu_fdt_setprop_cell(fdt, "/psci", "cpu_suspend", cpu_suspend_fn);
     qemu_fdt_setprop_cell(fdt, "/psci", "cpu_off", cpu_off_fn);
@@ -402,7 +412,8 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
         qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                                     armcpu->dtb_compatible);
 
-        if (vms->using_psci && vms->smp_cpus > 1) {
+        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
+            && vms->smp_cpus > 1) {
             qemu_fdt_setprop_string(vms->fdt, nodename,
                                         "enable-method", "psci");
         }
@@ -1270,7 +1281,11 @@ static void machvirt_init(MachineState *machine)
      * let the boot ROM sort them out.
      * The usual case is that we do use QEMU's PSCI implementation.
      */
-    vms->using_psci = !(vms->secure && firmware_loaded);
+    if (vms->secure && firmware_loaded) {
+        vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+    } else {
+        vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
+    }
 
     /* The maximum number of CPUs depends on the GIC version, or on how
      * many redistributors we can fit into the memory map.
@@ -1353,8 +1368,8 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
 
-        if (vms->using_psci) {
-            object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_HVC,
+        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+            object_property_set_int(cpuobj, vms->psci_conduit,
                                     "psci-conduit", NULL);
 
             /* Secondary CPUs start in PSCI powered-down state */
-- 
2.7.4


Received: by 10.25.205.13 with SMTP id d13csp2120333lfg;
        Tue, 13 Dec 2016 02:47:05 -0800 (PST)
X-Received: by 10.55.134.1 with SMTP id i1mr82926592qkd.219.1481626025860;
        Tue, 13 Dec 2016 02:47:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o18si27881637qke.325.2016.12.13.02.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:47:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkbv-0005D8-3O
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:47:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSp-0005aG-HY
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSo-000091-IV
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:39 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkSo-000087-AJ; Tue, 13 Dec 2016 05:37:38 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRs-0002PA-8b; Tue, 13 Dec 2016 10:36:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:24 +0000
Message-Id: <1481625384-15077-24-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 23/23] hw/arm/virt: Add board property to enable
 EL2
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
X-TUID: p5xk7Kpa092f

Add a board level property to the virt board which will
enable EL2 on the CPU if the user asks for it. The
default is not to provide EL2. If EL2 is enabled then
we will use SMC as our PSCI conduit, and report the
virtualization support in the GICv3 device tree node.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5bde68c..7eec50a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -78,6 +78,7 @@ typedef struct {
     MachineState parent;
     bool secure;
     bool highmem;
+    bool virt;
     int32_t gic_version;
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
@@ -480,6 +481,11 @@ static void fdt_add_gic_node(VirtMachineState *vms, int type)
                                      2, vms->memmap[VIRT_GIC_DIST].size,
                                      2, vms->memmap[VIRT_GIC_REDIST].base,
                                      2, vms->memmap[VIRT_GIC_REDIST].size);
+        if (vms->virt) {
+            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
+                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
+                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        }
     } else {
         /* 'cortex-a15-gic' means 'GIC v2' */
         qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
@@ -1279,10 +1285,15 @@ static void machvirt_init(MachineState *machine)
      * so it doesn't get in the way. Instead of starting secondary
      * CPUs in PSCI powerdown state we will start them all running and
      * let the boot ROM sort them out.
-     * The usual case is that we do use QEMU's PSCI implementation.
+     * The usual case is that we do use QEMU's PSCI implementation;
+     * if the guest has EL2 then we will use SMC as the conduit,
+     * and otherwise we will use HVC (for backwards compatibility and
+     * because if we're using KVM then we must use HVC).
      */
     if (vms->secure && firmware_loaded) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+    } else if (vms->virt) {
+        vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
     }
@@ -1312,6 +1323,12 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (vms->virt && kvm_enabled()) {
+        error_report("mach-virt: KVM does not support providing "
+                     "Virtualization extensions to the guest CPU");
+        exit(1);
+    }
+
     if (vms->secure) {
         if (kvm_enabled()) {
             error_report("mach-virt: KVM does not support Security extensions");
@@ -1368,7 +1385,7 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
 
-        if (object_property_find(cpuobj, "has_el2", NULL)) {
+        if (!vms->virt && object_property_find(cpuobj, "has_el2", NULL)) {
             object_property_set_bool(cpuobj, false, "has_el2", NULL);
         }
 
@@ -1481,6 +1498,20 @@ static void virt_set_secure(Object *obj, bool value, Error **errp)
     vms->secure = value;
 }
 
+static bool virt_get_virt(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->virt;
+}
+
+static void virt_set_virt(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->virt = value;
+}
+
 static bool virt_get_highmem(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1568,6 +1599,16 @@ static void virt_2_9_instance_init(Object *obj)
                                     "Security Extensions (TrustZone)",
                                     NULL);
 
+    /* EL2 is also disabled by default, for similar reasons */
+    vms->virt = false;
+    object_property_add_bool(obj, "virtualization", virt_get_virt,
+                             virt_set_virt, NULL);
+    object_property_set_description(obj, "virtualization",
+                                    "Set on/off to enable/disable emulating a "
+                                    "guest CPU which implements the ARM "
+                                    "Virtualization Extensions",
+                                    NULL);
+
     /* High memory is enabled by default */
     vms->highmem = true;
     object_property_add_bool(obj, "highmem", virt_get_highmem,
-- 
2.7.4


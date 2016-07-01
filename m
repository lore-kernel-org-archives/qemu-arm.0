Received: by 10.25.21.96 with SMTP id l93csp280300lfi;
        Fri, 1 Jul 2016 06:02:49 -0700 (PDT)
X-Received: by 10.55.123.6 with SMTP id w6mr27743576qkc.164.1467378169227;
        Fri, 01 Jul 2016 06:02:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9si2315881qtc.79.2016.07.01.06.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 06:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIy5o-0007BC-Mm
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 09:02:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bIy5M-0006kz-Vm
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 09:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bIy5K-0004yS-Va
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 09:02:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bIy5K-0004yE-Ne; Fri, 01 Jul 2016 09:02:18 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D40090E52;
	Fri,  1 Jul 2016 13:02:18 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-139.brq.redhat.com [10.34.1.139])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u61D2DDD023420; Fri, 1 Jul 2016 09:02:16 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Fri,  1 Jul 2016 15:02:09 +0200
Message-Id: <1467378129-23302-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1467378129-23302-1-git-send-email-drjones@redhat.com>
References: <1467378129-23302-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 01 Jul 2016 13:02:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/2] hw/arm/virt: tcg: adjust MPIDR like KVM
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O1na8J3tIoSC

KVM adjusts the MPIDR of guest vcpus based on the architecture of
the host, 32-bit vs. 64-bit, and, for 64-bit, also on the type of
GIC the guest is using. To be consistent and improve SGI efficiency
we make the same adjustments for TCG as 64-bit KVM hosts. We neglect
to add consistency with 32-bit KVM hosts, as that would reduce SGI
efficiency and KVM is expected to change.

As MPIDR is a system register, and thus guest visible, we only make
adjustments for current and later versioned machines.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c5c125e9204a0..fb0265e31703a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -52,7 +52,8 @@
 #include "hw/arm/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/arm/fdt.h"
-#include "hw/intc/arm_gic_common.h"
+#include "hw/intc/arm_gic.h"
+#include "hw/intc/arm_gicv3_common.h"
 #include "kvm_arm.h"
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
@@ -82,6 +83,7 @@ typedef struct VirtBoardInfo {
 typedef struct {
     MachineClass parent;
     VirtBoardInfo *daughterboard;
+    bool disallow_affinity_adjustment;
 } VirtMachineClass;
 
 typedef struct {
@@ -1164,6 +1166,7 @@ void virt_guest_info_machine_done(Notifier *notifier, void *data)
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
     qemu_irq pic[NUM_IRQS];
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
@@ -1176,6 +1179,7 @@ static void machvirt_init(MachineState *machine)
     VirtGuestInfo *guest_info = &guest_info_state->info;
     char **cpustr;
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    uint8_t clustersz;
 
     if (!cpu_model) {
         cpu_model = "cortex-a15";
@@ -1221,8 +1225,10 @@ static void machvirt_init(MachineState *machine)
      */
     if (gic_version == 3) {
         virt_max_cpus = vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
+        clustersz = GICV3_TARGETLIST_BITS;
     } else {
         virt_max_cpus = GIC_NCPU;
+        clustersz = GIC_TARGETLIST_BITS;
     }
 
     if (max_cpus > virt_max_cpus) {
@@ -1271,6 +1277,21 @@ static void machvirt_init(MachineState *machine)
         }
         cpuobj = object_new(object_class_get_name(oc));
 
+        if (!vmc->disallow_affinity_adjustment) {
+            /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
+             * GIC's target-list limitations. 32-bit KVM hosts currently
+             * always create clusters of 4 CPUs, but that is expected to
+             * change when they gain support for gicv3. When KVM is enabled
+             * it will override the changes we make here, therefore our
+             * purposes are to make TCG consistent (with 64-bit KVM hosts)
+             * and to improve SGI efficiency.
+             */
+            uint8_t aff1 = n / clustersz;
+            uint8_t aff0 = n % clustersz;
+            object_property_set_int(cpuobj, (aff1 << ARM_AFF1_SHIFT) | aff0,
+                                    "mp-affinity", NULL);
+        }
+
         /* Handle any CPU options specified by the user */
         cc->parse_features(CPU(cpuobj), cpuopts, &err);
         g_free(cpuopts);
@@ -1505,7 +1526,10 @@ static void virt_2_6_instance_init(Object *obj)
 
 static void virt_machine_2_6_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_7_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
+    vmc->disallow_affinity_adjustment = true;
 }
 DEFINE_VIRT_MACHINE(2, 6)
-- 
2.7.4


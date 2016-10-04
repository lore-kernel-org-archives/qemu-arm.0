Received: by 10.80.163.71 with SMTP id 65csp2344307edn;
        Tue, 4 Oct 2016 14:39:13 -0700 (PDT)
X-Received: by 10.55.183.1 with SMTP id h1mr5790385qkf.264.1475617153485;
        Tue, 04 Oct 2016 14:39:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si3899240qkd.87.2016.10.04.14.39.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 14:39:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brXQe-00070m-DQ
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 17:39:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1brXQT-000705-Vd
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 17:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1brXQQ-0002DZ-QF
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 17:39:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1brXQQ-0002DH-Kx; Tue, 04 Oct 2016 17:38:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06E6E693F2;
	Tue,  4 Oct 2016 21:38:58 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u94LcsL6007849; Tue, 4 Oct 2016 17:38:57 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Tue,  4 Oct 2016 17:38:54 -0400
Message-Id: <1475617134-28180-3-git-send-email-wei@redhat.com>
In-Reply-To: <1475617134-28180-1-git-send-email-wei@redhat.com>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 04 Oct 2016 21:38:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V6 2/2] arm: virt: add PMU property to mach-virt
 machine type
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JWhitIW0tM3y

CPU vPMU is now turned off by default, but it was ON in virt-2.7
machine type. To solve this problem, this patch adds a PMU option
in machine state, which is used to control CPU's vPMU status. This
PMU option is not exposed to command line and is turned on in
virt-2.7 machine type to make sure it is backward compatible.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d348b02..43832f3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -84,6 +84,7 @@ typedef struct {
     MachineClass parent;
     VirtBoardInfo *daughterboard;
     bool disallow_affinity_adjustment;
+    bool pmu_default_on;
 } VirtMachineClass;
 
 typedef struct {
@@ -1322,6 +1323,8 @@ static void machvirt_init(MachineState *machine)
 
     for (n = 0; n < smp_cpus; n++) {
         Object *cpuobj = object_new(typename);
+        ARMCPU *cpu = ARM_CPU(cpuobj);
+
         if (!vmc->disallow_affinity_adjustment) {
             /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
              * GIC's target-list limitations. 32-bit KVM hosts currently
@@ -1352,6 +1355,12 @@ static void machvirt_init(MachineState *machine)
             }
         }
 
+        if (cpu->has_pmu == ON_OFF_AUTO_AUTO &&
+            object_property_find(cpuobj, "pmu", NULL)) {
+            cpu->has_pmu = vmc->pmu_default_on && kvm_enabled() ?
+                ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
+        }
+
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
             object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
                                     "reset-cbar", &error_abort);
@@ -1562,8 +1571,12 @@ static void virt_2_7_instance_init(Object *obj)
 
 static void virt_machine_2_7_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_8_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_7);
+
+    vmc->pmu_default_on = true;
 }
 DEFINE_VIRT_MACHINE(2, 7)
 
@@ -1582,5 +1595,9 @@ static void virt_machine_2_6_options(MachineClass *mc)
     virt_machine_2_7_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
     vmc->disallow_affinity_adjustment = true;
+    /* Disable PMU for 2.6 and down as PMU support was first introduced
+     * and enabled in 2.7.
+     */
+    vmc->pmu_default_on = false;
 }
 DEFINE_VIRT_MACHINE(2, 6)
-- 
1.8.3.1


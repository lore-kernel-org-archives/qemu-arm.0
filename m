Received: by 10.25.77.65 with SMTP id a62csp2371338lfb;
        Tue, 7 Feb 2017 13:51:11 -0800 (PST)
X-Received: by 10.200.57.27 with SMTP id s27mr15495174qtb.230.1486504271776;
        Tue, 07 Feb 2017 13:51:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si3961895qke.324.2017.02.07.13.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Feb 2017 13:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbDfJ-0004AT-79
	for alex.bennee@linaro.org; Tue, 07 Feb 2017 16:51:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cbDdn-0002xb-LQ
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 16:49:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cbDdm-0007ZQ-IO
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 16:49:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cbDdm-0007YP-Cm; Tue, 07 Feb 2017 16:49:34 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74018C05AA42;
	Tue,  7 Feb 2017 21:49:34 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v17LnVCJ006452; Tue, 7 Feb 2017 16:49:34 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Feb 2017 16:49:31 -0500
Message-Id: <1486504171-26807-5-git-send-email-wei@redhat.com>
In-Reply-To: <1486504171-26807-1-git-send-email-wei@redhat.com>
References: <1486504171-26807-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 Feb 2017 21:49:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V3 4/4] target-arm: Enable vPMU support under TCG
 mode
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xtCMmfH/gsxB

This patch contains several fixes to enable vPMU under TCG mode. It
first removes the checking of kvm_enabled() while unsetting
ARM_FEATURE_PMU. With it, the .pmu option can be used to turn on/off vPMU
under TCG mode. Secondly the PMU node of DT table is now created under TCG.
The last fix is to disable the masking of PMUver field of ID_AA64DFR0_EL1.

Signed-off-by: Wei Huang <wei@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c       | 2 +-
 target/arm/cpu.c    | 2 +-
 target/arm/helper.c | 7 +------
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1f216cf..8eef143 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -471,7 +471,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     CPU_FOREACH(cpu) {
         armcpu = ARM_CPU(cpu);
         if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU) ||
-            !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
+            (kvm_enabled() && !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ)))) {
             return;
         }
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e9f10f7..9a2bc8a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -745,7 +745,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_EL2);
     }
 
-    if (!cpu->has_pmu || !kvm_enabled()) {
+    if (!cpu->has_pmu) {
         cpu->has_pmu = false;
         unset_feature(env, ARM_FEATURE_PMU);
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c4daa6e..d363d02 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4633,12 +4633,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
-              /* We mask out the PMUVer field, because we don't currently
-               * implement the PMU. Not advertising it prevents the guest
-               * from trying to use it and getting UNDEFs on registers we
-               * don't implement.
-               */
-              .resetvalue = cpu->id_aa64dfr0 & ~0xf00 },
+              .resetvalue = cpu->id_aa64dfr0 },
             { .name = "ID_AA64DFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
1.8.3.1


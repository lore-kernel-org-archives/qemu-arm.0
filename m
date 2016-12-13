Received: by 10.25.205.13 with SMTP id d13csp2124043lfg;
        Tue, 13 Dec 2016 02:58:21 -0800 (PST)
X-Received: by 10.200.41.9 with SMTP id y9mr93385807qty.26.1481626701508;
        Tue, 13 Dec 2016 02:58:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b17si17715839qkb.116.2016.12.13.02.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkmo-00063u-Jd
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:58:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkTS-0006CJ-9W
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:38:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkTR-0000NC-6n
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:38:18 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkTR-0000Mz-0I; Tue, 13 Dec 2016 05:38:17 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRr-0002Og-K1; Tue, 13 Dec 2016 10:36:39 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:23 +0000
Message-Id: <1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 22/23] target-arm: Enable EL2 feature bit on A53
 and A57
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
X-TUID: WWKGtXrnnf2C

Enable the ARM_FEATURE_EL2 bit on Cortex-A52 and
Cortex-A57, since this is all now sufficiently implemented
to work with the GICv3. We provide the usual CPU property
to disable it for backwards compatibility with the older
virt boards.

In this commit, we disable the EL2 feature on the
virt and ZynpMP boards, so there is no overall effect.
Another commit will expose a board-level property to
allow the user to enable EL2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h     |  2 ++
 hw/arm/virt.c        |  4 ++++
 hw/arm/xlnx-zynqmp.c |  2 ++
 target-arm/cpu.c     | 12 ++++++++++++
 target-arm/cpu64.c   |  2 ++
 5 files changed, 22 insertions(+)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index be42ffb..51165fa 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -574,6 +574,8 @@ struct ARMCPU {
     bool start_powered_off;
     /* CPU currently in PSCI powered-off state */
     bool powered_off;
+    /* CPU has virtualization extension */
+    bool has_el2;
     /* CPU has security extension */
     bool has_el3;
     /* CPU has PMU (Performance Monitor Unit) */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cce8d2e..5bde68c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1368,6 +1368,10 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
 
+        if (object_property_find(cpuobj, "has_el2", NULL)) {
+            object_property_set_bool(cpuobj, false, "has_el2", NULL);
+        }
+
         if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
             object_property_set_int(cpuobj, vms->psci_conduit,
                                     "psci-conduit", NULL);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 0d86ba3..bc4e66b 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -258,6 +258,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
         object_property_set_bool(OBJECT(&s->apu_cpu[i]),
                                  s->secure, "has_el3", NULL);
+        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
+                                 false, "has_el2", NULL);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
                                 "reset-cbar", &error_abort);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 5e0d21d..d721cd4 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -497,6 +497,9 @@ static Property arm_cpu_reset_hivecs_property =
 static Property arm_cpu_rvbar_property =
             DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
 
+static Property arm_cpu_has_el2_property =
+            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
+
 static Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
 
@@ -547,6 +550,11 @@ static void arm_cpu_post_init(Object *obj)
 #endif
     }
 
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property,
+                                 &error_abort);
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
                                  &error_abort);
@@ -690,6 +698,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->id_aa64pfr0 &= ~0xf000;
     }
 
+    if (!cpu->has_el2) {
+        unset_feature(env, ARM_FEATURE_EL2);
+    }
+
     if (!cpu->has_pmu || !kvm_enabled()) {
         cpu->has_pmu = false;
         unset_feature(env, ARM_FEATURE_PMU);
diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
index 73c7f31..670c07a 100644
--- a/target-arm/cpu64.c
+++ b/target-arm/cpu64.c
@@ -110,6 +110,7 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
@@ -169,6 +170,7 @@ static void aarch64_a53_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
-- 
2.7.4


Received: by 10.25.205.13 with SMTP id d13csp11562915lfg;
        Mon, 9 Jan 2017 08:06:10 -0800 (PST)
X-Received: by 10.237.38.133 with SMTP id q5mr6621047qtd.21.1483977970052;
        Mon, 09 Jan 2017 08:06:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si419506qki.280.2017.01.09.08.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcSV-0008Bg-60
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:06:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS3-0007oy-CD
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcRy-0003hX-TE
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:39 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcRy-0003hC-L3; Mon, 09 Jan 2017 11:05:34 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRx-0001oq-NP; Mon, 09 Jan 2017 16:05:33 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:23 +0000
Message-Id: <1483977924-14522-18-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 17/18] target-arm: Enable EL2 feature bit on
 A53 and A57
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uWXbXxPwXjsp

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
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 target/arm/cpu.h     |  2 ++
 hw/arm/virt.c        |  4 ++++
 hw/arm/xlnx-zynqmp.c |  2 ++
 target/arm/cpu.c     | 12 ++++++++++++
 target/arm/cpu64.c   |  2 ++
 5 files changed, 22 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 28c5d8f..c5b835f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
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
index 1fdc791..46f19cd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1329,6 +1329,10 @@ static void machvirt_init(MachineState *machine)
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
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8932086..2c9073d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
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
@@ -695,6 +703,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->id_aa64pfr0 &= ~0xf000;
     }
 
+    if (!cpu->has_el2) {
+        unset_feature(env, ARM_FEATURE_EL2);
+    }
+
     if (!cpu->has_pmu || !kvm_enabled()) {
         cpu->has_pmu = false;
         unset_feature(env, ARM_FEATURE_PMU);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 73c7f31..670c07a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
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


Received: by 10.25.0.147 with SMTP id 141csp1039389lfa;
        Mon, 27 Feb 2017 09:37:36 -0800 (PST)
X-Received: by 10.55.105.66 with SMTP id e63mr14338577qkc.0.1488217056452;
        Mon, 27 Feb 2017 09:37:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si12339213qkd.24.2017.02.27.09.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Feb 2017 09:37:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ciPEr-0001bu-Kt
	for alex.bennee@linaro.org; Mon, 27 Feb 2017 12:37:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ciPEZ-0001RV-FF
	for qemu-arm@nongnu.org; Mon, 27 Feb 2017 12:37:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ciPEY-0000cf-BT
	for qemu-arm@nongnu.org; Mon, 27 Feb 2017 12:37:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36736)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ciPEY-0000cF-3U; Mon, 27 Feb 2017 12:37:14 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34871C05681A;
	Mon, 27 Feb 2017 17:37:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1RHb8oj000943; Mon, 27 Feb 2017 12:37:12 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 27 Feb 2017 18:37:06 +0100
Message-Id: <20170227173706.15210-3-drjones@redhat.com>
In-Reply-To: <20170227173706.15210-1-drjones@redhat.com>
References: <20170227173706.15210-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 27 Feb 2017 17:37:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] arm: kvm: set MPIDR when we can
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
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mRP3bI3O/89B

If KVM supports user provided MPIDRs for the vcpus, then provide
them. This simplifies management of vcpus as we can be sure of
the identity of a vcpu even before it's been instantiated.

Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c   |  3 +--
 target/arm/kvm32.c | 22 ++++++++++++++--------
 target/arm/kvm64.c | 22 ++++++++++++++--------
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f7157dc0e59d..83cd5eefbef8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -741,8 +741,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
-     * We don't support setting cluster ID ([16..23]) (known as Aff2
+    /* We don't currently support setting cluster ID ([16..23]) (known as Aff2
      * in later ARM ARM versions), or any of the higher affinity level fields,
      * so these bits always RAZ.
      */
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 069da0c5fd10..5ad732498e5c 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -186,7 +186,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
 {
     int ret;
     uint64_t v;
-    uint32_t mpidr;
     struct kvm_one_reg r;
     ARMCPU *cpu = ARM_CPU(cs);
 
@@ -223,16 +222,23 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return -EINVAL;
     }
 
-    /*
-     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
-     * Currently KVM has its own idea about MPIDR assignment, so we
-     * override our defaults with what we get from KVM.
-     */
-    ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_USER_MPIDR)) {
+        ret = kvm_set_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR),
+                              &cpu->mp_affinity);
+    } else {
+        /* If we can't set the MPIDR, then KVM will generate one. We must
+         * update our copy to that one in order to stay synchronized.
+         */
+        uint32_t mpidr;
+
+        ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
+        if (!ret) {
+            cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
+        }
+    }
     if (ret) {
         return ret;
     }
-    cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
 
     return kvm_arm_init_cpreg_list(cpu);
 }
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 61111091ad3b..a7d3f876c43b 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -486,7 +486,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     int ret;
-    uint64_t mpidr;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
@@ -524,16 +523,23 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
-    /*
-     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
-     * Currently KVM has its own idea about MPIDR assignment, so we
-     * override our defaults with what we get from KVM.
-     */
-    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_USER_MPIDR)) {
+        ret = kvm_set_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR),
+                              &cpu->mp_affinity);
+    } else {
+        /* If we can't set the MPIDR, then KVM will generate one. We must
+         * update our copy to that one in order to stay synchronized.
+         */
+        uint64_t mpidr;
+
+        ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
+        if (!ret) {
+            cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
+        }
+    }
     if (ret) {
         return ret;
     }
-    cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
     kvm_arm_init_debug(cs);
 
-- 
2.9.3


Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595425njl;
        Tue, 8 Oct 2024 20:22:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWwXhXouWzpYVf2rmQncvWIk8sVk54jDSaTyD5XD1TuAx0eU0UoNolO6I1J8OTBW/MX7A5JdltuLm95Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFYNRd4iDNQUHLOjVl8ZnN7fgrwuLuklx0mje4/0Yd8p7fpuBepjFaffTv4nCyebfcZazCY
X-Received: by 2002:adf:a1d5:0:b0:374:c581:9f4f with SMTP id ffacd0b85a97d-37d3aa87574mr335709f8f.55.1728444135912;
        Tue, 08 Oct 2024 20:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444135; cv=none;
        d=google.com; s=arc-20240605;
        b=gbIc/JlelOYQQ+wlDe+opjCfGHaHqYT59cmQNIOKpfD+n5g+h6pV0OJDL9WiiVHWVa
         SDwsq7q8AhdiuldIjrFsop+QMtCC7KAvtPGJ6ZsGn/HQZqEdxSYTYkv7E/RThcXEkmXY
         V+n+xK985EQq7w8ZDr+h1e1G2tB5/h9zFil8efpLb6g3JILIuuKY8oHOylOBsHiq61S8
         ZHtlM34Ze0Teg8uIxw9dY/0B2CkKmzZn8HRcbmb7leY3S1w/OdQP128taoziVlyS/+wW
         OB2sHLkCytDyArX7rmWe1ovXkgOuqtNJ0azWB1O/lnFPiOE6yqwM8m1ua1AjR5tWoq82
         JIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mNj5zkm4bZKbiMVu3IXOoSI7D8+VsZe5sCMTksUv3vE=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=dydiyyu4AQSdRQpDi/nCPVN+2xX5Gu5TSzSsu+tgIvHLdxU6YCpQ9B2M3cScOD8bR7
         RAZDfFFIUMZWb13rU9eZHdKRPmJ7s9aGpIf1rpZd+w7GwGwbzJ3Xhr2baosfl1F2//Vr
         OclV5v+CJDMdFvnbFisUGeW+sAD4Evo/skxGTRzwX2gnMxYnyogpsmRjqYBfKRE02BHg
         QWDTct8Js0P0Ut2bFH0Z+0CzrdnABpgIu60AlzhmMKGvzWumV/sxjb0+DJu0AFWYNk91
         fJMNBU+0P0iGrV2Lj0eU/I2JwEeiTN4hhIcXPdruYzWxFbViBqMnDA8hLzcyWkVbH5Dn
         VdIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-430d6faa3a0si2643925e9.219.2024.10.08.20.22.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdPJ2htdz6LDBV;
	Wed,  9 Oct 2024 11:17:56 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 188F8140447;
	Wed,  9 Oct 2024 11:22:15 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:21:55 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 08/33] arm/virt,gicv3: Introduce GICv3 CPU Interface *accessibility* flag and checks
Date: Wed, 9 Oct 2024 04:17:50 +0100
Message-ID: <20241009031815.250096-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: J5xt7agGH4N0

Introduce a `gicc_accessible` flag to indicate whether it is safe to access the
GICv3 CPU interface. This flag will determine the availability of the GICv3 CPU
interface based on whether the associated QOM vCPUs are enabled or disabled.

Additionally, implement checks throughout the GICv3 codebase to ensure that any
updates or accesses to GICC registers (e.g., `ICC_*_EL1`) occur only when the
`gicc_accessible` flag is set. This ensures that operations such as KVM VGIC
GICC register fetches or modifications are performed only for GICv3 CPU
interfaces that are valid and associated with active QOM vCPUs.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/intc/arm_gicv3_common.c         |  9 ++++++--
 hw/intc/arm_gicv3_cpuif.c          |  8 +++++++
 hw/intc/arm_gicv3_kvm.c            | 23 ++++++++++++++++++-
 include/hw/intc/arm_gicv3_common.h | 36 ++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index bd50a1b079..4f230257ef 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -436,10 +436,15 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
-        CPUState *cpu = qemu_get_cpu(i);
+        CPUState *cpu = qemu_get_possible_cpu(i);
         uint64_t cpu_affid;
 
-        s->cpu[i].cpu = cpu;
+        /*
+         * Accordingly, set the QOM `GICv3CPUState` as either accessible or
+         * inaccessible based on the `CPUState` of the associated QOM vCPU.
+         */
+        gicv3_set_cpustate(&s->cpu[i], cpu, qemu_enabled_cpu(cpu));
+
         s->cpu[i].gic = s;
         /* Store GICv3CPUState in CPUARMState gicv3state pointer */
         gicv3_set_gicv3state(cpu, &s->cpu[i]);
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index bdb13b00e9..151f957d42 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1052,6 +1052,10 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
+    if (!gicv3_cpu_accessible(cs)) {
+        return;
+    }
+
     g_assert(bql_locked());
 
     trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
@@ -2036,6 +2040,10 @@ static void icc_generate_sgi(CPUARMState *env, GICv3CPUState *cs,
     for (i = 0; i < s->num_cpu; i++) {
         GICv3CPUState *ocs = &s->cpu[i];
 
+        if (!gicv3_cpu_accessible(ocs)) {
+            continue;
+        }
+
         if (irm) {
             /* IRM == 1 : route to all CPUs except self */
             if (cs == ocs) {
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 9ea6b8e218..7e741ace50 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -24,6 +24,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "kvm_arm.h"
@@ -458,6 +459,16 @@ static void kvm_arm_gicv3_put(GICv3State *s)
         GICv3CPUState *c = &s->cpu[ncpu];
         int num_pri_bits;
 
+        /*
+         * We must ensure that we do not attempt to access or update KVM GICC
+         * registers if their corresponding QOM `GICv3CPUState` is marked as
+         * 'inaccessible', either because their corresponding QOM vCPU objects
+         * do not exist or are disabled due to hot-unplug action.
+         */
+        if (!gicv3_cpu_accessible(c)) {
+            continue;
+        }
+
         kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, true);
         kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
                         &c->icc_ctlr_el1[GICV3_NS], true);
@@ -616,6 +627,14 @@ static void kvm_arm_gicv3_get(GICv3State *s)
         GICv3CPUState *c = &s->cpu[ncpu];
         int num_pri_bits;
 
+        /*
+         * don't attempt to access KVM VGIC for the disabled vCPUs where
+         * GICv3CPUState is inaccessible.
+         */
+        if (!gicv3_cpu_accessible(c)) {
+            continue;
+        }
+
         kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, false);
         kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
                         &c->icc_ctlr_el1[GICV3_NS], false);
@@ -815,7 +834,9 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->num_cpu; i++) {
         ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
 
-        define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+        if (gicv3_cpu_accessible(&s->cpu[i])) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+        }
     }
 
     /* Try to create the device via the device control API */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index cd09bee3bc..73d9088768 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -190,6 +190,7 @@ struct GICv3CPUState {
     uint64_t icc_apr[3][4];
     uint64_t icc_igrpen[3];
     uint64_t icc_ctlr_el3;
+    bool gicc_accessible;
 
     /* Virtualization control interface */
     uint64_t ich_apr[3][4]; /* ich_apr[GICV3_G1][x] never used */
@@ -353,4 +354,39 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
  */
 const char *gicv3_class_name(void);
 
+/**
+ * gicv3_cpu_accessible
+ *
+ * The `GICv3CPUState` can become inaccessible if the associated `CPUState` is
+ * either unavailable or in a disabled state. This state is independent of the
+ * KVM VGIC and is not compliant with ARM CPU architecture (i.e. there is no
+ * way we can explicitly enable/disable ARM GIC CPU interface). This change
+ * is specific to QOM only.
+ *
+ * Returns: True if accessible otherwise False
+ */
+static inline bool gicv3_cpu_accessible(GICv3CPUState *gicc)
+{
+    assert(gicc);
+    return gicc->gicc_accessible;
+}
+
+/**
+ * gicv3_set_cpustate
+ *
+ * Sets `GICv3CPUState` and the associated `CPUState` as accessible and
+ * available for use
+ */
+static inline void gicv3_set_cpustate(GICv3CPUState *s,
+                                      CPUState *cpu,
+                                      bool gicc_accessible)
+{
+    if (gicc_accessible) {
+        s->cpu = cpu;
+        s->gicc_accessible = true;
+    } else {
+        s->cpu = NULL;
+        s->gicc_accessible = false;
+    }
+}
 #endif
-- 
2.34.1

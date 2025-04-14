Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2126338njc;
        Mon, 14 Apr 2025 09:40:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXPFi7K2OuetDbV5X2yR650iKmSOlzuduQyalOOp7iAyMeMPvd2L+CRpBdmcCRtkWb0ggocfuzW3D+5A==@linaro.org
X-Google-Smtp-Source: AGHT+IHRxZgDIYTK1gWX39ekXVWuFeW2urR6X+zmLgdJzCtRu2DgOd1QtgJw1d2G7R5MYdj/d3v0
X-Received: by 2002:a05:6902:2746:b0:e58:3209:bdb6 with SMTP id 3f1490d57ef6-e704de9c358mr21006426276.16.1744648858525;
        Mon, 14 Apr 2025 09:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648858; cv=none;
        d=google.com; s=arc-20240605;
        b=YtGlFlzbowYP4/EJSWh3i4tPnJo3CKhKI8/hgck11HGOICYo7mnPGQcV8RHTbP7Twx
         MdBNdxokU+PqR5vPpL1C+J8Bb0EUM17GpTgUSsk3ff/cGnZnCHciLibKvTAsBOzqYLBp
         cfyXUrAk1xCXxrzWThnqGrw6OCn1Y9rqmPHL/eGEPbxAzx+RbtqnN0DphyqJTEnLdIcC
         zkuyVeDoJb0/mM33MN7EB30bTc3oaOwPoxm6gd1+KH0a6rta3+OMCr2dzjzWhxBfFFjz
         7lRgQHMeYzMHGGkBFD5EXE5G9DiqeeqX8TFzQEewoEPYdn7fWccB+nNmnrXhvrjpza/V
         Rwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/cm0715fZCJ1Z/wDTOFk0hsjOspQTrfFjfUTkh4U41I=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=TCs6Q9/I6YfvuQyIJwhVba0ygHhpqRoXiX8dh54yeBNr3cuG+rGg8O6ms1PVN+H7M7
         l6tyugDv5+hqISpuF000A1Zeig3eY7DJXY07RSTLVKvDFhlpcuvSulEQC2XVaQYls7Si
         OwRyaiMIAzHgABIFibza1rXC1VpS4Mqj1fK3n8Mjs305UZNXymsN6lFkoa8VMahFzDjg
         Y/cFQ/veRiKqetQaIToWssFToxDLxblHsiUzEhMlVB1CLsl+iktLPBIhNw/Wdy2zlMkt
         pLExVbEc9ZOLsuaN5+Fp+M0uZ3HFPtLBYcsIIjw33WEk8KZZVTer51HCmoBhmJdGKljO
         fI+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UYHlLrM/";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e70327c17d7si17680312276.291.2025.04.14.09.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UYHlLrM/";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cm0715fZCJ1Z/wDTOFk0hsjOspQTrfFjfUTkh4U41I=;
	b=UYHlLrM/m19lp2x6tzIm9HXmulP1O2gTyseG2FmsOXOS0o4yTcK/DzPW6fbKiAoRWkUXgD
	pLPTgf7SdVPjWCTuS8ZFagrXWoU/GDJvkuXxyOcl6wJFfVnNnNNPUSKyqDHAGB9GEw4rts
	gXcoPeeEEAEH8kStU2JGNx2OX3fJK6U=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-rydyobF0My2CeO6h_6QyHg-1; Mon,
 14 Apr 2025 12:40:54 -0400
X-MC-Unique: rydyobF0My2CeO6h_6QyHg-1
X-Mimecast-MFC-AGG-ID: rydyobF0My2CeO6h_6QyHg_1744648853
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5EF3180AF4E;
	Mon, 14 Apr 2025 16:40:52 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20EDE180AF7C;
	Mon, 14 Apr 2025 16:40:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 06/10] arm/kvm: Allow reading all the writable ID registers
Date: Mon, 14 Apr 2025 18:38:45 +0200
Message-ID: <20250414163849.321857-7-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: ilYpv7r4/etk

From: Eric Auger <eric.auger@redhat.com>

At the moment kvm_arm_get_host_cpu_features() reads a subset of the
ID regs. As we want to introduce properties for all writable ID reg
fields, we want more genericity and read more default host register
values.

Introduce a new get_host_cpu_idregs() helper and add a new exhaustive
boolean parameter to kvm_arm_get_host_cpu_features() and
kvm_arm_set_cpu_features_from_host() to select the right behavior.
The host cpu model will keep the legacy behavior unless the writable
id register interface is available.

A writable_map IdRegMap is introduced in the CPU object. A subsequent
patch will populate it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h |  2 ++
 target/arm/cpu.h         |  3 ++
 target/arm/cpu64.c       |  2 +-
 target/arm/kvm.c         | 78 ++++++++++++++++++++++++++++++++++++++--
 target/arm/kvm_arm.h     |  9 +++--
 target/arm/trace-events  |  1 +
 6 files changed, 89 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
index e89a1105904c..367fab51f19e 100644
--- a/target/arm/cpu-sysregs.h
+++ b/target/arm/cpu-sysregs.h
@@ -41,6 +41,8 @@ int get_sysreg_idx(ARMSysRegs sysreg);
 
 #ifdef CONFIG_KVM
 uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
+int kvm_idx_to_idregs_idx(int kidx);
+int idregs_idx_to_kvm_idx(ARMIDRegisterIdx idx);
 #endif
 
 #endif /* ARM_CPU_SYSREGS_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 775a8aebc5d3..8717c5e7695b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1088,6 +1088,9 @@ struct ArchCPU {
      */
     ARMIdRegsState writable_id_regs;
 
+    /* ID reg writable bitmask (KVM only) */
+    IdRegMap *writable_map;
+
     /* QOM property to indicate we should use the back-compat CNTFRQ default */
     bool backcompat_cntfrq;
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 839442745ea4..60a709502697 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -757,7 +757,7 @@ static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
-    kvm_arm_set_cpu_features_from_host(cpu);
+    kvm_arm_set_cpu_features_from_host(cpu, false);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6e3cd06e9bc5..b07d5f16db50 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -41,6 +41,7 @@
 #include "hw/acpi/ghes.h"
 #include "target/arm/gtimer.h"
 #include "migration/blocker.h"
+#include "cpu-custom.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_INFO(DEVICE_CTRL),
@@ -270,7 +271,73 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx i
     return ret;
 }
 
-static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
+int kvm_idx_to_idregs_idx(int kidx)
+{
+    int op1, crm, op2;
+    ARMSysRegs sysreg;
+
+    op1 = kidx / 64;
+    if (op1 == 2) {
+        op1 = 3;
+    }
+    crm = (kidx % 64) / 8;
+    op2 = kidx % 8;
+    sysreg = ENCODE_ID_REG(3, op1, 0, crm, op2);
+    return get_sysreg_idx(sysreg);
+}
+
+int idregs_idx_to_kvm_idx(ARMIDRegisterIdx idx)
+{
+    ARMSysRegs sysreg = id_register_sysreg[idx];
+
+    return KVM_ARM_FEATURE_ID_RANGE_IDX((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >> CP_REG_ARM64_SYSREG_OP0_SHIFT,
+                                        (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >> CP_REG_ARM64_SYSREG_OP1_SHIFT,
+                                        (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >> CP_REG_ARM64_SYSREG_CRN_SHIFT,
+                                        (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >> CP_REG_ARM64_SYSREG_CRM_SHIFT,
+                                        (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >> CP_REG_ARM64_SYSREG_OP2_SHIFT);
+}
+
+
+/*
+ * get_host_cpu_idregs: Read all the writable ID reg host values
+ *
+ * Need to be called once the writable mask has been populated
+ * Note we may want to read all the known id regs but some of them are not
+ * writable and return an error, hence the choice of reading only those which
+ * are writable. Those are also readable!
+ */
+static int get_host_cpu_idregs(ARMCPU *cpu, int fd, ARMHostCPUFeatures *ahcf)
+{
+    int err = 0;
+    int i;
+
+    for (i = 0; i < NUM_ID_IDX; i++) {
+        ARM64SysReg *sysregdesc = &arm64_id_regs[i];
+        ARMSysRegs sysreg = sysregdesc->sysreg;
+        uint64_t writable_mask = cpu->writable_map->regs[idregs_idx_to_kvm_idx(i)];
+        uint64_t *reg;
+        int ret;
+
+        if (!writable_mask) {
+            continue;
+        }
+
+        reg = &ahcf->isar.idregs[i];
+        ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
+        trace_get_host_cpu_idregs(sysregdesc->name, *reg);
+        if (ret) {
+            error_report("%s error reading value of host %s register (%m)",
+                         __func__, sysregdesc->name);
+
+            err = ret;
+        }
+    }
+    return err;
+}
+
+static bool
+kvm_arm_get_host_cpu_features(ARMCPU *cpu, ARMHostCPUFeatures *ahcf,
+                              bool exhaustive)
 {
     /* Identify the feature bits corresponding to the host CPU, and
      * fill out the ARMHostCPUClass fields accordingly. To do this
@@ -398,6 +465,11 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= get_host_cpu_reg(fd, ahcf, ID_DFR1_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_MMFR5_EL1_IDX);
 
+        /* Make sure writable ID reg values are read */
+        if (exhaustive) {
+            err |= get_host_cpu_idregs(cpu, fd, ahcf);
+        }
+
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
          * provide an accessor for it in 64-bit mode, which is what this
@@ -467,13 +539,13 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     return true;
 }
 
-void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu, bool exhaustive)
 {
     CPUARMState *env = &cpu->env;
 
     if (!arm_host_cpu_features.dtb_compatible) {
         if (!kvm_enabled() ||
-            !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
+            !kvm_arm_get_host_cpu_features(cpu, &arm_host_cpu_features, exhaustive)) {
             /* We can't report this error yet, so flag that we need to
              * in arm_cpu_realizefn().
              */
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 8d1f20ca8d89..90ba4f7d8987 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -141,8 +141,12 @@ uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu);
  *
  * Set up the ARMCPU struct fields up to match the information probed
  * from the host CPU.
+ *
+ * @cpu: cpu object
+ * @exhaustive: if true, all the feature ID regs are queried instead of
+ *              a subset
  */
-void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
+void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu, bool exhaustive);
 
 /**
  * kvm_arm_add_vcpu_properties:
@@ -257,7 +261,8 @@ static inline int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
 /*
  * These functions should never actually be called without KVM support.
  */
-static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu,
+                                                      bool exhaustive)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 4438dce7becc..17e52c0705f2 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -13,3 +13,4 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
+get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
-- 
2.49.0

Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1979107njc;
        Tue, 11 Mar 2025 09:30:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmKwSNko1Wc2N6ugEytsp9i/8cTffJEw4HrjkBZQONN5jb613JW7iOOcZoKCVpqg2cCw95W6XUqnoBkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIN/4d3byKCoB1BnyzNvImgDURLWbd7j9ja8qS4iQ6dCkQig708YJAolJ/rIwZRk8ODOs3
X-Received: by 2002:a05:6402:4409:b0:5e7:2871:c137 with SMTP id 4fb4d7f45d1cf-5e75df5ad87mr5218723a12.14.1741710649649;
        Tue, 11 Mar 2025 09:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741710649; cv=none;
        d=google.com; s=arc-20240605;
        b=i9EEARcXNL24LbTKrBvtskGad+4CVIyQGR3DRk7uRDovZNUr1ZsbuuiYVeMOIUP5ZE
         YgpdSA4Zs1VTaxSjv6byKd8Bq6dUDBsOc/XcE+1Zr6fGz+bLXlWYc5vQhTvcLzyp7DAB
         nuiLQl0Xn3Bys/c0xNqfzV6GPWEoVs6k99PL+hQdnKVcqLSSmRIxp+G2EvG+DBCFQfSo
         UcVedC62XM5878/tkZmkcugOwlI74JIp/obbkWZIcwNcFGNhzSsfi1vo2tY1/MlKTSjB
         Mq/f8bZSOV0m2zypI0j0oEfBteQMIRwNu8rjOZLfrWWLD/efmR9GMHqAieHTFk41q8hG
         esuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c6RYtQSkS1IuQnsH/hST9ULUOYHbStB6hl7gpODdDuY=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=HJmnnYKcQVum2U2T7Bt49pBRyvAEq7JWJuCz+d1udFmDCx1BzbNR8txULh2ZeSFNUB
         oaBSbvKUg3jHUoApCBXGZGyr8lA8LfB3yuY9r9B6NWlZOn3+qsOOoJFyxgRN2NcZf1U1
         RRtKnwQ3PXf2zlPnHomUr0IAOkVG4DCcXMmGxYgtgeMYO7Y0sVGEMnoL9iOidqBN83d8
         b3JRlfmwe58EvhqBUOPmQitIOOfsgS3P0gwH3EobzM02xISAT/6VasXgH/8PzhmNgkuY
         Llqa5gi2eiAPfl4fh14nJ5Tpwc7E3nz2H8HtQmXaSFd3GC7+RKUeKnmFtyc1WjYKyvBr
         xbcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IMEMfUK5;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5e5c75f20ddsi11030227a12.224.2025.03.11.09.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IMEMfUK5;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741710648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6RYtQSkS1IuQnsH/hST9ULUOYHbStB6hl7gpODdDuY=;
	b=IMEMfUK5ffm6UwgTd9iq8wMIj0MBVR6MhMQmeXi0JAAf8/MwxyzWApreDSG/o71Blr5lMI
	uPpCjs7krykuMWJpXuyVCjLF4jEQeVmsDX0p/y5eBRbnHZGRGpmya5yfp8aIRyA1HfrAcN
	+dZ/yT5DdIIYJE15bpHa4qu0kTxHVRs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-RO5QKMYdOBmSbJTIT1jMsQ-1; Tue,
 11 Mar 2025 12:30:45 -0400
X-MC-Unique: RO5QKMYdOBmSbJTIT1jMsQ-1
X-Mimecast-MFC-AGG-ID: RO5QKMYdOBmSbJTIT1jMsQ_1741710643
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 421FC19560B7;
	Tue, 11 Mar 2025 16:30:43 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.185])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 818F91800373;
	Tue, 11 Mar 2025 16:30:26 +0000 (UTC)
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
	jdenemar@redhat.com,
	agraf@csgraf.de
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 07/14] arm/cpu: Store aa64dfr0/1 into the idregs array
Date: Tue, 11 Mar 2025 17:28:17 +0100
Message-ID: <20250311162824.199721-8-cohuck@redhat.com>
In-Reply-To: <20250311162824.199721-1-cohuck@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: KJaV7JnXdcYg

From: Eric Auger <eric.auger@redhat.com>

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-features.h | 16 ++++++++--------
 target/arm/cpu.c          | 15 +++++----------
 target/arm/cpu.h          |  2 --
 target/arm/cpu64.c        |  4 ++--
 target/arm/helper.c       |  4 ++--
 target/arm/hvf/hvf.c      |  4 ++--
 target/arm/internals.h    |  6 +++---
 target/arm/kvm.c          | 12 +++++-------
 target/arm/tcg/cpu64.c    | 33 +++++++++++++++++----------------
 9 files changed, 44 insertions(+), 52 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 36c35f6a434a..7f6331ca437d 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -900,30 +900,30 @@ static inline bool isar_feature_aa64_nv2(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_pmuv3p1(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+    return FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) >= 4 &&
+        FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
 static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
-        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+    return FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) >= 5 &&
+        FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
 static inline bool isar_feature_aa64_pmuv3p5(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 6 &&
-        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+    return FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) >= 6 &&
+        FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
 static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+    return FIELD_EX64_IDREG(id, ID_AA64DFR0, DEBUGVER) >= 8;
 }
 
 static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
 {
-    return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
+    return FIELD_SEX64_IDREG(id, ID_AA64DFR0, DOUBLELOCK) >= 0;
 }
 
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 98f3e2f999a8..c0c6561c79ca 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2352,8 +2352,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 cpu);
 #endif
     } else {
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64DFR0, PMUVER, 0);
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, PERFMON, 0);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
@@ -2413,19 +2412,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * try to access the non-existent system registers for them.
          */
         /* FEAT_SPE (Statistical Profiling Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64DFR0, PMSVER, 0);
         /* FEAT_TRBE (Trace Buffer Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEBUFFER, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64DFR0, TRACEBUFFER, 0);
         /* FEAT_TRF (Self-hosted Trace Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEFILT, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64DFR0, TRACEFILT, 0);
         cpu->isar.id_dfr0 =
             FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, TRACEFILT, 0);
         /* Trace Macrocell system register access */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEVER, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64DFR0, TRACEVER, 0);
         cpu->isar.id_dfr0 =
             FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPTRC, 0);
         /* Memory mapped trace */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5351d3f3f2df..04f19ce48cfe 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1097,8 +1097,6 @@ struct ArchCPU {
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
-        uint64_t id_aa64dfr0;
-        uint64_t id_aa64dfr1;
         uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
         uint64_t idregs[NUM_ID_IDX];
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6d51a53b0abb..4ba53f75ed96 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -671,7 +671,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
+    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
     cpu->isar.dbgdidr = 0x3516d000;
@@ -733,7 +733,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
+    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(isar, ID_AA64MMFR0, 0x00001122); /* 40 bit physical addr */
     cpu->isar.dbgdidr = 0x3516d000;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 706b547a07bf..3a107044026c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7740,12 +7740,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64dfr0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64DFR0) },
             { .name = "ID_AA64DFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64dfr1 },
+              .resetvalue = GET_IDREG(isar, ID_AA64DFR1) },
             { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index a5570e6a5fce..b94097a293d8 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -867,8 +867,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     } regs[] = {
         { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.idregs[ID_AA64PFR0_EL1_IDX] },
         { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.idregs[ID_AA64PFR1_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
-        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
+        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.idregs[ID_AA64DFR0_EL1_IDX] },
+        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.idregs[ID_AA64DFR1_EL1_IDX] },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
         { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.idregs[ID_AA64ISAR1_EL1_IDX] },
         /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b3187341456a..3b7c09b0911f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1035,7 +1035,7 @@ static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline int arm_num_brps(ARMCPU *cpu)
 {
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, BRPS) + 1;
+        return FIELD_EX64_IDREG(&cpu->isar, ID_AA64DFR0, BRPS) + 1;
     } else {
         return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, BRPS) + 1;
     }
@@ -1049,7 +1049,7 @@ static inline int arm_num_brps(ARMCPU *cpu)
 static inline int arm_num_wrps(ARMCPU *cpu)
 {
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, WRPS) + 1;
+        return FIELD_EX64_IDREG(&cpu->isar, ID_AA64DFR0, WRPS) + 1;
     } else {
         return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, WRPS) + 1;
     }
@@ -1063,7 +1063,7 @@ static inline int arm_num_wrps(ARMCPU *cpu)
 static inline int arm_num_ctx_cmps(ARMCPU *cpu)
 {
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) + 1;
+        return FIELD_EX64_IDREG(&cpu->isar, ID_AA64DFR0, CTX_CMPS) + 1;
     } else {
         return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, CTX_CMPS) + 1;
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5f3c42b94690..e999d98dcf7f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -355,10 +355,8 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR1_EL1_IDX);
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 5));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
-                              ARM64_SYS_REG(3, 0, 0, 5, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
-                              ARM64_SYS_REG(3, 0, 0, 5, 1));
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR0_EL1_IDX);
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR1_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR1_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR2_EL1_IDX);
@@ -427,10 +425,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
          * We only do this if the CPU supports AArch32 at EL1.
          */
         if (FIELD_EX32_IDREG(&ahcf->isar, ID_AA64PFR0, EL1) >= 2) {
-            int wrps = FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
-            int brps = FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
+            int wrps = FIELD_EX64_IDREG(&ahcf->isar, ID_AA64DFR0, WRPS);
+            int brps = FIELD_EX64_IDREG(&ahcf->isar, ID_AA64DFR0, BRPS);
             int ctx_cmps =
-                FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
+                FIELD_EX64_IDREG(&ahcf->isar, ID_AA64DFR0, CTX_CMPS);
             int version = 6; /* ARMv8 debug architecture */
             bool has_el3 =
                 !!FIELD_EX32_IDREG(&ahcf->isar, ID_AA64PFR0, EL3);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 439c29e69546..41077b3dcd08 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -65,8 +65,8 @@ static void aarch64_a35_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
     SET_IDREG(isar, ID_AA64PFR1, 0);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64dfr1 = 0;
+    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
+    SET_IDREG(isar, ID_AA64DFR1, 0);
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(isar, ID_AA64ISAR1, 0);
     SET_IDREG(isar, ID_AA64MMFR0, 0x00101122);
@@ -219,7 +219,7 @@ static void aarch64_a55_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0x84448004; /* L1Ip = VIPT */
     cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull);
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
     SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101122ull);
@@ -310,7 +310,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_isar4 = 0x00011142;
     cpu->isar.id_isar5 = 0x00011121;
     SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
+    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
     cpu->isar.dbgdidr = 0x3516d000;
@@ -352,7 +352,7 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0x8444C004;
     cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull),
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
     SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101122ull);
@@ -426,8 +426,8 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->reset_sctlr = 0x30000180;
     SET_IDREG(isar, ID_AA64PFR0, 0x0000000101111111); /* No RAS Extensions */
     SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000000);
-    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
-    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
+    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408),
+    SET_IDREG(isar, ID_AA64DFR1, 0x0000000000000000),
     cpu->id_aa64afr0 = 0x0000000000000000;
     cpu->id_aa64afr1 = 0x0000000000000000;
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000001122);
@@ -600,7 +600,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0x8444c004;
     cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
+    SET_IDREG(isar, ID_AA64DFR0, 0x0000000110305408ull);
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
     SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101125ull);
@@ -678,8 +678,8 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->dcz_blocksize = 4;
     cpu->id_aa64afr0 = 0x00000000;
     cpu->id_aa64afr1 = 0x00000000;
-    cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
-    cpu->isar.id_aa64dfr1 = 0x00000000;
+    SET_IDREG(isar, ID_AA64DFR0, 0x000001f210305519ull),
+    SET_IDREG(isar, ID_AA64DFR1, 0x00000000),
     SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
     SET_IDREG(isar, ID_AA64ISAR1, 0x0011000001211032ull);
     SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101125ull);
@@ -925,8 +925,9 @@ static void aarch64_a710_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
     SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000221ull);
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
-    cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
-    cpu->isar.id_aa64dfr1  = 0;
+    SET_IDREG(isar, ID_AA64DFR0, 0x000011f010305619ull);
+    SET_IDREG(isar, ID_AA64DFR0, 0x000011f010305619ull);
+    SET_IDREG(isar, ID_AA64DFR1, 0);
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
     SET_IDREG(isar, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
@@ -1027,8 +1028,8 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
     SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000221ull);
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
-    cpu->isar.id_aa64dfr0  = 0x000011f210305619ull;
-    cpu->isar.id_aa64dfr1  = 0;
+    SET_IDREG(isar, ID_AA64DFR0, 0x000011f210305619ull);
+    SET_IDREG(isar, ID_AA64DFR1, 0);
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
     SET_IDREG(isar, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
@@ -1261,11 +1262,11 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
     SET_IDREG(isar, ID_AA64ZFR0, t);
 
-    t = cpu->isar.id_aa64dfr0;
+    t = GET_IDREG(isar, ID_AA64DFR0);
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 10); /* FEAT_Debugv8p8 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
     t = FIELD_DP64(t, ID_AA64DFR0, HPMN0, 1);     /* FEAT_HPMN0 */
-    cpu->isar.id_aa64dfr0 = t;
+    SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = cpu->isar.id_aa64smfr0;
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
-- 
2.48.1

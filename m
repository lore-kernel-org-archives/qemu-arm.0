Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp939835njx;
        Fri, 25 Oct 2024 03:21:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4qbfO10VVIOgEr6TZreLFNUDJpZh7GS0fx44wOpn0sMkopMYwlXU7BOXAdTJyEiSWjsIFaLWf2LmnCA==@linaro.org
X-Google-Smtp-Source: AGHT+IGNMv9XVKsK3W+GXjJg2ar0Msh9g5gm4gaiK7tvaW7VZNNVKFAJV6g2xZVYdlDffp6XWdP2
X-Received: by 2002:a05:690c:d81:b0:6dc:56d0:acbd with SMTP id 00721157ae682-6e7f0e3226emr110152347b3.12.1729851669487;
        Fri, 25 Oct 2024 03:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851669; cv=none;
        d=google.com; s=arc-20240605;
        b=VmRh4wL1ThWiWuieqhcx85cfMuxuT3itojdyIhO3DWS6dx+qZjMvBHuYst+9Bzxwho
         fyWXO74A6yaxuEvyvo4wZoLkbNrnNbxuQC9i4hm90QIF9fjwYTbzi4om7VRM65SkDaHD
         L+JsRhGxhFC/XWdrC+Y51HCHDqODKuvS7fjnjqt/w8rnljqLQCusVAMFWmThshFE50cP
         +610HzzuiKzm7HyKT3EM9FxyvwOGsCA4VwBf83jZvfF4/RbcBjJpkso6pIKoguld+xia
         l1+zMwCFzYBNfUX0T/ikvvsdd9RlwRi10Yty33kgvhsA1SyZjL/dVBCce8qAamz6YRwm
         eAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7nLWunarrq+/u934fMfe3nXKCXuoB72NkHJOeLzth3c=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=bJ9Ggb3m1ZwHe+Bmx/PDXJQRryzIFo0z7KcHoyl+svpu9EIaK2a8vW2+NuLgorD1pz
         WhfVVwZjMeiObf1v7K86Vl+4DY77MienCitDhASh29MQQl+WNQpU3v9E4wIM6UzUUa/x
         0CepdgiLVXd5rkXuPvO91HGmnsOQdU6OPVlwL47KEHHmtZIFeGGY+4eQbx4U1EewdiOB
         aHMC8HX3t/+eyxSeNrESQrF3um7JbwHehaJV3oH7Zl4zuiDpkYLIriaa+sJIKZsl7IB4
         K8QkDQRseWEp7zEjZ2teYV2Qvewphc5fHRdmxkdkc4geherfW5xKr9BASY75NdGGL9c8
         uuPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UM25oSxa;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a805edsi11877186d6.520.2024.10.25.03.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UM25oSxa;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7nLWunarrq+/u934fMfe3nXKCXuoB72NkHJOeLzth3c=;
	b=UM25oSxaDXgObfrkks/gxcUkdTBu/xkDl9gnJyz7KL382w4eRIZf2tJBcUTzWHUNc1ySKh
	cw5tyV9J8BkLG6vzkZyp1nDO7t5GMM+mpr6Z1S8KfsmX8BoNn0dyM7eiqBfUXVC7j/Oo7t
	aUqVtsoiIM0A4F/THuqf5QR02MF9btY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-8AVMhiJgPr2hN5f5MRS9fg-1; Fri,
 25 Oct 2024 06:21:04 -0400
X-MC-Unique: 8AVMhiJgPr2hN5f5MRS9fg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F39DE19560B2;
	Fri, 25 Oct 2024 10:21:02 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74225196BB7D;
	Fri, 25 Oct 2024 10:20:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	cohuck@redhat.com,
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
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: [RFC 07/21] arm/cpu: Store aa64drf0/1 into the idregs array
Date: Fri, 25 Oct 2024 12:17:26 +0200
Message-ID: <20241025101959.601048-8-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: h+xqjNfw6qVv

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu-features.h | 16 ++++++++--------
 target/arm/cpu.h          |  2 --
 target/arm/internals.h    |  6 +++---
 target/arm/cpu.c          | 15 +++++----------
 target/arm/cpu64.c        |  4 ++--
 target/arm/helper.c       |  4 ++--
 target/arm/kvm.c          |  6 ++----
 target/arm/tcg/cpu64.c    | 33 +++++++++++++++++----------------
 8 files changed, 39 insertions(+), 47 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 45f315df7b..9b0d5157bf 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -874,30 +874,30 @@ static inline bool isar_feature_aa64_nv2(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_pmuv3p1(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+    return FIELD_EX64_IDREG(&id->idregs, ID_AA64DFR0, PMUVER) >= 4 &&
+        FIELD_EX64_IDREG(&id->idregs, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
 static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
-        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+    return FIELD_EX64_IDREG(&id->idregs, ID_AA64DFR0, PMUVER) >= 5 &&
+        FIELD_EX64_IDREG(&id->idregs, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
 static inline bool isar_feature_aa64_pmuv3p5(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 6 &&
-        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+    return FIELD_EX64_IDREG(&id->idregs, ID_AA64DFR0, PMUVER) >= 6 &&
+        FIELD_EX64_IDREG(&id->idregs, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
 static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+    return FIELD_EX64_IDREG(&id->idregs, ID_AA64DFR0, DEBUGVER) >= 8;
 }
 
 static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
 {
-    return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
+    return FIELD_SEX64_IDREG(&id->idregs, ID_AA64DFR0, DOUBLELOCK) >= 0;
 }
 
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 419dfde638..6954952d5f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1088,8 +1088,6 @@ struct ArchCPU {
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
-        uint64_t id_aa64dfr0;
-        uint64_t id_aa64dfr1;
         uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
         IdRegMap idregs;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index e1aa1a63b9..02c57f546b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1002,7 +1002,7 @@ static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline int arm_num_brps(ARMCPU *cpu)
 {
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, BRPS) + 1;
+        return FIELD_EX64_IDREG(&cpu->isar.idregs, ID_AA64DFR0, BRPS) + 1;
     } else {
         return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, BRPS) + 1;
     }
@@ -1016,7 +1016,7 @@ static inline int arm_num_brps(ARMCPU *cpu)
 static inline int arm_num_wrps(ARMCPU *cpu)
 {
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, WRPS) + 1;
+        return FIELD_EX64_IDREG(&cpu->isar.idregs, ID_AA64DFR0, WRPS) + 1;
     } else {
         return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, WRPS) + 1;
     }
@@ -1030,7 +1030,7 @@ static inline int arm_num_wrps(ARMCPU *cpu)
 static inline int arm_num_ctx_cmps(ARMCPU *cpu)
 {
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) + 1;
+        return FIELD_EX64_IDREG(&cpu->isar.idregs, ID_AA64DFR0, CTX_CMPS) + 1;
     } else {
         return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, CTX_CMPS) + 1;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cbfb6df435..42664dbfc1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2348,8 +2348,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 cpu);
 #endif
     } else {
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
+        FIELD_DP64_IDREG(idregs, ID_AA64DFR0, PMUVER, 0);
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, PERFMON, 0);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
@@ -2401,19 +2400,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * try to access the non-existent system registers for them.
          */
         /* FEAT_SPE (Statistical Profiling Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
+        FIELD_DP64_IDREG(idregs, ID_AA64DFR0, PMSVER, 0);
         /* FEAT_TRBE (Trace Buffer Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEBUFFER, 0);
+        FIELD_DP64_IDREG(idregs, ID_AA64DFR0, TRACEBUFFER, 0);
         /* FEAT_TRF (Self-hosted Trace Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEFILT, 0);
+        FIELD_DP64_IDREG(idregs, ID_AA64DFR0, TRACEFILT, 0);
         cpu->isar.id_dfr0 =
             FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, TRACEFILT, 0);
         /* Trace Macrocell system register access */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEVER, 0);
+        FIELD_DP64_IDREG(idregs, ID_AA64DFR0, TRACEVER, 0);
         cpu->isar.id_dfr0 =
             FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPTRC, 0);
         /* Memory mapped trace */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 594778a031..85f581edb7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -630,7 +630,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     SET_IDREG(idregs, ID_AA64PFR0, 0x00002222);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x10305106);
     SET_IDREG(idregs, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x00001124);
     cpu->isar.dbgdidr = 0x3516d000;
@@ -689,7 +689,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     SET_IDREG(idregs, ID_AA64PFR0, 0x00002222);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x10305106);
     SET_IDREG(idregs, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x00001122); /* 40 bit physical addr */
     cpu->isar.dbgdidr = 0x3516d000;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa04383921..c15b24933d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8915,12 +8915,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64dfr0 },
+              .resetvalue = GET_IDREG(idregs, ID_AA64DFR0) },
             { .name = "ID_AA64DFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64dfr1 },
+              .resetvalue = GET_IDREG(idregs, ID_AA64DFR1) },
             { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index c9b99bf5ee..7377e4a133 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -328,10 +328,8 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64PFR1_EL1);
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 5));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
-                              ARM64_SYS_REG(3, 0, 0, 5, 0));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
-                              ARM64_SYS_REG(3, 0, 0, 5, 1));
+        err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64DFR0_EL1);
+        err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64DFR1_EL1);
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64ISAR0_EL1);
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64ISAR1_EL1);
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64ISAR2_EL1);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 64473fc3c7..56f086cb28 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -91,8 +91,8 @@ static void aarch64_a35_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     SET_IDREG(idregs, ID_AA64PFR0, 0x00002222);
     SET_IDREG(idregs, ID_AA64PFR1, 0);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64dfr1 = 0;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x10305106);
+    SET_IDREG(idregs, ID_AA64DFR1, 0);
     SET_IDREG(idregs, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(idregs, ID_AA64ISAR1, 0);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x00101122);
@@ -242,7 +242,7 @@ static void aarch64_a55_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0x84448004; /* L1Ip = VIPT */
     cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x0000000010305408ull);
     SET_IDREG(idregs, ID_AA64ISAR0, 0x0000100010211120ull);
     SET_IDREG(idregs, ID_AA64ISAR1, 0x0000000000100001ull);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x0000000000101122ull);
@@ -330,7 +330,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_isar4 = 0x00011142;
     cpu->isar.id_isar5 = 0x00011121;
     SET_IDREG(idregs, ID_AA64PFR0, 0x00002222);
-    cpu->isar.id_aa64dfr0 = 0x10305106;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x10305106);
     SET_IDREG(idregs, ID_AA64ISAR0, 0x00011120);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x00001124);
     cpu->isar.dbgdidr = 0x3516d000;
@@ -369,7 +369,7 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0x8444C004;
     cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x0000000010305408ull),
     SET_IDREG(idregs, ID_AA64ISAR0, 0x0000100010211120ull);
     SET_IDREG(idregs, ID_AA64ISAR1, 0x0000000000100001ull);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x0000000000101122ull);
@@ -440,8 +440,8 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->reset_sctlr = 0x30000180;
     SET_IDREG(idregs, ID_AA64PFR0, 0x0000000101111111); /* No RAS Extensions */
     SET_IDREG(idregs, ID_AA64PFR1, 0x0000000000000000);
-    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
-    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x0000000010305408),
+    SET_IDREG(idregs, ID_AA64DFR1, 0x0000000000000000),
     cpu->id_aa64afr0 = 0x0000000000000000;
     cpu->id_aa64afr1 = 0x0000000000000000;
     SET_IDREG(idregs, ID_AA64MMFR0, 0x0000000000001122);
@@ -611,7 +611,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->clidr = 0x82000023;
     cpu->ctr = 0x8444c004;
     cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x0000000110305408ull);
     SET_IDREG(idregs, ID_AA64ISAR0, 0x0000100010211120ull);
     SET_IDREG(idregs, ID_AA64ISAR1, 0x0000000000100001ull);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x0000000000101125ull);
@@ -686,8 +686,8 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->dcz_blocksize = 4;
     cpu->id_aa64afr0 = 0x00000000;
     cpu->id_aa64afr1 = 0x00000000;
-    cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
-    cpu->isar.id_aa64dfr1 = 0x00000000;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x000001f210305519ull),
+    SET_IDREG(idregs, ID_AA64DFR1, 0x00000000),
     SET_IDREG(idregs, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
     SET_IDREG(idregs, ID_AA64ISAR1, 0x0111000001211032ull);
     SET_IDREG(idregs, ID_AA64MMFR0, 0x0000000000101125ull);
@@ -930,8 +930,9 @@ static void aarch64_a710_initfn(Object *obj)
     SET_IDREG(idregs, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
     SET_IDREG(idregs, ID_AA64PFR1, 0x0000000000000221ull);
     SET_IDREG(idregs, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
-    cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
-    cpu->isar.id_aa64dfr1  = 0;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x000011f010305619ull);
+    SET_IDREG(idregs, ID_AA64DFR0, 0x000011f010305619ull);
+    SET_IDREG(idregs, ID_AA64DFR1, 0);
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
     SET_IDREG(idregs, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
@@ -1029,8 +1030,8 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     SET_IDREG(idregs, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
     SET_IDREG(idregs, ID_AA64PFR1, 0x0000000000000221ull);
     SET_IDREG(idregs, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
-    cpu->isar.id_aa64dfr0  = 0x000011f210305619ull;
-    cpu->isar.id_aa64dfr1  = 0;
+    SET_IDREG(idregs, ID_AA64DFR0, 0x000011f210305619ull);
+    SET_IDREG(idregs, ID_AA64DFR1, 0);
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
     SET_IDREG(idregs, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
@@ -1257,11 +1258,11 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
     SET_IDREG(idregs, ID_AA64ZFR0, t);
 
-    t = cpu->isar.id_aa64dfr0;
+    t = GET_IDREG(idregs, ID_AA64DFR0);
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 10); /* FEAT_Debugv8p8 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
     t = FIELD_DP64(t, ID_AA64DFR0, HPMN0, 1);     /* FEAT_HPMN0 */
-    cpu->isar.id_aa64dfr0 = t;
+    SET_IDREG(idregs, ID_AA64DFR0, t);
 
     t = cpu->isar.id_aa64smfr0;
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
-- 
2.41.0

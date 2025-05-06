Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2973438njj;
        Tue, 6 May 2025 01:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJF4eJ1oCoilsVH7xJ3OojqtNm9pbc3VUdXp1YWOrEgNxcDe4FQwrMeStEwAvSSW5izQvwexvNCcONMg==@linaro.org
X-Google-Smtp-Source: AGHT+IHQ3BguiBNsYFNs4IUA4E4EVJEGrpDrZkaQ4EXsNQV2VxiULp86S8LBLRWIaFRr96RPsttt
X-Received: by 2002:a05:622a:1a93:b0:476:78a8:435c with SMTP id d75a77b69052e-490f19bf473mr35687141cf.16.1746521603492;
        Tue, 06 May 2025 01:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746521603; cv=none;
        d=google.com; s=arc-20240605;
        b=fxJJLOIFXM1ZyGKa6vuACrOlcXNfdtHQeOGnzW6afTyl8t2/RT89OMKJ9V5udWbiUX
         Ul3b7uKpvQjXlBUy4U5d7DQt1hLDHikdFCeCreLHgKEqt4aKcTiL9XPiDyyRncTNannC
         de35Hl0CZVvAcr2TiCBytPzg4P1xU9Z1J0rd+x418XFeySycSM3vCPEWRDwfLmlr21Nk
         8xSGE5uUO/Q1b1zoxDZHwMm2ILMsPdNrWBA15e3yU+kLXODIPkpchnLgLPfDPT2a6Qsk
         sl96FFzpaBcV0pkktpWRL8Pn25C6bHTvWyiQ3h2RMSrbmQbxC/8d5J8wuPD+UC8V1/mg
         pChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P2yUVAoPL1wkDu3IONL0Y+tUmqj7y5BRz73jnWDllVc=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=fGAUOe4j7RnnwD7HF1PI5jPyyNLxrF7Kiit5DsczcDDBPjSJacsu9oRfmvOgNrhLos
         BRrjIFe5PNOA820kpTuzPJ3ed54K/gJodogIsq6Jhrqlo84BlRFR2nWnetOXkVMokhMB
         qawQeAaYDZomosSspdiOz4vODhwJWyFZoeC5uF5sQmkh3v96QmIHhXt7ei4zd9juXuZL
         XZBS7e8Nb9AIxWbjUbWpPNsI6tie1xPVrY1NteZOiCm5JFF3o51ETzEBwGTO4Y3uGhwJ
         KzjP1An4E2tIZ/U76el5Q6Z78Td96QA0NwYLKxKkXIvkolMfpf/4T+bI9a6lomx3nxZv
         7drA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YcbP55yX;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-48ececac907si52165721cf.0.2025.05.06.01.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YcbP55yX;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746521603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2yUVAoPL1wkDu3IONL0Y+tUmqj7y5BRz73jnWDllVc=;
	b=YcbP55yXQsLGYUANXd6+qi4tdIDd6FuDSMTdGKQQMFLGJCXFvG1L7NwSVKFmuKg8Njqemr
	BF/tc4x2KSkxX1uTZIPYPQL5UPrpDvVq8WEb+wH93UdHVi7MO1mEyokaSwO7gB9Ij8e/0f
	qrxAfPkJnAY4T5bkSUyliJILgSIF9/U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-CeTVp76uMWyqf9cM01xeaQ-1; Tue,
 06 May 2025 04:53:20 -0400
X-MC-Unique: CeTVp76uMWyqf9cM01xeaQ-1
X-Mimecast-MFC-AGG-ID: CeTVp76uMWyqf9cM01xeaQ_1746521597
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A9F9180099A;
	Tue,  6 May 2025 08:53:17 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 521AF1956094;
	Tue,  6 May 2025 08:53:11 +0000 (UTC)
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
Subject: [PATCH v6 04/14] arm/cpu: Store aa64pfr0/1 into the idregs array
Date: Tue,  6 May 2025 10:52:24 +0200
Message-ID: <20250506085234.855779-5-cohuck@redhat.com>
In-Reply-To: <20250506085234.855779-1-cohuck@redhat.com>
References: <20250506085234.855779-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: 4KIF4YF2vMdO

From: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-features.h | 40 ++++++++++++++++-----------------
 target/arm/cpu.c          | 29 ++++++++----------------
 target/arm/cpu.h          |  2 --
 target/arm/cpu64.c        | 14 ++++--------
 target/arm/helper.c       |  6 ++---
 target/arm/hvf/hvf.c      |  9 ++++----
 target/arm/kvm.c          | 18 +++++++--------
 target/arm/tcg/cpu64.c    | 47 ++++++++++++++++++---------------------
 8 files changed, 71 insertions(+), 94 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 37946d759375..5cc4721e6406 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -606,68 +606,68 @@ static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, FP) != 0xf;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, FP) != 0xf;
 }
 
 static inline bool isar_feature_aa64_fp16(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically wrt FP16.  */
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, FP) == 1;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, FP) == 1;
 }
 
 static inline bool isar_feature_aa64_aa32(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL0) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL0) >= 2;
 }
 
 static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL1) >= 2;
 }
 
 static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL2) >= 2;
 }
 
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, RAS) != 0;
 }
 
 static inline bool isar_feature_aa64_doublefault(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, RAS) >= 2;
 }
 
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, SVE) != 0;
 }
 
 static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, SEL2) != 0;
 }
 
 static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) != 0;
 }
 
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, DIT) != 0;
 }
 
 static inline bool isar_feature_aa64_scxtnum(const ARMISARegisters *id)
 {
-    int key = FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, CSV2);
+    int key = FIELD_EX64_IDREG(id, ID_AA64PFR0, CSV2);
     if (key >= 2) {
         return true;      /* FEAT_CSV2_2 */
     }
     if (key == 1) {
-        key = FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, CSV2_FRAC);
+        key = FIELD_EX64_IDREG(id, ID_AA64PFR1, CSV2_FRAC);
         return key >= 2;  /* FEAT_CSV2_1p2 */
     }
     return false;
@@ -675,37 +675,37 @@ static inline bool isar_feature_aa64_scxtnum(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, SSBS) != 0;
 }
 
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, BT) != 0;
 }
 
 static inline bool isar_feature_aa64_mte_insn_reg(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTE) != 0;
 }
 
 static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTE) >= 2;
 }
 
 static inline bool isar_feature_aa64_mte3(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 3;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTE) >= 3;
 }
 
 static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, SME) != 0;
 }
 
 static inline bool isar_feature_aa64_nmi(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, NMI) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, NMI) != 0;
 }
 
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bb88d320093c..3313a47eab2a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2128,14 +2128,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!cpu->has_vfp) {
-        uint64_t t;
         uint32_t u;
 
         FIELD_DP64_IDREG(isar, ID_AA64ISAR1, JSCVT, 0);
 
-        t = cpu->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, FP, 0xf);
-        cpu->isar.id_aa64pfr0 = t;
+        FIELD_DP64_IDREG(isar, ID_AA64PFR0, FP, 0xf);
 
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
@@ -2190,9 +2187,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
         SET_IDREG(isar, ID_AA64ISAR1, t);
 
-        t = cpu->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 0xf);
-        cpu->isar.id_aa64pfr0 = t;
+        FIELD_DP64_IDREG(isar, ID_AA64PFR0, ADVSIMD, 0xf);
 
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 0);
@@ -2334,12 +2329,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
-        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
-                                           ID_AA64PFR0, EL3, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL3, 0);
 
         /* Disable the realm management extension, which requires EL3. */
-        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
-                                           ID_AA64PFR0, RME, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64PFR0, RME, 0);
     }
 
     if (!cpu->has_el2) {
@@ -2374,8 +2367,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * Disable the hypervisor feature bits in the processor feature
          * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
-                                           ID_AA64PFR0, EL2, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL2, 0);
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
                                        ID_PFR1, VIRTUALIZATION, 0);
     }
@@ -2396,8 +2388,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * This matches Cortex-A710 BROADCASTMTE input being LOW.
          */
         if (tcg_enabled() && cpu->tag_memory == NULL) {
-            cpu->isar.id_aa64pfr1 =
-                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
+            FIELD_DP64_IDREG(isar, ID_AA64PFR1, MTE, 1);
         }
 
         /*
@@ -2405,7 +2396,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * enabled on the guest (i.e mte=off), clear guest's MTE bits."
          */
         if (kvm_enabled() && !cpu->kvm_mte) {
-                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
+                FIELD_DP64_IDREG(isar, ID_AA64PFR1, MTE, 0);
         }
 #endif
     }
@@ -2444,13 +2435,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_dfr0 =
             FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, MMAPTRC, 0);
         /* FEAT_AMU (Activity Monitors Extension) */
-        cpu->isar.id_aa64pfr0 =
-            FIELD_DP64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, AMU, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64PFR0, AMU, 0);
         cpu->isar.id_pfr0 =
             FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, AMU, 0);
         /* FEAT_MPAM (Memory Partitioning and Monitoring Extension) */
-        cpu->isar.id_aa64pfr0 =
-            FIELD_DP64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, MPAM, 0);
+        FIELD_DP64_IDREG(isar, ID_AA64PFR0, MPAM, 0);
     }
 
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df57d6a6155e..c0d61611561d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1077,8 +1077,6 @@ struct ArchCPU {
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
-        uint64_t id_aa64pfr0;
-        uint64_t id_aa64pfr1;
         uint64_t id_aa64mmfr0;
         uint64_t id_aa64mmfr1;
         uint64_t id_aa64mmfr2;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7077c104dad1..39d76546a105 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -310,16 +310,13 @@ static bool cpu_arm_get_sve(Object *obj, Error **errp)
 static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
 
     if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
         error_setg(errp, "'sve' feature not supported by KVM on this host");
         return;
     }
 
-    t = cpu->isar.id_aa64pfr0;
-    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
-    cpu->isar.id_aa64pfr0 = t;
+    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, SVE, value);
 }
 
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
@@ -370,11 +367,8 @@ static bool cpu_arm_get_sme(Object *obj, Error **errp)
 static void cpu_arm_set_sme(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
 
-    t = cpu->isar.id_aa64pfr1;
-    t = FIELD_DP64(t, ID_AA64PFR1, SME, value);
-    cpu->isar.id_aa64pfr1 = t;
+    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR1, SME, value);
 }
 
 static bool cpu_arm_get_sme_fa64(Object *obj, Error **errp)
@@ -676,7 +670,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_isar4 = 0x00011142;
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
+    SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
     cpu->isar.id_aa64dfr0 = 0x10305106;
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     cpu->isar.id_aa64mmfr0 = 0x00001124;
@@ -738,7 +732,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_isar4 = 0x00011142;
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
+    SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
     cpu->isar.id_aa64dfr0 = 0x10305106;
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 01f978c4097c..a8a276345336 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6944,7 +6944,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
 static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint64_t pfr0 = cpu->isar.id_aa64pfr0;
+    uint64_t pfr0 = GET_IDREG(&cpu->isar, ID_AA64PFR0);
 
     if (env->gicv3state) {
         pfr0 |= 1 << 24;
@@ -7918,7 +7918,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R,
 #ifdef CONFIG_USER_ONLY
               .type = ARM_CP_CONST,
-              .resetvalue = cpu->isar.id_aa64pfr0
+              .resetvalue = GET_IDREG(isar, ID_AA64PFR0)
 #else
               .type = ARM_CP_NO_RAW,
               .accessfn = access_aa64_tid3,
@@ -7930,7 +7930,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64pfr1},
+              .resetvalue = GET_IDREG(isar, ID_AA64PFR1)},
             { .name = "ID_AA64PFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 4a95aece6c31..7cae58ff4c87 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -863,8 +863,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         int reg;
         uint64_t *val;
     } regs[] = {
-        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
-        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
+        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.idregs[ID_AA64PFR0_EL1_IDX] },
+        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.idregs[ID_AA64PFR1_EL1_IDX] },
         { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
@@ -911,7 +911,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      * - fix any assumptions we made that SME implies SVE (since
      *   on the M4 there is SME but not SVE)
      */
-    host_isar.id_aa64pfr1 &= ~R_ID_AA64PFR1_SME_MASK;
+    SET_IDREG(&host_isar, ID_AA64PFR1,
+              GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_MASK);
 
     ahcf->isar = host_isar;
 
@@ -928,7 +929,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     ahcf->reset_sctlr |= 0x00800000;
 
     /* Make sure we don't advertise AArch32 support for EL0/EL1 */
-    if ((host_isar.id_aa64pfr0 & 0xff) != 0x11) {
+    if ((GET_IDREG(&host_isar, ID_AA64PFR0) & 0xff) != 0x11) {
         return false;
     }
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8ba20ad3d27..3e49dd68e89e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -331,8 +331,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     ahcf->dtb_compatible = "arm,arm-v8";
     int fd = fdarray[2];
 
-    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
-                         ARM64_SYS_REG(3, 0, 0, 4, 0));
+    err = get_host_cpu_reg(fd, ahcf, ID_AA64PFR0_EL1_IDX);
     if (unlikely(err < 0)) {
         /*
          * Before v4.15, the kernel only exposed a limited number of system
@@ -350,11 +349,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
          * ??? Either of these sounds like too much effort just
          *     to work around running a modern host kernel.
          */
-        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
+        SET_IDREG(&ahcf->isar, ID_AA64PFR0, 0x00000011); /* EL1&0, AArch64 only */
         err = 0;
     } else {
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
-                              ARM64_SYS_REG(3, 0, 0, 4, 1));
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR1_EL1_IDX);
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 5));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
@@ -434,14 +432,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
          * arch/arm64/kvm/sys_regs.c:trap_dbgidr() does.
          * We only do this if the CPU supports AArch32 at EL1.
          */
-        if (FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL1) >= 2) {
-            int wrps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
-            int brps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
+        if (FIELD_EX32_IDREG(&ahcf->isar, ID_AA64PFR0, EL1) >= 2) {
+            int wrps = FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
+            int brps = FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
             int ctx_cmps =
-                FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
+                FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
             int version = 6; /* ARMv8 debug architecture */
             bool has_el3 =
-                !!FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL3);
+                !!FIELD_EX32_IDREG(&ahcf->isar, ID_AA64PFR0, EL3);
             uint32_t dbgdidr = 0;
 
             dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, WRPS, wrps);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index f62e62595d8b..478ef839bafa 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -63,8 +63,8 @@ static void aarch64_a35_initfn(Object *obj)
     cpu->isar.id_isar3 = 0x01112131;
     cpu->isar.id_isar4 = 0x00011142;
     cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64pfr1 = 0;
+    SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
+    SET_IDREG(isar, ID_AA64PFR1, 0);
     cpu->isar.id_aa64dfr0 = 0x10305106;
     cpu->isar.id_aa64dfr1 = 0;
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
@@ -158,11 +158,8 @@ static bool cpu_arm_get_rme(Object *obj, Error **errp)
 static void cpu_arm_set_rme(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
 
-    t = cpu->isar.id_aa64pfr0;
-    t = FIELD_DP64(t, ID_AA64PFR0, RME, value);
-    cpu->isar.id_aa64pfr0 = t;
+    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value);
 }
 
 static void cpu_max_set_l0gptsz(Object *obj, Visitor *v, const char *name,
@@ -228,8 +225,8 @@ static void aarch64_a55_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    SET_IDREG(isar, ID_AA64PFR0, 0x0000000010112222ull);
+    SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000010ull);
     cpu->id_afr0       = 0x00000000;
     cpu->isar.id_dfr0  = 0x04010088;
     cpu->isar.id_isar0 = 0x02101110;
@@ -312,7 +309,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_isar3 = 0x01112131;
     cpu->isar.id_isar4 = 0x00011142;
     cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
+    SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
     cpu->isar.id_aa64dfr0 = 0x10305106;
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     cpu->isar.id_aa64mmfr0 = 0x00001124;
@@ -361,8 +358,8 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    SET_IDREG(isar, ID_AA64PFR0, 0x1100000010111112ull); /* GIC filled in later */
+    SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000010ull);
     cpu->id_afr0       = 0x00000000;
     cpu->isar.id_dfr0  = 0x04010088;
     cpu->isar.id_isar0 = 0x02101110;
@@ -427,8 +424,8 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->revidr = 0x00000000;
     cpu->ctr = 0x86668006;
     cpu->reset_sctlr = 0x30000180;
-    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
-    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
+    SET_IDREG(isar, ID_AA64PFR0, 0x0000000101111111); /* No RAS Extensions */
+    SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000000);
     cpu->isar.id_aa64dfr0 = 0x0000000010305408;
     cpu->isar.id_aa64dfr1 = 0x0000000000000000;
     cpu->id_aa64afr0 = 0x0000000000000000;
@@ -609,8 +606,8 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
+    SET_IDREG(isar, ID_AA64PFR0, 0x1100000010111112ull); /* GIC filled in later */
+    SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000020ull);
     cpu->id_afr0       = 0x00000000;
     cpu->isar.id_dfr0  = 0x04010088;
     cpu->isar.id_isar0 = 0x02101110;
@@ -688,8 +685,8 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0220011102101011ull;
-    cpu->isar.id_aa64pfr0  = 0x1101110120111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
+    SET_IDREG(isar, ID_AA64PFR0, 0x1101110120111112ull); /* GIC filled in later */
+    SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000020ull);
     cpu->id_afr0       = 0x00000000;
     cpu->isar.id_dfr0  = 0x15011099;
     cpu->isar.id_isar0 = 0x02101110;
@@ -925,8 +922,8 @@ static void aarch64_a710_initfn(Object *obj)
     cpu->isar.mvfr1    = 0x13211111;
     cpu->isar.mvfr2    = 0x00000043;
     cpu->isar.id_pfr2  = 0x00000011;
-    cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
+    SET_IDREG(isar, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
+    SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000221ull);
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
     cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
     cpu->isar.id_aa64dfr1  = 0;
@@ -1027,8 +1024,8 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     cpu->isar.mvfr1    = 0x13211111;
     cpu->isar.mvfr2    = 0x00000043;
     cpu->isar.id_pfr2  = 0x00000011;
-    cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
+    SET_IDREG(isar, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
+    SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000221ull);
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
     cpu->isar.id_aa64dfr0  = 0x000011f210305619ull;
     cpu->isar.id_aa64dfr1  = 0;
@@ -1183,7 +1180,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
-    t = cpu->isar.id_aa64pfr0;
+    t = GET_IDREG(isar, ID_AA64PFR0);
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, RAS, 2);       /* FEAT_RASv1p1 + FEAT_DoubleFault */
@@ -1192,9 +1189,9 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 3);      /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
-    cpu->isar.id_aa64pfr0 = t;
+    SET_IDREG(isar, ID_AA64PFR0, t);
 
-    t = cpu->isar.id_aa64pfr1;
+    t = GET_IDREG(isar, ID_AA64PFR1);
     t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);        /* FEAT_BTI */
     t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);      /* FEAT_SSBS2 */
     /*
@@ -1207,7 +1204,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
-    cpu->isar.id_aa64pfr1 = t;
+    SET_IDREG(isar, ID_AA64PFR1, t);
 
     t = cpu->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
-- 
2.49.0

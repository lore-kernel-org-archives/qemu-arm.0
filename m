Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2973410njj;
        Tue, 6 May 2025 01:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULFQvVt+Ckp8+XnWlj2GYrronMhcIXFb2I00/6bnZRTi30kzSyYM+DM9op6/sR7pPNuWNayfuRQGp5ww==@linaro.org
X-Google-Smtp-Source: AGHT+IHY5nI1zijdzlCnPe47s08YcFZp2rtCo1dZ4/8oQDpfRnWJl6XbWa5IA8o2tc8ulXCcO3EN
X-Received: by 2002:a05:6214:19ea:b0:6e8:e8dd:3088 with SMTP id 6a1803df08f44-6f51580b6fcmr280180276d6.37.1746521598821;
        Tue, 06 May 2025 01:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746521598; cv=none;
        d=google.com; s=arc-20240605;
        b=aFiRju1hzzfMD9vnffBpvf2w/HPNy2BLoIdBjBCTQpkxN7lp5TbkMIjg9CNSrFqMCx
         MkWQiHxUkOm+XVxacqc4oAbzuzIhABd6e8kWN72Texf3zEzMuho+QqFThIz+BW79aAF+
         XWZHC1DBamzEcHQuY3qJOWBGafvRL4NDQ/oxmN55104ipcu5ZVnsghDfRUD/6FjZ6fk4
         EpjKRtlkKDto317/DqL3okb1Vu7oSmK8zv9V0lk4EIoJWVLNs8x0m+u5Kp1Clq8UlGpc
         ADI1vhheWeaUaqcOQsuXtJrn1PNs1C6XR96EHTFqCcBVThA8D80Bv1Cu1LD99DoYWnl7
         0AxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/InP3KFkyNwluzMgPVNVRITw9VbM03qV8wzz1aGhWVk=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=Pmrhu8iK4pmxRDr/vrDLdbk5FnO7mO9zGTLVIQilYvsnhxEYWXYnDFWbearXddwEfy
         rh84R3FHbjMUnd56XwGKFNLwteeBfpaW1sgoNnGj6rGEMVPfZfCPy/aG47JmQo7IvcY5
         RNpPKBVkSJshKq2ESjf+IDM6NAr0xJVbk/3OB7R+Ji6irbHZdRhd1+6Inm2ujD28c6YZ
         ky7cEbCyOkKsgCZoa8yldNHl9dbu9HPUtTJzAer9YARc0m40uVxUPQ9Ir6Uc1LhFYYEj
         AAfzK2XE8rCx2Zg7bSuLM5gU+OlTAjqS5hbTDxORMaMJE+sN+Shde+mzZ5J3Bg9Izvvh
         RAvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N8jUpedC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f476a69si103448686d6.212.2025.05.06.01.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N8jUpedC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746521598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/InP3KFkyNwluzMgPVNVRITw9VbM03qV8wzz1aGhWVk=;
	b=N8jUpedCceAw+m6e0GSOTYs+cwz76XFLV/wEJXjvaXb/xs4WGF666UMMyrk1s0ak/VlCGB
	RbyAXNrnADNGUATra/+t449QPEINgE6hQjvYU4eEs5CNNr31IMkkHsvCbei4LKeoJ1++Xg
	Wv0+Z5Xm5Y7DAxuC5mklLHdPPq1eeDE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-f2-v1r_fP4Ke9fLfi_b3gQ-1; Tue,
 06 May 2025 04:53:15 -0400
X-MC-Unique: f2-v1r_fP4Ke9fLfi_b3gQ-1
X-Mimecast-MFC-AGG-ID: f2-v1r_fP4Ke9fLfi_b3gQ_1746521591
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE58B19560AF;
	Tue,  6 May 2025 08:53:10 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 55D1919560AB;
	Tue,  6 May 2025 08:53:05 +0000 (UTC)
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
Subject: [PATCH v6 03/14] arm/cpu: Store aa64isar1/2 into the idregs array
Date: Tue,  6 May 2025 10:52:23 +0200
Message-ID: <20250506085234.855779-4-cohuck@redhat.com>
In-Reply-To: <20250506085234.855779-1-cohuck@redhat.com>
References: <20250506085234.855779-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: 5fXNI9XunHKr

From: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-features.h | 44 +++++++++++++++++++--------------------
 target/arm/cpu.c          | 12 ++++-------
 target/arm/cpu.h          |  2 --
 target/arm/cpu64.c        |  9 ++++----
 target/arm/helper.c       |  4 ++--
 target/arm/hvf/hvf.c      |  2 +-
 target/arm/kvm.c          |  6 ++----
 target/arm/tcg/cpu64.c    | 24 ++++++++++-----------
 8 files changed, 48 insertions(+), 55 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 779bcd1abb36..37946d759375 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -467,17 +467,17 @@ static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, JSCVT) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, JSCVT) != 0;
 }
 
 static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FCMA) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, FCMA) != 0;
 }
 
 static inline bool isar_feature_aa64_xs(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, XS) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, XS) != 0;
 }
 
 /*
@@ -501,9 +501,9 @@ isar_feature_pauth_feature(const ARMISARegisters *id)
      * Architecturally, only one of {APA,API,APA3} may be active (non-zero)
      * and the other two must be zero.  Thus we may avoid conditionals.
      */
-    return (FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) |
-            FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API) |
-            FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3));
+    return (FIELD_EX64_IDREG(id, ID_AA64ISAR1, APA) |
+            FIELD_EX64_IDREG(id, ID_AA64ISAR1, API) |
+            FIELD_EX64_IDREG(id, ID_AA64ISAR2, APA3));
 }
 
 static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
@@ -521,7 +521,7 @@ static inline bool isar_feature_aa64_pauth_qarma5(const ARMISARegisters *id)
      * Return true if pauth is enabled with the architected QARMA5 algorithm.
      * QEMU will always enable or disable both APA and GPA.
      */
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, APA) != 0;
 }
 
 static inline bool isar_feature_aa64_pauth_qarma3(const ARMISARegisters *id)
@@ -530,77 +530,77 @@ static inline bool isar_feature_aa64_pauth_qarma3(const ARMISARegisters *id)
      * Return true if pauth is enabled with the architected QARMA3 algorithm.
      * QEMU will always enable or disable both APA3 and GPA3.
      */
-    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, APA3) != 0;
 }
 
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, SB) != 0;
 }
 
 static inline bool isar_feature_aa64_predinv(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SPECRES) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, SPECRES) != 0;
 }
 
 static inline bool isar_feature_aa64_frint(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FRINTTS) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, FRINTTS) != 0;
 }
 
 static inline bool isar_feature_aa64_dcpop(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, DPB) != 0;
 }
 
 static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, DPB) >= 2;
 }
 
 static inline bool isar_feature_aa64_bf16(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, BF16) != 0;
 }
 
 static inline bool isar_feature_aa64_ebf16(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) > 1;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, BF16) > 1;
 }
 
 static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, LRCPC) != 0;
 }
 
 static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, LRCPC) >= 2;
 }
 
 static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, I8MM) != 0;
 }
 
 static inline bool isar_feature_aa64_wfxt(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, WFXT) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, WFXT) >= 2;
 }
 
 static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, BC) != 0;
 }
 
 static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, MOPS);
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, MOPS);
 }
 
 static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, RPRES);
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
 }
 
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dc4b6edaa1d6..bb88d320093c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2131,9 +2131,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         uint64_t t;
         uint32_t u;
 
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 0);
-        cpu->isar.id_aa64isar1 = t;
+        FIELD_DP64_IDREG(isar, ID_AA64ISAR1, JSCVT, 0);
 
         t = cpu->isar.id_aa64pfr0;
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 0xf);
@@ -2186,11 +2184,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
         SET_IDREG(isar, ID_AA64ISAR0, t);
 
-        t = cpu->isar.id_aa64isar1;
+        t = GET_IDREG(isar, ID_AA64ISAR1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
         t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 0);
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
-        cpu->isar.id_aa64isar1 = t;
+        SET_IDREG(isar, ID_AA64ISAR1, t);
 
         t = cpu->isar.id_aa64pfr0;
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 0xf);
@@ -2230,9 +2228,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         FIELD_DP64_IDREG(isar, ID_AA64ISAR0, FHM, 0);
 
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
-        cpu->isar.id_aa64isar1 = t;
+        FIELD_DP64_IDREG(isar, ID_AA64ISAR1, FRINTTS, 0);
 
         u = cpu->isar.mvfr0;
         u = FIELD_DP32(u, MVFR0, SIMDREG, 0);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 06745d1fc576..df57d6a6155e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1077,8 +1077,6 @@ struct ArchCPU {
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
-        uint64_t id_aa64isar1;
-        uint64_t id_aa64isar2;
         uint64_t id_aa64pfr0;
         uint64_t id_aa64pfr1;
         uint64_t id_aa64mmfr0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 266f7434556c..7077c104dad1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -502,6 +502,7 @@ void aarch64_add_sme_properties(Object *obj)
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
     ARMPauthFeature features = cpu_isar_feature(pauth_feature, cpu);
+    ARMISARegisters *isar = &cpu->isar;
     uint64_t isar1, isar2;
 
     /*
@@ -512,13 +513,13 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
      *
      * Begin by disabling all fields.
      */
-    isar1 = cpu->isar.id_aa64isar1;
+    isar1 = GET_IDREG(isar, ID_AA64ISAR1);
     isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, 0);
     isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 0);
     isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, 0);
     isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 0);
 
-    isar2 = cpu->isar.id_aa64isar2;
+    isar2 = GET_IDREG(isar, ID_AA64ISAR2);
     isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, APA3, 0);
     isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, GPA3, 0);
 
@@ -580,8 +581,8 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
         }
     }
 
-    cpu->isar.id_aa64isar1 = isar1;
-    cpu->isar.id_aa64isar2 = isar2;
+    SET_IDREG(isar, ID_AA64ISAR1, isar1);
+    SET_IDREG(isar, ID_AA64ISAR2, isar2);
 }
 
 static const Property arm_cpu_pauth_property =
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dae27144cd94..01f978c4097c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8010,12 +8010,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64isar1 },
+              .resetvalue = GET_IDREG(isar, ID_AA64ISAR1)},
             { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64isar2 },
+              .resetvalue = GET_IDREG(isar, ID_AA64ISAR2)},
             { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 7999a6ab536f..4a95aece6c31 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -868,7 +868,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.idregs[ID_AA64ISAR1_EL1_IDX] },
         /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
         { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
         { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a1fe3a0341f0..d8ba20ad3d27 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -362,10 +362,8 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
                               ARM64_SYS_REG(3, 0, 0, 5, 1));
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
-                              ARM64_SYS_REG(3, 0, 0, 6, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
-                              ARM64_SYS_REG(3, 0, 0, 6, 2));
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR1_EL1_IDX);
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR2_EL1_IDX);
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
                               ARM64_SYS_REG(3, 0, 0, 7, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index f31bb9ceaac9..f62e62595d8b 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -68,7 +68,7 @@ static void aarch64_a35_initfn(Object *obj)
     cpu->isar.id_aa64dfr0 = 0x10305106;
     cpu->isar.id_aa64dfr1 = 0;
     SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
-    cpu->isar.id_aa64isar1 = 0;
+    SET_IDREG(isar, ID_AA64ISAR1, 0);
     cpu->isar.id_aa64mmfr0 = 0x00101122;
     cpu->isar.id_aa64mmfr1 = 0;
     cpu->clidr = 0x0a200023;
@@ -224,7 +224,7 @@ static void aarch64_a55_initfn(Object *obj)
     cpu->dcz_blocksize = 4; /* 64 bytes */
     cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
@@ -357,7 +357,7 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->dcz_blocksize = 4;
     cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
@@ -437,7 +437,7 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000000010211120);
-    cpu->isar.id_aa64isar1 = 0x0000000000010001;
+    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000010001);
     SET_IDREG(isar, ID_AA64ZFR0, 0x0000000000000000);
     cpu->clidr = 0x0000000080000023;
     /* 64KB L1 dcache */
@@ -605,7 +605,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->dcz_blocksize = 4;
     cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
     SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
     cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
@@ -684,7 +684,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
     cpu->isar.id_aa64dfr1 = 0x00000000;
     SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
-    cpu->isar.id_aa64isar1 = 0x0011100001211032ull;
+    SET_IDREG(isar, ID_AA64ISAR1, 0x0011000001211032ull);
     cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0220011102101011ull;
@@ -933,7 +933,7 @@ static void aarch64_a710_initfn(Object *obj)
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
     SET_IDREG(isar, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
-    cpu->isar.id_aa64isar1 = 0x0010111101211052ull;
+    SET_IDREG(isar, ID_AA64ISAR1, 0x0010111101211052ull);
     cpu->isar.id_aa64mmfr0 = 0x0000022200101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x1221011110101011ull;
@@ -1035,7 +1035,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
     SET_IDREG(isar, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
-    cpu->isar.id_aa64isar1 = 0x0011111101211052ull;
+    SET_IDREG(isar, ID_AA64ISAR1, 0x0011111101211052ull);
     cpu->isar.id_aa64mmfr0 = 0x0000022200101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x1221011112101011ull;
@@ -1160,7 +1160,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
     SET_IDREG(isar, ID_AA64ISAR0, t);
 
-    t = cpu->isar.id_aa64isar1;
+    t = GET_IDREG(isar, ID_AA64ISAR1);
     t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
     t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_FPACCOMBINED);
     t = FIELD_DP64(t, ID_AA64ISAR1, API, 1);
@@ -1174,14 +1174,14 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     t = FIELD_DP64(t, ID_AA64ISAR1, XS, 1);       /* FEAT_XS */
-    cpu->isar.id_aa64isar1 = t;
+    SET_IDREG(isar, ID_AA64ISAR1, t);
 
-    t = cpu->isar.id_aa64isar2;
+    t = GET_IDREG(isar, ID_AA64ISAR2);
     t = FIELD_DP64(t, ID_AA64ISAR2, RPRES, 1);    /* FEAT_RPRES */
     t = FIELD_DP64(t, ID_AA64ISAR2, MOPS, 1);     /* FEAT_MOPS */
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
-    cpu->isar.id_aa64isar2 = t;
+    SET_IDREG(isar, ID_AA64ISAR2, t);
 
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
-- 
2.49.0

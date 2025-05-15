Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1947650njb;
        Thu, 15 May 2025 08:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJbVeYBs5f0vJKZ8x6Ji8HHO0GSCRcZHLwsN3XCQse5wZBGi4xXCmyqdR2MgrO6RcbsqUaq5DwZOp7Bg==@linaro.org
X-Google-Smtp-Source: AGHT+IEVZ782mYFdH4Fb98WdUsRyxhsVesYbFB5ndQ1wqhhBuDU9OSGaz9Balp5uWYM2vXeyqD1r
X-Received: by 2002:a05:6214:20ab:b0:6f5:3d25:ed3f with SMTP id 6a1803df08f44-6f8b0835000mr3666436d6.9.1747323615581;
        Thu, 15 May 2025 08:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747323615; cv=none;
        d=google.com; s=arc-20240605;
        b=b5jYcRSbdzU6TbVIhrRp/MGXnctwyh28TLDyXvJ7FTxSzsJB9MTVQ1X+dvRJ8byeGr
         gTIxxYDobUwMJTUt3vji8dSx/8rwUsVz8UE+HqL2NEzJkulqdey9knVkHhQv1Q9JfKTY
         OLaprAp6yKdBnrJ2yjiSEzZI0KI8uolKNo2/mdtbN+tsqTwoPSnyd/fg4oIHBXj88ZWm
         Cqlf/fscx+ITESdgOdHauS/0o4ybofsbrtEMRZRzbYY5n53RbLDTkU/xEeX2HSrrbKwv
         ku/LZZ26uy7kv02mUdca6cRtdU17RT4MvMmLkz6RjdaJrBJrPGcCwMkjlFzoumoOEyEu
         tj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6830Pe+d0SZ4our9JIHlUe8Zxvhjl85FPtO3eL55PUQ=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=RjK/R+jUevDZbci/SaG0F4hdBxjZm33j7xIS/n9yhSLz4gGyryVoRoUIjMKyLVMPHU
         7xLWB9e0jUb+vfDa2vdDZxkdvfkIXir01bDoIY6xrifTLgIDOeN4ZyQFEj+E4YqF6b+s
         +xr3IVI4PNTf+fB3sNgVVqHvQCGTRwJmGQXKwFM/sWSCgock8Ozi9i239qn1wtApkRBz
         jXVWZATuDGjrene/gtGjPTSfqkkKfuMuwzuIC6g3BsmeHpHwzLVeRdIO3ur5dGH5WIcK
         JX3xwsxets8aiMbM6XnJ9ay9mvTDyfmHUY6Xkx2Q6O/V7AGSRu+YT5CcvFK/ozAAIfwN
         Wxmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aSVQUSQZ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b08b7b83si897506d6.121.2025.05.15.08.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:40:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aSVQUSQZ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747323615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6830Pe+d0SZ4our9JIHlUe8Zxvhjl85FPtO3eL55PUQ=;
	b=aSVQUSQZKkycFRBWMKdr0GkwMPhkf6Fm8siA9FsRkeJFyXoICtFFwkCvtnKLT2RxlpLccL
	uvauljvw5sBIEs3T+/at3d6MrMyVT3jYHhQFVE+aMpjbvbBO0tFtzbn3sHFrqpadM3i0Or
	kd7Z1c82HVXC1L8b2qxUMqGaNRr/Gtg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-zHShOosKPjKb8pMQcK3z5g-1; Thu,
 15 May 2025 11:40:13 -0400
X-MC-Unique: zHShOosKPjKb8pMQcK3z5g-1
X-Mimecast-MFC-AGG-ID: zHShOosKPjKb8pMQcK3z5g_1747323612
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC9E51956089;
	Thu, 15 May 2025 15:40:11 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.45.225.145])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2BABB1955F21;
	Thu, 15 May 2025 15:40:04 +0000 (UTC)
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
Subject: [PATCH v7 07/14] arm/cpu: Store aa64smfr0 into the idregs array
Date: Thu, 15 May 2025 17:39:00 +0200
Message-ID: <20250515153907.151174-8-cohuck@redhat.com>
In-Reply-To: <20250515153907.151174-1-cohuck@redhat.com>
References: <20250515153907.151174-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: nczxNZnqjfUx

From: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-features.h | 6 +++---
 target/arm/cpu.h          | 1 -
 target/arm/cpu64.c        | 7 ++-----
 target/arm/helper.c       | 2 +-
 target/arm/kvm.c          | 3 +--
 target/arm/tcg/cpu64.c    | 4 ++--
 6 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7f6331ca437d..1ac1f3e95984 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -978,17 +978,17 @@ static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_sme_f64f64(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, F64F64);
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, F64F64);
 }
 
 static inline bool isar_feature_aa64_sme_i16i64(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, I16I64) == 0xf;
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, I16I64) == 0xf;
 }
 
 static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, FA64);
 }
 
 /*
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c418446b47d0..218fc775ff0f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1074,7 +1074,6 @@ struct ArchCPU {
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
-        uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
         uint64_t idregs[NUM_ID_IDX];
     } isar;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 45981dfcfbb3..ce8cf45dd44f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -328,7 +328,7 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
 
     if (vq_map == 0) {
         if (!cpu_isar_feature(aa64_sme, cpu)) {
-            cpu->isar.id_aa64smfr0 = 0;
+            SET_IDREG(&cpu->isar, ID_AA64SMFR0, 0);
             return;
         }
 
@@ -381,11 +381,8 @@ static bool cpu_arm_get_sme_fa64(Object *obj, Error **errp)
 static void cpu_arm_set_sme_fa64(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
 
-    t = cpu->isar.id_aa64smfr0;
-    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, value);
-    cpu->isar.id_aa64smfr0 = t;
+    FIELD_DP64_IDREG(&cpu->isar, ID_AA64SMFR0, FA64, value);
 }
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c2da52b5bac2..f270b101d659 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7950,7 +7950,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64smfr0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64SMFR0)},
             { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7bc208a0a27d..4432d0466c03 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -314,8 +314,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err = 0;
     } else {
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR1_EL1_IDX);
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
-                              ARM64_SYS_REG(3, 0, 0, 4, 5));
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64SMFR0_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR0_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR1_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ddb82a03e37c..80b1196aae93 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1267,7 +1267,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64DFR0, HPMN0, 1);     /* FEAT_HPMN0 */
     SET_IDREG(isar, ID_AA64DFR0, t);
 
-    t = cpu->isar.id_aa64smfr0;
+    t = GET_IDREG(isar, ID_AA64SMFR0);
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
@@ -1275,7 +1275,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
-    cpu->isar.id_aa64smfr0 = t;
+    SET_IDREG(isar, ID_AA64SMFR0, t);
 
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
-- 
2.49.0

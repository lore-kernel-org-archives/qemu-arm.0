Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp939862njx;
        Fri, 25 Oct 2024 03:21:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7yYWxWJGDojzxrHydyrf3PCG9ppbLmI2LjpPRN4+w10apUux0lBdnOf5ZEAdNSMA9BTpqrHEfNVEwxg==@linaro.org
X-Google-Smtp-Source: AGHT+IHUKGNK4czuu2kKPrc6lz8nwKOiCzuJHvoH8IhW4qbB5sqzuMiJMJ9EWVPWp+oum2WA35Eu
X-Received: by 2002:a05:620a:2684:b0:7b1:4a17:bab0 with SMTP id af79cd13be357-7b17e566c65mr1195048385a.25.1729851673609;
        Fri, 25 Oct 2024 03:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851673; cv=none;
        d=google.com; s=arc-20240605;
        b=POo9hqcBMAolRnHGODDFW0z4vnWDNyoSUmDd7VORps1eEf/XahdV2EIlssZc2Tc7QP
         7L86wpRp7RxEU4N/fFgEW+2KUGGcntJhKhIwAKlKULdxBYxDAJLiS2PTB8JhR7ts/Wy1
         b5C0tJiHIFWzBQoya1rClzh7jfwuhnNzS3ePogozS0mq+I9Wf5l/0gUWDSd6GI37j3LP
         elBrnr4szIJffwOGHyBmW6/Grl6Hcx87fnb1y2vpRwdoZ1TMaJgACOLKNztuqZt3rJ3j
         qCmFh319WFm+QvLoKlWnkobLlyp+MnVY/r6Pp+9Fbxewgvb+FG4otPGl9TFijUyEC113
         +3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OsMRlFekcG8FF41xoa8Cdqm13M3s+pXebiUan+e9DW4=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=TUSN0dLST6j/n0baGduQLI5xikedV5M2LB/WtDtQgBw7eAFHWPSYc+dX2tA/BIZ49Z
         PF+Nlqim0KzPF5PESflmJ1lge0TcCW4r5u250OECJmAao/jxV4NoK+pKv6KQ5+BkrIdZ
         Viz2mYBPsSOhSh5qi0AXf9EmKsakURDs66svtXVpZKy1UuARfz7Wph7EhwLi1vFiEjOi
         TvLMxTkFR7Rj4CbYvUg+PoGHDr4h19J8XlWHUM+babeQAkREiWa44OACBL9GgjwAHAkV
         3KFnlj37kor8MQR0VndrKvTYUD/dvZ98RZzDtapPJlHCKx0xAE/0X7x3ILnYNZlOB6jp
         2KNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dCuOSYi+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d26a29asi123859285a.51.2024.10.25.03.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dCuOSYi+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsMRlFekcG8FF41xoa8Cdqm13M3s+pXebiUan+e9DW4=;
	b=dCuOSYi+ElxRDQwHUoDKsXhKtsW4B5vRF4icD9qo75nx8ER06X3fKq8DIvUiEO+WEGFcbj
	pUKjrphkf0FT/BQ2AC0Lm6IkPV2uoMdrcqiNNLnWd3Oz7p90urU/TcY0Vi9P+pEnYj1iIX
	3lewbCI86lBLYwTSoDGIUkiC6UaqbKo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-zaJde7-CNNmHjX4moEzHwA-1; Fri,
 25 Oct 2024 06:21:10 -0400
X-MC-Unique: zaJde7-CNNmHjX4moEzHwA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21D5E1956048;
	Fri, 25 Oct 2024 10:21:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C368196BB7D;
	Fri, 25 Oct 2024 10:21:03 +0000 (UTC)
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
Subject: [RFC 08/21] arm/cpu: Store aa64smfr0 into the idregs array
Date: Fri, 25 Oct 2024 12:17:27 +0200
Message-ID: <20241025101959.601048-9-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: v/o/k+R9RcKs

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu-features.h | 6 +++---
 target/arm/cpu.h          | 1 -
 target/arm/cpu64.c        | 7 ++-----
 target/arm/helper.c       | 2 +-
 target/arm/kvm.c          | 3 +--
 target/arm/tcg/cpu64.c    | 4 ++--
 6 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 9b0d5157bf..ada5d7eccc 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -952,17 +952,17 @@ static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_sme_f64f64(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, F64F64);
+    return FIELD_EX64_IDREG(&id->idregs, ID_AA64SMFR0, F64F64);
 }
 
 static inline bool isar_feature_aa64_sme_i16i64(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, I16I64) == 0xf;
+    return FIELD_EX64_IDREG(&id->idregs, ID_AA64SMFR0, I16I64) == 0xf;
 }
 
 static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
+    return FIELD_EX64_IDREG(&id->idregs, ID_AA64SMFR0, FA64);
 }
 
 /*
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6954952d5f..7f808e5772 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1088,7 +1088,6 @@ struct ArchCPU {
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
-        uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
         IdRegMap idregs;
     } isar;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85f581edb7..bf3eb5d0b5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -305,7 +305,7 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
 
     if (vq_map == 0) {
         if (!cpu_isar_feature(aa64_sme, cpu)) {
-            cpu->isar.id_aa64smfr0 = 0;
+            SET_IDREG(&cpu->isar.idregs, ID_AA64SMFR0, 0);
             return;
         }
 
@@ -358,11 +358,8 @@ static bool cpu_arm_get_sme_fa64(Object *obj, Error **errp)
 static void cpu_arm_set_sme_fa64(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
 
-    t = cpu->isar.id_aa64smfr0;
-    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, value);
-    cpu->isar.id_aa64smfr0 = t;
+    FIELD_DP64_IDREG(&cpu->isar.idregs, ID_AA64SMFR0, FA64, value);
 }
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c15b24933d..7e73130d35 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8900,7 +8900,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64smfr0 },
+              .resetvalue = GET_IDREG(idregs, ID_AA64SMFR0)},
             { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7377e4a133..e899f180f8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -326,8 +326,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err = 0;
     } else {
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64PFR1_EL1);
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
-                              ARM64_SYS_REG(3, 0, 0, 4, 5));
+        err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64SMFR0_EL1);
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64DFR0_EL1);
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64DFR1_EL1);
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64ISAR0_EL1);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 56f086cb28..611c252eae 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1264,7 +1264,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64DFR0, HPMN0, 1);     /* FEAT_HPMN0 */
     SET_IDREG(idregs, ID_AA64DFR0, t);
 
-    t = cpu->isar.id_aa64smfr0;
+    t = GET_IDREG(idregs, ID_AA64SMFR0);
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
@@ -1272,7 +1272,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
-    cpu->isar.id_aa64smfr0 = t;
+    SET_IDREG(idregs, ID_AA64SMFR0, t);
 
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
-- 
2.41.0

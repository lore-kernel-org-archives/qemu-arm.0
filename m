Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp770835njb;
        Fri, 6 Dec 2024 03:23:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzDf4sJNeHk8v4c3Vqswpd5vw3dabW5PvzHm+10ooaYh6rbf3YNzrYYr1lEKkFmZtSr4Ibnkq3F62LgA==@linaro.org
X-Google-Smtp-Source: AGHT+IHNEtPZukVp/uAfSnOIZELjaeEqoxHx+Ho0GbJa0A/wosi4XmrJNxchwDdFMVwtQJPSj42h
X-Received: by 2002:a05:620a:4bc3:b0:7b6:6b07:e80d with SMTP id af79cd13be357-7b6bcb65b69mr331875185a.57.1733484227147;
        Fri, 06 Dec 2024 03:23:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733484227; cv=none;
        d=google.com; s=arc-20240605;
        b=JgLQ+GDZGSW6ZShHhBzc32jJOsGSvvVm6OLq/0OgJP4xROUEEBkKuamej0+YA1i0gl
         LA99DSeu0ps/mQuwO3XCabGN3DR/b21q7Igx5VROx7lNe27TUekqX3THvpJYYer1692H
         qQWBmNrefHtjnY+DSGL313pjDPLcXXoneEHejYTfnaxVUxUtLfwjSAk5fn+1RwV2pAxI
         fpxeb27HWa48Dxl7F2oAQBIDWgWQ78yGVnwCIrwYwfTot3xW9TRAexcnAxxndYcSI6Ju
         FszCu6FG9VHuyVNVPkMcakDseVNC2ke23Tu9QDhOu+gKx6aYPxvCfYegOJBA4X7heulo
         27Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YZ7M/gl82xNrgmCVVln3pf0sWIQqr+Lgiv7rL1brMVU=;
        fh=ou9WwAWkFbBDtrYluijzdFLlSJKncehGww8dMC2w/x0=;
        b=EiCtAdWj4v/BHYo+nidEcoKjkESaXMM28RATZbLUJMDy3wgKcS8BrLWUl8dLk1UU3U
         LYquLLxHUoLdf6g+IkAO8QHNw6klpwuIvMk9MiJmtorgqzOLQqxXO1f8WbHMHciwTQuT
         uVLFOTy5/++h0Pxg23zpwebx9qsB06o8rXvdXVUTL7t7PUXptbYxXGm9Ff/Dd4psPTlf
         eVNdJQ0L02yrEOm/raLwE7//1A3C0aK3XJZ3W78IAL6HDsMVZSPq22oDa7psDWCSYfbC
         oHHNbD0TV64KE14qJpu4lvrXmePdrN8Yg0rEWgIKNudgOylklE5emFuNH/hOHpxejp/X
         sNzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YuC77ApC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5ad3fabsi448811785a.661.2024.12.06.03.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:23:47 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YuC77ApC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733484226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZ7M/gl82xNrgmCVVln3pf0sWIQqr+Lgiv7rL1brMVU=;
	b=YuC77ApCqVGh7XpsTUwG0yYl8AHDhnTTSGBxVSpWuul7JOlnmhg/JaKV6PVansnYM/NnER
	YG54+eLHMvaXWYZkfjmR/uRJz5xgGFoFd/wM4JQZZ+nQgOi4fn3Ch/1/YDPY02d9WGUCdD
	kn1m2a5vFXL4q3JwTWivBEwgeMVKwv0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-422-9oLfQy4QNGKJpOFOuzUh6w-1; Fri,
 06 Dec 2024 06:23:41 -0500
X-MC-Unique: 9oLfQy4QNGKJpOFOuzUh6w-1
X-Mimecast-MFC-AGG-ID: 9oLfQy4QNGKJpOFOuzUh6w
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 86A0219560A7;
	Fri,  6 Dec 2024 11:23:39 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F4BC19560A2;
	Fri,  6 Dec 2024 11:23:33 +0000 (UTC)
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
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFCv2 12/20] arm/cpu: Store id_mmfr0-5 into the idregs array
Date: Fri,  6 Dec 2024 12:22:05 +0100
Message-ID: <20241206112213.88394-13-cohuck@redhat.com>
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: PZHkpfiCijtu

From: Eric Auger <eric.auger@redhat.com>

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/intc/armv7m_nvic.c     |  8 ++--
 target/arm/cpu-features.h | 18 ++++----
 target/arm/cpu.h          |  6 ---
 target/arm/cpu64.c        | 16 +++----
 target/arm/helper.c       | 12 ++---
 target/arm/kvm.c          | 18 +++-----
 target/arm/tcg/cpu-v7m.c  | 48 ++++++++++----------
 target/arm/tcg/cpu32.c    | 94 +++++++++++++++++++--------------------
 target/arm/tcg/cpu64.c    | 76 +++++++++++++++----------------
 9 files changed, 140 insertions(+), 156 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 5cf8cd9321d7..71b19fd4e70a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1284,22 +1284,22 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
         }
-        return cpu->isar.id_mmfr0;
+        return GET_IDREG(idregs, ID_MMFR0);
     case 0xd54: /* MMFR1.  */
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
         }
-        return cpu->isar.id_mmfr1;
+        return GET_IDREG(idregs, ID_MMFR1);
     case 0xd58: /* MMFR2.  */
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
         }
-        return cpu->isar.id_mmfr2;
+        return GET_IDREG(idregs, ID_MMFR2);
     case 0xd5c: /* MMFR3.  */
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
         }
-        return cpu->isar.id_mmfr3;
+        return GET_IDREG(idregs, ID_MMFR3);
     case 0xd60: /* ISAR0.  */
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index e056498fc065..aa5ddfca5efd 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -283,17 +283,17 @@ static inline bool isar_feature_aa32_vminmaxnm(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa32_pxn(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr0, ID_MMFR0, VMSA) >= 4;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR0, VMSA) >= 4;
 }
 
 static inline bool isar_feature_aa32_pan(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr3, ID_MMFR3, PAN) != 0;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR3, PAN) != 0;
 }
 
 static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr3, ID_MMFR3, PAN) >= 2;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR3, PAN) >= 2;
 }
 
 static inline bool isar_feature_aa32_pmuv3p1(const ARMISARegisters *id)
@@ -319,32 +319,32 @@ static inline bool isar_feature_aa32_pmuv3p5(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa32_hpd(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, HPDS) != 0;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR4, HPDS) != 0;
 }
 
 static inline bool isar_feature_aa32_ac2(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, AC2) != 0;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR4, AC2) != 0;
 }
 
 static inline bool isar_feature_aa32_ccidx(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, CCIDX) != 0;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR4, CCIDX) != 0;
 }
 
 static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR4, XNX) != 0;
 }
 
 static inline bool isar_feature_aa32_half_evt(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, EVT) >= 1;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR4, EVT) >= 1;
 }
 
 static inline bool isar_feature_aa32_evt(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, EVT) >= 2;
+    return FIELD_EX32_IDREG(&id->idregs, ID_MMFR4, EVT) >= 2;
 }
 
 static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df1506ab74fe..c803d191e84d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1080,12 +1080,6 @@ struct ArchCPU {
      * field by reading the value from the KVM vCPU.
      */
     struct ARMISARegisters {
-        uint32_t id_mmfr0;
-        uint32_t id_mmfr1;
-        uint32_t id_mmfr2;
-        uint32_t id_mmfr3;
-        uint32_t id_mmfr4;
-        uint32_t id_mmfr5;
         uint32_t mvfr0;
         uint32_t mvfr1;
         uint32_t mvfr2;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fb3845c8cceb..efc930ff8367 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -616,10 +616,10 @@ static void aarch64_a57_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_DFR0, 0x03010066);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10101105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02102211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232042);
@@ -678,10 +678,10 @@ static void aarch64_a53_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_DFR0, 0x03010066);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10101105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02102211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232042);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 90db2baff200..ed9fcdc0dbdf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8776,22 +8776,22 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
-              .resetvalue = cpu->isar.id_mmfr0 },
+              .resetvalue = GET_IDREG(idregs, ID_MMFR0)},
             { .name = "ID_MMFR1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
-              .resetvalue = cpu->isar.id_mmfr1 },
+              .resetvalue = GET_IDREG(idregs, ID_MMFR1)},
             { .name = "ID_MMFR2", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
-              .resetvalue = cpu->isar.id_mmfr2 },
+              .resetvalue = GET_IDREG(idregs, ID_MMFR2)},
             { .name = "ID_MMFR3", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
-              .resetvalue = cpu->isar.id_mmfr3 },
+              .resetvalue = GET_IDREG(idregs, ID_MMFR3)},
             { .name = "ID_ISAR0", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -8826,7 +8826,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
-              .resetvalue = cpu->isar.id_mmfr4 },
+              .resetvalue = GET_IDREG(idregs, ID_MMFR4)},
             { .name = "ID_ISAR6", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -9110,7 +9110,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_mmfr5 },
+              .resetvalue = GET_IDREG(idregs, ID_MMFR5)},
             { .name = "RES_0_C0_C3_7", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 88fa08e390d5..f11d512388b8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -378,14 +378,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64PFR0_EL1);
         err |= get_host_cpu_reg64(fd, ahcf, SYS_ID_AA64PFR1_EL1);
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_DFR0_EL1);
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
-                              ARM64_SYS_REG(3, 0, 0, 1, 4));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr1,
-                              ARM64_SYS_REG(3, 0, 0, 1, 5));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr2,
-                              ARM64_SYS_REG(3, 0, 0, 1, 6));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr3,
-                              ARM64_SYS_REG(3, 0, 0, 1, 7));
+        err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_MMFR0_EL1);
+        err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_MMFR1_EL1);
+        err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_MMFR2_EL1);
+        err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_MMFR3_EL1);
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_ISAR0_EL1);
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_ISAR1_EL1);
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_ISAR2_EL1);
@@ -393,8 +389,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_ISAR4_EL1);
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_ISAR5_EL1);
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_ISAR6_EL1);
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr4,
-                              ARM64_SYS_REG(3, 0, 0, 2, 6));
+        err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_MMFR4_EL1);
 
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
                               ARM64_SYS_REG(3, 0, 0, 3, 0));
@@ -404,8 +399,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_PFR2_EL1);
         err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_DFR1_EL1);
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
-                              ARM64_SYS_REG(3, 0, 0, 3, 6));
+        err |= get_host_cpu_reg32(fd, ahcf, SYS_ID_MMFR5_EL1);
 
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index a7034ce5b66c..758560f1e896 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -64,10 +64,10 @@ static void cortex_m0_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00000200);
     SET_IDREG(idregs, ID_DFR0, 0x00100000);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00000030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x00000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
+    SET_IDREG(idregs, ID_MMFR0, 0x00000030);
+    SET_IDREG(idregs, ID_MMFR1, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR3, 0x00000000);
     SET_IDREG(idregs, ID_ISAR0, 0x01141110);
     SET_IDREG(idregs, ID_ISAR1, 0x02111000);
     SET_IDREG(idregs, ID_ISAR2, 0x21112231);
@@ -90,10 +90,10 @@ static void cortex_m3_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00000200);
     SET_IDREG(idregs, ID_DFR0, 0x00100000);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00000030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x00000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
+    SET_IDREG(idregs, ID_MMFR0, 0x00000030);
+    SET_IDREG(idregs, ID_MMFR1, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR3, 0x00000000);
     SET_IDREG(idregs, ID_ISAR0, 0x01141110);
     SET_IDREG(idregs, ID_ISAR1, 0x02111000);
     SET_IDREG(idregs, ID_ISAR2, 0x21112231);
@@ -121,10 +121,10 @@ static void cortex_m4_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00000200);
     SET_IDREG(idregs, ID_DFR0, 0x00100000);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00000030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x00000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
+    SET_IDREG(idregs, ID_MMFR0, 0x00000030);
+    SET_IDREG(idregs, ID_MMFR1, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR3, 0x00000000);
     SET_IDREG(idregs, ID_ISAR0, 0x01141110);
     SET_IDREG(idregs, ID_ISAR1, 0x02111000);
     SET_IDREG(idregs, ID_ISAR2, 0x21112231);
@@ -152,10 +152,10 @@ static void cortex_m7_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00000200);
     SET_IDREG(idregs, ID_DFR0, 0x00100000);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00100030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
+    SET_IDREG(idregs, ID_MMFR0, 0x00100030);
+    SET_IDREG(idregs, ID_MMFR1, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01000000);
+    SET_IDREG(idregs, ID_MMFR3, 0x00000000);
     SET_IDREG(idregs, ID_ISAR0, 0x01101110);
     SET_IDREG(idregs, ID_ISAR1, 0x02112000);
     SET_IDREG(idregs, ID_ISAR2, 0x20232231);
@@ -185,10 +185,10 @@ static void cortex_m33_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00000210);
     SET_IDREG(idregs, ID_DFR0, 0x00200000);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00101F40;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
+    SET_IDREG(idregs, ID_MMFR0, 0x00101F40);
+    SET_IDREG(idregs, ID_MMFR1, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01000000);
+    SET_IDREG(idregs, ID_MMFR3, 0x00000000);
     SET_IDREG(idregs, ID_ISAR0, 0x01101110);
     SET_IDREG(idregs, ID_ISAR1, 0x02212000);
     SET_IDREG(idregs, ID_ISAR2, 0x20232232);
@@ -223,10 +223,10 @@ static void cortex_m55_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00000230);
     SET_IDREG(idregs, ID_DFR0, 0x10200000);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00111040;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01000000;
-    cpu->isar.id_mmfr3 = 0x00000011;
+    SET_IDREG(idregs, ID_MMFR0, 0x00111040);
+    SET_IDREG(idregs, ID_MMFR1, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01000000);
+    SET_IDREG(idregs, ID_MMFR3, 0x00000011);
     SET_IDREG(idregs, ID_ISAR0, 0x01103110);
     SET_IDREG(idregs, ID_ISAR1, 0x02212000);
     SET_IDREG(idregs, ID_ISAR2, 0x20232232);
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 3036c39d00f1..7606bd263fca 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -55,21 +55,17 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
     cpu->isar.mvfr2 = t;
 
-    t = cpu->isar.id_mmfr3;
-    t = FIELD_DP32(t, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
-    cpu->isar.id_mmfr3 = t;
+    FIELD_DP32_IDREG(idregs, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
 
-    t = cpu->isar.id_mmfr4;
+    t = GET_IDREG(idregs, ID_MMFR4);
     t = FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
     t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
-    cpu->isar.id_mmfr4 = t;
+    SET_IDREG(idregs, ID_MMFR4, t);
 
-    t = cpu->isar.id_mmfr5;
-    t = FIELD_DP32(t, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
-    cpu->isar.id_mmfr5 = t;
+    FIELD_DP32_IDREG(idregs, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
 
     t = GET_IDREG(idregs, ID_PFR0);
     t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
@@ -230,9 +226,9 @@ static void arm1136_r2_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x1);
     SET_IDREG(idregs, ID_DFR0, 0x2);
     cpu->id_afr0 = 0x3;
-    cpu->isar.id_mmfr0 = 0x01130003;
-    cpu->isar.id_mmfr1 = 0x10030302;
-    cpu->isar.id_mmfr2 = 0x01222110;
+    SET_IDREG(idregs, ID_MMFR0, 0x01130003);
+    SET_IDREG(idregs, ID_MMFR1, 0x10030302);
+    SET_IDREG(idregs, ID_MMFR2, 0x01222110);
     SET_IDREG(idregs, ID_ISAR0, 0x00140011);
     SET_IDREG(idregs, ID_ISAR1, 0x12002111);
     SET_IDREG(idregs, ID_ISAR2, 0x11231111);
@@ -262,9 +258,9 @@ static void arm1136_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x1);
     SET_IDREG(idregs, ID_DFR0, 0x2);
     cpu->id_afr0 = 0x3;
-    cpu->isar.id_mmfr0 = 0x01130003;
-    cpu->isar.id_mmfr1 = 0x10030302;
-    cpu->isar.id_mmfr2 = 0x01222110;
+    SET_IDREG(idregs, ID_MMFR0, 0x01130003);
+    SET_IDREG(idregs, ID_MMFR1, 0x10030302);
+    SET_IDREG(idregs, ID_MMFR2, 0x01222110);
     SET_IDREG(idregs, ID_ISAR0, 0x00140011);
     SET_IDREG(idregs, ID_ISAR1, 0x12002111);
     SET_IDREG(idregs, ID_ISAR2, 0x11231111);
@@ -295,9 +291,9 @@ static void arm1176_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x11);
     SET_IDREG(idregs, ID_DFR0, 0x33);
     cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x01130003;
-    cpu->isar.id_mmfr1 = 0x10030302;
-    cpu->isar.id_mmfr2 = 0x01222100;
+    SET_IDREG(idregs, ID_MMFR0, 0x01130003);
+    SET_IDREG(idregs, ID_MMFR1, 0x10030302);
+    SET_IDREG(idregs, ID_MMFR2, 0x01222100);
     SET_IDREG(idregs, ID_ISAR0, 0x0140011);
     SET_IDREG(idregs, ID_ISAR1, 0x12002111);
     SET_IDREG(idregs, ID_ISAR2, 0x11231121);
@@ -325,9 +321,9 @@ static void arm11mpcore_initfn(Object *obj)
      SET_IDREG(idregs, ID_PFR1, 0x1);
     SET_IDREG(idregs, ID_DFR0, 0);
     cpu->id_afr0 = 0x2;
-    cpu->isar.id_mmfr0 = 0x01100103;
-    cpu->isar.id_mmfr1 = 0x10020302;
-    cpu->isar.id_mmfr2 = 0x01222000;
+    SET_IDREG(idregs, ID_MMFR0, 0x01100103);
+    SET_IDREG(idregs, ID_MMFR1, 0x10020302);
+    SET_IDREG(idregs, ID_MMFR2, 0x01222000);
     SET_IDREG(idregs, ID_ISAR0, 0x00100011);
     SET_IDREG(idregs, ID_ISAR1, 0x12002111);
     SET_IDREG(idregs, ID_ISAR2, 0x11221011);
@@ -365,10 +361,10 @@ static void cortex_a8_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x11);
     SET_IDREG(idregs, ID_DFR0, 0x400);
     cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x31100003;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01202000;
-    cpu->isar.id_mmfr3 = 0x11;
+    SET_IDREG(idregs, ID_MMFR0, 0x31100003);
+    SET_IDREG(idregs, ID_MMFR1, 0x20000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01202000);
+    SET_IDREG(idregs, ID_MMFR3, 0x11);
     SET_IDREG(idregs, ID_ISAR0, 0x00101111);
     SET_IDREG(idregs, ID_ISAR1, 0x12112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232031);
@@ -441,10 +437,10 @@ static void cortex_a9_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x11);
     SET_IDREG(idregs, ID_DFR0, 0x000);
     cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x00100103;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01230000;
-    cpu->isar.id_mmfr3 = 0x00002111;
+    SET_IDREG(idregs, ID_MMFR0, 0x00100103);
+    SET_IDREG(idregs, ID_MMFR1, 0x20000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01230000);
+    SET_IDREG(idregs, ID_MMFR3, 0x00002111);
     SET_IDREG(idregs, ID_ISAR0, 0x00101111);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232041);
@@ -507,10 +503,10 @@ static void cortex_a7_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_DFR0, 0x02010555);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10101105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01240000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02102211);
     /*
      * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
      * table 4-41 gives 0x02101110, which includes the arm div insns.
@@ -559,10 +555,10 @@ static void cortex_a15_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_DFR0, 0x02010555);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x20000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01240000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02102211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232041);
@@ -603,10 +599,10 @@ static void cortex_r5_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x001);
     SET_IDREG(idregs, ID_DFR0, 0x010400);
     cpu->id_afr0 = 0x0;
-    cpu->isar.id_mmfr0 = 0x0210030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01200000;
-    cpu->isar.id_mmfr3 = 0x0211;
+    SET_IDREG(idregs, ID_MMFR0, 0x0210030);
+    SET_IDREG(idregs, ID_MMFR1, 0x00000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01200000);
+    SET_IDREG(idregs, ID_MMFR3, 0x0211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101111);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232141);
@@ -750,11 +746,11 @@ static void cortex_r52_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x10111001);
     SET_IDREG(idregs, ID_DFR0, 0x03010006);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00211040;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01200000;
-    cpu->isar.id_mmfr3 = 0xf0102211;
-    cpu->isar.id_mmfr4 = 0x00000010;
+    SET_IDREG(idregs, ID_MMFR0, 0x00211040);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01200000);
+    SET_IDREG(idregs, ID_MMFR3, 0xf0102211);
+    SET_IDREG(idregs, ID_MMFR4, 0x00000010);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232142);
@@ -982,10 +978,10 @@ static void arm_max_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_DFR0, 0x03010066);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    ET_IDREG(idregs, ID_MMFR0, 0x10101105);
+    ET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    ET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    ET_IDREG(idregs, ID_MMFR3, 0x02102211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232042);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ead0b5600024..df1a958494a2 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -53,10 +53,10 @@ static void aarch64_a35_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_DFR0, 0x03010066);
     cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02102211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232042);
@@ -236,11 +236,11 @@ static void aarch64_a55_initfn(Object *obj)
     SET_IDREG(idregs, ID_ISAR4, 0x00011142);
     SET_IDREG(idregs, ID_ISAR5, 0x01011121);
     SET_IDREG(idregs, ID_ISAR6, 0x00000010);
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02122211);
+    SET_IDREG(idregs, ID_MMFR4, 0x00021110);
     SET_IDREG(idregs, ID_PFR0, 0x10010131);
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_PFR2, 0x00000011);
@@ -299,10 +299,10 @@ static void aarch64_a72_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00011011);
     SET_IDREG(idregs, ID_DFR0, 0x03010066);
     cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02102211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232042);
@@ -369,11 +369,11 @@ static void aarch64_a76_initfn(Object *obj)
     SET_IDREG(idregs, ID_ISAR4, 0x00010142);
     SET_IDREG(idregs, ID_ISAR5, 0x01011121);
     SET_IDREG(idregs, ID_ISAR6, 0x00000010);
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02122211);
+    SET_IDREG(idregs, ID_MMFR4, 0x00021110);
     SET_IDREG(idregs, ID_PFR0, 0x10010131);
     SET_IDREG(idregs, ID_PFR1, 0x00010000); /* GIC filled in later */
     SET_IDREG(idregs, ID_PFR2, 0x00000011);
@@ -617,11 +617,11 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     SET_IDREG(idregs, ID_ISAR4, 0x00010142);
     SET_IDREG(idregs, ID_ISAR5, 0x01011121);
     SET_IDREG(idregs, ID_ISAR6, 0x00000010);
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02122211);
+    SET_IDREG(idregs, ID_MMFR4, 0x00021110);
     SET_IDREG(idregs, ID_PFR0, 0x10010131);
     SET_IDREG(idregs, ID_PFR1, 0x00010000); /* GIC filled in later */
     SET_IDREG(idregs, ID_PFR2, 0x00000011);
@@ -696,11 +696,11 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     SET_IDREG(idregs, ID_ISAR4, 0x00010142);
     SET_IDREG(idregs, ID_ISAR5, 0x11011121);
     SET_IDREG(idregs, ID_ISAR6, 0x01100111);
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x01021110;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02122211);
+    SET_IDREG(idregs, ID_MMFR4, 0x01021110);
     SET_IDREG(idregs, ID_PFR0, 0x21110131);
     SET_IDREG(idregs, ID_PFR1, 0x00010000); /* GIC filled in later */
     SET_IDREG(idregs, ID_PFR2, 0x00000011);
@@ -906,17 +906,17 @@ static void aarch64_a710_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00010000); /* GIC filled in later */
     SET_IDREG(idregs, ID_DFR0, 0x16011099);
     cpu->id_afr0       = 0;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02122211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232042);
     SET_IDREG(idregs, ID_ISAR3, 0x01112131);
     SET_IDREG(idregs, ID_ISAR4, 0x00010142);
     SET_IDREG(idregs, ID_ISAR5, 0x11011121); /* with Crypto */
-    cpu->isar.id_mmfr4 = 0x21021110;
+    SET_IDREG(idregs, ID_MMFR4, 0x21021110);
     SET_IDREG(idregs, ID_ISAR6, 0x01111111);
     cpu->isar.mvfr0    = 0x10110222;
     cpu->isar.mvfr1    = 0x13211111;
@@ -1009,17 +1009,17 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     SET_IDREG(idregs, ID_PFR1, 0x00010000); /* GIC filled in later */
     SET_IDREG(idregs, ID_DFR0, 0x16011099);
     cpu->id_afr0       = 0;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
+    SET_IDREG(idregs, ID_MMFR0, 0x10201105);
+    SET_IDREG(idregs, ID_MMFR1, 0x40000000);
+    SET_IDREG(idregs, ID_MMFR2, 0x01260000);
+    SET_IDREG(idregs, ID_MMFR3, 0x02122211);
     SET_IDREG(idregs, ID_ISAR0, 0x02101110);
     SET_IDREG(idregs, ID_ISAR1, 0x13112111);
     SET_IDREG(idregs, ID_ISAR2, 0x21232042);
     SET_IDREG(idregs, ID_ISAR3, 0x01112131);
     SET_IDREG(idregs, ID_ISAR4, 0x00010142);
     SET_IDREG(idregs, ID_ISAR5, 0x11011121); /* with Crypto */
-    cpu->isar.id_mmfr4 = 0x01021110;
+    SET_IDREG(idregs, ID_MMFR4, 0x01021110);
     SET_IDREG(idregs, ID_ISAR6, 0x01111111);
     cpu->isar.mvfr0    = 0x10110222;
     cpu->isar.mvfr1    = 0x13211111;
-- 
2.47.0

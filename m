Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp2732349lfc;
        Wed, 20 Nov 2019 16:09:42 -0800 (PST)
X-Received: by 2002:aca:7583:: with SMTP id q125mr5029476oic.168.1574294981845;
        Wed, 20 Nov 2019 16:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574294981; cv=none;
        d=google.com; s=arc-20160816;
        b=kARQNSkcWBj2XZ3MZbGVwuouirxjEJNjhy/VuufC7YmRgEFgmgOKF5W12Xafw6e1tN
         vGXNFXdFdQuXvam0vjfECPX68kKj8mOtQRBiNPltZqteh0DKv1tV6S/QGLRGwCnxr84N
         twS9EowXF10rIX07pu8/RAAnbtgiPb14c5OpMy3zzVv3xXlh/GNQmcaCx2Kd4PtJ0hQo
         u6lulHtgxktVKVHnvgsnawhhsWMCcv+HcoVyVaWThmLasxA74JOESjQQt+AcwOgs8vaN
         w5g+JaCwXQjN/vBMHpwx6jYR3e447861IHefff1GWFds9/Ud0guwtm7uMGXnw2U+/K/b
         q4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Rdoo/trm2kfQbHrpXryTEVHE3GHeXymHmhFHGDwpeds=;
        b=V9V48ivGR1aK0i/YybZFGbi379SHOwyVnuxQ8asx+RV53y0pTZxTDSHCNmsZcfsN6f
         WrJIdGNJlbnzBa72n4DLY7EyHJ9mrpOXJz8b8icmpCpRmq/T31WpRffcCFIvjIw07cVo
         sA1Kc1N5u6HdMnacU9uO6lXdSl1LBvwRDQXkex7IoRcJSVypLkCN/7Z/MAKlP3KBjv/h
         cdFc440dpWoTrFlWRbQAso1F/B6ONeyK9IrGtvqKkwELNAhbvfqaYxvRs2/O3vtahftt
         EII4HpBRD54dEsKn6zyPJcQCxP0OwrqtkLgbkhgiY61lCgZYbbcWIpvcKYOhTelAT6/4
         h3XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sngSs25s;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j6sor405467otn.99.2019.11.20.16.09.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2019 16:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sngSs25s;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rdoo/trm2kfQbHrpXryTEVHE3GHeXymHmhFHGDwpeds=;
        b=sngSs25sWQUSqJMDGvDXVQEzAQlgRRZiiFG0+slzGADNnd7glffB0YktsqjeF+7hKO
         7bpD+FmpW1YNuLXby9+kuKqMzF2aL03X6aeYe7RCcbYM78kF5NvivS7E+OPAQ4Z98n2Q
         02r2pF8fRl8+j/4ELA8Lu30AlQyj/Bf+dPxNosQoy+MlVB6bGHXY5ZtP2UVyduWaTncb
         3FlDZMMM8ODEErbcUM65ofqJuASMYhmCTHTBtrVXQlIAOd9lvxhV9UpSOEfJ37eBDld4
         il9dvh4kNgAnU+iMr9ARhUauEXFxf/wqndtRQM0vYDQ48L5upcoQ2Qarv+O+dfOc7kLI
         NISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rdoo/trm2kfQbHrpXryTEVHE3GHeXymHmhFHGDwpeds=;
        b=hou+y8pdKwlBOOva3DdumOx/vvfpRGw5txKwllnQVW2ZM/XzHc06W7baGqQNKyQsQO
         aux9VbAyZmOpmMqY9wdPVL8jsTrTH0aCuWm8RMjijFFZaR3ETmAKMS5ECcXS0wd8ZU7e
         wKAxrsPswFLVbgh9ixJY+yN9w+w63dCniemO239rlnTKQJHBqkdvZVAAdhiSNcN95Q1m
         M4CxX8R5eEViDUuArWTKxwxhb+1iNgF2HwaWwqRW5aZQB8xmybeZOUD96xifGsFhDjJF
         d13RUhsnWViOVOY4HeRkjvAt4/myhK9Q0aeCQbx6VMoMzYg7nwtt9rBFX8tZe7cLSrN1
         JGFQ==
X-Gm-Message-State: APjAAAVj22wkKT9llq0+QJ9UvepFqW4JuKVuQ4+U3bPCN8spS4wJXgzL
	U3g2epRKB3P+IQBZY9lzUwOTZ/lX
X-Google-Smtp-Source: APXvYqxolcYUacdkXJpKZX6xSSBKx+1V9eLJfXP1J/QWskDaR8x8QdPN6xSWkUX19ZxvzuZxB0nPeg==
X-Received: by 2002:a05:6830:155a:: with SMTP id l26mr4316290otp.119.1574294981368;
        Wed, 20 Nov 2019 16:09:41 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.arm.com (host86-181-127-240.range86-181.btcentralplus.com. [86.181.127.240])
        by smtp.gmail.com with ESMTPSA id z17sm351439otk.40.2019.11.20.16.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:09:40 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	quintela@redhat.com,
	dgilbert@redhat.com,
	eric.auger@redhat.com,
	shameerali.kolothum.thodi@huawei.com
Subject: [PATCH v3 4/4] target/arm: Add support for DC CVAP & DC CVADP ins
Date: Thu, 21 Nov 2019 00:08:43 +0000
Message-Id: <20191121000843.24844-5-beata.michalska@linaro.org>
In-Reply-To: <20191121000843.24844-1-beata.michalska@linaro.org>
References: <20191121000843.24844-1-beata.michalska@linaro.org>
X-TUID: EHN5mYzRfHCq

ARMv8.2 introduced support for Data Cache Clean instructions
to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persistence)
- DV CVADP. Both specify conceptual points in a memory system where all writes
that are to reach them are considered persistent.
The support provided considers both to be actually the same so there is no
distinction between the two. If none is available (there is no backing store
for given memory) both will result in Data Cache Clean up to the point of
coherency. Otherwise sync for the specified range shall be performed.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c |  2 ++
 target/arm/cpu.h     | 10 ++++++++++
 target/arm/cpu64.c   |  1 +
 target/arm/helper.c  | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f6693e5..07b16cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -656,6 +656,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE_ID(aa64_jscvt, ARM_HWCAP_A64_JSCVT);
     GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
     GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
+    GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
 
     return hwcaps;
 }
@@ -665,6 +666,7 @@ static uint32_t get_elf_hwcap2(void)
     ARMCPU *cpu = ARM_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
+    GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 83a809d..c3c0bf5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3616,6 +3616,16 @@ static inline bool isar_feature_aa64_frint(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FRINTTS) != 0;
 }
 
+static inline bool isar_feature_aa64_dcpop(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) != 0;
+}
+
+static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >= 2;
+}
+
 static inline bool isar_feature_aa64_fp16(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically wrt FP16.  */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a39d6fc..61fd0ad 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -646,6 +646,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->isar.id_aa64isar0 = t;
 
         t = cpu->isar.id_aa64isar1;
+        t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, APA, 1); /* PAuth, architected only */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a089fb5..f90f3ec 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5929,6 +5929,52 @@ static const ARMCPRegInfo rndr_reginfo[] = {
       .access = PL0_R, .readfn = rndr_readfn },
     REGINFO_SENTINEL
 };
+
+#ifndef CONFIG_USER_ONLY
+static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    /* CTR_EL0 System register -> DminLine, bits [19:16] */
+    uint64_t dline_size = 4 << ((cpu->ctr >> 16) & 0xF);
+    uint64_t vaddr_in = (uint64_t) value;
+    uint64_t vaddr = vaddr_in & ~(dline_size - 1);
+    void *haddr;
+    int mem_idx = cpu_mmu_index(env, false);
+
+    /* This won't be crossing page boundaries */
+    haddr = probe_read(env, vaddr, dline_size, mem_idx, GETPC());
+    if (haddr) {
+
+        ram_addr_t offset;
+        MemoryRegion *mr;
+
+        /* RCU lock is already being held */
+        mr = memory_region_from_host(haddr, &offset);
+
+        if (mr) {
+            memory_region_do_writeback(mr, offset, dline_size);
+        }
+    }
+}
+
+static const ARMCPRegInfo dcpop_reg[] = {
+    { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
+      .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .accessfn = aa64_cacheop_access, .writefn = dccvap_writefn },
+    REGINFO_SENTINEL
+};
+
+static const ARMCPRegInfo dcpodp_reg[] = {
+    { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
+      .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .accessfn = aa64_cacheop_access, .writefn = dccvap_writefn },
+    REGINFO_SENTINEL
+};
+#endif /*CONFIG_USER_ONLY*/
+
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6889,6 +6935,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_rndr, cpu)) {
         define_arm_cp_regs(cpu, rndr_reginfo);
     }
+#ifndef CONFIG_USER_ONLY
+    /* Data Cache clean instructions up to PoP */
+    if (cpu_isar_feature(aa64_dcpop, cpu)) {
+        define_one_arm_cp_reg(cpu, dcpop_reg);
+
+        if (cpu_isar_feature(aa64_dcpodp, cpu)) {
+            define_one_arm_cp_reg(cpu, dcpodp_reg);
+        }
+    }
+#endif /*CONFIG_USER_ONLY*/
 #endif
 
     /*
-- 
2.7.4

Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp29892wri;
        Tue, 5 Nov 2019 15:41:51 -0800 (PST)
X-Received: by 2002:adf:8088:: with SMTP id 8mr29417450wrl.230.1572997311201;
        Tue, 05 Nov 2019 15:41:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572997311; cv=none;
        d=google.com; s=arc-20160816;
        b=HtECdWpoDZMP0tg0Ghmoht15GB7nsEkznOWSFNw4iqUUhzEGtF2tYKag7BtT41Dz/U
         0wufqvTUbklS/oFhGgWk1MqAZsRyOFon0efCUXDuzXOnrXkug7c1ZmXoP61GHIaA+J3c
         CLJ09oGAr4tsRgyN3hFcz9WiHUWFR6/yzCQBI7SPh0Gw0nSFCmh7tP7LZtnWNxNnhEFq
         rj6aYURtALszT+vivycVI/ZGXO2MluD1qabqLgZ/vq+vv2b3ilzkbqYEmgxWKmf5ZSlS
         5QS8V4zjAhX4hLpgB/+axLokIpshDzHfEPUDA7vCk/8rEISLjsFvsgCVPAJQkxvzBbGW
         oQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=8lNKiTvXzplhNbh/GcJVZyL/fynA0fCPHUNuHIruE/g=;
        b=ynZcsKhvn/QjUo9Nwa2NXZ670rPDbNTF/R+o7toyijw+rRIFx4mBb3OlzemiKasHg4
         4Omzl6dAZGt9IpRk9XWe8x+shjDHj6OQ/vnPxkxNiEZ04KTI58KZg8++cy4bah1PTIc+
         Ju8iYu+822q/k9e8CpHvPQS5vOv9LutcDOlo9ZdEKMnvEmS5COskS6IHzJyVaOQqllOb
         paW1iU2D9y39FJmf5y9hQJZhqPndZpCLHHxnXPzjhjekZe0KEiEtSOuPlh74EsKpbsOI
         nNp5h7qoutrDNRZM3IHr0MZYuar3iCUypBsArAC5bcVBdGSj5zfyW5qx4rFeIXGlqGr4
         xVqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAYHjiPa;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e10sor13926863wrp.62.2019.11.05.15.41.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 05 Nov 2019 15:41:51 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAYHjiPa;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8lNKiTvXzplhNbh/GcJVZyL/fynA0fCPHUNuHIruE/g=;
        b=qAYHjiPaen2PldMQMuyzz31BaZEpScWhl3dgB5BGybuKI7BOpksA4pcEHY1ywJyg6L
         NqCVBxb3H9Q1Dkxjfjx6pZa3xOK6oCyiA8e00qdtiA7Uy1knGa0PbVsdfS+g7CdAvjW7
         b/g61P+spe/jiqJRAZhLC4cscWJGn2z5TUFjDeywoLzNyqIAG8MWDVGcElV4u9m6dFGo
         Ul85U6nRz+/OEbJOQ4A+8b3kBg+9/NXSHZUc5ck92vLbSp4UgUok0ve7mEGQlV1FTV/a
         w3pxRhRCdhYLDsguJEpR8csZlFEDWspMCLYokUVHE0nhobMvgAJLk3atnZSuyzsgkni+
         9Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8lNKiTvXzplhNbh/GcJVZyL/fynA0fCPHUNuHIruE/g=;
        b=Wpzoyx9+wy5sJTNG85C/BujmDXivZSn5+FBwJiQmFuDT29rkNkdxTmqq/xt+44mSA9
         42dhzQUSoKgiY8GgF0OR+/F1uvm3zawJ0nAdDNY+gKXxLVCqWi8f1zI4UydPG3RVhF5C
         FBIxJLkk12DjSCBcKdPMpyaftNYvD1XrPjw1AwVT7UHr9Jc8pp8I/Jzp6LSs7w2mF/zM
         6D4fVcfcw6FCsjvMrYj8jXzNvKkHci2M94HXQiun7SFC9dFSbUQ94+n3u6ohzclpw0Fi
         XmptmPNjmWPmRgAqG2Kq3uHbWv4KE9fLqVnmKK6z5uJg+aqfwZUEPdUOiEdYPmYe1lKy
         ojbw==
X-Gm-Message-State: APjAAAXSMm1gwccipMnH6ehfCPw0O2X32mDWFUM4SNU2d59YwD5o3OBr
	t8BU51t/NPhYybHn4jFAVl8sq6wi
X-Google-Smtp-Source: APXvYqwt9r6dQ0PzrUZBPgiZSJtTuB7gsK8Ja4/pTzruE816FfKjnKiaAL2FHWDCKJeUmE6481yUwg==
X-Received: by 2002:adf:9044:: with SMTP id h62mr31518193wrh.91.1572997310898;
        Tue, 05 Nov 2019 15:41:50 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.home (host86-144-13-94.range86-144.btcentralplus.com. [86.144.13.94])
        by smtp.gmail.com with ESMTPSA id q25sm27295010wra.3.2019.11.05.15.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 15:41:50 -0800 (PST)
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
Subject: [PATCH v2 4/4] target/arm: Add support for DC CVAP & DC CVADP ins
Date: Tue,  5 Nov 2019 23:41:00 +0000
Message-Id: <20191105234100.22052-5-beata.michalska@linaro.org>
In-Reply-To: <20191105234100.22052-1-beata.michalska@linaro.org>
References: <20191105234100.22052-1-beata.michalska@linaro.org>
X-TUID: R6syzL6aoCUB

ARMv8.2 introduced support for Data Cache Clean instructions
to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persistence)
- DV CVADP. Both specify conceptual points in a memory system where all writes
that are to reach them are considered persistent.
The support provided considers both to be actually the same so there is no
distinction between the two. If none is available (there is no backing store
for given memory) both will result in Data Cache Clean up to the point of
coherency. Otherwise sync for the specified range shall be performed.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
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
index e1a66a2..0dc22c6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3617,6 +3617,16 @@ static inline bool isar_feature_aa64_frint(const ARMISARegisters *id)
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
index 68baf04..e6a033e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -661,6 +661,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->isar.id_aa64isar0 = t;
 
         t = cpu->isar.id_aa64isar1;
+        t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, APA, 1); /* PAuth, architected only */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index be67e2c..00c72e4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5924,6 +5924,52 @@ static const ARMCPRegInfo rndr_reginfo[] = {
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
@@ -6884,6 +6930,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569326njc;
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7b0nJ42A+N+ZdTFdvAa69siwy/16VL2D0546qkhZusF/ol49vjyA+QZzftYIiRAZ/1Qz1CY2mHM8hpQ==@linaro.org
X-Received: by 2002:a05:600c:1c25:b0:434:a4fe:cd6d with SMTP id 5b1f17b1804b1-434a4fecf1cmr5218625e9.12.1732564772018;
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564772; cv=none;
        d=google.com; s=arc-20240605;
        b=TAOwaFP0rgsL246c5YNpkt2pUp5gCJatmpcgdJbcYzmDSg0Of5KxHHRygkBpnPQbxW
         6zpsDrUced+Fwu2ebLVRT7piUTxibdn7Yd/sDr36umkm96WUe/8X8sHrWv5W7QZyvLtd
         PPkTv5xRIfxcX6Kk9EoTYUAD3L/OV+0P5rPPzykPJHhTw94oAqDbW5ZTAwUdClp/y8hm
         go6K+ZwB1P1t2RpQfIQcyZT2ItoodIBJ+xpMxlwxozXalq4JLEcb3eA3mAVECshkuRqH
         EMzQOVBJIP+NjYa2QAj2MFtoeqfGyOefIrvVIeHF6xQVmCO3lMQWHZFueKqt9BsZgAF3
         MDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RVDgLJZAGkfB+8H1cL/Q3uYqegohVBa+MtPvms4CCZc=;
        fh=a0cJHeuKi+GMY6dIdI5I03vrbgBlKO/0xvXfHnWsQeM=;
        b=X5qNgaj6/hxCwVV7dkSNNH7F23QddJipXhEKEslNCceRpQeTK3cvKBNQvN86oysSzA
         8K/wHMJwooW0e/PsRTdy53rdj7CWYYse68LwLTyj3iu+N4m9X8i3UgeQAbdi72H/qBis
         txtQXyjbwQiulnt+okTCWN8CsG0wEX/6HRx+mi9skgmeBePqxE+7FwE8nWXcZFJH7EOu
         PCp4vKmDQML/MTKFFme8csyZ4y5NqNgs65btwTUrVtrSH8c2ZcSbabTZKDHeu2UJqVZb
         50QPA2HT97SlotEIZkgGubCHzg7aeLXXLwxNu7+JG7ExWXSfP0gvYmp4NKKFX9Ztng6h
         LCcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DrDyXnsp;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-433cd833957sor42080915e9.9.2024.11.25.11.59.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DrDyXnsp;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564771; x=1733169571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVDgLJZAGkfB+8H1cL/Q3uYqegohVBa+MtPvms4CCZc=;
        b=DrDyXnspsYpaZdM/AYm0vyvqPK+BlZOWp+iXx35DzMBi7BI0FbBjE4CWAiB5nH7719
         +eAeh+ugi7TuRoS6k92IqahjhOgCwLPL1ejx8FVodf4Vij58ElZMUP0oKhcijiEKR3gq
         S1wTiizXHvVUT9tr2J0yZF/xf3T2bkTS5DrDTb9lOuZRRmeloD4qNERTwEboN/9Z9UUs
         st1HtzO06nQCTjCyh/qKXKuvGtiOKPkwOIurkxRCDVYzFDVCg9r0XgKIGEcp6OIVywf3
         KMcqZ4FPqRP3+AmyiqyCAf8Orlmt38HjukyjMakCJApaL2Qt7pufXC62aCz6KlBjgv84
         EyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564771; x=1733169571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVDgLJZAGkfB+8H1cL/Q3uYqegohVBa+MtPvms4CCZc=;
        b=duncdRdFujeamC1LMeoaqMybjGVXrwIQC2Y0KihAEQu50jklLV6k3cOx7FTJ0IPi8g
         1hIw3oq9n1TWBCPrFBspqRSim+nrRWmmqCl5wneZI/vfcNjuE+0m2Ck0eiP77Gn7iiNk
         EBmBiT4Z88Ic9GIUgoquodLLEo+eEf8mL90ZMSsZOcQSP3KHn26bZ7hBZr8PZab1rjuV
         KIg21x2SxKH/Lx8fnEBFkiWK8v6rJG5a7Ft47oIWp15I1jl6IOhegb3Vi8u0EB69hYLq
         cH9+8IfdEWp9TPvhQHuI0+lQBTRb/pqZ90WJmy2UYxy0cUErWyIH6fUKP4UisFS/ALa7
         v1qA==
X-Forwarded-Encrypted: i=1; AJvYcCXxH8jOP6vqYK6RYeGGwX/vHfzRKP7dOlnNHY/R9P1LeG5LWFhF1y46Jkazpjx86BloD7Qu3pbmjQlQTg==@linaro.org
X-Gm-Message-State: AOJu0YyoSvmq7/iLFuAdrB/DXwIugvS4owPEkJlN00AZq4o61qmEFTk8
	7kQYqFpeDQfMo/VJmt96yuP2VXHaVKiA31dkB7RMJUf+K9K9RFB7LbNDAlBPasGmTw==
X-Gm-Gg: ASbGnct13eYd52UMRpsetLBsxOZHlh/A2YMvZNyHTj+thnlnV7VxeUlR7jkF0Hre/8O
	9pCwCrhGlLTA3bwJNcK8ZHanOcvOMJNp7+xk6cdCuCAppaRFb4GPrROiYes/fiOBYouxHoQtCTE
	WK/O9cLPUyfYJgkqCKJ9GOS7KjRlN6xYfdb9iT1D+nPdwHEZyL+DatH+Ichf5vtXci6IIBVnJo1
	JLD6Gng82QXEf/ajwMDWRX2yO2kII5iCEZUN4nsp0uF90/mWQV0Ur9nRksSL4kHV9CR
X-Google-Smtp-Source: AGHT+IEaC1ttBSm2FtMlk4y0oHvFOQX7SKISqb0ItjMzkK9PFyhTNsAw3VpBr4qH7Z44KcuwSkVF0w==
X-Received: by 2002:a05:600c:510b:b0:431:1d97:2b0a with SMTP id 5b1f17b1804b1-433ce42875cmr136065045e9.15.1732564771511;
        Mon, 25 Nov 2024 11:59:31 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:31 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 12/26] target/arm/cpu: Set number of breakpoints and watchpoints in KVM
Date: Mon, 25 Nov 2024 19:56:11 +0000
Message-ID: <20241125195626.856992-14-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ysmMsxNt9HY/

Add "num-breakpoints" and "num-watchpoints" CPU parameters to configure
the debug features that KVM presents to the guest. The KVM vCPU
configuration is modified by calling SET_ONE_REG on the ID register.

This is needed for Realm VMs, whose parameters include breakpoints and
watchpoints, and influence the Realm Initial Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/cpu.h          |  4 ++
 target/arm/kvm_arm.h      |  2 +
 target/arm/arm-qmp-cmds.c |  1 +
 target/arm/cpu64.c        | 77 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c          | 56 +++++++++++++++++++++++++++-
 5 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f617591921..5cef43a8d2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1109,6 +1109,10 @@ struct ArchCPU {
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
+
+    /* Allows to override the default configuration */
+    uint8_t num_bps;
+    uint8_t num_wps;
 };
 
 typedef struct ARMCPUInfo {
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 67db09a424..28ebec8580 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -16,6 +16,8 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
+#define KVM_REG_ARM_ID_AA64DFR0_EL1     ARM64_SYS_REG(3, 0, 0, 5, 0)
+
 /**
  * kvm_arm_register_device:
  * @mr: memory region for this device
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 3cc8cc738b..0f574bb1dd 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -95,6 +95,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
     "pauth", "pauth-impdef", "pauth-qarma3",
+    "num-breakpoints", "num-watchpoints",
     NULL
 };
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 458d1cee01..1d4f4c134d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -576,6 +576,82 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+#if defined(CONFIG_KVM)
+static void arm_cpu_get_num_wps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    val = cpu->num_wps;
+    if (val == 0) {
+        val = FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, WRPS) + 1;
+    }
+
+    visit_type_uint8(v, name, &val, errp);
+}
+
+static void arm_cpu_set_num_wps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint8_t max_wps = FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, WRPS) + 1;
+
+    if (!visit_type_uint8(v, name, &val, errp)) {
+        return;
+    }
+
+    if (val < 2 || val > max_wps) {
+        error_setg(errp, "invalid number of watchpoints");
+        return;
+    }
+
+    cpu->num_wps = val;
+}
+
+static void arm_cpu_get_num_bps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    val = cpu->num_bps;
+    if (val == 0) {
+        val = FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, BRPS) + 1;
+    }
+
+    visit_type_uint8(v, name, &val, errp);
+}
+
+static void arm_cpu_set_num_bps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint8_t max_bps = FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, BRPS) + 1;
+
+    if (!visit_type_uint8(v, name, &val, errp)) {
+        return;
+    }
+
+    if (val < 2 || val > max_bps) {
+        error_setg(errp, "invalid number of breakpoints");
+        return;
+    }
+
+    cpu->num_bps = val;
+}
+
+static void aarch64_add_kvm_writable_properties(Object *obj)
+{
+    object_property_add(obj, "num-breakpoints", "uint8", arm_cpu_get_num_bps,
+                        arm_cpu_set_num_bps, NULL, NULL);
+    object_property_add(obj, "num-watchpoints", "uint8", arm_cpu_get_num_wps,
+                        arm_cpu_set_num_wps, NULL, NULL);
+}
+#endif /* CONFIG_KVM */
+
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 {
     uint64_t t;
@@ -726,6 +802,7 @@ static void aarch64_host_initfn(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
+        aarch64_add_kvm_writable_properties(obj);
     }
 #elif defined(CONFIG_HVF)
     ARMCPU *cpu = ARM_CPU(obj);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 870f51bf02..f6d45476b4 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -336,7 +336,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 5));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
-                              ARM64_SYS_REG(3, 0, 0, 5, 0));
+                              KVM_REG_ARM_ID_AA64DFR0_EL1);
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
                               ARM64_SYS_REG(3, 0, 0, 5, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
@@ -887,6 +887,54 @@ out:
     return ret;
 }
 
+static void kvm_arm_configure_aa64dfr0(ARMCPU *cpu)
+{
+    int ret;
+    uint64_t val, newval;
+    CPUState *cs = CPU(cpu);
+
+    if (!cpu->num_bps && !cpu->num_wps) {
+        return;
+    }
+
+    newval = cpu->isar.id_aa64dfr0;
+    if (cpu->num_bps) {
+        uint64_t ctx_cmps = FIELD_EX64(newval, ID_AA64DFR0, CTX_CMPS);
+
+        /* CTX_CMPs is never greater than BRPs */
+        ctx_cmps = MIN(ctx_cmps, cpu->num_bps - 1);
+        newval = FIELD_DP64(newval, ID_AA64DFR0, BRPS, cpu->num_bps - 1);
+        newval = FIELD_DP64(newval, ID_AA64DFR0, CTX_CMPS, ctx_cmps);
+    }
+    if (cpu->num_wps) {
+        newval = FIELD_DP64(newval, ID_AA64DFR0, WRPS, cpu->num_wps - 1);
+    }
+    ret = kvm_set_one_reg(cs, KVM_REG_ARM_ID_AA64DFR0_EL1, &newval);
+    if (ret) {
+        error_report("Failed to set KVM_REG_ARM_ID_AA64DFR0_EL1");
+        return;
+    }
+
+    /*
+     * Check if the write succeeded. KVM does offer the writable mask for this
+     * register, but this way we also check if the value we wrote was sane.
+     */
+    ret = kvm_get_one_reg(cs, KVM_REG_ARM_ID_AA64DFR0_EL1, &val);
+    if (ret) {
+        error_report("Failed to get KVM_REG_ARM_ID_AA64DFR0_EL1");
+        return;
+    }
+
+    if (val != newval) {
+        error_report("Failed to update KVM_REG_ARM_ID_AA64DFR0_EL1");
+    }
+}
+
+static void kvm_arm_configure_vcpu_regs(ARMCPU *cpu)
+{
+    kvm_arm_configure_aa64dfr0(cpu);
+}
+
 /**
  * kvm_arm_cpreg_level:
  * @regidx: KVM register index
@@ -1006,6 +1054,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
         fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
         abort();
     }
+
+    /*
+     * Before loading the KVM values into CPUState, update the KVM configuration
+     */
+    kvm_arm_configure_vcpu_regs(cpu);
+
     if (!write_kvmstate_to_list(cpu)) {
         fprintf(stderr, "write_kvmstate_to_list failed\n");
         abort();
-- 
2.47.0

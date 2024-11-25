Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569330njc;
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUknaZngIgqWwp/8Bh5DKXFoh1cTvZEomTmrFIO3DWj2BI2PlklvOraZaLo+XKia843RdwiXiRrLN9ByQ==@linaro.org
X-Received: by 2002:a05:600c:314b:b0:431:58bc:ad5e with SMTP id 5b1f17b1804b1-433ce4a9d55mr102567925e9.28.1732564772601;
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564772; cv=none;
        d=google.com; s=arc-20240605;
        b=EcukUXmzxZY4OSRSGCmjE4uPGKx/PxEsniAG+HmcyOWNkNpEL/X8rOcgrsnRYHeNST
         9SZ/oS6rtrvAyVwhnXn1QZM8zDyg9Ds3NLV03lp2mOzXbfUqCV3jdXVA6ZDgsDFUtVTA
         42IUcx6ejaThdORH7koQgyk2a8HnUmiBZaKKGxIigQ1oo8434p2RfXarJw1XEZNbNMHB
         +0IUONgps9lgjjTkf+DtUGYro9FPrcZ7LfT18xZADCcNxyfY7ubf7aM8pYve/SYuBRc2
         /ccLR9SlPoE/NGNwtQAWji38rFRpuR5ujGx+jvxi5JnLgx3zars9iqDeSAPneM3NvqEk
         MZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+ZxFPU/cHWqHSELYlJR67QZcEPKYi6vUTmv//JrZID4=;
        fh=HtPKSYgMC0vKKNPa3a67aovGGxMvmycH8lzl+1F869U=;
        b=a7CPgQuPFQGxcgyaoefrRRdBj/zG5zHaXc/8ovT40FaqrJPeoAuvqVSJ8anXo0dsdT
         8FzKc9t2r17dbqPfVN0GTogps9tsnrrKgh87iBbYxLXA3ymsnzQRetmw8p/a3DQJTo7e
         qFtj3KZFdfWzg5PNfqOdbmdRWmCfQXBKZrd0HE1lACBpz0IVvfbOWtuRsWhnASexqIMX
         pa38Rfpq9Fd0DWuIb9LM8ei1PZlLYWB3sa+JR7DqzUABa+t5IVyADpyd8IqNwnXMMnC6
         J6JETrJCzYwnnYWZpkd/kvtCuzn376INZFVBK4SPt2YrEx66aMQRZTGjT0zAIaHRH9Tu
         l6nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mQ2cqDJy;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4349e89b58asor12770315e9.3.2024.11.25.11.59.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mQ2cqDJy;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564772; x=1733169572; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZxFPU/cHWqHSELYlJR67QZcEPKYi6vUTmv//JrZID4=;
        b=mQ2cqDJydSjMg/zEW0Kfx8h4XkRMpWzwtfK3uSNboH2Yy8Eor+ySJtGRZQVJIOhYec
         ags/NN3Wc1wtkzlq1aSn4rznYAr5bWsL+bOc5BMPtK9NVYyeZWlJF9ziXdi1dkSZwXmY
         a8IUZr7CbJz80S6T7hD1I7vlVVPRUjhCOlFKh3LQf0Rvo9FgE0aRILxXik+GZ3xqNkJW
         hv60RMWRhzapH+CHE2F8rm8Y8J/CrJk3QCOiuyhO8ngZKSf+IRs3saPMAQLfLpnw7+WM
         yp+5xoZe5ofuiB0cmgQ8ZPdm5MSHte4PIuJm0g0o17G9xW2vUIQNCYHWQGl+mHbExXHE
         7lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564772; x=1733169572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZxFPU/cHWqHSELYlJR67QZcEPKYi6vUTmv//JrZID4=;
        b=iguZA9NGJT8gprV+G3QnVYVTNe3f0XlfV5swo0NXteGnwtNLLJQ0dzAVgRo9kpxZ7t
         TqaIsXlDwNZ3JaqHmbwtG34MzIfCuAMxY2bhf2ooyhvxcubFh+B5sujc2oXN6LlB9zH6
         X/frJeEfdhVydPWzbFQ9t0LKgNe1bM/84cfNlrrcO/iOeocZd/dqZbN8AKlhOwdS7i/w
         93W52xa4tlduFZtAT9DUqP0n4Klh0EMEE7HKsCef5UkVgW0ya2I+U0PXt4heVGardGjx
         +I4Z1rIcf1mW9tdN0xUqJFVgt7XQOAbyaC0DlHZwYKf5eHkxlDlci9HFtoS+5fApYpdY
         8VfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV2NUF4IIH7QIKyXui360FTcHazDRxkmlDlJzQMT11zzBqjwRrJHUG9IeGoUdvMtn6UTCD0G/k7KVxOg==@linaro.org
X-Gm-Message-State: AOJu0Yx8iglBJ6D4HQIPOIIHsSCHHPo9KcC8ide5yxT7rfoPusRZwWji
	z1DHvbWjCudeObiTzZbrSkGdEQ0Kb4v+2aEd4+31iU8lsoGCb00Fsg054VTHew6d5Q==
X-Gm-Gg: ASbGncvWzEIVmCLW36jBuDQygLPKmqaEzjmDwiS6kbjO3Mrhs6thBvM0Ozil2q+snpv
	BSxXBEeLFfrSjN9NLdWS5LgZI9zOy/eeURlAunXOHZ18JWhjQAzZ64b4n/wNOPSwB+/Jy+LJCJp
	FsMc5YS5LIgCnfwUHQaY85+suSDrHq02Pq9crCcR1OlL1SWD8hzLMfPJFD1+PUG7Bz3/H8d4la7
	PYpz3ge6wHvvmwKuIEYNYHMzqIWdvKCVVJYkOg1VsjoG5mgWDHIPWG2SaRwTQjkZJrV
X-Google-Smtp-Source: AGHT+IFVuKUMl8qVl+jZythLFRNH6SVTB2gdvNX8aguLJeAEaTVKDcV1J7mB6Tu6aoTmT/NUzj/bDQ==
X-Received: by 2002:a05:600c:4f86:b0:431:5632:448b with SMTP id 5b1f17b1804b1-433ce48eb82mr109983075e9.25.1732564772013;
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
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
Subject: [PATCH v3 13/26] target/arm/cpu: Set number of PMU counters in KVM
Date: Mon, 25 Nov 2024 19:56:12 +0000
Message-ID: <20241125195626.856992-15-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZyXVkfhICGzu

Add a "num-pmu-counters" CPU parameter to configure the number of
counters that KVM presents to the guest. This is needed for Realm VMs,
whose parameters include the number of PMU counters and influence the
Realm Initial Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/cpu.h          |  3 +++
 target/arm/kvm_arm.h      |  1 +
 target/arm/arm-qmp-cmds.c |  2 +-
 target/arm/cpu64.c        | 41 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c          | 34 +++++++++++++++++++++++++++++++-
 5 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5cef43a8d2..382dd4ded9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1113,6 +1113,7 @@ struct ArchCPU {
     /* Allows to override the default configuration */
     uint8_t num_bps;
     uint8_t num_wps;
+    int8_t num_pmu_ctrs;
 };
 
 typedef struct ARMCPUInfo {
@@ -2393,6 +2394,8 @@ FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)
 FIELD(MFAR, NS, 63, 1)
 
+FIELD(PMCR, N, 11, 5)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 28ebec8580..77680f238a 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -17,6 +17,7 @@
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
 #define KVM_REG_ARM_ID_AA64DFR0_EL1     ARM64_SYS_REG(3, 0, 0, 5, 0)
+#define KVM_REG_ARM_PMCR_EL0            ARM64_SYS_REG(3, 3, 9, 12, 0)
 
 /**
  * kvm_arm_register_device:
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 0f574bb1dd..985d4270b8 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -95,7 +95,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
     "pauth", "pauth-impdef", "pauth-qarma3",
-    "num-breakpoints", "num-watchpoints",
+    "num-breakpoints", "num-watchpoints", "num-pmu-counters",
     NULL
 };
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1d4f4c134d..cf1d17fb90 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -643,12 +643,53 @@ static void arm_cpu_set_num_bps(Object *obj, Visitor *v, const char *name,
     cpu->num_bps = val;
 }
 
+static void arm_cpu_get_num_pmu_ctrs(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (cpu->num_pmu_ctrs == -1) {
+        val = FIELD_EX64(cpu->isar.reset_pmcr_el0, PMCR, N);
+    } else {
+        val = cpu->num_pmu_ctrs;
+    }
+
+    visit_type_uint8(v, name, &val, errp);
+}
+
+static void arm_cpu_set_num_pmu_ctrs(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint8_t max_ctrs = FIELD_EX64(cpu->isar.reset_pmcr_el0, PMCR, N);
+
+    if (!visit_type_uint8(v, name, &val, errp)) {
+        return;
+    }
+
+    if (val > max_ctrs) {
+        error_setg(errp, "invalid number of PMU counters");
+        return;
+    }
+
+    cpu->num_pmu_ctrs = val;
+}
+
 static void aarch64_add_kvm_writable_properties(Object *obj)
 {
+    ARMCPU *cpu = ARM_CPU(obj);
+
     object_property_add(obj, "num-breakpoints", "uint8", arm_cpu_get_num_bps,
                         arm_cpu_set_num_bps, NULL, NULL);
     object_property_add(obj, "num-watchpoints", "uint8", arm_cpu_get_num_wps,
                         arm_cpu_set_num_wps, NULL, NULL);
+
+    cpu->num_pmu_ctrs = -1;
+    object_property_add(obj, "num-pmu-counters", "uint8",
+                        arm_cpu_get_num_pmu_ctrs, arm_cpu_set_num_pmu_ctrs,
+                        NULL, NULL);
 }
 #endif /* CONFIG_KVM */
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f6d45476b4..9784c47ff5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -438,7 +438,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         if (pmu_supported) {
             /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
             err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
-                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
+                                  KVM_REG_ARM_PMCR_EL0);
         }
 
         if (sve_supported) {
@@ -930,9 +930,41 @@ static void kvm_arm_configure_aa64dfr0(ARMCPU *cpu)
     }
 }
 
+static void kvm_arm_configure_pmcr(ARMCPU *cpu)
+{
+    int ret;
+    uint64_t val, newval;
+    CPUState *cs = CPU(cpu);
+
+    if (cpu->num_pmu_ctrs == -1) {
+        return;
+    }
+
+    newval = FIELD_DP64(cpu->isar.reset_pmcr_el0, PMCR, N, cpu->num_pmu_ctrs);
+    ret = kvm_set_one_reg(cs, KVM_REG_ARM_PMCR_EL0, &newval);
+    if (ret) {
+        error_report("Failed to set KVM_REG_ARM_PMCR_EL0");
+        return;
+    }
+
+    /*
+     * Check if the write succeeded, since older versions of KVM ignore it.
+     */
+    ret = kvm_get_one_reg(cs, KVM_REG_ARM_PMCR_EL0, &val);
+    if (ret) {
+        error_report("Failed to get KVM_REG_ARM_PMCR_EL0");
+        return;
+    }
+
+    if (val != newval) {
+        error_report("Failed to update KVM_REG_ARM_PMCR_EL0");
+    }
+}
+
 static void kvm_arm_configure_vcpu_regs(ARMCPU *cpu)
 {
     kvm_arm_configure_aa64dfr0(cpu);
+    kvm_arm_configure_pmcr(cpu);
 }
 
 /**
-- 
2.47.0

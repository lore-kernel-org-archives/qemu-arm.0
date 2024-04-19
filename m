Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498060ejd;
        Fri, 19 Apr 2024 08:59:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdPqquA4nK+3vf67RxjOEUMuw+0bfEBTtT6Un8DBIVak2551okvqrfiGMXQz20yeVRMIzEp/jCyYE+p387/vDzXS4sjhfg
X-Received: by 2002:a5d:6a49:0:b0:341:7589:39b1 with SMTP id t9-20020a5d6a49000000b00341758939b1mr1721428wrw.6.1713542398544;
        Fri, 19 Apr 2024 08:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542398; cv=none;
        d=google.com; s=arc-20160816;
        b=YhofYKtsrZCe/n4Bkba03hgwEPmkD3LX79Kf55VhgCXOkYMwmlPFEsjOSs4ofvtU45
         pS4xMD4fUUdBf4xapbwtQqOhBbVNi8n2L1lIqhtlgMXO+2/yZctymlQA6a8YIWxwFJxV
         7CXxs/nVGHQ3jQtfunCnvyxkzoWBf/sGv0BEQM5fg/PkFsGix7niYpwTq3KAKp9/Iong
         Utp7QJkZdDuFnxrbCXpDWmDqX1VDKTNNg/ST8xqt7V9rfD5VADh63BG4ToOzGhjkDGEJ
         myksbA8mSJ/xbuwFNnhvPyjAPuczZ59nW4xiG1BYAF/ZC8SCsSkquxYA9arzhG5/XCkB
         r3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sdsJt69+Vn2LQu2a//QmjSh4AtFMIlHO+kRO+YRpF0Q=;
        fh=O7P2l4PzC83W8NeZk7pqRf0wcJ9TAxe6qv/cUfmQIv0=;
        b=asho0z0aesRqX9M7f+WgGk1l6NHO+zDYtdH/+98GM2aogQut91Y+0Gko+xdBuRGkr/
         Z4Zdcy59It3ncqRqETLGIUhA2Esl3fRkp6ZdRP4RIojaNg0bveZXRLLW8xshlzKeT0/l
         6e8h8w1ccw2CVL12QpB1tRPMEkAxhKGu/AVmYNNnVqHjPP5RCahLAkqnAIyqinM5ZJ+u
         2LGavn97MmmUAy4xbl0oAibQNZpKKAee8hLOjedEEXSgh8JuuXYuCEeR+SVCafddcBuE
         MrNEUtaB821tMvGnv51OC0nxXq+qhlWKZSWP6IMMSnLiV8Kuefv3VXgZealFdUbD9ESQ
         4Kiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujfCc7l5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c9-20020adfc049000000b00345a489f234sor1074257wrf.6.2024.04.19.08.59.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujfCc7l5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542398; x=1714147198; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdsJt69+Vn2LQu2a//QmjSh4AtFMIlHO+kRO+YRpF0Q=;
        b=ujfCc7l5zAPz46kY5i3hFk2QqgQwExzJcWGBJmJ617mvX1fYVWf4KHA9wYmzipkVbg
         J2aTqyU/Sw2fE90E8wF57g09hUVLJj7iCrPCECqKjIGKYuvaVFoRbMWh0cyjyvj4Oj4R
         07GpKPfzbCnDYcSTTH8BD41RYq2PdMntOdCTFK8/5yT1Sf6YzYae0NpfLwZNWgOG1v02
         hibTuQJTKfhNPRpD1HIqvZr9rlDs2/WR4aLPWhOGvotNvXmfnLBBCZVzLj5URNXgNigw
         SURJiivEZvo3yWeeRtPtTJ2ID2jVwzUOZhHZTSGa4uaNtHve/PIcyXQhVtMgjooQWwaD
         LJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542398; x=1714147198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdsJt69+Vn2LQu2a//QmjSh4AtFMIlHO+kRO+YRpF0Q=;
        b=PSjGxrcEDq+214SlDoC/GJW+cV+CIffyEAWN0NDjVCuYtHe/RQKcZDshqN6pu0xOB8
         765hrCjh+5uNdbtQaqz5SoL32w1wu+mzE8U6jVIUdM/0qF9gJggRg4U4cVSbSgLgtije
         3AzV1Q8b8KgfPPFOmbiIUFgitc0OKodfWgRtXDRHJSB70K68lJMOzGxdGfZR5D9fG1Q4
         SttjsA5M8zJec3tIFIsH31S9eDyVQsNECzWMw3HkzkhfKu8g+lpJ8Bx+n6oUxGehS1yL
         BIS+GZbXbw7oUXHxYxjp9mCOlHzOnU3MO2EHqacoQIrvlDpR89f5v5tFPXiWv7a0FrcC
         Sacg==
X-Forwarded-Encrypted: i=1; AJvYcCW2OOr5A0iFDVpo/IxvYHvYiuWUTVZ31+o5sHMW9uMKgfPQZOMh7PkP5xGsA/PhR2PfhYcuVqU6/sodfdttGBG42aOZdhcK
X-Gm-Message-State: AOJu0YyBovYmBnBv8ScmQK7K+c0yVkcDwqjnomTtB8I4qTtZlK/GzPDd
	oknuJ7tY3bigXbusd2tBYpNQB7zhinLPLHAP2gkJ1MpWoidckJXJZofpT0LmbtNKPCkzcg2t61a
	xht0=
X-Google-Smtp-Source: AGHT+IGNEE/ZTIzfkGoDmlqGbmqGKRHYpsN+u5qQoorOaVeIoEGpyOeiLlHyPQ/djbxbYUKJ99BAEA==
X-Received: by 2002:adf:e044:0:b0:34a:cc3:806 with SMTP id w4-20020adfe044000000b0034a0cc30806mr1583821wrh.51.1713542398179;
        Fri, 19 Apr 2024 08:59:58 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:57 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 17/22] target/arm/cpu: Set number of PMU counters in KVM
Date: Fri, 19 Apr 2024 16:57:05 +0100
Message-ID: <20240419155709.318866-19-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Yf3MqhxNrGGp

Add a "num-pmu-counters" CPU parameter to configure the number of
counters that KVM presents to the guest. This is needed for Realm VMs,
whose parameters include the number of PMU counters and influence the
Realm Initial Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 target/arm/cpu.h          |  3 +++
 target/arm/kvm_arm.h      |  1 +
 target/arm/arm-qmp-cmds.c |  2 +-
 target/arm/cpu64.c        | 41 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c          | 34 +++++++++++++++++++++++++++++++-
 5 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24080da2b7..84f3a67dab 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1093,6 +1093,7 @@ struct ArchCPU {
     /* Allows to override the default configuration */
     uint8_t num_bps;
     uint8_t num_wps;
+    int8_t num_pmu_ctrs;
 };
 
 typedef struct ARMCPUInfo {
@@ -2312,6 +2313,8 @@ FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)
 FIELD(MFAR, NS, 63, 1)
 
+FIELD(PMCR, N, 11, 5)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b040686eab..62e39e7184 100644
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
index 9ca74eb019..6c2b922d93 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -638,12 +638,53 @@ static void arm_cpu_set_num_bps(Object *obj, Visitor *v, const char *name,
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
index 623980a25b..9855cadb1b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -418,7 +418,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         if (pmu_supported) {
             /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
             err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
-                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
+                                  KVM_REG_ARM_PMCR_EL0);
         }
 
         if (sve_supported) {
@@ -919,9 +919,41 @@ static void kvm_arm_configure_aa64dfr0(ARMCPU *cpu)
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
2.44.0

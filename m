Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498053ejd;
        Fri, 19 Apr 2024 08:59:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKD0+MpVKncyXywFjE1GnliayyO1kWjxi3q7ZDeusMt/lxH6Ltm1puKuysJdNED4m1PIy69ZFhggcmsOWSUctHtwT7iGwu
X-Received: by 2002:a5d:58ee:0:b0:349:eb59:c177 with SMTP id f14-20020a5d58ee000000b00349eb59c177mr1714736wrd.11.1713542397944;
        Fri, 19 Apr 2024 08:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542397; cv=none;
        d=google.com; s=arc-20160816;
        b=xTfnyYVJPMynT9cJ/Fw9GxhMMFGYhMHE+NFTstTXldwHX+ijfSemhnx7hzR/GU6N5v
         OM4JtUDB1i+L1Je+G1B+++VVhg0qXu0Q3VrVKNhIU1DMvsbThQMGkMiQyXWCJOUq9asL
         mB/ErqThAKx+9tNPTGXRhli8wx2T46bMAhUT9pMwV9ciP+DAmrR8qlKUpnd+tt/5MbC7
         LnhbniNsBjyFwBwWpv62d/vl3IboygQBFilW+C+XKi47yN4iF6osaR/xkh8trorJDUzp
         ZwQICWIx56ueHe3DG2VTTmcegVUzN5IvL/zLDcr/ipn7S07GtkUU5JAM0emttuWzRJfR
         s6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KYvfcDH3KQ6snrWfH/Ek9+OMW5ZpL7gVRfc7ZM2MjAE=;
        fh=BqjHKKOGb63DUQIPvfq4tCdzBxIy+hTkXNnpuQ4a68A=;
        b=PHjGGFGHtzyJtxdig4hJNUVUStRHuPX39G44e1AVDOOBb0q28RCaYezHMlkg5gVF+h
         DeZmA4UgQ4KY+/ZvHCOcyTPlSNjIVuRMxmv5tDaRyoXqisvFNZKdphOJSbXenComxS0R
         0sMPkopTRGKGP56nnSzC5k/0WRxTr2Qu03p/JR3FK2YIQqRORKUiS+8x7WsQNPrxrUjD
         vEy9zwg1akzLn4IF2HN41oT2pJKsQLTbP8mfN5OGthEdIn+lm5fN2lyKqIcm+krSN3KM
         oLwrMgqVfn/XnjNJNZYaLWucYnvXVyyvftDJBFvUcXUe8Y3IPFmIc0d1ykqUmnMEK/8p
         UKNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iqzSNRIU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g28-20020adfa49c000000b00343f61ae137sor1182411wrb.7.2024.04.19.08.59.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iqzSNRIU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542397; x=1714147197; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYvfcDH3KQ6snrWfH/Ek9+OMW5ZpL7gVRfc7ZM2MjAE=;
        b=iqzSNRIU9id+EkCXnfo2NxsZyIfMSYlbg/NpWX01AgNTUuoIgFaVBhuR5xIi18moIN
         Kjj3JDWdsYA2bosZAACbWlAdH5vOlLGcKYcR6tBX1Uqtk/EiV4HO8v1lxKSZZ1ESCSDQ
         VP9jARPclwEQstaNRCzc/YyBLwHfXVQNYkItyCJB+a//3eipsCZb+JsR49XZYDgeft5b
         jiawIKEXmAZq0m9DflGnQfBxsQ5yieIz4J4j2qnG6nyScof1UFUlkbvvHdxINXmqLi00
         iOWczT/mFmCp6xxxpJ8gTcf15Osk3EwWibn2HLfSq1mFqBfONHAwyO7NDTgXGatvPT8w
         bwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542397; x=1714147197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYvfcDH3KQ6snrWfH/Ek9+OMW5ZpL7gVRfc7ZM2MjAE=;
        b=nW/c9xLhwxGYgrdAwv5d8ptTwK8BwS/l7RDG2ACl9A4PscaUdC2BpxtSZ/UqcTEGbC
         IDM8f6AbKgZMwyVGY5kJMbk0Eyo5gFyyslFVozN2NaJzlICQxz9nG5EBfb4Hr2iIz1fX
         S9hNtegIs7YRPr7faoojApm4XTh2seJMQdh+UCdU+ajgcmD/O9WasdV37NnZr4MYnk4a
         YvsgUnB+3zi3D2CXFoepuN7wclBZPFbEbsj2fSp1ggGTi0hHz1aHFDeuu3oHuLd1t4V6
         cGKK8jtm9YEbesIz/eYEV/zfm+ntszeKc1fFRzVZYSRrqANCJNK12abN5kZgpGh1S+DX
         uF9A==
X-Forwarded-Encrypted: i=1; AJvYcCWP4A1Fdts4AnM8c+ydsqV7mjuDn8Bygp5lHpE2ZtXFRbkaCdwpCWJeWfhukWnWYfE/WUanZz+faRznt5QQMDPtA6EaswYC
X-Gm-Message-State: AOJu0YxJNAbhGvd9Dt/NYfszI+Dd/HnfXSKTK5wR7qhHbSRFhHbuxmE/
	KBz/bSWsKOaAyBPRolp2KPmzGp6/IIZm9VmT2B4pSmclXRO77jIfXPXBZxA042MruA==
X-Google-Smtp-Source: AGHT+IHNyNL2Q29+VBI1a+s20xx7GAuvwPFbUqa9vNRiWfqyeebNx8G45kD+mJ1WZo6VGxRdo9wECg==
X-Received: by 2002:adf:eb84:0:b0:34a:d5e:afd2 with SMTP id t4-20020adfeb84000000b0034a0d5eafd2mr1598954wrn.4.1713542397562;
        Fri, 19 Apr 2024 08:59:57 -0700 (PDT)
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
Subject: [PATCH v2 16/22] target/arm/cpu: Set number of breakpoints and watchpoints in KVM
Date: Fri, 19 Apr 2024 16:57:04 +0100
Message-ID: <20240419155709.318866-18-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hsxNhpR3vP4C

Add "num-breakpoints" and "num-watchpoints" CPU parameters to configure
the debug features that KVM presents to the guest. The KVM vCPU
configuration is modified by calling SET_ONE_REG on the ID register.

This is needed for Realm VMs, whose parameters include breakpoints and
watchpoints, and influence the Realm Initial Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 target/arm/cpu.h          |  4 ++
 target/arm/kvm_arm.h      |  2 +
 target/arm/arm-qmp-cmds.c |  1 +
 target/arm/cpu64.c        | 77 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c          | 56 +++++++++++++++++++++++++++-
 5 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d3ff1b4a31..24080da2b7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1089,6 +1089,10 @@ struct ArchCPU {
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
+
+    /* Allows to override the default configuration */
+    uint8_t num_bps;
+    uint8_t num_wps;
 };
 
 typedef struct ARMCPUInfo {
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 4b787dd628..b040686eab 100644
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
index 985b1efe16..9ca74eb019 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -571,6 +571,82 @@ void aarch64_add_pauth_properties(Object *obj)
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
@@ -713,6 +789,7 @@ static void aarch64_host_initfn(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
         aarch64_add_pauth_properties(obj);
+        aarch64_add_kvm_writable_properties(obj);
     }
 #elif defined(CONFIG_HVF)
     ARMCPU *cpu = ARM_CPU(obj);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6d368bf442..623980a25b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -318,7 +318,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 5));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
-                              ARM64_SYS_REG(3, 0, 0, 5, 0));
+                              KVM_REG_ARM_ID_AA64DFR0_EL1);
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
                               ARM64_SYS_REG(3, 0, 0, 5, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
@@ -876,6 +876,54 @@ out:
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
@@ -995,6 +1043,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
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
2.44.0

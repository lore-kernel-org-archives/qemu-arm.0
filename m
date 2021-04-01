Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp456635lfg;
        Thu, 1 Apr 2021 05:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZXbownr4BgMK00QsKvLr/IEgbYdWYD9w0+/BhsTSkvc4vI9WmjZnaRUeECD2uy9XeGnaB
X-Received: by 2002:a02:3b10:: with SMTP id c16mr7938060jaa.48.1617281936684;
        Thu, 01 Apr 2021 05:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617281936; cv=none;
        d=google.com; s=arc-20160816;
        b=NTAz0A8yco+Ii6RZOPTcWzrfps1KJ9ZOdxBBEB9JM+AFgrUy1ZYWJ9z0g2uQw9eKRn
         ebFrWbR4EKLI2NCy7ntVrv7N2qlaF5LlN6ToUIunrL/zFqDgeIxRc6Vs70yHXUx4mbp1
         g+2AAYCABGRpLS9SyO/gZZ0zw8HYQtmtue1/cZ1rKhDyZSOGFKzzeKniqa0GftRrEjKH
         DD9XhatITqdHnbVeUtD2ErfAmUlID35qYEZ5W7hg4tAVF6oynuWSvErCDjuKdVz/ob4t
         9JWoepVf+CRTWbMcthuHxmEG4jmfZGQ88TgyuN4KW5soCb8dHFamYOWjCsb/5ka05SGE
         DrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
        b=lA6zgepOagMhHxTabNZISaUeSy/H7JnSfCf3c7SEo7Ck9XDtmpYLwNs2wAIYH4Xq6K
         2wY/HvveCbELd0NuN8TDqm1tgTW3L533L/IQEqYl7Hiic8UzTLvz/yAUdB0i9dvzhUZt
         RMTYWq6uP6EnfusNFMGiETwHZc6KaKLqgihxKfH3NBWUBEAInmNhzo2Y6VneVwjFXss2
         5/lhyuVbBrUqkglWhZlmd3uUlUwecDJragYGouH4khimyrSpXBXkAuR3rYxE05p3UVK3
         Ttuhjrnzk7YjPgNYKaAE5G7SqFC9PCvG9JytdqwgTXF1yr2A8uKL4WN4Tp3vgrpQZFtc
         v+Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yayEFpLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si5437318iow.30.2021.04.01.05.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 05:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yayEFpLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRwuV-0005Ni-UF
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 08:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrb-0001ni-Mf
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 08:55:55 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:43624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrZ-00031W-3d
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 08:55:55 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so1980093otn.10
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
 b=yayEFpLPNYip1GCy16wSJRHJfojBH5pUhE2e/jfvlLPbs9lqNWIVXPmr7DipEBmfqq
 84sDLN2N9IHc1K+XqAhvIH95CLAa1jH/A2WgBwCRbkve+pA1SPYJaHVL8hJpf1vy12Tq
 I7f24Zw2LRNLUkVt05KO99iQz6fkKwfNUpf7/yC9XXnvp7Td2k26uu4u4lPJlDog6VoD
 dxVCHjSgIM78aoF/39y+mzS2xtBqhpQ2t1i8GqLJWkAdRSZUxnhZtQ3vw6vJfssOjx+e
 YlJOelMHiToWo3s5mMkcJsjkUGZO49eIwqHZWHVGK8vvdSjOK/EVBR9IlkFjaw0eM+1l
 /kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
 b=sw4W4f/2j07DWhgCxBtjFEqYSWb+xuWThT1j3Owik9YQ2ncXdp2GyN83TJRCjhPYhW
 R/wM/jZah/lJh2GHLhg1Ida2g+xzVfWYk8MWDbIaYIWTHAHpXF9l6S7wGfCgSJXNRqtb
 r4MkNt1S2IZmlpCPbVJ6CVvGi4BA1gpKqUj9L2jQclV1OPXQpkb3KNTqrFdjFGSsFIfh
 H48KqoSBaGohmybqclORMG4cwqjhnWQZIThH8aMavqE7f/rOJtFHtm2U9byaWg0+34pT
 cnGRp6Q4ShwFyUBtykzh8YSjNcQpf1KaDwM37cfSM+FiVEtAao0F5BHGO5dQ9FGJidxv
 zS0A==
X-Gm-Message-State: AOAM532mIAJcDfenDGHjdVzvyqEXJijz6N5Nnh7eYpSfiF720eJOemoN
 61YjgcMHZCOE4Zot5NGjm9aW
X-Received: by 2002:a9d:3c2:: with SMTP id f60mr7028094otf.220.1617281751764; 
 Thu, 01 Apr 2021 05:55:51 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:51 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
Date: Thu,  1 Apr 2021 12:55:37 +0000
Message-Id: <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OXuq/ybWOoF1

Turn off the 'el2' cpu property by default to keep in line with
that in TCG mode, i.e. we can now use '-cpu max|host,el2=on' to
enable the nested virtualization.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c      | 14 ++++++++++----
 target/arm/cpu.c   |  3 ++-
 target/arm/cpu64.c |  1 +
 target/arm/kvm64.c | 10 ++++++++++
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 92d46ebcfe..74340e21bd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -454,6 +454,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
     char *nodename;
+    bool has_el2 = object_property_get_bool(OBJECT(first_cpu), "el2", NULL);
 
     vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
@@ -491,7 +492,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                  2, vms->memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (vms->virt) {
+        if (vms->virt || has_el2) {
             qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                                    GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
@@ -1911,8 +1912,8 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->virt && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "Virtualization extensions to the guest CPU");
+        error_report("mach-virt: VM 'virtualization' feature is not supported "
+                     "in KVM mode, please use CPU feature 'el2' instead");
         exit(1);
     }
 
@@ -1950,11 +1951,16 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
 
-        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
+        if (!vms->virt && !kvm_enabled() &&
+            object_property_find(cpuobj, "has_el2")) {
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
         if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+            if (kvm_enabled() && ARM_CPU(cpuobj)->has_el2) {
+                vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
+            }
+
             object_property_set_int(cpuobj, "psci-conduit", vms->psci_conduit,
                                     NULL);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 30cc330f50..9530a2c4bf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1099,7 +1099,7 @@ static Property arm_cpu_rvbar_property =
 
 #ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
-            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
+            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, false);
 
 static Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
@@ -2018,6 +2018,7 @@ static void arm_host_initfn(Object *obj)
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
+        aarch64_add_el2_properties(obj);
     }
     arm_cpu_post_init(obj);
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3f3f2c5495..ae8811d09e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -666,6 +666,7 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        aarch64_add_el2_properties(obj);
     } else {
         uint64_t t;
         uint32_t u;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 9cacaf2eb8..7bf892404f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -500,6 +500,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool el2_supported;
     uint64_t features = 0;
     uint64_t t;
     int err;
@@ -646,6 +647,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    el2_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_EL2) > 0;
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
@@ -660,6 +662,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         ahcf->isar.id_aa64pfr0 = t;
     }
 
+    /* Use the ARM_FEATURE_EL2 bit to keep inline with that in TCG mode. */
+    if (el2_supported) {
+        features |= 1ULL << ARM_FEATURE_EL2;
+    }
+
     /*
      * We can assume any KVM supporting CPU is at least a v8
      * with VFPv4+Neon; this in turn implies most of the other
@@ -861,6 +868,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(kvm_arm_sve_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
     }
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
-- 
2.17.1


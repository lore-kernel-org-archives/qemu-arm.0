Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp359689lfg;
        Thu, 1 Apr 2021 03:41:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxpu96YZNeeFp3V8/FreJxe6Em0HI3ICB9ZAPcRfv4gzz3e2jA0d6spcrbLfFpnmouU+TJ
X-Received: by 2002:a5d:9d56:: with SMTP id k22mr6122521iok.145.1617273699818;
        Thu, 01 Apr 2021 03:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617273699; cv=none;
        d=google.com; s=arc-20160816;
        b=mQSu5/iYPlbKOF/T6nHddrQr7ERvyqkRP8et/IGVOlo1b8I7EloyTY4s4n6SuiTTtf
         ZaV4o4DkoN1tvpP4DW2xNmCJAsYGDB1s1SM9jSH7cfrcwBkIolPnl3uzMuw3Mo9mkwV8
         cvyAKZQ+qobTO4+4uPekcmmVahj6KLtKwxTNUCArn+uPkIX5GytNbdlDvALqHYJKjC4S
         ZSj5BKQ548vUV75rwMdwBi5PJWRui2HlPrutO+wR0o2vpTb4B5wMQhlNkS+I2p2QTdcw
         +vh+hkcXRWK0huffhi/xk9PLRmtfGRwGBmyLDhsJs8tPpRadqmtxHFvKeXZyejqQRU9g
         US7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
        b=l7Fxb0BLpXh8OlOtQDkTRhg31nrT+zRnVwAAySmQeVMgs90+XvmUmUuFt8xDuWXlGo
         2yg18bI85ervLV+t7Yq7hUFJwlRHLuUW/I2OhlpA4WjBndyX7Rtcr9Yu49KDuWR0KZ3H
         zOQqIfCykm+N+NrmwjAdnC7Www1CCS8qapbyULZ6kc+c0K2XJOF7pP3n8IdRIdsPWhLZ
         7VmtoJJENMF1l0u9QHlZI2h4/ORGkE4jVwpqpL1Yf5OOxiV2LsLlylw0e+IW07k44LRB
         hjztk0bxnrEqAgzZEa5IRGu4t9s6jNgf8YZdITdOySdvTP42tS2xXPrltaDWaDgKEnCL
         9ByQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N8s3Vyqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si4396363iou.15.2021.04.01.03.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 03:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N8s3Vyqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRule-0007az-Sd
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 06:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulL-0007AN-Kr
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:19 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulJ-0002Q4-Hd
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:19 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so1672181otn.10
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 03:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
 b=N8s3VyqaA5j1K7gTuKQyZ3SwynhIrvrdaHQu0PtzeaOvtj2bxCwNErcsd+tjj80giN
 nNJ7ZO+NRfkMihBBGpXa8s7L4FgVFIk69th5ZObD7Z7u5Lhk7K8gnVD7aDkRas8OQ+Jo
 YBh3ICwegcaw98mXexDWCFNY+XF6sY4C8V7cuGiDUe41/0PewAuXWDhPeOq9Kf88n7AV
 Q+ZQZLrPSbLWJJeW7RZGp5BWEmtqcz1jciLuUZNqo95ZzdvEsFgzJ94m/gkgwMCKcX6k
 bRTMXTI/VW4Wh4JZIDG9wP8EFqiE57BJGGXzeS9kXLyzojAvlZmYZkI3MsblvvnLfAZa
 pQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7GP5EWBOufrga+3kB4LulNdONpwe1B1Vve3c5Unp/SM=;
 b=LCs4Nbq3Bescgx2oiQNS+BEBhFBxP+TsDqR88W5Hkvt/QtXlrSPVZLfr5vWASiFts5
 ZUbCkj3w19uhaybdcRztTAYNxyU1eFsZ2l9QE16bJphiWs82aWiA/kYBQXIG4qTtAovN
 H6IonBE/NDky7tyTEbLTRQSV+ONKND7Fe5pBhq5WjF4A7Mkhx8/De5ppl7mvKSkzMbO5
 +LvPL5trI90SUA5c3iMVfy5YPMcbcjZAVb/y0kYGKYWsE6UVznTUHv4Isi4XSjUYOqjz
 BVOqjuJGjmKjr9D90L/j0gWixQlxHRy/Fm5CWe4zq0C7yhQdXCA0TVoV6hsnWoWxuYWR
 U+Hw==
X-Gm-Message-State: AOAM5300FBZqW+c6iXyxKNBlmvlJObfCjgP+aa2n1tIVhXW58AG4YVq+
 TcFB9KcKk9USHqdfjbude4Ph
X-Received: by 2002:a05:6830:14d2:: with SMTP id
 t18mr2404432otq.50.1617273676505; 
 Thu, 01 Apr 2021 03:41:16 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:16 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 5/6] target/arm/cpu: Enable 'el2' to work with host/max cpu
Date: Thu,  1 Apr 2021 10:40:57 +0000
Message-Id: <37df1b1872f15086dd1d066e53dc1eedaf114051.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZUOyZj8EAfSb

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


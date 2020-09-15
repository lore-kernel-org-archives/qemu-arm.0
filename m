Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2799101lfq;
        Mon, 14 Sep 2020 20:18:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTl05SjboEd2NyHOWM28BO+86yUck3620WhDyozQupOSrbIQvKD9TV2hldYiXDp3hzuw+E
X-Received: by 2002:ac8:581:: with SMTP id a1mr3830907qth.161.1600139920517;
        Mon, 14 Sep 2020 20:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600139920; cv=none;
        d=google.com; s=arc-20160816;
        b=cg7GMDasFrR8E2SQOa9kXY8OWG1ogf/hEUw1/7zg7oktt1uywuMWDEmbQ+dkLqNjDz
         82LP0KeOpWR+wG2bBbARgegjHY3vTRva9+P3af4nA9YC9uVmK2kk+tcwtt1DjXHSg5BW
         T0XtlGTPS6RFTSur0Ke/6dVg7e8mKE1WlKWp2S9Uirtk8d61EbJvfugdIkSc3snKKU1t
         QpMhHpe9b05ra06nLqGToPVSORtN7CWrzRt46HAcycX8kSvXaww2nWoTM85sUqtmYB0/
         67SymeJ9RamIdQPqF0+BvfRXOS/qTc+AZBeIxe+GklygHdOpeYekLCv9O7nEBfn84oLH
         BsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aCZKhsO2QByw5JkTztWmspLBY6hhifDHq83bnO4MirI=;
        b=n7Nh41LPKiumIG9i4+yQ/MNkVqHnhAgG2MfBWqY1ieJ0NYo+RmHJGJJM4xVatTAjIk
         pnK54SLivJFx7OP5OPxp3FZ0TvCX2pVnQEm8gjvBHhEdlNGA8eemO/d/wEK4T03pd8AS
         UzKpUMWrcLIY373cY/ovghYwfgl2u3O9AYhScjDEnQsDyZSaaERYPl6PS0KkO4h+0nC9
         +JpDZjH8WWEEvluUjcU4gwQPptNUrZpMmKdfI0MCJsO9llPQRoXBk7FKPPeGS74SPThb
         8ANN4FItj0dVtftwYAg3EbEUu/ylCNOw3raeKBmdPUf2kSmtoCx8nTXaS9NevAFt2R7e
         JZ3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbhBHfdH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc4si8470616qvb.47.2020.09.14.20.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 20:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbhBHfdH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI1UN-0002P4-W3
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 23:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1OD-0000Ta-Gp
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:17 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:38056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1OB-0001jN-GA
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:17 -0400
Received: by mail-pj1-x1044.google.com with SMTP id u3so1002556pjr.3
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 20:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aCZKhsO2QByw5JkTztWmspLBY6hhifDHq83bnO4MirI=;
 b=UbhBHfdHE5lGvQcilmgrKiB9r+0yqiUTOTX/9IqRFtJwYgSutwh77YzdkFqi3wnbOW
 AIkmAs8iQrWPIpwHdgELqfmXannsoSSn7cQFPsShV4n7WFTDyY39oC/D8rPaf534KJ10
 xkylBqBXc9wvEH63hpfUjGU575y0nkYGFPo8NivUVwleeokU5546zhFNMRVi74/TwE8/
 glgla5NaE2ByPMIDDa2lmqD5AK06T0gmQnV3cGGptL2iS9FhtowXbRQwBN4QaIs8eu87
 pj3Y9/gQMs2QazTxXGySKQoshhkLPtudlVW8MMMssbZsZYYUmLh1FbxXbA4oM9tjedB2
 PrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aCZKhsO2QByw5JkTztWmspLBY6hhifDHq83bnO4MirI=;
 b=EXdikMJX7oR5yEfHGsEHvW89fBMBtsDXf0Xdyv2CKIsLPOOi25MozHngcIbOnzeaQl
 7eRkeRTH5Lsd2JGD3MRhdAduU6ckwfsEBllJWeRpTiklRBO2fk5njL8NRodqHv4P0iFR
 koKE37b+QmFE+nYjfnKz7etsA1tNP8CqPJvA2V8K0gJzNvBFSld8AIpq9+Uucj+RdQ/R
 DfiqybVjrs4xYFrvcil1ISwS9T8ya3jlca8QB/WyeHOnc7Ps7u+oscoiuQVLF2eQp5wP
 AcXgTDv+P1MDRmvrrAIiw7JFJ/dzC29rgSMLskJAVolBVk7dE/iQiD+Juwtjd5WNdFQm
 ExUQ==
X-Gm-Message-State: AOAM530sxLPtjerynCGScoFDbJx58wDBtem/O+6UV6cNTbL85vVAGyMh
 V50RQZrPkBoiGRzjkaF5oRyv
X-Received: by 2002:a17:90b:80f:: with SMTP id
 bk15mr2274019pjb.36.1600139534178; 
 Mon, 14 Sep 2020 20:12:14 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id g23sm11551776pfh.133.2020.09.14.20.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:12:13 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v3 08/12] hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
Date: Tue, 15 Sep 2020 03:11:44 +0000
Message-Id: <ff07f07fefd2b9ae51f3a59452a1baab4a62c545.1600135462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600135462.git.haibo.xu@linaro.org>
References: <cover.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=haibo.xu@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJXEFwf789ez

From: Andrew Jones <drjones@redhat.com>

Move the KVM PMU setup part of fdt_add_pmu_nodes() to
virt_cpu_post_init(), which is a more appropriate location. Now
fdt_add_pmu_nodes() is also named more appropriately, because it
no longer does anything but fdt node creation.

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2ffcb073af..6bacfb668d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -521,21 +521,12 @@ static void fdt_add_gic_node(VirtMachineState *vms)
 
 static void fdt_add_pmu_nodes(const VirtMachineState *vms)
 {
-    CPUState *cpu;
-    ARMCPU *armcpu;
+    ARMCPU *armcpu = ARM_CPU(first_cpu);
     uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
 
-    CPU_FOREACH(cpu) {
-        armcpu = ARM_CPU(cpu);
-        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
-            return;
-        }
-        if (kvm_enabled()) {
-            if (kvm_irqchip_in_kernel()) {
-                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
-            }
-            kvm_arm_pmu_init(cpu);
-        }
+    if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
+        assert(!object_property_get_bool(OBJECT(armcpu), "pmu", NULL));
+        return;
     }
 
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
@@ -544,7 +535,6 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
                              (1 << vms->smp_cpus) - 1);
     }
 
-    armcpu = ARM_CPU(qemu_get_cpu(0));
     qemu_fdt_add_subnode(vms->fdt, "/pmu");
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
         const char compat[] = "arm,armv8-pmuv3";
@@ -1674,11 +1664,23 @@ static void finalize_gic_version(VirtMachineState *vms)
 
 static void virt_cpu_post_init(VirtMachineState *vms)
 {
-    bool aarch64;
+    bool aarch64, pmu;
+    CPUState *cpu;
 
     aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
+    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
 
-    if (!kvm_enabled()) {
+    if (kvm_enabled()) {
+        CPU_FOREACH(cpu) {
+            if (pmu) {
+                assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
+                if (kvm_irqchip_in_kernel()) {
+                    kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
+                }
+                kvm_arm_pmu_init(cpu);
+            }
+        }
+    } else {
         if (aarch64 && vms->highmem) {
             int requested_pa_size = 64 - clz64(vms->highest_gpa);
             int pamax = arm_pamax(ARM_CPU(first_cpu));
-- 
2.17.1


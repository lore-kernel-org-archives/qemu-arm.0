Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp394485lfq;
        Tue, 8 Sep 2020 01:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/xGA4jPOqwUDQG36L3EmAKtc2qBsATPGAbgANYlO+P6cxHsnO/wfnpDqdrpvi6ZllBJhw
X-Received: by 2002:a25:5f4c:: with SMTP id h12mr31979319ybm.97.1599552955936;
        Tue, 08 Sep 2020 01:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599552955; cv=none;
        d=google.com; s=arc-20160816;
        b=d/Ets0afWOGqSefrLlbxq8AUuTNulbaPkHiaqm/6s78h4fnaQwuKjPdchBmC+PsXb7
         Mpz84vm9PNQrm2eo0U+SwtvqVhE2KG4g5XozZDWdQSmhfYkBXInsuFWson1joOdDX0P5
         WqBZWziHRFa4F/t7EJRz+OwFs1zOOWBOAFJ997D0n9y4rPS9dumNeihiy1NAnAVc6mCH
         PAkCqkT9bsTN1lGLrjKMXmYGagFEj+QV6zXNcctvaPRdzcI83EGEIpBJ204/jIxXWpQH
         PcXKCU0O8hTUq82voQ2Vot0B3bkP79aUs5+8raKbNDNpQ4J9MuHB13rShch28isbeZkL
         Zdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VVgURpjuArAMDrEKjpU9KwbLTs4HVxWM7QaG/94weX8=;
        b=oygsSvfyI5/3XJ097KTS7DjV5+qED6EQnKG13LMlb9x5g0kDLfl9xL+Stj13eyfpar
         q0uH/qFHQ3VLmhVnjh2Ajuftw/wzuXsEchT2uzvLmHjj1gl3J7bQVkpKfrhV/z/I6AlW
         PV8vSs/5Xmjv32QBDib2oyFtE//9sOB0+WM11XgyxRSwUjruscXFwPo8O2Zdq7INCRyI
         pmpYeY6lpTicaKX3HiS7c6JllJ4LU2OAzxpGpcKdgsgpLjixLTJs5PqsffYvSRyhUbXV
         yd3oN3dIobvi9QmRn5pFp3eCG+uf7OHMvHN+VFfkEiUtY5lMT54sZd+sJSnYTrnsp8G7
         SQnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ap1msIb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d80si5572901ybh.58.2020.09.08.01.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ap1msIb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYnD-0001bV-6g
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlH-0005te-R0
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:55 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:32890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlF-0000Sd-JW
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:55 -0400
Received: by mail-pj1-x1043.google.com with SMTP id md22so5267pjb.0
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VVgURpjuArAMDrEKjpU9KwbLTs4HVxWM7QaG/94weX8=;
 b=ap1msIb8TT2AJK0n67LMP9CkJ7Zh9jrn8OzxQoi5+AiPMPuPFTpEPp8vw0o+zZ6fOo
 c9pp2gy4B4HBO0o9+/rSFx0gqKjFFVPCKZZPQ9ElNy+p3xGtYAR82dVJV2N+GLPoiKAI
 sSio2R1rAAjQbaEtg0Rp5NNL9fs6DZin2UR9Jwe5Xo0jUmfmAnlDUoGoiHSI8aYGe5YX
 vHUOybrqLMCVCbTX1SkyY70YpWtyWdHogAtVUovjepeP4c6GTBLGLzZscs/FiaZuMisF
 E+2wFWR20cp2fZqt07vDp8q7D1ibeb+Hm0HA4Tg7wsF2Fmcw3hnKuQ5fxXfrej7NN35J
 Me6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VVgURpjuArAMDrEKjpU9KwbLTs4HVxWM7QaG/94weX8=;
 b=HMgdPmDaIiPOKJipJEi4/pdFaPUPzZsEv3vd1EU1/fyJuOX/EISF1+N1AC9wrwJnW2
 55KZ5Wvt/ICjVnSBt4QrGCnuYx0qDkZtUO7CED0NqusUXYCvpr1b6J3S1L9MPA9zk4ZK
 lIGeoEj6oq2zTM9EFp75O3CJJgFo2gGB8s0xCc3Q5j9+3B6z5wZq7SS0OL2NO92/fZyb
 HbrDtGlCBUc4Ghs7TO8dAltSVfSgOndAXXlMdi0A9Xfpwjc3A2y8eYaI8PR608tAm99f
 FuNbF06i8Te/eQXl6uV+xB0r4m4suIsZuZovwSAfwrn57/sHwlsoHCZlvBxwBk9Dhww7
 15pQ==
X-Gm-Message-State: AOAM530TuBYPzmMWlDzeZYJfyfdb3gYSzRu9xBAQtgJ6WYy0s5s3T5Ax
 0AV7QGjzJH15/pIbKH6q7n1O
X-Received: by 2002:a17:90a:634c:: with SMTP id
 v12mr2904904pjs.57.1599552832108; 
 Tue, 08 Sep 2020 01:13:52 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:51 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 08/12] hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
Date: Tue,  8 Sep 2020 08:13:26 +0000
Message-Id: <7982854bb6cdb90390ea3f3c39c2801ef84fd2e5.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=haibo.xu@linaro.org; helo=mail-pj1-x1043.google.com
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
X-TUID: SwZQHgjMGb6v

From: Andrew Jones <drjones@redhat.com>

Move the KVM PMU setup part of fdt_add_pmu_nodes() to
virt_cpu_post_init(), which is a more appropriate location. Now
fdt_add_pmu_nodes() is also named more appropriately, because it
no longer does anything but fdt node creation.

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
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


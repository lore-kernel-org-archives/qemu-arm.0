Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp247848lfq;
        Wed, 30 Sep 2020 23:19:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbiKXCMDXxAKTb3BPKsXpNkH+o/3aKkCrW0sfOVa9FTpxsdZSVRWt/YspibFOI+alnp8pX
X-Received: by 2002:a25:b1a3:: with SMTP id h35mr7932679ybj.136.1601533172066;
        Wed, 30 Sep 2020 23:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601533172; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3v/gnM5jsJfgz9E1DZeKUjpniH8X6N/E+hplRoF+Qh97NR5h6xcWFJWc6OnbMKyLs
         8dllHulSQxzzrGx7WdMDOz+xMhIZ0dQgAjf10X3Lc6Jpo/kds77OGmZHgD9PAWsqHdKw
         KxTp62pAyh7jo5fT0A0l1Ft9BMvIVVhNUV3TjH+PWUGh2uUm0ujFKzP7d0j6Uaac0QOa
         I8CaAZ3+ONV3bNLukEeZeACN9BbhGvrN9k7LdeqPvYaE9eVDROu6qpxsvR/+QoaZOWIX
         Fk+5n6+cL+CnWT8tR4TcvZb7nmjkcrrPJRppqecWZxrUM9E0hyu1ELobds8Z/KLFxlN7
         B4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=64SmcdMkYwsAhSqPe415zi6gYv89e19emOMuW+84nos=;
        b=pUQzWJkIMvBJXNFrM+gCMTsgMBuemsdAfnrHdubBIpUW2m/kCItJKo+Sw6PIP5h4PF
         cNGIXvF2sbcTyWw6dC+b42CYIU0Aih6xsDtADj9sj1eWPkyiHSFG9vONxkkhB3uxagH0
         O8uqxE7m/87nGNFPZCt1Bv52lD6i2ESdRypRjwQK0ay/kz+hN8dRN4ASVDgRQ8njnTzH
         O0PTk8fIYtGiBhQG4ZstNwLOOMA7DUztQ5wH+ik4snBW9alk4fUWhWDbHO2AodmJ5CBJ
         082z7VJo6UYDkCWplsMETCmt/cl3agijiR0zlVHUGg/yAQdcIslOCcz6xUdVzF0aD4ev
         T7Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KKaUpfbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si4232631ybp.278.2020.09.30.23.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 23:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KKaUpfbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNrwB-0007FX-Cg
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 02:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruO-0004Q4-BY
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruM-0003sR-2e
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:40 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601533057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64SmcdMkYwsAhSqPe415zi6gYv89e19emOMuW+84nos=;
 b=KKaUpfbg4CXO6xIqMdVk+8KACZ1R0dOLfrpItg5U1vGq5Nq+QsPMJ97AWc26bfo5DJmn7g
 powZUZUPHuQRu8BU5kd+2zKahlVVADCg/wM4gjSIY/ZNNkq2lcuyRWyEgEAqM8mvjD0Bg3
 Ci/wq3iPWUeImskXPQwZ7LR3iBC2CTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-gdTuDkUTNK6NmS9NL2vPOQ-1; Thu, 01 Oct 2020 02:17:35 -0400
X-MC-Unique: gdTuDkUTNK6NmS9NL2vPOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D231868410;
 Thu,  1 Oct 2020 06:17:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C95685577A;
 Thu,  1 Oct 2020 06:17:32 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 4/6] hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
Date: Thu,  1 Oct 2020 08:17:16 +0200
Message-Id: <20201001061718.101915-5-drjones@redhat.com>
In-Reply-To: <20201001061718.101915-1-drjones@redhat.com>
References: <20201001061718.101915-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: REgCS4lOMWzK

Move the KVM PMU setup part of fdt_add_pmu_nodes() to
virt_cpu_post_init(), which is a more appropriate location. Now
fdt_add_pmu_nodes() is also named more appropriately, because it
no longer does anything but fdt node creation.

No functional change intended.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 524eafe22df8..92ab0fd094dc 100644
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
@@ -1678,11 +1668,23 @@ static void finalize_gic_version(VirtMachineState *vms)
  */
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
2.26.2


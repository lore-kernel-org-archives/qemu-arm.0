Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1531035lfm;
        Sat, 11 Jul 2020 03:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc1WSdqEkj/zTjm7N2oMqG8r4seByqKlAb9KKOp6+Xsu0x98XEKmqOgYFhHBNrgWLZQGoJ
X-Received: by 2002:a25:2705:: with SMTP id n5mr13008988ybn.457.1594462319717;
        Sat, 11 Jul 2020 03:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594462319; cv=none;
        d=google.com; s=arc-20160816;
        b=lYKGJ8n1mtUlgCOn+3VpRYQ/9RhVnOvpDrhAdHhynssGCX5dMWgUNFr0F8ivm1WUhe
         zJ96k6VHT7PR4f+W5JNqO5wry+oPn8jbIIhAq00SXqUi4TEN3ziwyrZVBYUYhP+j0tCC
         M1Vmi8wc1Si5vCbBYoTj4ITpOVd/h9gXe45zWe8My9iM1Z5EplhzcB61apGHXAXhrNNK
         0B+ZCAAsvhWWbxHjYgM0Qwfb6ZDdT6Jy1x9JkauAa6KDC63pBoNXjkNWOrwPS4bTBOK5
         IYvGx+2fQMX8UYcu5hqEy2ejxiiziEZIF54/33PaNc6Hx2S4ogi+LX3sMjY8t4fHflxk
         WCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G/xh1SpgA7XBEzJH+OIkhc62kkci0Ps/7UMsQ+8Gus8=;
        b=YxJEdPawCasSC06htrBLt2HatILC10B1wyMoGDIwLy5leptjDTdPWw5k0OA41jAcTB
         xLAWsyQrYdhML7U5xc/uI5zSQwvQi0Ew0fj9yyga3MxxTi2K8TzA0hx6kwNjlRsdeSzG
         RUJINjCRjBM7jASwdWrtr0KBN0xPffshFAD7KUsy+Fj1BUE/nQ1BEvpppw6dvEyev5jh
         2/gZzDltE98Hs00OL6xMmTrFWYPFrWxSCaksGV795dgDia6RzvYOhU7vy8vA09JUgJ8b
         +293qSuv8tRZ1IzckJhX/cxASA4BdluZiYETH3xCulsaLrtOBkhKx5GsBfDqw3P3ZAi7
         l7vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=czqNP7vZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r78si8823390ybc.42.2020.07.11.03.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 03:11:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=czqNP7vZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juCUA-0002F1-Pl
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 06:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1juCT1-0000Yc-1G
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 06:10:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40634
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1juCSy-0008EF-LP
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 06:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594462244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/xh1SpgA7XBEzJH+OIkhc62kkci0Ps/7UMsQ+8Gus8=;
 b=czqNP7vZSYyMGCaWIu8Ckjmdt8obK4p1+ehpHLKVmn0xunr426hlhHkZhfjOtjyCu4wIff
 Hvo5P+lH7RY6bIbsnZbSRCo0H/76bkVQriqCUgdqhF+cRPuf62XBjAJWw6QgaGZLrMJCL2
 PwhS98WCe6nczQK6WLFv5qo1f2tM34s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-W4q6zXckN26SmLxOlAGMDw-1; Sat, 11 Jul 2020 06:10:41 -0400
X-MC-Unique: W4q6zXckN26SmLxOlAGMDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61F1410059A9;
 Sat, 11 Jul 2020 10:10:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E062610F2;
 Sat, 11 Jul 2020 10:10:38 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/3] hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
Date: Sat, 11 Jul 2020 12:10:32 +0200
Message-Id: <20200711101033.47371-3-drjones@redhat.com>
In-Reply-To: <20200711101033.47371-1-drjones@redhat.com>
References: <20200711101033.47371-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/11 06:10:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +NnltKgG2gFT

Move the KVM PMU setup part of fdt_add_pmu_nodes() to
virt_cpu_post_init(), which is a more appropriate location. Now
fdt_add_pmu_nodes() is also named more appropriately, because it
no longer does anything but fdt node creation.

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cb2fa99b1ef5..63ef530933e5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -521,30 +521,15 @@ static void fdt_add_gic_node(VirtMachineState *vms)
 
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
-    }
-
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
                              (1 << vms->smp_cpus) - 1);
     }
 
-    armcpu = ARM_CPU(qemu_get_cpu(0));
     qemu_fdt_add_subnode(vms->fdt, "/pmu");
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
         const char compat[] = "arm,armv8-pmuv3";
@@ -1678,11 +1663,23 @@ static void finalize_gic_version(VirtMachineState *vms)
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
2.25.4


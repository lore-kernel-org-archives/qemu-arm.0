Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp299245lfq;
        Wed, 16 Sep 2020 02:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd6gQahEze8bBKWHLKW3bMIcHTrqHJdUScMQ/NXFtP1GtTjrtgiY/COZf96yISbpt6A6CJ
X-Received: by 2002:a25:250b:: with SMTP id l11mr34763838ybl.253.1600248537466;
        Wed, 16 Sep 2020 02:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600248537; cv=none;
        d=google.com; s=arc-20160816;
        b=kN1UCoTsqQisy6z/VfTlSwCN7c9BVo3MkNHD7Zt7kU+BP957BTSN0jd+J1pqdCAH2W
         E2YKWaVnDuoiejqpT0RVOartmTx8c280Nexn5CnyPrqNXMh3c7K/3sUf1pMntLcshhdo
         hViIlLzvhuTz1W6QSAT+WMUzb2vYpmgFzGS/KfJ8h+5cOOousVzhrv7EBS2gavAcHVmi
         M1MnI8tq1eD6cg9zcEWDOcrwvM97kYnEkUDzsVP8/X2XJ5P7vfLOWPZAsys6zA3fszsN
         qWmSzC7ODlZb1R4whnCyqrqLlGGIr0I0UrDuqwiraSfwGTd4DcX5kiwVQxR+/KS4uZNN
         9jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0noMqEEwXEQCXdwYxIBfUrKdLiJaDdhoPitQpm3ruXQ=;
        b=Xz9LgzFHOv4KKwN6dTxRtxttOJx+50GOHUrn4aVf6KouZZdkD9NVYfVABNJX7kcTB5
         LsfwheP5duiqLOHFgExzjArDIR7P7+e93Td3S96+/Ja3QE+7uW+Oq8/o9dhn/Ceh5nk/
         D41/8iLNUcUGENUL9k/6Z/KeOuKD7O+vEKNUsqh/SNNk7uIzdbb2K18wiGeVWPX1oDMp
         nlE/QpWUS+t9HqGTf8qkWQw1hh/CLIARvQ8idCmqytXjCXfQRiI6o/JTWckMSu1dRm5G
         iR/UArzD6auApBBWere9MffSgDZBrLSImREmg+gmHtzdMJgk3LYv6rbkeOoDmdsePqJy
         pzEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cO42soS8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23si15997569yba.144.2020.09.16.02.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 02:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cO42soS8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kITkG-0003q0-Sr
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kITi6-0008Su-70
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 05:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kITi3-0005FA-3X
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 05:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600248395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0noMqEEwXEQCXdwYxIBfUrKdLiJaDdhoPitQpm3ruXQ=;
 b=cO42soS8LsaWYI24OVz8IMAJm9b9CjVzFenHh6Q3DRK0qP/K82on2i6noulxQdy6cx6BBU
 R9e7+Y3k0aR9GjfoKUaF8jPqSRNBootQ0Md8OGcdUQfDTxrQssEZo8RCjiWfeAJMgHfehn
 QcmENeTCqhoBIMfu8gojc7eeD7rllmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-_1ctEnYQMfeM3YnoTtf6qw-1; Wed, 16 Sep 2020 05:26:33 -0400
X-MC-Unique: _1ctEnYQMfeM3YnoTtf6qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B368A84E244;
 Wed, 16 Sep 2020 09:26:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43DAD5DE4A;
 Wed, 16 Sep 2020 09:26:31 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 3/5] hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
Date: Wed, 16 Sep 2020 11:26:18 +0200
Message-Id: <20200916092620.19161-4-drjones@redhat.com>
In-Reply-To: <20200916092620.19161-1-drjones@redhat.com>
References: <20200916092620.19161-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xIYpVIrSatga

Move the KVM PMU setup part of fdt_add_pmu_nodes() to
virt_cpu_post_init(), which is a more appropriate location. Now
fdt_add_pmu_nodes() is also named more appropriately, because it
no longer does anything but fdt node creation.

No functional change intended.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2cba21fe3ad9..6797eb397a7a 100644
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


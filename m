Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp349448lfm;
        Sun, 16 May 2021 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV3cyEEd01hFWrgqMpB3atFOXmK4l77o027khVyvQp0mG+gY+a30O6kTTkRXxL9xzKlWOL
X-Received: by 2002:a05:6602:24d7:: with SMTP id h23mr394171ioe.159.1621161333726;
        Sun, 16 May 2021 03:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621161333; cv=none;
        d=google.com; s=arc-20160816;
        b=bSY0BGnsuFV/MW1UfCT2j65MrGe6LkBSgd4azZUrmr5xSzyH4mpqH+/PsxVT/X8A59
         8zXoLyCar+5hPeVnieqxNt8t8TiKeuDy5oIR1+FGIO4v7ifq2bVKWq1z/7/mhi44s+1G
         KIES/s4oVxtIYd/lzQodyAZ3bTU2TihMUOES+YD3XKyi/9lCndjtWwrZnSLHZEyWpZ5Z
         4OTHRkHEtWcf26qu9paOisbbN3qJyJOylt1eNr55T5BglBLwS/QFeq1+zp3BGqgJM9Wv
         i25SU1WVGIbMbwTGIxOs+drrmonsD4gu8RwFVu6g6u2g9mfxt54XapVAr5rHKMo5jzBt
         FAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=hKvlbha7WUAydFQJLaW2VJosejuODfnAVjlGY3v6dWM=;
        b=DMf3ydH2HTVSe15cezzF4gkEoPNF5t9UceveuMPpfKtoOCbCZ9GMDy8vd2ys9ebidy
         hNx91lj5S4ceU1luMDof5vu8yoe+koema3l1NN5ZydWPDhOgAPQfcVPXDsmbXrdnZkHj
         f9tV6IHf/BpeQLTutsfma4KF6jqSSG2So67gF00VzMBEAXXFYtcGdhKYUzlrxcR0Vp1x
         0tYl9WxdU0tjstJpW3rEwB3kvtuE8ZM7/1oq4SyjxCmL+c0fckRinc1wRTC25m5ShKIq
         h32gLnxD/qEWDoGzzyyYpS6QxHo5wwfhkXUE/PQ7YZUiRgvg76lR9L0JEaGLNg2/AEQ5
         FEKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si15837620jak.0.2021.05.16.03.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liE7R-0006o3-2Q
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1a-0001XW-47; Sun, 16 May 2021 06:29:31 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1M-0007EI-Kl; Sun, 16 May 2021 06:29:29 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fjdj06CS7zCsRn;
 Sun, 16 May 2021 18:26:28 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:12 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:12 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
Date: Sun, 16 May 2021 18:28:57 +0800
Message-ID: <20210516102900.28036-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516102900.28036-1-wangyanan55@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangyanan55@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, zhukeqian1@huawei.com,
 yangyicong@huawei.com, prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W2ShWUQdqL7U

When building ACPI tables regarding CPUs we should always build
them for the number of possible CPUs, not the number of present
CPUs. So we create gicc nodes in MADT for possible cpus and then
ensure only the present CPUs are marked ENABLED. Furthermore, it
also needed if we are going to support CPU hotplug in the future.

Co-developed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Co-developed-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a2d8e87616..4d64aeb865 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -481,6 +481,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const int *irqmap = vms->irqmap;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(MACHINE(vms));
+    bool pmu;
     int i;
 
     acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
@@ -491,11 +494,21 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
+    for (i = 0; i < possible_cpus->len; i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
 
+        /*
+         * PMU should have been either implemented for all CPUs or not,
+         * so we only get information from the first CPU, which could
+         * represent the others.
+         */
+        if (i == 0) {
+            pmu = arm_feature(&armcpu->env, ARM_FEATURE_PMU);
+        }
+        assert(!armcpu || arm_feature(&armcpu->env, ARM_FEATURE_PMU) == pmu);
+
         gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
         gicc->length = sizeof(*gicc);
         if (vms->gic_version == 2) {
@@ -504,11 +517,19 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
         }
         gicc->cpu_interface_number = cpu_to_le32(i);
-        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
+        gicc->arm_mpidr = cpu_to_le64(possible_cpus->cpus[i].arch_id);
         gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
 
-        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
+        /*
+         * ACPI spec says that LAPIC entry for non present CPU may be
+         * omitted from MADT or it must be marked as disabled. Here we
+         * choose to also keep the disabled ones in MADT.
+         */
+        if (possible_cpus->cpus[i].cpu != NULL) {
+            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        }
+
+        if (pmu) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
         }
         if (vms->virt) {
-- 
2.19.1


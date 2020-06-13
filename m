Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp452153lfm;
        Sat, 13 Jun 2020 14:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTRzL5R0uRETscW1KftCU6y7tK9LdmUtOWJ9xpskbUaC8bNDCKZ4ucxj75oXx9Q1cRCGLo
X-Received: by 2002:a5b:18d:: with SMTP id r13mr18725411ybl.235.1592085027537;
        Sat, 13 Jun 2020 14:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592085027; cv=none;
        d=google.com; s=arc-20160816;
        b=DzmOQIIV3gMJ3NZ3T7y7fLQ7s4KSLaBVnhtTf/t1b4JY+LXMEUABBmS1i0DBjypcoc
         zFw97bZplme9KgRz65ZnAiybxQMD+7WJdr4RUnQLLGzT96/oAHOGdHlLjvwofYQtqy5E
         N5EdIE1BqE35kUAtSlmp6vBWYXRdA7iaLMWhjwHwKD7cVYq+mJtfLNcg26Qo9LZQF65+
         M4YlznVC4aESzNkdgGQBWjQolWEwM46DakB3O8KjwgfM/BXvEtd6Ylx4heYnHGskaG/N
         ipqxaRdjszC2ZKeuW4YgYJrAfBPILctZAQQrOHuQ1OSaHy+IopnvcTQi4uTjrwN/55wb
         p2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=YUvov3wmOWCIsSZIpYxKakSLUuYuoOAdpM3pawiKTvk=;
        b=iZHy58FiqQ88lNEzRz5Bp4ZZpg7tDmshE46xd24pbe8d4yjOUzNWZvunq9pwfl3HAL
         NsxW0Wyd6WIjToAeJUA8huB9FeOwW5QsZK+6aPTjTnJnvRg+qbije4kTnp32YfQjy08/
         /cJ6OBVj66388GkDpqhLw7XmMA495s3Nz669Oxzo3v8DTJ7RZlLbYKcnwwkJL2569UPe
         7NunQgjaaT/JW7CO7MZrT17h++Q89W8ST4yojLgkGI/kFDkqNEMtf2EcihNlBdKHq2iM
         3ZaoFzqP6pE5qcaEGLpgbRCK9JGEU4T+Uiz63PNkSIsA7low9St1TBdRd3YE9bdN/m+i
         6ANw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si8758864yba.198.2020.06.13.14.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkE2j-0005WA-Io
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDxZ-0005wK-Bt; Sat, 13 Jun 2020 17:45:05 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3775 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDxX-00038p-75; Sat, 13 Jun 2020 17:45:05 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 96BE6538ECDCFFAEEE5B;
 Sun, 14 Jun 2020 05:45:00 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:44:53 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 07/22] arm/cpuhp: Init PMU at host for all possible vcpus
Date: Sat, 13 Jun 2020 22:36:14 +0100
Message-ID: <20200613213629.21984-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DsXKDO9Nlh7l

PMU for all possible vcpus must be initialized at the virt machine
initialization time. This patch refactors existing code to accomodate possible
vcpus. This also assumes that all processor being used are identical at least
for now but does not affect the normal scanarios where they might not be in
future. This assumption only affects the future hotplug scenarios if ever there
exists any hetergenous processors. In such a case PMU might not be enabled on
some vcpus. Is it acceptable and doable tradeoff for now?

This perhaps needs more discussion. please check below link,
Link: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00131.html

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 51 ++++++++++++++++++++++++++++++-------------
 include/hw/arm/virt.h |  1 +
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e55b20685..7f938f289b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -525,23 +525,9 @@ static void fdt_add_gic_node(VirtMachineState *vms)
 
 static void fdt_add_pmu_nodes(const VirtMachineState *vms)
 {
-    CPUState *cpu;
     ARMCPU *armcpu;
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
@@ -1414,6 +1400,38 @@ static void create_secure_ram(VirtMachineState *vms,
     g_free(nodename);
 }
 
+static bool virt_pmu_init(VirtMachineState *vms)
+{
+    CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
+    ARMCPU *armcpu;
+    int n;
+
+    /*
+     * As of now KVM ensures that within the host all the vcpus have same
+     * features configured. This cannot be changed later and cannot be diferent
+     * for new vcpus being plugged in. Also, -cpu option/virt machine cpu-type
+     * ensures all the vcpus are identical.
+     */
+    for (n = 0; n < possible_cpus->len; n++) {
+        CPUState *cpu = qemu_get_possible_cpu(n);
+        armcpu = ARM_CPU(cpu);
+
+        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
+            warn_report("Not all vcpus might have PMU initialized");
+            return false;
+        }
+
+        if (kvm_enabled()) {
+            if (kvm_irqchip_in_kernel()) {
+                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
+            }
+            kvm_arm_pmu_init(cpu);
+        }
+    }
+
+    return true;
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 {
     const VirtMachineState *board = container_of(binfo, VirtMachineState,
@@ -1909,7 +1927,10 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms);
 
-    fdt_add_pmu_nodes(vms);
+    if (!vmc->no_pmu && virt_pmu_init(vms)) {
+        vms->pmu = true;
+        fdt_add_pmu_nodes(vms);
+    }
 
     create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 38a9cad168..3ffbda6217 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -134,6 +134,7 @@ typedef struct {
     bool its;
     bool virt;
     bool ras;
+    bool pmu;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
-- 
2.17.1



Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3263557lfb;
        Sun, 8 Nov 2020 19:09:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyF5HfOBt1w/Yyb/gOBYxeUAIzi4cw3yjYBBIwJr1BdPIv1FuR7qHyaLySZR4iNcEhuWTO
X-Received: by 2002:a25:d84c:: with SMTP id p73mr16742088ybg.408.1604891394472;
        Sun, 08 Nov 2020 19:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891394; cv=none;
        d=google.com; s=arc-20160816;
        b=cnXEYQJoax669gc6Yfuqk2y1QNDrdZ40ebFLbEhDs3B5bkXsu1CZPaq/cdYbFwUg1F
         oxGbx2p0SM6ryJA4LX3Nfci0ndIjU9pQfnazsgoATL0+fkeYRxLdux8rXnLfH/+6K68s
         ZSzmO/81q8QnZ0no6xmizgxFnUFbkLUFzis+Em2usGFBw+vXzj9leHj4dvxJjAHn/IKD
         4qejFUOgiaRTFlDyvFIf70EYBQGM/26mN1fQnd3pABfz6BAGi0mj5uwCYYrEY8ZE0xkP
         5N5SjcfYYx2oijktl+s7ao2izhhkrOApGp8WlotoujU43KLCzlqKo2AB7WaBwbu4XAxk
         BFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=JMPsAB/MbpitJ9Ykfwc/yQo+j+uegyyGT5VVfC5G4DA=;
        b=mFjOrLse3KI15p+wvnZr6rCmycrdc9+H9NY+YvgbWHTJHBF6Bic2xroUXTPAssrwjh
         sODXgDzxZM19ABJmCyewK/+RPY+jbgMsD8PVe9iqcMaVRK09NakGcgaAracxWOMqvlsS
         qxFUONMHjC8lMwiHHrOfVaHrXHXFFn1EyjCbMVA3VQvIRmHdLo3RtHXXZxHRs69NkHfn
         8Blu4/MKBNQCXvfR3l7JtjV4c/drreGXgUvtZTqSPcCwoNELfw/vC0sWG8Hoj8zlC/Lj
         zcmJ9nvGqr1XSaN7FJwWrMdXL4k30LE4kNNe+H14+DgRq+oviOydd/21M7v1euL86rxB
         nRTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si7478600ybk.227.2020.11.08.19.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxZ3-0007Ph-Ot
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUv-0001ic-8w; Sun, 08 Nov 2020 22:05:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUr-0006d6-CK; Sun, 08 Nov 2020 22:05:36 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CTwpc6XXqz15Sbl;
 Mon,  9 Nov 2020 11:05:12 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:14 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 07/13] hw/arm/virt-acpi-build: distinguish possible and
 present cpus
Date: Mon, 9 Nov 2020 11:04:46 +0800
Message-ID: <20201109030452.2197-8-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n3wEXmENFRQO

When building ACPI tables regarding CPUs we should always build
them for the number of possible CPUs, not the number of present
CPUs. We then ensure only the present CPUs are enabled in madt.
Furthermore, it is also needed if we are going to support CPU
hotplug in the future.

This patch is a rework based on Andrew Jones's contribution at
https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c | 17 ++++++++++++-----
 hw/arm/virt.c            |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a222981737..9edd6385dc 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -57,14 +57,18 @@
 
 #define ARM_SPI_BASE 32
 
-static void acpi_dsdt_add_cpus(Aml *scope, int cpus)
+static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
 {
     uint16_t i;
+    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
 
-    for (i = 0; i < cpus; i++) {
+    for (i = 0; i < possible_cpus->len; i++) {
         Aml *dev = aml_device("C%.03X", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        if (possible_cpus->cpus[i].cpu == NULL) {
+            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
+        }
         aml_append(scope, dev);
     }
 }
@@ -470,6 +474,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const int *irqmap = vms->irqmap;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
+    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
     int i;
 
     acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
@@ -480,7 +485,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
+    for (i = 0; i < possible_cpus->len; i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
@@ -495,7 +500,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gicc->cpu_interface_number = cpu_to_le32(i);
         gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
         gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        if (possible_cpus->cpus[i].cpu != NULL) {
+            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        }
 
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
@@ -599,7 +606,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, ms->smp.cpus);
+    acpi_dsdt_add_cpus(scope, vms);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d23b941020..b6cebb5549 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1977,6 +1977,9 @@ static void machvirt_init(MachineState *machine)
 
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
         object_unref(cpuobj);
+
+        /* Initialize cpu member here since cpu hotplug is not supported yet */
+        machine->possible_cpus->cpus[n].cpu = cpuobj;
     }
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
-- 
2.23.0


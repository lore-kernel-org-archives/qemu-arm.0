Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4789283lfa;
        Tue, 20 Oct 2020 06:28:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzzFeD74iEdbFvjwKvuQiH7pR/zcvfHaFsudj0infxPrO5hBSSMjkY5Hj08hofkYyEj/sJ
X-Received: by 2002:a25:3813:: with SMTP id f19mr4033227yba.373.1603200513180;
        Tue, 20 Oct 2020 06:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603200513; cv=none;
        d=google.com; s=arc-20160816;
        b=BZz2jPbG6MK8M0+uiyrEkNiBmW8SrzsfX8tePDwtLAXs5VqFv3BDJ8m47qom0G8L/o
         NGPI6dZcbZfD1ELNqiZ727E4XbhkaES5BTDIMxNt8LiXeFxUC7H3R5Ahgg/ps4OKGLrH
         FRMbGUlc37ynkxYv8bGeMQ+8tnkMrUYDz2OgTPuERrYGopGgcqkT/KAXnD2kKA9+SZQH
         QiA860vhOyNqnliEUODPxbDhjrgVCixBLUM0oJ7/RPDxm0GgJtIeLE/EepiihOXeK1c/
         SN+EbWy7AWcsO/hiRrIXJN3rXwVXDpr2ZUX11smkeCektvdeuP/b/qQiRk1VRYWTaxGs
         2/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=wVHnA4gwW1n+UjWJl4UDAjZkA50qzCWDg95DgnEdYWE=;
        b=w2o3i+yItsb7MWKtCCdd6XqTnisldwpQXkZsvdRdUAx/x8jqVPiSrjhHrQ0ntuwrkz
         i/eCGqPHuupWkXVyZiZ3AJ8H2E5TyLAZIolJsDfhy1M7CsbLyebKyo/Pj5DNs3YUUPHY
         5oJA34R4s8J+rCoLhlopGxmH3E9767ujVioYqXpd/TWa+T27yapmNCn31Fv3xXSOS+g0
         YY3oERsusJgYi8n2LYIHYDAbSkqG8Ua2CP5+1Nw4jxAE5O6LBkNLIKTGrBbYzoJYflSQ
         HBjGfRfLAmM/H1K9I4pCdgfw2KOxH/xkAC6DtUJ8WM81TC10vwnC3Flh06SDY8bQoLLd
         jmOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144si1689958ybc.459.2020.10.20.06.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrgm-000295-Hx
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU5-0000IF-HL; Tue, 20 Oct 2020 09:15:27 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:48348 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-00076n-NW; Tue, 20 Oct 2020 09:15:25 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 589CC7F92F8E822A84E4;
 Tue, 20 Oct 2020 21:15:10 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:02 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 07/13] hw/arm/virt-acpi-build: distinguish possible and
 present cpus Message
Date: Tue, 20 Oct 2020 21:14:34 +0800
Message-ID: <20201020131440.1090-8-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 07:04:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FTZkCRE1BwmA

When building ACPI tables regarding CPUs we should always build
them for the number of possible CPUs, not the number of present
CPUs. We then ensure only the present CPUs are enabled.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a222981737..fae5a26741 100644
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
+    int possible_cpus = MACHINE(vms)->possible_cpus->len;
     int i;
 
     acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
@@ -480,7 +485,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
+    for (i = 0; i < possible_cpus; i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
@@ -495,7 +500,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gicc->cpu_interface_number = cpu_to_le32(i);
         gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
         gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        if (i < MACHINE(vms)->smp.cpus) {
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
-- 
2.23.0


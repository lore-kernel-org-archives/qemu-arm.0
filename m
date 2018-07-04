Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp502339wrq;
        Wed, 4 Jul 2018 05:50:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfKCNiEsIXsKyzp46xWZ3ocijs9Iq+/J2OElJIYuiMi6c91MY9T4nldCFLEX7mqXpca2d70
X-Received: by 2002:a37:a944:: with SMTP id s65-v6mr1367307qke.435.1530708606091;
        Wed, 04 Jul 2018 05:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530708606; cv=none;
        d=google.com; s=arc-20160816;
        b=jTPAQL+gWcG4hpwSEidG78o4O7p8yw5qHwBpgnXu2FgdlHOAgfN8pKWn9KneK2XP+h
         Svxu8UAL5SVWo3mw8e12iVmMiFqwkXa0nhJCKXRPqe9wKDvJPTwEGJnnF5uhkR9/cirX
         xPdb94U1BE396BKF6R7LjsfoKxGDgEPBHJTuGj7+IspGPGkzUmlZjg4qVFnB0+u2U17I
         xNUhkDVmVFhTTUfYHIU2t1e3Gg52aGLpOSXj+cfkOXuSKAsF6qi7GLOVP87cYKZnIZBJ
         aVSiyLl56kCPT/oeSirhEcJu+J5odVMdysAygKM5atqMZP/lyGRmnaVv4nR68Obh2KKt
         JwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gnzLGq950NlZVtXhgrmnwysAgXNBbeSeGIZqe/sid7Q=;
        b=J6cWgpnqsQtB10HlkLZZtAwfGsLNYqENfsEkZuuL0gt6hocX2N8zxk7ob3ujxQG/wP
         9G9DHf4QkAIDGV7Nf26+azvepBY//wwR9FKPMMqursD7vJL7mjpZLvmwq7PULfoYtrmT
         5JZlrI7M3toeHKkPtTaNdu6RLvdJ4n/5/yGDd7TFATHvGyxAPW1iYO/2zE4GVmPt7FrF
         3WFtXi1Rxa7d6LQ8wk3saHnf7z6hf7rMjuIkpfPnx2fbBiqriMaRPmPD2HqgQrXaUeZe
         fGYM6+ehP6z30EGsh1GJ/hkocIEcolgskvFBzbPsyaEAip6RZIRmtPPu0G0+TxPJYTUt
         VzmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16-v6si2802359qvo.227.2018.07.04.05.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 05:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fahET-0007lb-In
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 08:50:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDy-0007SH-DM
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDx-0000Tz-F1
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40778 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fahDx-0000Tm-8y; Wed, 04 Jul 2018 08:49:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0F3F401DEA8;
	Wed,  4 Jul 2018 12:49:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E5882156889;
	Wed,  4 Jul 2018 12:49:31 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  4 Jul 2018 14:49:21 +0200
Message-Id: <20180704124923.32483-5-drjones@redhat.com>
In-Reply-To: <20180704124923.32483-1-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 04 Jul 2018 12:49:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 04 Jul 2018 12:49:32 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC PATCH 4/6] hw/arm/virt-acpi-build: distinguish
 possible and present cpus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: beVbwcX0vkS8

When building ACPI tables regarding CPUs we should always build
them for the number of possible CPUs, not the number of present
CPUs. We then ensure only the present CPUs are enabled.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e258832..1d1fc824da6f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -49,14 +49,22 @@
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
-static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
+static int possible_cpus(VirtMachineState *vms)
+{
+    return MACHINE_GET_CLASS(vms)->possible_cpu_arch_ids(MACHINE(vms))->len;
+}
+
+static void acpi_dsdt_add_cpus(Aml *scope, int possible, int present)
 {
     uint16_t i;
 
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < possible; i++) {
         Aml *dev = aml_device("C%.03X", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        if (i >= present) {
+            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
+        }
         aml_append(scope, dev);
     }
 }
@@ -650,7 +658,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < vms->smp_cpus; i++) {
+    for (i = 0; i < possible_cpus(vms); i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
@@ -663,7 +671,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gicc->cpu_interface_number = cpu_to_le32(i);
         gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
         gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        if (i < vms->smp_cpus) {
+            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        }
 
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
@@ -763,7 +773,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
+    acpi_dsdt_add_cpus(scope, possible_cpus(vms), vms->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
-- 
2.17.1


Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp452170lfm;
        Sat, 13 Jun 2020 14:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyynmbAo/bFts0sAV8C2w2+aKaZ5f3p+ww1bFtwELPmDg+8XZZWBlkYGqCqtYcqvxLAVU5H
X-Received: by 2002:a25:ef02:: with SMTP id g2mr32499397ybd.393.1592085030809;
        Sat, 13 Jun 2020 14:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592085030; cv=none;
        d=google.com; s=arc-20160816;
        b=zhw/QmYa7Cn0mWpYhqd1bXQO/rrJ4mJfrajy6AuapPnf4LOwB81EiFXxOFcoNm6wAw
         0rDSGlChGEPhgiSIp3bHrh3q55TLxq2vDQeR/IE9Sv3wPGBZyA0h05vNT4QSdQ5QRSoI
         Gl37CXm+8FiWxYhpbNnpV2FDKaQ3B2/lVPxgK83dkDePsS7BCgufhkC5Zg+VG1SeBAUh
         w0UKXj2ckhomp+n2GrZlniyMot47Gpe8ggWB2YYfnt+/U5K6Cp5tg2e3/kwgyBD+ufnv
         kvsWRuI2H5GQ5NmQQfTlKUmdAHsZGyJ9yuaJehAAAjC7e6FYmTO8eefidgsWiJWVTMuP
         qJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Pu4MDsEMOqvid0NtrNqDgwUICexPV7AyIPUsBStQJpc=;
        b=NkS0mTA3qc5GZcrcQp2PBCwI6ST4cN7rsw6xJaFcgQsfaINLDPnXW/h1eXdElQoPGO
         w3HAz3lNCViIQh+1R97XZ1wN6XuuGeRX8kNwOKnZ7qMpzXTGUISvxogm3wKLLa1SmY36
         1I/YoWtF/nOHVacD8VUeHpkrLKuW7Lm5iuAsyXsJWDAnJarxt2QouDA48Re2RSeB0kSX
         PjFu94LLvmivh90+lVsvW56q7m7TwRoQT8AFLCcKwMlwHY+P3skZaHZQc7ZL6hyrcZHR
         xSvn35SfRE24EMpt0/6jGx+kh+tm0orH6aTKrYiep0szOvJfgb1hLnNAkPgALfP1UbMK
         ocSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si8942877ybn.76.2020.06.13.14.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkE2o-0005bg-6e
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDy4-000757-NM; Sat, 13 Jun 2020 17:45:36 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44024 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDy1-0003KL-LS; Sat, 13 Jun 2020 17:45:36 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0C2ED2A45448682DC913;
 Sun, 14 Jun 2020 05:45:31 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:45:23 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 12/22] arm/cpuhp: MADT Tbl change to size the guest with
 possible vcpus
Date: Sat, 13 Jun 2020 22:36:19 +0100
Message-ID: <20200613213629.21984-13-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:20
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
X-TUID: TWeA0AvheyE/

Changes required during building of MADT Table by QEMU to accomodate disabled
possible vcpus. This info shall be used by the guest kernel to size up its
resources during boot time. This pre-sizing of the guest kernel done on
possible vcpus will facilitate hotplug of the disabled vcpus.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d40540db61..c654e2c9a3 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -603,6 +603,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiMultipleApicTable *madt;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
+    MachineState *ms = &vms->parent;
+    CPUArchIdList *possible_cpus = ms->possible_cpus;
     int i;
 
     madt = acpi_data_push(table_data, sizeof *madt);
@@ -613,11 +615,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < vms->smp_cpus; i++) {
+    for (i = 0; i < vms->max_cpus; i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
-
+        ARMCPU *cpu = ARM_CPU(qemu_get_possible_cpu(i));
         gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
         gicc->length = sizeof(*gicc);
         if (vms->gic_version == 2) {
@@ -626,11 +627,14 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
         }
         gicc->cpu_interface_number = cpu_to_le32(i);
-        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
+        gicc->arm_mpidr = possible_cpus->cpus[i].arch_id;
         gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
-
-        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
+        if ( i < vms->smp_cpus ) {
+            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        } else {
+            gicc->flags = cpu_to_le32(0);
+        }
+        if ((cpu && arm_feature(&cpu->env, ARM_FEATURE_PMU)) || vms->pmu) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
         }
         if (vms->virt) {
-- 
2.17.1



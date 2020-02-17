Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4785645lfp;
        Sun, 16 Feb 2020 23:44:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQQ3AF1QHFDvBJwn3KkbP6rOnp+VhbKq+ypsmOOt4rqZbRwzlp4nVyfC54dmxNtlxMF+n6
X-Received: by 2002:ad4:5562:: with SMTP id w2mr11568895qvy.147.1581925466383;
        Sun, 16 Feb 2020 23:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581925466; cv=none;
        d=google.com; s=arc-20160816;
        b=wb0TWGV5iEeaC8NzjCsU3WSA55VSrq+knfo0YfbQHneQY75S3C5ITT563xJgQLhdM4
         wbPFNuDgQIJahm0ZtcGCS46KnSlx7iDM0HeOiCQwmC13ST4NdYVK6yhl5iMhyS2CUuAG
         1CfjTXbOsJwAQLAqNnEN7JUONbpMrehDVZNZv87MrvRhy9F9KrxkH2atyi8L6tXeNEjr
         BSYPFx28Uc1ohT3cyYkapAGPE4cE9WZ4CPsHAckr+hJPPyMXn5V05HvsiAGcdlWdcM2n
         qOGSdgFnb8fnMPdQTWUa5zFYBD6ySRWmHDpRR7yt0kt2nksal9k0wmy5qYD7FXVInpKK
         /62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=rIV44W601AjL+y5O2ueHx/bnmvVXtTcnlqhH/z6l3VA=;
        b=qZLbPY38BwNzj12PT0Mqg0Nnj6hYrvcOdI48+UiNl9WyLGw6Upq2cZITRYwjphRV1v
         Jvfw/Ii03OG8wYw45FQgFRweCQ8AveOPw7W8rFw5aOgQT1+pNcYgVO/SIwYtcGFOvlZT
         0XSUG9JlhV0eXB2W9k2Rd1vcj0mj9HnnoKEN7p3HsmQxbgT72v1OtdKsKKEPBaL8rHFM
         l40hsVhEeisPmv5C95/n6W3apxnQOv5mSfAY+6Yln35MRWB2sa05KUW5m4H2ilPLnbb1
         oiSAsTp7KO0xyJaLzvtxLQdQHrPNujeKHschdgsJLgSW2qfMLoQPv4VPZi8P2xc9ukPS
         QtPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23si4654004qtp.59.2020.02.16.23.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 23:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3b4r-0007pc-PL
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 02:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2x-0004J5-UB
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2v-0000Wk-S1
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:27 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3227 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xuyandong2@huawei.com>)
 id 1j3b2r-0000Mi-NK; Mon, 17 Feb 2020 02:42:22 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 06E233DDC85F7053ED44;
 Mon, 17 Feb 2020 15:42:18 +0800 (CST)
Received: from localhost (10.175.124.177) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 15:42:09 +0800
From: Xu Yandong <xuyandong2@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH RFC 11/16] hw/arm: move shared psci_enable and
 claim_edge_triggered_timers member to ArmMachine
Date: Mon, 17 Feb 2020 02:51:23 -0500
Message-ID: <1581925888-103620-12-git-send-email-xuyandong2@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
References: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.177]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: zhang.zhanghailiang@huawei.com, slp@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Xu Yandong <xuyandong2@huawei.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vSh08qSmJWoh

Move psci_enable member from VirtMachineState to ArmMachineState.
Move claim_edge_triggered_timers member from VirtMachineClass to
ArmMachineClass.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Signed-off-by: Xu Yandong <xuyandong2@huawei.com>
---
 hw/arm/virt-acpi-build.c |  7 ++++---
 hw/arm/virt.c            | 14 +++++++-------
 include/hw/arm/arm.h     |  2 ++
 include/hw/arm/virt.h    |  2 --
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 770c53f5d0..f2de897694 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -570,12 +570,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    ArmMachineClass *amc = ARM_MACHINE_GET_CLASS(ARM_MACHINE(vms));
     int gtdt_start = table_data->len;
     AcpiGenericTimerTable *gtdt;
     uint32_t irqflags;
 
-    if (vmc->claim_edge_triggered_timers) {
+    if (amc->claim_edge_triggered_timers) {
         irqflags = ACPI_GTDT_INTERRUPT_MODE_EDGE;
     } else {
         irqflags = ACPI_GTDT_INTERRUPT_MODE_LEVEL;
@@ -696,6 +696,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
                             VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
+    ArmMachineState *ams = ARM_MACHINE(vms);
     /* ACPI v5.1 */
     AcpiFadtData fadt = {
         .rev = 5,
@@ -704,7 +705,7 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
         .xdsdt_tbl_offset = &dsdt_tbl_offset,
     };
 
-    switch (vms->psci_conduit) {
+    switch (ams->psci_conduit) {
     case QEMU_PSCI_CONDUIT_DISABLED:
         fadt.arm_boot_arch = 0;
         break;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f971f49bcf..2c0dfb2695 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1576,11 +1576,11 @@ static void machvirt_init(MachineState *machine)
      * because if we're using KVM then we must use HVC).
      */
     if (vms->secure && firmware_loaded) {
-        vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+        ams->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
     } else if (vms->virt) {
-        vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
+        ams->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
-        vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
+        ams->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
     }
 
     /* The maximum number of CPUs depends on the GIC version, or on how
@@ -1641,8 +1641,8 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, false, "has_el2", NULL);
         }
 
-        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
-            object_property_set_int(cpuobj, vms->psci_conduit,
+        if (ams->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+            object_property_set_int(cpuobj, ams->psci_conduit,
                                     "psci-conduit", NULL);
 
             /* Secondary CPUs start in PSCI powered-down state */
@@ -2186,14 +2186,14 @@ DEFINE_VIRT_MACHINE(2, 9)
 
 static void virt_machine_2_8_options(MachineClass *mc)
 {
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+    ArmMachineClass *amc = ARM_MACHINE_CLASS(OBJECT_CLASS(mc));
 
     virt_machine_2_9_options(mc);
     compat_props_add(mc->compat_props, hw_compat_2_8, hw_compat_2_8_len);
     /* For 2.8 and earlier we falsely claimed in the DT that
      * our timers were edge-triggered, not level-triggered.
      */
-    vmc->claim_edge_triggered_timers = true;
+    amc->claim_edge_triggered_timers = true;
 }
 DEFINE_VIRT_MACHINE(2, 8)
 
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index 9ba51c4882..bb3680e583 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -86,6 +86,7 @@ typedef struct MemMapEntry {
 
 typedef struct {
     MachineClass parent;
+    bool claim_edge_triggered_timers;
 } ArmMachineClass;
 
 typedef struct {
@@ -97,6 +98,7 @@ typedef struct {
     void *fdt;
     int fdt_size;
     uint32_t gic_phandle;
+    int psci_conduit;
     DeviceState *gic;
 } ArmMachineState;
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 393afb7faf..ad94634038 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -50,7 +50,6 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
-    bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
     bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
@@ -73,7 +72,6 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
-    int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
-- 
2.18.1


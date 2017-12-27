Received: by 10.223.134.117 with SMTP id 50csp4068152wrw;
        Wed, 27 Dec 2017 00:16:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBovdiEt+8LtrZAc6ajr2c70nsTcG56/CgFw3DqzQbWBt20IvJnsjhtGYkGMz6VUykSnSMYgU
X-Received: by 10.37.97.205 with SMTP id v196mr12242063ybb.2.1514362608443;
        Wed, 27 Dec 2017 00:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514362608; cv=none;
        d=google.com; s=arc-20160816;
        b=RNr48t4Z8C9j9QaGSTvcomlNoGSW8NlVfIopXwaQUflsgyNhJlM0KA8Fyea7nv/y/9
         wCwucTuaOcAto4eJygjGlKqdWOAf/EGN451AdCstMtW7sKfP0lslivDe3ICu/T9AziD/
         2P3ExEa45EHWynf7nV7RWPsZtR+Z69YeP96ZlrjDpq5JcdxYClgd31aWIyMit1VpzARn
         pXhIZERJnJkRX5PEOSh5zjzkQ7y+rsvChyDNETpOZLbtwQ5XebvGN85Xq357b0g6iMO5
         /i/j1tx0Vh+51octU3ngXhLfuxoxvAGzuylMTD4lNAB1YqQ4kUJPZhrk71p5YZJAH/nQ
         Ot5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=Iz8z8JpayzLdl8FMgPHZiX0SJ32atQROH4BqMtS82eg=;
        b=KiyBLcO3rcWEt/11no8n5NvHod9XZngPIyDjsd8ypfwr/VrwIWy1dBnQfVPnyZ4LI6
         H8mCvJh2MAeXMrf41WtkeXLekvfD0ylnFYa8t6NXmuSLekJRcl6coiDYb2iWr2yRlTvr
         EMTP3NWV3K+0wCz4a6DXOhz8/Nx7TueJJaUvZaaxhZpwq+55L5DXaEGZPrcCDVQVPgEd
         IIYgMW43qPJeygvIgVbDPErgIHdfMTEoo/+a25D3t+Danuxfrdzv/o25wFdj8vm+Zla0
         yGv07dE+vn8cbHRkBY65EIKNLdlJAk2L4uCyCJD1gNMtfNSR1wjt8RCeQts0Fz2yU4S5
         g3Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u39si4129838ybd.449.2017.12.27.00.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Dec 2017 00:16:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eU6tL-00080F-Rz
	for alex.bennee@linaro.org; Wed, 27 Dec 2017 03:16:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eU6tD-000803-Pw
	for qemu-arm@nongnu.org; Wed, 27 Dec 2017 03:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eU6tA-0002lL-Gt
	for qemu-arm@nongnu.org; Wed, 27 Dec 2017 03:16:39 -0500
Received: from [45.249.212.35] (port=58131 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eU6tA-0002eQ-3w; Wed, 27 Dec 2017 03:16:36 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8F88C97AC2694;
	Wed, 27 Dec 2017 16:16:29 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 27 Dec 2017 16:16:24 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <lersek@redhat.com>
Date: Wed, 27 Dec 2017 16:16:12 +0800
Message-ID: <1514362572-1624-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2] Virt: ACPI: fix qemu assert due to
 re-assigned table data address
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
Cc: drjones@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ofxn33EiWVF5

From: Zhaoshenglong <zhaoshenglong@huawei.com>

acpi_data_push uses g_array_set_size to resize the memory size. If there
is no enough contiguous memory, the address will be changed. If we use
the old value, it will assert.
qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
Assertion `start_offset < file->blob->len' failed.`

This issue only happens in building SRAT table now but here we unify the
pattern for other tables as well to avoid possible issues in the future.

Signed-off-by: Zhaoshenglong <zhaoshenglong@huawei.com>
---
v2: update the commit message according to Andrew's comments
---
 hw/arm/virt-acpi-build.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d78ff6..5901142 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -453,6 +453,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiSerialPortConsoleRedirection *spcr;
     const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
     int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
+    int spcr_start = table_data->len;
 
     spcr = acpi_data_push(table_data, sizeof(*spcr));
 
@@ -476,8 +477,8 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
     spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
 
-    build_header(linker, table_data, (void *)spcr, "SPCR", sizeof(*spcr), 2,
-                 NULL, NULL);
+    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
+                 "SPCR", table_data->len - spcr_start, 2, NULL, NULL);
 }
 
 static void
@@ -512,8 +513,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         mem_base += numa_info[i].node_mem;
     }
 
-    build_header(linker, table_data, (void *)srat, "SRAT",
-                 table_data->len - srat_start, 3, NULL, NULL);
+    build_header(linker, table_data, (void *)(table_data->data + srat_start),
+                 "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
 
 static void
@@ -522,6 +523,7 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiTableMcfg *mcfg;
     const MemMapEntry *memmap = vms->memmap;
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
+    int mcfg_start = table_data->len;
 
     mcfg = acpi_data_push(table_data, len);
     mcfg->allocation[0].address = cpu_to_le64(memmap[VIRT_PCIE_ECAM].base);
@@ -532,7 +534,8 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
                                           / PCIE_MMCFG_SIZE_MIN) - 1;
 
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
+    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
+                 "MCFG", len, 1, NULL, NULL);
 }
 
 /* GTDT */
@@ -651,6 +654,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 static void build_fadt(GArray *table_data, BIOSLinker *linker,
                        VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
+    int fadt_start = table_data->len;
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
     unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
     uint16_t bootflags;
@@ -681,8 +685,8 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
         ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
         ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
 
-    build_header(linker, table_data,
-                 (void *)fadt, "FACP", sizeof(*fadt), 5, NULL, NULL);
+    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
+                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
 }
 
 /* DSDT */
-- 
2.0.4



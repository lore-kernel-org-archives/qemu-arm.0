Received: by 10.223.134.117 with SMTP id 50csp4974083wrw;
        Wed, 27 Dec 2017 17:15:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBouX43I9bswI3ROYvpls8iltJVlPRI1AGaCU/oE6KWMiW0uM6oAI01DDY/hlJfpsyqugyTpU
X-Received: by 10.37.234.18 with SMTP id p18mr1476791ybd.273.1514423730199;
        Wed, 27 Dec 2017 17:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514423730; cv=none;
        d=google.com; s=arc-20160816;
        b=UkfjuAeCHeVw6ASooyjg085+vivUNxPSb8uu8I315s97GR/aR9i2zdY4+vrYE/pm2s
         OjK1uWb2JHgO2XFwNjAA4y/xO2P+ObzNSbWSAhO+ISz8OabHvmpL5dusRKv9F0YFx3Gc
         szTkVhWlwOYqYwsd8DXcwhPqVHfjyrZAk/99sxE5HFXX9kZOO3F5l4rx1Smgj/AooOPG
         6PBdW/Sf5XxNPgWJBEoXkc09qbvpU+QVdE7qwsqakrYmPx/COlh6/8XPsltUnZCsevNp
         gEhGBm3/qwIEMY8WleOuQSAn0RWNpug0F+1jmt1IxxI+2qgmmsq72y1fMrQa1vVffSfo
         Sk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=CEFGzUTBXKg3/aiD/uOrtU6JqpkePvh/rnRVQmZHXSg=;
        b=pnwqjm/QYjqXyOJRx5fL62c0vTbBBv01pzwhVedJqtDQN9wQAXf70ZmkjcG793eyF4
         XmZVMW5Wl0uM0rw8ZEkh80U4otrjTMnx4/NNDgSbi7oaV6/NwFQeAHQvBLIT8yLq/TIk
         vbOM4pK2oZmjYyOwsIaGXrnwqmxsfJatcLAZuN11lhjdinYFlExDhko+2H44qhVk8r9C
         x1pH0u0/AakWeHzrI5GbUOyoj2sPW6znqw/RwvdM8eK8a0+O+azDUZrbJ/YJKTCts7aU
         jVKwgDB/q2omxCDxjJfLVhRtxZ+nYX2r4GEsg/fJn5B2FvQDjXbY2FAzweEFsWuTCdBg
         tLOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186si1713534ybz.151.2017.12.27.17.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Dec 2017 17:15:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUMnB-0000or-NJ
	for alex.bennee@linaro.org; Wed, 27 Dec 2017 20:15:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eUMn4-0000oM-4u
	for qemu-arm@nongnu.org; Wed, 27 Dec 2017 20:15:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eUMn0-00021V-HT
	for qemu-arm@nongnu.org; Wed, 27 Dec 2017 20:15:21 -0500
Received: from [45.249.212.32] (port=56244 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eUMmz-0001tJ-Rt; Wed, 27 Dec 2017 20:15:18 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8DBFD4C052C77;
	Thu, 28 Dec 2017 09:14:58 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.361.1; Thu, 28 Dec 2017 09:14:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <lersek@redhat.com>
Date: Thu, 28 Dec 2017 09:14:40 +0800
Message-ID: <1514423680-11132-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v3] Virt: ACPI: fix qemu assert due to
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
X-TUID: uOPmv5QEiiaz

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
v3: unify the pattern for MCFG
v2: update the commit message according to Andrew's comments
---
 hw/arm/virt-acpi-build.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d78ff6..f7fa795 100644
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
+                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
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



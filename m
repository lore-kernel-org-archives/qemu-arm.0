Received: by 10.223.159.74 with SMTP id f10csp1891855wrg;
        Thu, 21 Dec 2017 22:57:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBosNlUL2GxVQDNjBU6Kite70unNIrL/tlDeg4N+NG+GuxQWWcr3XSdRTZwOlBYg10rwhyY5h
X-Received: by 10.129.45.9 with SMTP id t9mr9580113ywt.62.1513925870640;
        Thu, 21 Dec 2017 22:57:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513925870; cv=none;
        d=google.com; s=arc-20160816;
        b=CYNH1fSOh1a84/6FrLhnVF34iAXEKW6iQWx+6d2SL8abk46tqhWqEcdaKdcKWvaIUj
         SqxY9J3EOloiiJq9FRd4tpno34V3AVLED73XI7UH+DotLRb/eKYRQBgUR7YeITkfSDKK
         RgtG/QT05etLzlJc4YbyMWsYN/WpZ99x6pkVCL1hlKppzy/8RaPlcnB7gLMwbalyzS3R
         gNda8riPuei9p/5y6r5e5xMS3ynTkaouEqrm4j0TwNKUTEWBMiU1G316qbcU7l+kQt7t
         tJ103cgVvi6iW/DGYMDWpu+uQL0KXYza/sXmvrx5pzvLLRlrbiWw7GGyYApIBM/PcwNY
         39hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=w/jHbdkbRiIXMdS6u4072LN01Pe49xO0Gut4+DdnwWo=;
        b=LEX36Z/BnMSTRCpBisMRbXCfSAUTxcc53eyhBfTZ+GbNsPgR0ZaCb+bcvhiIru5h5+
         EpoNP5K6EVMNo+1BqWpwZi2PNfyCELLuLmSIVNCkt215/6VNHzwEDSv3HHQT4b6othkF
         iDg2Mq83XNbS/iB/aMauYirPhXlX3AOmdSVWdnxAlvnnnO/IudNBkEi2Vi0Dp45FNvxZ
         AoXBTwtCaMyBoKLmKOWJnihSPptHLqDMurDA5UcVzINaSeUzKxkaflLcIDyM7sJAE2tb
         56xXe7YcGbkZllNFzaIZnx7/gfslUb9irDvuoknzq+YwLy2/UQ6ZsLcT6ZFsdaMm5sSK
         xXWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d193si1971448ybf.764.2017.12.21.22.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Dec 2017 22:57:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSHHC-0003UA-6D
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 01:57:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eSHGt-0003JJ-Gm
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 01:57:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eSHGq-0001Wv-Eo
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 01:57:31 -0500
Received: from [45.249.212.32] (port=33291 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eSHGp-0001T5-Gx; Fri, 22 Dec 2017 01:57:28 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7028CA5B8B320;
	Fri, 22 Dec 2017 14:57:08 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Fri, 22 Dec 2017 14:57:02 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <lersek@redhat.com>
Date: Fri, 22 Dec 2017 14:52:47 +0800
Message-ID: <1513925567-5184-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH] Virt: ACPI: fix qemu assert due to re-assigned
 table data address
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
X-TUID: JmLAUFg6JpDB

acpi_data_push uses g_array_set_size to resize the memory size. If there is no
enough contiguous memory, the address will be changed. If we use the old value,
it will assert.
qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
Assertion `start_offset < file->blob->len' failed.`

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
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



Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp754508wrg;
        Mon, 20 May 2019 16:37:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOomAI5mMwbAnczeMmiRPbVnUyMMnaM3A/aj5GxElOChzypVh190LiY/GQ7+Ud9I7h79ci
X-Received: by 2002:a17:906:cc92:: with SMTP id oq18mr35865198ejb.230.1558395454983;
        Mon, 20 May 2019 16:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558395454; cv=none;
        d=google.com; s=arc-20160816;
        b=WpbJDPdfrcGeQF2/iMtNPXT9EsHi630xERkvOC5TdJmKIaKaTd5/O2Sez+INC0GMrC
         l8RBDCSUZn4XZPoPgCCn4kAmoTCqfOEe7aeXVyfoJzCOIad95nuwYvG0xRQcGLusiSkZ
         aSv5eLVRBzZauLv+OVbrwJcF85RLbJT2sZSi02vFVcSIAJA/jA/kYelCNnc7IjG4Ioo7
         0Ju03MCLpqxcA36ic9X00adRlv5ccGD3u1LbzeCPC0FRK9LLg9kF/dOnCl+PgxerQDfk
         0/xIa88G5fz9fDppLUIbuClUVg51KsxNxp+zmGhOnUHxzIPL/BHChl5LfD6+7V2Y+F5s
         LxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=JwScjzIuEvZHFRKtzSIUr+rWV2ycP160i02QHDIAsNs=;
        b=lfnOw/BaOmzZ2NMHmuHAlwRQzh5Zed5bYHRBNPkVGNRuewo+8vfRHtFy+drHZ1JrsS
         biGAeu8B66xLsj0swjZ35tmHL1G1nVTu6+sk9h3NE9DjLIOtcbdeVY2LOzyczj5/oCxO
         zbNtZVVhS5nJPz87CZ4zoa+mjRN0pc/Oc53+EYx+whlEyqPRgT+i9ZULAb/kYuqdP07Q
         HCf5I+xJAknn+PLt/swn7ovWOcQlHKT1A/kF3j0hIRt1dnsW6X4c8WQDQ1DsYVkLtA2X
         GG+w7bnaKvlHGueTJchX0zg8cwj99sYKNUdLbSClHT5eSnEwP3VsQYDsRGSi3Obl5rVb
         JB2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si3851792eju.59.2019.05.20.16.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 16:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSrqX-0004gA-UI
	for alex.bennee@linaro.org; Mon, 20 May 2019 19:37:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrQw-0007Vq-Uv
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrQv-00089W-Nn
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:11:06 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSrQv-00089I-JE
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:11:05 -0400
Received: by mail-qt1-f194.google.com with SMTP id y22so18333482qtn.8
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 16:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=JwScjzIuEvZHFRKtzSIUr+rWV2ycP160i02QHDIAsNs=;
	b=cbWiSYv6PhjKMSd4/g9pDKVjZRJkUJ1OJjhiGu3fzkTkufBN01SV606C2yAoKgDDuI
	0TNwKE+ZEUrHFf7dnnJ97GQQPayJtBOTenuo6KzXdQEpAjFdPafDy6RSmsXcbVOLpAy0
	C+fD/vOPGf3s0R28PEkudK6fXck3qM645H2ZACdfg8m7jUWTihu43REq8MuwysQVBrhG
	Sgp+kABO82zURI3ZOa8NhJIUTDUiOuzTtD+2zREz8pyRiG2StCuRMD0oVxreVlIfiuNw
	lTm5fMzOTnrmR/urvdH7Q3Nx9/I2b2sUUMiffvC/jiH5mo43UxSIfyzuIfN81QPGFSQy
	K6fA==
X-Gm-Message-State: APjAAAWMXRhiQYFqSgbHv7CcsdeSPs5tJG9aVgGpazasfd4zGH1Ss+rJ
	GWYWJSbYj1shzPmS20s+BbccuA==
X-Received: by 2002:a0c:b6d8:: with SMTP id h24mr61434864qve.178.1558393865079;
	Mon, 20 May 2019 16:11:05 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	r143sm11076216qke.62.2019.05.20.16.11.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 16:11:04 -0700 (PDT)
Date: Mon, 20 May 2019 19:11:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190419003053.8260-5-richardw.yang@linux.intel.com>
References: <20190520231008.20140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190520231008.20140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.194
Subject: [Qemu-arm] [PULL v2 18/36] hw/arm/virt-acpi-build: pass
 AcpiMcfgInfo to build_mcfg()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6wOIMhIETNWr
Message-ID: <20190520231103.YjP7ma4ENGav5pgTOgGI36SGOZgtARkdK9wRJi8wNCw@z>

From: Wei Yang <richardw.yang@linux.intel.com>

To build MCFG, two information is necessary:

    * bus number
    * base address

Abstract these two information to AcpiMcfgInfo so that build_mcfg and
build_mcfg_q35 will have the same declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Message-Id: <20190419003053.8260-5-richardw.yang@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/pci.h    | 33 +++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c | 18 +++++++++++-------
 hw/i386/acpi-build.c     |  6 +-----
 3 files changed, 45 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/acpi/pci.h

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
new file mode 100644
index 0000000000..124af7d32a
--- /dev/null
+++ b/include/hw/acpi/pci.h
@@ -0,0 +1,33 @@
+/*
+ * Support for generating PCI related ACPI tables and passing them to Guests
+ *
+ * Copyright (C) 2006 Fabrice Bellard
+ * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
+ * Copyright (C) 2013-2019 Red Hat Inc
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Author: Wei Yang <richardw.yang@linux.intel.com>
+ * Author: Michael S. Tsirkin <mst@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_ACPI_PCI_H
+#define HW_ACPI_PCI_H
+
+typedef struct AcpiMcfgInfo {
+    uint64_t base;
+    uint32_t size;
+} AcpiMcfgInfo;
+
+#endif
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 12dbaf3846..e7c96d658e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -40,6 +40,7 @@
 #include "hw/loader.h"
 #include "hw/hw.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
@@ -546,21 +547,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 static void
-build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
-    const MemMapEntry *memmap = vms->memmap;
-    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
 
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number =
-        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
 
     build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
@@ -801,7 +799,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_gtdt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_mcfg(tables_blob, tables->linker, vms);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
+           .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9c1152c819..0d78d73894 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -59,6 +59,7 @@
 #include "hw/i386/x86-iommu.h"
 
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
 
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
@@ -87,11 +88,6 @@
 /* Default IOAPIC ID */
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
-typedef struct AcpiMcfgInfo {
-    uint64_t base;
-    uint32_t size;
-} AcpiMcfgInfo;
-
 typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
-- 
MST


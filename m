Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp574767wrg;
        Thu, 16 May 2019 05:30:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7lwS1GvRzSKnftH9K5nQuGiyj4/LN/MhKrcMoEPRq3ktVz64p/5uqeZSYSdtvHnNAc1u+
X-Received: by 2002:a17:906:e8c:: with SMTP id p12mr37634454ejf.18.1558009812669;
        Thu, 16 May 2019 05:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558009812; cv=none;
        d=google.com; s=arc-20160816;
        b=lvQfT3WYn2wZIu5hznPIytVckZlBNt3/SxCM2WBvnvG2PLFwOWmbGR2rUhmwMiDTHH
         b4yNuEdMYYft597RLH9TYp7iJ9gZMIX4QARWAPga7ACfLMwZLDLOTt8xa7esqsBFAlOB
         K1rCRrOG9xsARH215Uezrby//ZTJ1CGGGEAyT2rRNRgrnVk2t0KJpRCvoFRGWDqRPjqF
         wZaOjF5cWM1oiHxS20D/g3KcBl3X7Sg6nanNwAUXeUi9onsKjvUILCQxCLbvDHwhpnF+
         nmttdrBQjqBHBjBfBLBKMtibOi9duaJHommKBhGEHWJIrQ2OsAOnMWDXaEZRaJtHzJ8n
         fKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=82yaoR5Qd6z6aUjmHl7ZXeDTv2ZIDxYt8pX/8qpvvOk=;
        b=NO30RpHfeMEywStVOWtGGCyeJApSlLOaJ5VJXoWFl8lSV6+qIdhK8PqtBL+JWLzioM
         tyPndkeq4rzg8zAs8CarZkGJ6fB5vP40JEOD26xiRkjC/qGZv2ebcTfy/YngX82kRNdb
         sodt8lU2RoAV3TMWgB4KXhOl/OB16pw5cHfRc+umlcFHza52sX8uETx72Ogd/IcsYLQr
         CqbQLQ43WntAduKpXZi0sJe5B6nlTjGcmNW/Y06RWSEuYGU4H8CxzLT0lEpycW9pstpl
         cDpKdwIiWlP8nayMhJIuqZHKADMUimwl+9deaV5j1fX6D4BU7AePmwwFjg8QjgUeUIfY
         PpGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si446571eja.247.2019.05.16.05.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 05:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRFWV-0001hm-In
	for alex.bennee@linaro.org; Thu, 16 May 2019 08:30:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hRFMH-0000cu-1v
	for qemu-arm@nongnu.org; Thu, 16 May 2019 08:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hRFME-000226-1M
	for qemu-arm@nongnu.org; Thu, 16 May 2019 08:19:37 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hRFMD-00021g-UT
	for qemu-arm@nongnu.org; Thu, 16 May 2019 08:19:33 -0400
Received: by mail-qk1-f194.google.com with SMTP id g190so2062127qkf.8
	for <qemu-arm@nongnu.org>; Thu, 16 May 2019 05:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=82yaoR5Qd6z6aUjmHl7ZXeDTv2ZIDxYt8pX/8qpvvOk=;
	b=TQoqo/e852hbkqnXt4O4uNDVmXbdJnPBdEfWNET/WjvOP21xBjKf7rlECeWKEmSgYN
	ROZuPKyx6eGz2362nxq66osVGyXcbxIsKS8LZ85+hRnbPytToSNr35e/owFMThDyzFR7
	SyN7vTU62bjAvAZ+GOOjTbu22kf1wfSeKQbwlXouMeAK6IsFHewE90LK+2oNaZOCL1fc
	gS0NEhFNaMZTti/YkdLxOr04c/DmFQlK9DVzxppdSx5Ups+Ob+m8zafJ2dtuyAb+XoLS
	XbuNLxo+XXfQq3G8q5rifiDqA//una8OI3YJlq/qvQ3UanioPuwyOBOZ24nI3b5SlLTO
	CQgg==
X-Gm-Message-State: APjAAAUtwLjuTsfUOIdtxMC6e6+AM9ucZ0JJtGLlOtF135uF7elqdjX7
	NHx/Q0MTr3rxyWOB541y35X/tg==
X-Received: by 2002:a05:620a:13c6:: with SMTP id
	g6mr26179321qkl.153.1558009173486; 
	Thu, 16 May 2019 05:19:33 -0700 (PDT)
Received: from redhat.com ([185.54.206.10])
	by smtp.gmail.com with ESMTPSA id 22sm2546484qkl.4.2019.05.16.05.19.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 16 May 2019 05:19:32 -0700 (PDT)
Date: Thu, 16 May 2019 08:19:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190419003053.8260-5-richardw.yang@linux.intel.com>
References: <20190515121146.7248-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190515121146.7248-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.194
Subject: [Qemu-arm] [PULL 18/37] hw/arm/virt-acpi-build: pass AcpiMcfgInfo
 to build_mcfg()
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
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xi/XadeRmlRO
Message-ID: <20190516121929.ikHwseg5Gcw8n7Og6IXiTCMizb5hiyeo0kBg8EDZJ9A@z>

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
index 6df7bb3abc..dbd3a6cac2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -58,6 +58,7 @@
 #include "hw/i386/x86-iommu.h"
 
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
 
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
@@ -86,11 +87,6 @@
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


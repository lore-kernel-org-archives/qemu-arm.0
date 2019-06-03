Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp963107wrg;
        Mon, 3 Jun 2019 11:08:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysqs5TFyOQz3h3F9r9h5P+xHNpkaWbKIwBqo6BaDF9iF8aoqE8Iv70YW8PIFr11iFslsRP
X-Received: by 2002:aed:33e6:: with SMTP id v93mr24674102qtd.157.1559585322815;
        Mon, 03 Jun 2019 11:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559585322; cv=none;
        d=google.com; s=arc-20160816;
        b=hN2FLaiWHBg+N8Z730usXFsk8qXfgMlu3gYKh2e9mXAcf8TDrmI0z3CuNXm2Kg9yT+
         XFI0dxMOzAqlCr+eDhndr7sSpOFGZZI0qqgEqGCwxztRsl2Z3XEGRZcEFL1TCrONnD74
         rX7dKSOw+TFUc70RPJ3pICG1DAS8Z154kxu0yjT4hmkj445kdIdoM8yRwjCumBTDCahY
         K70NMDsVJOdSfnnvdaNKpgpgQxY3+XXpPM+PUKnJnPp/Hy0sJ1sb94uIuFLFXgyBXlMA
         ZrITaKxKGc3q3t3dV8cornCEyl02S4vHw30/nZKlHON/mQ9cPx3ihsJbpJ0hUIZt2/02
         Hzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=CSBnVJWUl++AOk+6oKojcpAmnlxqCg6oScq3C9+WfQI=;
        b=0B5nsuNc5pZE/WSa83BBoDtUJ6VP67Bz3gQmTZU1ruiC2BFlPc1VnTx8KX4Jxwot5f
         RQYLV1P0tSNGusPisegcIj4ClBqU5T56LF4ewrqMQVPjBcF0L9fvxj4YWE0eVxGM+dm4
         W3V12ITrZFzNF4RCUtMSfVhaKKtOrXQfHnMUpvPZksSDs0ueoyqUZ7Aue5gXAWwb2+KI
         EtiHEOkijlBFgNBkSBW7aKkcOxBVfmhOmstxj0TMh826iEHILMjL/0NOvqCL4xrdVw1J
         mWuR1CDR28Sjv4kZdnkwH/GgfE6W6zIMKje8xJAiwQ0NixfMG/+W8M2sygD+xUY2DOY4
         UYPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si2971152qtj.345.2019.06.03.11.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jun 2019 11:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hXrNy-0001h6-1I
	for alex.bennee@linaro.org; Mon, 03 Jun 2019 14:08:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hXrNj-0001cy-78
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 14:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hXrNh-0007VD-MS
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 14:08:27 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37863)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hXrNh-0007TT-H5
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 14:08:25 -0400
Received: by mail-qt1-f195.google.com with SMTP id y57so10540370qtk.4
	for <qemu-arm@nongnu.org>; Mon, 03 Jun 2019 11:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=CSBnVJWUl++AOk+6oKojcpAmnlxqCg6oScq3C9+WfQI=;
	b=VvbYPcP0UmLyfzYzN9b/aJJDlYahZ76Ni+4vsJWn1Yoab84NXxk+aFlI7jIc75HH8Q
	soe0XbsgQDkoCVYSruNnAItdCcFg8zH9tLpW4MGrRhnj40w7JtYYWKvNs40td9AOIAYb
	vzNtWJA7zmfC82LtHVywqYUeUJuPv+VU1vFUBV0NfsEFUj/5umKhtAu59/c1W0tQhevD
	HVu/DaZH5EBVAlhMhJ50m+s6ENOk9D1HspagaqZsfQ+G1p80OlE6ToXX/mHi+INXHJLA
	bYGJhj3PrsL3JG6mBsLzhnjn1voYpF2MaZzRfHv5vdAacap/2wy9HUxXGA7JnzKTbrSk
	g8Bg==
X-Gm-Message-State: APjAAAW3NBiLXYKZXSo7cIxUr4Gv65DCb9/8ZUSuadhbeXZDiGX2Ljgb
	jFj4p3tR2nmSjo5bvlyFNBf6JA==
X-Received: by 2002:ad4:43c9:: with SMTP id o9mr16219642qvs.113.1559585304423; 
	Mon, 03 Jun 2019 11:08:24 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id m6sm7760276qte.17.2019.06.03.11.08.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 11:08:23 -0700 (PDT)
Date: Mon, 3 Jun 2019 14:08:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190521062836.6541-2-richardw.yang@linux.intel.com>
References: <20190603180807.16140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603180807.16140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.195
Subject: [Qemu-arm] [PULL v2 01/14] hw/acpi: Consolidate build_mcfg to pci.c
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
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9DJaH5CE4R2e
Message-ID: <20190603180822.oqmm5NFojYYXK9D6z73Zr3TP024NhruGwBRpO2CJ-nI@z>

From: Wei Yang <richardw.yang@linux.intel.com>

Now we have two identical build_mcfg functions.

Consolidate them in acpi/pci.c.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

v4:
  * ACPI_PCI depends on both ACPI and PCI
  * rebase on latest master, adjust arm Kconfig
v3:
  * adjust changelog based on Igor's suggestion
Message-Id: <20190521062836.6541-2-richardw.yang@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 default-configs/i386-softmmu.mak |  1 +
 include/hw/acpi/pci.h            |  1 +
 hw/acpi/pci.c                    | 46 ++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c         | 17 ------------
 hw/i386/acpi-build.c             | 18 +------------
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/arm/Kconfig                   |  1 +
 8 files changed, 55 insertions(+), 34 deletions(-)
 create mode 100644 hw/acpi/pci.c

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index ba3fb3ff50..cd5ea391e8 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -25,3 +25,4 @@
 CONFIG_ISAPC=y
 CONFIG_I440FX=y
 CONFIG_Q35=y
+CONFIG_ACPI_PCI=y
diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 124af7d32a..8bbd32cf45 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -30,4 +30,5 @@ typedef struct AcpiMcfgInfo {
     uint32_t size;
 } AcpiMcfgInfo;
 
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
 #endif
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
new file mode 100644
index 0000000000..fa0fa30bb9
--- /dev/null
+++ b/hw/acpi/pci.c
@@ -0,0 +1,46 @@
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
+
+#include "qemu/osdep.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
+#include "hw/pci/pcie_host.h"
+
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
+{
+    AcpiTableMcfg *mcfg;
+    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
+
+    mcfg = acpi_data_push(table_data, len);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
+
+    /* Only a single allocation so no need to play with segments */
+    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
+    mcfg->allocation[0].start_bus_number = 0;
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
+
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
+}
+
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e7c96d658e..4a64f9985c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -546,23 +546,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
 
-static void
-build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
-{
-    AcpiTableMcfg *mcfg;
-    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
-
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->base);
-
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
-
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
-}
-
 /* GTDT */
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0d78d73894..85dc1640bc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2405,22 +2405,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                  table_data->len - srat_start, 1, NULL, NULL);
 }
 
-static void
-build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
-{
-    AcpiTableMcfg *mcfg;
-    int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
-
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->base);
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
-
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
-}
-
 /*
  * VT-d spec 8.1 DMA Remapping Reporting Structure
  * (version Oct. 2014 or later)
@@ -2690,7 +2674,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
-        build_mcfg_q35(tables_blob, tables->linker, &mcfg);
+        build_mcfg(tables_blob, tables->linker, &mcfg);
     }
     if (x86_iommu_get_default()) {
         IommuType IOMMUType = x86_iommu_get_type();
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index eca3beed75..7c59cf900b 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -23,6 +23,10 @@ config ACPI_NVDIMM
     bool
     depends on ACPI
 
+config ACPI_PCI
+    bool
+    depends on ACPI && PCI
+
 config ACPI_VMGENID
     bool
     default y
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 2d46e3789a..661a9b8c2f 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -11,6 +11,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 common-obj-y += acpi_interface.o
 common-obj-y += bios-linker-loader.o
 common-obj-y += aml-build.o
+common-obj-$(CONFIG_ACPI_PCI) += pci.o
 common-obj-$(CONFIG_TPM) += tpm.o
 
 common-obj-$(CONFIG_IPMI) += ipmi.o
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index af8cffde9c..9aced9d54d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM_VIRT
     select PLATFORM_BUS
     select SMBIOS
     select VIRTIO_MMIO
+    select ACPI_PCI
 
 config CHEETAH
     bool
-- 
MST


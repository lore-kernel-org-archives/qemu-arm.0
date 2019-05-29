Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp9541552pjq;
        Wed, 29 May 2019 09:37:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwg5shls7m4+hXqrrwmFDIwYdivvxv91F3X88+2HqztP1vcIdN109HKZymRihiNw6gxmklD
X-Received: by 2002:ac8:32e9:: with SMTP id a38mr11389596qtb.245.1559147858742;
        Wed, 29 May 2019 09:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559147858; cv=none;
        d=google.com; s=arc-20160816;
        b=vwHe5dEC7+9xxr27INJSpOm0JovoIcwWDIE7wWZ5NziVGDUO9E9ZCUdOTitnVgS/tR
         aAvMf4xdUJfGwMQmYwi5b1HFEdkzDsD4+19b/R3qoL86MUkb0y/AwcT8BZnlJnbJDtl/
         dNw3AdT+GlOLkNRAcRui1SD06Q5WYdX3RvtUjtTf/z4uWJnVnAcBWQqOxL2YYRqoTLq3
         Pqj1xIHyZp1X5Xt/vmPlfTHsneIcIryujZ4iLDjXWUWi/SBNlWIwZpIqSGuV+KV/fCfK
         XJvptLLXIdBZSD8By/mKpz330Vwkz/JhqlPP0Q1c+RVgeOz/84DNQAF797FyRNVHAULY
         K3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=CSBnVJWUl++AOk+6oKojcpAmnlxqCg6oScq3C9+WfQI=;
        b=z3alXWDzNLtYWr5n2ZxBYFM3/+qMcxaYR9ZtF7JQmL0PGv+beYPeYFGwEvv/GlIm6v
         SVXwefKWsTj91zvVkCiO7pKWF2taE/cyI0UVFh+yHcRw0EDdfzIfhBWUIANUAsLyZ605
         I65S47CMre77OU5o7b+1Ihs0t0kNUa4DynK1/3laTKD6SLkxaQWHgWRcVglF9SpYgk+q
         a3ZJqsq3lgmdNxK/aWA4saI/UzMM1EJbXwaQW3tCtaVrAx1Lh7zjRi85F0nSB4N6SOvc
         Cc/mkBswCqfT1zGxsc5+OYU7UPyfVVIfCHdtjRHqgY6E60L8O/VVJFRl5ERWC0NsKltd
         jBWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si8826509qvf.77.2019.05.29.09.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 May 2019 09:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hW1a6-0008QP-61
	for alex.bennee@linaro.org; Wed, 29 May 2019 12:37:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hW1Zq-0008ON-0q
	for qemu-arm@nongnu.org; Wed, 29 May 2019 12:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hW1Zo-0002fB-GA
	for qemu-arm@nongnu.org; Wed, 29 May 2019 12:37:21 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hW1Zo-0002ar-BZ
	for qemu-arm@nongnu.org; Wed, 29 May 2019 12:37:20 -0400
Received: by mail-qt1-f196.google.com with SMTP id l3so3389852qtj.5
	for <qemu-arm@nongnu.org>; Wed, 29 May 2019 09:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=CSBnVJWUl++AOk+6oKojcpAmnlxqCg6oScq3C9+WfQI=;
	b=udogNKHCBBrjwFvmaRFEEHcG6cK5kfg9NkQzpT+NgWYqJXv1Zr8MY+KgbEwShgey9a
	X3frhoNsw3n2JT0KLIS/op++Bz49u+N1vbWMe4Kcbx7IPzZRUsW5i0WvQIDpMs2kPSDF
	94PIAFVMu/rIncKfZfKxaLUSiuF3yi0MyXz/3sF7IZ63zZvA3spaS0mwk0bx9kq4bHTt
	HHxaYKWmUnO668/ygrMVhRod1Rtpo8ABE3Wu/bY9U3mQeADbd82jCZ3G5dYsktdXgBIz
	BrJkh7HkTMCPMTwIXJO6fdSY36/Y3qsnzKIuNAZ0U7/wvPjX1jigCTmldpdTLHODAlwT
	Pl/g==
X-Gm-Message-State: APjAAAXMwP/DTmIvBW/FrXImpC4xR//zsw2hP5HqKExeSkhigrHqXQm9
	7S74Oyba3xYr9eAr46dPqCkrmw==
X-Received: by 2002:a0c:e6c7:: with SMTP id l7mr38160005qvn.237.1559147834182; 
	Wed, 29 May 2019 09:37:14 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id m40sm210843qtm.2.2019.05.29.09.37.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 09:37:13 -0700 (PDT)
Date: Wed, 29 May 2019 12:37:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190521062836.6541-2-richardw.yang@linux.intel.com>
References: <20190529163604.18560-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529163604.18560-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.196
Subject: [Qemu-arm] [PULL 02/10] hw/acpi: Consolidate build_mcfg to pci.c
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
X-TUID: 82IbdqFFdMnc
Message-ID: <20190529163711.lDnjnRQNoKMkMcF4ZXrPSHAQuoY_Iln6qHX_rPqWbNc@z>

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


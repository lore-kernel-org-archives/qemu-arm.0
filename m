Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2039482wro;
        Sun, 4 Nov 2018 17:57:31 -0800 (PST)
X-Google-Smtp-Source: AJdET5fIQhR2H/xw0uOeQwDvaCenty/PgvmFO+UzpHJw54u4A57KxG6WSXjGI8G3LwEbbnFFyrBT
X-Received: by 2002:a37:a053:: with SMTP id j80mr18936291qke.356.1541383050983;
        Sun, 04 Nov 2018 17:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541383050; cv=none;
        d=google.com; s=arc-20160816;
        b=WmFitTPcjmeuE4DsCuu3oIlw8WHc+nrUm7ZdJDVnjKEHyRaOUNQz+zX+zWh1ai8zfT
         iPpkYcJfX/A/RY+PiVIuC5z0tDwf7aoV/wfCONYwPMrXqjL73kY07Mh03hGwgp6kSTf0
         UES7CqdwppawqVYJpqvQukPMx8s+d5KHbGeYZG9IpVsm9QnP11Zg2iU5i/ZGxCkSX3CK
         kJg+IIYpIfU2wydVrrWoGxxEJy+oQHZEVWRvAiqZeQI+5zlLeA21riMGAc+ah++XkkjQ
         V623rEOTZUNEkHOlM9+vpZoA5yN0S/+gU2E4HYUSxSakSChb+ORmIyMD2RQ6gpgq7u4s
         AlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oFV4m1Xg2BFcZ0jkK5HU0z99aQtyI6c3naxyOReJ0JU=;
        b=nVuUA/mlBmwtRQigA8mxLew4izlxNO5bYNzMUPz8sduxjNIHyEc7Vg/o/cLs16dZ89
         HPZZ8Fs591enRexNw2KFxd4l/NUukN0kXmHkwwQDYQYmGsFtapUC9GIeCMmOzLOaxUgD
         ryM+ZMGQof3hmeKbY0eohzXmjtO7fqOUCOmInQziBBuy/fZ7/R6Rh1tM52EOo5oefST1
         KsUJ99/fkH3Psh2WobFgjDyfAIdZIDFhZO8msgcG3MiRYxMmPuzqD6FGK/CncGoKHrY2
         VT+BUi0KKFxfbuL9/aXogJk3J9pOsgXzQ8QfUOqZbJLyxpCAx3DclZT1thV+vzV03INq
         xFcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si6010541qtd.217.2018.11.04.17.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:57:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU8w-0005XQ-Cd
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:57:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvc-0000rZ-H3
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvb-0003mG-4Q
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:44 -0500
Received: from mga18.intel.com ([134.134.136.126]:8029)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTvW-0003Xz-P7; Sun, 04 Nov 2018 20:43:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074522"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:25 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:44 +0100
Message-Id: <20181105014047.26447-22-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 21/24] hw: i386: Implement the ACPI builder
 interface for PC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r8b6IN0J+Bxs

All PC machine type derivatives will use the same ACPI table build
methods. But with that change in place, any new x86 machine type will be
able to re-use the acpi-build API and customize part of it by defining
its own ACPI table build methods.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/i386/acpi-build.c | 14 +++++++++-----
 hw/i386/pc.c         | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4b1d8fbe3f..93d89b96f1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -34,6 +34,7 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/builder.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/loader.h"
 #include "hw/isa/isa.h"
@@ -1683,6 +1684,7 @@ void acpi_build(AcpiBuildTables *tables,
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    AcpiBuilder *ab = ACPI_BUILDER(machine);
 
     acpi_get_pm_info(&pm);
     acpi_get_misc_info(&misc);
@@ -1732,7 +1734,8 @@ void acpi_build(AcpiBuildTables *tables,
     aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
-    build_madt(tables_blob, tables->linker, machine, acpi_conf);
+    acpi_builder_madt(ab, tables_blob, tables->linker,
+                      machine, acpi_conf);
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
@@ -1756,15 +1759,16 @@ void acpi_build(AcpiBuildTables *tables,
     }
     if (acpi_conf->numa_nodes) {
         acpi_add_table(table_offsets, tables_blob);
-        build_srat(tables_blob, tables->linker, machine, acpi_conf);
+        acpi_builder_srat(ab, tables_blob, tables->linker,
+                          machine, acpi_conf);
         if (have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
-            build_slit(tables_blob, tables->linker);
+            acpi_builder_slit(ab, tables_blob, tables->linker);
         }
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
-        build_mcfg(tables_blob, tables->linker, &mcfg);
+        acpi_builder_mcfg(ab, tables_blob, tables->linker, &mcfg);
     }
     if (x86_iommu_get_default()) {
         IommuType IOMMUType = x86_iommu_get_type();
@@ -1795,7 +1799,7 @@ void acpi_build(AcpiBuildTables *tables,
                slic_oem.id, slic_oem.table_id);
 
     /* RSDP is in FSEG memory, so allocate it separately */
-    build_rsdp_rsdt(tables->rsdp, tables->linker, rsdt);
+    acpi_builder_rsdp(ab, tables->rsdp, tables->linker, rsdt);
 
     /* We'll expose it all to Guest so we want to reduce
      * chance of size changes.
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c9ffc8cff6..53a3036066 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -64,6 +64,7 @@
 #include "qemu/option.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
+#include "hw/acpi/builder.h"
 #include "hw/boards.h"
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
@@ -75,6 +76,7 @@
 #include "hw/nmi.h"
 #include "hw/i386/intel_iommu.h"
 #include "hw/net/ne2000-isa.h"
+#include "hw/i386/acpi.h"
 
 /* debug PC/ISA interrupts */
 //#define DEBUG_IRQ
@@ -2404,12 +2406,20 @@ static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
     }
 }
 
+static AcpiConfiguration *pc_acpi_configuration(AcpiBuilder *builder)
+{
+    PCMachineState *pcms = PC_MACHINE(builder);
+
+    return &pcms->acpi_configuration;
+}
+
 static void pc_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     PCMachineClass *pcmc = PC_MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
     NMIClass *nc = NMI_CLASS(oc);
+    AcpiBuilderMethods *abm = ACPI_BUILDER_METHODS(oc);
 
     pcmc->pci_enabled = true;
     pcmc->has_acpi_build = true;
@@ -2444,6 +2454,14 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     nc->nmi_monitor_handler = x86_nmi;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
 
+    /* ACPI building methods */
+    abm->madt = build_madt;
+    abm->rsdp = build_rsdp_rsdt;
+    abm->mcfg = build_mcfg;
+    abm->srat = build_srat;
+    abm->slit = build_slit;
+    abm->configuration = pc_acpi_configuration;
+
     object_class_property_add(oc, MEMORY_DEVICE_REGION_SIZE, "int",
         pc_machine_get_device_memory_region_size, NULL,
         NULL, NULL, &error_abort);
@@ -2495,6 +2513,7 @@ static const TypeInfo pc_machine_info = {
     .interfaces = (InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
          { TYPE_NMI },
+         { TYPE_ACPI_BUILDER },
          { }
     },
 };
-- 
2.19.1


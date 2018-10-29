Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4484638wro;
        Mon, 29 Oct 2018 10:13:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5flNaWQHLBGw/A9ygeiIfemu59G9LoJWvla3gWESRgThRW/WX85WQZlQcoKTO0stsO+BYE1
X-Received: by 2002:ac8:5205:: with SMTP id r5-v6mr14022341qtn.201.1540833209118;
        Mon, 29 Oct 2018 10:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540833209; cv=none;
        d=google.com; s=arc-20160816;
        b=umuTlOgYTjYGlXM5m+4xSY49lhsi3CKrr7Iko7Pz7hT1UJnPdbx2idriY6bSwnQIiY
         yeM0iWRE8ybEz2g5uDqWZnKD6q79tK11GSdyhdMiTd/aFob/V1OOI5EMHUnwj0Rz6GZt
         tIxTFMAnC2SWBGnjepShwgegqydEAh7J4Szuhvl+5KCAoeCD5GIL1qe1KucNpQwwcPjj
         KcbYR0dBV+h0g3rQpVh1RVo9DqaV61JVbtEJWdOXScGeg6QHDg3TEauoL/3YyRMdfs8A
         rnY8rAeQUsqPE2b8SQVY9rT02o8OQl/VSZIJiuS2E1czRz2Vm8aDomV/rMnG7deMtM5+
         wOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=yFShK7iFwMrxifllrkJiVsqmcUdLmmi5KimMYf6f/g0=;
        b=EgdwYBEv35hzPIqJ+3zDaHYJrzmLLJR0CFuzX16fJTpLMbMTFFWQ8nL2AZTSOsTsx1
         IwKhk/lkL2sxW6A/UzLxeN0I1kN+p4Z45ND6H8frs6p0t/Vj9GAl0isHU+pgBn0O5rTy
         9rNIv6fGRonao8p5corqMnbxSqyDCG+KRmy1TOf5LcMZQsd1Z3pTJvjlM57OEhwjp0Jt
         MVr0INjeSGpjwVnGgHDpZMEPMlLhOM0tw8FpUsbyUxjBlid7WchDIFTop8o62xZidhhZ
         o2rmYt9D+qGkHd31TnchPDB5GBFcl1y7iV7CMvsBEnt7svDKQFzWzCU/3Yqbf/HLRShk
         pvUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si8100308qke.19.2018.10.29.10.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 10:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHB6W-000248-GA
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 13:13:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAx3-00026b-LH
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAwx-0004eP-4E
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:15755)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gHAwb-0003rZ-M0; Mon, 29 Oct 2018 13:03:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2018 10:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,441,1534834800"; d="scan'208";a="276598928"
Received: from mjadwisz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.7.64])
	by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2018 10:03:08 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 18:01:47 +0100
Message-Id: <20181029170159.3801-8-sameo@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181029170159.3801-1-sameo@linux.intel.com>
References: <20181029170159.3801-1-sameo@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH v3 07/19] hw: acpi: Factorize _OSC AML across
 architectures
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1s6Ccr/P4fNL

From: Yang Zhong <yang.zhong@intel.com>

The _OSC AML table is almost identical between the i386 Q35 and arm virt
machine types. We can make it slightly more generic and share it across
all PCIe architectures.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/acpi/aml-build.c         | 84 +++++++++++++++++++------------------
 hw/arm/virt-acpi-build.c    | 45 ++------------------
 hw/i386/acpi-build.c        |  6 ++-
 include/hw/acpi/acpi-defs.h | 14 +++++++
 include/hw/acpi/aml-build.h |  2 +-
 5 files changed, 66 insertions(+), 85 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 43aec8dacd..52ac39acdb 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1869,51 +1869,55 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
     return crs;
 }
 
-Aml *build_osc_method(void)
+/*
+ * ctrl_mask is the _OSC capabilities buffer control field mask.
+ */
+Aml *build_osc_method(uint32_t ctrl_mask)
 {
-    Aml *if_ctx;
-    Aml *if_ctx2;
-    Aml *else_ctx;
-    Aml *method;
-    Aml *a_cwd1 = aml_name("CDW1");
-    Aml *a_ctrl = aml_local(0);
+    Aml *ifctx, *ifctx1, *elsectx, *method, *UUID;
 
     method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
-    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
-
-    if_ctx = aml_if(aml_equal(
-        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-
-    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
-
-    /*
-     * Always allow native PME, AER (no dependencies)
-     * Allow SHPC (PCI bridges can have SHPC controller)
+    aml_append(method,
+        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    /* PCI Firmware Specification 3.0
+     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
+     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
+     * identified by the Universal Unique IDentifier (UUID)
+     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
      */
-    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
-    /* Unknown revision */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
-    /* Capabilities bits were masked */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    /* Update DWORD3 in the buffer */
-    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
-    aml_append(method, if_ctx);
-
-    else_ctx = aml_else();
-    /* Unrecognized UUID */
-    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
-    aml_append(method, else_ctx);
+    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
+    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
+    aml_append(ifctx,
+        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(ifctx,
+        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
+    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
+    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"),
+                                        aml_int(ctrl_mask), NULL),
+                                aml_name("CTRL")));
+
+    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
+    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
+                                 aml_name("CDW1")));
+    aml_append(ifctx, ifctx1);
+
+    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
+    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
+                                 aml_name("CDW1")));
+    aml_append(ifctx, ifctx1);
+
+    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
+    aml_append(ifctx, aml_return(aml_arg(3)));
+    aml_append(method, ifctx);
+
+    elsectx = aml_else();
+    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
+                                  aml_name("CDW1")));
+    aml_append(elsectx, aml_return(aml_arg(3)));
+    aml_append(method, elsectx);
 
-    aml_append(method, aml_return(aml_arg(3)));
     return method;
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6822ee4eaa..f9a60907f1 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -154,7 +154,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, bool use_highmem, bool highmem_ecam)
 {
     int ecam_id = VIRT_ECAM_ID(highmem_ecam);
-    Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
+    Aml *method, *crs, *ifctx, *UUID, *ifctx1, *buf;
     int i, bus_no;
     hwaddr base_mmio = memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = memmap[VIRT_PCIE_MMIO].size;
@@ -248,47 +248,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     /* Declare an _OSC (OS Control Handoff) method */
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
     aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
-    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
-    aml_append(method,
-        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
-
-    /* PCI Firmware Specification 3.0
-     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
-     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
-     * identified by the Universal Unique IDentifier (UUID)
-     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
-     */
-    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
-    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
-    aml_append(ifctx,
-        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(ifctx,
-        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
-    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
-                                aml_name("CTRL")));
-
-    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
-                                 aml_name("CDW1")));
-    aml_append(ifctx, ifctx1);
-
-    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
-                                 aml_name("CDW1")));
-    aml_append(ifctx, ifctx1);
-
-    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
-    aml_append(ifctx, aml_return(aml_arg(3)));
-    aml_append(method, ifctx);
-
-    elsectx = aml_else();
-    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
-                                  aml_name("CDW1")));
-    aml_append(elsectx, aml_return(aml_arg(3)));
-    aml_append(method, elsectx);
-    aml_append(dev, method);
+    aml_append(dev, build_osc_method(ACPI_OSC_CTRL_PCI_ALL &
+                                     ~ACPI_OSC_CTRL_SHPC_NATIVE_HP));
 
     method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3ab68fd24d..fdfd6f4ba2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1337,7 +1337,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-        aml_append(dev, build_osc_method());
+        aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
+        aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
+        aml_append(dev, build_osc_method(ACPI_OSC_CTRL_PCI_ALL));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1402,7 +1404,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             if (pci_bus_is_express(bus)) {
-                aml_append(dev, build_osc_method());
+                aml_append(dev, build_osc_method(ACPI_OSC_CTRL_PCI_ALL));
             }
 
             if (numa_node != NUMA_NODE_UNASSIGNED) {
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023968..6e1726e0a2 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -652,4 +652,18 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+/* _OSC */
+
+#define ACPI_OSC_CTRL_PCIE_NATIVE_HP (1 << 0)
+#define ACPI_OSC_CTRL_SHPC_NATIVE_HP (1 << 1)
+#define ACPI_OSC_CTRL_PCIE_PM_EVT    (1 << 2)
+#define ACPI_OSC_CTRL_PCIE_AER       (1 << 3)
+#define ACPI_OSC_CTRL_PCIE_CAP_CTRL  (1 << 4)
+#define ACPI_OSC_CTRL_PCI_ALL \
+    (ACPI_OSC_CTRL_PCIE_NATIVE_HP |             \
+     ACPI_OSC_CTRL_SHPC_NATIVE_HP |             \
+     ACPI_OSC_CTRL_PCIE_PM_EVT |                \
+     ACPI_OSC_CTRL_PCIE_AER |                   \
+     ACPI_OSC_CTRL_PCIE_CAP_CTRL)
+
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index cd744e9472..40b307c97d 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -405,7 +405,7 @@ void acpi_align_size(GArray *blob, unsigned align);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
-Aml *build_osc_method(void);
+Aml *build_osc_method(uint32_t value);
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
 Aml *build_gsi_link_dev(const char *name, uint8_t uid, uint8_t gsi);
 Aml *build_prt(bool is_pci0_prt);
-- 
2.17.2


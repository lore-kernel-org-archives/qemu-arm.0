Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp628930wro;
        Thu, 1 Nov 2018 03:33:47 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eJ6hYgbikPLzjoLXu05VPe4UPmywTUox9UVvGEWW3gMyccWo5PjQHSof2d6PFHAkl25Qao
X-Received: by 2002:a0c:8ae3:: with SMTP id 32mr6075982qvw.27.1541068427249;
        Thu, 01 Nov 2018 03:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541068427; cv=none;
        d=google.com; s=arc-20160816;
        b=z2qqie4I2Ts3wVISFEOqJniWs5sV3PWF4VWouLZDqOqCgIWXv4GI2qo+zIOk/yzBDC
         fyAaF/gWcTxJPM04EsfC2TfcJW6mTEgs+nD2Y57pfluM6ND5POT3bvjYpJsFt3ib1IXx
         +MumFYEfkxxTqdwb8+lxLhBMohSGTKU0c1ZGR4CYz3JNg1W8TwBKI6FRdJOB8DjzmpDU
         mOmuS7lVE+oYVOHNLtZGk9zYYUNTHsqV/gyL4u1DMtOPa0uq2WDasiO0GJIwaOcHxxmd
         Skl/OOf3oCwJ0X8V3n6qjOpjyTyx6JuPqMUSTO0DvzTVr/UaWSbNhQFR5hgLWsDu30LE
         Nfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=r/7IYCJKKDyXzArpurMGrfrZpLWdl4y7qd63KIYPeSE=;
        b=HVJ8uFRFTkxfBxyNCXhOWJMKHqGOSNROd17i6Bmk8E/3VI0sCvHgmXdu6AiGwmJnjo
         UXkFs3fobqaccIt171sprdvaLaqneToK/l6RHjYv4+X+EVACL1NqTjEJjASnYweFwqmQ
         h5A71lN6i5OQhSIdj5TL3k0afHV+UPbATyCWEDQJIyQmZU26cfg3jK/mMVNuAq2tXM+p
         34GX7/wWgKZI0GxJzb7lbPND1c5KTUs+dMBhgWh7CUhleTXxM1bj3oUXIUCX9eRGCZPY
         KoRAClGMOeOFRlBcWJ3xdPR0opJn1JaLsX3g7H5ZGlmlcG99bK4CYL29ybkrPtS4utBP
         NkHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13-v6si2494078qth.310.2018.11.01.03.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 03:33:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:41123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIAIM-0000RQ-Ky
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 06:33:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIA9g-0004sc-FE
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 06:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIA9Z-0003AE-4x
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 06:24:46 -0400
Received: from mga17.intel.com ([192.55.52.151]:61528)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gIA9Y-00032x-Le; Thu, 01 Nov 2018 06:24:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2018 03:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,451,1534834800"; d="scan'208";a="87785987"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.9.87])
	by orsmga006.jf.intel.com with ESMTP; 01 Nov 2018 03:24:17 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Nov 2018 11:22:47 +0100
Message-Id: <20181101102303.16439-8-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181101102303.16439-1-sameo@linux.intel.com>
References: <20181101102303.16439-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-arm] [PATCH v4 07/23] hw: acpi: Factorize _OSC AML across
 architectures
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1sFeah6miVC4

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
index 996d8a11dc..bd147a6bd2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1335,7 +1335,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-        aml_append(dev, build_osc_method());
+        aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
+        aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
+        aml_append(dev, build_osc_method(ACPI_OSC_CTRL_PCI_ALL));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1400,7 +1402,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
index 4f678c45a5..c27c0935ae 100644
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
2.19.1


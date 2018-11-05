Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2031446wro;
        Sun, 4 Nov 2018 17:45:13 -0800 (PST)
X-Google-Smtp-Source: AJdET5ezz7nSD2DNrzaKwgwhDv9QX4pZg1TRtAvD6WVggfzahHl0rXjkW1E9JR+zDmqBrlkSiL/q
X-Received: by 2002:ac8:6892:: with SMTP id m18mr18816278qtq.157.1541382313837;
        Sun, 04 Nov 2018 17:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382313; cv=none;
        d=google.com; s=arc-20160816;
        b=fuoaI1puPWCr7KfI/QDziiyOy92hihxSxfaLfc/UQSnUDKjzxdCTwnwKeRlRzZAayi
         9dVd+CZKdZsAqUkg9FgHQAxVJGFavLnxAuzChRIDHKj8FEtP5u/79lZf2ZC83tFR8RKA
         YOwOUYHJWAjNhv4MNVpHN9smhn1dowYupZIDMYHlnS5FqoM5mvw/lBfTrGHYEwiZCy9o
         d8lYK1Az1PbV4YIgI0VHIDnijnt1SF12MB88XN10PoGAVhU8lIZrRz4ZwfdY3q7E35U1
         3AkFCTCJtkmyNwHIi8OBbKg8GrSW/vQNtOplS9FgId+FB06QefzyzGcQ5FPEpwIyZx2S
         b6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QhVQd36IXCIyu/Km2aCnjkIju/vHi3m89bdbgcSfgkA=;
        b=KD32YNkxaeCEOm62Ps5qc6iIIykH8CudYYaoQq4emT+/BZ8G4RCZEZdrI7OZ68TrPO
         Wy/1bF0cP60Whj2K1hjrX54zKF1IFscMCMVDrI4yHOSbJDH+cGp3IrBYhRtsWEKOyiQM
         ShQbBSf2/v8A4fZoUYM1jSuK2ZU2wkRrZx+mJGUTeUNIxS5+O3dwaOPkHU43O4SKZ5vV
         4Sg2hBEbxIHb7wDLc1KgnD0Ba5PqFX5hIEm9DJFCi22AcsO2LLVFsoFk2BeqSTsKPy0x
         5eMuxl+7lMqzxv85eKD4j00bj4Z6TMA89+HcTh85J5t8Fgne72sVSy5ieMyWkj0CfHZ5
         ahyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10si4221575qkm.38.2018.11.04.17.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJTx3-0001Jg-9Q
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:45:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTuf-0007Lp-Ab
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTua-0002kY-Ci
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:9699)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTuW-0002YD-9u; Sun, 04 Nov 2018 20:42:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074352"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:42:25 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:33 +0100
Message-Id: <20181105014047.26447-11-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v5 10/24] hw: acpi: Export the PCI host and
 holes getters
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
X-TUID: oSquUQDO3bGv

This is going to be needed by the hardware reduced implementation, so
let's export it.
Once the ACPI builder methods and getters will be implemented, the
acpi_get_pci_host() implementation will become hardware agnostic.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/aml-build.h |  2 ++
 hw/acpi/aml-build.c         | 43 +++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 47 ++-----------------------------------
 3 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index c27c0935ae..fde2785b9a 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -400,6 +400,8 @@ build_header(BIOSLinker *linker, GArray *table_data,
              const char *oem_id, const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
+Object *acpi_get_pci_host(void);
+void acpi_get_pci_holes(Range *hole, Range *hole64);
 /* Align AML blob size to a multiple of 'align' */
 void acpi_align_size(GArray *blob, unsigned align);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2b9a636e75..b8e32f15f7 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1601,6 +1601,49 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
     g_array_free(tables->vmgenid, mfre);
 }
 
+/*
+ * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
+ */
+Object *acpi_get_pci_host(void)
+{
+    PCIHostState *host;
+
+    host = OBJECT_CHECK(PCIHostState,
+                        object_resolve_path("/machine/i440fx", NULL),
+                        TYPE_PCI_HOST_BRIDGE);
+    if (!host) {
+        host = OBJECT_CHECK(PCIHostState,
+                            object_resolve_path("/machine/q35", NULL),
+                            TYPE_PCI_HOST_BRIDGE);
+    }
+
+    return OBJECT(host);
+}
+
+
+void acpi_get_pci_holes(Range *hole, Range *hole64)
+{
+    Object *pci_host;
+
+    pci_host = acpi_get_pci_host();
+    g_assert(pci_host);
+
+    range_set_bounds1(hole,
+                      object_property_get_uint(pci_host,
+                                               PCI_HOST_PROP_PCI_HOLE_START,
+                                               NULL),
+                      object_property_get_uint(pci_host,
+                                               PCI_HOST_PROP_PCI_HOLE_END,
+                                               NULL));
+    range_set_bounds1(hole64,
+                      object_property_get_uint(pci_host,
+                                               PCI_HOST_PROP_PCI_HOLE64_START,
+                                               NULL),
+                      object_property_get_uint(pci_host,
+                                               PCI_HOST_PROP_PCI_HOLE64_END,
+                                               NULL));
+}
+
 static void crs_range_insert(GPtrArray *ranges, uint64_t base, uint64_t limit)
 {
     CrsRangeEntry *entry;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index bd147a6bd2..a5f5f83500 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -232,49 +232,6 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     info->applesmc_io_base = applesmc_port();
 }
 
-/*
- * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
- * On i386 arch we only have two pci hosts, so we can look only for them.
- */
-static Object *acpi_get_i386_pci_host(void)
-{
-    PCIHostState *host;
-
-    host = OBJECT_CHECK(PCIHostState,
-                        object_resolve_path("/machine/i440fx", NULL),
-                        TYPE_PCI_HOST_BRIDGE);
-    if (!host) {
-        host = OBJECT_CHECK(PCIHostState,
-                            object_resolve_path("/machine/q35", NULL),
-                            TYPE_PCI_HOST_BRIDGE);
-    }
-
-    return OBJECT(host);
-}
-
-static void acpi_get_pci_holes(Range *hole, Range *hole64)
-{
-    Object *pci_host;
-
-    pci_host = acpi_get_i386_pci_host();
-    g_assert(pci_host);
-
-    range_set_bounds1(hole,
-                      object_property_get_uint(pci_host,
-                                               PCI_HOST_PROP_PCI_HOLE_START,
-                                               NULL),
-                      object_property_get_uint(pci_host,
-                                               PCI_HOST_PROP_PCI_HOLE_END,
-                                               NULL));
-    range_set_bounds1(hole64,
-                      object_property_get_uint(pci_host,
-                                               PCI_HOST_PROP_PCI_HOLE64_START,
-                                               NULL),
-                      object_property_get_uint(pci_host,
-                                               PCI_HOST_PROP_PCI_HOLE64_END,
-                                               NULL));
-}
-
 /* FACS */
 static void
 build_facs(GArray *table_data, BIOSLinker *linker)
@@ -1634,7 +1591,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         Object *pci_host;
         PCIBus *bus = NULL;
 
-        pci_host = acpi_get_i386_pci_host();
+        pci_host = acpi_get_pci_host();
         if (pci_host) {
             bus = PCI_HOST_BRIDGE(pci_host)->bus;
         }
@@ -2008,7 +1965,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     Object *pci_host;
     QObject *o;
 
-    pci_host = acpi_get_i386_pci_host();
+    pci_host = acpi_get_pci_host();
     g_assert(pci_host);
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);
-- 
2.19.1


Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2038886wro;
        Sun, 4 Nov 2018 17:56:32 -0800 (PST)
X-Google-Smtp-Source: AJdET5f1xJEWt5RJMqPXv4ARx8mkPoyLRtVbUIiRhlohK7V0Re9hdi5+pTVoe352ppLuoXajjpsO
X-Received: by 2002:aed:3324:: with SMTP id u33mr10825340qtd.161.1541382991966;
        Sun, 04 Nov 2018 17:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382991; cv=none;
        d=google.com; s=arc-20160816;
        b=PPk0lmTT+k1gRBVxcjKytYE34ScCdOploXXxVLM7wEIiHkAafp/cgV3c0grHWVp0wJ
         LgKtZTimvePrYAJw9Ixxce60G6kSCwOHrnIXl9g06YR8Bh9IQNK2HkDfFqqiBX+BFhff
         FemOqq0Bk/TwuZOCRr6DVzQEvmipP7RAGMFqsOYoCzGJxowM2NVtKSrF0c1qckaBbxpX
         xsBSXdYfXt8pTGGdl/K1FgMeaxIWJvBIm/1YixbAmPEzwlZMpXhTTzcR7ql0OTdxr7p6
         FfPRUzJ9dFWwo0fV3dRZMroY9iWM853XoqQCOdJ0F1b9r6z7zwhzobJx3WxYL1+RTRjJ
         3MXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iOCanNg2ClUSWO52v1z3lnIjz7ASwlVqfOC7IclYm1c=;
        b=s39nlt6i/P0O+md1JZIU19Vo6a3iE+xGib8sgithwLb2xvXLNhaTYtvQzPVS72tS3G
         0YEu58lA2MQFuTVh68+wJkVhqPJwuB7gwbauV7OFNYVwOeGBWTm7VW6PPTPH3I2rEss2
         Ln5eQJE95O+YBNjz/WrUsPtOh6trfttVWKVvRTGybyuDCSdFvyJk4ECXVgstvIaLE6ld
         mIq3ylFVG6+1G8qOCptXhFBEZPEu2gupvkYb3z096LfoeZqh45rKp69CZEg2qxWpNc4N
         ORmYAp3TmhOw5cywdQHOBEfp0SiRLZ9OxQ+fssp32CVE7wHRaNDo/gRLU3j/EBNAkFVL
         wG/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si5474090qka.164.2018.11.04.17.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:56:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU7z-0005J6-Bs
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:56:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvA-0008Na-40
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:43:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTv5-0003JW-73
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:43:16 -0500
Received: from mga05.intel.com ([192.55.52.43]:26671)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTv4-0003Ia-SG; Sun, 04 Nov 2018 20:43:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074475"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:04 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:40 +0100
Message-Id: <20181105014047.26447-18-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-arm] [PATCH v5 17/24] hw: acpi: Export the PCI hotplug API
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jing Liu <jing2.liu@linux.intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IMyIpIzvTzY1

From: Sebastien Boeuf <sebastien.boeuf@intel.com>

The ACPI hotplug support for PCI devices APIs are not x86 or even
machine type specific. In order for future machine types to be able to
re-use that code, we export it through the architecture agnostic
hw/acpi folder.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Jing Liu <jing2.liu@linux.intel.com>
---
 include/hw/acpi/aml-build.h |   3 +
 hw/acpi/aml-build.c         | 194 ++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 192 +----------------------------------
 3 files changed, 199 insertions(+), 190 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 64ea371656..6b0a9735c5 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -418,6 +418,9 @@ Aml *build_osc_method(uint32_t value);
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
 Aml *build_gsi_link_dev(const char *name, uint8_t uid, uint8_t gsi);
 Aml *build_prt(bool is_pci0_prt);
+void build_acpi_pcihp(Aml *scope);
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
+                                  bool pcihp_bridge_en);
 void acpi_dsdt_add_pci_bus(Aml *dsdt, AcpiPciBus *pci_host);
 Aml *build_pci_host_bridge(Aml *table, AcpiPciBus *pci_host);
 void crs_range_set_init(CrsRangeSet *range_set);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2c5446ab23..6112cc2149 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -34,6 +34,7 @@
 #include "hw/acpi/tpm.h"
 #include "qom/qom-qobject.h"
 #include "qapi/qmp/qnum.h"
+#include "hw/acpi/pcihp.h"
 
 #define PCI_HOST_BRIDGE_CONFIG_ADDR        0xcf8
 #define PCI_HOST_BRIDGE_IO_0_MIN_ADDR      0x0000
@@ -2305,6 +2306,199 @@ Aml *build_pci_host_bridge(Aml *table, AcpiPciBus *pci_host)
     return scope;
 }
 
+void build_acpi_pcihp(Aml *scope)
+{
+    Aml *field;
+    Aml *method;
+
+    aml_append(scope,
+        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(0xae00), 0x08));
+    field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
+    aml_append(field, aml_named_field("PCIU", 32));
+    aml_append(field, aml_named_field("PCID", 32));
+    aml_append(scope, field);
+
+    aml_append(scope,
+        aml_operation_region("SEJ", AML_SYSTEM_IO, aml_int(0xae08), 0x04));
+    field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
+    aml_append(field, aml_named_field("B0EJ", 32));
+    aml_append(scope, field);
+
+    aml_append(scope,
+        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x04));
+    field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
+    aml_append(field, aml_named_field("BNUM", 32));
+    aml_append(scope, field);
+
+    aml_append(scope, aml_mutex("BLCK", 0));
+
+    method = aml_method("PCEJ", 2, AML_NOTSERIALIZED);
+    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
+    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
+    aml_append(method,
+        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("B0EJ")));
+    aml_append(method, aml_release(aml_name("BLCK")));
+    aml_append(method, aml_return(aml_int(0)));
+    aml_append(scope, method);
+}
+
+static void build_append_pcihp_notify_entry(Aml *method, int slot)
+{
+    Aml *if_ctx;
+    int32_t devfn = PCI_DEVFN(slot, 0);
+
+    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
+    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
+    aml_append(method, if_ctx);
+}
+
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
+                                  bool pcihp_bridge_en)
+{
+    Aml *dev, *notify_method = NULL, *method;
+    QObject *bsel;
+    PCIBus *sec;
+    int i;
+
+    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
+    if (bsel) {
+        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
+
+        aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
+        notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
+        DeviceClass *dc;
+        PCIDeviceClass *pc;
+        PCIDevice *pdev = bus->devices[i];
+        int slot = PCI_SLOT(i);
+        bool hotplug_enabled_dev;
+        bool bridge_in_acpi;
+
+        if (!pdev) {
+            if (bsel) { /* add hotplug slots for non present devices */
+                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
+                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+                aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+                aml_append(method,
+                    aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
+                );
+                aml_append(dev, method);
+                aml_append(parent_scope, dev);
+
+                build_append_pcihp_notify_entry(notify_method, slot);
+            }
+            continue;
+        }
+
+        pc = PCI_DEVICE_GET_CLASS(pdev);
+        dc = DEVICE_GET_CLASS(pdev);
+
+        /* When hotplug for bridges is enabled, bridges are
+         * described in ACPI separately (see build_pci_bus_end).
+         * In this case they aren't themselves hot-pluggable.
+         * Hotplugged bridges *are* hot-pluggable.
+         */
+        bridge_in_acpi = pc->is_bridge && pcihp_bridge_en &&
+            !DEVICE(pdev)->hotplugged;
+
+        hotplug_enabled_dev = bsel && dc->hotpluggable && !bridge_in_acpi;
+
+        if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
+            continue;
+        }
+
+        /* start to compose PCI slot descriptor */
+        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
+        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+
+        if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
+            /* add VGA specific AML methods */
+            int s3d;
+
+            if (object_dynamic_cast(OBJECT(pdev), "qxl-vga")) {
+                s3d = 3;
+            } else {
+                s3d = 0;
+            }
+
+            method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
+            aml_append(method, aml_return(aml_int(0)));
+            aml_append(dev, method);
+
+            method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
+            aml_append(method, aml_return(aml_int(0)));
+            aml_append(dev, method);
+
+            method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
+            aml_append(method, aml_return(aml_int(s3d)));
+            aml_append(dev, method);
+        } else if (hotplug_enabled_dev) {
+            /* add _SUN/_EJ0 to make slot hotpluggable  */
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+
+            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+            aml_append(method,
+                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
+            );
+            aml_append(dev, method);
+
+            if (bsel) {
+                build_append_pcihp_notify_entry(notify_method, slot);
+            }
+        } else if (bridge_in_acpi) {
+            /*
+             * device is coldplugged bridge,
+             * add child device descriptions into its scope
+             */
+            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
+
+            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
+        }
+        /* slot descriptor has been composed, add it into parent context */
+        aml_append(parent_scope, dev);
+    }
+
+    if (bsel) {
+        aml_append(parent_scope, notify_method);
+    }
+
+    /* Append PCNT method to notify about events on local and child buses.
+     * Add unconditionally for root since DSDT expects it.
+     */
+    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
+
+    /* If bus supports hotplug select it and notify about local events */
+    if (bsel) {
+        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
+
+        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
+        aml_append(method,
+            aml_call2("DVNT", aml_name("PCIU"), aml_int(1) /* Device Check */)
+        );
+        aml_append(method,
+            aml_call2("DVNT", aml_name("PCID"), aml_int(3)/* Eject Request */)
+        );
+    }
+
+    /* Notify about child bus events in any case */
+    if (pcihp_bridge_en) {
+        QLIST_FOREACH(sec, &bus->child, sibling) {
+            int32_t devfn = sec->parent_dev->devfn;
+
+            if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
+                continue;
+            }
+
+            aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+        }
+    }
+    aml_append(parent_scope, method);
+    qobject_unref(bsel);
+}
+
 void acpi_dsdt_add_pci_bus(Aml *dsdt, AcpiPciBus *pci_host)
 {
     Aml *dev, *pci_scope;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 673c5dfafc..bef5b23168 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -360,163 +360,6 @@ build_madt(GArray *table_data, BIOSLinker *linker,
                  table_data->len - madt_start, 1, NULL, NULL);
 }
 
-static void build_append_pcihp_notify_entry(Aml *method, int slot)
-{
-    Aml *if_ctx;
-    int32_t devfn = PCI_DEVFN(slot, 0);
-
-    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
-    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
-    aml_append(method, if_ctx);
-}
-
-static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
-                                         bool pcihp_bridge_en)
-{
-    Aml *dev, *notify_method = NULL, *method;
-    QObject *bsel;
-    PCIBus *sec;
-    int i;
-
-    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
-    if (bsel) {
-        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
-
-        aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
-        notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
-    }
-
-    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
-        DeviceClass *dc;
-        PCIDeviceClass *pc;
-        PCIDevice *pdev = bus->devices[i];
-        int slot = PCI_SLOT(i);
-        bool hotplug_enabled_dev;
-        bool bridge_in_acpi;
-
-        if (!pdev) {
-            if (bsel) { /* add hotplug slots for non present devices */
-                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
-                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-                aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
-                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-                aml_append(method,
-                    aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-                );
-                aml_append(dev, method);
-                aml_append(parent_scope, dev);
-
-                build_append_pcihp_notify_entry(notify_method, slot);
-            }
-            continue;
-        }
-
-        pc = PCI_DEVICE_GET_CLASS(pdev);
-        dc = DEVICE_GET_CLASS(pdev);
-
-        /* When hotplug for bridges is enabled, bridges are
-         * described in ACPI separately (see build_pci_bus_end).
-         * In this case they aren't themselves hot-pluggable.
-         * Hotplugged bridges *are* hot-pluggable.
-         */
-        bridge_in_acpi = pc->is_bridge && pcihp_bridge_en &&
-            !DEVICE(pdev)->hotplugged;
-
-        hotplug_enabled_dev = bsel && dc->hotpluggable && !bridge_in_acpi;
-
-        if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
-            continue;
-        }
-
-        /* start to compose PCI slot descriptor */
-        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
-        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
-
-        if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
-            /* add VGA specific AML methods */
-            int s3d;
-
-            if (object_dynamic_cast(OBJECT(pdev), "qxl-vga")) {
-                s3d = 3;
-            } else {
-                s3d = 0;
-            }
-
-            method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_return(aml_int(0)));
-            aml_append(dev, method);
-
-            method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_return(aml_int(0)));
-            aml_append(dev, method);
-
-            method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_return(aml_int(s3d)));
-            aml_append(dev, method);
-        } else if (hotplug_enabled_dev) {
-            /* add _SUN/_EJ0 to make slot hotpluggable  */
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-
-            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-            );
-            aml_append(dev, method);
-
-            if (bsel) {
-                build_append_pcihp_notify_entry(notify_method, slot);
-            }
-        } else if (bridge_in_acpi) {
-            /*
-             * device is coldplugged bridge,
-             * add child device descriptions into its scope
-             */
-            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
-
-            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
-        }
-        /* slot descriptor has been composed, add it into parent context */
-        aml_append(parent_scope, dev);
-    }
-
-    if (bsel) {
-        aml_append(parent_scope, notify_method);
-    }
-
-    /* Append PCNT method to notify about events on local and child buses.
-     * Add unconditionally for root since DSDT expects it.
-     */
-    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
-
-    /* If bus supports hotplug select it and notify about local events */
-    if (bsel) {
-        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
-
-        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
-        aml_append(method,
-            aml_call2("DVNT", aml_name("PCIU"), aml_int(1) /* Device Check */)
-        );
-        aml_append(method,
-            aml_call2("DVNT", aml_name("PCID"), aml_int(3)/* Eject Request */)
-        );
-    }
-
-    /* Notify about child bus events in any case */
-    if (pcihp_bridge_en) {
-        QLIST_FOREACH(sec, &bus->child, sibling) {
-            int32_t devfn = sec->parent_dev->devfn;
-
-            if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
-                continue;
-            }
-
-            aml_append(method, aml_name("^S%.02X.PCNT", devfn));
-        }
-    }
-    aml_append(parent_scope, method);
-    qobject_unref(bsel);
-}
-
 static void build_hpet_aml(Aml *table)
 {
     Aml *crs;
@@ -1212,41 +1055,10 @@ static void build_piix4_isa_bridge(Aml *table)
 static void build_piix4_pci_hotplug(Aml *table)
 {
     Aml *scope;
-    Aml *field;
-    Aml *method;
-
-    scope =  aml_scope("_SB.PCI0");
-
-    aml_append(scope,
-        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(0xae00), 0x08));
-    field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
-    aml_append(field, aml_named_field("PCIU", 32));
-    aml_append(field, aml_named_field("PCID", 32));
-    aml_append(scope, field);
 
-    aml_append(scope,
-        aml_operation_region("SEJ", AML_SYSTEM_IO, aml_int(0xae08), 0x04));
-    field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
-    aml_append(field, aml_named_field("B0EJ", 32));
-    aml_append(scope, field);
-
-    aml_append(scope,
-        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x04));
-    field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
-    aml_append(field, aml_named_field("BNUM", 32));
-    aml_append(scope, field);
-
-    aml_append(scope, aml_mutex("BLCK", 0));
-
-    method = aml_method("PCEJ", 2, AML_NOTSERIALIZED);
-    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
-    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
-    aml_append(method,
-        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("B0EJ")));
-    aml_append(method, aml_release(aml_name("BLCK")));
-    aml_append(method, aml_return(aml_int(0)));
-    aml_append(scope, method);
+    scope = aml_scope("_SB.PCI0");
 
+    build_acpi_pcihp(scope);
     aml_append(table, scope);
 }
 
-- 
2.19.1


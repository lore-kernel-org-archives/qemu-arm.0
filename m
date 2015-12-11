Received: by 10.182.158.201 with SMTP id ww9csp905517obb;
        Thu, 10 Dec 2015 19:25:24 -0800 (PST)
X-Received: by 10.140.29.195 with SMTP id b61mr19987144qgb.50.1449804323343;
        Thu, 10 Dec 2015 19:25:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u132si18153321qhu.117.2015.12.10.19.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 19:25:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7EKh-000255-1P
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 22:25:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7EKd-00024M-Uu
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 22:25:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7EKZ-0000KJ-TQ
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 22:25:19 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:31004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a7EKY-0000KA-Uw; Thu, 10 Dec 2015 22:25:15 -0500
Received: from 172.24.1.48 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BSN95087; Fri, 11 Dec 2015 11:21:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Fri, 11 Dec 2015 11:21:46 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>, 
	<mst@redhat.com>, <wei@redhat.com>
Date: Fri, 11 Dec 2015 11:21:17 +0800
Message-ID: <1449804086-3464-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.566A4152.0078, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a6a0890008d0d994e7c342c24ada0350
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v5 01/10] acpi: support serialized method
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PnUyt6LrQDVE

From: Xiao Guangrong <guangrong.xiao@linux.intel.com>

Add serialized method support so that explicit Mutex can be
avoided

Signed-off-by: Xiao Guangrong <guangrong.xiao@linux.intel.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/acpi/aml-build.c         | 17 +++++++++++++++--
 hw/arm/virt-acpi-build.c    | 10 +++++-----
 hw/i386/acpi-build.c        | 41 +++++++++++++++++++++--------------------
 include/hw/acpi/aml-build.h |  8 +++++++-
 4 files changed, 48 insertions(+), 28 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a00a0ab..411c0e5 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -696,11 +696,24 @@ Aml *aml_while(Aml *predicate)
 }
 
 /* ACPI 1.0b: 16.2.5.2 Named Objects Encoding: DefMethod */
-Aml *aml_method(const char *name, int arg_count)
+Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag)
 {
     Aml *var = aml_bundle(0x14 /* MethodOp */, AML_PACKAGE);
+    int methodflags;
+
+    /*
+     * MethodFlags:
+     *   bit 0-2: ArgCount (0-7)
+     *   bit 3: SerializeFlag
+     *     0: NotSerialized
+     *     1: Serialized
+     *   bit 4-7: reserved (must be 0)
+     */
+    assert(arg_count < 8);
+    methodflags = arg_count | (sflag << 3);
+
     build_append_namestring(var->buf, "%s", name);
-    build_append_byte(var->buf, arg_count); /* MethodFlags: ArgCount */
+    build_append_byte(var->buf, methodflags); /* MethodFlags: ArgCount */
     return var;
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3c2c5d6..38ab844 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -212,16 +212,16 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
                                  AML_EXCLUSIVE, irq + i));
         aml_append(dev_gsi, aml_name_decl("_CRS", crs));
-        method = aml_method("_SRS", 1);
+        method = aml_method("_SRS", 1, AML_NOTSERIALIZED);
         aml_append(dev_gsi, method);
         aml_append(dev, dev_gsi);
     }
 
-    method = aml_method("_CBA", 0);
+    method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
     aml_append(method, aml_return(aml_int(base_ecam)));
     aml_append(dev, method);
 
-    method = aml_method("_CRS", 0);
+    method = aml_method("_CRS", 0, AML_NOTSERIALIZED);
     Aml *rbuf = aml_resource_template();
     aml_append(rbuf,
         aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
@@ -254,7 +254,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
     /* Declare an _OSC (OS Control Handoff) method */
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
     aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
-    method = aml_method("_OSC", 4);
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
     aml_append(method,
         aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
 
@@ -296,7 +296,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
     aml_append(method, elsectx);
     aml_append(dev, method);
 
-    method = aml_method("_DSM", 4);
+    method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
 
     /* PCI Firmware Specification 3.0
      * 4.6.1. _DSM for PCI Express Slot Information
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 95e0c65..5856329 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -487,7 +487,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         int64_t bsel_val = qint_get_int(qobject_to_qint(bsel));
 
         aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
-        notify_method = aml_method("DVNT", 2);
+        notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
     }
 
     for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
@@ -503,7 +503,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
-                method = aml_method("_EJ0", 1);
+                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
                 );
@@ -546,22 +546,22 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 s3d = 0;
             }
 
-            method = aml_method("_S1D", 0);
+            method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_int(0)));
             aml_append(dev, method);
 
-            method = aml_method("_S2D", 0);
+            method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_int(0)));
             aml_append(dev, method);
 
-            method = aml_method("_S3D", 0);
+            method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
         } else if (hotplug_enabled_dev) {
             /* add _SUN/_EJ0 to make slot hotpluggable  */
             aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
 
-            method = aml_method("_EJ0", 1);
+            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             aml_append(method,
                 aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
             );
@@ -590,7 +590,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     /* Append PCNT method to notify about events on local and child buses.
      * Add unconditionally for root since DSDT expects it.
      */
-    method = aml_method("PCNT", 0);
+    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
 
     /* If bus supports hotplug select it and notify about local events */
     if (bsel) {
@@ -651,7 +651,7 @@ static Aml *build_prt(void)
 {
     Aml *method, *while_ctx, *pin, *res;
 
-    method = aml_method("_PRT", 0);
+    method = aml_method("_PRT", 0, AML_NOTSERIALIZED);
     res = aml_local(0);
     pin = aml_local(1);
     aml_append(method, aml_store(aml_package(128), res));
@@ -1112,12 +1112,12 @@ build_ssdt(GArray *table_data, GArray *linker,
         /* device present, functioning, decoding, shown in UI */
         aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
 
-        method = aml_method("RDPT", 0);
+        method = aml_method("RDPT", 0, AML_NOTSERIALIZED);
         aml_append(method, aml_store(aml_name("PEPT"), aml_local(0)));
         aml_append(method, aml_return(aml_local(0)));
         aml_append(dev, method);
 
-        method = aml_method("WRPT", 1);
+        method = aml_method("WRPT", 1, AML_NOTSERIALIZED);
         aml_append(method, aml_store(aml_arg(0), aml_name("PEPT")));
         aml_append(dev, method);
 
@@ -1153,15 +1153,15 @@ build_ssdt(GArray *table_data, GArray *linker,
         for (i = 0; i < acpi_cpus; i++) {
             dev = aml_processor(i, 0, 0, "CP%.02X", i);
 
-            method = aml_method("_MAT", 0);
+            method = aml_method("_MAT", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_call1("CPMA", aml_int(i))));
             aml_append(dev, method);
 
-            method = aml_method("_STA", 0);
+            method = aml_method("_STA", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_call1("CPST", aml_int(i))));
             aml_append(dev, method);
 
-            method = aml_method("_EJ0", 1);
+            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             aml_append(method,
                 aml_return(aml_call2("CPEJ", aml_int(i), aml_arg(0)))
             );
@@ -1174,7 +1174,7 @@ build_ssdt(GArray *table_data, GArray *linker,
          *   Method(NTFY, 2) {If (LEqual(Arg0, 0x00)) {Notify(CP00, Arg1)} ...}
          */
         /* Arg0 = Processor ID = APIC ID */
-        method = aml_method("NTFY", 2);
+        method = aml_method("NTFY", 2, AML_NOTSERIALIZED);
         for (i = 0; i < acpi_cpus; i++) {
             ifctx = aml_if(aml_equal(aml_arg(0), aml_int(i)));
             aml_append(ifctx,
@@ -1269,29 +1269,29 @@ build_ssdt(GArray *table_data, GArray *linker,
             aml_append(dev, aml_name_decl("_UID", aml_string("0x%02X", i)));
             aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C80")));
 
-            method = aml_method("_CRS", 0);
+            method = aml_method("_CRS", 0, AML_NOTSERIALIZED);
             s = BASEPATH stringify(MEMORY_SLOT_CRS_METHOD);
             aml_append(method, aml_return(aml_call1(s, aml_name("_UID"))));
             aml_append(dev, method);
 
-            method = aml_method("_STA", 0);
+            method = aml_method("_STA", 0, AML_NOTSERIALIZED);
             s = BASEPATH stringify(MEMORY_SLOT_STATUS_METHOD);
             aml_append(method, aml_return(aml_call1(s, aml_name("_UID"))));
             aml_append(dev, method);
 
-            method = aml_method("_PXM", 0);
+            method = aml_method("_PXM", 0, AML_NOTSERIALIZED);
             s = BASEPATH stringify(MEMORY_SLOT_PROXIMITY_METHOD);
             aml_append(method, aml_return(aml_call1(s, aml_name("_UID"))));
             aml_append(dev, method);
 
-            method = aml_method("_OST", 3);
+            method = aml_method("_OST", 3, AML_NOTSERIALIZED);
             s = BASEPATH stringify(MEMORY_SLOT_OST_METHOD);
             aml_append(method, aml_return(aml_call4(
                 s, aml_name("_UID"), aml_arg(0), aml_arg(1), aml_arg(2)
             )));
             aml_append(dev, method);
 
-            method = aml_method("_EJ0", 1);
+            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             s = BASEPATH stringify(MEMORY_SLOT_EJECT_METHOD);
             aml_append(method, aml_return(aml_call2(
                        s, aml_name("_UID"), aml_arg(0))));
@@ -1303,7 +1303,8 @@ build_ssdt(GArray *table_data, GArray *linker,
         /* build Method(MEMORY_SLOT_NOTIFY_METHOD, 2) {
          *     If (LEqual(Arg0, 0x00)) {Notify(MP00, Arg1)} ... }
          */
-        method = aml_method(stringify(MEMORY_SLOT_NOTIFY_METHOD), 2);
+        method = aml_method(stringify(MEMORY_SLOT_NOTIFY_METHOD), 2,
+                            AML_NOTSERIALIZED);
         for (i = 0; i < nr_mem; i++) {
             ifctx = aml_if(aml_equal(aml_arg(0), aml_int(i)));
             aml_append(ifctx,
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 1b632dc..a3580e1 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -148,6 +148,12 @@ typedef enum {
     AML_SHARED_AND_WAKE = 3,
 } AmlShared;
 
+/* ACPI 1.0b: 16.2.5.2 Named Objects Encoding: MethodFlags */
+typedef enum {
+    AML_NOTSERIALIZED = 0,
+    AML_SERIALIZED = 1,
+} AmlSerializeFlag;
+
 typedef
 struct AcpiBuildTables {
     GArray *table_data;
@@ -262,7 +268,7 @@ Aml *aml_qword_memory(AmlDecode dec, AmlMinFixed min_fixed,
 /* Block AML object primitives */
 Aml *aml_scope(const char *name_format, ...) GCC_FMT_ATTR(1, 2);
 Aml *aml_device(const char *name_format, ...) GCC_FMT_ATTR(1, 2);
-Aml *aml_method(const char *name, int arg_count);
+Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag);
 Aml *aml_if(Aml *predicate);
 Aml *aml_else(void);
 Aml *aml_while(Aml *predicate);
-- 
2.0.4



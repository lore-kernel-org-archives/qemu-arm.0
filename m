Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2129907wrq;
        Thu, 5 Jul 2018 16:53:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcwEhoEnC0kc/OE56w1ev5XI/l09NAi0201XceKntq2EP2WFNjl779dhyz3phcCuEJrsUw3
X-Received: by 2002:a0c:be15:: with SMTP id k21-v6mr6909774qvg.1.1530834806953;
        Thu, 05 Jul 2018 16:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530834806; cv=none;
        d=google.com; s=arc-20160816;
        b=Qg8dQeBQw+8nZebZiojEOKQg3XZxwUdWY2mCGHnoWcVTXZKmgOrnBZ4tcT5/iBWWRg
         pkXuMJPBbbhWD9PsHcF9/xcSB5mkPqVefJDCzzHqz/cd6SwLniVMeA61nHIvfia9gTAL
         ANjCIr5r0YrIbjIqkJ/mJKQum2lviQddeptL3wQONUaQiRK8wOjEoK6RBhYPmxo42DsM
         HhNnWTC63ze4X1UgY75HdCpemyETp1QnZ+yqs/e4gJeKJ3G6n5He1dR2EuTaBmwkfl04
         5FuEE2atlgcB6Dwd0P3yNYSjdi6a0SfGDkjDW/I5CubmwGwwVW2NUKBxEol9D8eGliuP
         qv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-disposition
         :mime-version:message-id:to:from:date:arc-authentication-results;
        bh=JAVvrh66wOrHtUl/6WjWMFFZcdFViov+3G0IIA3PJeU=;
        b=FKjmexll4iRWI7gSluc9g+FIShB6ipMbeI+K4MqYWug1XARwNIn0NRhjTpxduGwjTa
         eu0YuzSoF0P5Y1hmBO/W68E51yeuQfF/5RzO//Xv7qKZt/7P73ZXNsaq7me5h2JXnFJG
         0wjM+TE/GznXDhMPkHlQBsDeyqLWFRKofOzbnu8yzkAj6mfYqidRZXOXUIkPhsGBYqag
         9jfEcwaUiagDEk4nqu18fpUu/9WJNXsVBveZ6rQd/mwgvyTnAHpJOYQ6heaPS4gG0dJs
         wKRnOvn3Opcp3zyGIjpWBaNYO55I6p31EMdUdcSwW751dC66vvSaQsFYEKR5PjMXSu7z
         o7hA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e75-v6si731264qkh.359.2018.07.05.16.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 16:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fbE3y-0006eu-Gc
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 19:53:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fbE3p-0006ea-FA
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 19:53:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fbE3k-0007tm-Df
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 19:53:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38204 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fbE3k-0007qZ-6w; Thu, 05 Jul 2018 19:53:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6E95401B212;
	Thu,  5 Jul 2018 23:53:10 +0000 (UTC)
Received: from redhat.com (ovpn-124-6.rdu2.redhat.com [10.10.124.6])
	by smtp.corp.redhat.com (Postfix) with SMTP id 1D65876D0;
	Thu,  5 Jul 2018 23:53:09 +0000 (UTC)
Date: Fri, 6 Jul 2018 02:53:09 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20180705235305.124423-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 05 Jul 2018 23:53:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 05 Jul 2018 23:53:10 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] acpi: generalize aml_package / aml_varpackage
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
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ndd9ouPCnzf

VarPackage can accept an expression evaluating to int, not just an int.
Change the API to make it more generic.
Further, rather than have users call the correct API depending on
value passed, use either PackageOp or VarPackageOp automatically.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  4 ++--
 hw/acpi/aml-build.c         | 18 ++++++++++++++----
 hw/acpi/cpu_hotplug.c       | 11 ++---------
 hw/arm/virt-acpi-build.c    |  2 +-
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 10c7946028..7cf2cf64bf 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -360,7 +360,7 @@ Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag);
 Aml *aml_if(Aml *predicate);
 Aml *aml_else(void);
 Aml *aml_while(Aml *predicate);
-Aml *aml_package(uint8_t num_elements);
+Aml *aml_package(uint64_t num_elements);
 Aml *aml_buffer(int buffer_size, uint8_t *byte_list);
 Aml *aml_resource_template(void);
 Aml *aml_field(const char *name, AmlAccessType type, AmlLockRule lock,
@@ -373,7 +373,7 @@ Aml *aml_create_field(Aml *srcbuf, Aml *bit_index, Aml *num_bits,
                       const char *name);
 Aml *aml_create_dword_field(Aml *srcbuf, Aml *index, const char *name);
 Aml *aml_create_qword_field(Aml *srcbuf, Aml *index, const char *name);
-Aml *aml_varpackage(uint32_t num_elements);
+Aml *aml_varpackage(Aml *num_elements);
 Aml *aml_touuid(const char *uuid);
 Aml *aml_unicode(const char *str);
 Aml *aml_refof(Aml *arg);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index def62b3112..1996768b40 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1016,9 +1016,19 @@ Aml *aml_buffer(int buffer_size, uint8_t *byte_list)
 }
 
 /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefPackage */
-Aml *aml_package(uint8_t num_elements)
+/* Note: The ability to create variable-sized packages was first
+ * introduced in ACPI 2.0. ACPI 1.0 only allowed fixed-size packages
+ * with up to 255 elements. Windows guests up to win2k8 fail when
+ * VarPackageOp is used.
+ */
+Aml *aml_package(uint64_t num_elements)
 {
-    Aml *var = aml_bundle(0x12 /* PackageOp */, AML_PACKAGE);
+    Aml *var;
+
+    if (num_elements > 0xFF)
+        return aml_varpackage(aml_int(num_elements));
+
+    var = aml_bundle(0x12 /* PackageOp */, AML_PACKAGE);
     build_append_byte(var->buf, num_elements);
     return var;
 }
@@ -1136,10 +1146,10 @@ Aml *aml_local(int num)
 }
 
 /* ACPI 2.0a: 17.2.2 Data Objects Encoding: DefVarPackage */
-Aml *aml_varpackage(uint32_t num_elements)
+Aml *aml_varpackage(Aml *num_elements)
 {
     Aml *var = aml_bundle(0x13 /* VarPackageOp */, AML_PACKAGE);
-    build_append_int(var->buf, num_elements);
+    aml_append(var, num_elements);
     return var;
 }
 
diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 5243918125..f8246fca6f 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -309,15 +309,8 @@ void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
     }
     aml_append(sb_scope, method);
 
-    /* build "Name(CPON, Package() { One, One, ..., Zero, Zero, ... })"
-     *
-     * Note: The ability to create variable-sized packages was first
-     * introduced in ACPI 2.0. ACPI 1.0 only allowed fixed-size packages
-     * ith up to 255 elements. Windows guests up to win2k8 fail when
-     * VarPackageOp is used.
-     */
-    pkg = pcms->apic_id_limit <= 255 ? aml_package(pcms->apic_id_limit) :
-                                       aml_varpackage(pcms->apic_id_limit);
+    /* build "Name(CPON, Package() { One, One, ..., Zero, Zero, ... })" */
+    pkg = aml_package(pcms->apic_id_limit);
 
     for (i = 0, apic_idx = 0; i < apic_ids->len; i++) {
         int apic_id = apic_ids->cpus[i].arch_id;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e2588..2adb1de378 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -174,7 +174,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
     /* Declare the PCI Routing Table. */
-    Aml *rt_pkg = aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);
+    Aml *rt_pkg = aml_package(nr_pcie_buses * PCI_NUM_PINS);
     for (bus_no = 0; bus_no < nr_pcie_buses; bus_no++) {
         for (i = 0; i < PCI_NUM_PINS; i++) {
             int gsi = (i + bus_no) % PCI_NUM_PINS;
-- 
MST

Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2966339wrq;
        Mon, 9 Jul 2018 17:01:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpceI4sHSKlK5KdhZO5a4Nvf9OPNJkvl7xX/86Ccj9q2uU+A0bbAEPO9syJPO6Nboohz/ew/
X-Received: by 2002:ac8:359b:: with SMTP id k27-v6mr20578419qtb.15.1531180913869;
        Mon, 09 Jul 2018 17:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531180913; cv=none;
        d=google.com; s=arc-20160816;
        b=Gj4ayn3EUTdYRGazlN/5Q66j0uFlS/jFY3ww3w+jYWcvcuoDY0LZ8Wr2ievLdw2icH
         xUZwZPV/obPGOgqkqwRwsICWVotOVXBmV4/pzaOgmkuYwaJBbm+jRvMC5YHx8szgdcLF
         t+/A05CD2WmqAJukXnlrvyI/TKp0Libtsm6DwhC3rv15yx9TxcADEpSBT97EMVxwHsol
         JUGYJVXqP6OVKomFspuaHXkmgARVwmXUDV6mG1/MMfL7cefP9fxE5iVIZGQsKxLm3qzd
         3mQBYCcJ3OppPfrgciGZ+F1J04XOhjcs+xuCttEJnKgAWrmYS+42V4vwrBK1O6w+e2m1
         DNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=a884Dcc87lkKZIP1zy6Shdc6B5A5bShPBgP+GZm1nPw=;
        b=BJO5BSSz1IhF3S7W+PFq6Ql9t91UtMe6v3ENGIqM9WVdALbg/PrwVW4tFXNq2zCI/T
         2+fCawFKHnHtSmYJUwUz901A1f7ib2d910r+2yvC06Y2GC42f4XiLa0RZoGDFKcX5MEl
         YB+jGjrHFV5WYYfHi5WOXuPcL0Sftocp1bHEob+TS7tmLUUQgMFGqnKnkwHDChkb6nln
         O34DRGypm8RAd9nhDAvXVlnaBGTwYieTlSkcpO4woI+p5xSHpH8sABlwC8sKxoYGAIdD
         vRfSRYFZr1cjMGuCbIMx2KpTXtKxD7w1DRaVCcSLdJ5RcCQgFjgDUfaCrVp9J+/FEGCt
         vo4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18-v6si1071655qtb.195.2018.07.09.17.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 17:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcg6L-0001B7-9V
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 20:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fcg62-00018D-Mj
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 20:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fcg60-0001o1-T2
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 20:01:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51378 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fcg60-0001nu-NH; Mon, 09 Jul 2018 20:01:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30594808255B;
	Tue, 10 Jul 2018 00:01:32 +0000 (UTC)
Received: from redhat.com (ovpn-120-239.rdu2.redhat.com [10.10.120.239])
	by smtp.corp.redhat.com (Postfix) with SMTP id B11A92026D65;
	Tue, 10 Jul 2018 00:01:31 +0000 (UTC)
Date: Tue, 10 Jul 2018 03:01:31 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20180710000024.542612-3-mst@redhat.com>
References: <20180710000024.542612-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710000024.542612-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 10 Jul 2018 00:01:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 10 Jul 2018 00:01:32 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH hack dontapply v2 2/7] acpi: generalize
 aml_package / aml_varpackage
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
Cc: Peter Maydell <peter.maydell@linaro.org>, ehabkost@redhat.com,
	pbonzini@redhat.com, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dl6Lo/t7p4LA

VarPackage can accept an expression evaluating to int, not just an int.
Change the API to make it more generic.
Further, rather than have users call the correct API depending on
value passed, use either PackageOp or VarPackageOp automatically.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  4 ++--
 hw/acpi/aml-build.c         | 19 +++++++++++++++----
 hw/acpi/cpu_hotplug.c       | 11 ++---------
 hw/arm/virt-acpi-build.c    |  2 +-
 4 files changed, 20 insertions(+), 16 deletions(-)

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
index def62b3112..7165f19585 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1016,9 +1016,20 @@ Aml *aml_buffer(int buffer_size, uint8_t *byte_list)
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
+    if (num_elements > 0xFF) {
+        return aml_varpackage(aml_int(num_elements));
+    }
+
+    var = aml_bundle(0x12 /* PackageOp */, AML_PACKAGE);
     build_append_byte(var->buf, num_elements);
     return var;
 }
@@ -1136,10 +1147,10 @@ Aml *aml_local(int num)
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


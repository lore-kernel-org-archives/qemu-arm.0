Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2033302wro;
        Sun, 4 Nov 2018 17:47:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5cG5H2e5h3Dyqxp1de2uj/5VYPD3A/SMlE2FgJaS7ytdp5gYeK0xdNZewikDld379b0rxiA
X-Received: by 2002:ac8:fd4:: with SMTP id f20mr18902182qtk.63.1541382468218;
        Sun, 04 Nov 2018 17:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382468; cv=none;
        d=google.com; s=arc-20160816;
        b=VVxm4cHYd8aWLYY4z5hzU0xPi6Bkn0fKzUiUk/vsU4BbfWf1JYX3Gvb822ozJLqrvT
         Sqkg1IyRhO+85ewDZVgvFupaWKsIlo9OhQuNpnQLLbzHzd8xRpPk63adqf1m75jj9fsZ
         sM8sTNXIqC6uLSs1gWK3cmICpsevZGjSpz4cNT/hdkj096c0z8mTY3A4lVAsENpt/Ame
         EUirA5eoO4pigOovDslIfXU3/vsND2e1kmkfBssl/8t97D5oIhKgT87WRUDTu4aWdU/D
         qFnjng0WnDuB8JryfqgJfdNhPsDd0nC0Abg1ybY2lzQeu4ziwdhTy6Rhxp24hU2YQ8wB
         lSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YXDej9a6aDLfEdgj5iTdCe1Oj9lIsrZizHPsQ1fFa7A=;
        b=ixzLhj8AtnW7traKOulIkGmdgsvM2vizAklhqty4285eInSb4yj8gorO8MV2arWV9L
         EjXmkutspTPn3mtdFAGUL2p29FH0TyBQTSMNdzxRyquhQaawaqLOe+njR77qI3M5z7Vj
         f4lV2HMx1N0+G2fSsRzwOI9VzW1ZMKpDfwId4bbXEZwRhE02IeeOZyrqLbBsyh+NowQS
         W9k16bfaFKAkjDe4BCYU6Nby8BPTBd2O8vCcVRtWhdUG8/b/5i5Ibdd9GWPi7UjRGRZX
         AWg0rfvBY7J42mJFg5WF31QWiBUzJMI2AwNwM0yZYadwSWlbVEQFNESlpbnbNcGzo2z2
         lp2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si2121295qtk.203.2018.11.04.17.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:47:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJTzX-0003ZV-MG
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:47:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTul-0007qK-AP
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTuf-0002t5-Ni
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:42:51 -0500
Received: from mga05.intel.com ([192.55.52.43]:26654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTuf-0002o9-DL; Sun, 04 Nov 2018 20:42:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:42:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074384"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:42:36 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:35 +0100
Message-Id: <20181105014047.26447-13-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-arm] [PATCH v5 12/24] hw: acpi: Export the MCFG getter
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hKSQZ5M9BiXp

From: Yang Zhong <yang.zhong@intel.com>

The ACPI MCFG getter is not x86 specific and could be called from
anywhere within generic ACPI API, so let's export it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 include/hw/acpi/aml-build.h |  1 +
 hw/acpi/aml-build.c         | 24 ++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 22 ----------------------
 3 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 1861e37ebf..64ea371656 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -408,6 +408,7 @@ void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
 Object *acpi_get_pci_host(void);
 void acpi_get_pci_holes(Range *hole, Range *hole64);
+bool acpi_get_mcfg(AcpiMcfgInfo *mcfg);
 /* Align AML blob size to a multiple of 'align' */
 void acpi_align_size(GArray *blob, unsigned align);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 869ed70db3..2c5446ab23 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -32,6 +32,8 @@
 #include "hw/i386/pc.h"
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
+#include "qom/qom-qobject.h"
+#include "qapi/qmp/qnum.h"
 
 #define PCI_HOST_BRIDGE_CONFIG_ADDR        0xcf8
 #define PCI_HOST_BRIDGE_IO_0_MIN_ADDR      0x0000
@@ -1657,6 +1659,28 @@ void acpi_get_pci_holes(Range *hole, Range *hole64)
                                                NULL));
 }
 
+bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
+{
+    Object *pci_host;
+    QObject *o;
+
+    pci_host = acpi_get_pci_host();
+    g_assert(pci_host);
+
+    o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);
+    if (!o) {
+        return false;
+    }
+    mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
+    qobject_unref(o);
+
+    o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
+    assert(o);
+    mcfg->mcfg_size = qnum_get_uint(qobject_to(QNum, o));
+    qobject_unref(o);
+    return true;
+}
+
 static void crs_range_insert(GPtrArray *ranges, uint64_t base, uint64_t limit)
 {
     CrsRangeEntry *entry;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 14e2624d14..d8bba16776 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1856,28 +1856,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
                  "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
 }
 
-static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
-{
-    Object *pci_host;
-    QObject *o;
-
-    pci_host = acpi_get_pci_host();
-    g_assert(pci_host);
-
-    o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);
-    if (!o) {
-        return false;
-    }
-    mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
-    qobject_unref(o);
-
-    o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
-    assert(o);
-    mcfg->mcfg_size = qnum_get_uint(qobject_to(QNum, o));
-    qobject_unref(o);
-    return true;
-}
-
 static
 void acpi_build(AcpiBuildTables *tables,
                 MachineState *machine, AcpiConfiguration *acpi_conf)
-- 
2.19.1


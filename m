Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp632263wro;
        Thu, 1 Nov 2018 03:37:08 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ejsUMbzi6d/xcHiEh7ZKivVgSeM3kSCkXNMgoSM22dxTGbZsmdBVjJsPG3P1ot7G/7Wqx7
X-Received: by 2002:aed:22f0:: with SMTP id q45-v6mr6300085qtc.145.1541068628713;
        Thu, 01 Nov 2018 03:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541068628; cv=none;
        d=google.com; s=arc-20160816;
        b=bCzv/9q1Cc66f22GYkNpWuljwcRb4n8cfL2n0YtFk+6MkeDVL/Aq/r3lpEH3cnqnz7
         Ceb+craam7hhPJcSYdoOnwJo9zwyna7/vM41FlgNzhLY4F4668FVvwiU1ykALkUdaV2M
         gHtFMhw1meWx6oIMFnBo2dl4DEyTU9JQB86joQiqRy3TBNZI5g/GZFetrhVmmWo8okn0
         FQBl3POO3tRGfrJfs1sw7o+q6V7X6wauZ5vcD15+0QPACnSRstiAOzUnbCqtNo1N9CM2
         86tuhSuYK8RFVe+q4WrLjhYSdTqi8j7FLjxEkZdcC1BqF0UknIjOB6AuyqJbBzDIpDm4
         foIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sNWj/miAMUzy5U+wEW0ldSPLB8L8jjqSheZAhDxzT08=;
        b=ojV59r2lq13682dYerNXP0L1p0mUvSLlh8HtB9CpEdsu63Iw3B8cU1J6nP9TNJ3Cwl
         etk/wQ0I52xXgtjrh1JX9EijKjGD1SEvMgnYtG7CED7Cyxg+37lRaW1icPnqkXyyKBhV
         1+PSH6RNAuVw5pC31bBQmYZ4iaQHZ6WPsQZdj9/bCIX5Ubrj/dOmblKUrxhBTpP3dde7
         NLnu7CGdbEZwB9wpGHvayRwEwAxrrUPpC5Yj9gcbBg7aF+DP7ElueEtJ6lWvm33ypC6Z
         yparCaB572cG3xA2QTbTbDrPHstFsXJcSFyNFwKK5mJuvc1wFARTdmTPrMcqOqOkSkgA
         IhJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 136si774059qke.143.2018.11.01.03.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 03:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:41143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIALc-0002ux-6E
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 06:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIAAX-0005jI-2w
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 06:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIAAT-0003sV-Nd
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 06:25:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:61548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gIAAS-0003Hf-4X; Thu, 01 Nov 2018 06:25:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2018 03:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,451,1534834800"; d="scan'208";a="87786082"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.9.87])
	by orsmga006.jf.intel.com with ESMTP; 01 Nov 2018 03:24:54 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Nov 2018 11:22:57 +0100
Message-Id: <20181101102303.16439-18-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181101102303.16439-1-sameo@linux.intel.com>
References: <20181101102303.16439-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [PATCH v4 17/23] hw: i386: Export the MADT build method
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPdnGvK1NXvN

It is going to be used by the PC machine type as the MADT table builder
method and thus needs to be exported outside of acpi-build.c

Also, now that the generic build_madt() API is exported, we have to
rename the ARM static one in order to avoid build time conflicts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/i386/acpi-build.c     |  3 ++-
 include/hw/i386/acpi.h   | 27 +++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/i386/acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f9a60907f1..4a37c5997c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -565,7 +565,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
 /* MADT */
 static void
-build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+virt_build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     int madt_start = table_data->len;
@@ -746,7 +746,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_madt(tables_blob, tables->linker, vms);
+    virt_build_madt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6c9b61cea2..f4afdbcd1a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -60,6 +60,7 @@
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/i386/acpi.h"
 
 #include "hw/acpi/ipmi.h"
 
@@ -279,7 +280,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
     }
 }
 
-static void
+void
 build_madt(GArray *table_data, BIOSLinker *linker,
            MachineState *ms, AcpiConfiguration *acpi_conf)
 {
diff --git a/include/hw/i386/acpi.h b/include/hw/i386/acpi.h
new file mode 100644
index 0000000000..ee1203914a
--- /dev/null
+++ b/include/hw/i386/acpi.h
@@ -0,0 +1,27 @@
+/*
+ *
+ * Copyright (c) 2018 Intel Corportation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_I386_ACPI_H
+#define HW_I386_ACPI_H
+
+#include "hw/acpi/acpi.h"
+
+/* ACPI MADT (Multiple APIC Description Table) build method */
+void build_madt(GArray *table_data, BIOSLinker *linker,
+                MachineState *ms, AcpiConfiguration *conf);
+
+#endif
-- 
2.19.1


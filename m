Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4482077wro;
        Mon, 29 Oct 2018 10:11:25 -0700 (PDT)
X-Google-Smtp-Source: AJdET5elDTSyukQITzUJ3FW3dI4qcj/30k78q92Sd9/gvlW7GCOg5tc7QPMWhIt3wO/FOolSWHKF
X-Received: by 2002:ac8:18ed:: with SMTP id o42-v6mr14044798qtk.256.1540833084990;
        Mon, 29 Oct 2018 10:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540833084; cv=none;
        d=google.com; s=arc-20160816;
        b=J8aMjFHgu+IoUuj+ME4KeU5t/7KaBnH5sY7JzGjnZZqyAzdN/nsxMZwbZl5FkMHwy6
         tSKTMT9qq5DTQauTbtLse13vWBGVddxxCNqpgVNVK/oBPdTipF0LQK8I3S7qWH+1VUPL
         eXC+BmKdVqh6kLOZQ0gRGsitYNKxpe9HUCg2HHKyMGGavxhYpJ7wN8spvtOADurob9eW
         LPqeblxiIjsG2YnUAdeo8bkI+CN7fXI63CXUjIgYhuVZ73TVEVwodJSwi6kJIrw+SMZQ
         g6i5rd07FWYadBrM1ev4ZuLFoM74ELLf/TzrXRckBqLxaLU1XQRav0PajPaTYiniaSoo
         ZX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=UWXh3079dyyN3MBqYbUxrNwV0lKIPJcxD51REx+a3uA=;
        b=bDkU7Bo0pCqPqJaQ8A07gEUzG2tf3qTQDKx8nlLcnDLQ5e84alYj42i/Hu+cglTWPo
         fJOcG/GKTJQf+DpHye+rn1H9kRGLGGg4G4+vsUp8FciZgqYvHxrF/Yrdq6vmpS6NlyQ4
         LKdjW0JkRzqcVfEeo2DMuBvSI/zYjingzZviRCPqlRYjhY/nQ9mW0lHZFlH1oCBJCpj3
         OkFsay3ugDCo4woaM49LeAIoxuF+AJM1qi1PPV/PPSiTV4JNCiuxNrl3jW1u59LWWiae
         fA7XvCJzvOTYm2JUKFxtvaY+NtdsQOWFioQYV8z1PcZHaWm27ZtI2+uCLoLcaM/V2DWe
         I9TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p7-v6si3787071qte.210.2018.10.29.10.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 10:11:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHB4W-0007kW-BL
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 13:11:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAxI-0002KD-MS
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAxF-0004rw-CH
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:15363)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gHAxE-0004jD-VA; Mon, 29 Oct 2018 13:03:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2018 10:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,441,1534834800"; d="scan'208";a="276599103"
Received: from mjadwisz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.7.64])
	by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2018 10:03:48 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 18:01:58 +0100
Message-Id: <20181029170159.3801-19-sameo@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181029170159.3801-1-sameo@linux.intel.com>
References: <20181029170159.3801-1-sameo@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH v3 18/19] hw: i386: Export the MADT build method
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
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qi8mvGOetxt1

It is going to be used by the PC machine type as the MADT table builder
method and thus needs to be exported outside of acpi-build.c

Also, now that the generic build_madt() API is exported, we have to
rename the ARM static one in order to avoid build time conflicts.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/i386/acpi-build.c     |  3 ++-
 include/hw/i386/acpi.h   | 27 +++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/i386/acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 353aa55357..0c349e1c60 100644
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
index 9cb739bf5c..5035dac556 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -62,6 +62,7 @@
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/i386/acpi.h"
 
 #include "hw/acpi/ipmi.h"
 
@@ -281,7 +282,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
     }
 }
 
-static void
+void
 build_madt(GArray *table_data, BIOSLinker *linker,
            MachineState *ms, AcpiConfiguration *conf)
 {
diff --git a/include/hw/i386/acpi.h b/include/hw/i386/acpi.h
new file mode 100644
index 0000000000..53bf94c3ca
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
+#ifndef QEMU_I386_ACPI_H
+#define QEMU_I386_ACPI_H
+
+#include "hw/acpi/acpi.h"
+
+/* Build methods */
+void build_madt(GArray *table_data, BIOSLinker *linker,
+                MachineState *ms, AcpiConfiguration *conf);
+
+#endif
-- 
2.17.2


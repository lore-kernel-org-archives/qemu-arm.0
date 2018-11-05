Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2041606wro;
        Sun, 4 Nov 2018 18:00:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5cPKJzaMh4u5M2Grq0f6PHkfdMyMya+oEJuIsdFlb93ONnNjiGEDrr/JHPnMK4b1JrRZBn1
X-Received: by 2002:ac8:7119:: with SMTP id z25-v6mr19514815qto.270.1541383246438;
        Sun, 04 Nov 2018 18:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541383246; cv=none;
        d=google.com; s=arc-20160816;
        b=TNFwpGZeitWu45NzQDeQslZxMW14fTul66nv3wH+dvBfsAGJ3F4NXDfom7l3GV9JW4
         3WKWqEASdMq3dDLcpQlz5KTqZYMtsktp9tM4dptuyl+ay0UFISnreZILUek65X72N50M
         E0J2p1JzybJBiSUZywoPIQ8I0UCRW1hXU2GfsRyuJFJwW8eHdzwEQkmHnqM1qPrpMguO
         k9VUWd/gIpzdfB6gjuZZY/bkzsLk82pcfetyQMX9dTZGklPzhw1+WjDekYbcJhCyWnth
         hjUVrQ/ChQkLPdat4mmGyy4J/rYNFOwHbD+9RAGDD09DUawfriqO+xV5hlMRYRiC3VyP
         h4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zjKQfoqipuMwsLVRaMciJvlDPj52rATv8Ev80gIV/gQ=;
        b=gp4xaF8fGWWv6g0snr9SugoemF4p5b4HnvdO8iU0ua59mjKyS27UohFSvJrOetdDuC
         78+1goTYH0t3M7MZ4R/QYUBwnPD6z12RCNyBiTId9p+LhBJbZ8aHoPCDfDcggbMi/WPO
         uc91fDGYB1QUti2Fwt3Poq2bUhaTbtlj3uEryIeV/uXgbDsr3Otj7KcFwqOJXZ6RqCJe
         rxc97pcRrbbJqefiw4I2kYg5RwtmHfrUQQiV8hIGwhjXlgpbrlBYq3ASKovFrtPR2ybZ
         SvAdiiUkNazAlYrxh776prsXuCUT26c8w44Ofa7KtmUN54QNzJwrRW5LQ2YgT9XL7niM
         WGBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k38si3451272qvk.220.2018.11.04.18.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 18:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJUC5-0001q8-Pq
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 21:00:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvA-0008PB-Kw
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTv9-0003LM-EC
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:16 -0500
Received: from mga05.intel.com ([192.55.52.43]:26671)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTv9-0003Ia-2y; Sun, 04 Nov 2018 20:43:15 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074476"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:10 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:41 +0100
Message-Id: <20181105014047.26447-19-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH v5 18/24] hw: i386: Export the MADT build method
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
X-TUID: cHce/Crl2It2

It is going to be used by the PC machine type as the MADT table builder
method and thus needs to be exported outside of acpi-build.c

Also, now that the generic build_madt() API is exported, we have to
rename the ARM static one in order to avoid build time conflicts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/i386/acpi.h   | 28 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/i386/acpi-build.c     |  4 ++--
 3 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/i386/acpi.h

diff --git a/include/hw/i386/acpi.h b/include/hw/i386/acpi.h
new file mode 100644
index 0000000000..b7a887111d
--- /dev/null
+++ b/include/hw/i386/acpi.h
@@ -0,0 +1,28 @@
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
+#include "hw/acpi/bios-linker-loader.h"
+
+/* ACPI MADT (Multiple APIC Description Table) build method */
+void build_madt(GArray *table_data, BIOSLinker *linker,
+                MachineState *ms, AcpiConfiguration *conf);
+
+#endif
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b5e165543a..b0354c5f03 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -564,7 +564,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
 /* MADT */
 static void
-build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+virt_build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     int madt_start = table_data->len;
@@ -745,7 +745,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_madt(tables_blob, tables->linker, vms);
+    virt_build_madt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index bef5b23168..4b1d8fbe3f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -35,7 +35,6 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu.h"
 #include "hw/nvram/fw_cfg.h"
-#include "hw/acpi/bios-linker-loader.h"
 #include "hw/loader.h"
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
@@ -60,6 +59,7 @@
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/i386/acpi.h"
 
 #include "hw/acpi/ipmi.h"
 
@@ -279,7 +279,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
     }
 }
 
-static void
+void
 build_madt(GArray *table_data, BIOSLinker *linker,
            MachineState *ms, AcpiConfiguration *acpi_conf)
 {
-- 
2.19.1


Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2338865wrt;
        Thu, 29 Nov 2018 05:30:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WBlretswGxKsxCIFt5v5ixMmNZmgXhBWI5juoC1LKZXq8T6/I3GO3qLVAceJMqKewjUU8J
X-Received: by 2002:a81:e50d:: with SMTP id s13mr1279468ywl.405.1543498212777;
        Thu, 29 Nov 2018 05:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543498212; cv=none;
        d=google.com; s=arc-20160816;
        b=k2Mw04N9G+SBJbQUGIwsnQHHtpADD8ZjxMtM7uEzRgeX0lCnwDfibfyCHtob+VYyzc
         WV9A/wXK6iCWI0NnjuQuoykosRh5E3P5AEnhh2g6sPZS3AY2DPvai2yxSZcBXMH4X/pM
         7Bu2egUG9NeAS7Awj10d97Dgozmg9vFCoM2kWxekHv3VQ8jnhb8ccRCbvklsedr3YXPs
         2CxutXIGF4GyMWQlvy4ZYbNSYLA/lotqi77hWPnZ1BKwYFVQZ47lMYgGhupaYE3qlQBf
         QMy3hoNa1QwJH78QhLZKkTOX276p5npUOy5tFJh4AyNgtbPxeB8J1Z7qIAU5gPN0FNVK
         qR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=88Dgub4BY7zS9pvwKVZ3nxrkFy2RO/8xOt+Mzz1S6mo=;
        b=ABh/3hwh3EiJsrf+2umGT9eYxzr7qlwQUMEM2ZYdx/IZUH0pMsnYJXffVCKIImhYMj
         teg1vsv0SH68lkZyOI3wKXT9dHiBjkRGwhli5q2evOAf0jjaFKPPKAHDJ0HUt4J2Uw6f
         jlPW0m1HmxZv2Jt6IgebQ20utjvumh8ROBVWpuJRMJ9a9wVbQGJwA7eCsRV0+fOelNrc
         rWBRqyHNspGre6/A5NBvPZozMZlP7EILUdHrojdeXONJMzwGWqUHLjwbLWB/KoHTQd1f
         j67ZIHzRperwgCAUigZ12RNvcNRPX8BPZ6SDmt3jPSBuQZJU1cXIR+AY9gipDMCWhH5N
         4Rag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3-v6si1102559ybq.143.2018.11.29.05.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 05:30:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:54159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSMOS-0003yy-0G
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 08:30:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMJt-0000OP-D9
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 08:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMJs-000210-JJ
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 08:25:29 -0500
Received: from mga03.intel.com ([134.134.136.65]:30951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSMJq-0001hj-BG; Thu, 29 Nov 2018 08:25:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 05:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,294,1539673200"; d="scan'208";a="97547207"
Received: from hharjula-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.29.114])
	by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2018 05:25:21 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Nov 2018 14:24:24 +0100
Message-Id: <20181129132428.333-5-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181129132428.333-1-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-arm] [PATCH v2 4/8] hw: arm: Carry RSDP specific data through
 AcpiRsdpData
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23k+66F9HPTd

That will allow us to generalize the ARM build_rsdp() routine to support
both legacy RSDP (The current i386 implementation) and extended RSDP
(The ARM implementation).

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/acpi-defs.h |  8 ++++++++
 hw/arm/virt-acpi-build.c    | 18 +++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023968..8425ecb8c6 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -53,6 +53,14 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
 } QEMU_PACKED;
 typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
 
+typedef struct AcpiRsdpData {
+    uint8_t oem_id[6]; /* OEM identification */
+    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
+
+    unsigned *rsdt_tbl_offset;
+    unsigned *xsdt_tbl_offset;
+} AcpiRsdpData;
+
 /* Table structure from Linux kernel (the ACPI tables are under the
    BSD license) */
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0835900052..ce8bfa5a37 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static void
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
     unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
@@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
                              true /* fseg memory */);
 
     memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
-    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
+    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
     rsdp->length = cpu_to_le32(sizeof(*rsdp));
-    rsdp->revision = 0x02;
+    rsdp->revision = rsdp_data->revision;
 
     /* Address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
-        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
+        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
 
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
@@ -857,7 +857,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
 
     /* RSDP is in FSEG memory, so allocate it separately */
-    build_rsdp(tables->rsdp, tables->linker, xsdt);
+    {
+        AcpiRsdpData rsdp_data = {
+            .revision = 2,
+            .oem_id = ACPI_BUILD_APPNAME6,
+            .xsdt_tbl_offset = &xsdt,
+            .rsdt_tbl_offset = NULL,
+        };
+        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
+    }
 
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
-- 
2.19.2


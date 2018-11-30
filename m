Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3556623wrt;
        Fri, 30 Nov 2018 05:09:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UsP1O8jbweJxePX3ZZCUw2x1ShtO3gruXCGIBVdeJe6JfaqJIwS2g45IjOGsmFeJD4lh4Z
X-Received: by 2002:a81:a1c2:: with SMTP id y185mr5338394ywg.323.1543583375276;
        Fri, 30 Nov 2018 05:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543583375; cv=none;
        d=google.com; s=arc-20160816;
        b=k9LlXW5KqM8A+crMMuRD95ywcSBE33KlRm8Pj7zI9t78kwPJVnbBKoBpcgE3oTimyO
         Ga/7/OYqijxiQseXZcutdHWjEwQqmhVQ3R7/9QJY02hiu70O1IthsIRoeh33gmY7qgX6
         /TC3J9171JnnV38yceU+AnehHsEvhxb4XoNQibu/GK3zAMFdd6GKcwfXOYzrNCG9DKXs
         qhahuEJ1vgo+7IYozkQjNSLXaynp6oPkXFFVTvUThuhvbMgny4MvqMQkeArAGh5vq6gg
         OqqkVzwrd3/S5oCX9ReNNSYDMgnduhWdq/LP6b3sOqfba5bGi1L3tLby1x5zDSJ/wT7L
         rQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+E5MFF0AJirNWo+febO5CUxBDONJ4hhczLAGjCRIAKI=;
        b=XqFxuu2H8m4ikvC/K/TIt1IHGCIgMiU/C0qY3vNBxAT10KBcmvBrJlHhmFUz7SBz7a
         4tSacixTGO9LRcV8g3AQuQJ0CdFeGs7JhXU/7p3z4BLkylegD/0fuc8a4j7Pxlig6IPF
         8DHD44lFKX0RVthxlE0DX28RkElvsn3bF9EXJ7w7HvxJTfYwd9+/o1cDKIP67UmCLIio
         ZWDfSPSYTNy/cepQ5nldpmPh7yZldnKktwdw9bbw1owURfbgSNqKwHXtUcYK2IJZDKW7
         ADTKBYoSaW6f99CEycDjH5/YcTQ2MPpa4C4xWgmrXysd6th8ziIa044bGDueQL3/t+tS
         JvsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 185si2973155ywa.37.2018.11.30.05.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiY2-00037C-KU
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:09:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQO-00049j-Kg
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQE-0004wl-Em
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:40 -0500
Received: from mga09.intel.com ([134.134.136.24]:51037)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiQE-0004tV-0M; Fri, 30 Nov 2018 08:01:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293507769"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:24 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:28 +0100
Message-Id: <20181130130032.11835-5-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130130032.11835-1-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v3 4/8] hw: arm: Carry RSDP specific data
 through AcpiRsdpData
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gke2t31OKRbE

That will allow us to generalize the ARM build_rsdp() routine to support
both legacy RSDP (The current i386 implementation) and extended RSDP
(The ARM implementation).

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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


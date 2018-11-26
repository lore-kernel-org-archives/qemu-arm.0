Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5802018wrt;
        Mon, 26 Nov 2018 08:31:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5cdaDDQ391D9boPkPEmB6UE3Z+EUngVdOwXCIVGAWQ5FKeTf96I4uD9wLiGLHWpOW2FvCxc
X-Received: by 2002:ac8:962:: with SMTP id z31mr26104766qth.305.1543249875184;
        Mon, 26 Nov 2018 08:31:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543249875; cv=none;
        d=google.com; s=arc-20160816;
        b=cB4IgpAYakCgk5BvFsdIURIGrqzzQizisHi7uf6SzdJYo+UyphuZi7NapEVlkoASXA
         qAmAOn3/SMvqUmhc7GttAAC8VDan7HdBZZzHrL/66r71S5LnO4Anja2WdfSVqMDAH9Lc
         XDgmOPs0PVSSeAygkkcPbSkHzBU7Cz86+6bNjgwxefSVZhKyBaM1ZBW4tzc89Ax8YEBY
         zH41hle6kKFwOk60zI0Y+B7VNMZ2F8OU76K1LJ2+eOfsTh0v4rUJojDEdpScktOjke9s
         i9r9/waIYDoZj3E3Uyb4jjtWN5OdF3BeLXQnLcAQ++rAMSFUxmrK5M9PQQwD8JG0B77J
         sz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PU5dJ0hXjuSk8VIRWMRFmiTrAIJ53drNTqNR8ftQr4A=;
        b=OCtgfe1wd6BtbrFSypenCI6SBhaTWBRPk23NkYwnSeqqMsQhfbvoBkFoBbfg+ROmBi
         J5jgO/HgfItYMQ1MRCYN55bB8XxtOrySW7SjnwLlPHQozNolk6i87EVAETphLJFUsVYC
         lZ5clXqYl+Idzkc4kUChFNBcwcSna5pAlVFjCibjh4tUvgeWI1NX5tujdBf/+tfb07AC
         56ZcqiuFtBRHg23+juNWRzUvlMGWFLzwkxAqJPkzug7VpLGQNk8XXeB6xM+Jdj9LJYxx
         t4N1SyaF+149tEaIMQ689zP8+8woaakrlNYZOVSI+eeNyEp0jrxT+/DsxZh64MPsZBV/
         ioBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si629750qto.84.2018.11.26.08.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 08:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:37519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJn0-000131-Cr
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 11:31:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJme-0000wG-5V
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 11:30:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmd-0004aq-AH
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 11:30:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:54537)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRJma-0004YC-7w; Mon, 26 Nov 2018 11:30:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2018 08:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,283,1539673200"; d="scan'208";a="90954243"
Received: from sunandos-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.82.176])
	by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2018 08:30:44 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Nov 2018 17:29:38 +0100
Message-Id: <20181126162942.21258-6-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126162942.21258-1-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-arm] [PATCH 5/8] hw: arm: Convert the RSDP build to the
 buid_append_foo() API
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
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PhLDC1Zix9mu

build_rsdp() is now closely following the ACPI spec instead of filling a
mapped and packed C structure.
With this change we will eventually be able to get rid of the
AcpiRsdpDescriptor structure as we're just appending values to the RSDP
file directly and not mapping this structure in memory any more.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/acpi-defs.h | 22 ++++++++++++++
 hw/arm/virt-acpi-build.c    | 60 ++++++++++++++++++++++++-------------
 2 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index e7fd24c6c5..9b2f6b8043 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -61,9 +61,31 @@ typedef struct AcpiRsdpData {
     unsigned *xsdt_tbl_offset;
 } AcpiRsdpData;
 
+/* RSDP signature */
+#define ACPI_RSDP_SIGNATURE "RSD PTR "
+
+/* RSDP Revisions */
 #define ACPI_RSDP_REV_1 0
 #define ACPI_RSDP_REV_2 2
 
+/* RSDP lengths */
+#define ACPI_RSDP_REV_1_LEN    20
+#define ACPI_RSDP_REV_2_LEN    36
+#define ACPI_RSDP_SIG_LEN      8
+#define ACPI_RSDP_OEMID_LEN    6
+#define ACPI_RSDP_REVISION_LEN 1
+#define ACPI_RSDP_LEN_LEN      4
+#define ACPI_RSDP_CHECKSUM_LEN 1
+#define ACPI_RSDP_RESERVED_LEN 3
+
+/* RSDP offsets */
+#define ACPI_RSDP_CHECKSUM_OFFSET     8
+#define ACPI_RSDP_REVISION_OFFSET     15
+#define ACPI_RSDP_RSDT_OFFSET         16
+#define ACPI_RSDP_XSDT_OFFSET         24
+#define ACPI_RSDP_EXT_CHECKSUM_OFFSET 32
+
+
 /* Table structure from Linux kernel (the ACPI tables are under the
    BSD license) */
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2dad465ecf..d47978a55e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -368,35 +368,53 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static void
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
+build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 {
-    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
-    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
-    unsigned xsdt_pa_offset =
-        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
-
-    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
+    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
                              true /* fseg memory */);
 
-    memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
-    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
-    rsdp->length = cpu_to_le32(sizeof(*rsdp));
-    rsdp->revision = rsdp_data->revision;
+    /* RSDP signature */
+    g_array_append_vals(tbl, ACPI_RSDP_SIGNATURE, ACPI_RSDP_SIG_LEN);
+
+    /* Space for the checksum */
+    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
+
+    /* OEM ID */
+    g_array_append_vals(tbl, rsdp_data->oem_id, ACPI_RSDP_OEMID_LEN);
+
+    /* Revision */
+    build_append_int_noprefix(tbl, rsdp_data->revision,
+                              ACPI_RSDP_REVISION_LEN);
 
-    /* Address to be filled by Guest linker */
+    /* Space for the RSDT address (32 bit) */
+    build_append_int_noprefix(tbl, 0, 4);
+
+    /* Length */
+    build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
+
+    /* XSDT address to be filled by guest linker */
+    build_append_int_noprefix(tbl, 0, 8); /* XSDT address (64 bit) */
     bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
-        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
+                                   ACPI_BUILD_RSDP_FILE,
+                                   ACPI_RSDP_XSDT_OFFSET, 8,
+                                   ACPI_BUILD_TABLE_FILE,
+                                   *rsdp_data->xsdt_tbl_offset);
+
+    /* Space for the extended checksum */
+    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
+
+    /* Space for the reserved bytes */
+    build_append_int_noprefix(tbl, 0, ACPI_RSDP_RESERVED_LEN);
 
-    /* Checksum to be filled by Guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
-        (char *)&rsdp->checksum - rsdp_table->data);
+    /* Checksum to be filled by guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
+                                    ACPI_RSDP_REV_1_LEN,
+                                    ACPI_RSDP_CHECKSUM_OFFSET);
 
     /* Extended checksum to be filled by Guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
-        (char *)&rsdp->extended_checksum - rsdp_table->data);
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
+                                    ACPI_RSDP_REV_2_LEN,
+                                    ACPI_RSDP_EXT_CHECKSUM_OFFSET);
 }
 
 static void
-- 
2.19.1


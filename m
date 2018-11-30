Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3551319wrt;
        Fri, 30 Nov 2018 05:05:22 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xe4kx5Gi2tKACaXiS360YwNIAQ6zHCesl8kELYDC3axCa6Qw6qRv/tbES1losqiHgVcN08
X-Received: by 2002:a25:8701:: with SMTP id a1-v6mr5166182ybl.133.1543583122161;
        Fri, 30 Nov 2018 05:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543583122; cv=none;
        d=google.com; s=arc-20160816;
        b=mxpXVSF1C3f33n9ZLLRChVCN3Av8KhNpd9lrop6aur3XMNbZrwTLqhmdp7EGyimNxT
         tagPzeF/JH5+CJl9oqBiZzkxco/cDivzvtpZ/qAPvuwHX+ybtrLaDPDPASZgjNzonacm
         nXTBYv5qJk18gkx37xG4Re762CORmwniw5fdEe+YRnO4OTccf+VmxDh5K1INjR6xVgcU
         QaWIWIHkuStlNWgLBQddozdSbXu8dMBHB0J6+fw2wTab9AZNz4s9Udua2RgsZpJRJ6Zu
         rJSCeZZJSxBTfhl6G3Lbi2fPYe4OxAA7PTOJOudWJ9DU+NfYOPToHb4e/WK1Q8Mx3A5x
         jutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kl2GPwUDt/uT63qqIpNJ22dwFnUR8PKv8uzCj6D3XnU=;
        b=qq4tSbMzLSWQlq/f4COU6w45lo+Yv8KHKGmJEbAzhxWr2e3xeWf+Ozt5I+HkSEgnxj
         NWGCdb0xHwaGEXN2ZMCN0SKtOi3D2LQQnS8TXF9segxI3tEV/EzXPikd3dDweHgU4Mtq
         mu1RtscUH1RSYqlSlHQt+tYQ+4I5hC5bpUvDe90fMXAfDqUgqaMX+848I8xYyZeZpFVH
         mKxVCVHmBkP1pX3uOFHIXm7Sh5CAQPvghM8P611SbIcV6LHZikRdYXGQwiZgaKGatYiT
         PztT5ZwyMHBJ91u8YLt/kSZ0f3cgwkKffe3bo+nO0a20kLYmkn/jkSG5wkuAHO7mKomT
         k+lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j187si3018492ywb.417.2018.11.30.05.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiTx-00088a-Fy
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:05:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQz-0004cq-Ns
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 08:02:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQv-0005mS-Et
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 08:02:17 -0500
Received: from mga07.intel.com ([134.134.136.100]:58517)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiQY-0005Np-TX; Fri, 30 Nov 2018 08:01:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293511018"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:42 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:32 +0100
Message-Id: <20181130130032.11835-9-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130130032.11835-1-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: [Qemu-arm] [PATCH v3 8/8] hw: acpi: Remove AcpiRsdpDescriptor and
 fix tests
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
X-TUID: pdpUSH/S8P4E

The only remaining AcpiRsdpDescriptor users are the ACPI utils for the
BIOS table tests.
We remove that dependency and can thus remove the structure itself.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/acpi-defs.h | 13 -----------
 tests/acpi-utils.h          |  4 +++-
 tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++++-------
 tests/bios-tables-test.c    | 21 +++++++++++++----
 tests/vmgenid-test.c        |  8 ++++---
 5 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 8425ecb8c6..5021cb9e79 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -40,19 +40,6 @@ enum {
     ACPI_FADT_F_LOW_POWER_S0_IDLE_CAPABLE,
 };
 
-struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
-    uint64_t signature;              /* ACPI signature, contains "RSD PTR " */
-    uint8_t  checksum;               /* To make sum of struct == 0 */
-    uint8_t  oem_id [6];             /* OEM identification */
-    uint8_t  revision;               /* Must be 0 for 1.0, 2 for 2.0 */
-    uint32_t rsdt_physical_address;  /* 32-bit physical address of RSDT */
-    uint32_t length;                 /* XSDT Length in bytes including hdr */
-    uint64_t xsdt_physical_address;  /* 64-bit physical address of XSDT */
-    uint8_t  extended_checksum;      /* Checksum of entire table */
-    uint8_t  reserved [3];           /* Reserved field must be 0 */
-} QEMU_PACKED;
-typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
-
 typedef struct AcpiRsdpData {
     uint8_t oem_id[6]; /* OEM identification */
     uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
diff --git a/tests/acpi-utils.h b/tests/acpi-utils.h
index ac52abd0dd..4f4899deb5 100644
--- a/tests/acpi-utils.h
+++ b/tests/acpi-utils.h
@@ -82,6 +82,8 @@ typedef struct {
 
 uint8_t acpi_calc_checksum(const uint8_t *data, int len);
 uint32_t acpi_find_rsdp_address(void);
-void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table);
+uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table);
+uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table);
+void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table);
 
 #endif  /* TEST_ACPI_UTILS_H */
diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
index 41dc1ea9b4..d07f7487e2 100644
--- a/tests/acpi-utils.c
+++ b/tests/acpi-utils.c
@@ -52,14 +52,44 @@ uint32_t acpi_find_rsdp_address(void)
     return off;
 }
 
-void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table)
+uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table)
 {
-    ACPI_READ_FIELD(rsdp_table->signature, addr);
-    ACPI_ASSERT_CMP64(rsdp_table->signature, "RSD PTR ");
+    uint32_t rsdt_physical_address;
 
-    ACPI_READ_FIELD(rsdp_table->checksum, addr);
-    ACPI_READ_ARRAY(rsdp_table->oem_id, addr);
-    ACPI_READ_FIELD(rsdp_table->revision, addr);
-    ACPI_READ_FIELD(rsdp_table->rsdt_physical_address, addr);
-    ACPI_READ_FIELD(rsdp_table->length, addr);
+    memcpy(&rsdt_physical_address, &rsdp_table[16 /* RsdtAddress offset */], 4);
+    return le32_to_cpu(rsdt_physical_address);
+}
+
+uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table)
+{
+    uint64_t xsdt_physical_address;
+    uint8_t revision = rsdp_table[15 /* Revision offset */];
+
+    /* We must have revision 2 if we're looking for an XSDT pointer */
+    g_assert(revision == 2);
+
+    memcpy(&xsdt_physical_address, &rsdp_table[24 /* XsdtAddress offset */], 8);
+    return le64_to_cpu(xsdt_physical_address);
+}
+
+void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table)
+{
+    uint8_t revision;
+
+    /* Read mandatory revision 0 table data (20 bytes) first */
+    memread(addr, rsdp_table, 20);
+    revision = rsdp_table[15 /* Revision offset */];
+
+    switch (revision) {
+    case 0: /* ACPI 1.0 RSDP */
+        break;
+    case 2: /* ACPI 2.0+ RSDP */
+        /* Read the rest of the RSDP table */
+        memread(addr + 20, rsdp_table + 20, 16);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    ACPI_ASSERT_CMP64(*((uint64_t *)(rsdp_table)), "RSD PTR ");
 }
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index d661d9be62..8749b77b36 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -27,7 +27,7 @@ typedef struct {
     const char *machine;
     const char *variant;
     uint32_t rsdp_addr;
-    AcpiRsdpDescriptor rsdp_table;
+    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
     AcpiRsdtDescriptorRev1 rsdt_table;
     uint32_t dsdt_addr;
     uint32_t facs_addr;
@@ -85,19 +85,30 @@ static void test_acpi_rsdp_address(test_data *data)
 
 static void test_acpi_rsdp_table(test_data *data)
 {
-    AcpiRsdpDescriptor *rsdp_table = &data->rsdp_table;
+    uint8_t *rsdp_table = data->rsdp_table, revision;
     uint32_t addr = data->rsdp_addr;
 
     acpi_parse_rsdp_table(addr, rsdp_table);
+    revision = rsdp_table[15 /* Revision offset */];
 
-    /* rsdp checksum is not for the whole table, but for the first 20 bytes */
-    g_assert(!acpi_calc_checksum((uint8_t *)rsdp_table, 20));
+    switch (revision) {
+    case 0: /* ACPI 1.0 RSDP */
+        /* With rev 1, checksum is only for the first 20 bytes */
+        g_assert(!acpi_calc_checksum(rsdp_table,  20));
+        break;
+    case 2: /* ACPI 2.0+ RSDP */
+        /* With revision 2, we have 2 checksums */
+        g_assert(!acpi_calc_checksum(rsdp_table, 20));
+        g_assert(!acpi_calc_checksum(rsdp_table, 36));
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static void test_acpi_rsdt_table(test_data *data)
 {
     AcpiRsdtDescriptorRev1 *rsdt_table = &data->rsdt_table;
-    uint32_t addr = le32_to_cpu(data->rsdp_table.rsdt_physical_address);
+    uint32_t addr = acpi_get_rsdt_address(data->rsdp_table);
     uint32_t *tables;
     int tables_nr;
     uint8_t checksum;
diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
index 0a6fb55f2e..97219ae86c 100644
--- a/tests/vmgenid-test.c
+++ b/tests/vmgenid-test.c
@@ -35,7 +35,7 @@ static uint32_t acpi_find_vgia(void)
 {
     uint32_t rsdp_offset;
     uint32_t guid_offset = 0;
-    AcpiRsdpDescriptor rsdp_table;
+    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
     uint32_t rsdt, rsdt_table_length;
     AcpiRsdtDescriptorRev1 rsdt_table;
     size_t tables_nr;
@@ -52,9 +52,11 @@ static uint32_t acpi_find_vgia(void)
 
     g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
 
-    acpi_parse_rsdp_table(rsdp_offset, &rsdp_table);
+    acpi_parse_rsdp_table(rsdp_offset, rsdp_table);
+
+    rsdt = acpi_get_rsdt_address(rsdp_table);
+    g_assert(rsdt);
 
-    rsdt = le32_to_cpu(rsdp_table.rsdt_physical_address);
     /* read the header */
     ACPI_READ_TABLE_HEADER(&rsdt_table, rsdt);
     ACPI_ASSERT_CMP(rsdt_table.signature, "RSDT");
-- 
2.19.2


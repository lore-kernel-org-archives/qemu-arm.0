Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2342968wrt;
        Thu, 29 Nov 2018 05:33:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UK2QAqEW2KeYv9foUgrHgkBKVplQ38mQ/wAKib08D3GWssGb8Ht2VAaD9rwUDiFviLMCVw
X-Received: by 2002:a25:c690:: with SMTP id k138-v6mr1240322ybf.5.1543498428211;
        Thu, 29 Nov 2018 05:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543498428; cv=none;
        d=google.com; s=arc-20160816;
        b=aZoFnCAua9etNxJrcXl3jGQfc8lMHGcu8J/Ibjw90SA5FcbRvQiXPRkZUvMas5IU8O
         7oeLjnqn3epKTdtsgTzWO65SY7GHiH0Fn45VMuOZjAwJHLxRKGbWrQrheFu9J6uKD/Rr
         L7jdMpFvyVOZER+zZOYKu+PMe7gX4X0+mpW8+UV686sGIhGUcKkymm120emdMt9s3ywB
         WCFeOxB2PhtahtPXeYdp8S9guw6cR8jCvudT3W2en3LPI5xmb7tdlsprxbE4JAspDgEk
         tHeOq4JQFwqalgMgcZs/6VRQDwHB6qyUBAn/v7wtMjbdV6SoWl3hyFEkFagv+jIAjFXN
         Fe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4WmHaPr4yJGUXdAQ5vsYgQNUEimxRxxzdzOHUaLemYA=;
        b=UnTOKKEtfJz7vQ1g1SdER+uJJ7jSuvFLrkNIftfdMBkI73ugGDiW59OFmgPonFtX2X
         3wHNdEhjjKf8PvP5hY5dGbKbBHvVKad/ZXJ974bvs3irgR9aPNZrQJ8L60Ozk+IyEKsh
         2d8p/pWm2WFigjp2BtjGdLibT3EpBfRIsglRPlke+FlF4IHTWFXfP4ubCxxjuHtPi/UP
         XZ96mUGybMKUG+pFBHP3nlGdbXtVfPDt/P6qp7Siw4fCBywSU8pGnYKnVD4egSJHPCnX
         1ROIpAqRs8XxOX/JfmjU4t6ao5ER0FdtkFsg4ajBaiPlC3s3YeiW229+0tqBkW715cwu
         Beiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a187si1104340ywb.42.2018.11.29.05.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 05:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:54177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSMRu-00062y-Qo
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 08:33:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMKG-0000li-Jk
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 08:25:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMKC-0002q2-Qp
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 08:25:52 -0500
Received: from mga03.intel.com ([134.134.136.65]:30951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSMKB-0001hj-0d; Thu, 29 Nov 2018 08:25:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 05:25:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,294,1539673200"; d="scan'208";a="97547241"
Received: from hharjula-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.29.114])
	by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2018 05:25:40 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Nov 2018 14:24:28 +0100
Message-Id: <20181129132428.333-9-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181129132428.333-1-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH v2 8/8] hw: acpi: Remove AcpiRsdpDescriptor and
 fix tests
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
X-TUID: PDeqQx0GeNvI

The only remaining AcpiRsdpDescriptor users are the ACPI utils for the
BIOS table tests.
We remove that dependency and can thus remove the structure itself.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/acpi-defs.h | 13 -----------
 tests/acpi-utils.h          |  5 +++-
 tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++++-------
 tests/bios-tables-test.c    | 27 +++++++++++++++-------
 tests/vmgenid-test.c        |  8 ++++---
 5 files changed, 66 insertions(+), 33 deletions(-)

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
index ac52abd0dd..c26c8976a6 100644
--- a/tests/acpi-utils.h
+++ b/tests/acpi-utils.h
@@ -82,6 +82,9 @@ typedef struct {
 
 uint8_t acpi_calc_checksum(const uint8_t *data, int len);
 uint32_t acpi_find_rsdp_address(void);
-void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table);
+uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table);
+uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table);
+void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table,
+                           uint8_t revision);
 
 #endif  /* TEST_ACPI_UTILS_H */
diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
index 41dc1ea9b4..b1113bda8b 100644
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
+    uint8_t revision = rsdp_table[15 /* Revision offset */];
 
-    ACPI_READ_FIELD(rsdp_table->checksum, addr);
-    ACPI_READ_ARRAY(rsdp_table->oem_id, addr);
-    ACPI_READ_FIELD(rsdp_table->revision, addr);
-    ACPI_READ_FIELD(rsdp_table->rsdt_physical_address, addr);
-    ACPI_READ_FIELD(rsdp_table->length, addr);
+    if (revision != 0) { /* ACPI 1.0 RSDP */
+        return 0;
+    }
+
+    memcpy(&rsdt_physical_address, &rsdp_table[16 /* RsdtAddress offset */], 4);
+    return le32_to_cpu(rsdt_physical_address);
+}
+
+uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table)
+{
+    uint64_t xsdt_physical_address;
+    uint8_t revision = rsdp_table[15 /* Revision offset */];
+
+    if (revision != 2) { /* ACPI 2.0+ RSDP */
+        return 0;
+    }
+
+    memcpy(&xsdt_physical_address, &rsdp_table[24 /* XsdtAddress offset */], 8);
+    return le64_to_cpu(xsdt_physical_address);
+}
+
+void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table, uint8_t revision)
+{
+    switch (revision) {
+    case 0: /* ACPI 1.0 RSDP */
+        memread(addr, rsdp_table, 20);
+        break;
+    case 2: /* ACPI 2.0+ RSDP */
+        memread(addr, rsdp_table, 36);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    ACPI_ASSERT_CMP64(*((uint64_t *)(rsdp_table)), "RSD PTR ");
 }
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index d661d9be62..84f1500920 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -27,7 +27,8 @@ typedef struct {
     const char *machine;
     const char *variant;
     uint32_t rsdp_addr;
-    AcpiRsdpDescriptor rsdp_table;
+    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
+    uint32_t rsdt_physical_address;
     AcpiRsdtDescriptorRev1 rsdt_table;
     uint32_t dsdt_addr;
     uint32_t facs_addr;
@@ -83,21 +84,31 @@ static void test_acpi_rsdp_address(test_data *data)
     data->rsdp_addr = off;
 }
 
-static void test_acpi_rsdp_table(test_data *data)
+static void test_acpi_rsdp_table(test_data *data, uint8_t revision)
 {
-    AcpiRsdpDescriptor *rsdp_table = &data->rsdp_table;
+    uint8_t *rsdp_table = data->rsdp_table;
     uint32_t addr = data->rsdp_addr;
 
-    acpi_parse_rsdp_table(addr, rsdp_table);
+    acpi_parse_rsdp_table(addr, rsdp_table, revision);
 
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
@@ -626,7 +637,7 @@ static void test_acpi_one(const char *params, test_data *data)
 
     data->tables = g_array_new(false, true, sizeof(AcpiSdtTable));
     test_acpi_rsdp_address(data);
-    test_acpi_rsdp_table(data);
+    test_acpi_rsdp_table(data, 0); /* ACPI 1.0 RSDP */
     test_acpi_rsdt_table(data);
     fadt_fetch_facs_and_dsdt_ptrs(data);
     test_acpi_facs_table(data);
diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
index 0a6fb55f2e..5f30dee059 100644
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
+    acpi_parse_rsdp_table(rsdp_offset, rsdp_table, 0);
+
+    rsdt = acpi_get_rsdt_address(rsdp_table);
+    g_assert(rsdt);
 
-    rsdt = le32_to_cpu(rsdp_table.rsdt_physical_address);
     /* read the header */
     ACPI_READ_TABLE_HEADER(&rsdt_table, rsdt);
     ACPI_ASSERT_CMP(rsdt_table.signature, "RSDT");
-- 
2.19.2


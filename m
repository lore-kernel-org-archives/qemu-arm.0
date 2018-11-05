Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2036222wro;
        Sun, 4 Nov 2018 17:52:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5dMhccrf2JXoAGT+s373859+WsVNDcV7LEqPoXBDmQSjEqMgCf6K9OvT1spLbBe78dwWaKj
X-Received: by 2002:a37:4a87:: with SMTP id x129mr18521845qka.142.1541382735276;
        Sun, 04 Nov 2018 17:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382735; cv=none;
        d=google.com; s=arc-20160816;
        b=dPTkaYl/qJ3/ge4K8mJ+u69/GQ19KO8MrGOesv9FlC0C0i3zdAEeSEzzty0xKbwyVu
         0OIZnrtu8T2ZDwZT1KfS0UizSLKj/PE/jdeJp2HuFIU6RTdneXqDkXOewm+xRFcnCYfv
         2EiURaBv63vNkRQfnLJqW2oXYqw90O3f75E0F8flF2MgRmdFqEclN0ITQffY7gZDVGqQ
         B2tIEXx7RA5vBnRPmpRBKeo6UgB0QzVBYK3hOHEpQ/qgRtv0eLDoNdb+FC61Ewc1fk/a
         8JJlRJnRn4MvhDQAjmzgSbvfim54GSSSGts+FZKMoOZesh5m6WvEYuZh/26AXw4ACtcT
         5zpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0gEahyjWLRVb5RsiyG78Rqn0HYCroPUOA/aZRFw/ScA=;
        b=bp5q55t8HDzT67/KrV++I88kEHV8QOSWbjIGboTpH1Zd6jC2OxhN+gmKTJJ0w0SUjj
         nuB62KMeGLARw8oT6hIg0yz6NCfzChGl2TxTtcMAYrdivxg5Rjd1gREs+q97LZ9MaWU7
         qgeXdsc8P/rROa1smenWR8j7QTYYPqnC5DOI8SLiAzzaP6pKJj8I0EHfBPTO6Am1f5Eu
         C2X/U6ymcKv2rV3lIbIEgqNf+o8c5ToV0qVNpErkG+1RQHa4fJcGj4FFyfkTBma1b6Xw
         ywIn9xVt59BjoYwyVezVw+2+rhcTa2SBUtVQJBU0gLAKYixgNV+52aZCaL1axxTPxQaQ
         H5Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si6139579qvr.172.2018.11.04.17.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU3q-0008IR-Mj
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:52:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTu2-0006Eb-GC
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTu1-0001lv-La
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:06 -0500
Received: from mga07.intel.com ([134.134.136.100]:31881)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTtz-0001ds-Ag; Sun, 04 Nov 2018 20:42:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074281"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:41:58 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:28 +0100
Message-Id: <20181105014047.26447-6-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement XSDT support for
 RSDP
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
X-TUID: bJt9+ZUeAzh1

XSDT is the 64-bit version of the legacy ACPI RSDT (Root System
Description Table). RSDT only allow for 32-bit addressses and have thus
been deprecated. Since ACPI version 2.0, RSDPs should point at XSDTs and
no longer RSDTs, although RSDTs are still supported for backward
compatibility.

Since version 2.0, RSDPs should add an extended checksum, a complete table
length and a version field to the table.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/aml-build.h |  3 +++
 hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index c9bcb32d81..3580d0ce90 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -393,6 +393,9 @@ void
 build_rsdp(GArray *table_data,
            BIOSLinker *linker, unsigned rsdt_tbl_offset);
 void
+build_rsdp_xsdt(GArray *table_data,
+                BIOSLinker *linker, unsigned xsdt_tbl_offset);
+void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 void
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 51b608432f..a030d40674 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1651,6 +1651,43 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
                  (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
 }
 
+/* RSDP pointing at an XSDT */
+void
+build_rsdp_xsdt(GArray *rsdp_table,
+                BIOSLinker *linker, unsigned xsdt_tbl_offset)
+{
+    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
+    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
+    unsigned xsdt_pa_offset =
+        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
+    unsigned xsdt_offset =
+        (char *)&rsdp->length - rsdp_table->data;
+
+    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
+                             true /* fseg memory */);
+
+    memcpy(&rsdp->signature, "RSD PTR ", 8);
+    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
+    rsdp->length = cpu_to_le32(sizeof(*rsdp));
+    /* version 2, we will use the XSDT pointer */
+    rsdp->revision = 0x02;
+
+    /* Address to be filled by Guest linker */
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
+        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
+
+    /* Legacy checksum to be filled by Guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+        (char *)rsdp - rsdp_table->data, xsdt_offset,
+        (char *)&rsdp->checksum - rsdp_table->data);
+
+    /* Extended checksum to be filled by Guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
+        (char *)&rsdp->extended_checksum - rsdp_table->data);
+}
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags)
 {
-- 
2.19.1


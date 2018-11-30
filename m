Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3547475wrt;
        Fri, 30 Nov 2018 05:02:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WqOy+PJQZ2H6Q2hNhh0ekWkN+SPcAg2GWgfIPzeUPo0+gt3t+OT/EtDjQSsgBj0wmcmFUY
X-Received: by 2002:a81:ec12:: with SMTP id j18mr5423283ywm.17.1543582941847;
        Fri, 30 Nov 2018 05:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543582941; cv=none;
        d=google.com; s=arc-20160816;
        b=MMd2bF5fVcrDPMTqwZ+E6Fnx32jv2IEBq7ldngY2w83o4jJroFBZSrPmrLS0AYO3WH
         DfEyKmuo5BsY97eUkZP2JeKn2cedegbZnp0zhOKFf5ccJFqcT/hLjsg6nIRsghng/+ut
         uPNH0/utNnnayOCpHLfeUa79t+WyxY2OEDxbdeYTKKu8peBSAIGuXvauRMDSsOSfKGyx
         XAomePHdwk+3mU2mnqtV2tEUHU1WwE5Pd6FEf1Ix7/9i+jXBcoOLhHd+jFrEYT65STqF
         qbEnPxkgiLutVvrcrQTqcaZN3NX43Xp0HCnG6yskksafsUJRpwP7WlnXa+r1HoWt5wJP
         MSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gWxK1Xw55GfTyyVKAcxh6Y6Hwi2eEbmX+L8xg3FuKrQ=;
        b=BvOq6CyjlQHK3BAwBe6WLqAS4vNkv4QSp7fbqi67ujZm9S6Iz3fJJx0XWsXcqInXmT
         fJD92JaUc+crHDI7GzU0D3AQYoGYvszWdUznBgxkLdvdAwElWvb6DoqCsnkC+wiggErS
         ktWx/S9DxRUtwiKOIP/hflmlP8v5oxk69eud6bx5SIkX6zDr0hQ3I64vN8JRr0T3AIR6
         QPKTUQPzF0zE8hglE7uOn7RtOVSSbTUHKjaJVTw621f4dPZkdAUOq796fG4yp08Ji1jD
         vHK/mhKunBzVylk3LakQmooEeloW517qPcsBr1+hitRkNqPY9xjeEDqIcvlxwhBX8sOl
         aVxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3-v6si2927614ybq.143.2018.11.30.05.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiR2-0004E1-TM
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:02:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQH-00042v-S5
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQE-0004x9-OD
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:51030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiQE-0004qM-EQ; Fri, 30 Nov 2018 08:01:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293507397"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:21 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:27 +0100
Message-Id: <20181130130032.11835-4-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130130032.11835-1-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v3 3/8] hw: i386: Use correct RSDT length for
 checksum
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
X-TUID: 2C69NANRp1mN

From: Igor Mammedov <imammedo@redhat.com>

AcpiRsdpDescriptor describes revision 2 RSDP table so using sizeof(*rsdp)
for checksum calculation isn't correct since we are adding extra 16 bytes.
But acpi_data_push() zeroes out table, so just by luck we are summing up
exta zeros which still yelds correct checksum.

Fix it up by explicitly stating table size instead of using
pointer arithmetics on stucture.

PS:
Extra 16 bytes are still wasted, but droping them will break migration
for machines older than 2.3 due to size mismatch, for 2.3 and older it's
not an issue since they are using resizable memory regions (a1666142d)
for ACPI blobs. So keep wasting memory to avoid breaking old machines.

Fixes: 72c194f7e (i386: ACPI table generation code from seabios)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/i386/acpi-build.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 35f17d0d91..fb877648ac 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2550,6 +2550,11 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
 static void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 {
+    /* AcpiRsdpDescriptor describes revision 2 RSDP table and as result we
+     * allocate extra 16 bytes for pc/q35 RSDP rev1 as well. Keep extra 16 bytes
+     * wasted to make sure we won't breake migration for machine types older
+     * than 2.3 due to size mismatch.
+     */
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
     unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
     unsigned rsdt_pa_offset =
@@ -2567,7 +2572,7 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
+        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
         (char *)&rsdp->checksum - rsdp_table->data);
 }
 
-- 
2.19.2


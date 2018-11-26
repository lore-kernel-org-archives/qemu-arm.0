Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5807111wrt;
        Mon, 26 Nov 2018 08:35:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VgDq2Y98z+6ocIGZNWcI+bAT78pGdoT6mHQX2QAo6WtJ6GTyLzA204edI59BybHDaFlksg
X-Received: by 2002:a25:5786:: with SMTP id l128-v6mr14841166ybb.333.1543250104832;
        Mon, 26 Nov 2018 08:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543250104; cv=none;
        d=google.com; s=arc-20160816;
        b=kKY1LCwv8Wtzdwz6gNz5s7jGa5pQdm20P8ic/w3ivUfIVRbR/v9Zm/6ufh4KIeKOtD
         UUoFNx5joa5XI29PD1ESYaJwZUdOpqFdtY1JGQPy56r4kyvq3VFUnYI7ghd7Pa6l/r2U
         rHTiEiFkJhv4R/OTe+LDg+17LODqP57gQ+NP3DxcdVhRkZnvH0GJkH+wdK2A6t/wDy5G
         O+A5Ec9b8wGbPGUxomByk+DCtA6y7cqlgdzsUuJieKCxzLcUKMcQoCLzbvLIhCrgKNRO
         Iq0/OLIOf36ok1shTFPw9vg7J8gg/UHfS72WEtiF6Y0O4+acdlZTl0faZJS7kw9T9GUp
         qf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ni3H6FcoaprBW+2fT1eZmArp0RdQUSCd9NjpK/RxNkU=;
        b=Q/qIk7Fa7FPRbg8lJtJZvofzzWfCsxASzDzBZIpiwnVLfmjCKivbLdMkHRj3+62gsu
         M812he5cSieS5+DgatJPAHyFOI1JOEYOqW1K5svX3nJU9rkax7OpFwyXlYOxbjMyScA2
         zH9ld1fgAEVHtaGo9P/er/akGsSZpxAKOFdRqcaxH+VBUwTddKmV/Zvlfvp83y1bp53W
         rH+Ki6UjAoGlEzzL/b9NKBLTrG099PrK4Vyh9xXKF9OyzU6pILbasesyNiy2OJNQJTO4
         yEi/7wcxtTWvhscJ29797ocfAJ6oTLMXeba5ZWBCNcSYlNxKn9qVIw1JaDXhLWsOYsmE
         8oMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l26-v6si582908ybe.338.2018.11.26.08.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 08:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:37529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJqi-000434-6m
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 11:35:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmW-0000oo-7q
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 11:30:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmR-0004WD-Dy
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 11:30:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:31503)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRJmR-0004SW-6I; Mon, 26 Nov 2018 11:30:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2018 08:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,283,1539673200"; d="scan'208";a="90951867"
Received: from sunandos-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.82.176])
	by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2018 08:30:31 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Nov 2018 17:29:36 +0100
Message-Id: <20181126162942.21258-4-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126162942.21258-1-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH 3/8] hw: i386: Use correct RSDT length for
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
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vtJup8x+OalY

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
2.19.1


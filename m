Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2354824wrt;
        Mon, 17 Dec 2018 03:12:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V2OItFtCvK9I7+x3Rs+zGudq4EAsUV1G4+rYuSt9UUv+NcPfbwrko5LpioL1t/unPYmfBw
X-Received: by 2002:ac8:6909:: with SMTP id e9mr12818993qtr.132.1545045177604;
        Mon, 17 Dec 2018 03:12:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545045177; cv=none;
        d=google.com; s=arc-20160816;
        b=Fd4ZTR+jppK61AJF0I71RFe5eWuV4uy634YlywSEFnljNYOgwu2Wo94hGsExUtA8Jk
         ljX6lPikTyU9Z7iA+cosYNStG43XcffS+E1+z1e/RCysYZTs66lj7h/dxIjVeG1mcyhP
         0p4KqDOyYWQSL4eSe3KWJM2M/mrtNtVBhvkyCUHuzO9gGpg1pZq7gQVu9zqYuNLlOrON
         oaHWv8NNRu9jIEhES0YCLjw8fya7Avv/PVcalfkX6pW5pMdcGblSg7zz9rdCQSqsu4PI
         3b2Pupg8RTSzExq+6F+IM9LCZz/5/hSKvUvLmTjEMeuAbtIaX+YWCZkzghoLnBjUuSE/
         lPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gWxK1Xw55GfTyyVKAcxh6Y6Hwi2eEbmX+L8xg3FuKrQ=;
        b=o/+kIBQ2ol5P0S0wPbhlx1KzsAHBuHvBle4fkulzKpNUBfvdbhxQa71M0lXK2fyq3Y
         oHwTfWBjGYx46IKrZCM2YsXFezkJw0BLASSuh4ud3hYYcM/ZEd5ir9/8bvYIghiuxDH7
         f/iURC8XRN6DfMMxKmfWW1freyteu9AbaK6Ui1+DWnvCOdZmVN768y/cnKRp3yQYGX8G
         GJdoch+jpGyGWUbiTQPI3p7UBXMHNnwCEkDYhkOyY6T/IQtGxbFCCV9XFYbPsDXtMPIB
         27GraSLWkG3vQIMJMmXOPuqG//3J2LKyu2qnZDoU4IdOiDyzvlegRt6MbPuRM8LDFcAp
         EHuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si5379896qte.36.2018.12.17.03.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 03:12:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:45975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYqpV-0005Ei-1T
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 06:12:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqcS-00038B-HQ
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:59:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqSk-0003OM-4y
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:49:26 -0500
Received: from mga06.intel.com ([134.134.136.31]:26425)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gYqSi-0003JM-N0; Mon, 17 Dec 2018 05:49:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 02:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,365,1539673200"; d="scan'208";a="130583640"
Received: from apeskov-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.185])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2018 02:49:19 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Dec 2018 11:48:33 +0100
Message-Id: <20181217104838.18957-4-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181217104838.18957-1-sameo@linux.intel.com>
References: <20181217104838.18957-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v4 3/8] hw: i386: Use correct RSDT length for
 checksum
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
X-TUID: zYq2lxay2wqZ

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


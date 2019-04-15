Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2349824wrx;
        Mon, 15 Apr 2019 00:04:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybXWRqNZCXcZlP27L2XjbksA545YyMVP1Z4gpqLwb8TdpiknhEF2m4vT1rXfA/hq25Acv/
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr7480210wmj.121.1555311878120;
        Mon, 15 Apr 2019 00:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555311878; cv=none;
        d=google.com; s=arc-20160816;
        b=DLqKx4hofH7rlHjIKcHLKupc97b82fWo7xjNUqTjYps1p8NKeHDqlCYp06VJzy/rhm
         9TU5IyTctz5uKyX9BBrG5AZpAZ55CLopW6u6Q+0OaQ62kFzT74pQJ5GTUzwYsJ8y6ogN
         sudQSFrxOUwJt7buuQlV3n7kfzDGibe4g8oAeAU1oONR0CK1jgfx3UifJh0+rzRi+TTV
         dAeb2LitRNJH9AXAz5Y3zIinIZmhXuYYX1TLfMcl3mo9p3SbrP5grnnE+3zQzMWfr8Up
         Hd4auOT++oavoiAt9BGy1Uv00B5sQpdrOSnIziHIJ2K4+ZAhs5rKY9qJTrnDqbicAI28
         oHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3zGVcLe8sWkgDbbEOSgHAkUiuqUbiOt37FWo3A/U0Lc=;
        b=eAjef7tNf0lkck1mRxf7S+nFTTSe+U68waJhZ1xCzHob84OlkbZz4xmXdimKV1ZiH9
         o0jjLMynmSpfL1NaYtT3qtFhFw5SwZI0652dbKBFf0rWXXmmEvCCLNoTf+KCRhTF48GR
         +KC0Q2LhjaEo6ZXe1hLxQbNWAJ2I6wbclIAtJZDbbro01cCja9i1ztkdLt7grnos5nYB
         eZFzt+vZQuOosBu3N1qq81M5yzhovnzXkeg1Q8+VexrNFh5l9TnXqoCHpvTm+iZdHeyC
         ufC+2i6EXO/RKP29cS5AeugzjhrxCINeVm76UYMV7A4Hs0QHHc479PuVbxliNEO9BUxC
         TevQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si32954991wrn.227.2019.04.15.00.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 00:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFvfR-0008Tk-73
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 03:04:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFveq-0008D8-0m
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFveo-0004FI-1I
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:03:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:30997)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hFvek-00048h-6D; Mon, 15 Apr 2019 03:03:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 00:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,352,1549958400"; d="scan'208";a="164783103"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2019 00:03:45 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 15:03:05 +0800
Message-Id: <20190415070307.13668-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190415070307.13668-1-richardw.yang@linux.intel.com>
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v2 2/4] i386,
 acpi: remove mcfg_ prefix in AcpiMcfgInfo members
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UWDMc30u15u9

This is obvious the member in AcpiMcfgInfo describe MCFG's property.

Remove the mcfg_ prefix.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d009176072..f0d27bffd6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -87,8 +87,8 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 typedef struct AcpiMcfgInfo {
-    uint64_t mcfg_base;
-    uint32_t mcfg_size;
+    uint64_t base;
+    uint32_t size;
 } AcpiMcfgInfo;
 
 typedef struct AcpiPmInfo {
@@ -2404,11 +2404,11 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
     int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
 
     build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
@@ -2577,15 +2577,15 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     if (!o) {
         return false;
     }
-    mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
+    mcfg->base = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
-    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
+    if (mcfg->base == PCIE_BASE_ADDR_UNMAPPED) {
         return false;
     }
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
     assert(o);
-    mcfg->mcfg_size = qnum_get_uint(qobject_to(QNum, o));
+    mcfg->size = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
     return true;
 }
-- 
2.19.1


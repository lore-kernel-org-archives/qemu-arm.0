Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3550271wrt;
        Fri, 30 Nov 2018 05:04:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wad614FyG4xS1S+bniz02ImjGVJ1RKPOwk9+05wdwYdYEqz39O28YKsWEO9z3HVqyYT/jP
X-Received: by 2002:a81:ad49:: with SMTP id l9mr5427747ywk.260.1543583067658;
        Fri, 30 Nov 2018 05:04:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543583067; cv=none;
        d=google.com; s=arc-20160816;
        b=LkdgTMBisJtvnoD8bmiSmx1nxoDsbSRHF5JJTOVF3nOvdOrW0DU/NeHJ4ScDlmW2Gg
         AC0EYWZWOljeljxSKU6tw3zwPn6hQt2WW89lPqwEl8/z4PNNWU5tUj1+YvK1W9dAkPhR
         VvMMeNipIwAUmcvVbVMNpAKh0hK3elX8KCRU2BUsjXgXmFSUzmUgZiTz8ragV0iGECdX
         QbU9RcxPpsy2zSrK7Bij9dB65FCZwaLjT1fseUN0QBhol202OM7/ted5tWnjbrHaDXD2
         q14Tr8r3r/swJLvRmn6k9et9d97CS5eUhpjW4lV6pT3Ooo+10NZA0Xc7iIaqsz/lckiJ
         kSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nU7rigHSTbTvdXEFwNy2Fh4MAU/r3WtkhfvrpeGcjZE=;
        b=Yf4V4zdHSOJcIoa29gdsqNS4su7CNnP4xmNilRvzR19pyd4XPbEVkt/Ph6Je9j03sA
         wgTnPCX6YxSwHeZA+K1J1mordNgBUgpnncuKKw86e3aUYD6iF6WQ0LN//WjAEh+Xsr7F
         G2P23LI++exL/NK7hl74WxdgWkxzyPW7otuAnuK3AwNZ8KyEQnbk1ODrws6fmvG0Xlwx
         QAr4mrScFScigGMbO9c4+WxKu0FYW8Sx7I6nEn5pROEYPkESvhz3tHSHgyJk3AbpOB5/
         IYN0riDfvAEZMakEUvFl6dj4lzVIINZ/IrkpUAlBSyGvBuWm4FY8MI9bNIgj9253gzCY
         0idw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g31-v6si3157626ybi.245.2018.11.30.05.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:04:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiT5-0006sa-2P
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:04:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQQ-0004B8-Kc
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQM-0005DA-Ea
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:42 -0500
Received: from mga09.intel.com ([134.134.136.24]:51026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiQL-0004nX-WD; Fri, 30 Nov 2018 08:01:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293509423"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:33 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:30 +0100
Message-Id: <20181130130032.11835-7-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130130032.11835-1-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v3 6/8] hw: arm: Support both legacy and
 current RSDP build
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
X-TUID: 2TEzR+x+GZPT

We add the ability to build legacy or current RSDP tables, based on the
AcpiRsdpData revision field passed to build_rsdp().
Although arm/virt only uses RSDP v2, adding that capability to
build_rsdp will allow us to share the RSDP build code between ARM and x86.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4a6b53fbfc..4b212fa44c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -370,8 +370,23 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 static void
 build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 {
+
     int tbl_off = tbl->len; /* Table offset in the RSDP file */
 
+    switch (rsdp_data->revision) {
+    case 0:
+        /* With ACPI 1.0, we must have an RSDT pointer */
+        g_assert(rsdp_data->rsdt_tbl_offset);
+        break;
+    case 2:
+        /* With ACPI 2.0+, we must have an XSDT pointer */
+        g_assert(rsdp_data->xsdt_tbl_offset);
+        break;
+    default:
+        /* Only revisions 0 (ACPI 1.0) and 2 (ACPI 2.0+) are valid for RSDP */
+        g_assert_not_reached();
+    }
+
     bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
                              true /* fseg memory */);
 
@@ -380,10 +395,29 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
     g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
     build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
     build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
+    if (rsdp_data->rsdt_tbl_offset) {
+        /* RSDT address to be filled by guest linker */
+        bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
+                                       tbl_off + 16, 4,
+                                       ACPI_BUILD_TABLE_FILE,
+                                       *rsdp_data->rsdt_tbl_offset);
+    }
+
+    /* Checksum to be filled by guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
+                                    8);
+
+    if (rsdp_data->revision == 0) {
+        /* ACPI 1.0 RSDP, we're done */
+        return;
+    }
+
     build_append_int_noprefix(tbl, 36, 4); /* Length */
 
     /* XSDT address to be filled by guest linker */
     build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
+    /* We already validated our xsdt pointer */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
                                    tbl_off + 24, 8,
                                    ACPI_BUILD_TABLE_FILE,
@@ -392,11 +426,6 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
     build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
     build_append_int_noprefix(tbl, 0, 3); /* Reserved */
 
-    /* Checksum to be filled by guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
-                                    8);
-
     /* Extended checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
                                     tbl_off, 36, /* ACPI rev 2.0 RSDP size */
-- 
2.19.2


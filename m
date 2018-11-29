Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2339398wrt;
        Thu, 29 Nov 2018 05:30:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WskfgnctjmWpgHnP+R+VSA4I0VpFsECaYZOXGqBJLcBTNjuIevV/c8pdFxjReyUSB/LjVf
X-Received: by 2002:a81:b657:: with SMTP id h23mr1321343ywk.378.1543498243424;
        Thu, 29 Nov 2018 05:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543498243; cv=none;
        d=google.com; s=arc-20160816;
        b=MBrcx1b1cDmKcutcSP1ZMyXsXEkRi5duY6q0oTols6L1ZADeY9N/v9tuv3+0+iXjxl
         L3Nib3tsGSxJJso4jqikrq+k7ENPXrZvxOGD9QHS5ubxdJsmUbfB2GA96qrp3wFSOtM9
         Xsk3cTctrD56GcErj4ulnGVAr+tiikKV9aKdJUMy7iBq53jCLNjFSDW72A0qeiGQQf9j
         8zldSGJWMt67B36xAmLjKbvIjQy2T9FPx5iN/dzeB8iJre5pLgx8dqkaaTSMzqU+CSFf
         AQf4hFQv6cqZ1CqrMWtRRDROXiw1+JVdZBlfaEo7mMZ5ttbVhdMZQJe+hD6TjvNBO4jv
         yB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CQg1YxSwnTnTvzSf6zsq45+6Xi57b3L76rkH0s+mpro=;
        b=C4e2P5zziaDIDA3et6FrnV5GzES3ivzUF0GZmC59Ct6rwJnbX8LpMn/COmatakr1hr
         cjsabcpaPPDV++bIumyTQ4zcQQoiRT0YdzOV8qtpA5Rg3sbAyCRooJQ95qZt13VIBnSn
         3XLpp9a7Rif3tJ8wDUJD5DDDfA3u6VlVJTdXyffZUlOg9lV8HlXyBGJMM7Dhxj8BwAvV
         Fs8mwJRDswH75lx6IrNpARYTEm2RvfxgnN9bsMELX/BAQDStxO0pFIsJ6vMvlQkA8y2C
         bAufdgnRG69UygzEAx9QAvgiP2SDsSOd2SbJhQnHTwx1LiMq5f57WO8U+qoQr0MQiRNh
         2apw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q141-v6si1125111ybg.430.2018.11.29.05.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 05:30:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:54163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSMOw-00049k-8V
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 08:30:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMK0-0000Yt-B7
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 08:25:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMJv-000260-Ew
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 08:25:36 -0500
Received: from mga03.intel.com ([134.134.136.65]:30951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSMJv-0001hj-1C; Thu, 29 Nov 2018 08:25:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 05:25:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,294,1539673200"; d="scan'208";a="97547215"
Received: from hharjula-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.29.114])
	by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2018 05:25:26 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Nov 2018 14:24:25 +0100
Message-Id: <20181129132428.333-6-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181129132428.333-1-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH v2 5/8] hw: arm: Convert the RSDP build to the
 buid_append_foo() API
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
X-TUID: WEvKxaUbdZaG

Instead of filling a mapped and packed C structure field in random order
and being careful about endianness and sizes, build_rsdp() now uses
build_append_int_noprefix() to compose RSDP table.

This makes for an easier to review and maintain code that is almost
matching 1:1 the ACPI spec itself.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 42 +++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ce8bfa5a37..4782aea4fe 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -368,35 +368,37 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
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
+    g_array_append_vals(tbl, "RSD PTR ", 8); /* Signature */
+    build_append_int_noprefix(tbl, 0, 1); /* Checksum */
+    g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
+    build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
+    build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
+    build_append_int_noprefix(tbl, 36, 4); /* Length */
 
-    /* Address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
-        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
+    /* XSDT address to be filled by guest linker */
+    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
+                                   24, 8,
+                                   ACPI_BUILD_TABLE_FILE,
+                                   *rsdp_data->xsdt_tbl_offset);
 
-    /* Checksum to be filled by Guest linker */
+    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
+    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
+
+    /* Checksum to be filled by guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
-        (char *)&rsdp->checksum - rsdp_table->data);
+                                    0, 20, /* ACPI rev 1.0 RSDP size */
+                                    8);
 
     /* Extended checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
-        (char *)&rsdp->extended_checksum - rsdp_table->data);
+                                    0, 36, /* ACPI rev 2.0 RSDP size */
+                                    32);
 }
 
 static void
-- 
2.19.2


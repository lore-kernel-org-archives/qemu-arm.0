Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3557217wrt;
        Fri, 30 Nov 2018 05:10:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wn6wRMN6Ola/WZxqPZrg5PK1EN+Wtck/R0Fre0iUbN/uiml07tC603+qTRluPwyjIiZu0C
X-Received: by 2002:a81:1a0a:: with SMTP id a10-v6mr5527046ywa.337.1543583408472;
        Fri, 30 Nov 2018 05:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543583408; cv=none;
        d=google.com; s=arc-20160816;
        b=0yiz2TbaEDf/wM6c4J7s+PkjEiEj9lSctTVvlKoBFFsrK9RPAOst6KQHEzkarIqYwy
         QNXLwFCmc5dAbjHrX7UfM4X21Z83c32v6cT31u0iJmR8haVoDnt8jImwHBgrLiUUWhpx
         TRh8HXJs2dTLoMobY67aQfv69koTkexxPxuUDZpKEfr+6mEyUaFBwdX0opFNt4dU254b
         9aQ/1ObNrTrKn1YzONyqYWlXa+5syWEl7cy2/Wt70hsx2VeUdj84rTfjYEcc79+Eahfz
         1+BRfPCyPg+TinxpwN5T+2iGXUShT+UcuoVbhlAf+w0Ltf8bpJQamPLPBeFg18pHRInP
         x88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KI+TsL4huNIdxKt37Ts1EVdSQM5Oha9iGmZRWGKZGvQ=;
        b=FENOWHMDa1Rt2z4D9Bdqh2Z5iLd82Et51xrvmvOUUZ79FVrgrp9nwmoKWXp4FF3Ahb
         nKEWMxLdMEd/kmzU8qvkfQIpSp/Zmcqkxt931H64TSkjcHlMOfKjo0Ok/5JHbouSGSGv
         Gnk8Ul6gxnWgE9mm61CPPNeE8olxpq8HkhiqZuTBiVCB0ECByHFv90HQsPnUczs6NHUn
         EGs7rdpw752/+HGPgXhAvegYprBMRVcsHyrIQ1tymAMdk4XM92OOdon5+qw/eq3Ov7rk
         0tz2P+PM4xx5mUk3qA7xTn83ICe1vpUL9SNoufJfxNYPFoIGHcyvm0m6iGZX0NQW3bql
         aUAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10-v6si2923362yww.167.2018.11.30.05.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:10:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiYZ-0003mL-QA
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:10:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQO-00049h-K0
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 08:01:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQM-0005Cq-8c
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 08:01:40 -0500
Received: from mga09.intel.com ([134.134.136.24]:51026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiQH-0004nX-BV; Fri, 30 Nov 2018 08:01:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293508477"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:28 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:29 +0100
Message-Id: <20181130130032.11835-6-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130130032.11835-1-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-arm] [PATCH v3 5/8] hw: arm: Convert the RSDP build to the
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
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbbRVZSiYQpN

Instead of filling a mapped and packed C structure field in random order
and being careful about endianness and sizes, build_rsdp() now uses
build_append_int_noprefix() to compose RSDP table.

This makes reviewing and maintaining code easier as this is almost
matching 1:1 the ACPI spec itself.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 42 ++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ce8bfa5a37..4a6b53fbfc 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -368,35 +368,39 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static void
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
+build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 {
-    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
-    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
-    unsigned xsdt_pa_offset =
-        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
+    int tbl_off = tbl->len; /* Table offset in the RSDP file */
 
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
+                                   tbl_off + 24, 8,
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
+                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
+                                    8);
 
     /* Extended checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
-        (char *)&rsdp->extended_checksum - rsdp_table->data);
+                                    tbl_off, 36, /* ACPI rev 2.0 RSDP size */
+                                    32);
 }
 
 static void
-- 
2.19.2


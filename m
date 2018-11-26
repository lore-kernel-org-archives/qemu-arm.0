Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5807106wrt;
        Mon, 26 Nov 2018 08:35:04 -0800 (PST)
X-Google-Smtp-Source: AJdET5dOWIA3/hdxsXEkdcjA8NNAuamRyZHLq+hHDY1ln1RsrDtFSQgXAmsOQCCbnX674cwodj70
X-Received: by 2002:ac8:266c:: with SMTP id v41mr26206846qtv.159.1543250104574;
        Mon, 26 Nov 2018 08:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543250104; cv=none;
        d=google.com; s=arc-20160816;
        b=mO+7HAS1L6ap7Hfp93k7Rub0NhaHy+2NT2qMebU+31XxnQ2Apanr6kREdtlFGUst31
         XoPLCU8wtTt9ZeRcsnAmndSH8m8vZyp36d0ZU0nDaIjqh2+BC4xNmIJnyYiYYfppy/aU
         iDnU/kUAscgpCVObMrBnI0/bfVK/zZT6FbmonoMPiHWs0fq+S+JOTAYYaJeyHZ0n7EZu
         VpcAND2QOTfGPsc50R7gizR6Ii7wbNYf/AMnGds3xIMKUk3hXabaBwicsNvfSGjJ16+K
         jAqvctN/WG69dd/HnGBi+n9ylKtAjZ9tcgVe2ZPNXdicqOVKH8AQVvqt2KzMtzAsNUV0
         VAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vlSOyQlWv0zB9Xl7X+AhpYDGJBm+jcjVLu8Gk/qfjcE=;
        b=ZAA8ZaDXJEPPpWLB4idv2kQbRZFAqcDDG9cZH01sdxzsBnzyYy7AVlHhKVXBw/Kq7W
         3UUc54aZ/n6e/kHE9pOQwOb1QM7P/JfUmRjHJ+3WPSKSuPA16aZMmNgLPXhEV4e7yMP5
         X9cUMfFun6fJaS/31FRViXEyW643qL8gKsqAlN75eTT3zEe4essnqUjQpE545V/EWskv
         tbr3yagTIDzY3E/DtGJsLLqzteHbuujUpfByHecwsXdYN3Ugru5Na2FphSYknWx3n4Vg
         wVkNi2Evpgc28P6OPU7FbtErqVxh7T68eryzRS+J7ancvMF6D7dSLXKz6lNUkcWWgNGs
         WyKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j35si615001qtc.137.2018.11.26.08.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 08:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:37535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJqh-0004e3-U3
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 11:35:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmn-000152-MK
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 11:31:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmm-0004fB-Vb
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 11:31:01 -0500
Received: from mga11.intel.com ([192.55.52.93]:54537)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRJme-0004YC-GC; Mon, 26 Nov 2018 11:30:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2018 08:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,283,1539673200"; d="scan'208";a="90954788"
Received: from sunandos-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.82.176])
	by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2018 08:30:48 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Nov 2018 17:29:39 +0100
Message-Id: <20181126162942.21258-7-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126162942.21258-1-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-arm] [PATCH 6/8] hw: arm: Support both legacy and current
 RSDP build
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
X-TUID: 6WxmvjoAPoFY

We add the ability to build legacy or current RSDP tables, based on the
AcpiRsdpData revision field passed to build_rsdp().
Although arm/virt only uses RSDP v2, adding that capability to
build_rsdp will allow us to share the RSDP build code between ARM and x86.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d47978a55e..10f8388b63 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -389,6 +389,27 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
     /* Space for the RSDT address (32 bit) */
     build_append_int_noprefix(tbl, 0, 4);
 
+    if (rsdp_data->rsdt_tbl_offset) {
+        /* RSDT address to be filled by guest linker */
+        bios_linker_loader_add_pointer(linker,
+                                       ACPI_BUILD_RSDP_FILE, 16, 4,
+                                       ACPI_BUILD_TABLE_FILE,
+                                       *rsdp_data->rsdt_tbl_offset);
+    }
+
+    /* Checksum to be filled by guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
+                                    ACPI_RSDP_REV_1_LEN,
+                                    ACPI_RSDP_CHECKSUM_OFFSET);
+
+    if (rsdp_data->revision == ACPI_RSDP_REV_1) {
+        /* Legacy RSDP, we're done */
+        return;
+    }
+
+    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
+    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
+
     /* Length */
     build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
 
@@ -406,11 +427,6 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
     /* Space for the reserved bytes */
     build_append_int_noprefix(tbl, 0, ACPI_RSDP_RESERVED_LEN);
 
-    /* Checksum to be filled by guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
-                                    ACPI_RSDP_REV_1_LEN,
-                                    ACPI_RSDP_CHECKSUM_OFFSET);
-
     /* Extended checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
                                     ACPI_RSDP_REV_2_LEN,
-- 
2.19.1


Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2341849wrt;
        Thu, 29 Nov 2018 05:32:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X3tfyZHD8a6aFwp44S4DOw2nzo0tjIt6tyv30t4BnrdxcltOp72OV9V3O/KVNbd19t0Z6I
X-Received: by 2002:a81:a8c8:: with SMTP id f191-v6mr1297618ywh.393.1543498371244;
        Thu, 29 Nov 2018 05:32:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543498371; cv=none;
        d=google.com; s=arc-20160816;
        b=gRkplNcDldQee5KEeFjHcY0Y/m6F6HqGWY6HEvby8tN2OYErJYsoKYG6CnH+j64rUm
         rqDw6yiXpXUow6M7h6Iq5tQh3+r2oqKhFLjckl1L0Cv2kpw6cktcirQ3FevROXxLphKg
         PWWDNmnm0U8WuokZWACsGU5KhBud7lt8ZsepCAx2Dd2Addn32MCE86k3P0Uu4yX4Iido
         DTbj7dsMNxsB0uWJFoulmvVzweqafBPRVV+a+yQ3a9bZSnwTkEsBK8ubDV6YBUKOcRAX
         UpL/UAcbF8npSDewir1OiHllT11nSbe7wAagmGPQenTw7sMJ2R+hPJx4alMvNIR5uwup
         7HqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=q42z5bDCL30nmNIoxKdMQs9otL0crk9wosXvXLy7TMQ=;
        b=mDSyrtcoi3XMuDwZwgve2yubbaMH7228V96gUCRqiajTUHZ2tyuTxxAjcE/L22o/Y7
         34c3Paplc5JGXgvFjWfGKTfHiJBKEmFog/KoS4PhAzDU6SGRW5WJLXcGcUvFTz3r4TdX
         Ohb8il3OoBUGBZSi2HwFgnlkqn/FWg8KPNl+h+9KZDFUqPLClX39dbobfkrKrGzgGOvc
         zIom08pcF3/U9P1v8chU3JTfvx1VsT0CcBnzliHKVKhA63QwFCJqrAqYL7bnrWH5W/n/
         kjBWt+ogNN0jFWhHCn/Meqc0hmJZrTLC2r8LX7LYP1zukkvVpduTKyQDVmqOiKXeq9GN
         G3JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c129-v6si1069454yba.477.2018.11.29.05.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 05:32:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:54174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSMR0-0005mP-LN
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 08:32:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMK5-0000dT-G6
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 08:25:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMK3-0002QZ-O5
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 08:25:41 -0500
Received: from mga03.intel.com ([134.134.136.65]:30951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSMK0-0001hj-2P; Thu, 29 Nov 2018 08:25:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 05:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,294,1539673200"; d="scan'208";a="97547217"
Received: from hharjula-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.29.114])
	by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2018 05:25:30 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Nov 2018 14:24:26 +0100
Message-Id: <20181129132428.333-7-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181129132428.333-1-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-arm] [PATCH v2 6/8] hw: arm: Support both legacy and current
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
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4BQg/m200vQt

We add the ability to build legacy or current RSDP tables, based on the
AcpiRsdpData revision field passed to build_rsdp().
Although arm/virt only uses RSDP v2, adding that capability to
build_rsdp will allow us to share the RSDP build code between ARM and x86.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4782aea4fe..e1338b6f5a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -378,23 +378,38 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
     g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
     build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
     build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
-    build_append_int_noprefix(tbl, 36, 4); /* Length */
-
-    /* XSDT address to be filled by guest linker */
-    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
-                                   24, 8,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   *rsdp_data->xsdt_tbl_offset);
-
-    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
-    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
+    if (rsdp_data->rsdt_tbl_offset) {
+        /* RSDT address to be filled by guest linker */
+        bios_linker_loader_add_pointer(linker,
+                                       ACPI_BUILD_RSDP_FILE, 16, 4,
+                                       ACPI_BUILD_TABLE_FILE,
+                                       *rsdp_data->rsdt_tbl_offset);
+    }
 
     /* Checksum to be filled by guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
                                     0, 20, /* ACPI rev 1.0 RSDP size */
                                     8);
 
+    if (rsdp_data->revision == 0) {
+        /* ACPI 1.0 RSDP, we're done */
+        return;
+    }
+
+    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
+    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
+
+    build_append_int_noprefix(tbl, 36, 4); /* Length */
+
+    /* XSDT address to be filled by guest linker */
+    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE, 24, 8,
+                                   ACPI_BUILD_TABLE_FILE,
+                                   *rsdp_data->xsdt_tbl_offset);
+
+    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
+    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
+
     /* Extended checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
                                     0, 36, /* ACPI rev 2.0 RSDP size */
-- 
2.19.2


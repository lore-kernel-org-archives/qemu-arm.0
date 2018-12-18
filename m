Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3940877wrt;
        Tue, 18 Dec 2018 08:40:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UbyQ6dt8id1XghAC3S5IRTlsGnVl8yUEOpZPsXGWhzjb0RWjxvylM7O968uenX7qCNE0FF
X-Received: by 2002:ac8:3a87:: with SMTP id x7mr18659489qte.282.1545151211724;
        Tue, 18 Dec 2018 08:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545151211; cv=none;
        d=google.com; s=arc-20160816;
        b=xT1pyy4/sPvtS7ediPq5MNPpn4ObK1nx9bFTVUvghnhpbs0mLS9ZJKhdS6QkDDikNH
         dxg//QLj5VfHYxdgQLNDzLPlmq4GZ2uE/tSb4Ltshhmbyq1uvC94+mglbhfnseb+Sr4M
         AwrB0X5UaIPna3gULQTcy+kEn4iMH0GBvQf4ziGMsP2gSUA9PpZaGS68mAIw3RFeRPgz
         2CMFqLnj8H7FcrV1sBkeQwR5oIew8gy6MHS+ka0Gwz8WVjE28BPAmRNJCkM4NxRfyamP
         e7BkduJePZgy//lX7LjeLVMuDbE9N92P3rtO5VfSqXwIvdy5IMR1xgJt52YYKrrks9bg
         UIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=NxqVBY60wOaYwKTSXlRe3+6NVkPt6DYuohx8bfOaWro=;
        b=Wv2rhu/SHFfjCQPa0OhM3o80uxUEzwEaIpZ9xlAHnTs0CedqUyaVg3cavktGthExYB
         vN+/g8/fgTZ9hrTD/mKQRCzkpoh801DwEWNydYot3YxXRx3KifNQEHzhV48NSSttKJrQ
         V2Tx4bBIllRq0o2d1c3wK0r5xNi/KXlTG5wZ7RtVhLaF8IsRcrB3crvHXMNHJgBM/oU3
         3s0ll6NUj8gh44eBRaivHXc3W9eX3DS2VwavQmeCREJvODZR7DwjFdMR99LSNKATbXoT
         oTNoHB9EjPcAiyj6JihZcvq4vynYVWHi3MK9osUJE/cYzlveZn8MKVvhNB4ZZzAU5HcH
         kZng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si269768qto.215.2018.12.18.08.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Dec 2018 08:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZIPj-0004Ea-5n
	for alex.bennee@linaro.org; Tue, 18 Dec 2018 11:40:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZI03-0007XC-35
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:13:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZI01-0003K8-Hm
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:13:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48486)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZI00-0003H6-To; Tue, 18 Dec 2018 11:13:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0452C057F81;
	Tue, 18 Dec 2018 16:13:33 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id 9F7087A5D5;
	Tue, 18 Dec 2018 16:13:32 +0000 (UTC)
Date: Tue, 18 Dec 2018 11:13:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181218161008.3882-28-mst@redhat.com>
References: <20181218161008.3882-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218161008.3882-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 18 Dec 2018 16:13:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 27/30] hw: arm: Support both legacy and current
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vuue09nvzTAy

From: Samuel Ortiz <sameo@linux.intel.com>

We add the ability to build legacy or current RSDP tables, based on the
AcpiRsdpData revision field passed to build_rsdp().
Although arm/virt only uses RSDP v2, adding that capability to
build_rsdp will allow us to share the RSDP build code between ARM and x86.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4a6b53fbfc..05f6654371 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -372,6 +372,20 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 {
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
 
@@ -380,10 +394,29 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
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
@@ -392,11 +425,6 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
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
MST


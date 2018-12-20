Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6616564wrt;
        Thu, 20 Dec 2018 10:52:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/ULksVUfBWtCbw7gP4qr8LFs8o8jWro+3esUB1cKFY+kSWXdS61CvH0jHcjvskxYxeOdqwM
X-Received: by 2002:a37:c401:: with SMTP id d1mr21803232qki.254.1545331946977;
        Thu, 20 Dec 2018 10:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545331946; cv=none;
        d=google.com; s=arc-20160816;
        b=Kz0VP2pUJ2FRsq3D8uHWxky7J7q0ZhYV2ya2wFigeZj0/1Lo3S5sANKp1XpSuGZYKp
         G0JB48WOP83y9pzBP9z2+1PeVzFWDdPDelNi4jdTf7MDw2ZizEEVDHPtw9sR1NEnbzjo
         /DQRsJche3SyXtu2I6gDhcM0aBMn0I0HHFGULVvl456fPdMkemYtrTAGSM6nDGS+hSuQ
         fB0uVgYHt6z5dfv6Zc+W0hmg1yyf72hsDJhrcq+RkYaCj3DXcCG3IAgi0CsRGOULytRz
         lvvPhWYWTaqI+a+piWrBQOwsE8xtFYzbBVzP4ztB6yvVqMJAzwHZ3dcTcIfKjxzoCs3J
         UgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=NxqVBY60wOaYwKTSXlRe3+6NVkPt6DYuohx8bfOaWro=;
        b=U7Yyyi2jC6jwjs1JVz0TvR+9hG0+lN8y9eGR8cVgKbXsj+BSw+YWHdGQ5OUWZ3iTO2
         6gZJFwbapqj3R7mys1M4D4fhhyKUBkpYj9+RdDgVxjxnikKn2ZwUcOpOoXmNssIvVOyW
         2frskoFitXCJrI8j4jPCvdcVqDS14yj/b951SMZYKTYagnCjc/plbUdUiAzY1sfKvwzG
         AjMBqjeZUgqdMauRd0NZqpLF7M5rVUI/Zym2iSwf+C8KarexlyaZF6KwGPyVu7/2qPo5
         yhh3lAhbm/FNMcwmvvEOsL362KWyiyd5i1ixCqciwDGJtou6/hnihHkMUgJYU7Uy41KJ
         Sbqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si189374qtp.41.2018.12.20.10.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 10:52:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ga3Qo-0006gb-H2
	for alex.bennee@linaro.org; Thu, 20 Dec 2018 13:52:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3Ei-0005CP-5u
	for qemu-arm@nongnu.org; Thu, 20 Dec 2018 13:39:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3Eg-00013h-Bw
	for qemu-arm@nongnu.org; Thu, 20 Dec 2018 13:39:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ga3Ee-0000t3-6J; Thu, 20 Dec 2018 13:39:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5CF97D0FC;
	Thu, 20 Dec 2018 18:39:45 +0000 (UTC)
Received: from redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with SMTP id C9E366051E;
	Thu, 20 Dec 2018 18:39:44 +0000 (UTC)
Date: Thu, 20 Dec 2018 13:39:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181220183059.20726-28-mst@redhat.com>
References: <20181220183059.20726-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181220183059.20726-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 20 Dec 2018 18:39:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v3 27/44] hw: arm: Support both legacy and current
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
X-TUID: 4eIiVmHV8R+e

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


Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3925428wrt;
        Tue, 18 Dec 2018 08:25:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vmscgz3GR90wUUa1VGGcTIZPh3ROq4CrpMpg/4KhzsFiHhnNT9fsUTqqozVxaWas4n4dAH
X-Received: by 2002:aed:3c0c:: with SMTP id t12mr18463449qte.226.1545150327776;
        Tue, 18 Dec 2018 08:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545150327; cv=none;
        d=google.com; s=arc-20160816;
        b=dODBh/vMOqd2ZekU1Czgl6zSJrffS3aN2sw1j8llgm1hK6VxvWOYFM8sQf2Tt1ypKp
         wucFlVqacVD4uz4gRjdVbbxE83mgtI45fqX2RqqFxObmDkk8Iraay87jISSsu6E9UgEM
         My+H1rBw6heP5lxOtfXwCxVLV68s9eYsvRntR5+m7FVrPEIRFUUbg04BKRSNhKtV/l1d
         gepR1SyumpTnU2IooG0h+CZP3pm0bywFjUAgus20LqVsG6ITeK+VFLW47IbOPd1Y0kvb
         A8ReKWiIJg2sdEp2qPP5I9jA7HOhXmftkpbfK/rM5wx7r+VfAY6ElrDkjiWHJJt4cOiK
         vbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=GmOzFYmm1KcHc3j/WYYRE+au7bwvaOR7yAV+Hvf9OWw=;
        b=o6nNNUfhe3kvEgoGuEAyL0lbz95LE4gkPDgQnNbsKIFIgfI448KH4jzthcYAyi2yIq
         bdNNfy6NYPPPKGyTjf8SRMWU8p2ro62MGbnhiY8A7YRcv+xELIQZW9UqkuMVe/hmt9/g
         xehFLE4ypBrrjzzVKuVVNgM0N4jVCiXV8Qot6/KTQq+49AvCbVcSQlkPevAsIW82diJK
         bgok9CSYSIAOjpqIKwQr9UIJniDlG3BHU/bWsQNkL7B+p0yAbcRIKdNSO+/EzhQaP/jg
         l7HMq4MSME680nyXa/Hv0pZTS9hmeeLbDhWdqcyoueO3JTLWtDWq/BI/Lc7V83KysJF1
         Zcaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si253250qkc.106.2018.12.18.08.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Dec 2018 08:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZIBT-0000eC-3L
	for alex.bennee@linaro.org; Tue, 18 Dec 2018 11:25:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZI02-0007UV-Ga
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:13:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZI00-0003Jb-Ti
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:13:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZI00-0003E9-Gf; Tue, 18 Dec 2018 11:13:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3E1FA404C;
	Tue, 18 Dec 2018 16:13:31 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id F35734D722;
	Tue, 18 Dec 2018 16:13:30 +0000 (UTC)
Date: Tue, 18 Dec 2018 11:13:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181218161008.3882-27-mst@redhat.com>
References: <20181218161008.3882-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218161008.3882-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Dec 2018 16:13:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 26/30] hw: arm: Convert the RSDP build to the
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qk7SlqXyy0tI

From: Samuel Ortiz <sameo@linux.intel.com>

Instead of filling a mapped and packed C structure field in random order
and being careful about endianness and sizes, build_rsdp() now uses
build_append_int_noprefix() to compose RSDP table.

This makes reviewing and maintaining code easier as this is almost
matching 1:1 the ACPI spec itself.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


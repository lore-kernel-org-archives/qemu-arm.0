Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3288696wrt;
        Mon, 17 Dec 2018 20:39:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WqT3Xx6/WJq2icMRsMMQHwUYyTX7IRvu2MO943v9VzntnFZHQuBlyu2Ut66CTu50ImdKTb
X-Received: by 2002:a37:af85:: with SMTP id y127mr13968182qke.352.1545107948841;
        Mon, 17 Dec 2018 20:39:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545107948; cv=none;
        d=google.com; s=arc-20160816;
        b=U185p3ZeFGir5pWNgClx8wQtzMMJEhxA0hWcvy8gmAF2ij/6dvsY+N/R3qkjxmIrTC
         CmfoZvm02asPi/Kc9stE74EnVjfQw/bsIgL/uF2XLINAP5eRdvdEzXQZOk4V9mwILXJx
         5P5va7FoMOXoVtyPHYO5WgFBMllP4xueVxRv7TrQcwy9gyznLCAlQJS0Ljt5AEDZFaKU
         g5O5hjaFOeh2FpcnV7vh6PJv2AJPalQDsYbeIbXm8p4GhOxouGRuwRMsMUfPJ88pOcV2
         0gQW+I1Evz6EZpqjxE+7Qm4WFIzocDPT2H2uhZ4uTmtzpVBDVdtaKhS+isqnA+3ekmQE
         5VhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=MdTMhmjcMPxLhbY3cyFuTlxrzsjTTakx9kbTfsHfncs=;
        b=pR0Em/nZsOdvh8pMYeJ1DPwZkBVrpcdSjpwJ7Gkg6fx3n89lXP6vc5IgYtf0tL9i7A
         BT1eKHyh+8xoh54lAhUp/w8MsSdGlV8JK4x3GwlmUStGmEy/8Krk5TzWlMU5TWqL+Gzf
         WHizWuv5dNjwNXhfKVsDNB5TD84FsXDfBSTZQf5mY1VjUs5Apd3W+mqTt8i6iyuDAvAs
         ESkiRgGn+zEEnsVSIHPMZU1xASQSZVALwJlvfYWh8EcejVrlW/HT6cEXGHhcLUk3W4/v
         u5aBHBcdMwQvxjeXPo+f8/cptLx8GVX2ImLGUoxm9+r0kt5bc0wq0hBLQWzXlTjZZheu
         bYwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t23si5747507qtp.212.2018.12.17.20.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 20:39:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51688 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZ79w-000695-Ak
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 23:39:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ6q6-00061S-4i
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 23:18:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ6q5-0007tD-6a
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 23:18:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZ6q2-0007pr-DF; Mon, 17 Dec 2018 23:18:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E5E74025D;
	Tue, 18 Dec 2018 04:18:33 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id AE4C26B8DD;
	Tue, 18 Dec 2018 04:18:32 +0000 (UTC)
Date: Mon, 17 Dec 2018 23:18:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181218041625.24969-27-mst@redhat.com>
References: <20181218041625.24969-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218041625.24969-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 18 Dec 2018 04:18:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 26/31] hw: arm: Carry RSDP specific data through
 AcpiRsdpData
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c5K9XpMDDTlw

From: Samuel Ortiz <sameo@linux.intel.com>

That will allow us to generalize the ARM build_rsdp() routine to support
both legacy RSDP (The current i386 implementation) and extended RSDP
(The ARM implementation).

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h |  8 ++++++++
 hw/arm/virt-acpi-build.c    | 18 +++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023968..8425ecb8c6 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -53,6 +53,14 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
 } QEMU_PACKED;
 typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
 
+typedef struct AcpiRsdpData {
+    uint8_t oem_id[6]; /* OEM identification */
+    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
+
+    unsigned *rsdt_tbl_offset;
+    unsigned *xsdt_tbl_offset;
+} AcpiRsdpData;
+
 /* Table structure from Linux kernel (the ACPI tables are under the
    BSD license) */
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0835900052..ce8bfa5a37 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static void
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
     unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
@@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
                              true /* fseg memory */);
 
     memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
-    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
+    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
     rsdp->length = cpu_to_le32(sizeof(*rsdp));
-    rsdp->revision = 0x02;
+    rsdp->revision = rsdp_data->revision;
 
     /* Address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
-        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
+        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
 
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
@@ -857,7 +857,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
 
     /* RSDP is in FSEG memory, so allocate it separately */
-    build_rsdp(tables->rsdp, tables->linker, xsdt);
+    {
+        AcpiRsdpData rsdp_data = {
+            .revision = 2,
+            .oem_id = ACPI_BUILD_APPNAME6,
+            .xsdt_tbl_offset = &xsdt,
+            .rsdt_tbl_offset = NULL,
+        };
+        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
+    }
 
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
-- 
MST


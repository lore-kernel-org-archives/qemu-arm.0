Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6623994wrt;
        Thu, 20 Dec 2018 11:01:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XS5eL8myEP/nSgX6StKTv6236HJNQCLw2S/j1wapzQCc5VhCj11861FHrNbvNQ17LnFioL
X-Received: by 2002:aed:3e49:: with SMTP id m9mr25263755qtf.99.1545332503098;
        Thu, 20 Dec 2018 11:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545332503; cv=none;
        d=google.com; s=arc-20160816;
        b=LPnfvBX8sFlc7CxUlm2DgOrvFs3oS1x3cY7iuc2l4CI54QsnwNmF6p2xpuDw/bXjuG
         9jZnH3hp6ICaZQs1wU+JAQfMYdZTg41uNeNO6j9fI8osd282Dk4n/QtNOgQSC6V0ExJd
         R0JiLdRgRq6vvzQ0F73un+eH6/xFd9ecQc050mEBcewnRlYsXAWEUnpWCVKSuC7jAyHn
         93X3grSP3JstcPpi1OEvUSOQFhtnL1+yS18rzvYSIF93p4QdylSgLUoauEe/XmABkQWa
         wIIF+dpnJv4LyTPG94JHz1IUrpT+psyG/PflIcpgUHk+Jm9pMzLxIR2heuwH6gzyWF53
         KE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=MdTMhmjcMPxLhbY3cyFuTlxrzsjTTakx9kbTfsHfncs=;
        b=LJ3fWy2QW/aTDBBHVPSJwXKPoCjnwZWAJ2rejs43SHDBwH2D6EQwU8FPqQQq5f0UFq
         ks2yjL1NVLNzJbbN4V5QY6CbMeM+R1ZNh9ZfgqNFdkqDY77787QknWwL6pLNUyc7L6qZ
         y+ozgYroQ7SVxo4jGKt8VufdY/4hOzPyIuNgiQDV5EL0sj2cpR1aRivcRMF4PWgS2yTC
         JCMh4sOgNr8gTq1zxgp0/t3PBsWXFvix1XxXaeteYaoc87zO1+mqoNPSqYfd/NQkQuXC
         tJdFZQ1/kCOME8JsAuBJmE+ltNmvke6HvUOrwbzF5Ot7XPDkTHDAg702lqbHDEcdUce4
         LsMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b1si4249470qtr.173.2018.12.20.11.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 11:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ga3Zm-0006sr-7q
	for alex.bennee@linaro.org; Thu, 20 Dec 2018 14:01:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3Ek-0005FY-FF
	for qemu-arm@nongnu.org; Thu, 20 Dec 2018 13:40:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3Ei-0001AB-V0
	for qemu-arm@nongnu.org; Thu, 20 Dec 2018 13:39:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59672)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ga3Ei-0000pW-HJ; Thu, 20 Dec 2018 13:39:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D33340F0E;
	Thu, 20 Dec 2018 18:39:42 +0000 (UTC)
Received: from redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with SMTP id A34EB5EE00;
	Thu, 20 Dec 2018 18:39:41 +0000 (UTC)
Date: Thu, 20 Dec 2018 13:39:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181220183059.20726-26-mst@redhat.com>
References: <20181220183059.20726-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181220183059.20726-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 20 Dec 2018 18:39:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v3 25/44] hw: arm: Carry RSDP specific data
 through AcpiRsdpData
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
X-TUID: JgLyu/4b1bcH

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


Received: by 10.28.91.67 with SMTP id p64csp3332185wmb;
        Mon, 19 Mar 2018 20:18:24 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsP06SxiYNaD3mROywcfFWWglKvr+lFOFUzb/JHZiCta19DY29bOyzSl3DEm9RKW75pI6rt
X-Received: by 10.200.67.4 with SMTP id z4mr21028165qtm.196.1521515903935;
        Mon, 19 Mar 2018 20:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521515903; cv=none;
        d=google.com; s=arc-20160816;
        b=n0/OkXH1UE8a69ONbO/AyebLITiPqyLf0eqeGkCLT2/neF8KL0dj+lyBn+f1r4Hn19
         oYWT4B8H023HEz1A35jQE6L94F/DlCREzuQdfKqA7DS5PUn5Tnyllr47dLqPvhX9Bozb
         EG/Yb4wBisqicZOC1bBclZGKgl3nycgMx12VlKJ1IGFDxELmi6txNK6ZQp61nQZPdilL
         wPWTOG09UXJ5eBMg97w+b2jKIAMjkFBId+NMn6kV76Ic6Ot0x4WEg0U7wq+4GCtCT08J
         0JwJDjKPfruWN7fJb6e23dYQujnh/Z4TYfUdCbIbKA6lpW7CYin/asqIQuhrmbHcA8tn
         PeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=JNRPilagpTA8nY6sOfPAY0o/9KKSP8YqZBUQyO5xUNs=;
        b=UN/+5LcRiitdTNn9CDLFrTRJpESYnFFsed17OsKGr7EfoX6BYiYis8hvWutIfuYeNh
         B/P/M5yti9VQ99mf2+5GIS8Il7YmyYacmp+76QC2DdrkTZyUMucWDgHmBJbte4/qQzpJ
         tentKpxaQqYf2LUMxXOe58OBvq3kiPp/1uHDXdrlDotdBgytuz7PAFXd/tOlQnX10jZ3
         qfZ+LhSxpb6bwsX9d7bnr6mZ5sXNVIgGfIN1iGB6evyKVHojL9Fw4kaATgHHkppNtuDq
         d0oh8EwVNHaoAB58ZPLWIn93O8zrfWKqeCstfEemkLiWGDFmBXWBOWb0TqiiNz8bbdcw
         31kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y28si865307qtm.465.2018.03.19.20.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 20:18:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey7n5-0006oI-BK
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 23:18:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ey7mA-0006Yd-8L
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 23:17:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ey7m9-00084f-3S
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 23:17:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53436 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ey7m4-00080N-1k; Mon, 19 Mar 2018 23:17:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE78977067;
	Tue, 20 Mar 2018 03:17:19 +0000 (UTC)
Received: from redhat.com (ovpn-121-0.rdu2.redhat.com [10.10.121.0])
	by smtp.corp.redhat.com (Postfix) with SMTP id 39E2A6353D;
	Tue, 20 Mar 2018 03:17:17 +0000 (UTC)
Date: Tue, 20 Mar 2018 05:17:16 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1521515720-612046-13-git-send-email-mst@redhat.com>
References: <1521515720-612046-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521515720-612046-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 03:17:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 03:17:19 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PULL v2 12/50] virt_arm: acpi: reuse common
 build_fadt()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ND84aWFmL+I

From: Igor Mammedov <imammedo@redhat.com>

Extend generic build_fadt() to support rev5.1 FADT
and reuse it for 'virt' board, it would allow to
phase out usage of AcpiFadtDescriptorRev5_1 and
later ACPI_FADT_COMMON_DEF.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 12 ++----------
 hw/acpi/aml-build.c         | 23 +++++++++++++++++++++--
 hw/arm/virt-acpi-build.c    | 33 ++++++++++++---------------------
 3 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 3fb0ace..fe15e95 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -165,16 +165,6 @@ struct AcpiFadtDescriptorRev3 {
 } QEMU_PACKED;
 typedef struct AcpiFadtDescriptorRev3 AcpiFadtDescriptorRev3;
 
-struct AcpiFadtDescriptorRev5_1 {
-    ACPI_FADT_COMMON_DEF
-    /* 64-bit Sleep Control register (ACPI 5.0) */
-    struct AcpiGenericAddress sleep_control;
-    /* 64-bit Sleep Status register (ACPI 5.0) */
-    struct AcpiGenericAddress sleep_status;
-} QEMU_PACKED;
-
-typedef struct AcpiFadtDescriptorRev5_1 AcpiFadtDescriptorRev5_1;
-
 typedef struct AcpiFadtData {
     struct AcpiGenericAddress pm1a_cnt;   /* PM1a_CNT_BLK */
     struct AcpiGenericAddress pm1a_evt;   /* PM1a_EVT_BLK */
@@ -192,6 +182,8 @@ typedef struct AcpiFadtData {
     uint8_t  rtc_century;      /* CENTURY */
     uint16_t plvl2_lat;        /* P_LVL2_LAT */
     uint16_t plvl3_lat;        /* P_LVL3_LAT */
+    uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
+    uint8_t minor_ver;         /* FADT Minor Version */
 
     /*
      * respective tables offsets within ACPI_BUILD_TABLE_FILE,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 8f45298..3fa557c 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1679,7 +1679,7 @@ void build_slit(GArray *table_data, BIOSLinker *linker)
                  table_data->len - slit_start, 1, NULL, NULL);
 }
 
-/* build rev1/rev3 FADT */
+/* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
 {
@@ -1755,7 +1755,14 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
 
     build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
     build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
-    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
+    /* Since ACPI 5.1 */
+    if ((f->rev >= 6) || ((f->rev == 5) && f->minor_ver > 0)) {
+        build_append_int_noprefix(tbl, f->arm_boot_arch, 2); /* ARM_BOOT_ARCH */
+        /* FADT Minor Version */
+        build_append_int_noprefix(tbl, f->minor_ver, 1);
+    } else {
+        build_append_int_noprefix(tbl, 0, 3); /* Reserved upto ACPI 5.0 */
+    }
     build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
 
     /* XDSDT address to be filled by Guest linker at runtime */
@@ -1779,6 +1786,18 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
     build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
 
+    if (f->rev <= 4) {
+        goto build_hdr;
+    }
+
+    /* SLEEP_CONTROL_REG */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+    /* SLEEP_STATUS_REG */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+
+    /* TODO: extra fields need to be added to support revisions above rev5 */
+    assert(f->rev == 5);
+
 build_hdr:
     build_header(linker, tbl, (void *)(tbl->data + fadt_start),
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b644da9..c7c6a57 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -654,39 +654,30 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
                             VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
-    int fadt_start = table_data->len;
-    AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
-    unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
-    uint16_t bootflags;
+    /* ACPI v5.1 */
+    AcpiFadtData fadt = {
+        .rev = 5,
+        .minor_ver = 1,
+        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
+        .xdsdt_tbl_offset = &dsdt_tbl_offset,
+    };
 
     switch (vms->psci_conduit) {
     case QEMU_PSCI_CONDUIT_DISABLED:
-        bootflags = 0;
+        fadt.arm_boot_arch = 0;
         break;
     case QEMU_PSCI_CONDUIT_HVC:
-        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT | ACPI_FADT_ARM_PSCI_USE_HVC;
+        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
+                             ACPI_FADT_ARM_PSCI_USE_HVC;
         break;
     case QEMU_PSCI_CONDUIT_SMC:
-        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT;
+        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
         break;
     default:
         g_assert_not_reached();
     }
 
-    /* Hardware Reduced = 1 and use PSCI 0.2+ */
-    fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
-    fadt->arm_boot_flags = cpu_to_le16(bootflags);
-
-    /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
-    fadt->minor_revision = 0x1;
-
-    /* DSDT address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
-        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
-
-    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
-                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
+    build_fadt(table_data, linker, &fadt, NULL, NULL);
 }
 
 /* DSDT */
-- 
MST


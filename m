Received: by 10.28.71.27 with SMTP id u27csp1916151wma;
        Thu, 22 Feb 2018 04:48:16 -0800 (PST)
X-Google-Smtp-Source: AH8x224QLa2EAHkdlz1fxOwF0BtAnSt+nBb8XeM2xBhxETxhl0xE46q2wBCmTaQdP0XXf8L7oS+r
X-Received: by 2002:a25:ba48:: with SMTP id z8-v6mr4436218ybj.33.1519303696804;
        Thu, 22 Feb 2018 04:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519303696; cv=none;
        d=google.com; s=arc-20160816;
        b=lg79M8YYE7HPXC67MI0vEg7oMUOFiTpn/4xv05KWvppovFk6CnTl6ZQYkSaMbafk7N
         0VDEGWRsaqpcITMZq2LuliFhs4/RFfIfk7RPxcDe9rz85bsNc0qVPk2NDVLpxEQ2KQ8V
         JDtN8SwPvdG9JcTo8wrBwYKr7l1kx+Y7529ODgxbxhcr9TNyTapclXuAmlmbh+Y33qB5
         DnM7jz1vOSJ0m4xFuqgoNT4y3xZa3pG5tEvkXufggy24OwQ8KWfy0FwngNX+B2pFusUa
         B8RG7zz7kMbHw55hv59xiUvQv6jaUADHFFXaEF2IDYbt06lfDBjaRawYOZqtC8GIRHX0
         Wylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=lk2kKuy7V1Jih6fk3NYRmOPhlbpjZ0bjBMASuYFE87c=;
        b=eIUn6n2WiZzHuQhuLpPhAHYCyhgWzqxk+rQenRcePZw/JVHUVtP4G78drp3JKy4c8T
         +E+mJryWS9Id4rJFYXuhpzYHvcMKX5pZUcqwHvYnmYpbwSTsC3Zn7zkfbkKbBwIM2LS8
         IKQLy16oxWZlVjcE/0BJbDH5bHK5QQtz0fNg3ZcifwmVWODaTATFt+gy1pJecimBBLYD
         2pAirB/L7VWE40y0zvrjb/IErJKbU2hS4UetKxXOwt1LNrQ4qAV1KOetb4oGNrD2erpL
         xI1sjKLlbR79EMGiI5K+sdQ8Xzw2/V0KIGAkbpm5gSywD7LmUJceN865VUNYRkiuN4Oh
         xSuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e62-v6si3385ybi.301.2018.02.22.04.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 04:48:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoqIK-0000BD-75
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 07:48:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEk-0005e5-QS
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEj-0005M3-0c
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:34 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41766 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eoqEi-0005L3-Rh; Thu, 22 Feb 2018 07:44:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BD37404085A;
	Thu, 22 Feb 2018 12:44:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 648582024CA9;
	Thu, 22 Feb 2018 12:44:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Feb 2018 13:42:56 +0100
Message-Id: <1519303376-92875-10-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Feb 2018 12:44:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Feb 2018 12:44:32 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 9/9] tests: acpi: don't read all fields in
 test_acpi_fadt_table()
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
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OqfOy6WPQFxV

there is no point to read fields here but not actually
checking them so drop it and read only header + dsdt/facs
addresses since it's needed later to fetch that tables.

With this cleanup we can get rid of AcpiFadtDescriptorRev3/
ACPI_FADT_COMMON_DEF which have no users left.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 81 --------------------------------------------
 tests/bios-tables-test.c    | 82 ++++++++++-----------------------------------
 2 files changed, 18 insertions(+), 145 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 34e49dc..1f872ee 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -75,82 +75,6 @@ struct AcpiTableHeader {
 } QEMU_PACKED;
 typedef struct AcpiTableHeader AcpiTableHeader;
 
-/*
- * ACPI Fixed ACPI Description Table (FADT)
- */
-#define ACPI_FADT_COMMON_DEF /* FADT common definition */ \
-    ACPI_TABLE_HEADER_DEF    /* ACPI common table header */ \
-    uint32_t firmware_ctrl;  /* Physical address of FACS */ \
-    uint32_t dsdt;         /* Physical address of DSDT */ \
-    uint8_t  model;        /* System Interrupt Model */ \
-    uint8_t  reserved1;    /* Reserved */ \
-    uint16_t sci_int;      /* System vector of SCI interrupt */ \
-    uint32_t smi_cmd;      /* Port address of SMI command port */ \
-    uint8_t  acpi_enable;  /* Value to write to smi_cmd to enable ACPI */ \
-    uint8_t  acpi_disable; /* Value to write to smi_cmd to disable ACPI */ \
-    /* Value to write to SMI CMD to enter S4BIOS state */ \
-    uint8_t  S4bios_req; \
-    uint8_t  reserved2;    /* Reserved - must be zero */ \
-    /* Port address of Power Mgt 1a acpi_event Reg Blk */ \
-    uint32_t pm1a_evt_blk; \
-    /* Port address of Power Mgt 1b acpi_event Reg Blk */ \
-    uint32_t pm1b_evt_blk; \
-    uint32_t pm1a_cnt_blk; /* Port address of Power Mgt 1a Control Reg Blk */ \
-    uint32_t pm1b_cnt_blk; /* Port address of Power Mgt 1b Control Reg Blk */ \
-    uint32_t pm2_cnt_blk;  /* Port address of Power Mgt 2 Control Reg Blk */ \
-    uint32_t pm_tmr_blk;   /* Port address of Power Mgt Timer Ctrl Reg Blk */ \
-    /* Port addr of General Purpose acpi_event 0 Reg Blk */ \
-    uint32_t gpe0_blk; \
-    /* Port addr of General Purpose acpi_event 1 Reg Blk */ \
-    uint32_t gpe1_blk; \
-    uint8_t  pm1_evt_len;  /* Byte length of ports at pm1_x_evt_blk */ \
-    uint8_t  pm1_cnt_len;  /* Byte length of ports at pm1_x_cnt_blk */ \
-    uint8_t  pm2_cnt_len;  /* Byte Length of ports at pm2_cnt_blk */ \
-    uint8_t  pm_tmr_len;   /* Byte Length of ports at pm_tm_blk */ \
-    uint8_t  gpe0_blk_len; /* Byte Length of ports at gpe0_blk */ \
-    uint8_t  gpe1_blk_len; /* Byte Length of ports at gpe1_blk */ \
-    uint8_t  gpe1_base;    /* Offset in gpe model where gpe1 events start */ \
-    uint8_t  reserved3;    /* Reserved */ \
-    uint16_t plvl2_lat;    /* Worst case HW latency to enter/exit C2 state */ \
-    uint16_t plvl3_lat;    /* Worst case HW latency to enter/exit C3 state */ \
-    uint16_t flush_size;   /* Size of area read to flush caches */ \
-    uint16_t flush_stride; /* Stride used in flushing caches */ \
-    uint8_t  duty_offset;  /* Bit location of duty cycle field in p_cnt reg */ \
-    uint8_t  duty_width;   /* Bit width of duty cycle field in p_cnt reg */ \
-    uint8_t  day_alrm;     /* Index to day-of-month alarm in RTC CMOS RAM */ \
-    uint8_t  mon_alrm;     /* Index to month-of-year alarm in RTC CMOS RAM */ \
-    uint8_t  century;      /* Index to century in RTC CMOS RAM */ \
-    /* IA-PC Boot Architecture Flags (see below for individual flags) */ \
-    uint16_t boot_flags; \
-    uint8_t reserved;    /* Reserved, must be zero */ \
-    /* Miscellaneous flag bits (see below for individual flags) */ \
-    uint32_t flags; \
-    /* 64-bit address of the Reset register */ \
-    struct AcpiGenericAddress reset_register; \
-    /* Value to write to the reset_register port to reset the system */ \
-    uint8_t reset_value; \
-    /* ARM-Specific Boot Flags (see below for individual flags) (ACPI 5.1) */ \
-    uint16_t arm_boot_flags; \
-    uint8_t minor_revision;  /* FADT Minor Revision (ACPI 5.1) */ \
-    uint64_t x_facs;          /* 64-bit physical address of FACS */ \
-    uint64_t x_dsdt;          /* 64-bit physical address of DSDT */ \
-    /* 64-bit Extended Power Mgt 1a Event Reg Blk address */ \
-    struct AcpiGenericAddress xpm1a_event_block; \
-    /* 64-bit Extended Power Mgt 1b Event Reg Blk address */ \
-    struct AcpiGenericAddress xpm1b_event_block; \
-    /* 64-bit Extended Power Mgt 1a Control Reg Blk address */ \
-    struct AcpiGenericAddress xpm1a_control_block; \
-    /* 64-bit Extended Power Mgt 1b Control Reg Blk address */ \
-    struct AcpiGenericAddress xpm1b_control_block; \
-    /* 64-bit Extended Power Mgt 2 Control Reg Blk address */ \
-    struct AcpiGenericAddress xpm2_control_block; \
-    /* 64-bit Extended Power Mgt Timer Ctrl Reg Blk address */ \
-    struct AcpiGenericAddress xpm_timer_block; \
-    /* 64-bit Extended General Purpose Event 0 Reg Blk address */ \
-    struct AcpiGenericAddress xgpe0_block; \
-    /* 64-bit Extended General Purpose Event 1 Reg Blk address */ \
-    struct AcpiGenericAddress xgpe1_block; \
-
 struct AcpiGenericAddress {
     uint8_t space_id;        /* Address space where struct or register exists */
     uint8_t bit_width;       /* Size in bits of given register */
@@ -160,11 +84,6 @@ struct AcpiGenericAddress {
     uint64_t address;        /* 64-bit address of struct or register */
 } QEMU_PACKED;
 
-struct AcpiFadtDescriptorRev3 {
-    ACPI_FADT_COMMON_DEF
-} QEMU_PACKED;
-typedef struct AcpiFadtDescriptorRev3 AcpiFadtDescriptorRev3;
-
 typedef struct AcpiFadtData {
     struct AcpiGenericAddress pm1_cnt;   /* PM1a_CNT_BLK */
     struct AcpiGenericAddress pm1_evt;   /* PM1a_EVT_BLK */
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 65b271a..cd753ff 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -29,7 +29,8 @@ typedef struct {
     uint32_t rsdp_addr;
     AcpiRsdpDescriptor rsdp_table;
     AcpiRsdtDescriptorRev1 rsdt_table;
-    AcpiFadtDescriptorRev3 fadt_table;
+    uint32_t dsdt_addr;
+    uint32_t facs_addr;
     AcpiFacsDescriptorRev1 facs_table;
     uint32_t *rsdt_tables_addr;
     int rsdt_tables_nr;
@@ -127,71 +128,18 @@ static void test_acpi_rsdt_table(test_data *data)
     data->rsdt_tables_nr = tables_nr;
 }
 
-static void test_acpi_fadt_table(test_data *data)
+static void fadt_fetch_facs_and_dsdt_ptrs(test_data *data)
 {
-    AcpiFadtDescriptorRev3 *fadt_table = &data->fadt_table;
     uint32_t addr;
+    AcpiTableHeader hdr;
 
     /* FADT table comes first */
     addr = le32_to_cpu(data->rsdt_tables_addr[0]);
-    ACPI_READ_TABLE_HEADER(fadt_table, addr);
-
-    ACPI_READ_FIELD(fadt_table->firmware_ctrl, addr);
-    ACPI_READ_FIELD(fadt_table->dsdt, addr);
-    ACPI_READ_FIELD(fadt_table->model, addr);
-    ACPI_READ_FIELD(fadt_table->reserved1, addr);
-    ACPI_READ_FIELD(fadt_table->sci_int, addr);
-    ACPI_READ_FIELD(fadt_table->smi_cmd, addr);
-    ACPI_READ_FIELD(fadt_table->acpi_enable, addr);
-    ACPI_READ_FIELD(fadt_table->acpi_disable, addr);
-    ACPI_READ_FIELD(fadt_table->S4bios_req, addr);
-    ACPI_READ_FIELD(fadt_table->reserved2, addr);
-    ACPI_READ_FIELD(fadt_table->pm1a_evt_blk, addr);
-    ACPI_READ_FIELD(fadt_table->pm1b_evt_blk, addr);
-    ACPI_READ_FIELD(fadt_table->pm1a_cnt_blk, addr);
-    ACPI_READ_FIELD(fadt_table->pm1b_cnt_blk, addr);
-    ACPI_READ_FIELD(fadt_table->pm2_cnt_blk, addr);
-    ACPI_READ_FIELD(fadt_table->pm_tmr_blk, addr);
-    ACPI_READ_FIELD(fadt_table->gpe0_blk, addr);
-    ACPI_READ_FIELD(fadt_table->gpe1_blk, addr);
-    ACPI_READ_FIELD(fadt_table->pm1_evt_len, addr);
-    ACPI_READ_FIELD(fadt_table->pm1_cnt_len, addr);
-    ACPI_READ_FIELD(fadt_table->pm2_cnt_len, addr);
-    ACPI_READ_FIELD(fadt_table->pm_tmr_len, addr);
-    ACPI_READ_FIELD(fadt_table->gpe0_blk_len, addr);
-    ACPI_READ_FIELD(fadt_table->gpe1_blk_len, addr);
-    ACPI_READ_FIELD(fadt_table->gpe1_base, addr);
-    ACPI_READ_FIELD(fadt_table->reserved3, addr);
-    ACPI_READ_FIELD(fadt_table->plvl2_lat, addr);
-    ACPI_READ_FIELD(fadt_table->plvl3_lat, addr);
-    ACPI_READ_FIELD(fadt_table->flush_size, addr);
-    ACPI_READ_FIELD(fadt_table->flush_stride, addr);
-    ACPI_READ_FIELD(fadt_table->duty_offset, addr);
-    ACPI_READ_FIELD(fadt_table->duty_width, addr);
-    ACPI_READ_FIELD(fadt_table->day_alrm, addr);
-    ACPI_READ_FIELD(fadt_table->mon_alrm, addr);
-    ACPI_READ_FIELD(fadt_table->century, addr);
-    ACPI_READ_FIELD(fadt_table->boot_flags, addr);
-    ACPI_READ_FIELD(fadt_table->reserved, addr);
-    ACPI_READ_FIELD(fadt_table->flags, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->reset_register, addr);
-    ACPI_READ_FIELD(fadt_table->reset_value, addr);
-    ACPI_READ_FIELD(fadt_table->arm_boot_flags, addr);
-    ACPI_READ_FIELD(fadt_table->minor_revision, addr);
-    ACPI_READ_FIELD(fadt_table->x_facs, addr);
-    ACPI_READ_FIELD(fadt_table->x_dsdt, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1a_event_block, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1b_event_block, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1a_control_block, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm1b_control_block, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm2_control_block, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xpm_timer_block, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xgpe0_block, addr);
-    ACPI_READ_GENERIC_ADDRESS(fadt_table->xgpe1_block, addr);
-
-    ACPI_ASSERT_CMP(fadt_table->signature, "FACP");
-    g_assert(!acpi_calc_checksum((uint8_t *)fadt_table,
-                                 le32_to_cpu(fadt_table->length)));
+    ACPI_READ_TABLE_HEADER(&hdr, addr);
+    ACPI_ASSERT_CMP(hdr.signature, "FACP");
+
+    ACPI_READ_FIELD(data->facs_addr, addr);
+    ACPI_READ_FIELD(data->dsdt_addr, addr);
 }
 
 static void sanitize_fadt_ptrs(test_data *data)
@@ -206,6 +154,12 @@ static void sanitize_fadt_ptrs(test_data *data)
             continue;
         }
 
+        /* check original FADT checksum before sanitizing table */
+        g_assert(!(uint8_t)(
+            acpi_calc_checksum((uint8_t *)sdt, sizeof(AcpiTableHeader)) +
+            acpi_calc_checksum((uint8_t *)sdt->aml, sdt->aml_len)
+        ));
+
         /* sdt->aml field offset := spec offset - header size */
         memset(sdt->aml + 0, 0, 4); /* sanitize FIRMWARE_CTRL(36) ptr */
         memset(sdt->aml + 4, 0, 4); /* sanitize DSDT(40) ptr */
@@ -226,7 +180,7 @@ static void sanitize_fadt_ptrs(test_data *data)
 static void test_acpi_facs_table(test_data *data)
 {
     AcpiFacsDescriptorRev1 *facs_table = &data->facs_table;
-    uint32_t addr = le32_to_cpu(data->fadt_table.firmware_ctrl);
+    uint32_t addr = le32_to_cpu(data->facs_addr);
 
     ACPI_READ_FIELD(facs_table->signature, addr);
     ACPI_READ_FIELD(facs_table->length, addr);
@@ -265,7 +219,7 @@ static void fetch_table(AcpiSdtTable *sdt_table, uint32_t addr)
 static void test_acpi_dsdt_table(test_data *data)
 {
     AcpiSdtTable dsdt_table;
-    uint32_t addr = le32_to_cpu(data->fadt_table.dsdt);
+    uint32_t addr = le32_to_cpu(data->dsdt_addr);
 
     fetch_table(&dsdt_table, addr);
     ACPI_ASSERT_CMP(dsdt_table.header.signature, "DSDT");
@@ -674,7 +628,7 @@ static void test_acpi_one(const char *params, test_data *data)
     test_acpi_rsdp_address(data);
     test_acpi_rsdp_table(data);
     test_acpi_rsdt_table(data);
-    test_acpi_fadt_table(data);
+    fadt_fetch_facs_and_dsdt_ptrs(data);
     test_acpi_facs_table(data);
     test_acpi_dsdt_table(data);
     fetch_rsdt_referenced_tables(data);
-- 
2.7.4


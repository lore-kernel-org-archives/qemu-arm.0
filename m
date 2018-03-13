Received: by 10.28.91.67 with SMTP id p64csp1210668wmb;
        Tue, 13 Mar 2018 14:53:00 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvWIJNLQnsT6f1m/7oJJm1JC4MQtSlFoJi7ZF7M5XkZOSMs9IiyRLtjlejGtCKU0mQR0VWf
X-Received: by 10.200.3.158 with SMTP id t30mr3709345qtg.259.1520977980910;
        Tue, 13 Mar 2018 14:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520977980; cv=none;
        d=google.com; s=arc-20160816;
        b=q48x3kvUMbp4mEgk7Zqys7O+uo4+DQEkndTsQ0Iy5fIaeT6S5YZKM2I6zw/4NL0aLO
         MDrChb3Mhf6aQhbMYv6lKcAFoPGP/OlarVrSBinWiAIpsVXqAJJKoUa3nk8kyeqxjB+6
         ycE+z29jyAXim3I4cceJ3xGiKp1F8a1aArtbKl8vAyu1AfaauaRbyNLXgp7RM8f9/UDX
         nRs68sQCNbd3ZyRnLRn4CWwWG7wVfCV+kbXBnuxC71H1lbgf/Y29oGOxoUdK80h7574e
         KbjgS1g2cF1FERTpIZaqMWN4DDT8ugIOXhSy91maL0L1A8caOorhTFTLDkgI5JUkij/p
         BR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=DVjAENc33s1efWq+i2ldj0m3NB2MZrO2fxy1Umsj0Xs=;
        b=i0Y4U2oTuojba9GLprtmHRNxnrFprlPQ3zrECozobeV+OWGglwnEXfdnAgTcdnITrT
         R5QZvzmTqDqdmdBuvv2eQeCp56inO53edrap8RaLKtq8eauL+b6RusfGKQAUcjfHUzXg
         MRWoJK3ecVAN34ICeaBdSx6HR/jJj+TvH5K1uyMtno6eUaDBkjJ7/xSL+jLa5lKYEqX/
         xHGYD813zDV2+DrxABhXXUU+HCYCCBKGr5icdUh5O6AU2Ghm1n4E8Jg29R1o6O16T5kC
         dyalZdwOaLqdDDyVVscp9G25IukiQeN1A6Zp9mFbvuSxQjrP60JTrLbu6ys05Nrr2uvg
         9Bog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64si351758qtb.401.2018.03.13.14.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 14:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evrqt-0001ZC-St
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 17:52:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1evrjm-00045J-3m
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 17:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1evrjk-0007kK-8o
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 17:45:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35088 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1evrje-0007XE-Bn; Tue, 13 Mar 2018 17:45:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6C83EBFE6;
	Tue, 13 Mar 2018 21:45:29 +0000 (UTC)
Received: from redhat.com (ovpn-121-81.rdu2.redhat.com [10.10.121.81])
	by smtp.corp.redhat.com (Postfix) with SMTP id 28065215CDA7;
	Tue, 13 Mar 2018 21:45:29 +0000 (UTC)
Date: Tue, 13 Mar 2018 23:45:28 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1520977432-187679-12-git-send-email-mst@redhat.com>
References: <1520977432-187679-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520977432-187679-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 13 Mar 2018 21:45:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 13 Mar 2018 21:45:29 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PULL 11/22] acpi: move build_fadt() from i386
 specific to generic ACPI source
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
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmOAdXZjS75Y

From: Igor Mammedov <imammedo@redhat.com>

It will be extended and reused by follow up patch for ARM target.

PS:
Since it's generic function now, don't patch FIRMWARE_CTRL, DSDT
fields if they don't point to tables since platform might not
provide them and use X_ variants instead if applicable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |   3 ++
 hw/acpi/aml-build.c         | 105 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    |   6 +--
 hw/i386/acpi-build.c        | 102 ------------------------------------------
 4 files changed, 111 insertions(+), 105 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 8692ccc..6c36903 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -413,4 +413,7 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
 void build_slit(GArray *table_data, BIOSLinker *linker);
+
+void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
+                const char *oem_id, const char *oem_table_id);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 3fef5f6..8f45298 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1678,3 +1678,108 @@ void build_slit(GArray *table_data, BIOSLinker *linker)
                  "SLIT",
                  table_data->len - slit_start, 1, NULL, NULL);
 }
+
+/* build rev1/rev3 FADT */
+void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
+                const char *oem_id, const char *oem_table_id)
+{
+    int off;
+    int fadt_start = tbl->len;
+
+    acpi_data_push(tbl, sizeof(AcpiTableHeader));
+
+    /* FACS address to be filled by Guest linker at runtime */
+    off = tbl->len;
+    build_append_int_noprefix(tbl, 0, 4); /* FIRMWARE_CTRL */
+    if (f->facs_tbl_offset) { /* don't patch if not supported by platform */
+        bios_linker_loader_add_pointer(linker,
+            ACPI_BUILD_TABLE_FILE, off, 4,
+            ACPI_BUILD_TABLE_FILE, *f->facs_tbl_offset);
+    }
+
+    /* DSDT address to be filled by Guest linker at runtime */
+    off = tbl->len;
+    build_append_int_noprefix(tbl, 0, 4); /* DSDT */
+    if (f->dsdt_tbl_offset) { /* don't patch if not supported by platform */
+        bios_linker_loader_add_pointer(linker,
+            ACPI_BUILD_TABLE_FILE, off, 4,
+            ACPI_BUILD_TABLE_FILE, *f->dsdt_tbl_offset);
+    }
+
+    /* ACPI1.0: INT_MODEL, ACPI2.0+: Reserved */
+    build_append_int_noprefix(tbl, f->int_model /* Multiple APIC */, 1);
+    /* Preferred_PM_Profile */
+    build_append_int_noprefix(tbl, 0 /* Unspecified */, 1);
+    build_append_int_noprefix(tbl, f->sci_int, 2); /* SCI_INT */
+    build_append_int_noprefix(tbl, f->smi_cmd, 4); /* SMI_CMD */
+    build_append_int_noprefix(tbl, f->acpi_enable_cmd, 1); /* ACPI_ENABLE */
+    build_append_int_noprefix(tbl, f->acpi_disable_cmd, 1); /* ACPI_DISABLE */
+    build_append_int_noprefix(tbl, 0 /* not supported */, 1); /* S4BIOS_REQ */
+    /* ACPI1.0: Reserved, ACPI2.0+: PSTATE_CNT */
+    build_append_int_noprefix(tbl, 0, 1);
+    build_append_int_noprefix(tbl, f->pm1a_evt.address, 4); /* PM1a_EVT_BLK */
+    build_append_int_noprefix(tbl, 0, 4); /* PM1b_EVT_BLK */
+    build_append_int_noprefix(tbl, f->pm1a_cnt.address, 4); /* PM1a_CNT_BLK */
+    build_append_int_noprefix(tbl, 0, 4); /* PM1b_CNT_BLK */
+    build_append_int_noprefix(tbl, 0, 4); /* PM2_CNT_BLK */
+    build_append_int_noprefix(tbl, f->pm_tmr.address, 4); /* PM_TMR_BLK */
+    build_append_int_noprefix(tbl, f->gpe0_blk.address, 4); /* GPE0_BLK */
+    build_append_int_noprefix(tbl, 0, 4); /* GPE1_BLK */
+    /* PM1_EVT_LEN */
+    build_append_int_noprefix(tbl, f->pm1a_evt.bit_width / 8, 1);
+    /* PM1_CNT_LEN */
+    build_append_int_noprefix(tbl, f->pm1a_cnt.bit_width / 8, 1);
+    build_append_int_noprefix(tbl, 0, 1); /* PM2_CNT_LEN */
+    build_append_int_noprefix(tbl, f->pm_tmr.bit_width / 8, 1); /* PM_TMR_LEN */
+    /* GPE0_BLK_LEN */
+    build_append_int_noprefix(tbl, f->gpe0_blk.bit_width / 8, 1);
+    build_append_int_noprefix(tbl, 0, 1); /* GPE1_BLK_LEN */
+    build_append_int_noprefix(tbl, 0, 1); /* GPE1_BASE */
+    build_append_int_noprefix(tbl, 0, 1); /* CST_CNT */
+    build_append_int_noprefix(tbl, f->plvl2_lat, 2); /* P_LVL2_LAT */
+    build_append_int_noprefix(tbl, f->plvl3_lat, 2); /* P_LVL3_LAT */
+    build_append_int_noprefix(tbl, 0, 2); /* FLUSH_SIZE */
+    build_append_int_noprefix(tbl, 0, 2); /* FLUSH_STRIDE */
+    build_append_int_noprefix(tbl, 0, 1); /* DUTY_OFFSET */
+    build_append_int_noprefix(tbl, 0, 1); /* DUTY_WIDTH */
+    build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
+    build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
+    build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
+    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
+    build_append_int_noprefix(tbl, 0, 1); /* Reserved */
+    build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
+
+    if (f->rev == 1) {
+        goto build_hdr;
+    }
+
+    build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
+    build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
+    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
+    build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
+
+    /* XDSDT address to be filled by Guest linker at runtime */
+    off = tbl->len;
+    build_append_int_noprefix(tbl, 0, 8); /* X_DSDT */
+    if (f->xdsdt_tbl_offset) {
+        bios_linker_loader_add_pointer(linker,
+            ACPI_BUILD_TABLE_FILE, off, 8,
+            ACPI_BUILD_TABLE_FILE, *f->xdsdt_tbl_offset);
+    }
+
+    build_append_gas_from_struct(tbl, &f->pm1a_evt); /* X_PM1a_EVT_BLK */
+    /* X_PM1b_EVT_BLK */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+    build_append_gas_from_struct(tbl, &f->pm1a_cnt); /* X_PM1a_CNT_BLK */
+    /* X_PM1b_CNT_BLK */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+    /* X_PM2_CNT_BLK */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+    build_append_gas_from_struct(tbl, &f->pm_tmr); /* X_PM_TMR_BLK */
+    build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
+
+build_hdr:
+    build_header(linker, tbl, (void *)(tbl->data + fadt_start),
+                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f7fa795..b644da9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -651,8 +651,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 /* FADT */
-static void build_fadt(GArray *table_data, BIOSLinker *linker,
-                       VirtMachineState *vms, unsigned dsdt_tbl_offset)
+static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
+                            VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
     int fadt_start = table_data->len;
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
@@ -761,7 +761,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
-    build_fadt(tables_blob, tables->linker, vms, dsdt);
+    build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1b387e..ebde2cd 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -298,108 +298,6 @@ build_facs(GArray *table_data, BIOSLinker *linker)
     facs->length = cpu_to_le32(sizeof(*facs));
 }
 
-/* FADT */
-static void
-build_fadt(GArray *tbl, BIOSLinker *linker, AcpiFadtData *f,
-           const char *oem_id, const char *oem_table_id)
-{
-    int off;
-    int fadt_start = tbl->len;
-
-    acpi_data_push(tbl, sizeof(AcpiTableHeader));
-
-    /* FACS address to be filled by Guest linker at runtime */
-    off = tbl->len;
-    build_append_int_noprefix(tbl, 0, 4); /* FIRMWARE_CTRL */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_TABLE_FILE, off, 4,
-        ACPI_BUILD_TABLE_FILE, *f->facs_tbl_offset);
-
-    /* DSDT address to be filled by Guest linker at runtime */
-    off = tbl->len;
-    build_append_int_noprefix(tbl, 0, 4); /* DSDT */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_TABLE_FILE, off, 4,
-        ACPI_BUILD_TABLE_FILE, *f->dsdt_tbl_offset);
-
-    /* ACPI1.0: INT_MODEL, ACPI2.0+: Reserved */
-    build_append_int_noprefix(tbl, f->int_model /* Multiple APIC */, 1);
-    /* Preferred_PM_Profile */
-    build_append_int_noprefix(tbl, 0 /* Unspecified */, 1);
-    build_append_int_noprefix(tbl, f->sci_int, 2); /* SCI_INT */
-    build_append_int_noprefix(tbl, f->smi_cmd, 4); /* SMI_CMD */
-    build_append_int_noprefix(tbl, f->acpi_enable_cmd, 1); /* ACPI_ENABLE */
-    build_append_int_noprefix(tbl, f->acpi_disable_cmd, 1); /* ACPI_DISABLE */
-    build_append_int_noprefix(tbl, 0 /* not supported */, 1); /* S4BIOS_REQ */
-    /* ACPI1.0: Reserved, ACPI2.0+: PSTATE_CNT */
-    build_append_int_noprefix(tbl, 0, 1);
-    build_append_int_noprefix(tbl, f->pm1a_evt.address, 4); /* PM1a_EVT_BLK */
-    build_append_int_noprefix(tbl, 0, 4); /* PM1b_EVT_BLK */
-    build_append_int_noprefix(tbl, f->pm1a_cnt.address, 4); /* PM1a_CNT_BLK */
-    build_append_int_noprefix(tbl, 0, 4); /* PM1b_CNT_BLK */
-    build_append_int_noprefix(tbl, 0, 4); /* PM2_CNT_BLK */
-    build_append_int_noprefix(tbl, f->pm_tmr.address, 4); /* PM_TMR_BLK */
-    build_append_int_noprefix(tbl, f->gpe0_blk.address, 4); /* GPE0_BLK */
-    build_append_int_noprefix(tbl, 0, 4); /* GPE1_BLK */
-    /* PM1_EVT_LEN */
-    build_append_int_noprefix(tbl, f->pm1a_evt.bit_width / 8, 1);
-    /* PM1_CNT_LEN */
-    build_append_int_noprefix(tbl, f->pm1a_cnt.bit_width / 8, 1);
-    build_append_int_noprefix(tbl, 0, 1); /* PM2_CNT_LEN */
-    build_append_int_noprefix(tbl, f->pm_tmr.bit_width / 8, 1); /* PM_TMR_LEN */
-    /* GPE0_BLK_LEN */
-    build_append_int_noprefix(tbl, f->gpe0_blk.bit_width / 8, 1);
-    build_append_int_noprefix(tbl, 0, 1); /* GPE1_BLK_LEN */
-    build_append_int_noprefix(tbl, 0, 1); /* GPE1_BASE */
-    build_append_int_noprefix(tbl, 0, 1); /* CST_CNT */
-    build_append_int_noprefix(tbl, f->plvl2_lat, 2); /* P_LVL2_LAT */
-    build_append_int_noprefix(tbl, f->plvl3_lat, 2); /* P_LVL3_LAT */
-    build_append_int_noprefix(tbl, 0, 2); /* FLUSH_SIZE */
-    build_append_int_noprefix(tbl, 0, 2); /* FLUSH_STRIDE */
-    build_append_int_noprefix(tbl, 0, 1); /* DUTY_OFFSET */
-    build_append_int_noprefix(tbl, 0, 1); /* DUTY_WIDTH */
-    build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
-    build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
-    build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
-    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
-    build_append_int_noprefix(tbl, 0, 1); /* Reserved */
-    build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
-
-    if (f->rev == 1) {
-        goto build_hdr;
-    }
-
-    build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
-    build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
-    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
-    build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
-
-    /* XDSDT address to be filled by Guest linker at runtime */
-    off = tbl->len;
-    build_append_int_noprefix(tbl, 0, 8); /* X_DSDT */
-    if (f->xdsdt_tbl_offset) {
-        bios_linker_loader_add_pointer(linker,
-            ACPI_BUILD_TABLE_FILE, off, 8,
-            ACPI_BUILD_TABLE_FILE, *f->xdsdt_tbl_offset);
-    }
-
-    build_append_gas_from_struct(tbl, &f->pm1a_evt); /* X_PM1a_EVT_BLK */
-    /* X_PM1b_EVT_BLK */
-    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
-    build_append_gas_from_struct(tbl, &f->pm1a_cnt); /* X_PM1a_CNT_BLK */
-    /* X_PM1b_CNT_BLK */
-    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
-    /* X_PM2_CNT_BLK */
-    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
-    build_append_gas_from_struct(tbl, &f->pm_tmr); /* X_PM_TMR_BLK */
-    build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
-    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
-
-build_hdr:
-    build_header(linker, tbl, (void *)(tbl->data + fadt_start),
-                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
-}
-
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry)
 {
-- 
MST


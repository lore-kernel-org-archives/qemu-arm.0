Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1106347lff;
        Tue, 10 Aug 2021 01:31:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbFp3w6QBnGsEFniRt7L4GBy85SPvYRzJzw+xl4HMUZJ1dYt2qM4O9BZU9obXz/Gf9hg1G
X-Received: by 2002:a05:6602:1404:: with SMTP id t4mr100835iov.133.1628584294613;
        Tue, 10 Aug 2021 01:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628584294; cv=none;
        d=google.com; s=arc-20160816;
        b=wo174U3hOQTMDj+8Ji6rCnieztih90PcfDPMXZ+HQbGcTM38GciUPB/Q9Jn7uQPIdD
         nVMqjg1EW94sXEKwQLcFgo0LitJJImQ9JI/l/3AAAdJ4kmgymcQi1QYtPy2hfHf9u2YG
         w1LvqPEfGgXCPXwOyO3HaxEON/Wdah26LGE9Wt2ZVvvMknpEo6O+eoFllszXSYkRZWGg
         U45OsHeLW3n6BFCdGx+NtLCu029zhpmMIJLFaeQ6Q0Mj5OeXZV0qUP3fE5UOPYOR40Wf
         o7EI3351ByXZCLOpv0gFypa2HM4TNb5beTqF87xxMA0q5jn6Spk0+K5eim6uHmxvVfjq
         iy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=J0JJri2zmhnVDEu7T7RJMDsRDEQxFew/bitybF74unw=;
        b=0LUgLF7nii+XIhMLTKZ01bDpJZx2JWouH9CafkftKdxZ109IlHleuMml5hrFHwXLZS
         0GOTo/Ke31JNwH6wJRNFzYBmdLjcQ51gl4OPHyCt7Hhzw/8YSBe4a9txr7dpP417f3vJ
         jo1aXckCgeDQdnfOHtQexL44o+gQoOJp7I4XzHyIdeW3S+btx1akgBWs2cEVUb2gN+SQ
         ejBDDF3j9FhtH4wmN4BRtSOqOUPYszA04QixPK0451AngkgW49MpEkugCaqeY7qvI2zX
         eh/z8+LrjLijQikUPZarNgTZ0NjofgMT9pip9F0nJ1kpV/8GBgsv5vll5sxQq6m1taAB
         8ecw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PYIIOMVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si21232792ilg.9.2021.08.10.01.31.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 01:31:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PYIIOMVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDNAb-000077-R2
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 04:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDNAO-00005U-Gg
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDNAK-0003C9-Lh
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J0JJri2zmhnVDEu7T7RJMDsRDEQxFew/bitybF74unw=;
 b=PYIIOMVZ3PjkLuysfhy5r9yOo1JrmIBwBkfFUIpTa7I9LRhMytZLvaun3gm4veR4B6gcl7
 Z/CrYp4kRI6KfmQ3UDv/eAJ57DbBAtgKW+5NyLBgxA4q0i5XTsxm/SKTMtK26STWQi0bsy
 Dzd6SxEX5ae9qFasGIC4rviEGpp48us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-pHLKJnQiPtyZgsWQrOEBlg-1; Tue, 10 Aug 2021 04:31:13 -0400
X-MC-Unique: pHLKJnQiPtyZgsWQrOEBlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D37708799FC;
 Tue, 10 Aug 2021 08:31:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C6E35C3E0;
 Tue, 10 Aug 2021 08:31:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Tue, 10 Aug 2021 10:30:57 +0200
Message-Id: <20210810083057.99651-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: isl7X3LQs+Dd

ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
this latter allows to describe one or more debug ports.

Generate an DBG2 table featuring a single debug port, the PL011.

The DBG2 specification can be found at:
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Tested by comparing the content with the table generated
by EDK2 along with the SBSA-REF machine (code generated by
DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).

I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
dword access. Also the name exposed by acpica tools is different:
'COM0' in my case where '\_SB.COM0' in SBSA-REF case?
---
 hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++++-
 include/hw/acpi/acpi-defs.h | 50 ++++++++++++++++++++++++
 2 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82..35f27b41df 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -563,6 +563,78 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
+#define ACPI_DBG2_PL011_UART_LENGTH 0x1000
+
+/* DBG2 */
+static void
+build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+{
+    int addr_offset, addrsize_offset, namespace_offset, namespace_length;
+    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
+    struct AcpiGenericAddress *base_address;
+    int dbg2_start = table_data->len;
+    AcpiDbg2Device *dbg2dev;
+    char name[] = "COM0";
+    AcpiDbg2Table *dbg2;
+    uint32_t *addr_size;
+    uint8_t *namespace;
+
+    dbg2 = acpi_data_push(table_data, sizeof *dbg2);
+    dbg2->info_offset = sizeof *dbg2;
+    dbg2->info_count = 1;
+
+    /* debug device info structure */
+
+    dbg2dev = acpi_data_push(table_data, sizeof(AcpiDbg2Device));
+
+    dbg2dev->revision = 0;
+    namespace_length = sizeof name;
+    dbg2dev->length = sizeof *dbg2dev + sizeof(struct AcpiGenericAddress) +
+                      4 + namespace_length;
+    dbg2dev->register_count = 1;
+
+    addr_offset = sizeof *dbg2dev;
+    addrsize_offset = addr_offset + sizeof(struct AcpiGenericAddress);
+    namespace_offset = addrsize_offset + 4;
+
+    dbg2dev->namepath_length = cpu_to_le16(namespace_length);
+    dbg2dev->namepath_offset = cpu_to_le16(namespace_offset);
+    dbg2dev->oem_data_length = cpu_to_le16(0);
+    dbg2dev->oem_data_offset = cpu_to_le16(0); /* No OEM data is present */
+    dbg2dev->port_type = cpu_to_le16(ACPI_DBG2_SERIAL_PORT);
+    dbg2dev->port_subtype = cpu_to_le16(ACPI_DBG2_ARM_PL011);
+
+    dbg2dev->base_address_offset = cpu_to_le16(addr_offset);
+    dbg2dev->address_size_offset = cpu_to_le16(addrsize_offset);
+
+    /*
+     * variable length content:
+     * BaseAddressRegister[1]
+     * AddressSize[1]
+     * NamespaceString[1]
+     */
+
+    base_address = acpi_data_push(table_data,
+                                  sizeof(struct AcpiGenericAddress));
+
+    base_address->space_id = AML_SYSTEM_MEMORY;
+    base_address->bit_width = 8;
+    base_address->bit_offset = 0;
+    base_address->access_width = 1;
+    base_address->address = cpu_to_le64(uart_memmap->base);
+
+    addr_size = acpi_data_push(table_data, sizeof *addr_size);
+    *addr_size = cpu_to_le32(ACPI_DBG2_PL011_UART_LENGTH);
+
+    namespace = acpi_data_push(table_data, namespace_length);
+    memcpy(namespace, name, namespace_length);
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + dbg2_start), "DBG2",
+                 table_data->len - dbg2_start, 3, vms->oem_id,
+                 vms->oem_table_id);
+}
+
 /* MADT */
 static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -790,7 +862,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
+    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
@@ -813,6 +885,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_dbg2(tables_blob, tables->linker, vms);
+
     if (vms->ras) {
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_add_table(table_offsets, tables_blob);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index cf9f44299c..bdb2ebed2c 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -618,4 +618,54 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+/* DBG2 */
+
+/* Types for port_type field above */
+
+#define ACPI_DBG2_SERIAL_PORT       0x8000
+#define ACPI_DBG2_1394_PORT         0x8001
+#define ACPI_DBG2_USB_PORT          0x8002
+#define ACPI_DBG2_NET_PORT          0x8003
+
+/* Subtypes for port_subtype field above */
+
+#define ACPI_DBG2_16550_COMPATIBLE  0x0000
+#define ACPI_DBG2_16550_SUBSET      0x0001
+#define ACPI_DBG2_ARM_PL011         0x0003
+#define ACPI_DBG2_ARM_SBSA_32BIT    0x000D
+#define ACPI_DBG2_ARM_SBSA_GENERIC  0x000E
+#define ACPI_DBG2_ARM_DCC           0x000F
+#define ACPI_DBG2_BCM2835           0x0010
+
+#define ACPI_DBG2_1394_STANDARD     0x0000
+
+#define ACPI_DBG2_USB_XHCI          0x0000
+#define ACPI_DBG2_USB_EHCI          0x0001
+
+/* Debug Device Information Subtable */
+
+struct AcpiDbg2Device {
+    uint8_t  revision;
+    uint16_t length;
+    uint8_t  register_count; /* Number of base_address registers */
+    uint16_t namepath_length;
+    uint16_t namepath_offset;
+    uint16_t oem_data_length;
+    uint16_t oem_data_offset;
+    uint16_t port_type;
+    uint16_t port_subtype;
+    uint8_t  reserved[2];
+    uint16_t base_address_offset;
+    uint16_t address_size_offset;
+}  QEMU_PACKED;
+typedef struct AcpiDbg2Device AcpiDbg2Device;
+
+struct AcpiDbg2Table {
+    ACPI_TABLE_HEADER_DEF /* ACPI common table header */
+    uint32_t info_offset; /* offset to the first debug struct */
+    uint32_t info_count;  /* number of debug device info struct entries */
+    uint8_t  dbg2_device_info[];
+} QEMU_PACKED;
+typedef struct AcpiDbg2Table AcpiDbg2Table;
+
 #endif
-- 
2.26.3


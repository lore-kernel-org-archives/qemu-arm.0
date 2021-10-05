Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5090235lfp;
        Tue, 5 Oct 2021 09:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgeyUd8FZvT1O7zQRmn6eXlB+cdu0EvtXZoVSRy2u+Uxie7IJXB0bIZETu5fdRlHNUT7Dg
X-Received: by 2002:a37:bec4:: with SMTP id o187mr16418418qkf.383.1633452577427;
        Tue, 05 Oct 2021 09:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633452577; cv=none;
        d=google.com; s=arc-20160816;
        b=BoiRt0Vo7uZj7kv4SCNQlnwaz7yRlhno1BZ0A+pP/9QfQuAgieHwg9qr3cUsavT/G6
         v6zRkoRhFlqXP2+w7Z3PBb5LhEm2DxLSKb/7DzAsHjVvzChtDVn8jNQIa9R6fxYwqiiC
         MtqNfFOi6sJhUwKE2JV5PqqXlkcoWAdn+octz9dr4FlnIRTl9qsOmbq6BdZYg65BCWde
         +cOumDC5D9AoePPVo306PD/Vc/Oc03pO44wRrTkDY+PfVyODREE9K7Rc84UQ8mN7IDBu
         mKpONV2krOK0XWl0UB9H3iFcIu2EQYsiALNyN1IxoD8Rt2BeUGRJzbTgrR6A2SvAoiW3
         sXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=umsrLqiFttFCgIiszM/ZAkN29JEPz4rp7f/6mGF1LTk=;
        b=wDNnMStt2RvEtDiPpdpv5BvlORXy2Q+fKdZoCqBd0QRJME/oo5Kq6ytUNYGFHKjAJO
         STtr2Ab94NJOfKc7MIUNIxq7Ki/NBBnkTGC9ETIrrOt/sKYMbsaXoeIcKDdi2acXe4JL
         HW+WDS8bSP4gJGHU/uM5Y65SnjBhQd2Y5dXojntu4RDM0fd7azpg5VrfVuEYAjVQTpUp
         0ZwT3EqpquYEN6JNQ1wRGZhbj2ia4G8w1s7aqgDPSWuaglJMf/90RRAJ2K2x177hsZkW
         AAwu+CdOTbGj9DHojcIkHCe/V9P8WCPGBTMP0XhUqUc3YJ8JXtvIkVVLAB4iZWlf50qG
         4YPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i0API5ol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si257731qvb.11.2021.10.05.09.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 09:49:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i0API5ol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXndI-0006Ct-Sp
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 12:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvP-0002BG-S4
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:04:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvJ-00075U-7f
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umsrLqiFttFCgIiszM/ZAkN29JEPz4rp7f/6mGF1LTk=;
 b=i0API5ol6qPI/Xw0fPxf41UZgIac2vLHI1hwkm7fxXh83/UOuvVOFfrX5bz0KBrUUUBeW7
 D8YRtqKN2Fysj8x2mmT4F//er0UveuGYLq4BAYpA2ISRjVccUMKdKYHgos8qRIewmL/wDB
 lvR8TB/l4i7tfilkFew30BJQaXAZLHs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-TeW9gt2wNwewmGlseDvHUQ-1; Tue, 05 Oct 2021 12:04:06 -0400
X-MC-Unique: TeW9gt2wNwewmGlseDvHUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 200-20020a1c00d1000000b0030b3dce20e1so1516924wma.0
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 09:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=umsrLqiFttFCgIiszM/ZAkN29JEPz4rp7f/6mGF1LTk=;
 b=fDpdROtEdqyXGhDYCz9mR4LIMRnH47E2yNrps3YP04Cfr5o7FAg4pQbZ9hp5zro9u4
 j2WH+Q5I8vxZlJPXO4non0zAiW88PcXpT7v2ttEMZs2/2JMphxkSPzgN8KycatZ+wGzZ
 IzsgaQtBO9ExYjJjqNqLQTqOM4k1UROrrahIguH/DaSN36F7zeMG+49wThYQrmg+GGDz
 2y2EhGpDTXkAC2TNR/p681xcEIW6sBF3Bd84QrxEVcpqo816ejGOWEGfsq8nLncBlUvp
 6l0PUYkXYaTHg/lF/pMYwoCpXmtdIK6VkyQAYzqexBGkqKND0Bv2hNRblhxn/+4ZU/ix
 ZX2A==
X-Gm-Message-State: AOAM533fwze6hU5SsQkmB6ZaPhykJsb0hj0N+qQQBZD5ySR5lZPJf+0a
 XisGB1mEyyX0CVfX6SO2KnB/cA+ZVsAaXabCiUX204zs1DQRMgqo4T39iPHThHIWe/MTuGiqvlR
 cLeIvn9fGKYNA
X-Received: by 2002:a5d:4911:: with SMTP id x17mr19457737wrq.173.1633449845428; 
 Tue, 05 Oct 2021 09:04:05 -0700 (PDT)
X-Received: by 2002:a5d:4911:: with SMTP id x17mr19457695wrq.173.1633449845148; 
 Tue, 05 Oct 2021 09:04:05 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id r26sm2300554wmh.35.2021.10.05.09.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:04 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/57] acpi: arm/virt: build_spcr: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-46-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HiefOfTDlJLN

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

while at it, replace packed structure with endian agnostic
build_append_FOO() API.

PS:
Spec is Microsoft hosted, however 1.02 is no where to be found
(MS lists only the current revision) and the current revision is 1.07,
so bring comments in line with 1.07 as this is the only available spec.
There is no content change between originally implemented 1.02
(using QEMU code as reference) and 1.07. The only change is renaming
'Reserved2' field to 'Language', with the same 0 value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-32-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 32 -----------------
 hw/arm/virt-acpi-build.c    | 68 ++++++++++++++++++++++---------------
 2 files changed, 41 insertions(+), 59 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 6f2f08a9de..012c4ffb3a 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -117,38 +117,6 @@ typedef struct AcpiFadtData {
 #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
 #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
 
-/*
- * Serial Port Console Redirection Table (SPCR), Rev. 1.02
- *
- * For .interface_type see Debug Port Table 2 (DBG2) serial port
- * subtypes in Table 3, Rev. May 22, 2012
- */
-struct AcpiSerialPortConsoleRedirection {
-    ACPI_TABLE_HEADER_DEF
-    uint8_t  interface_type;
-    uint8_t  reserved1[3];
-    struct AcpiGenericAddress base_address;
-    uint8_t  interrupt_types;
-    uint8_t  irq;
-    uint32_t gsi;
-    uint8_t  baud;
-    uint8_t  parity;
-    uint8_t  stopbits;
-    uint8_t  flowctrl;
-    uint8_t  term_type;
-    uint8_t  reserved2;
-    uint16_t pci_device_id;
-    uint16_t pci_vendor_id;
-    uint8_t  pci_bus;
-    uint8_t  pci_slot;
-    uint8_t  pci_func;
-    uint32_t pci_flags;
-    uint8_t  pci_seg;
-    uint32_t reserved3;
-} QEMU_PACKED;
-typedef struct AcpiSerialPortConsoleRedirection
-               AcpiSerialPortConsoleRedirection;
-
 /*
  * ACPI 1.0 Firmware ACPI Control Structure (FACS)
  */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7b8706b305..7b79fae0ad 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -453,39 +453,53 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     g_array_free(its_idmaps, true);
 }
 
+/*
+ * Serial Port Console Redirection Table (SPCR)
+ * Rev: 1.07
+ */
 static void
 build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    AcpiSerialPortConsoleRedirection *spcr;
-    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
-    int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
-    int spcr_start = table_data->len;
+    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
-    spcr = acpi_data_push(table_data, sizeof(*spcr));
+    acpi_table_begin(&table, table_data);
 
-    spcr->interface_type = 0x3;    /* ARM PL011 UART */
+    /* Interface Type */
+    build_append_int_noprefix(table_data, 3, 1); /* ARM PL011 UART */
+    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
+    /* Base Address */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
+                     vms->memmap[VIRT_UART].base);
+    /* Interrupt Type */
+    build_append_int_noprefix(table_data,
+        (1 << 3) /* Bit[3] ARMH GIC interrupt */, 1);
+    build_append_int_noprefix(table_data, 0, 1); /* IRQ */
+    /* Global System Interrupt */
+    build_append_int_noprefix(table_data,
+                              vms->irqmap[VIRT_UART] + ARM_SPI_BASE, 4);
+    build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate */
+    build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Parity */
+    /* Stop Bits */
+    build_append_int_noprefix(table_data, 1 /* 1 Stop bit */, 1);
+    /* Flow Control */
+    build_append_int_noprefix(table_data,
+        (1 << 1) /* RTS/CTS hardware flow control */, 1);
+    /* Terminal Type */
+    build_append_int_noprefix(table_data, 0 /* VT100 */, 1);
+    build_append_int_noprefix(table_data, 0, 1); /* Language */
+    /* PCI Device ID  */
+    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
+    /* PCI Vendor ID */
+    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Bus Number */
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Device Number */
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Function Number */
+    build_append_int_noprefix(table_data, 0, 4); /* PCI Flags */
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Segment */
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
-    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
-    spcr->base_address.bit_width = 8;
-    spcr->base_address.bit_offset = 0;
-    spcr->base_address.access_width = 1;
-    spcr->base_address.address = cpu_to_le64(uart_memmap->base);
-
-    spcr->interrupt_types = (1 << 3); /* Bit[3] ARMH GIC interrupt */
-    spcr->gsi = cpu_to_le32(irq);  /* Global System Interrupt */
-
-    spcr->baud = 3;                /* Baud Rate: 3 = 9600 */
-    spcr->parity = 0;              /* No Parity */
-    spcr->stopbits = 1;            /* 1 Stop bit */
-    spcr->flowctrl = (1 << 1);     /* Bit[1] = RTS/CTS hardware flow control */
-    spcr->term_type = 0;           /* Terminal Type: 0 = VT100 */
-
-    spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
-    spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
-
-    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
-                 "SPCR", table_data->len - spcr_start, 2, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /*
-- 
MST


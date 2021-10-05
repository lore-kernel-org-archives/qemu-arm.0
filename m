Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5083642lfp;
        Tue, 5 Oct 2021 09:41:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSPf+Os5vzHRpgBa/59K/VAT2xKWWRM8Y3hnwMY8d5zQ71TsU6URMHamPhs3U7UOSTg+3g
X-Received: by 2002:ac8:d0:: with SMTP id d16mr1841058qtg.196.1633452096614;
        Tue, 05 Oct 2021 09:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633452096; cv=none;
        d=google.com; s=arc-20160816;
        b=Udi/qQMqkacyuhwVblrygpRZyTXxM/y0+4w2WL0PR1Wxx/DL4d6m1A1ojLnlRGHjH6
         TbNw3sajA/dC4DFuekzX/waIc3YUMQP54HMZ5q3aNB/TUE5Th+EITJvMeCD69XLKeljz
         Ve85ExBBThtk66S6JUrY+Ll/oc/2gXpHnu9mi/uYAZyFujPGWilag9nOu+sTh0Hvc/nx
         64yrqawNAJ1eneOD5YajJT/j5yvSzSJgty/DWqxDR9K0lSRGdlI/3Huqc2DjsZfTkrAa
         8Hc45CsmVoH3uWhgghALAizeIowkzG+V+tVCl/KPAQuidCYUsrdGDZk8e0hYVKqcqqer
         K2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=IJsGrjG7v7nwRM18b6PA9SOYSO3Rcoy2CdAVeRcpvfA=;
        b=FzELKSoQhtincUA+OHzgpHhW8GtlN1WhE+PHdMTuTr0wmIirhzEV7/+wql6Kfo/ZeS
         dwP00gVuFll/nRO9nXTW7hgIMCGA8kxAIsrxVDBJzkc1l3+lg7vFirdFeGgRrlBVwcpI
         fZp+1D6M+e113DGGb0uBZ23E8MEGbr9aj7Bp9QDJh2BDru15ZkadCUFrJl9LKNzvQ6BK
         2A7moMLk3pYw79oYw1C0dWucww7EoFpQVTULbH4qUW1+UO6L3ZxxDGQRLvIEBOcpo6x8
         rgS1tVOs2Qt8DCYBm36Nd4WuoL6y5dO73WBqDXjkeDX+Oo0Nh0kmYRkJZZXlrySAlQOg
         JN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IfB5WiVH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si12901226qtx.424.2021.10.05.09.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 09:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IfB5WiVH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXnVX-00022o-W7
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 12:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuk-0001ih-16
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmui-0006bK-0u
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJsGrjG7v7nwRM18b6PA9SOYSO3Rcoy2CdAVeRcpvfA=;
 b=IfB5WiVHTahXQPwuD+oePDKNFXeCXlZrIY6Rk6Xy7xoI6hqZ9eJm0vbksHMXUExjtunLd1
 zEEwGMs50Sl1jdyCtO2uc1N1KQnAGqve7qd6tlgQpZH/4R972hkMs1qRKzTNG1GldL0mgY
 arts4sCderiHHjlV6kKEwDbcwGBIDGg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-H23RWc-8MMGtRAwiA7GlmA-1; Tue, 05 Oct 2021 12:03:29 -0400
X-MC-Unique: H23RWc-8MMGtRAwiA7GlmA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so9253040wma.4
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 09:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IJsGrjG7v7nwRM18b6PA9SOYSO3Rcoy2CdAVeRcpvfA=;
 b=6MphLGS6lLEhfUjq3RbgsQhOHM51LSJFVoF4q4LttyVAVQCMrDhD4LDJ0IPNr/BpSZ
 iyqLz3HzGKfPQOAs4ehi58jXsxvNc03DSgHWhaejlXaGmvxb8ivyTEZlDjD5ELcxpTbE
 pUOiTtWANW9RiTdl+P/QPNhFjK2ZHjkycwi6kubMZ2i8L8GzT7drL2QMTrRxFcHpSvhM
 K1xYp12L5r6TP/zYAjNqT4VtGlm7tRHjOzscg95t1Oy4pYSV1/hmG/ntd7mU0FeyYLfs
 vKkuRHiZjzILQGwjF+56Whf4stJlyQiE6ojXteyPOGBhnaxJWbyr2LTsBH+7mYATP7Qp
 Nw6g==
X-Gm-Message-State: AOAM531LzSNdlnd1nDOaDBni1v3PvHCADpFs1dSpl7HtHPHl2tEi3WWj
 Wr7X1P9UX+O1IxMTuXIwXRBsdQTsSYlWoQXOMl0PdAQuha1m5of82SyiJ6aaDDyVsoBgv7fH7vV
 I8VJj9rxU8IvN
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr4268763wri.64.1633449808542; 
 Tue, 05 Oct 2021 09:03:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr4268720wri.64.1633449808303; 
 Tue, 05 Oct 2021 09:03:28 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id l16sm2502701wmj.33.2021.10.05.09.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:27 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/57] acpi: madt: arm/x86: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-36-mst@redhat.com>
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
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IbCcs/46FSvL

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-22-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h |  9 ---------
 hw/arm/virt-acpi-build.c    | 19 +++++++++++--------
 hw/i386/acpi-common.c       | 19 +++++++++++--------
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c4f0a202e8..c7fa5caa06 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -176,15 +176,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 #define ACPI_DUAL_PIC                0
 #define ACPI_MULTIPLE_APIC           1
 
-/* Master MADT */
-
-struct AcpiMultipleApicTable {
-    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
-    uint32_t local_apic_address;     /* Physical address of local APIC */
-    uint32_t flags;
-} QEMU_PACKED;
-typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
-
 /* Values for Type in APIC sub-headers */
 
 #define ACPI_APIC_PROCESSOR          0
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ba02cf281..e3bdcd44e8 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -567,19 +567,26 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
-/* MADT */
+/*
+ * ACPI spec, Revision 5.0
+ * 5.2.12 Multiple APIC Description Table (MADT)
+ */
 static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    int madt_start = table_data->len;
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
     int i;
+    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
-    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
+    acpi_table_begin(&table, table_data);
+    /* Local Interrupt Controller Address */
+    build_append_int_noprefix(table_data, 0, 4);
+    build_append_int_noprefix(table_data, 0, 4); /* Flags */
 
     gicd = acpi_data_push(table_data, sizeof *gicd);
     gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
@@ -650,11 +657,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gic_msi->spi_count = cpu_to_le16(NUM_GICV2M_SPIS);
         gic_msi->spi_base = cpu_to_le16(irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE);
     }
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /* FADT */
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1f5947fcf9..a0cde1d874 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -71,24 +71,29 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
     }
 }
 
+/*
+ * ACPI spec, Revision 1.0b
+ * 5.2.8 Multiple APIC Description Table
+ */
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                      X86MachineState *x86ms, AcpiDeviceIf *adev,
                      const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
-    int madt_start = table_data->len;
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
     bool x2apic_mode = false;
 
-    AcpiMultipleApicTable *madt;
     AcpiMadtIoApic *io_apic;
     AcpiMadtIntsrcovr *intsrcovr;
     int i;
+    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
 
-    madt = acpi_data_push(table_data, sizeof *madt);
-    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
-    madt->flags = cpu_to_le32(1);
+    acpi_table_begin(&table, table_data);
+    /* Local APIC Address */
+    build_append_int_noprefix(table_data, APIC_DEFAULT_ADDRESS, 4);
+    build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
         adevc->madt_cpu(adev, i, apic_ids, table_data);
@@ -156,8 +161,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
         local_nmi->lint         = 1; /* ACPI_LINT1 */
     }
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
-- 
MST


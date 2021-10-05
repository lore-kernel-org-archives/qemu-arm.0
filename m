Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5080951lfp;
        Tue, 5 Oct 2021 09:38:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcvrZ3vqWIRmxHGdsahf/DVzKLylY23o55jiw/bWQ4tHNfIMtOdx20E5VP6a3KYfwk/xTk
X-Received: by 2002:a05:622a:202:: with SMTP id b2mr20948111qtx.205.1633451901714;
        Tue, 05 Oct 2021 09:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633451901; cv=none;
        d=google.com; s=arc-20160816;
        b=kaDHe65Y3V24vONX9L2NYyoubA5p4AB+oXur4KvGNhq7CY+MoHRFQmaPgkVALQ2Zgi
         o9wkkymVzSh6FGKBT4S4nKTKB2+hI8/FwRXDK/J42OJZpD5JIQmPl2Gj1RDT93tvsq/j
         Y1K+M3TKJZGTO/rvOmJBlijpyTc/5jQpNnFfqjghVeEfBhXMvxQwHKzp5yb/v+QffGo6
         dewidBoPE3PZ+Ml7+uFlTcJ8zXNVNA+sj+qGCUAagXRStUM6C1ES4BQawLFzquYx/0WP
         h5v7iprPaRg0OQmRW8izj1ikBkdqPBE+08EmMYaec2eVVRd2V9RWDX9+lx2DRVD4PJH4
         jjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=3DwFtuti80YCvkyahMaSmY/s+KW5J9Y1bN6GlNEW1AU=;
        b=V3W7+ruXvgZJda0inlVFbO3SxrZDBnuISXnZOrfjUwdXfzKA857TUE+TUeLnwmQA6F
         2rv2Tg4HjEzpn+oyLgAbe7uq7lbls+hr33NT3GLuLcqG3Zq5mGjvmZErJxE+ck+BQPF8
         BcWwG+hKPLVO1DpRuc5lZctzrLaxJuXhnOsoe3qrmkBUBHq5kTe6z6E67a0EN0JLeMwl
         bGzamzeTuPFd1RGVpqyqMuH4JxJ/3i5SIg8i41pI93aq/kbzqPaJDNesKJmKWGZ6yCmu
         7cSrs+2UBariPAlA/bBde7GSbOFzhDc5nqf3cMERmmb2b3v2ObI4wsHTlRL2VMct/VRU
         1B/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q1mIN5f0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si1085533qkj.114.2021.10.05.09.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 09:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q1mIN5f0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXnSP-0005FI-4d
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 12:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuL-0001Sb-Do
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuI-0006D4-PL
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3DwFtuti80YCvkyahMaSmY/s+KW5J9Y1bN6GlNEW1AU=;
 b=Q1mIN5f01ek5DfCVYXd9BEusEPY2aC5/rclJlsoxpGT3A+s8mU05rOLHTJdlyF3mJzQ3Nr
 jDeADtOr9YxF6F0h7JdNxHT9v1IQVfKYeq2UpIW9NNNISHEbfstIk7NANwmhcTBK7oMfTM
 bDN5ikL+wtQQSgiQtZiQjN08WYt3N3I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-e_N6nvpOPkWiC1_FuqPPYw-1; Tue, 05 Oct 2021 12:03:04 -0400
X-MC-Unique: e_N6nvpOPkWiC1_FuqPPYw-1
Received: by mail-wr1-f69.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso5866733wrb.20
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 09:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3DwFtuti80YCvkyahMaSmY/s+KW5J9Y1bN6GlNEW1AU=;
 b=1m2HPf7UK3MjQlc9pUT8MEHFMMLuvgseOtzI/CEB1lE5OIPPII5eBBfbNy7e+xUevR
 kseLLp9c5n1YChVrd/MuqiAACgKKvFA9epgk2TyF0YtkiDF0A622TPLYSJv8bL+K6jaf
 prxDaCxV6eclg3oaZ4yDFNBAR3zEVa8hMKCZyHdRyYn+Z0O+dWRKWJ06skaQU0wYIqhq
 RWW0euS8QziXBsAAJU83AzPH72hMRGKFYu8ewylIx8O4Mt30j/+QKT83pRFKHLlbfVQf
 MbvdOTLfbIQZAd34feb+LFhioNGBMsj7tOfjLwt5u5yERi2IMSXvBG6wX8B5ZwLFvYMP
 h/Pg==
X-Gm-Message-State: AOAM530bsFk8oSmYVO7kacSgaqv5td1oArV5CVDlmS9B8GUrmTDsFVTh
 EkHcA32qP4yw0uDQ3b11+lJgxS+MGuEGej+mXGJnvw7xxtItEwrQY+QBU5ZR7o/mmgU+jWP43fh
 iriOiHQK2shRy
X-Received: by 2002:adf:a54f:: with SMTP id j15mr17330710wrb.218.1633449782818; 
 Tue, 05 Oct 2021 09:03:02 -0700 (PDT)
X-Received: by 2002:adf:a54f:: with SMTP id j15mr17330675wrb.218.1633449782572; 
 Tue, 05 Oct 2021 09:03:02 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id n66sm2486265wmn.2.2021.10.05.09.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:01 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/57] acpi: use build_append_int_noprefix() API to compose
 SRAT table
Message-ID: <20211005155946.513818-32-mst@redhat.com>
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QHxMpGZb5q7l

From: Igor Mammedov <imammedo@redhat.com>

Drop usage of packed structures and explicit endian conversions
when building SRAT tables for arm/x86 and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-18-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 49 -----------------------
 include/hw/acpi/aml-build.h |  2 +-
 hw/acpi/aml-build.c         | 24 ++++++++----
 hw/acpi/nvdimm.c            |  4 +-
 hw/arm/virt-acpi-build.c    | 29 ++++++++------
 hw/i386/acpi-build.c        | 78 +++++++++++++++++++++----------------
 6 files changed, 80 insertions(+), 106 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 5826ee04b6..d293304f9c 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -358,55 +358,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-#define ACPI_SRAT_PROCESSOR_APIC     0
-#define ACPI_SRAT_MEMORY             1
-#define ACPI_SRAT_PROCESSOR_x2APIC   2
-#define ACPI_SRAT_PROCESSOR_GICC     3
-
-struct AcpiSratProcessorAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint8_t     proximity_lo;
-    uint8_t     local_apic_id;
-    uint32_t    flags;
-    uint8_t     local_sapic_eid;
-    uint8_t     proximity_hi[3];
-    uint32_t    reserved;
-} QEMU_PACKED;
-typedef struct AcpiSratProcessorAffinity AcpiSratProcessorAffinity;
-
-struct AcpiSratProcessorX2ApicAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint16_t    reserved;
-    uint32_t    proximity_domain;
-    uint32_t    x2apic_id;
-    uint32_t    flags;
-    uint32_t    clk_domain;
-    uint32_t    reserved2;
-} QEMU_PACKED;
-typedef struct AcpiSratProcessorX2ApicAffinity AcpiSratProcessorX2ApicAffinity;
-
-struct AcpiSratMemoryAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint32_t    proximity;
-    uint16_t    reserved1;
-    uint64_t    base_addr;
-    uint64_t    range_length;
-    uint32_t    reserved2;
-    uint32_t    flags;
-    uint32_t    reserved3[2];
-} QEMU_PACKED;
-typedef struct AcpiSratMemoryAffinity AcpiSratMemoryAffinity;
-
-struct AcpiSratProcessorGiccAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint32_t    proximity;
-    uint32_t    acpi_processor_uid;
-    uint32_t    flags;
-    uint32_t    clock_domain;
-} QEMU_PACKED;
-
-typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
-
 /* DMAR - DMA Remapping table r2.2 */
 struct AcpiTableDmar {
     ACPI_TABLE_HEADER_DEF
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 4242382399..6e1f42e119 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -487,7 +487,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
                uint32_t mmio32_offset, uint64_t mmio64_offset,
                uint16_t bus_nr_offset);
 
-void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
+void build_srat_memory(GArray *table_data, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 23cda45ee0..c0f339847a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1940,15 +1940,25 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     acpi_table_end(linker, &table);
 }
 
-void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
+/*
+ * ACPI spec, Revision 4.0
+ * 5.2.16.2 Memory Affinity Structure
+ */
+void build_srat_memory(GArray *table_data, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags)
 {
-    numamem->type = ACPI_SRAT_MEMORY;
-    numamem->length = sizeof(*numamem);
-    numamem->proximity = cpu_to_le32(node);
-    numamem->flags = cpu_to_le32(flags);
-    numamem->base_addr = cpu_to_le64(base);
-    numamem->range_length = cpu_to_le64(len);
+    build_append_int_noprefix(table_data, 1, 1); /* Type */
+    build_append_int_noprefix(table_data, 40, 1); /* Length */
+    build_append_int_noprefix(table_data, node, 4); /* Proximity Domain */
+    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
+    build_append_int_noprefix(table_data, base, 4); /* Base Address Low */
+    /* Base Address High */
+    build_append_int_noprefix(table_data, base >> 32, 4);
+    build_append_int_noprefix(table_data, len, 4); /* Length Low */
+    build_append_int_noprefix(table_data, len >> 32, 4); /* Length High */
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    build_append_int_noprefix(table_data, flags, 4); /* Flags */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 }
 
 /*
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index a7539cfe89..5f9b552d6a 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1336,7 +1336,6 @@ void nvdimm_build_srat(GArray *table_data)
     GSList *device_list = nvdimm_get_device_list();
 
     for (; device_list; device_list = device_list->next) {
-        AcpiSratMemoryAffinity *numamem = NULL;
         DeviceState *dev = device_list->data;
         Object *obj = OBJECT(dev);
         uint64_t addr, size;
@@ -1346,8 +1345,7 @@ void nvdimm_build_srat(GArray *table_data)
         addr = object_property_get_uint(obj, PC_DIMM_ADDR_PROP, &error_abort);
         size = object_property_get_uint(obj, PC_DIMM_SIZE_PROP, &error_abort);
 
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, addr, size, node,
+        build_srat_memory(table_data, addr, size, node,
                           MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
     }
     g_slist_free(device_list);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 21efe7fe34..6ba02cf281 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -474,11 +474,13 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
+/*
+ * ACPI spec, Revision 5.1
+ * 5.2.16 System Resource Affinity Table (SRAT)
+ */
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    AcpiSratProcessorGiccAffinity *core;
-    AcpiSratMemoryAffinity *numamem;
     int i;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
@@ -492,19 +494,23 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
     for (i = 0; i < cpu_list->len; ++i) {
-        core = acpi_data_push(table_data, sizeof(*core));
-        core->type = ACPI_SRAT_PROCESSOR_GICC;
-        core->length = sizeof(*core);
-        core->proximity = cpu_to_le32(cpu_list->cpus[i].props.node_id);
-        core->acpi_processor_uid = cpu_to_le32(i);
-        core->flags = cpu_to_le32(1);
+        uint32_t nodeid = cpu_list->cpus[i].props.node_id;
+        /*
+         * 5.2.16.4 GICC Affinity Structure
+         */
+        build_append_int_noprefix(table_data, 3, 1);      /* Type */
+        build_append_int_noprefix(table_data, 18, 1);     /* Length */
+        build_append_int_noprefix(table_data, nodeid, 4); /* Proximity Domain */
+        build_append_int_noprefix(table_data, i, 4); /* ACPI Processor UID */
+        /* Flags, Table 5-76 */
+        build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
+        build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
     }
 
     mem_base = vms->memmap[VIRT_MEM].base;
     for (i = 0; i < ms->numa_state->num_nodes; ++i) {
         if (ms->numa_state->nodes[i].node_mem > 0) {
-            numamem = acpi_data_push(table_data, sizeof(*numamem));
-            build_srat_memory(numamem, mem_base,
+            build_srat_memory(table_data, mem_base,
                               ms->numa_state->nodes[i].node_mem, i,
                               MEM_AFFINITY_ENABLED);
             mem_base += ms->numa_state->nodes[i].node_mem;
@@ -516,8 +522,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     if (ms->device_memory) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, ms->device_memory->base,
+        build_srat_memory(table_data, ms->device_memory->base,
                           memory_region_size(&ms->device_memory->mr),
                           ms->numa_state->num_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1ce808c576..078097a060 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1939,13 +1939,15 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
 
+/*
+ * ACPI spec, Revision 3.0
+ * 5.2.15 System Resource Affinity Table (SRAT)
+ */
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
-    AcpiSratMemoryAffinity *numamem;
-
     int i;
-    int numa_start, slots;
+    int numa_mem_start, slots;
     uint64_t mem_len, mem_base, next_base;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
@@ -1968,34 +1970,41 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         uint32_t apic_id = apic_ids->cpus[i].arch_id;
 
         if (apic_id < 255) {
-            AcpiSratProcessorAffinity *core;
-
-            core = acpi_data_push(table_data, sizeof *core);
-            core->type = ACPI_SRAT_PROCESSOR_APIC;
-            core->length = sizeof(*core);
-            core->local_apic_id = apic_id;
-            core->proximity_lo = node_id;
-            memset(core->proximity_hi, 0, 3);
-            core->local_sapic_eid = 0;
-            core->flags = cpu_to_le32(1);
+            /* 5.2.15.1 Processor Local APIC/SAPIC Affinity Structure */
+            build_append_int_noprefix(table_data, 0, 1);  /* Type  */
+            build_append_int_noprefix(table_data, 16, 1); /* Length */
+            /* Proximity Domain [7:0] */
+            build_append_int_noprefix(table_data, node_id, 1);
+            build_append_int_noprefix(table_data, apic_id, 1); /* APIC ID */
+            /* Flags, Table 5-36 */
+            build_append_int_noprefix(table_data, 1, 4);
+            build_append_int_noprefix(table_data, 0, 1); /* Local SAPIC EID */
+            /* Proximity Domain [31:8] */
+            build_append_int_noprefix(table_data, 0, 3);
+            build_append_int_noprefix(table_data, 0, 4); /* Reserved */
         } else {
-            AcpiSratProcessorX2ApicAffinity *core;
-
-            core = acpi_data_push(table_data, sizeof *core);
-            core->type = ACPI_SRAT_PROCESSOR_x2APIC;
-            core->length = sizeof(*core);
-            core->x2apic_id = cpu_to_le32(apic_id);
-            core->proximity_domain = cpu_to_le32(node_id);
-            core->flags = cpu_to_le32(1);
+            /*
+             * ACPI spec, Revision 4.0
+             * 5.2.16.3 Processor Local x2APIC Affinity Structure
+             */
+            build_append_int_noprefix(table_data, 2, 1);  /* Type  */
+            build_append_int_noprefix(table_data, 24, 1); /* Length */
+            build_append_int_noprefix(table_data, 0, 2); /* Reserved */
+            /* Proximity Domain */
+            build_append_int_noprefix(table_data, node_id, 4);
+            build_append_int_noprefix(table_data, apic_id, 4); /* X2APIC ID */
+            /* Flags, Table 5-39 */
+            build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
+            build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
+            build_append_int_noprefix(table_data, 0, 4); /* Reserved */
         }
     }
 
-
     /* the memory map is a bit tricky, it contains at least one hole
      * from 640k-1M and possibly another one from 3.5G-4G.
      */
     next_base = 0;
-    numa_start = table_data->len;
+    numa_mem_start = table_data->len;
 
     for (i = 1; i < nb_numa_nodes + 1; ++i) {
         mem_base = next_base;
@@ -2007,8 +2016,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
             next_base > HOLE_640K_START) {
             mem_len -= next_base - HOLE_640K_START;
             if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
 
@@ -2026,8 +2034,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
             next_base > x86ms->below_4g_mem_size) {
             mem_len -= next_base - x86ms->below_4g_mem_size;
             if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
             mem_base = 1ULL << 32;
@@ -2036,8 +2043,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         }
 
         if (mem_len > 0) {
-            numamem = acpi_data_push(table_data, sizeof *numamem);
-            build_srat_memory(numamem, mem_base, mem_len, i - 1,
+            build_srat_memory(table_data, mem_base, mem_len, i - 1,
                               MEM_AFFINITY_ENABLED);
         }
     }
@@ -2046,10 +2052,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         nvdimm_build_srat(table_data);
     }
 
-    slots = (table_data->len - numa_start) / sizeof *numamem;
+    /*
+     * TODO: this part is not in ACPI spec and current linux kernel boots fine
+     * without these entries. But I recall there were issues the last time I
+     * tried to remove it with some ancient guest OS, however I can't remember
+     * what that was so keep this around for now
+     */
+    slots = (table_data->len - numa_mem_start) / 40 /* mem affinity len */;
     for (; slots < nb_numa_nodes + 2; slots++) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
+        build_srat_memory(table_data, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
     }
 
     /*
@@ -2061,8 +2072,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * providing _PXM method if necessary.
      */
     if (hotpluggable_address_space_size) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, machine->device_memory->base,
+        build_srat_memory(table_data, machine->device_memory->base,
                           hotpluggable_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
-- 
MST


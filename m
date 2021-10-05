Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5073655lfp;
        Tue, 5 Oct 2021 09:29:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPoGPJEr7nbT5HjmRFr/OmVV3ViJ5/1ufWoOqM1MSgCSgdFmh00TNCnY6JmlKBYZJgQOfl
X-Received: by 2002:a37:8a43:: with SMTP id m64mr15476824qkd.285.1633451392602;
        Tue, 05 Oct 2021 09:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633451392; cv=none;
        d=google.com; s=arc-20160816;
        b=uoU+Eh606i/FHIBayaEPPNmZAlCUlWqwxlX9n1xNuToAwsVUoVqNSh78yQRu2QI1Ts
         9l7qGxxQs3dI64D6WfyNqVTRbNxWErUXFxGAxRslVI94XG86zGQPq/cNw7hqPT5kJKvY
         g/uyoEjCRYPJUoUKRdO4ehdUZ+bd33IN1xdNDqsw7+Igba1SeFhWBqQU3d8YPgRFSpul
         XBmrZFeMoWrhQ7Q9DXGntK95uCYB593t7UYfHvR1ETYEUB7odqTdkuoyCFpyFfqDFug5
         EMhAZ+hO+MsVjWib3UNu3py5sPYInHgCX2EoDROPPz6s4uw8MMXbtNDRlCCCfYitRxs5
         R7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NpF8lgnfc5+t/i9eKuzzdBBnMNRAQzYvNectRQcnBkM=;
        b=rI9uPBxfo54p1CbV4J9IKIEII02D/+AOtu/x2/2Fm9Lm9CQC/2hhygJVLDEBr0EraC
         kk39X32MqnwPrrVH9G07eZIxobN4ByoL70jyqEnjKOoX/gJ07o64AEva7MpDTaL1P/oI
         b+F/Law7GRXEKnv+v5oDnXtZEKLA/zDAWBhkxh+XQohcHL2urSgDt8Eu4nTnxbi/XMKo
         BD0GElQRJOKc+jtSYaekIl8zYjnC47XDRV/Z3ZPyHAsyrdjhgW0kx/P7nYA4fnmAp8JY
         Ry+0zDPFXbYM9cuAOw0OvHAIWJcxL+SC5JPCIlVLp4PicmyoUphcSbOdqYGIumESlNwr
         hmuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nty32VET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si13213443qtk.109.2021.10.05.09.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 09:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nty32VET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXnKC-0000N5-15
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 12:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuH-0001KI-55
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuC-00067q-MV
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NpF8lgnfc5+t/i9eKuzzdBBnMNRAQzYvNectRQcnBkM=;
 b=Nty32VETyFFY6up+7afbSCvP8kFFJVhRCsgHuZ0c9Lgdlmae5qCVDiivQs4xelP9rglx6D
 SFiG+MxXoUeasXL2uyPOKQAv7LhKCZiQxkyw0Q/1fm4HrxO9krMwc5zQU0ufhXoHTjDBDR
 6rRELZTNKuX/DE01nSOHHbDkp6Ldk3Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-5IAmgpvXMLKo1mn2tKypzg-1; Tue, 05 Oct 2021 12:02:58 -0400
X-MC-Unique: 5IAmgpvXMLKo1mn2tKypzg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so1222868wmq.2
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 09:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NpF8lgnfc5+t/i9eKuzzdBBnMNRAQzYvNectRQcnBkM=;
 b=qgzU6kdBRMJIwFiB6kIq4UptcdtowJynZxBcyYdPC8Zei3qkEO26Tsco8Yb2O0A1Sz
 48h+XrHNqa7KzPY8/krfAEijd/+zxIFJOOiTnv3lRA2s2+yK7BBo++w/AlWGJeGKMwJ7
 46o3p0D3sRt3cfR09W80WMIEhyIYTe4DtX0+90lDN5dYvQ2DRnMPxru524Y4XQhFrih9
 ggOr8S2a6Z1o66XNujEPXfn8Zd7TTqGUQhXDHTkJ7cYxOJjvfs0jycNlrNnguaf9wJas
 GREU/sJddhaFczEUukk+CtyKdLFYOqZTEJryihc6ISdtzsPVbIOGyzo/LoMI9+eOOrKP
 uQEA==
X-Gm-Message-State: AOAM533iCGWACVwVb62KDeypLMs7PuaGqijCxzYIEVFZFADR54JuQNdU
 8jQzCng0UWI+Q1KSoaq0KRQrSMgUG9R3H788ehZUAvWxTJ103Xl58R+3Ek5mASsRB5Ym4OKnIlN
 nQDRyyCFGayyO
X-Received: by 2002:a05:600c:1c9e:: with SMTP id
 k30mr4217138wms.74.1633449777611; 
 Tue, 05 Oct 2021 09:02:57 -0700 (PDT)
X-Received: by 2002:a05:600c:1c9e:: with SMTP id
 k30mr4217110wms.74.1633449777363; 
 Tue, 05 Oct 2021 09:02:57 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id u17sm3967462wrw.85.2021.10.05.09.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:56 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/57] acpi: arm/x86: build_srat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-31-mst@redhat.com>
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
X-TUID: ugmZcegRkjHt

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
table entries (which also removes some manual offset
calculations)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-17-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 11 -----------
 hw/arm/virt-acpi-build.c    | 15 +++++++--------
 hw/i386/acpi-build.c        | 18 +++++++-----------
 3 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 3b42b138f0..5826ee04b6 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -358,17 +358,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-/*
- * SRAT (NUMA topology description) table
- */
-
-struct AcpiSystemResourceAffinityTable {
-    ACPI_TABLE_HEADER_DEF
-    uint32_t    reserved1;
-    uint32_t    reserved2[2];
-} QEMU_PACKED;
-typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
-
 #define ACPI_SRAT_PROCESSOR_APIC     0
 #define ACPI_SRAT_MEMORY             1
 #define ACPI_SRAT_PROCESSOR_x2APIC   2
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82..21efe7fe34 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -477,18 +477,19 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    AcpiSystemResourceAffinityTable *srat;
     AcpiSratProcessorGiccAffinity *core;
     AcpiSratMemoryAffinity *numamem;
-    int i, srat_start;
+    int i;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
     MachineState *ms = MACHINE(vms);
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
+    AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
-    srat_start = table_data->len;
-    srat = acpi_data_push(table_data, sizeof(*srat));
-    srat->reserved1 = cpu_to_le32(1);
+    acpi_table_begin(&table, table_data);
+    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
     for (i = 0; i < cpu_list->len; ++i) {
         core = acpi_data_push(table_data, sizeof(*core));
@@ -522,9 +523,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-    build_header(linker, table_data, (void *)(table_data->data + srat_start),
-                 "SRAT", table_data->len - srat_start, 3, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /* GTDT */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3310a3efc3..1ce808c576 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1942,11 +1942,10 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
-    AcpiSystemResourceAffinityTable *srat;
     AcpiSratMemoryAffinity *numamem;
 
     int i;
-    int srat_start, numa_start, slots;
+    int numa_start, slots;
     uint64_t mem_len, mem_base, next_base;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
@@ -1957,11 +1956,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     ram_addr_t hotpluggable_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
+    AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = x86ms->oem_id,
+                        .oem_table_id = x86ms->oem_table_id };
 
-    srat_start = table_data->len;
-
-    srat = acpi_data_push(table_data, sizeof *srat);
-    srat->reserved1 = cpu_to_le32(1);
+    acpi_table_begin(&table, table_data);
+    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
     for (i = 0; i < apic_ids->len; i++) {
         int node_id = apic_ids->cpus[i].props.node_id;
@@ -2067,11 +2067,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + srat_start),
-                 "SRAT",
-                 table_data->len - srat_start, 1, x86ms->oem_id,
-                 x86ms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /*
-- 
MST


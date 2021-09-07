Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4803278lfb;
        Tue, 7 Sep 2021 07:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCJA5Zysq4a65aVw3qsl5IKSDUzpG7ahgqBxsjunIONy1IwisBpxaohQZL0GzrFAYRJxGg
X-Received: by 2002:a9f:3b1d:: with SMTP id i29mr8881989uah.61.1631026555348;
        Tue, 07 Sep 2021 07:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631026555; cv=none;
        d=google.com; s=arc-20160816;
        b=osTzqz3atIAqStCUd535Eb+vMzWAyoeIYINe1Fo27c4KxzfiFBQbjA4jqXJWdU4HUu
         NSux2iKuUGO2+FBoYBl3KlQ/l4I+ezCq0x3q/V3RTtmKsPdZELiOqDul5SRTjwwC9oMP
         3EW5Ti7w+SxnN2IwEkauhI1JNTIo0nloNhi87vcQkaH/xhmQ38ayal8Z1jHgY+Pd3XOW
         4KzzbqSOCiOZwwbzi7z/Ion8SguVKQOMt3sqzX1SErGsdZoQuJjyWKp2Oba1QcNhfFh9
         Rl6UvG4dkFapYqJJG833wB2oscGpks2HxXmex6DKFgYlKfLGeBAUnqPEklqJQKpmF7Kc
         3XJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=paohPX6dRN1yrJJfe3qPWbIDhcQEll/sOKfzWO9fxwM=;
        b=PDZ0TxKZuxQXCRDicE0v0xdVlnezHyCYP+uJe4fv+9nEMZ+9mS7R9ekULaxTV2AIdu
         sGU6WDHz3vyJYtC/onlRfTVvfEynPmaGQxWV8rXLx7Cp+HjFdB+dq/+Hx2tv2bsmDvuV
         YfQ0XE7Gakn7K6Or4OmSXb/aHJSAMMTGNFbW2u6gZVBTIGNdaT4Pq22fCmwmCZCpnzXW
         aAApO9DtS+0Xl6H2blfGps4tLn79AaikCF+no5929sl+EfenGM8Whl0vhnPupDH8CKts
         NpcTr7VhW5LPUmFy4i9LgFRmOkkz9aS+kECcqQ4cTIDDA0S3u0AKqq5KBYiOegS9yozj
         y2EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PbOGXc1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26si3071175uar.105.2021.09.07.07.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 07:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PbOGXc1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNcVu-0006Vt-JU
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 10:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPL-0007Ru-3r
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPJ-00008Y-6f
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paohPX6dRN1yrJJfe3qPWbIDhcQEll/sOKfzWO9fxwM=;
 b=PbOGXc1G+fSCUXONsAO8qAM4KT3VDP4WZZzQW2nnS7d3QfL6c5Ie8FL1OlPBACAV6WVzzv
 pjeIVi2/bRejoJpjz754Xk/fAIwz24WIpSQk5iewV+ocTHKZ9kFjvuTfYcl4QNtu8U7RWO
 F05YVJQJHrkIawabpzBOz0SivhfQ/Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-DgsAFUNNNCmr6ayyY0xm6w-1; Tue, 07 Sep 2021 10:49:02 -0400
X-MC-Unique: DgsAFUNNNCmr6ayyY0xm6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DD791940929;
 Tue,  7 Sep 2021 14:49:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 717655D9CA;
 Tue,  7 Sep 2021 14:48:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/35] acpi: arm/x86: build_srat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:55 -0400
Message-Id: <20210907144814.741785-17-imammedo@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, eauger@redhat.com,
 marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bnU15CvicG13

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: shannon.zhaosl@gmail.com
CC: peter.maydell@linaro.org
CC: marcel.apfelbaum@gmail.com
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
CC: eauger@redhat.com
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
index c329580cff..41c0a63b30 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1920,11 +1920,10 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
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
@@ -1935,11 +1934,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     ram_addr_t hotplugabble_address_space_size =
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
@@ -2045,11 +2045,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
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
2.27.0


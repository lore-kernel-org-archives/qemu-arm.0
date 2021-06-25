Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1338487lfg;
        Fri, 25 Jun 2021 02:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmQKXdo8iFKg5CDz+iSlwDv/X5k6E8bS3hlBEisQ1n3OvVd2rvhObcgKNbsOJ44+b3I8gf
X-Received: by 2002:ad4:4245:: with SMTP id l5mr6640911qvq.45.1624613869541;
        Fri, 25 Jun 2021 02:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624613869; cv=none;
        d=google.com; s=arc-20160816;
        b=yA4Gb+STAsuj/q/oxa3j/b/cjjnO5d79jvBeykmxzaDAPV4M37bvBrOgbunnwZM5c3
         jfJy1tci9nzzH51wP/GXaluWZbjRxOjd+/KhTQIOsE2K060VAaE51NpIIMdSgD0xU6Qz
         J7eObW0BFgkMm8jRSiBgoofuim6eJ3GrOdXTYDwcK7/oBRhz5JA56WXeQ4u88aPSAxRu
         TijPOiBGBPYOvptn5j8g8mnrfLtTHA3a2gucwYhUqBOT7+fTzd2QgnIU8UqHaP9spO+1
         PD5XRyDJoncg6zQTw1QHUz42vGl7A0jZ2nIB3qgTHjX4vEjJgnb0+AhXAoGRcj5tQgEI
         xzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FkiEYW1EUFGLhkAirnLoSJkUx0BffqL0w5DN3khLUPY=;
        b=jlIOsClqB+BqlvP8rQQ+Dyw7CLMeG9v90X3SukgmS4ytY7oCiyqUZf3cfTZNsVvQ0k
         KYzWH2LJx5dk8NugfDvsTSZPLiaFalgg2Oog9jO6mRVFYY/b1JtqTubGRLdXvyVPJxu0
         PVYEdGdsPv9/iBFqpGpJlVgk9ATf4V9jo1vV+rb0+0xRI6gYGjABJoHUuMIYEi+EukZc
         mBF6CbMSu+D4lXCFxE/PX1S1XOZyquZ+Vto5ZMJ0XCTHcKeTJuRvmSirawpIcYb7swGp
         VNlLgjSWDg8/z4IB53eeN9v2E6cvzGVSwXQvkhOjfOdrYecj8cdVnmw1Jp++c3Z6uQek
         gkew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EjS1yxFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x189si4224416qkd.193.2021.06.25.02.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 02:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EjS1yxFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwiHU-0003G3-Tw
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 05:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzz-0003VO-1E
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzp-000777-6Y
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkiEYW1EUFGLhkAirnLoSJkUx0BffqL0w5DN3khLUPY=;
 b=EjS1yxFTRMLIq3g9/lFKkUtL+mhc8GWNCKKGM/W4R11u6IvtFhY8ad4GvlHg4j1WHm6OaN
 RvmXV7ab8PWWYo0+RBOFG30IwW2EjYG/zsVRmh8rQTGGzl0+mMyFkeyM/neJeHHYFiX/fc
 ID9YSjrL89teMaM50A8f+NWhoHZ7L7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-oovvlIS-O9evE_5eutTikQ-1; Fri, 25 Jun 2021 05:19:31 -0400
X-MC-Unique: oovvlIS-O9evE_5eutTikQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C45911019982;
 Fri, 25 Jun 2021 09:19:29 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40A4B60C05;
 Fri, 25 Jun 2021 09:19:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/53] acpi: arm/x86: build_srat: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Fri, 25 Jun 2021 05:17:59 -0400
Message-Id: <20210625091818.1047980-36-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AOTtlYx4q0CH

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: shannon.zhaosl@gmail.com
CC: peter.maydell@linaro.org
CC: marcel.apfelbaum@gmail.com
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
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
index f1024843dd..c4416ac696 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -385,18 +385,19 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+    acpi_init_table(&table, table_data);
+    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
     for (i = 0; i < cpu_list->len; ++i) {
         core = acpi_data_push(table_data, sizeof(*core));
@@ -430,9 +431,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-    build_header(linker, table_data, (void *)(table_data->data + srat_start),
-                 "SRAT", table_data->len - srat_start, 3, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 /* GTDT */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index bc45a666f6..e66859b8e5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1888,11 +1888,10 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
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
@@ -1901,11 +1900,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     ram_addr_t hotplugabble_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
+    AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = x86ms->oem_id,
+                        .oem_table_id = x86ms->oem_table_id };
 
-    srat_start = table_data->len;
-
-    srat = acpi_data_push(table_data, sizeof *srat);
-    srat->reserved1 = cpu_to_le32(1);
+    acpi_init_table(&table, table_data);
+    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
     for (i = 0; i < apic_ids->len; i++) {
         int node_id = apic_ids->cpus[i].props.node_id;
@@ -2011,11 +2011,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + srat_start),
-                 "SRAT",
-                 table_data->len - srat_start, 1, x86ms->oem_id,
-                 x86ms->oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 /*
-- 
2.27.0


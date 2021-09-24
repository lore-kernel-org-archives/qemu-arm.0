Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1181359lfp;
        Fri, 24 Sep 2021 05:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoCPKkDxVrH4/m6r1MCtkquxuCbkSX2l9qc4kPTI+dku/Qj8MJkEbdjde/mk16KgYAVFH9
X-Received: by 2002:a05:6102:3a59:: with SMTP id c25mr8848708vsu.15.1632487815623;
        Fri, 24 Sep 2021 05:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632487815; cv=none;
        d=google.com; s=arc-20160816;
        b=qvJMFMdpgiHpXZZrqG5q2xFd48XzjqG5QNy+cFdYTmPLLDc7+y7DP2DxZvr4KRlf76
         EaEzJbw1qYlNo9g+YVSqb4PbNZonAU/AeoD55XbZprS6UIg5oTbokKnXnQ4EcffsrKDB
         AOTOzpsPYWR8lmNdnWBZ8MUZ/ZtCXzQadBz3NrB1C02UlL42CkndvwZwvhEX6RnnAD9m
         hCN//nj1Bav0AeUN031Rcyszxm3JfElFNFwMMrPk2bc9TA9vIndew0/e414GK7GAT1Kf
         MlM55I9Pw16i+cCjNIBPp12kAFpJHcaQIRc1TU7kKymMYQ4h0XGyuRoahMYGzzNphpFf
         IGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZrWOH3Git61cPp3sgJcbsfFVf2yyhinZrSsS9AwY4nE=;
        b=h0Hr1+ySHhs4x5cwmdmN3DKQuvYzaV2D6XSqNwi8PX/eLhITPkHhrvAlNBgDP0Fpf2
         y/0xKlObzlSVdTC54b6Dda6z8T11zvc5T7vbZwhTaTzvh8hFOM5dPBxTTU+vwcC/YmHG
         A8AvRddInY3Mq28j050izJCnHroX01gp38ZR0/x2oT8RK3UFG7ddJ3I3kklgFdofxbQ5
         t9hHIKXLQZfdwJjmRedNFte5Joh3tYoyz2vNIpwy+T0vThc+B0PGs3+DP5dzeQa6OZaX
         JxOXzMPo1i/CXoMpqFvl7kqijtmu2gkFqIquH5QKcf1eOKL/S6+8NhfKDCA5s9HTnSnM
         QKKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OKfsomS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j25si5847486vso.416.2021.09.24.05.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 05:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OKfsomS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTkec-0006yK-SS
	for alex.bennee@linaro.org; Fri, 24 Sep 2021 08:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkKW-0005XL-DI
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkKS-0001Rf-RF
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZrWOH3Git61cPp3sgJcbsfFVf2yyhinZrSsS9AwY4nE=;
 b=OKfsomS4TwyafYmMSyzpI9K55aR3SSyPglUYlYILPWqe1vRfC37+gFlC3sIL1f9PI1ZRGq
 TetQusFxO7u+FKXMpEBgE+lwXsqX+yA2VAEt25OjMA2M3QngIuHcqWGHzpm9ZLWtTtPJ4+
 y43GUjUZwL2Q/+tmgTRy7vyOfgf6xms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-qHq-TcJbPSqL9VflM5QmTg-1; Fri, 24 Sep 2021 08:29:23 -0400
X-MC-Unique: qHq-TcJbPSqL9VflM5QmTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8D805074D;
 Fri, 24 Sep 2021 12:29:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECEBE69320;
 Fri, 24 Sep 2021 12:29:08 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/35] acpi: arm/x86: build_srat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:43 -0400
Message-Id: <20210924122802.1455362-17-imammedo@redhat.com>
In-Reply-To: <20210924122802.1455362-1-imammedo@redhat.com>
References: <20210924122802.1455362-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 eauger@redhat.com, ani@anisinha.ca
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qK/Xg/MH92UW

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
table entries (which also removes some manual offset
calculations)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
index 9fa6d7665b..6f522c389a 100644
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


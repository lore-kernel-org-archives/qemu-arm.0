Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2108177ejb;
        Tue, 30 May 2023 04:40:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4GsjuFIMxUrYko25F9hcxTFGmKLkke7YYk3NaZrpQfnxZ+hFCyVJ6e7R4tgYSFufyDl0Uy
X-Received: by 2002:a05:620a:8798:b0:75b:23a1:8345 with SMTP id py24-20020a05620a879800b0075b23a18345mr1468121qkn.64.1685446831291;
        Tue, 30 May 2023 04:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685446831; cv=none;
        d=google.com; s=arc-20160816;
        b=UmXxPjPhifgerpOTzHqmEjUqAetB9rX+286Js05vMMfUgUNU7Vc4vE82pehjqFi5uC
         /CnD00rR9Tx/fctgIMreuMtZc/2LnJ1rKC77DLaOyQ1N9LFsqouin2VThG0bOcO7DENI
         sBw/0h8A8sKm0r1sOZDCKUlm8K37bg3vmo+HQSMqxtrlZMEZ+jEvJqqhx0c8waaC5bZ6
         NU0Dvaq7qH6ZHvIjjNTPtnVDu/ocppQMSVRydVCa/kDa+aJDSUN5/Z0Dz1pAkGjBqIrS
         /FD/LKXhOMIL07dRp8SEUqBsrkULZLTkyZEQI7mtkLUYxWScH75ACRiySF2RU3UUb0KM
         DC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DTaSB7tq88uaqaTxCgp6OdSh0CxSz9wsEaDtBmyhZgc=;
        b=0Sy0+K2uV2bWqPkV0cSXrBhyktxrYZmhB74J0y7DrEFafxNRxeBnFJXDr2UeLQeoIC
         YGl7zRrgJMxrogxg+nAjV+hzkH2oJNp5x6FCjIPP4gKKNJXlKDkXALcwMD71q+E8FVf/
         FrJEKWU5TvSlba1DaByAV2Ttpzyoj4UvaoI7Dxqx29idq88KG2nVrf8NopQ5+c719oHE
         lUzO8/XuYO5i5L3gyWlj38icY4YH+NFAW5pzOWfUwGGLnNiFJhCvSPlQ7i3A+gMuWKnJ
         6lnnqkZIG0QdqejXj8MFxvtO81FJRoXCEyY/kPEnSs251nUYmDz5W99fjKSJlBSAL6/D
         C03g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jH5CrEBf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05620a000c00b0074e08cdf531si4541508qki.427.2023.05.30.04.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jH5CrEBf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3xhC-000822-T5; Tue, 30 May 2023 07:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgz-0007uS-2F
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgx-00044Y-HZ
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTaSB7tq88uaqaTxCgp6OdSh0CxSz9wsEaDtBmyhZgc=;
 b=jH5CrEBfl8hDhQUZbRxVfbGE/oYoxYdRxUBtry5013bZC6+LMNYulahnSXLFSELGpxyslL
 LgwfFFZqSaQXNd/VkXS/5M6HE1t4m++DjU+AiIBPd2/PahdL6WZNPLQ/wNrzS3E/9wLsLP
 yT/uszJhcJN9WjnFtlwVy3ApnEEhSMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-IJsiPpRUMRKbKhbAZide6w-1; Tue, 30 May 2023 07:39:01 -0400
X-MC-Unique: IJsiPpRUMRKbKhbAZide6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C03E811E7C;
 Tue, 30 May 2023 11:39:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0D2540CFD45;
 Tue, 30 May 2023 11:38:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH 04/10] hw/ppc/spapr: Use memory_devices_init()
Date: Tue, 30 May 2023 13:38:32 +0200
Message-Id: <20230530113838.257755-5-david@redhat.com>
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
References: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P2a3iNDC4cLH

Let's use our new helper and stop always allocating ms->device_memory.
There is no difference in common memory-device code anymore between
ms->device_memory being NULL or the size being 0. So we only have to
teach spapr code that ms->device_memory isn't always around.

We can now modify two maxram_size checks to rely on ms->device_memory
for detecting whether we have memory devices.

Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/ppc/spapr.c       | 37 +++++++++++++++++++------------------
 hw/ppc/spapr_hcall.c |  2 +-
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dcb7f1c70a..44155f6613 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -546,10 +546,8 @@ static int spapr_dt_dynamic_reconfiguration_memory(SpaprMachineState *spapr,
                                 cpu_to_be32(lmb_size & 0xffffffff)};
     MemoryDeviceInfoList *dimms = NULL;
 
-    /*
-     * Don't create the node if there is no device memory
-     */
-    if (machine->ram_size == machine->maxram_size) {
+    /* Don't create the node if there is no device memory. */
+    if (!machine->device_memory) {
         return 0;
     }
 
@@ -859,16 +857,23 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
     int rtas;
     GString *hypertas = g_string_sized_new(256);
     GString *qemu_hypertas = g_string_sized_new(256);
-    uint64_t max_device_addr = MACHINE(spapr)->device_memory->base +
-        memory_region_size(&MACHINE(spapr)->device_memory->mr);
     uint32_t lrdr_capacity[] = {
-        cpu_to_be32(max_device_addr >> 32),
-        cpu_to_be32(max_device_addr & 0xffffffff),
+        0,
+        0,
         cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE >> 32),
         cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE & 0xffffffff),
         cpu_to_be32(ms->smp.max_cpus / ms->smp.threads),
     };
 
+    /* Do we have device memory? */
+    if (MACHINE(spapr)->device_memory) {
+        uint64_t max_device_addr = MACHINE(spapr)->device_memory->base +
+            memory_region_size(&MACHINE(spapr)->device_memory->mr);
+
+        lrdr_capacity[0] = cpu_to_be32(max_device_addr >> 32);
+        lrdr_capacity[1] = cpu_to_be32(max_device_addr & 0xffffffff);
+    }
+
     _FDT(rtas = fdt_add_subnode(fdt, 0, "rtas"));
 
     /* hypertas */
@@ -2454,6 +2459,7 @@ static void spapr_create_lmb_dr_connectors(SpaprMachineState *spapr)
     uint32_t nr_lmbs = (machine->maxram_size - machine->ram_size)/lmb_size;
     int i;
 
+    g_assert(!nr_lmbs || machine->device_memory);
     for (i = 0; i < nr_lmbs; i++) {
         uint64_t addr;
 
@@ -2866,12 +2872,11 @@ static void spapr_machine_init(MachineState *machine)
     /* map RAM */
     memory_region_add_subregion(sysmem, 0, machine->ram);
 
-    /* always allocate the device memory information */
-    machine->device_memory = g_malloc0(sizeof(*machine->device_memory));
-
     /* initialize hotplug memory address space */
     if (machine->ram_size < machine->maxram_size) {
         ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        hwaddr device_mem_base;
+
         /*
          * Limit the number of hotpluggable memory slots to half the number
          * slots that KVM supports, leaving the other half for PCI and other
@@ -2890,12 +2895,8 @@ static void spapr_machine_init(MachineState *machine)
             exit(1);
         }
 
-        machine->device_memory->base = ROUND_UP(machine->ram_size,
-                                                SPAPR_DEVICE_MEM_ALIGN);
-        memory_region_init(&machine->device_memory->mr, OBJECT(spapr),
-                           "device-memory", device_mem_size);
-        memory_region_add_subregion(sysmem, machine->device_memory->base,
-                                    &machine->device_memory->mr);
+        device_mem_base = ROUND_UP(machine->ram_size, SPAPR_DEVICE_MEM_ALIGN);
+        memory_devices_init(machine, device_mem_base, device_mem_size);
     }
 
     if (smc->dr_lmb_enabled) {
@@ -5109,7 +5110,7 @@ static bool phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
     int i;
 
     /* Do we have device memory? */
-    if (MACHINE(spapr)->maxram_size > ram_top) {
+    if (MACHINE(spapr)->device_memory) {
         /* Can't just use maxram_size, because there may be an
          * alignment gap between normal and device memory regions
          */
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index b904755575..1dd32f340f 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -31,7 +31,7 @@ bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
     if (addr < machine->ram_size) {
         return true;
     }
-    if ((addr >= dms->base)
+    if (dms && (addr >= dms->base)
         && ((addr - dms->base) < memory_region_size(&dms->mr))) {
         return true;
     }
-- 
2.40.1


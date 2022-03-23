Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2170550lfb;
        Wed, 23 Mar 2022 00:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8q8EJQPhE1KTS3kkPjPcGdO7MP2URlZ4y9RdCqAG137YUkroXtQtpDPlTxiQ5iN1hmYiE
X-Received: by 2002:ac8:5e0c:0:b0:2d0:a808:908e with SMTP id h12-20020ac85e0c000000b002d0a808908emr22862787qtx.115.1648020551010;
        Wed, 23 Mar 2022 00:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648020551; cv=none;
        d=google.com; s=arc-20160816;
        b=LPW0rYOCBm/dPTRW+QO5XZuhkZ0hvdtDrJ/xTpJcCv7nPhWSErdMhacLX9gnRFVXQe
         46o5fqHhr5sJsvtjlkRad2qI610dH+4+rQrXNfHK7DRtKmntauLKFchZ3saSKlX6njqb
         c4UYI6tdZ9gOA6J7SaXFD/e93ZWgIz+MT83wukpHhYixWpjZ1r67RLl9lUfnikqRbATU
         QzGSr9zVp1UEkKH2DJT24hXAM7ybcrw9TXCtVYKxP1HI5WFq2Oi68LhYKN+y/+tvl7tN
         S+IrWHNxdlXMw9G5/VSXMYiNKkws6lqkffWFKWeSD6j3mGJOcAPkPfeeW7MdqWHk1IAn
         UR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5Ul8oWuvUeDzNfHlnwEYmiKJujaeZ1hRs0XrndxwX2o=;
        b=KsONyZK+B1xZ2ZrlLCZC4FPo4LYXX1Pgu06Vo5rayOF45fMEK8+vDLCzU5buo3hLEa
         LqFleMj44VsJSYxeZ4xjbVllkC7+yolPdJBzwPIyk0FNueEh3oHJMwsXGr7MbfjKHf9b
         9yx8IWuqaBwI7hJT9Ee4/iTYpwnhT6wRHfoLVXfVncuyOLA4NiZTLrObmv0M/GE2svtR
         FFDu96hGz36g7L+mAGJrGUExbperzkhylHkyWdZdYfExq+Pazu3yQa1XsUc7VgYZwm6O
         wp2osPTZttX/wNoIhNJSiJhkW35WhNhTQXx/RA7A7p9yaKJcfoAFjhaXfeISG7I1Sj3R
         HEWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D/R9Dh8o";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020a05620a15b300b0067e4be23a4csi3466832qkk.657.2022.03.23.00.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 00:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D/R9Dh8o";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWvQc-0006sz-Fk
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 03:29:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvNK-0004PP-KV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvNI-0000w1-TJ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648020344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ul8oWuvUeDzNfHlnwEYmiKJujaeZ1hRs0XrndxwX2o=;
 b=D/R9Dh8oi4FfpSbD31vhr2QLLgHYsjv8TNzWrgas122gDmeOrlwjy2gOMQgAE8I6GbiKWg
 2wHNN6BR2fxr+izxzffNksBsEACooy3GWEf3dyaupXis3lQ1F5QFhjgnthDX49KFbB9asl
 akBft1xPdqTfUXEDLQBgYE5WPNROOV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-fd0OouEMMs6H0iyM-dk5Ow-1; Wed, 23 Mar 2022 03:25:40 -0400
X-MC-Unique: fd0OouEMMs6H0iyM-dk5Ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63CFA185A79C;
 Wed, 23 Mar 2022 07:25:40 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7C6B2166B2D;
 Wed, 23 Mar 2022 07:25:35 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 4/4] hw/arm/virt: Unify ACPI processor ID in MADT and SRAT
 table
Date: Wed, 23 Mar 2022 15:24:38 +0800
Message-Id: <20220323072438.71815-5-gshan@redhat.com>
In-Reply-To: <20220323072438.71815-1-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iRQvbFawcqxe

The value of the following field has been used in ACPI PPTT table
to identify the corresponding processor. This takes the same field
as the ACPI processor ID in MADT and SRAT tables.

  ms->possible_cpus->cpus[i].props.thread_id

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt-acpi-build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab0080..7fedb56eea 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -534,13 +534,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     for (i = 0; i < cpu_list->len; ++i) {
         uint32_t nodeid = cpu_list->cpus[i].props.node_id;
+        uint32_t thread_id = cpu_list->cpus[i].props.thread_id;
+
         /*
          * 5.2.16.4 GICC Affinity Structure
          */
         build_append_int_noprefix(table_data, 3, 1);      /* Type */
         build_append_int_noprefix(table_data, 18, 1);     /* Length */
         build_append_int_noprefix(table_data, nodeid, 4); /* Proximity Domain */
-        build_append_int_noprefix(table_data, i, 4); /* ACPI Processor UID */
+        build_append_int_noprefix(table_data,
+                                  thread_id, 4); /* ACPI Processor UID */
         /* Flags, Table 5-76 */
         build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
         build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
@@ -704,6 +707,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
     AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
@@ -725,8 +729,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, vms->gic_version, 1);
     build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
+    for (i = 0; i < ms->smp.cpus; i++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+        uint32_t thread_id = ms->possible_cpus->cpus[i].props.thread_id;
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
@@ -743,7 +748,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 76, 1);   /* Length */
         build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
-        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
+        build_append_int_noprefix(table_data,
+                                  thread_id, 4);        /* ACPI Processor UID */
         /* Flags */
         build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
         /* Parking Protocol Version */
-- 
2.23.0


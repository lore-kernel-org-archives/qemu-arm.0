Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp33740wrs;
        Tue, 13 Aug 2019 14:11:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6HsSFd5OsWSEoCH9o3r7Ag2lQo1UidyLTCVMLHZ8nXKkWPJ8pqc1YJuIoSR6S7FZVbfmS
X-Received: by 2002:a37:9ac9:: with SMTP id c192mr13899912qke.334.1565730662838;
        Tue, 13 Aug 2019 14:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565730662; cv=none;
        d=google.com; s=arc-20160816;
        b=0MNrpYkSAxa4cmrAeaH4jCNoVYap5JqQ0MCUr8czUDn7OKZwnG+irr+OJswR3dDjY/
         1vqBIw9gBhQd9TWvsraQwOhxQQFWPcLAJ9iztycWAazi2YXGqSuuYNbGweFtHLAOVFZV
         rHs0RNtfyNmz7RKPuq1uyHeGTR/ahGip73Lck3m/P5TN/L8m+0jsyGMsr4vp9IcsoIS5
         TdUoXUmvHUDco6zRB1YP4IDTvMjLcWAabr/Kb0BPd7+fHciSApA6aB6+Kw2dPeJeGB+B
         YDgiI3+DX2xuqHm9lydWwUKiO7o3ymSMcL0n2rfnCuHdjMteUCGP/wo9MyGEiFYHEmI6
         PodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=4AA/f4hAnUvuMcxTGXjpVMnrEDmO5xa+XaS0cP7GV3g=;
        b=FwsCHq7rZMIzDkqCzrN4zJuh4T5m5NgKIlEMbWnlQsbTC14D+VQ+nzLF6v4nIiM6E9
         3EdqAQcN2cToJkw/zSpQNJy/i14eCfdhqWGSmJNOIh9/II5qpIba9ixo6CAlofy3Yqpj
         b6juPC2tlKxp9SEzyk/PJIBT03GfLJ24c4cWMTFMP8zRfrMduFfVd6UOHM/JPKTeitRu
         9IdODta85hm0hpo1LQNxtITAl8DhEgwqNorjnprilGs13MNyIcH6JyiBi6i7DSqg6bSl
         MqhMBC3udTAj0J+zc0R38VXk2o9/TtEtUJO+1AMqsURLaL9Seq3vcyApZmKb0lbIJdrA
         kjkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h67si62956863qke.108.2019.08.13.14.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 14:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxe4M-000120-E2
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 17:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1E-0004zj-QU
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1B-0001Og-2U
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:47 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60828 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1A-0001H0-K9; Tue, 13 Aug 2019 17:07:45 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BEB44CF41561ABA8969A;
 Wed, 14 Aug 2019 05:07:36 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:28 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:34 +0100
Message-ID: <20190813210539.31164-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH-for-4.2 v9 07/12] hw/arm/virt-acpi-build: Add
 PC-DIMM in SRAT
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oLSOm7R20RAH

Generate Memory Affinity Structures for PC-DIMM ranges.

Also, Linux and Windows need ACPI SRAT table to make memory hotplug
work properly, however currently QEMU doesn't create SRAT table if
numa options aren't present on CLI. Hence add support(>=4.2) to
create numa node automatically (auto_enable_numa_with_memhp) when
QEMU is started with memory hotplug enabled but without '-numa'
options on CLI.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
v8 --> v9
 - Added auto_enable_numa_with_memhp support.

---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 hw/arm/virt.c            | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 63fa845076..6d697af2df 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -518,6 +518,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i, srat_start;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
 
     srat_start = table_data->len;
@@ -543,6 +544,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     }
 
+    if (ms->device_memory) {
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, ms->device_memory->base,
+                          memory_region_size(&ms->device_memory->mr),
+                          nb_numa_nodes - 1,
+                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+    }
+
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0949a227a9..56d64fc0a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2049,6 +2049,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported = true;
+    mc->auto_enable_numa_with_memhp = true;
 }
 
 static void virt_instance_init(Object *obj)
@@ -2154,6 +2155,7 @@ static void virt_machine_4_1_options(MachineClass *mc)
     virt_machine_4_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     vmc->no_ged = true;
+    mc->auto_enable_numa_with_memhp = false;
 }
 DEFINE_VIRT_MACHINE(4, 1)
 
-- 
2.17.1



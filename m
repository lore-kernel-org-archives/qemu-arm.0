Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1141000wrv;
        Tue, 16 Jul 2019 08:42:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXgSXDngeH3RZV6VdIZ2ajdWMLBwiy9rJdR/Y6DMsYpfsKnpA+AOm6XQb7GLV2Rde6xjKn
X-Received: by 2002:a50:a485:: with SMTP id w5mr30136854edb.277.1563291771570;
        Tue, 16 Jul 2019 08:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563291771; cv=none;
        d=google.com; s=arc-20160816;
        b=HsmT/+ncxy3h+ijpvcX7BPR/23UTFvhraA+JjcRWfGCMFmnpknVCcMR4d0QXOUKh/z
         QHAMDVZly+fX1s8EIaOpqbu+JHEQLTENpRA4Ld7ARh8zuaBYXsfLM8zM1K6swc2u6hJD
         11yUmREEBDaGhO69AhsAOr4TKsmqbFD8yGk+11kBJpFAZ1KhZxibeGcgySeSAocOos1V
         PU5W5hurGeAC1hYT+zwYxWk8Ehq5nqmNOt4wEpOWgYiRX9kdrZqSgrItJza7ciLj7NKq
         7X9n/eo+FrXLCtXOSBAlYLEYQoGOOh2SnTIFrU0ILy3/gjWI/mGWlOuleCThgjNLOEGw
         RWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=h5S8+dP6dn6AN3oDOkpD+x4k3Vk71kjG5fWUcwADDpg=;
        b=GGYvI7mAKcNqd6h73B+f/nxg0vtBKqrXTntxaBULKpPVChl0wl7m7V57v/ig3c0sFz
         P9uCbdD8TuWDIeCQj10g/AMmDA+bpaCRusTEAlNln5SHiioFnk/tfaS4JktPXcJ3tCGh
         qwd9LMW+iKjFJ6krEBZcZ5myn5s0w9yuQLsaBXHAO1ZtJ7sVyKtI7Y+Zcm5pGebO/tZ4
         yUmqvj4FuYB74XC8zTO5P6KTVJEWeLpWA+sY0CtERUJ34aT7otNVLXy5xLty8PeZaP6k
         4GoP+KetJeAHB4En8ZiUNRhvLQ/1oIcX9GVVGkgtwbnPMqASPI+JEobldYofiIvxfZci
         OTTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c31si12609290edb.418.2019.07.16.08.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnPbO-0005W0-13
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 11:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36714)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZw-0007tS-Eb
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZu-0004SJ-Ag
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:19 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2176 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZt-0004Np-9w; Tue, 16 Jul 2019 11:41:18 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 442E1FFDF0B8149CEB8F;
 Tue, 16 Jul 2019 23:41:09 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 23:41:01 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 16 Jul 2019 16:38:13 +0100
Message-ID: <20190716153816.17676-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH-for-4.2 v7 07/10] hw/arm/virt-acpi-build: Add
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
X-TUID: VsNHurhAtfJ3

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 018b1e326d..75657caa36 100644
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
-- 
2.17.1



Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp443932wrp;
        Wed, 4 Sep 2019 02:03:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdiUdTS/uCj/EUplaOTmt8BAkzCmRLs7UJy0n0W0tm5l7qsGx0FStOUoPU+ia/dwWjZRNT
X-Received: by 2002:ae9:e40c:: with SMTP id q12mr19452742qkc.455.1567587792954;
        Wed, 04 Sep 2019 02:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587792; cv=none;
        d=google.com; s=arc-20160816;
        b=DuGdvLSMfcLK/OoeOG4VnGzavCrOiN6uGisWZRMVuNM/ip1K48SeHZj0cH4ykOjh8Y
         5kvsTnfX3xD7155ECXmiTGVsgwYDVSbCL6Av0JBjTW25LDEImCEa9WEYRczQ9j71D3fI
         q21z1wY8+ptRLRq2DHhIarBHvGKkn5CiOENy6qrfmCGD5q/r0rGWiEtLh8FqGq5pZFuw
         LjzfsVKkuAE///SnpSYX/YS9St3rl0ask3IdYhluGkJ0bn811kZRNyi/OA83CNDEom+O
         IwY7olc5iFK5nXFC/x2aEZVeVQ1Q5JX2z4JPif+gU5enXw4VIDeS2LQd2SDo9PKJEvgz
         ubkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=Mso2iKF+ryqsxuXQ7jqBseMQg87RrAqeDDEM5MdTdPA=;
        b=yvfgGD+i6HxkPp7/taZ2uQPEAkuydeG88TozLMbHt0EG3HAZ0IoM9gxE5ZS+bHtgE0
         SYXEoRka1LPLN1NTqA6FD1qMxF4h5Cu0J/wkyTJBa3ZRJods8WU47Wu7dpr8A12Fw0VA
         4Zj5NaIpwntShpp8VbRz6lR9C4IqwX6TMFWKmoW7RFyLC1c16jih+vfxBughlAnQPt/8
         MjH5tT65lVWeyOFUmRczq+p+BIbMXSeerK8yonVjdi7CMf3UjkTE4UOFu1i+uZbETwWE
         zJ5w+Y2yarjSpN7scijggLiHyd6x84M7ETkorJQ6q7Y4EPL/KoRs5ym8gZnZbM3U/9ow
         /KJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si13952300qkb.66.2019.09.04.02.03.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 02:03:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5RC3-00035H-93
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 05:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R72-0007Ij-14
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R70-0007DL-J8
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:57:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2193 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6x-0007BB-Pt; Wed, 04 Sep 2019 04:57:56 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E2FED7AAAF89D396940F;
 Wed,  4 Sep 2019 16:57:53 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:46 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:24 +0100
Message-ID: <20190904085629.13872-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH-for-4.2 v10 06/11] hw/arm/virt-acpi-build: Add
 PC-DIMM in SRAT
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pp06H+eGXtQr

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
index 5063f28812..a4872a0b00 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -519,6 +519,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i, srat_start;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
 
     srat_start = table_data->len;
@@ -544,6 +545,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
index 29bc2837ce..95accc28f1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2053,6 +2053,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported = true;
+    mc->auto_enable_numa_with_memhp = true;
 }
 
 static void virt_instance_init(Object *obj)
@@ -2158,6 +2159,7 @@ static void virt_machine_4_1_options(MachineClass *mc)
     virt_machine_4_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     vmc->no_ged = true;
+    mc->auto_enable_numa_with_memhp = false;
 }
 DEFINE_VIRT_MACHINE(4, 1)
 
-- 
2.17.1



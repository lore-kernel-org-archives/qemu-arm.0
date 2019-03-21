Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp94265wrx;
        Thu, 21 Mar 2019 03:51:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBVPEptXt0IxL/O7Je5c+mO+SxWcyStszobInJ0pzek3MFqYTMPl48QA75zBQG4noW16nN
X-Received: by 2002:adf:f488:: with SMTP id l8mr2017085wro.213.1553165518170;
        Thu, 21 Mar 2019 03:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165518; cv=none;
        d=google.com; s=arc-20160816;
        b=eVopIUp8jbUozsU5kdFNv9YUdZBD69Qk4h+jLtqwYWR45X/WKuB1PKeSWHrL6bF45/
         gcumb1Ea5w26jsiQeDtO9a5ZxsLq2yrg5CF7XS6QmTACe2YhvnZ4HEyCkq8P7YHmcs/F
         XxJh3RrHRCOxr+3d8mJyIQTEna34+FpwySmUZaCGsokR8C7jgTzaktm7WC1I+D0CUPfd
         Ej4nT7y1nmGtqf2/MAS2HOggbPvW1rn4m3d4DdMLTrrmpnVqu28X2sUQYOQN98E8bMbu
         eqBYNCOS7Gz9dVuOsD73DtK9txAtqdby8AbL9bBXB6bKqskL53P9ufQ1KHJuMXAGfYby
         MTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=BUpar81XegT9q5HTKgn8Nk9+FAXyapYKOQ1g/IS0udE=;
        b=vYz0EYZ5pem9rX8ZCA4qps8HoideJO7OLG3rBYli5VVryMpcAxIxl19kWCafANq4SW
         hNoQOxwSosA6mMgPvnSkx6L1fWyD3o+U+gKnOB1L3dDNyohsBUQU01qxYnyXJsgf+v99
         hR99XWyG085fb1i7JhDpg9ml4ouLSKgDH7lMkFTorRlMF+p2yH1vVCAhxA0nPgklsdSs
         tnWAqimItzsTNIPSuZrmZUOXT2nssAlJD1SnoVJnkcMCVr1SUA3hHkpyR6FyyANUp/0/
         nQQma2AsV80i2/trUIIsejdr2dgERpSMupj5NMaJLYrO/tcxq1QvnyGau/AyRS2BgaXi
         q3RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si3046816wro.150.2019.03.21.03.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vIj-00051z-64
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:51:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHa-0004Og-CM
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vG4-0002r1-2R
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:49:12 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56518 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vG2-0002VP-Cd; Thu, 21 Mar 2019 06:49:10 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id F07CBD773E7A054068D5;
	Thu, 21 Mar 2019 18:49:07 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:48:56 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:41 +0000
Message-ID: <20190321104745.28068-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH v3 06/10] hw/arm/virt-acpi-build: Add PC-DIMM
 in SRAT
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gFcQt1nywlSP

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 20d3c83..1887531 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -524,6 +524,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i, srat_start;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
 
     srat_start = table_data->len;
@@ -549,6 +550,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
2.7.4



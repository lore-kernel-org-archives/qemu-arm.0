Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp653953wrg;
        Wed, 22 May 2019 09:25:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwj8H4MtJsdRPGrJyYnUX1pkzF05BuoHD5NCe0uFe8QTTPnaXWM2ntHBDKbhghx+akUKzA/
X-Received: by 2002:a50:fc97:: with SMTP id f23mr89999549edq.104.1558542325761;
        Wed, 22 May 2019 09:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558542325; cv=none;
        d=google.com; s=arc-20160816;
        b=Hvw/Fx4QlkNv12dt1EOsMPlAjIzEEPzYWfM9J54LMPTHfdGCPRzY6S0OWSOkOoBdCV
         DfY5DC0h6hMNbtpO26ditdXLGKZy7NhIUJPJZtfrvPFC79WF/kkbtTEZYju3sNdmeAOI
         b+L4MtC+1c5O1T9EM7SEGdjLlixmJcxV2ELX/ojbFmHHc+46t0zmIgt5O3yagtwiIx6y
         Zqg5GelXB/YDZOOMmHzm+DHJbpGJjFNX6fObCDAvKuMTSo3qOY9ZIB4IIjy0WulhA/hi
         uOg1zqFK6ehbn78wfxKtTmVhhhNrFzW+lpD0DohmXm+qiIjcKh1AS5wqfYskkvQgDCip
         8epQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=QXlurv/4ojK8WxcvnGeCJceAKwKXdlYhaLDEYFGN3w4=;
        b=vxtztqbp/K+loL9MyqTtEkgHKsjs2XVqz+TDOTjnOnaXdq8/BQhwCBpoHWYHS6nx9U
         68UnM4eLnaM0SueJsO91xTr6RQu1KJzCVjXcyag24CVyXRYciyfstvlzYjJN1FW9NCUR
         hnFhTTr1/cCjbHL6cqoVU0ZwT7h1hK+/vaRWUYV3tcz96qVYU81+f6CVkUrCAAK24Py8
         1zj7FfYbSgSAdva3SrxGHP6/B1g5VBRVNEVm3QAFHl5/uueGRmhQOiVjyd27VrH+jOGF
         kWO3ezdfJJVBkW7DHpZeR+kIx/Gn8g0YWd8Zs/KjIgsPCS9N5UwMo+Uucqvz/2EO9rjZ
         Mo/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si9091441ejp.167.2019.05.22.09.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 09:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTU3Q-0006eQ-Ow
	for alex.bennee@linaro.org; Wed, 22 May 2019 12:25:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU38-0006bJ-RX
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU37-00025U-Q3
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2220 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU37-00020y-Es; Wed, 22 May 2019 12:25:05 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 009938A783217CACB063;
	Thu, 23 May 2019 00:25:03 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 23 May 2019 00:24:17 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Wed, 22 May 2019 17:22:50 +0100
Message-ID: <20190522162252.28568-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v5 6/8] hw/arm/virt-acpi-build: Add PC-DIMM in
 SRAT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iog+zjJDP99H

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5abab6dfcd..ed8e0cee3a 100644
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



Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4915231wrg;
        Tue, 25 Jun 2019 05:39:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLSsp30k1W/AtSk/4vzh/AnccWgkDgVaTusFccOamRurL9RXo52RSUudhKfAKwvn18uMsZ
X-Received: by 2002:a17:906:451:: with SMTP id e17mr80242191eja.161.1561466370712;
        Tue, 25 Jun 2019 05:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561466370; cv=none;
        d=google.com; s=arc-20160816;
        b=xO8Bzr09tq7k/TzZaDexmzGT6eyuBIRGFvF9KjHUmwIMmM/p9vlshnN8GA13mWxwhx
         PgFDHeoX6uJpbjgjM8oID+1edLYQqDiWRtuud1FHAagyFCb+yvQRSabYNRFPjeFZppm7
         3UON//S7HeT48UnGdj8/Caq/d1gUZjadC9Lah4KUgBRInA9QRKkcaIeKXXQ4UCMCdKLk
         ribrQJWi5eydbb681QOMo16sMNVnKIzeDtyCRgKJ7gOp9beWWHE2l8W54ErgH8zyM6W6
         EQnPdturHpDsc3QrXvJ9f2+bar7hQNsOTwMWqaYtCX9J4AHVnSqwF6oUifISp1Y3y+S6
         gauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=h5S8+dP6dn6AN3oDOkpD+x4k3Vk71kjG5fWUcwADDpg=;
        b=wIg5tM2XsNSpH+RpgUXFOUqIgxfwM629/HfwtK0/FxpYEQfdYewOTjdU4uaMec6PDP
         H3SLGGvscR3UeyhOvbgS5B7Ijw4vpAy80364e2kKjqPGUOExDexW5Hp7NwDzxM4+mMPw
         tdWBLxJGwZB2N3Hq/9dpJXBk6kHiy7uuQB1ZyX9AVM5YPQB+JBHdcnCSKunMJEmp2IC6
         JCdcHJF+dFXG3Uz4euEx08MUC4B6RyZAhrqNfmQBP0bJUgBJ4hdDTXdNSJzu7EUZ8ovw
         K7UA5zWl6iP0pJDY9+DBg2Payt0fvER+x8+mq1H6amH8egd3XCfsT3cCyP/+ZYFGX4zW
         vhUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w25si239377ejk.79.2019.06.25.05.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:39:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfkjR-0006H3-Qy
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 08:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36419)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkN3-0007H0-Ju
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 08:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkN1-0004RZ-D1
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 08:16:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2250 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkMx-0004BE-99; Tue, 25 Jun 2019 08:16:15 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8BB81555095E07A8943E;
 Tue, 25 Jun 2019 20:15:54 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 20:15:47 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 25 Jun 2019 13:14:19 +0100
Message-ID: <20190625121421.22280-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v6 6/8] hw/arm/virt-acpi-build: Add PC-DIMM in
 SRAT
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
X-TUID: EryzQJsk2IQF

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



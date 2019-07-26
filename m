Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11749631wrv;
        Fri, 26 Jul 2019 03:47:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+uFhHXDS7DLZUjKyg653r57n6Aaf+OYG+GLbCm1DU4qQyLJz8o7LB4ERI5WuGtBN0/eAX
X-Received: by 2002:aed:21f5:: with SMTP id m50mr65560206qtc.66.1564138037364;
        Fri, 26 Jul 2019 03:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564138037; cv=none;
        d=google.com; s=arc-20160816;
        b=qIq/6xOZzeCTuTQIaWjr2aK9jxQjRfrYsenTsms60l8hjyYfx1Ql9EAJkJhqJL/QD2
         wLtp6hFFrtcv3Ge9S/+ht1YrpFxEvhC9V14pquAuog5BV8qbRdllTI6NXYEjfwMw3nAV
         /ppVV8ZDc3lD0y0g5MJuhhcfIA5JT7xMOnbftLyDURRFx1oeYJwChu9xg3t9NJyi43bV
         K7CvmroEN67Tsdgs0w2NQACFWjg1gpQdO4QfhC3NAaiTnch7o58O5jLA+DGBRM+d12MW
         Jl1qS8SBZ37u2NMwcF29awW1MBqnavZx8nFXhDK0Y6sjtZVwdskISn2iOWJJ7iaj753z
         hlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=h5S8+dP6dn6AN3oDOkpD+x4k3Vk71kjG5fWUcwADDpg=;
        b=KdbjusobZkgXpYfaMdX4kfq75xNguvKq5LsQ2Y24RgE7ddd2zF3xFb8CLNfj7IlZmP
         l+39eFqwpfnPwMulvMsF0Me8Y9pTpeweIKB8bqP3k15Bll9hdtDrOel5WQzRTy28h9Z/
         TOsU8GxdNrG4QaQwoX/eBCvtu8AiOdOi2hko44gjjuQrch452HEwt58ZunFfaHDdz+WI
         FS//mjymuopMVLrnj8vckCS7fW7ezQjRhfPo4wjuWkWG1RUZGi5OgfVMixski8hOPztY
         Xf3dZUilxCVph2ChAsS4xMpWCws1viP0ap4ywByXEy/JPwjL8nsvoakJew2PQyJ7v5Cd
         iBzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si31103853qth.35.2019.07.26.03.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 03:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqxko-0008FC-3x
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 06:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43319)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxka-0007cq-6a
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkL-0006m5-1U
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:46:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2179 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkJ-0006Fv-V7; Fri, 26 Jul 2019 06:46:44 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2B978ED77BC9CF22929E;
 Fri, 26 Jul 2019 18:46:36 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Fri, 26 Jul 2019 18:46:29 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Fri, 26 Jul 2019 11:45:17 +0100
Message-ID: <20190726104519.23812-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH-for-4.2 v8 7/9] hw/arm/virt-acpi-build: Add
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
X-TUID: RdsV2IgHwD1i

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



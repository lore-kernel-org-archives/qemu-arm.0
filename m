Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8271113wrx;
        Fri, 8 Mar 2019 03:48:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxqpqNWsXUlJu2NqIRp/LcDALa6kUdOUgSqZlmkRGSz9ihLBzg7mk5zvGOHSFKWCApBl8yy
X-Received: by 2002:a81:6c86:: with SMTP id h128mr14351402ywc.477.1552045698982;
        Fri, 08 Mar 2019 03:48:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045698; cv=none;
        d=google.com; s=arc-20160816;
        b=I/4d9+OheGFZ+SPhQ3QdeLi5mpHdhhlAZZ4eBCwT2egADnFu/a5blXRV7ZLWMZjqOG
         AmxyF1mLIcIwXwZbnG29XZdgpCJXxR0jVR8Rl9qlgYJd+ZErwcKQmzBiXc1RVchRm74t
         qnTBf33zFUWpasf18KaGM/1NRUD1JGmwWLM1lcfGjw0mueu9E+86h0maorM1TUz5U5I0
         vB0oZmPu4lUoW0lH3gZx0BQxlDkcdJzwc99fVPketXaEAYyQbb3R5f4fs9Y3DCv0FN1H
         fFNE6klR5biqJ354vrqh5yp0GcA5EekGsSZRQBtm2RulKtbajHbR8O9G5BRuhOX2LN0D
         Z/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=aCck2UPev7bgF/laZsoHvm9hwObwhxYpSbzZFmnDg0g=;
        b=FFOLy0XmE+dx+eGt5MAWArJXDbmwgzZZNX/fq81cecOoEosyGA3Rz8dWEwkpMO2J5b
         wCW6wOwv/GdKxwbe/pYmcA8EsvQm7LKTlo6vJdFmlqcvlhaOdyLlLbimy/JfcQAbqEJF
         0h8VCecUhVvn61dL36jpIF9jXCqDKZTzbWgvv3MjOXvWD2JUFRLjQbaEXE8bWgDWM6qX
         lFka4vJGa4oKjsLawHM0dtDpX6i/gTu1RQMzRnxzYKtzLD2lAXf+0ZOr3dgmXHPhYevz
         08/f/SPrJplB2IG7NUPdqT6PYV+hYAmV4atTQ6iKj7Shtlen63mzqr1qChCWIxnUwBJ1
         AcRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si935714ywn.147.2019.03.08.03.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:48:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Dz5-0002b4-FW
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvd-0008FU-QJ
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvc-0005zN-1m
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:40 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43516 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvb-0005Qq-KM; Fri, 08 Mar 2019 06:44:39 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4272DF07CC17982C5FAE;
	Fri,  8 Mar 2019 19:44:33 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:26 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:14 +0000
Message-ID: <20190308114218.26692-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 07/11] hw/arm/virt-acpi-build: Add PC-DIMM in
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ou4BDk2L16rZ

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 87d66da..6cb7263 100644
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



Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4561771wrx;
        Tue, 9 Apr 2019 03:36:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxH8qdHAS/rv9iAiSFZNvzFBtgmKnayAR3D04s2ooPDU4o63TcZzx/yZhAovDSE1G4idpe
X-Received: by 2002:adf:df92:: with SMTP id z18mr14089564wrl.239.1554806209137;
        Tue, 09 Apr 2019 03:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554806209; cv=none;
        d=google.com; s=arc-20160816;
        b=Qvv7L3cKQ4cuzpj9HGtawVvneLOaplQ2UkdzXaIPgyBN8sLdMCeCvyMt0ZufS54EqQ
         SWWjIdYp77yrdIvKH/p1yUyTKNZkeRDzmJQ7mMQwVlOr6i+JPtdgEZueBcIuUFOhN9nJ
         SwtfbJDNg3tmX+/auSGvYt5TJFESYtF34KyGUvRbV5FwP4EkPGwZaqMlOP/jfOUu1HqB
         oOgnxhD6EGAApGQIWD9yNNr7gAsftFdgr/Zuog7ok8fEa4dxBRGXbichVRw2VQhR5aUW
         dHstTOegWxuRzjUQZ1kJCdpDHVierHXKo51sMf/AdMOYhJT8qPDLM8P67HsEtpH8ycmm
         C1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=6hTKdPmMQYMUKL0WcX6FdFY6W+QP+UuCX8udezkEVrE=;
        b=SBpKJtznMBLrqBDqSKEJBximxSe0R1OKJ8kBsVGeBEmojsUl2oNXvelm8F0mLtSMBt
         6wTctDvGadbpPznMBMdAbrf+xP8wA66axGowEW8nSV4uHVHZbcQ8Un/IeSNA4ESULYRU
         KruDhEK3rDM0nCcCZVF6Sb2CgH+8PsA3wV57o0Bln+zwqRqEPaF4KJjKB/CN8d+OtJYe
         vO4gBYC5jRhBwEeEpvFWJp2Q7MXXO1tOV87BM/hrZjyXOmeigDXQxoTzphPKSqla2Wv8
         +PWNsUh3LMZFIbMqhgAkxDq8Dyb/dcy32su1KQPYOKeYZ4/O+kenGo+RzdUu4hPGtzxU
         30Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b184si8116475wmd.17.2019.04.09.03.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 03:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDo7U-0001zX-4j
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 06:36:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo24-0006Dl-Pm
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo23-0007LD-Re
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:12 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:44064 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo23-0007KE-Ds; Tue, 09 Apr 2019 06:31:11 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id A29B6350D2ABE355EA45;
	Tue,  9 Apr 2019 18:31:07 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 9 Apr 2019 18:31:01 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Tue, 9 Apr 2019 11:29:33 +0100
Message-ID: <20190409102935.28292-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v4 6/8] hw/arm/virt-acpi-build: Add PC-DIMM in
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
X-TUID: bD2otbCrpG4r

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1ad394b..1b9a9b9 100644
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
2.7.4



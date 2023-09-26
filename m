Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp981048ejc;
        Tue, 26 Sep 2023 03:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfMJq56M9fdKPoI8oU/FwsrvAETt42mcM9Vj5G3WfEjB1zDn/buTr0DmoRoW0MoO9YTzMK
X-Received: by 2002:a17:902:82c4:b0:1c5:f0fd:51b5 with SMTP id u4-20020a17090282c400b001c5f0fd51b5mr10249405plz.40.1695722882437;
        Tue, 26 Sep 2023 03:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722882; cv=none;
        d=google.com; s=arc-20160816;
        b=C7Tw0D5hRerTD8FA6R+fUs3HOCnX7CJ3fZrsIDC51uKHIHyr3hFGtuvQBZ5Wkhgb5b
         pa66+WnQraHYmo1AHegXL3mX/XFMNXuCCaV9NnHp93WfDdfvV75cTltf0BZd3TmbURa1
         LAAc10wzTUMGVXfWV2qovy4rrM2WTacVLoX0uApUC4knhuAGHolThlHx9pzDNfzAXRZ2
         QUw7tWVlrd4vGSdbY97OjAtuVJWba7HV1gpsVrNeHxivV+YgilqNRmCcO4xnoy1k3wD6
         owcyLsFY9sgxRzgUpierHY//3P4ah+YVDqI4MmaIg+7kX7dS+Q+TkwnecyGHlkApaA5x
         Q10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=PXpeTdS8gKHnHnm1jwFQkP6Per9J37XauPTKzGgMxUY=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=FbbaczPpEV+SIPWQhKtwPIUJ8542c/OH7tzUqlHoCOvXm+IFBT6O53ZI9uIiS53TJq
         NccMpahkmajWrSX8DfqZcQo5ueZ2fh+i9S8EJAsUvGjuedpMa4LqMLqtlAy593VC5S4E
         ww79KO5gIwLAAr3jSWvl8VJN+abAF2oQTuM7F4DKyq6ukLGuUtbPMxKXrZqUtEIxPbMd
         0v6z+m8u//Bu5q6n7k5Tnvm2sda77mtMjD2gYlS9cB91vB65q32B6relRozZoWiFBpfP
         NrKDwxIUJANkmkfZgyM+a1UR79Sovf5BqrVK3vysevSTvWuL2ydp5XZ3NRl+Mt4NZgHK
         5/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id u7-20020a17090341c700b001c6240dec42si3197698ple.647.2023.09.26.03.08.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwPw2W0pz6K5sX;
	Tue, 26 Sep 2023 18:06:44 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:07:39 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 08/37] arm/virt: Init PMU at host for all possible vcpus
Date: Tue, 26 Sep 2023 11:04:07 +0100
Message-ID: <20230926100436.28284-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: ElqPrSHKjGvW

PMU for all possible vCPUs must be initialized at the VM initialization time.
Refactor existing code to accomodate possible vCPUs. This also assumes that all
processor being used are identical.

Past discussion for reference:
Link: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00131.html

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 12 ++++++++----
 include/hw/arm/virt.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a208b4e517..070c36054e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1960,12 +1960,14 @@ static void finalize_gic_version(VirtMachineState *vms)
  */
 static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
+    CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
     int max_cpus = MACHINE(vms)->smp.max_cpus;
-    bool aarch64, pmu, steal_time;
+    bool aarch64, steal_time;
     CPUState *cpu;
+    int n;
 
     aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
-    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
+    vms->pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
     steal_time = object_property_get_bool(OBJECT(first_cpu),
                                           "kvm-steal-time", NULL);
 
@@ -1992,8 +1994,10 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
             memory_region_add_subregion(sysmem, pvtime_reg_base, pvtime);
         }
 
-        CPU_FOREACH(cpu) {
-            if (pmu) {
+        for (n = 0; n < possible_cpus->len; n++) {
+            cpu = qemu_get_possible_cpu(n);
+
+            if (vms->pmu) {
                 assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
                 if (kvm_irqchip_in_kernel()) {
                     kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 098c7917a4..fc0469c33f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -164,6 +164,7 @@ struct VirtMachineState {
     bool ras;
     bool mte;
     bool dtb_randomness;
+    bool pmu;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
-- 
2.34.1

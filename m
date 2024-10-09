Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595862njl;
        Tue, 8 Oct 2024 20:23:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOoNRuenUK3wpdUOMc8rNrsEokrHqO9vR2Mm2cAb9VxwPlYUhUsQ7U/rKpa88oCM0RMG7twsqA/+dmFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFFe0zr7wUYJvnsW5eI8XXPxFQoZRtSn25JJEBSiEvjAFtoH5no1fWWCXZMQApeUBkBfVsB
X-Received: by 2002:a05:600c:3ac4:b0:42c:df29:2366 with SMTP id 5b1f17b1804b1-430d748cb12mr6380565e9.33.1728444233246;
        Tue, 08 Oct 2024 20:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444233; cv=none;
        d=google.com; s=arc-20240605;
        b=HRtaxnWfUPC4nppQrj52B9Pm661A62TFE7ZhaEHuGnic2P6DLF6QVjtzISRWej2VFu
         SpC6vQrqOhVal+2EC9GV/Eju8VE5Z5NRmRGGKAaqwZt4epK3/d4fGtCawI6Ljs4keNZh
         GrHd07pQQCgADSqQdBhT//HIvP4EszfcoVede9DApc23RMBgKh1EvoOedw4qxQ7VKnv/
         lNsWoDjW/oHGL/2Puoj0YfBXuBSYxtwO6bS/1CPCO6bTUafYnt1SOjFmmnwpJ+KzmrB2
         6UVfoH+Xin7ZKzCmIIYMJYjZEkA5xamI6a/RyPkRfooigdJY6JoqvI8RSR3zsEXN33NT
         TKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Xodga3D9L4wvxir8wVEUmB4VdKxT6PNGTcrobpzV5AQ=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=SxZKierHqdmyUFQP38uh/TXb261JOeqUSj63X+Evz+BMi5Xs8Xkwwpqdt5HPf+Y3YD
         4G3kJYb59fcC+S3QGafzYFLxuSep2a9xr0Lu9NVddqLxjYHw+SMIzdwb6nYXmIpM9DrK
         m9GFmXnQZaXws0y1RTRvOE+RV315FcJu/LKeNeUp07MtTeGKTxVatB3ZaqEKsrzKtcci
         ZbwiEbK6913wMGY3AGGj03ikluRjXxJ1f9zII6cra1AnKkMedKfNLW8ls1lhGBjqTAvr
         FJIWdj0Qg8tILIRC3zVvSF/p8FnP/7cWGaYTelxdnRThRd4iLuMbKjSxAtijjSTLgbYk
         J18g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-430d59b26d5si2662435e9.157.2024.10.08.20.23.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdWq5Wlyz6K998;
	Wed,  9 Oct 2024 11:23:35 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 693C6140A90;
	Wed,  9 Oct 2024 11:23:52 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:23:33 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 13/33] arm/virt: Init PMU at host for all possible vCPUs
Date: Wed, 9 Oct 2024 04:17:55 +0100
Message-ID: <20241009031815.250096-14-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: XPxvJGx5li21

The PMU for all possible vCPUs must be initialized during VM initialization.
Refactor the existing code to accommodate possible vCPUs. This assumes that all
processors being used are identical. It is an architectural constraint of ARM
CPUs that all vCPUs MUST have identical feature sets, at least until the ARM
specification is updated to allow otherwise.

Past discussion for reference:
Link: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00131.html

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 9 +++++----
 include/hw/arm/virt.h | 1 +
 include/hw/core/cpu.h | 5 +++++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e40e6c23e4..696e0a9f75 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2033,12 +2033,13 @@ static void finalize_gic_version(VirtMachineState *vms)
  */
 static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
+    CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
     int max_cpus = MACHINE(vms)->smp.max_cpus;
-    bool aarch64, pmu, steal_time;
+    bool aarch64, steal_time;
     CPUState *cpu;
 
     aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
-    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
+    vms->pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
     steal_time = object_property_get_bool(OBJECT(first_cpu),
                                           "kvm-steal-time", NULL);
 
@@ -2065,8 +2066,8 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
             memory_region_add_subregion(sysmem, pvtime_reg_base, pvtime);
         }
 
-        CPU_FOREACH(cpu) {
-            if (pmu) {
+        CPU_FOREACH_POSSIBLE(cpu, possible_cpus) {
+            if (vms->pmu) {
                 assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
                 if (kvm_irqchip_in_kernel()) {
                     kvm_arm_pmu_set_irq(ARM_CPU(cpu), VIRTUAL_PMU_IRQ);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index b5bfb75f71..98ce68eae1 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -161,6 +161,7 @@ struct VirtMachineState {
     bool mte;
     bool dtb_randomness;
     bool second_ns_uart_present;
+    bool pmu;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bcc62fbf0c..fa6f1dbec9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -607,6 +607,11 @@ extern CPUTailQ cpus_queue;
 #define CPU_FOREACH_SAFE(cpu, next_cpu) \
     QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus_queue, node, next_cpu)
 
+#define CPU_FOREACH_POSSIBLE(cpu, poslist) \
+    for (int iter = 0; \
+         iter < (poslist)->len && ((cpu) = (poslist)->cpus[iter].cpu, 1); \
+         iter++)
+
 extern __thread CPUState *current_cpu;
 
 /**
-- 
2.34.1

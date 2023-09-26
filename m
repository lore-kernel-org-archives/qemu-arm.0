Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp979927ejc;
        Tue, 26 Sep 2023 03:06:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOCzDIig9A6yMvQBKhtF3L7q3FZjcST07okvHmKXayfW5H+y6Audbvguln52rgodViWNbF
X-Received: by 2002:adf:e40a:0:b0:31a:e972:3601 with SMTP id g10-20020adfe40a000000b0031ae9723601mr7458333wrm.54.1695722766791;
        Tue, 26 Sep 2023 03:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722766; cv=none;
        d=google.com; s=arc-20160816;
        b=kG93wl663R0rCSewRabxCoo+mGIRzIwRSdeFUikfTZQl08ZCT52RxWB4/6MDgBmMHS
         aAEOLJHK8Ak2nnoETeVS1YzSmEPucPmz5AK0x+l/ASV+5CYfFRikB/01YM4PdBOMo5pT
         7xE9nS+o9F2w1RUCMUBVpT/65Q/iJrg/jRfUUcZ3IAFqbMsqcr9uNL7Aw3p6nDv2d/UY
         fV/DW7t27ST7LkpdLCoaTcvhnF2JGCz1fFidyGvZ2W4AU4iHdQ9lqFYiMXP0A0JOEujf
         M/CwfkMLpGEjmFtCe3mQ7PiD5UNAdgJ1+zC4Po7TdE2auQ5jo2dle590tzhoKo8dY01z
         U1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=B+O7MQuJt5EgRAuDXtwyRqYAhZwiejg6ezN3/olQkkI=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=Lar3UMpJn3+scU3nH9p4NA++VwYIJ6gA8Orpa7vCoeBHdhWSzJsnBy/zB+TIswCDS0
         5Zla4t7lejVJW6PcL9fdaznFZdQe5jA13wQGC2PPejtq4PjUlrPV4EXUMCvjEFzsJOna
         dgpUcsDml9NRMAYHgpMaAxtwdVewq9ds5uOM4/nBiV+NN/ULpLebGkD8jmPgCOhxxTAG
         erndCH8+8UXaltZBd43Eq1+AfOZ/N/39QR1NFDFLO8UpQVQf+D1OLIGQIsfKxBhosCC8
         0wLsJb7mBoBv2knB3IwxI/msMHT1pWTCvTm8uusWzsCb6g1t9G/zgM5Y/cdG274f4sP4
         sgIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k6-20020adff5c6000000b0031c644f39c0si5798375wrp.877.2023.09.26.03.06.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwMl5nWwz6K8fg;
	Tue, 26 Sep 2023 18:04:51 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:05:47 +0100
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
Subject: [PATCH RFC V2 02/37] cpus-common: Add common CPU utility for possible vCPUs
Date: Tue, 26 Sep 2023 11:04:01 +0100
Message-ID: <20230926100436.28284-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: fmFrUNKZ1fLh

Adds various utility functions which might be required to fetch or check the
state of the possible vCPUs. This also introduces concept of *disabled* vCPUs,
which are part of the *possible* vCPUs but are not part of the *present* vCPU.
This state shall be used during machine init time to check the presence of
vcpus.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 cpus-common.c         | 31 +++++++++++++++++++++++++
 include/hw/core/cpu.h | 53 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 45c745ecf6..24c04199a1 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -24,6 +24,7 @@
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
+#include "hw/boards.h"
 
 QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -107,6 +108,36 @@ void cpu_list_remove(CPUState *cpu)
     cpu_list_generation_id++;
 }
 
+CPUState *qemu_get_possible_cpu(int index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const CPUArchIdList *possible_cpus = ms->possible_cpus;
+
+    assert((index >= 0) && (index < possible_cpus->len));
+
+    return CPU(possible_cpus->cpus[index].cpu);
+}
+
+bool qemu_present_cpu(CPUState *cpu)
+{
+    return cpu;
+}
+
+bool qemu_enabled_cpu(CPUState *cpu)
+{
+    return cpu && !cpu->disabled;
+}
+
+uint64_t qemu_get_cpu_archid(int cpu_index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const CPUArchIdList *possible_cpus = ms->possible_cpus;
+
+    assert((cpu_index >= 0) && (cpu_index < possible_cpus->len));
+
+    return possible_cpus->cpus[cpu_index].arch_id;
+}
+
 CPUState *qemu_get_cpu(int index)
 {
     CPUState *cpu;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fdcbe87352..e5af79950c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -413,6 +413,17 @@ struct CPUState {
     SavedIOTLB saved_iotlb;
 #endif
 
+    /*
+     * Some architectures do not allow *presence* of vCPUs to be changed
+     * after guest has booted using information specified by VMM/firmware
+     * via ACPI MADT at the boot time. Thus to enable vCPU hotplug on these
+     * architectures possible vCPU can have CPUState object in 'disabled'
+     * state or can also not have CPUState object at all. This is possible
+     * when vCPU Hotplug is supported and vCPUs are 'yet-to-be-plugged' in
+     * the QOM or have been hot-unplugged.
+     * By default every CPUState is enabled as of now across all archs.
+     */
+    bool disabled;
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
@@ -770,6 +781,48 @@ static inline bool cpu_in_exclusive_context(const CPUState *cpu)
  */
 CPUState *qemu_get_cpu(int index);
 
+/**
+ * qemu_get_possible_cpu:
+ * @index: The CPUState@cpu_index value of the CPU to obtain.
+ *         Input index MUST be in range [0, Max Possible CPUs)
+ *
+ * If CPUState object exists,then it gets a CPU matching
+ * @index in the possible CPU array.
+ *
+ * Returns: The possible CPU or %NULL if CPU does not exist.
+ */
+CPUState *qemu_get_possible_cpu(int index);
+
+/**
+ * qemu_present_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vCPU is amongst the present possible vcpus.
+ *
+ * Returns: True if it is present possible vCPU else false
+ */
+bool qemu_present_cpu(CPUState *cpu);
+
+/**
+ * qemu_enabled_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vCPU is enabled.
+ *
+ * Returns: True if it is 'enabled' else false
+ */
+bool qemu_enabled_cpu(CPUState *cpu);
+
+/**
+ * qemu_get_cpu_archid:
+ * @cpu_index: possible vCPU for which arch-id needs to be retreived
+ *
+ * Fetches the vCPU arch-id from the present possible vCPUs.
+ *
+ * Returns: arch-id of the possible vCPU
+ */
+uint64_t qemu_get_cpu_archid(int cpu_index);
+
 /**
  * cpu_exists:
  * @id: Guest-exposed CPU ID to lookup.
-- 
2.34.1

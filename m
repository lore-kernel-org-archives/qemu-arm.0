Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp96541ejr;
        Thu, 13 Jun 2024 16:38:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXF8lRuKLJqbNOg25496401i8EYXTxcNUdhUUGtg1hJvwc2bwA6Ncr6BFfRmVenUw5P+nonH6OPCdBIn7w8bgXaKpu8dsnw
X-Google-Smtp-Source: AGHT+IGbEcfnovkekcvdXIgbIp8Uvb/oiR2bqCP33I8SoOPogLt6uqrsFpZesCQcFsydsGwAh9zq
X-Received: by 2002:a05:600c:1e23:b0:41a:b54a:9ad8 with SMTP id 5b1f17b1804b1-423047dca64mr12019075e9.0.1718321898084;
        Thu, 13 Jun 2024 16:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718321898; cv=none;
        d=google.com; s=arc-20160816;
        b=hzaWETge5uqz/Xzjmeo6+GP0gr1JxY/hnY3gZF7Pvo+U59EzzOFoMRY3APc7ofnykq
         kFZt5V3wQ84nC+K5c6lM+c0YUIbb4bgLZ/m9d0l3uMuRW1mdaHmXAFM8nC/oCjLJw4xa
         lb63o9PlkJFyLz5gLezwG1nbzQ/fSl9+IgbjzhlPtiAy3vn3QkGtcRATZ9zbfiLtevz1
         bCpCudCI1T5eq5JqQAHRuJWN9t35HLmAAEEhUGBC5ng/AOkoeODBKBzM+uR4dTSFgAuW
         GDFEanoFDb6Ww3MwCsHDXzyjlc/kpADmWcdUMyVcMECmdu69Y5FiO7I2MdwKYiqe5aIv
         Puww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=EUdUOzC0PfR6zZXK+5xJSDjjO6bpVpRmF/2NFeckt+8=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=z8SlkZy7aY0DrAYwWa9iOLEGwudA1lS/8N7gZM14C46N8zI/QXlRy6TYlPuJXR4LE/
         dC6ITYtjSgNGrsO+MtuK873EGIZ2RZTeeItYHpDkIBkspKVETSCR2Z/+/T2kVF+acmNt
         Fgqh9LmCvRU/V5PT66lGRkRcYQQMZc4AAFDK9tX4uczHSCx99VvHaRi7DZ1MJ03JfJ6L
         l0CaYPQOMNgnQfvjy+9i2sE9GpcHiglPua0MBDt/OH7CPhzvhIcG/fhFyPKaStN0P7JQ
         VUdSb7CWqNQUHOmKzF9Xi+ygWDfwox5cEVJ6O0b1p/In6JqqRhVaPphrzYq2xrkJoYb4
         sglA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-422f6223130si15003065e9.137.2024.06.13.16.38.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f2F27fMz67kr9;
	Fri, 14 Jun 2024 07:36:53 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id B9FA7140594;
	Fri, 14 Jun 2024 07:38:16 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:37:54 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU {socket,cluster,core,thread}-id property
Date: Fri, 14 Jun 2024 00:36:11 +0100
Message-ID: <20240613233639.202896-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: BcYRnkIsD9Jn

This shall be used to store user specified topology{socket,cluster,core,thread}
and shall be converted to a unique 'vcpu-id' which is used as slot-index during
hot(un)plug of vCPU.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 10 ++++++++++
 include/hw/arm/virt.h | 28 ++++++++++++++++++++++++++++
 target/arm/cpu.c      |  4 ++++
 target/arm/cpu.h      |  4 ++++
 4 files changed, 46 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3c93c0c0a6..11fc7fc318 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2215,6 +2215,14 @@ static void machvirt_init(MachineState *machine)
                           &error_fatal);
 
         aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
+        object_property_set_int(cpuobj, "socket-id",
+                                virt_get_socket_id(machine, n), NULL);
+        object_property_set_int(cpuobj, "cluster-id",
+                                virt_get_cluster_id(machine, n), NULL);
+        object_property_set_int(cpuobj, "core-id",
+                                virt_get_core_id(machine, n), NULL);
+        object_property_set_int(cpuobj, "thread-id",
+                                virt_get_thread_id(machine, n), NULL);
 
         if (!vms->secure) {
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
@@ -2708,6 +2716,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int smp_threads = ms->smp.threads;
     VirtMachineState *vms = VIRT_MACHINE(ms);
     MachineClass *mc = MACHINE_GET_CLASS(vms);
 
@@ -2721,6 +2730,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     ms->possible_cpus->len = max_cpus;
     for (n = 0; n < ms->possible_cpus->len; n++) {
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
+        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index bb486d36b1..6f9a7bb60b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -209,4 +209,32 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
             vms->highmem_redists) ? 2 : 1;
 }
 
+static inline int virt_get_socket_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.socket_id;
+}
+
+static inline int virt_get_cluster_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.cluster_id;
+}
+
+static inline int virt_get_core_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.core_id;
+}
+
+static inline int virt_get_thread_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.thread_id;
+}
+
 #endif /* QEMU_ARM_VIRT_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 77f8c9c748..abc4ed0842 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2582,6 +2582,10 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_INT32("socket-id", ARMCPU, socket_id, 0),
+    DEFINE_PROP_INT32("cluster-id", ARMCPU, cluster_id, 0),
+    DEFINE_PROP_INT32("core-id", ARMCPU, core_id, 0),
+    DEFINE_PROP_INT32("thread-id", ARMCPU, thread_id, 0),
     DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
     /* True to default to the backward-compat old CNTFRQ rather than 1Ghz */
     DEFINE_PROP_BOOL("backcompat-cntfrq", ARMCPU, backcompat_cntfrq, false),
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c17264c239..208c719db3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1076,6 +1076,10 @@ struct ArchCPU {
     QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
+    int32_t socket_id;
+    int32_t cluster_id;
+    int32_t core_id;
+    int32_t thread_id;
 
     /* Used to synchronize KVM and QEMU in-kernel device levels */
     uint8_t device_irq_level;
-- 
2.34.1

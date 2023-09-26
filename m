Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp979787ejc;
        Tue, 26 Sep 2023 03:05:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFypENVaEXox2MeUGLrkZksHBiutsRr92SEa+0BBM47xtajMfMUtc98VxDOGMH4pFqmrZeb
X-Received: by 2002:adf:d08f:0:b0:317:dada:2417 with SMTP id y15-20020adfd08f000000b00317dada2417mr7935956wrh.31.1695722748260;
        Tue, 26 Sep 2023 03:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722748; cv=none;
        d=google.com; s=arc-20160816;
        b=to8wRLT87EwV63z6ypLzKGyi7CoOaQF5Z8FQ/myDIUOzHY3dd6P2Jfk1rovc8tg48e
         0lSa45hTRAuTN+rGvMSKc0xnMl90EDML+ZS+FydYtwb9UaBd8fSftBSQKSG4ssUjZCbv
         /27q6kancS6UBubVTVss9PEcWft7JH1nDWZbhhwtKp1BvlO/qjYuWZevtSgas4wt00R2
         YmA4tej3GU7KFzOQ3ljgjcT2EANg4gCVHz6Ua8x5b5REDhlUOEqGwWsmXTLRi4eEL9TK
         6StkLEkoKQtHDvmWNL5IcwRiYx+IukP6sXK3yFQCMNypc93R5jizI/68JIeqbC85+IpF
         VaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=6WKhIgSWoerB+rWo+bU1YYlKl5nvgPSi10cZ7hHPlmc=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=uBzhYPMKeLxYKrZSt91zGVhmw7iqx8yYDUmrQrpRHpshT2hiA1qCCyVlLf4TxWAc0B
         rHEe5dFy/NAOHM3Jcwx1fnPl2a6CDPrGiIU7jOl7PE4enVT0D17Mr8+zPuFdKJM4Qs4j
         k+abE5joE1i5bCqGrnCaTLYbgDc4ZYaSPDAG9YRpI5UuuIF9cZ1w2dykSBZ7HGF5YrWN
         w4amivO2FNgQhQAv/vFBd75Fg1UMbPUnFL5K4/c5lnGqxEPYQdoyM0fawwvWtKyGHwY/
         Ds1+6CdPyUp3Nl+3/6+VHIkhWTkOZAV3f5I9NwqfV+arUJAywyHD02ECF/0fGpebHM6w
         SCyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j11-20020a5d448b000000b00321684bce79si5795034wrq.846.2023.09.26.03.05.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwMP2RSBz6K8pq;
	Tue, 26 Sep 2023 18:04:33 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:05:29 +0100
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
Subject: [PATCH RFC V2 01/37] arm/virt,target/arm: Add new ARMCPU {socket,cluster,core,thread}-id property
Date: Tue, 26 Sep 2023 11:04:00 +0100
Message-ID: <20230926100436.28284-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: pPReL65HenT3

This shall be used to store user specified topology{socket,cluster,core,thread}
and shall be converted to a unique 'vcpu-id' which is used as slot-index during
hot(un)plug of vCPU.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c    | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c |  4 +++
 target/arm/cpu.h |  4 +++
 3 files changed, 71 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7d9dbc2663..57fe97c242 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -221,6 +221,11 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static int virt_get_socket_id(const MachineState *ms, int cpu_index);
+static int virt_get_cluster_id(const MachineState *ms, int cpu_index);
+static int virt_get_core_id(const MachineState *ms, int cpu_index);
+static int virt_get_thread_id(const MachineState *ms, int cpu_index);
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -2168,6 +2173,14 @@ static void machvirt_init(MachineState *machine)
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
@@ -2652,10 +2665,59 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
     return socket_id % ms->numa_state->num_nodes;
 }
 
+static int virt_get_socket_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.socket_id;
+}
+
+static int virt_get_cluster_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.cluster_id;
+}
+
+static int virt_get_core_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.core_id;
+}
+
+static int virt_get_thread_id(const MachineState *ms, int cpu_index)
+{
+    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
+
+    return ms->possible_cpus->cpus[cpu_index].props.thread_id;
+}
+
+static int
+virt_get_cpu_id_from_cpu_topo(const MachineState *ms, DeviceState *dev)
+{
+    int cpu_id, sock_vcpu_num, clus_vcpu_num, core_vcpu_num;
+    ARMCPU *cpu = ARM_CPU(dev);
+
+    /* calculate total logical cpus across socket/cluster/core */
+    sock_vcpu_num = cpu->socket_id * (ms->smp.threads * ms->smp.cores *
+                    ms->smp.clusters);
+    clus_vcpu_num = cpu->cluster_id * (ms->smp.threads * ms->smp.cores);
+    core_vcpu_num = cpu->core_id * ms->smp.threads;
+
+    /* get vcpu-id(logical cpu index) for this vcpu from this topology */
+    cpu_id = (sock_vcpu_num + clus_vcpu_num + core_vcpu_num) + cpu->thread_id;
+
+    assert(cpu_id >= 0 && cpu_id < ms->possible_cpus->len);
+
+    return cpu_id;
+}
+
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int smp_threads = ms->smp.threads;
     VirtMachineState *vms = VIRT_MACHINE(ms);
     MachineClass *mc = MACHINE_GET_CLASS(vms);
 
@@ -2669,6 +2731,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     ms->possible_cpus->len = max_cpus;
     for (n = 0; n < ms->possible_cpus->len; n++) {
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
+        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 93c28d50e5..1376350416 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2277,6 +2277,10 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_INT32("socket-id", ARMCPU, socket_id, 0),
+    DEFINE_PROP_INT32("cluster-id", ARMCPU, cluster_id, 0),
+    DEFINE_PROP_INT32("core-id", ARMCPU, core_id, 0),
+    DEFINE_PROP_INT32("thread-id", ARMCPU, thread_id, 0),
     DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 88e5accda6..d51d39f621 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1094,6 +1094,10 @@ struct ArchCPU {
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

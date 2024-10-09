Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp594826njl;
        Tue, 8 Oct 2024 20:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUuAg4kbup9yGW3WPUiAB05QwslOi6/vx8EcsYonzXcrVlbohybZA7Ik0tCrz/l+hp9YnJHrxZhYQaIg==@linaro.org
X-Google-Smtp-Source: AGHT+IFTaRYiNAoL5VcCI74J4QWVKJVS6wkxmus56QUWu1QcIRFZL6LixRkeHH2HovoInR/5BAqi
X-Received: by 2002:a05:600c:3ac4:b0:428:e866:3933 with SMTP id 5b1f17b1804b1-430d6faa388mr7020435e9.22.1728443998392;
        Tue, 08 Oct 2024 20:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728443998; cv=none;
        d=google.com; s=arc-20240605;
        b=VLCITyFKu5qXKTJEZrtSAOfwlT4bWnVsXsWDzKDyQ5KrEoO5kmQ0j0p4a1aebNl0te
         YMgmLlqSqekrPbFJd4pXhGpshoCq8Ue5i/pWtQ0/6Q/N7VHvq5L8sb+TYSANdBnPtiQM
         9CknpJuZg6ZUSYPBmHEZBoMRm/IiFpnMVttKujqAXyAhQB4yjwuM1hyMcuHEajnWsLUC
         RlSvVKf6GDDq8r0qX3ysYGOsG/6tgJ6FIaMRHw1jZL2JSOBgDifRwxSKb4fOucrt+6wc
         IpvphOQZBWphFP1h6l4GJDYd7oNU1zsOTfFUnPxSkU7BZXri/RDrJ4dcIetCc9atWHYz
         JTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=BoXGaUYFnB/QTckpixjhvsSL7CUv5wh4nRWBmXGxo4c=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=lTqSiREqofSAE6I/vBVQrnyryg+MFLQxbg38C6KtpyonIgeuSrknwvF2ZXkO/a8IsY
         2ZDJEhVLcDtwXCozGzfjeD5LPNHo6bRDHk69GOnlL6A2vuIjczOgvV6gNOh+kVkM6oCK
         EaC6qrOrpEbgmMuKr3xE72a9PFeJSyRuXU5+FCze2U38W+YoEIzrx9wfi2ZgXx2HP4qw
         g1zcNWwpoV6pm18Hdxx82kRnMDBQeHUoC00LsCc8v43uJ+PoQfr8RaclJR/QvgWg7OmX
         g/hI7Ztgxp62+wkGOZW1uPRfbuptED1dMHfx6ugjRyFjJqMXRJ6f3Gv5Xa59lx9aeqEu
         yzsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-430d59b2be8si2650995e9.187.2024.10.08.20.19.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdRJ6lNSz6K95k;
	Wed,  9 Oct 2024 11:19:40 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 9152B140447;
	Wed,  9 Oct 2024 11:19:57 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:19:38 +0200
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
Subject: [PATCH RFC V4 01/33] arm/virt,target/arm: Add new ARMCPU {socket,cluster,core,thread}-id property
Date: Wed, 9 Oct 2024 04:17:43 +0100
Message-ID: <20241009031815.250096-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: J4RsyI8jvH2F

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
index 7934b23651..a0aeb263dc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2240,6 +2240,14 @@ static void machvirt_init(MachineState *machine)
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
@@ -2763,6 +2771,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int smp_threads = ms->smp.threads;
     VirtMachineState *vms = VIRT_MACHINE(ms);
     MachineClass *mc = MACHINE_GET_CLASS(vms);
 
@@ -2776,6 +2785,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     ms->possible_cpus->len = max_cpus;
     for (n = 0; n < ms->possible_cpus->len; n++) {
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
+        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aca4f8061b..db3e2aebb9 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -214,4 +214,32 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
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
index 19191c2391..bda95366d1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2622,6 +2622,10 @@ static Property arm_cpu_properties[] = {
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
index f065756c5c..1277a0ddfc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1086,6 +1086,10 @@ struct ArchCPU {
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

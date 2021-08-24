Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2748913lfg;
        Tue, 24 Aug 2021 05:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh5n0iG4bdssqrXyQdr+WeN91r46NP6Otsyz9ZX47LoVFsCehSiJ+E1E9FwpUkd+vhs+A0
X-Received: by 2002:a67:df85:: with SMTP id x5mr27166378vsk.17.1629807671891;
        Tue, 24 Aug 2021 05:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629807671; cv=none;
        d=google.com; s=arc-20160816;
        b=rb9nJfgxJXQdSHiG1CXsnb6MrzMVx5SsVhlvKIlsbsrNGP4IaMbQti4saNJ+Bf8FUp
         PPpiTBB6lU8h/R6iPaTf5MN7IJnA/XfFD2iKQvvC/RnIzRfNdqHa35r+klzr59viUNkZ
         6b6yuEpE0xxWBcng0MJmsyX+MWmaogb5f16HYpnuHN4jl9LmgMZPLmeiuPtqiYXDSb7n
         hDR71+A1tDA0xt9DT9YnzWpv4nU3nQk+MZLhufhMP/zV94DBEP0GbIrtWpen7NAnQEAH
         gjSy004QBBH7gkBJcbvrQkUjMqRV0vF7qs59IDEwqCWnPtALZBwgkcXuZYiomBspjW67
         qLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=T/X4jkgcoJ0/ep4YGnSPcxP4bVrHlyd8Y/3uYp9E1q4=;
        b=VTiYaZi63n56dlKLtAZRko0vZo9WSUTYVg6IPC94K8U1gXJlajOQyhbPUHT6Tq4n9A
         zFe84oENV+JriDf4wNkCNDa+YqsnPyRXTqLFPBnVL+hBeVZkiVO7Bbe3+rl7p+1G7fEk
         uMksvVocNt36GJd8CrCSzM8EJlVmH6GGFuJi24y8yrtbalZuKtcXzUog9CnX7zCnK1wE
         KffNOYIoSNVHYrUv0KN6T7pKTVfh0CuyqGfixvVC5ROh8QkQqB3zgA+vwz/0CY3rSW35
         FF6zuLerDoCGJlkdS32oub3J3NQcuQHU2VqriKr9o5YBhmW7B8Mc3gARNJUKCHIZLExk
         GM7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si804578vso.146.2021.08.24.05.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 05:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIVQV-00009O-2w
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 08:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIVPv-0007S8-Pj; Tue, 24 Aug 2021 08:20:35 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIVPs-0003ZE-EM; Tue, 24 Aug 2021 08:20:35 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gv7Pt3n3GzbdZH;
 Tue, 24 Aug 2021 20:16:34 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 20:20:23 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 20:20:23 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v6 3/5] hw/arm/virt: Add cpu-map to device tree
Date: Tue, 24 Aug 2021 20:20:14 +0800
Message-ID: <20210824122016.144364-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210824122016.144364-1-wangyanan55@huawei.com>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6oxaO57vzdzk

From: Andrew Jones <drjones@redhat.com>

Support device tree CPU topology descriptions.

In accordance with the Devicetree Specification, the Linux Doc
"arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
present. And we have already met the requirement by generating
/cpus/cpu@* nodes for members within ms->smp.cpus. Accordingly,
we should also create subnodes in cpu-map for the present cpus,
each of which relates to an unique cpu node.

The Linux Doc "cpu/cpu-topology.txt" states that the hierarchy
of CPUs in a SMP system is defined through four entities and
they are socket/cluster/core/thread. It is also required that
a socket node's child nodes must be one or more cluster nodes.
Given that currently we are only provided with information of
socket/core/thread, we assume there is one cluster child node
in each socket node when creating cpu-map.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 70 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 82f2eba6bd..bdcf7435f0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -350,20 +350,21 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
+    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     int smp_cpus = ms->smp.cpus;
 
     /*
-     * From Documentation/devicetree/bindings/arm/cpus.txt
-     *  On ARM v8 64-bit systems value should be set to 2,
-     *  that corresponds to the MPIDR_EL1 register size.
-     *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
-     *  in the system, #address-cells can be set to 1, since
-     *  MPIDR_EL1[63:32] bits are not used for CPUs
-     *  identification.
+     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
+     * On ARM v8 64-bit systems value should be set to 2,
+     * that corresponds to the MPIDR_EL1 register size.
+     * If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
+     * in the system, #address-cells can be set to 1, since
+     * MPIDR_EL1[63:32] bits are not used for CPUs
+     * identification.
      *
-     *  Here we actually don't know whether our system is 32- or 64-bit one.
-     *  The simplest way to go is to examine affinity IDs of all our CPUs. If
-     *  at least one of them has Aff3 populated, we set #address-cells to 2.
+     * Here we actually don't know whether our system is 32- or 64-bit one.
+     * The simplest way to go is to examine affinity IDs of all our CPUs. If
+     * at least one of them has Aff3 populated, we set #address-cells to 2.
      */
     for (cpu = 0; cpu < smp_cpus; cpu++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
@@ -406,8 +407,57 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (!vmc->no_cpu_topology) {
+            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
+                                  qemu_fdt_alloc_phandle(ms->fdt));
+        }
+
         g_free(nodename);
     }
+
+    if (!vmc->no_cpu_topology) {
+        /*
+         * Add vCPU topology description through fdt node cpu-map.
+         *
+         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
+         * In a SMP system, the hierarchy of CPUs can be defined through
+         * four entities that are used to describe the layout of CPUs in
+         * the system: socket/cluster/core/thread.
+         *
+         * A socket node represents the boundary of system physical package
+         * and its child nodes must be one or more cluster nodes. A system
+         * can contain several layers of clustering within a single physical
+         * package and cluster nodes can be contained in parent cluster nodes.
+         *
+         * Given that cluster is not yet supported in the vCPU topology,
+         * we currently generate one cluster node within each socket node
+         * by default.
+         */
+        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
+
+        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
+            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
+            char *map_path;
+
+            if (ms->smp.threads > 1) {
+                map_path = g_strdup_printf(
+                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
+                    cpu / (ms->smp.cores * ms->smp.threads),
+                    (cpu / ms->smp.threads) % ms->smp.cores,
+                    cpu % ms->smp.threads);
+            } else {
+                map_path = g_strdup_printf(
+                    "/cpus/cpu-map/socket%d/cluster0/core%d",
+                    cpu / ms->smp.cores,
+                    cpu % ms->smp.cores);
+            }
+            qemu_fdt_add_path(ms->fdt, map_path);
+            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
+
+            g_free(map_path);
+            g_free(cpu_path);
+        }
+    }
 }
 
 static void fdt_add_its_gic_node(VirtMachineState *vms)
-- 
2.19.1


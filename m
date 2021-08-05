Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp206006lff;
        Thu, 5 Aug 2021 05:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIypyv/hD+M9VbqyDvreAmMCQDHUZTM4AwbT4bwiklrEwC3Lylp/NUVapYifEXFk3soeHK
X-Received: by 2002:a05:6122:902:: with SMTP id j2mr3442421vka.6.1628167479748;
        Thu, 05 Aug 2021 05:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628167479; cv=none;
        d=google.com; s=arc-20160816;
        b=0Mt5Eh/GupnQNCXfiqBRZV/AWQ8uTPYjsJbXhbE3ckb6Sd3COarTZb5FRf//pRT8sv
         Nq2kyXLzq2eg1HJ00uAoa+jBoECSgCMMpzuEMtrwtSKcBS2uLEFVhjcownf8oNtu0MxF
         nhIUe1QVXFL1F36Nl9jnwPd/ezv5U/Xgws7k/6MPGUz8wcyLqQhfJYNvMbJH5gUIo47o
         u6u/QgId2geb6xnzJJ7lnuYLVpRlrkEasVxEWKyEIukAM9d5OEqmIc28LQxBARjfm+mP
         G0lS/zZzODJF4KnvuqZu+MrGaBHMJU7TUWA2vBivH9omis1nqM0MFzf49ConUiEgv0wY
         +fMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=UM7sltESuwWTs7t8u8d3TPjPY8anVszCpgtHGsYW7jg=;
        b=zBzzaUTfWnHXHWjRDnYTs7ZmCnNVAoP5XxwUt/gJg4mcaiwmdGBdBVJgS9dDJboT8V
         VytCAvdt9l8GlCj1PD1Fb5+BXEh48YDV2hGFAzmBFBuDLUpv6CpqTk0vWFbffXurk1YN
         SfL7G+6s1VOiTJ4shMtqRUqpViiLOI7QEycNEWitHHthFnDwi9av1ilnflUI9gyhP9ca
         oK9KI82Ymx1EiOkSGoi7XMQnJkdEIHQY2ufeSbWRIFp6dfSJGB90slZaN8JFVJ41YZa9
         LGvWDfnPl4rr6k6nX6/gasFsuGU1FnLh+ZiordnIc1EH5YJGIY+sN0ko4U9f/j3r0uBW
         aoYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si3374696vse.398.2021.08.05.05.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Aug 2021 05:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBcjl-00038I-RV
	for alex.bennee@linaro.org; Thu, 05 Aug 2021 08:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBcf2-000467-96; Thu, 05 Aug 2021 08:39:44 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBcew-00063E-KR; Thu, 05 Aug 2021 08:39:44 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GgSq31cl1z1CSmf;
 Thu,  5 Aug 2021 20:39:27 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 20:39:33 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 20:39:32 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH for-6.2 v5 3/5] hw/arm/virt: Add cpu-map to device tree
Date: Thu, 5 Aug 2021 20:39:19 +0800
Message-ID: <20210805123921.62540-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210805123921.62540-1-wangyanan55@huawei.com>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: SdidWn7gRcFo

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
 hw/arm/virt.c | 59 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 82f2eba6bd..d1e294be95 100644
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
@@ -406,8 +407,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
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
+         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
+         * In a SMP system, the hierarchy of CPUs is defined through four
+         * entities that are used to describe the layout of physical CPUs
+         * in the system: socket/cluster/core/thread.
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


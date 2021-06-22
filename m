Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2888637lfg;
        Tue, 22 Jun 2021 02:40:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzF04ecvYUL6wTVciWVW+IV55OpFGpFENGXyHfUZhYo7fMBHCcIm4YprZ/i4y6+nQXhrpV
X-Received: by 2002:a05:6638:23a:: with SMTP id f26mr3093810jaq.6.1624354800868;
        Tue, 22 Jun 2021 02:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624354800; cv=none;
        d=google.com; s=arc-20160816;
        b=xEQno2H364bGDD1C2OQ8OIQxGrsPyso+hwNuJh2OnmJ60p3dfd+jihukIvGZZf7NZn
         9ElJkbPYjR/Vdto6+lJ5i5qHUhMdw4dv/M0Uq/LA4y48DKrW/HOvBteWPf7xtsIAE7Qh
         9OoUlpGFfoQgCnrGxabblAMPfm8gUZ6N4TQi9jz0BA7j20ZreClbzNvAbP4bcA6jXOAV
         VhHZMJ5o33lIfx8cVYEcQw58JeaZb7TlA154mXFTFzOmqkeILx1I7z+av/03h3miLZG9
         gFuBy0IvxECrqsa1dFEGyiNwUT8xBrzCwOFnd+LxY3nSWabDqbkn1Jgu/1T9p/NsLyZL
         CgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=yiKPI/n+LfSq4Qu4Mf9ok6+TYrc7xp3ujWJQL55aKCw=;
        b=VYCpvEfd7J3eqSeBnSzE56EjGnpndk0axjrdJaaVT1xL/K+IkKdcmS5o/0a3evzlpG
         P9eTVlKW602BA/PcSjcx5M067usr0445PjdApuYXOiXvMNBjw2P3/ikqQk3LflIy/I4U
         BlnHbsxawsyyoVex+I0TSsE1OYH155fK6TffqYf05ZmNEHKws12+ZiZO8uK4442acWjb
         hqDOhIcTODB99h8S6tgtnHD09WRc6Y7qJktus1Eio2YyBR+jgPO4ZQ2RvL9yNPWis73W
         AXDFKEgl9/cC5eplsj3OQIFtBpUFg+nG4QJuuj/aTxKVBBTZMfdADP01n78Y3LCAhkCu
         lyag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si19196097ilo.118.2021.06.22.02.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 02:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcsy-0007Ad-3S
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 05:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcns-00039x-2q; Tue, 22 Jun 2021 05:34:44 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcni-00032Q-L2; Tue, 22 Jun 2021 05:34:43 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G8LjB1vD7z70y7;
 Tue, 22 Jun 2021 17:30:22 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:27 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:26 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 5/7] hw/arm/virt: Add cpu-map to device tree
Date: Tue, 22 Jun 2021 17:34:11 +0800
Message-ID: <20210622093413.13360-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4m6jnbgRabQe

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
 hw/arm/virt.c | 58 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f29d796f3f..645ce7d260 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -355,17 +355,17 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
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
@@ -408,8 +408,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (ms->expose_cpu_topology) {
+            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
+                                  qemu_fdt_alloc_phandle(ms->fdt));
+        }
+
         g_free(nodename);
     }
+
+    if (ms->expose_cpu_topology) {
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
+                    "/cpus/cpu-map/%s%d/cluster0/%s%d/%s%d",
+                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
+                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
+                    "thread", cpu % ms->smp.threads);
+            } else {
+                map_path = g_strdup_printf(
+                    "/cpus/cpu-map/%s%d/cluster0/%s%d",
+                    "socket", cpu / ms->smp.cores,
+                    "core", cpu % ms->smp.cores);
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
2.23.0


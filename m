Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp211687lfq;
        Wed, 16 Sep 2020 20:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl2DczDuthgAhFHkQk6BUXuNDQpbK/S4OCn5EQfaZH4byibdwsaYAHiGxb07dJjqMCwKcV
X-Received: by 2002:a25:9d8b:: with SMTP id v11mr22291671ybp.444.1600313215597;
        Wed, 16 Sep 2020 20:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600313215; cv=none;
        d=google.com; s=arc-20160816;
        b=RFUYio3SbcVjFerH15trUAeByofCmzTd8TTe1Kz8JLErKManUC1jMQ1m30n1UR9+0L
         1RMCG9QUuEFcFrhjCDAuRQks8nE9JG+8i+Z4iGS1Ddx07h1+EQ46/1U0O1Ft+YzCH16L
         190T39Cm+2juetPaD3ALufAn1Gfe46u3nTeQoQt379ASrH3NXzombsnm+I5w1Zi5pmRO
         SzvNt8d/D/7MBGKOb9ue+TMMMa09ddviRwb0p14p3BjyjGszCWm5AZ2/KmNVfRZs2nz5
         Xp0j/T3sCSFddPxowiPC1Hvn2UwbhdeBw1j9FaMfwXcUl4GGxjcdpZhACcHylb4jJBrn
         CAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GxdqhNGYdWyW2Nc/aLxbWs0TBDc+fG8vP4z4An/gceQ=;
        b=tU5X48bhZpHdR37IRFVu1xOvH+iIQXgmWfbjr7naOaBs3n5Z3lcep5F9ZipBlv4IBv
         hMf4G8UNgOEM41rlvxSx8b0hrgzqBhz9YWBNnu0nydCEAWTa5nI1l8b7eVno4WuXMF5X
         cqBGcAoD1Ythu057H3PStY1rGEoGDuA+tCB/fl9rTXLhlVF6fiMj+yMRacRjYaDqK1fk
         XiD44S3KQ7HHxPoTf6e2IxB+kluXXSHyy4oddEgNjJHElqeuQPaInS/G5k31631ILJg3
         Zk1KDMxsRUcASQABdP3mwq135TgpdE2d7JP4xmvOYN5EabeK84c7Hk2I2nlw0VHnmLGw
         9MRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si18570353yba.238.2020.09.16.20.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkZS-0004l9-TI
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUU-0005C4-82; Wed, 16 Sep 2020 23:21:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4703 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUM-0004Rb-Nb; Wed, 16 Sep 2020 23:21:45 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A07A7DF9F29F525B468D;
 Thu, 17 Sep 2020 11:21:15 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:21:05 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 10/12] hw/arm/virt: add fdt cache information
Date: Thu, 17 Sep 2020 11:20:31 +0800
Message-ID: <20200917032033.2020-11-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XQs433dh3Y1U

Support devicetree CPU cache information descriptions

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 71f7dbb317..74b748ae35 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -343,6 +343,89 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL2_IRQ, irqflags);
 }
 
+static void fdt_add_l3cache_nodes(const VirtMachineState *vms)
+{
+    int i;
+    const MachineState *ms = MACHINE(vms);
+    ARMCPU *cpu = ARM_CPU(first_cpu);
+    unsigned int smp_cores = ms->smp.cores;
+    unsigned int sockets = ms->smp.max_cpus / smp_cores;
+
+    for (i = 0; i < sockets; i++) {
+        char *nodename = g_strdup_printf("/cpus/l3-cache%d", i);
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cache");
+        qemu_fdt_setprop_string(vms->fdt, nodename, "cache-unified", "true");
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "cache-level", 3);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "cache-size",
+                              cpu->caches.l3_cache->size);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "cache-line-size",
+                              cpu->caches.l3_cache->line_size);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "cache-sets",
+                              cpu->caches.l3_cache->sets);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
+                              qemu_fdt_alloc_phandle(vms->fdt));
+        g_free(nodename);
+    }
+}
+
+static void fdt_add_l2cache_nodes(const VirtMachineState *vms)
+{
+    int i, j;
+    const MachineState *ms = MACHINE(vms);
+    unsigned int smp_cores = ms->smp.cores;
+    signed int sockets = ms->smp.max_cpus / smp_cores;
+    ARMCPU *cpu = ARM_CPU(first_cpu);
+
+    for (i = 0; i < sockets; i++) {
+        char *next_path = g_strdup_printf("/cpus/l3-cache%d", i);
+        for (j = 0; j < smp_cores; j++) {
+            char *nodename = g_strdup_printf("/cpus/l2-cache%d",
+                                  i * smp_cores + j);
+            qemu_fdt_add_subnode(vms->fdt, nodename);
+            qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cache");
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "cache-size",
+                                  cpu->caches.l2_cache->size);
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "cache-line-size",
+                                  cpu->caches.l2_cache->line_size);
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "cache-sets",
+                                  cpu->caches.l2_cache->sets);
+            qemu_fdt_setprop_phandle(vms->fdt, nodename,
+                                  "next-level-cache", next_path);
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
+                                  qemu_fdt_alloc_phandle(vms->fdt));
+            g_free(nodename);
+        }
+        g_free(next_path);
+    }
+}
+
+static void fdt_add_l1cache_prop(const VirtMachineState *vms,
+                            char *nodename, int cpu_index)
+{
+
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(cpu_index));
+    CPUCaches caches = cpu->caches;
+
+    char *cachename = g_strdup_printf("/cpus/l2-cache%d", cpu_index);
+
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "d-cache-size",
+                          caches.l1d_cache->size);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "d-cache-line-size",
+                          caches.l1d_cache->line_size);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "d-cache-sets",
+                          caches.l1d_cache->sets);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "i-cache-size",
+                          caches.l1i_cache->size);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "i-cache-line-size",
+                          caches.l1i_cache->line_size);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "i-cache-sets",
+                          caches.l1i_cache->sets);
+    qemu_fdt_setprop_phandle(vms->fdt, nodename, "next-level-cache",
+                          cachename);
+    g_free(cachename);
+}
+
 static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 {
     int cpu;
@@ -378,6 +461,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
 
+    if (cpu_topology_enabled) {
+        fdt_add_l3cache_nodes(vms);
+        fdt_add_l2cache_nodes(vms);
+    }
+
     for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
@@ -407,6 +495,9 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (cpu_topology_enabled) {
+            fdt_add_l1cache_prop(vms, nodename, cpu);
+        }
         qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
                               qemu_fdt_alloc_phandle(vms->fdt));
 
-- 
2.23.0


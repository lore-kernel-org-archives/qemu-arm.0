Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4783424lfa;
        Tue, 20 Oct 2020 06:21:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo5AFWwjGHb6179e7gUGJsAz11mqEJomjZYJgVYOas/3uUNnU1J5SlNhMP/AFusQz9Grir
X-Received: by 2002:a25:2406:: with SMTP id k6mr4236707ybk.491.1603200074159;
        Tue, 20 Oct 2020 06:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603200074; cv=none;
        d=google.com; s=arc-20160816;
        b=H14N643HmpFZaBM+0wcCbDOXPzuOXgfNWG6h9HdHAK3WvGwgbv8AfjDHzSKBPZwRcX
         ss+HWKVCF0Uo+aYbxtFTED0yd8CjZB/V/uohPdXCWnBrq3gS9Is83jzQMqSnzBSexQvK
         2iH/F4q/nSQbFpFeZEaOcTzfyqVnpTFB36RN4fVodZUQvjJ1MuGHCu+B5wMgYDWxCqkl
         NHgG4f/ACHDPa8RrQpMLwxr2kAiEq2fGVDkN3COg/WqQ7ViVqTFXSIkHmxW8JtPmRomG
         vPRKF4LOdb69OpAwK0Ouq1TByfXmzD27yT5AgY3bSd9s46DnemkpsWCB6wJwXxk2jhG/
         nlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yzePIkhbOEpepNFjlTuX7+kbwrvbpVrkAcicqe57K9Q=;
        b=0A9zk6TsuuZY7jHE4Tpp4O/r11k1lUxVEvhFG5ZxCd7YTxJjkb+SYdFEfkyaah3UHL
         EmwBRslHCTqxaMalEk3AKQ9q4vN9F6w1NZaC2Bt/1pi82aAucOOXV7G0xJe50gVFBbcG
         bp8zIkVJOkqCtJPlNKOETXWYOkjpC2RGrH9vCk+wPoDBF8c5QIo787dcBKlGowrAbFjA
         Xjd3Fkga5MXe3klWVKkxOvdCVJT3P90LZP/jSKuxBrKyR28GywV9mmKPya93v68ZvPHS
         K7dgjOUpHwCnSdV3hkdsltcMjJcfSJqkVvylqPBguMWIp8f4P5PMkvmKarOE3weg8LLl
         OLlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si1541481ybn.484.2020.10.20.06.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrZe-0007Ik-0H
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU5-0000H8-6p; Tue, 20 Oct 2020 09:15:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:48472 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-00078C-Gv; Tue, 20 Oct 2020 09:15:24 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0243AF11A9764F7FD849;
 Tue, 20 Oct 2020 21:15:15 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:05 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 11/13] hw/arm/virt: add fdt cache information
Date: Tue, 20 Oct 2020 21:14:38 +0800
Message-ID: <20201020131440.1090-12-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 07:04:17
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
X-TUID: 3kKbpO9Vglje

Support devicetree CPU cache information descriptions

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d23b941020..adcfa52854 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -346,6 +346,89 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
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
@@ -379,6 +462,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
 
+    if (!vmc->ignore_cpu_topology) {
+        fdt_add_l3cache_nodes(vms);
+        fdt_add_l2cache_nodes(vms);
+    }
+
     for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
@@ -408,6 +496,10 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (!vmc->ignore_cpu_topology) {
+            fdt_add_l1cache_prop(vms, nodename, cpu);
+        }
+
         if (ms->smp.cpus > 1 && !vmc->ignore_cpu_topology) {
             qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
                                   qemu_fdt_alloc_phandle(vms->fdt));
-- 
2.23.0


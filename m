Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3261457lfb;
        Sun, 8 Nov 2020 19:05:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv9Fc428XPfEGkI0GChjaoto5doR1LaD70vV/1mVV267clbDEyK2qXF3z1D1N8bt+rKi99
X-Received: by 2002:a25:60d7:: with SMTP id u206mr15921773ybb.315.1604891154391;
        Sun, 08 Nov 2020 19:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891154; cv=none;
        d=google.com; s=arc-20160816;
        b=cL3xhk9P3rETSxTTL+QP3AjEYn88AqzMuiN88I1bhyA+m/6ZY1Udsm2nnhgp+5Dd1W
         abFdlyOnNuWIbaofue5fUYPdg9nsAeUxXdgYmDGJ7MEMcjHXBH6TCEJwT+1RcNiipjJx
         FVrVKgR/NOfC9zCcS4NCG95CG77BDBxlGSVlKDKrO8GRLkRCuudWj6HmPBqRBrpROHWE
         yV8w+zDaGGJgE1QGpvTOGlzjriBKder2EWj7yAPtsKrOof/xAgEozCro3Xq6YvcNPupa
         H+Cx0Q0pWaTKPROD7zlyRmEjnORE/yS5LRpKpDrdjtgaIgssITEWJUKP1rp6D1UtTmlU
         E37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=tZ9AkKj3MEdRkKm+xN2xAVaUbFPpSbU4/S54aPIZqZY=;
        b=twqZRyo+xY3rwXIPaxqoB7CH0S8bv4GzfjqeZb4QMgpliHOw0V2/suEd4z6N7NTkBS
         NbTaVboqi9sjsgEdx1IQGmrrmch/o7Ictd66vwwOoyXeaMi4p1hbZaEET+EAaSIhx1wL
         b469a5N4qARzH1QonOhHvcxxwoXIV2Z+y4Yt2Nubs/2pxtOYcV/SNOiREEyyVWVf62fK
         /JxvNn8pWozoidRKQV73/5wwsmT7e0aZeRnKDwnP8NCKCD1CstV1UtHY2wn4q0Ykq9ZF
         mPpD3OcHlrxByHdJvX9l22TCnN7draf7Dj7E8YCreyzbAlACNrjXyjcwqUr54xTaE0Z0
         i47Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si7782143ybe.249.2020.11.08.19.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxVB-0001b0-Nk
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUq-0001aA-Mu; Sun, 08 Nov 2020 22:05:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUn-0006eZ-CS; Sun, 08 Nov 2020 22:05:32 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CTwpc2L7Lzkgtd;
 Mon,  9 Nov 2020 11:05:12 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:13 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 06/13] hw/arm/virt: DT: add cpu-map
Date: Mon, 9 Nov 2020 11:04:45 +0800
Message-ID: <20201109030452.2197-7-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XNmeDJZVlLd

From: Andrew Jones <drjones@redhat.com>

Support devicetree CPU topology descriptions.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt.c         | 40 +++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ff8a14439e..d23b941020 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -351,9 +351,10 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
     /*
-     * From Documentation/devicetree/bindings/arm/cpus.txt
+     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
      *  On ARM v8 64-bit systems value should be set to 2,
      *  that corresponds to the MPIDR_EL1 register size.
      *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
@@ -407,8 +408,42 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (ms->smp.cpus > 1 && !vmc->ignore_cpu_topology) {
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
+                                  qemu_fdt_alloc_phandle(vms->fdt));
+        }
+
         g_free(nodename);
     }
+
+    if (ms->smp.cpus > 1 && !vmc->ignore_cpu_topology) {
+        /*
+         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
+         */
+        qemu_fdt_add_subnode(vms->fdt, "/cpus/cpu-map");
+
+        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
+            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
+            char *map_path;
+
+            if (ms->smp.threads > 1) {
+                map_path = g_strdup_printf(
+                            "/cpus/cpu-map/%s%d/%s%d/%s%d",
+                            "cluster", cpu / (ms->smp.cores * ms->smp.threads),
+                            "core", (cpu / ms->smp.threads) % ms->smp.cores,
+                            "thread", cpu % ms->smp.threads);
+            } else {
+                map_path = g_strdup_printf(
+                            "/cpus/cpu-map/%s%d/%s%d",
+                            "cluster", cpu / ms->smp.cores,
+                            "core", cpu % ms->smp.cores);
+            }
+            qemu_fdt_add_path(vms->fdt, map_path);
+            qemu_fdt_setprop_phandle(vms->fdt, map_path, "cpu", cpu_path);
+            g_free(map_path);
+            g_free(cpu_path);
+        }
+    }
 }
 
 static void fdt_add_its_gic_node(VirtMachineState *vms)
@@ -2672,8 +2707,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 3)
 
 static void virt_machine_5_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_5_3_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    vmc->ignore_cpu_topology = true;
 }
 DEFINE_VIRT_MACHINE(5, 2)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 010f24f580..917bd8b645 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -118,6 +118,7 @@ typedef enum VirtGICType {
 struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
+    bool ignore_cpu_topology;
     bool no_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
-- 
2.23.0


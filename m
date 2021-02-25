Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp175479lfg;
        Thu, 25 Feb 2021 01:00:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiP2mqgPmksxAm+3z2SnHGqAZ16PoOCluPNaB+bwqgufHvIn7qM8cwH62wSlCXy/zr/rgo
X-Received: by 2002:a5b:98a:: with SMTP id c10mr2589732ybq.406.1614243602134;
        Thu, 25 Feb 2021 01:00:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614243602; cv=none;
        d=google.com; s=arc-20160816;
        b=QkYCjJY2bbWktKu8xs6G00Bua0HW1StBfXEWvrR6ZV7Z74aF2qHxcNcO0oKF16I5Ez
         VYwm+pPBWA1nElSmOUq4Heov137FtbOI9lAunLpLHEMU7evv7DRIwzy8T8q63Za6ZcwC
         V3UREM99RbuY6aqHuHN09SkkygpKzIjpzSdQ/80zs2WCVX0bVY0hMPgX5TJdiggk8m82
         X8uV16lJbeKP3UfTP7Oga21JvoS34idc1YyRcoZtOFBmCgN6NiGR7bJOEqF/jgH1yN1T
         ZmSBMGfZr6Q2lWcO+3DmGAQWRPKancEpRwBO4a7Xfg0Tb6fgZkYKfIli26bJPYKDxpPY
         lQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=HrLro5r7O0xK5xwpFedPqV3dRQig8nRSDYLLuO+wlBE=;
        b=CIpsXaWrbpghgsgoK9lZAwnSpAGN4U8sRa0zktZAI3xTzIos88PTTZ1+5dRwbApVfx
         XNYAweDOB+o+DtTka18InGf/Ty9MHMfZCTrkYgcW7tGcIYY4tNpzAFph6VGxB71rMPeA
         SyhoW96l/yUpwCYrekLSQoicbzAuRxAp0P8a7DWH8To1MvAv5WQ+Tcv+J+MnRQ8p+ZJr
         UP7y1Fs5wKxES0Z98kvHQhhCJbhF36awN/r3oUVZsqhjpTP7zgFtXXKBpx2yOCnvJ2a1
         gmt237Nzu/yEULepUR5zuh2dKB80QQjBlEHpce7piTvp6cU5Ibva3t5uTx3d07wYgcS/
         jqtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si4708288ybj.358.2021.02.25.01.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 01:00:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCV5-0002fm-Lt
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 03:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSK-0007gu-0m; Thu, 25 Feb 2021 03:57:08 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSE-0003tz-OE; Thu, 25 Feb 2021 03:57:07 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmRSf2qgwz16CGQ;
 Thu, 25 Feb 2021 16:55:14 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 16:56:40 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/5] hw/arm/virt: Add cpu-map to device tree
Date: Thu, 25 Feb 2021 16:56:24 +0800
Message-ID: <20210225085627.2263-3-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210225085627.2263-1-fangying1@huawei.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 zhang.zhanghailiang@huawei.com, mst@redhat.com, salil.mehta@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vtEEz8w330yq

Support device tree CPU topology descriptions.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt.c         | 38 +++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae..c133b342b8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -351,10 +351,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
+    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     int smp_cpus = ms->smp.cpus;
 
     /*
-     * From Documentation/devicetree/bindings/arm/cpus.txt
+     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
      *  On ARM v8 64-bit systems value should be set to 2,
      *  that corresponds to the MPIDR_EL1 register size.
      *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
@@ -407,8 +408,42 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
+                                  qemu_fdt_alloc_phandle(vms->fdt));
+        }
+
         g_free(nodename);
     }
+
+    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
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
@@ -2742,6 +2777,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
     virt_machine_6_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     vmc->no_secure_gpio = true;
+    vmc->no_cpu_topology = true;
 }
 DEFINE_VIRT_MACHINE(5, 2)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ee9a93101e..7ef6d08ac3 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -129,6 +129,7 @@ struct VirtMachineClass {
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
     bool no_secure_gpio;
+    bool no_cpu_topology;
 };
 
 struct VirtMachineState {
-- 
2.23.0


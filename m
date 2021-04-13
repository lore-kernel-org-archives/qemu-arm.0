Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4645645lfr;
        Tue, 13 Apr 2021 01:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVw39oIdfym7sAtc3/727P7PiZa+oWB72pl2X6eLfTuj+1o3IJj6/4LmOsAKBgviypnIEN
X-Received: by 2002:a1f:6e49:: with SMTP id j70mr5008697vkc.11.1618301317845;
        Tue, 13 Apr 2021 01:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618301317; cv=none;
        d=google.com; s=arc-20160816;
        b=0OyR43Wi/7Y5FT7x5PcPy90XSu5DX5XYC+VxEp5FfoVVJrH08ruLsZENr6/HS5uScN
         rZwKDoIu+4i7NtSZeZ6CQokSrdXsdiyurcVdbTnZFLMg8C2yAEInoFNgwNHH9DecYimc
         o0C45m4gUL+Jh18irFiYVacqv9mM762b4xxlmWA1pCCAI3HGnbX4tgbOAAq7h2ZzxsQw
         TRf3m8/r+s/+MK+y9kP/Da5/jXjD2cPnZpncEX8cjEXDpZm5Ex59BACXrMdph39jRnCp
         v/egf3TvibdE9ISObJu+iHNy4ARjyG06i1cEMxx8YJgIYcSfTFTllUPWgbOVJZmoEuyN
         6Z2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=WXVQ757f6lIkHmGNpqS4rvuSZ+VxegVoRpzBhZQIpUI=;
        b=aLQrV3b47YM1Au1iu5n++F8ho9omeCc1bWnWfTao9alnkZmFdsmzr59H6lmQkYm9Ua
         4PbB2egjj6jYCM0q1QGXmy6XRY63nvu8CenIa1vw3cV+G/8NiDHecIvgDW0LTFSzwOqA
         JYp6g/3x80eCaJh7fJ8B2y+8qOYsgJhRHPtuB6RIShXLnIaloNzqqCCe0Et3KsdFTHqZ
         29LmJPPodAVJVBPCvrwi8GQgPVnIvOTn4JrJvXRlDYFtNuWDBTBl6DgjxRX6WB3uoOFj
         nVANNrcrRjaplyYUVwSNfJ0nS/0zRvOF8Quq5Anxb+li1eyuC+bj3+VXZvEuZVdjjFsy
         ChkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r30si1456603vsj.111.2021.04.13.01.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWE69-0004jn-5Z
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5m-00049k-M5; Tue, 13 Apr 2021 04:08:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5h-0006Pv-Fc; Tue, 13 Apr 2021 04:08:14 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKJ8H2l5fzlXcW;
 Tue, 13 Apr 2021 16:06:07 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:07:51 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
Date: Tue, 13 Apr 2021 16:07:41 +0800
Message-ID: <20210413080745.33004-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413080745.33004-1-wangyanan55@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: grngF+Zkj/8t

From: Andrew Jones <drjones@redhat.com>

Support device tree CPU topology descriptions.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f01d9041b..f4ae60ded9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
+    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     int smp_cpus = ms->smp.cpus;
 
     /*
-     * From Documentation/devicetree/bindings/arm/cpus.txt
+     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
      *  On ARM v8 64-bit systems value should be set to 2,
      *  that corresponds to the MPIDR_EL1 register size.
      *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
@@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
+            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
+                                  qemu_fdt_alloc_phandle(ms->fdt));
+        }
+
         g_free(nodename);
     }
+
+    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
+        /*
+         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
+         * In a SMP system, the hierarchy of CPUs is defined through four
+         * entities that are used to describe the layout of physical CPUs
+         * in the system: socket/cluster/core/thread.
+         */
+        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
+
+        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
+            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
+            char *map_path;
+
+            if (ms->smp.threads > 1) {
+                map_path = g_strdup_printf(
+                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
+                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
+                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
+                    "thread", cpu % ms->smp.threads);
+            } else {
+                map_path = g_strdup_printf(
+                    "/cpus/cpu-map/%s%d/%s%d",
+                    "socket", cpu / ms->smp.cores,
+                    "core", cpu % ms->smp.cores);
+            }
+            qemu_fdt_add_path(ms->fdt, map_path);
+            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
+            g_free(map_path);
+            g_free(cpu_path);
+        }
+    }
 }
 
 static void fdt_add_its_gic_node(VirtMachineState *vms)
@@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
     virt_machine_6_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     vmc->no_secure_gpio = true;
+    vmc->no_cpu_topology = true;
 }
 DEFINE_VIRT_MACHINE(5, 2)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..4a4b98e4a7 100644
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
2.19.1


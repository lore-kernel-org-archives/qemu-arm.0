Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2050512njb;
        Mon, 14 Oct 2024 12:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAjBQjfdtUjeATlYqIb6b+8CWzLzeMyZg668Gwf+S5nKu4OYzWuxvM8sDGYTsqBReUqjOV0/4GdpSnSw==@linaro.org
X-Google-Smtp-Source: AGHT+IHS4s46eFqRPz5MwQ2lSjEHpgCqXoX7AwNeYHk7fH2BnAVTckP3ndzUuf494NT51Hd8juhe
X-Received: by 2002:a05:600c:1e18:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-4311d710e52mr100661645e9.0.1728933788895;
        Mon, 14 Oct 2024 12:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728933788; cv=none;
        d=google.com; s=arc-20240605;
        b=QjvosFvO6IhANE8KjdpvecllUtrC8bAmFGPVZPRR4LP91okPq1LJCVLtdxzoAiftcJ
         MIWYGbYy32HitNB4vOz2W5fHsV1JoCjNrOGLRdeQRs5wDEpsHJa2FogffZAPmh4IoFwR
         wq3D8RmFFbvtIOVOc9jZc1EODixk+Di+Bh4IWqVq6Ju8owcK8GrOR7BWgwMLncNg0m+9
         wd6UUbTyseiIfuHubu0zJyj0uIVe5wEw4GyG3SeuwIu8aq15OEdBt5cGgKJjqAj52JrU
         iRP5v0yU3G8DzTOzK2Rwiu8TDkPTu/wrxojCqm5w2MSbTr+b4cTHG5HWA02phIKOfAqH
         VxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=lCquGcqSsG3HC7erbPLmk00BCQkLJ8wH+9SUNT1HTdA=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=TBglrBdaBnbPnZa+3yHzroct9h3QQq7qfIzSb4Dza1f1v6FXmnJibqvi1QLLJCSGxB
         APKN9AdUq1mYbEJEtLKAwVDMqjwa+B3h9621f/STpCmthFBMv0NsRfT/M/AbRrDjWZA7
         0pFBg39MkQ4PkwrcTjDu+9PDCZqTSSutN7MzH11FYLafbKv60/vHaitENFJUU7TVyCwd
         IzqtjUjDyHBzSG5MbQzRFMzygXCekJYY+p5kfKKtL7wBhZS5cH/jZQdHxa14+0jsCdWW
         PwCzh64SbYWRzrTFQ0Lb+AA6sS5a8KaAmk/dJGjcLF+TKqx1cNfroF1OPPJjRkBL1Ov0
         n3xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d4b9bb879si4901209f8f.778.2024.10.14.12.23.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XS6Z32bkzz6K5cs;
	Tue, 15 Oct 2024 03:22:35 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id D2919140C72;
	Tue, 15 Oct 2024 03:23:07 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 21:22:48 +0200
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
Subject: [PATCH V1 1/4] hw/acpi: Initialize ACPI Hotplug CPU Status with Support for vCPU `Persistence`
Date: Mon, 14 Oct 2024 20:22:02 +0100
Message-ID: <20241014192205.253479-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014192205.253479-1-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 5SO3TaYtnoxm

Certain CPU architecture specifications [1][2][3] prohibit changes to CPU
presence after the kernel has booted. This limitation exists because many system
initializations rely on the exact CPU count at boot time and do not expect it to
change later. For example, components like interrupt controllers, which are
closely tied to CPUs, or various per-CPU features, may not support configuration
changes once the kernel has been initialized. This presents a challenge for
virtualization features such as vCPU hotplug.

To address this issue, introduce an `is_enabled` state in the `AcpiCpuStatus`,
which reflects whether a vCPU has been hot-plugged or hot-unplugged in QEMU,
marking it as (un)available in the Guest Kernel. The `is_present` state should
be set based on the `acpi_persistent` flag. In cases where unplugged vCPUs need
to be deliberately simulated in the ACPI to maintain a persistent view of vCPUs,
this flag ensures the guest kernel continues to see those vCPUs.

Additionally, introduce an `acpi_persistent` property that can be used to
initialize the ACPI vCPU presence state accordingly. Architectures requiring
ACPI to expose a persistent view of vCPUs can override its default value. Refer
to the patch-set implelenting vCPU hotplug support for ARM for more details on
its usage.

References:
[1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
    architectures that don’t Support CPU Hotplug (like ARM64)
    a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
    b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
[2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
    SoC Based Systems (like ARM64)
    Link: https://kvmforum2020.sched.com/event/eE4m
[3] Check comment 5 in the bugzilla entry
    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 cpu-target.c          |  1 +
 hw/acpi/cpu.c         | 35 ++++++++++++++++++++++++++++++++++-
 include/hw/acpi/cpu.h | 21 +++++++++++++++++++++
 include/hw/core/cpu.h | 21 +++++++++++++++++++++
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/cpu-target.c b/cpu-target.c
index 499facf774..c8a29ab495 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -200,6 +200,7 @@ static Property cpu_common_props[] = {
      */
     DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_BOOL("acpi-persistent", CPUState, acpi_persistent, false),
 #endif
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 5cb60ca8bc..083c4010c2 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -225,7 +225,40 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     state->dev_count = id_list->len;
     state->devs = g_new0(typeof(*state->devs), state->dev_count);
     for (i = 0; i < id_list->len; i++) {
-        state->devs[i].cpu =  CPU(id_list->cpus[i].cpu);
+        struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
+        /*
+         * In most architectures, CPUs that are marked as ACPI 'present' are
+         * also ACPI 'enabled' by default. These states remain consistent at
+         * both the QOM and ACPI levels.
+         */
+        if (cpu) {
+            state->devs[i].is_enabled = true;
+            state->devs[i].is_present = true;
+            state->devs[i].cpu = cpu;
+        } else {
+            state->devs[i].is_enabled = false;
+            /*
+             * In some architectures, even 'unplugged' or 'disabled' QOM CPUs
+             * may be exposed as ACPI 'present.' This approach provides a
+             * persistent view of the vCPUs to the guest kernel. This could be
+             * due to an architectural constraint that requires every per-CPU
+             * component to be present at boot time, meaning the exact count of
+             * vCPUs must be known and cannot be altered after the kernel has
+             * booted. As a result, the vCPU states at the QOM and ACPI levels
+             * might become inconsistent. However, in such cases, the presence
+             * of vCPUs has been deliberately simulated at the ACPI level.
+             */
+            if (acpi_persistent_cpu(first_cpu)) {
+                state->devs[i].is_present = true;
+                /*
+                 * `CPUHotplugState::AcpiCpuStatus::cpu` becomes insignificant
+                 * in this case
+                 */
+            } else {
+                state->devs[i].is_present = false;
+                state->devs[i].cpu = cpu;
+            }
+        }
         state->devs[i].arch_id = id_list->cpus[i].arch_id;
     }
     memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 32654dc274..bd3f9973c9 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -26,6 +26,8 @@ typedef struct AcpiCpuStatus {
     uint64_t arch_id;
     bool is_inserting;
     bool is_removing;
+    bool is_present;
+    bool is_enabled;
     bool fw_remove;
     uint32_t ost_event;
     uint32_t ost_status;
@@ -75,4 +77,23 @@ extern const VMStateDescription vmstate_cpu_hotplug;
     VMSTATE_STRUCT(cpuhp, state, 1, \
                    vmstate_cpu_hotplug, CPUHotplugState)
 
+/**
+ * acpi_persistent_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vCPU state should always be reflected as *present* via ACPI
+ * to the Guest. By default, this is False on all architectures and has to be
+ * explicity set during initialization.
+ *
+ * Returns: True if it is ACPI 'persistent' CPU
+ *
+ */
+static inline bool acpi_persistent_cpu(CPUState *cpu)
+{
+    /*
+     * returns if 'Presence' of the vCPU is persistent and should be simulated
+     * via ACPI even after vCPUs have been unplugged in QOM
+     */
+    return cpu && cpu->acpi_persistent;
+}
 #endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 04e9ad4996..299e96c45b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -542,6 +542,27 @@ struct CPUState {
     CPUPluginState *plugin_state;
 #endif
 
+    /*
+     * To implement the vCPU hotplug feature (which simulates CPU hotplug
+     * behavior), we need to dynamically create and destroy QOM vCPU objects,
+     * and (de)associate them with pre-existing KVM vCPUs while (un)parking the
+     * KVM vCPU context. One challenge is ensuring that these dynamically
+     * appearing or disappearing QOM vCPU objects are accurately reflected
+     * through ACPI to the Guest Kernel. Due to architectural constraints,
+     * changing the number of vCPUs after the guest kernel has booted may not
+     * always be possible.
+     *
+     * In certain architectures, to provide the guest kernel with a *persistent*
+     * view of vCPU presence, even when the QOM does not have a corresponding
+     * vCPU object, ACPI may simulate the presence of vCPUs by marking them as
+     * ACPI-disabled. This is achieved by setting `_STA.PRES=True` and
+     * `_STA.Ena=False` for unplugged vCPUs in QEMU's QOM.
+     *
+     * By default, this flag is set to `FALSE`, and it must be explicitly set
+     * to `TRUE` for architectures like ARM.
+     */
+    bool acpi_persistent;
+
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
-- 
2.34.1

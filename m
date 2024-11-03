Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1489503njc;
        Sun, 3 Nov 2024 02:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWEqluBc6oiRvDbEeB/Fd+TU0jdoeAsyyfQeDaGpx4YOFAdCu1vO3oErZu9kPngrSKtUXKWOgRA87KEA==@linaro.org
X-Google-Smtp-Source: AGHT+IHOlM9jHEcYK1U15oIAwopSx4FcuspBvfft77aLsBISiSGKiYkDYkzWO2HI1Ne11JN3F6+b
X-Received: by 2002:a5d:6487:0:b0:37d:54d0:1f20 with SMTP id ffacd0b85a97d-381c7a4e17cmr7035440f8f.24.1730629546075;
        Sun, 03 Nov 2024 02:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730629546; cv=none;
        d=google.com; s=arc-20240605;
        b=F+KTrt/IxQTFw1GPE58mUEL0lIsM/igN6Ug3M9O1A8MYcRXI4Z9FuZ28P6ulmdjAP9
         WQJ+aG6W+tUwxCGXqIPrkL+l/Q+zn98P/VbXVraiu8RqIaR6Sr4pHZhg6cy00txP17Xb
         0Vi2maSaBebHoGo0a/bPZGVvumQ+006WQtQW/5E8FN3uUL1Zc1nUL1JGWbCFcdZehfv/
         i1eD3tvtLNtS0/ZU3DjkUb1H8+uV6Yd3LgyqJ1HnlX6UvnkH7LC/qiT+RhHRwFBGyfVA
         4JgSZYsbeDbkO8x5nOxw14QKalPoh3pqVcYfGs/yn/T/rH7/ZNz8pTRdLxB+gX30KAdt
         G6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WAKLr6Xe8L7POCW3jEVCqHDeXsUosEFvkZ5nrAL6PBA=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=bku/DZATtZzRYbSRMsuSy13o3al+ZDclJ6CGi0Fklm1gJ0Jz3rzIcBRUuUXit1QFMH
         nS1WZP/Z927OgWXu0+eMmtd9aP4dvNHlc81qyryMjncUbqMlezRlE9tpORWzNvRR7fnf
         4Q2nLoMWv3wdcpYWXzcgfe80UUb4ePAERlPBXHlBwaI+vkPdfi9UYLgzurklRc5MiPqX
         VFG90oH5irItAHsfMZvT/ZHVfJwqD8ofANGnI9xewksdQGVxdBdrXPZ0lbhTk4y4pwzz
         7Ac737/++vBAJN+oiovnj+VZXQSX97486S2azetvbruZpD8ZSkkVMQj88A96g4BJZ54u
         teyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c11fa29dsi4847517f8f.1070.2024.11.03.02.25.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2024 02:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xh9fM5ZkGz6K6JX;
	Sun,  3 Nov 2024 18:23:07 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A8D0140C98;
	Sun,  3 Nov 2024 18:25:45 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.154.43) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 11:25:26 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH V3 1/5] hw/acpi: Make CPUs ACPI `presence` conditional during vCPU hot-unplug
Date: Sun, 3 Nov 2024 10:24:15 +0000
Message-ID: <20241103102419.202225-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241103102419.202225-1-salil.mehta@huawei.com>
References: <20241103102419.202225-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.154.43]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 6mOULsWwN2AL

On most architectures, during vCPU hot-plug and hot-unplug actions, the
firmware or VMM/QEMU can update the OS on vCPU status by toggling the
ACPI method `_STA.Present` bit. However, certain CPU architectures
prohibit [1] modifications to a CPU’s `presence` status after the kernel
has booted.

This limitation [2][3] exists because many per-CPU components, such as
interrupt controllers and various per-CPU features tightly integrated
with CPUs, may not support reconfiguration once the kernel is
initialized. Often, these components cannot be powered down, as they may
belong to an `always-on` power domain. As a result, some architectures
require all CPUs to remain `_STA.Present` after system initialization.

Therefore, it is essential to mirror the exact QOM vCPU status through
ACPI for the Guest kernel. For this, we should determine—via
architecture-specific code[4]—whether vCPUs must always remain present
and whether the associated `AcpiCpuStatus::cpu` object should remain
valid, even following a vCPU hot-unplug operation.

References:
[1] Check comment 5 in the bugzilla entry
    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
[2] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
    architectures that don’t Support CPU Hotplug (like ARM64)
    a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
    b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
[3] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
    SoC Based Systems (like ARM64)
    Link: https://kvmforum2020.sched.com/event/eE4m
[4] Example implementation of architecture-specific CPU persistence hook
    Link: https://github.com/salil-mehta/qemu/commit/c0b416b11e5af6505e558866f0eb6c9f3709173e

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c         | 15 ++++++++++++++-
 include/hw/core/cpu.h |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 5cb60ca8bc..9b03b4292e 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -233,6 +233,17 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     memory_region_add_subregion(as, base_addr, &state->ctrl_reg);
 }
 
+static bool should_remain_acpi_present(DeviceState *dev)
+{
+    CPUClass *k = CPU_GET_CLASS(dev);
+    /*
+     * A system may contain CPUs that are always present on one die, NUMA node,
+     * or socket, yet may be non-present on another simultaneously. Check from
+     * architecture specific code.
+     */
+    return k->cpu_persistent_status && k->cpu_persistent_status(CPU(dev));
+}
+
 static AcpiCpuStatus *get_cpu_status(CPUHotplugState *cpu_st, DeviceState *dev)
 {
     CPUClass *k = CPU_GET_CLASS(dev);
@@ -289,7 +300,9 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
         return;
     }
 
-    cdev->cpu = NULL;
+    if (!should_remain_acpi_present(dev)) {
+        cdev->cpu = NULL;
+    }
 }
 
 static const VMStateDescription vmstate_cpuhp_sts = {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c3ca0babcb..e7de77dc6d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -158,6 +158,7 @@ struct CPUClass {
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     void (*query_cpu_fast)(CPUState *cpu, CpuInfoFast *value);
     int64_t (*get_arch_id)(CPUState *cpu);
+    bool (*cpu_persistent_status)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     vaddr (*get_pc)(CPUState *cpu);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
-- 
2.34.1

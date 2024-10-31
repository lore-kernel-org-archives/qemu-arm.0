Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3038njc;
        Thu, 31 Oct 2024 13:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWy8HVBGcKTgYR/T54FCwBZ41Qu1m8j7S040X7axody6YhcIgEjlOTiD6J3gVeaPQ9sUgzttQU13Betlw==@linaro.org
X-Google-Smtp-Source: AGHT+IHVx+5xLx//2Iazsn1867dOPzFF+Q5G/A36d4P437m+062toe1HHSEUan2mm1o3o8rHo0N4
X-Received: by 2002:a05:6000:e88:b0:374:c847:852 with SMTP id ffacd0b85a97d-3806115ac8fmr15511331f8f.29.1730405168725;
        Thu, 31 Oct 2024 13:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730405168; cv=none;
        d=google.com; s=arc-20240605;
        b=WNZBCxXm1N7bWITTVPaciZZcQoXq44+45/jarCbK4BItEcqsg019HSr1gPcitt0uKL
         wp9fHqYTgey3Mu86xnsOmDkKBoWrU3S70YqOob0YDo07mC4yttn0XHCkDl7KHinR7fxm
         uU38ZNyrWC/xPAxRjlsYUVle4ZS7YH4gA6ERrFaHb0n8EFeLARLBJEWO3vA3Kc9rNlw+
         GyjkB2XgqCObWsNXtnyn/u8UkXv5w9FK3urK0+PSlUpVt6VHMJp0nHyXD8U9/nhtqXaw
         dTJZ3BBidhi8fc4mBDvlPxzSyVMXE7iRbbtmzQfSQZufOWhHaRnTg720sk2ZzWlHYTQS
         2TeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=xrN6wuDIzmS+lqPguoKfyWH10F0WTVDqLIckws702rQ=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=D4Th5G9yddnh1/i3ydJWKjrhpKek0L2Ly6qZtYFraOe/CTqESrwSiAQ01T8xD7Xypp
         flnG4QFFQpNLEHbCemPaIbpP+zP9NdsnGlE9+sPlNmLNg1VogfoM85pZ3zblnq8Vrv+8
         Pw+cFBSEyQ1LrZWFNXQA0sAJDD2N+L6p9bi+ToKAH08+jzUzcs4s4y7ieaIKIo1iemhl
         kz/jIH/qr4RLbLoERV9/Yb+/E9fCkWPVZvDzTyrh2e30g1NRGruDV/AkR9SuR0Vwdptp
         UecviVLs1DvgTh3BpQWWfV2NvFaM/VoFu1pyZFi6EQdEyA+NgApocX8o11/vkC0aGEKN
         EURA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c11d9b4csi1466970f8f.957.2024.10.31.13.06.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XfZhs6PBpz6JBf6;
	Fri,  1 Nov 2024 04:04:45 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id B2E181400D3;
	Fri,  1 Nov 2024 04:06:07 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.152.207) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 21:05:48 +0100
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
Subject: [PATCH V2 1/6] hw/acpi: Introduce `is_enabled` state in ACPI CPU Hotplug Status
Date: Thu, 31 Oct 2024 20:04:57 +0000
Message-ID: <20241031200502.3869-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031200502.3869-1-salil.mehta@huawei.com>
References: <20241031200502.3869-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.152.207]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: NxsAM+whs41T

On most architectures, during vCPU hot-plug and hot-unplug actions,
firmware or the VMM/QEMU can convey vCPU status to the OS by
toggling the ACPI method `_STA.Present` Bit. However, certain CPU
architecture specifications prohibit [1] modifications to CPU's
`presence` after the kernel has booted.

This limitation [2][3] arises because many per-CPU components, such as
interrupt controllers that are closely integrated with CPUs, or other
per-CPU features, may not support reconfiguration once the kernel is
initialized. These components often cannot be powered down as they might
belong to an `always-on` power domain. Consequently, specifications
require all CPUs to remain `_STA.Present` after system initialization.

To address this issue from an ACPI perspective, an `is_enabled` state has
been introduced in the `AcpiCpuStatus`. This state reflects whether a vCPU
has been hot-plugged or hot-unplugged in QEMU, thus indicating its
availability to the guest kernel. The guest can evaluate this status by
calling the ACPI `_STA` method and checking the `_STA.Enabled` bit after
QEMU signals the hot-plug event via GED.

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

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/acpi/cpu.c         | 9 ++++++++-
 include/hw/acpi/cpu.h | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 5cb60ca8bc..238a0edbc1 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -225,7 +225,14 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     state->dev_count = id_list->len;
     state->devs = g_new0(typeof(*state->devs), state->dev_count);
     for (i = 0; i < id_list->len; i++) {
-        state->devs[i].cpu =  CPU(id_list->cpus[i].cpu);
+        struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
+
+        state->devs[i].cpu = cpu;
+        if (cpu && DEVICE(cpu)->realized) {
+            state->devs[i].is_enabled = true;
+        } else {
+            state->devs[i].is_enabled = false;
+        }
         state->devs[i].arch_id = id_list->cpus[i].arch_id;
     }
     memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 32654dc274..ff49caa501 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -26,6 +26,7 @@ typedef struct AcpiCpuStatus {
     uint64_t arch_id;
     bool is_inserting;
     bool is_removing;
+    bool is_enabled;
     bool fw_remove;
     uint32_t ost_event;
     uint32_t ost_status;
@@ -74,5 +75,4 @@ extern const VMStateDescription vmstate_cpu_hotplug;
 #define VMSTATE_CPU_HOTPLUG(cpuhp, state) \
     VMSTATE_STRUCT(cpuhp, state, 1, \
                    vmstate_cpu_hotplug, CPUHotplugState)
-
 #endif
-- 
2.34.1

Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2338687njb;
        Tue, 15 Oct 2024 03:05:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkqStWJ0mDINyx0hbdNPXhtmdvum5BWdniOHF5xWoB79DYAtXJWPxTHifXHr/UTKfkFGFdDBT8oxyboQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE+xmNIjUWS7/ij1lKorZLMx2eCU74QqbKbSQtHQfC4skRZfxSxkc6KlCZfK7idl0FE68Xm
X-Received: by 2002:adf:fe12:0:b0:374:c059:f2c5 with SMTP id ffacd0b85a97d-37d5519e149mr8965032f8f.22.1728986705616;
        Tue, 15 Oct 2024 03:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986705; cv=none;
        d=google.com; s=arc-20240605;
        b=H4de5UieqtnYX2VUMhJ5gsoVpiQexE8YQsdfocy7608TOqJnpT9yms1CPbdbPAxOBn
         NnebRbziI8J+4DB6HlMCoOP8QTMu8slQwTG1U58oypHnGjHXUaus8b2Pg7zW2SewpBfT
         6seerjr3SICLtfF8paEBEjHqYiho2sU93oki+9k6hW3z62vO8x3DkVWum6KLY04n2ha/
         xrqER9w9F7sgc7rrpfCwnpr4jR1B3XTaHWdyWVMp/HSo0YLbAd6fGU4umlp8A0/tFBof
         uIExB3npsABEcVLRxmvEW808iyE32KlGoPook0Tk91kKkz9haxLXDXIxz5BJw7YHJ6C7
         S4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=lROFHgg8pZMyGzZnrwb9XGRgiUoNEdtB3uHF8m/DO1Q=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=cd6guBB5isvDl2iRg0OZNH2oRXOOhBCpTXCr3jZIbqTPEAM5MOfPGWMcI+aDIINWw2
         EuO5KGdbOg83FVNkZJOSKYa1E1X5VCYZe+PgyK6qrPQowVEbZ0WiEKXyidy4hAsXDCHI
         R5r8n4EhqnS0UyrcRxwo9o/l1oElMbohHMt8a0nQ20PrAgiRmxVwKrlTIzd/wGeIWAhh
         nqwD0EZ60AD8clXoINULJkneEBRbHidGqi/Ouc0xsHcRttHCZI33fXzAg+5g8YPi/Mva
         X1UhmdRy0ogaT3GqXR0uQPjDjjXedV2lu67GeL/HeOW0nyolTpRDML3N3YtGNAmqsyix
         2cEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fbee053si537287f8f.127.2024.10.15.03.05.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV380b50z6DB4H;
	Tue, 15 Oct 2024 18:00:36 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 66461140519;
	Tue, 15 Oct 2024 18:05:04 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:04:44 +0200
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
Subject: [PATCH RFC V5 12/30] arm/virt: Release objects for *disabled* possible vCPUs after init
Date: Tue, 15 Oct 2024 10:59:54 +0100
Message-ID: <20241015100012.254223-13-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: MytQbtsjViQj

During `machvirt_init()`, QOM ARMCPU objects are pre-created along with the
corresponding KVM vCPUs in the host for all possible vCPUs. This is necessary
due to the architectural constraint that KVM restricts the deferred creation of
KVM vCPUs and VGIC initialization/sizing after VM initialization. Hence, VGIC is
pre-sized with possible vCPUs.

After the initialization of the machine is complete, the disabled possible KVM
vCPUs are parked in the per-virt-machine list "kvm_parked_vcpus," and we release
the QOM ARMCPU objects for the disabled vCPUs. These will be re-created when the
vCPU is hotplugged again. The QOM ARMCPU object is then re-attached to the
corresponding parked KVM vCPU.

Alternatively, we could have chosen not to release the QOM CPU objects and kept
reusing them. This approach might require some modifications to the
`qdevice_add()` interface to retrieve the old ARMCPU object instead of creating
a new one for the hotplug request.

Each of these approaches has its own pros and cons. This prototype uses the
first approach (suggestions are welcome!).

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6ac2d8826e..7cbc212130 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2037,6 +2037,7 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
     CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
     int max_cpus = MACHINE(vms)->smp.max_cpus;
+    int smp_cpus = MACHINE(vms)->smp.cpus;
     bool aarch64, steal_time;
     CPUState *cpu;
 
@@ -2095,6 +2096,30 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
             }
         }
     }
+
+    if (kvm_enabled() || tcg_enabled()) {
+        int i = 0;
+        CPU_FOREACH_POSSIBLE(cpu, possible_cpus) {
+            /*
+             * Release the disabled ARMCPU objects that were previously used
+             * during initialization for pre-sizing host KVM.
+             *
+             * We simulate the presence of these non-existent vCPUs to the guest
+             * via ACPI by setting `_STA.PRES = 1` (indicating they are present)
+             * and mark them as disabled vCPUs by setting `_STA.ENA = 0`,
+             * ensuring they cannot be used. These vCPUs can be added back to
+             * the guest later through hotplug operations when ARMCPU objects
+             * are recreated using the '-device_add' QMP command.
+             */
+            if (i >= smp_cpus) {
+                CPUArchId *cpu_slot;
+                cpu_slot = virt_find_cpu_slot(cpu);
+                cpu_slot->cpu = NULL;
+                object_unref(OBJECT(cpu));
+            }
+            i++;
+        }
+    }
 }
 
 static void virt_cpu_set_properties(Object *cpuobj, const CPUArchId *cpu_slot,
-- 
2.34.1

Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp983579ejc;
        Tue, 26 Sep 2023 03:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpfZolG7yrGXmPWqgleFFwzIsAL6ZQv1DH4Gw1dWEoin1isqj1Chi+tTJpO1kArai29qJM
X-Received: by 2002:a05:600c:2215:b0:405:1baf:cedd with SMTP id z21-20020a05600c221500b004051bafceddmr7612711wml.1.1695723154603;
        Tue, 26 Sep 2023 03:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723154; cv=none;
        d=google.com; s=arc-20160816;
        b=mEEFj/RWsViTsoRJpFBJ/hFkT5Vyq57rx42Df/q8AgcctHrI8qbu5fqojNTUBkHuK6
         FnH2wkKEqd2rCA+SwSd0oSFBQwkTT+vRVnaw9uMlFD79bhDPcOXO1hYwRfEyOq8ZPPc0
         KSfjzUTfm/8xU3JdgAt8AYajLzYRiFRc2rdse8qX/hWG4t6qh00XcdS6oILJEMZxpLRh
         4RxBOS9PkLK6yGhWwSpCHcX3uQCUgv34iV2GeLkQJ3dBwAy7k9f5agsKUwkXnPVbGyYb
         030UQ7gwvjsNvO25/cKZ5FMyKH0jP4evO3LUf+MN1Qcgpxiw/LVzqw2rORs9v3VL6v6C
         HNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=bVUEqOu1zVKbnuEbFdC4jngSSz7pkzzrlBrQqeCSeLg=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=CdTmYGgBX9lNJK4QvB0xnis6BgLa6m77jpVebaJUgl9NbtJgQmBncr62s3XkE6x6jb
         w2DI7Lx4qKFtyWjiCGwTx4XrMqO8E8/89/Fevaxed7iaC59g8euaTEP/QkiuvygYt8IS
         nGUQcy0R4b/9y+mOf/5+hzFfzYA7W0q2vj2vvTP/CYa6XAeaXZ6bAsvESTtFCNDD/uLM
         g01Zi3RDDLZYt2vdmC0zp6NJYlPjP231N89nN9yx6S9mIef/2luGgDgY9ht6E7EcXEzz
         NzQy2p6o5wytsKF+dBWlZVI9yB1vUsZMSCJZvJrzL8rMI7oYaPhaz7LMcyWZ5icXaUrt
         H2BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o30-20020a05600c511e00b0040547fd0c00si4591125wms.228.2023.09.26.03.12.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwWC531Fz6K6h7;
	Tue, 26 Sep 2023 18:11:19 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:12:15 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 23/37] arm/virt: Release objects for *disabled* possible vCPUs after init
Date: Tue, 26 Sep 2023 11:04:22 +0100
Message-ID: <20230926100436.28284-24-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: r6LN/ykccyb+

During machvirt_init(), QOM ARMCPU objects are also pre-created along with the
corresponding KVM vCPUs in the host for all possible vCPUs. This necessary
because of the architectural constraint, KVM restricts the deferred creation of
the KVM vCPUs and VGIC initialization/sizing after VM init. Hence, VGIC is
pre-sized with possible vCPUs.

After initialization of the machine is complete disabled possible KVM vCPUs are
then parked at the per-virt-machine list "kvm_parked_vcpus" and we release the
QOM ARMCPU objects for the disabled vCPUs. These shall be re-created at the time
when vCPU is hotplugged again. QOM ARMCPU object is then re-attached with
corresponding parked KVM vCPU.

Alternatively, we could've never released the QOM CPU objects and kept on
reusing. This approach might require some modifications of qdevice_add()
interface to get old ARMCPU object instead of creating a new one for the hotplug
request.

Each of the above approaches come with their own pros and cons. This prototype
uses the 1st approach.(suggestions are welcome!)

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f1bee569d5..3b068534a8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1965,6 +1965,7 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
     CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
     int max_cpus = MACHINE(vms)->smp.max_cpus;
+    MachineState *ms = MACHINE(vms);
     bool aarch64, steal_time;
     CPUState *cpu;
     int n;
@@ -2025,6 +2026,37 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
             }
         }
     }
+
+    if (kvm_enabled() || tcg_enabled()) {
+        for (n = 0; n < possible_cpus->len; n++) {
+            cpu = qemu_get_possible_cpu(n);
+
+            /*
+             * Now, GIC has been sized with possible CPUs and we dont require
+             * disabled vCPU objects to be represented in the QOM. Release the
+             * disabled ARMCPU objects earlier used during init for pre-sizing.
+             *
+             * We fake to the guest through ACPI about the presence(_STA.PRES=1)
+             * of these non-existent vCPUs at VMM/qemu and present these as
+             * disabled vCPUs(_STA.ENA=0) so that they cant be used. These vCPUs
+             * can be later added to the guest through hotplug exchanges when
+             * ARMCPU objects are created back again using 'device_add' QMP
+             * command.
+             */
+            /*
+             * RFC: Question: Other approach could've been to keep them forever
+             * and release it only once when qemu exits as part of finalize or
+             * when new vCPU is hotplugged. In the later old could be released
+             * for the newly created object for the same vCPU?
+             */
+            if (!qemu_enabled_cpu(cpu)) {
+                CPUArchId *cpu_slot;
+                cpu_slot = virt_find_cpu_slot(ms, cpu->cpu_index);
+                cpu_slot->cpu = NULL;
+                object_unref(OBJECT(cpu));
+            }
+        }
+    }
 }
 
 static void virt_cpu_set_properties(Object *cpuobj, const CPUArchId *cpu_slot,
-- 
2.34.1

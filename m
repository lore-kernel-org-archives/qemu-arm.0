Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp98447ejr;
        Thu, 13 Jun 2024 16:44:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULCksGJk47riBUM22+nl+WY+uiRtBl326us461EtDfHqmKWeXi5E7XJCnpCb6DhmEW9vzw7zCG8swJ+2nzS27wiqkK2SVM
X-Google-Smtp-Source: AGHT+IE0OPpLcLTpvaBjmZzyC5sHeGMw4CylkTjUPnmYr6+vbCyhLBMVDm2f16TvYDYD4k9nnGcH
X-Received: by 2002:a17:902:ebc4:b0:1f6:62cb:7c22 with SMTP id d9443c01a7336-1f862a16ba4mr13640205ad.46.1718322264298;
        Thu, 13 Jun 2024 16:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322264; cv=none;
        d=google.com; s=arc-20160816;
        b=DKseJrjTn97zp0dlR2TNggyD/Qtwmhrf5hK3NkevH/jtkxOk3M5aM0i7jZ4Td9zOYF
         eAeHJ24TvJXKmGEbwpItAUqmp5NIauZfmNZlRQE1gtqZ51hNgDAQlPNEYpQYzkq81luX
         22EdN2BATvlWUe4uzoJP8hHc7oXL9QoOCNMBoKrIHxT2NmmnrRfpi6TDD+JaXFjQMTXL
         CgQaFa6v3PQDHLWHtocQjnE8eu+bYv+YLDiETACclc8RBn5JYSwyVVoCWbA8MXVN+Tjj
         V6+58Ryz/3n9Wl7LnFC4ZpgvMbSMLsUEVVP5P2ooXRI7cJPlFW2Ao22krXuIk1Ison4/
         liJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=lvZasbpUGjAOM6smOylcyfv2/qqRdwFfYntDWubUJe8=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=ti7n5A2JpxD6JhgKlRzLR33eoGKOW5FbE7ojMc5Kjfxp2xbasr9Ba0tTxrFQ4bE3Vk
         vXb8AZLQuNXW3/fVrxzzql808Xan81wFqdrfyeyUi+1HkVvRLNVgMbIdHSjEI2sZxQ1I
         JhIvCCqK1XXohQ1uiAz/pEduuTAz1ehwJRg0qGxwt02Qlm1TE5ec01FsROvg8nF0pH0s
         h2DTvLcf2sgmQMDAWfH5Y3+twhphBa6rBq7qMBl3vfNLyXNQue1b0t79T/fBzL3oPom1
         Nu8I/flV+wnRfFUeGCNdXccpTzsGuDZ01Coi38wPe03+uHACYHY/G6Tp/FC+kPg5DE9v
         TmLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1f855f02617si21870625ad.520.2024.06.13.16.44.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:44:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0fBm4qtcz6K6QZ;
	Fri, 14 Jun 2024 07:44:16 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 871461400D9;
	Fri, 14 Jun 2024 07:44:19 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:43:57 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 17/29] arm/virt: Release objects for *disabled* possible vCPUs after init
Date: Fri, 14 Jun 2024 00:36:27 +0100
Message-ID: <20240613233639.202896-18-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: wkpAanpGN1Wk

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
 hw/arm/virt.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9d33f30a6a..a72cd3b20d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2050,6 +2050,7 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
     CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
     int max_cpus = MACHINE(vms)->smp.max_cpus;
+    MachineState *ms = MACHINE(vms);
     bool aarch64, steal_time;
     CPUState *cpu;
     int n;
@@ -2111,6 +2112,37 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
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

Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595968njl;
        Tue, 8 Oct 2024 20:24:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4nx+0jm9qd1dF6vol3Yj3RuVswxhHANLTl07UAjhkw+p6BKucPK8+Kvuy9zTV2Btc24rjvGqFVWBO5w==@linaro.org
X-Google-Smtp-Source: AGHT+IE8X9wZdRwyE1RxDQD6veLHbBxye05imCY3VSj6wpdxmOtYh8zyDVKpfLC78SgUM94gu0tr
X-Received: by 2002:a17:902:e884:b0:20b:632d:27b7 with SMTP id d9443c01a7336-20c63751631mr20310745ad.33.1728444255322;
        Tue, 08 Oct 2024 20:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444255; cv=none;
        d=google.com; s=arc-20240605;
        b=cvRqOj92qNFx8/qXDtPsh4N+Zzml7ym87/6FywcBiW+sBSK9oD9RHEf0aYgLrYooHG
         jS1NXSPqCnkoze0AKw7DV6yAcIbD7mquApOEdgaSme8PlWV75pdIKXn0BYyz+8C9Z65d
         z7LWQ0jdXjqB9qUgyCBYSMieyOMZaLBqVPXNLxi+1Fw/KGbYL6ktX0SgaEvp5j2pzrla
         iTtgl4YW5zcffgfH1KN/3UpiRvNZ1lBVUGOwZUWDV+EuwC2aX6BTM9KBADFDkUm+urrW
         6ezQYtD5tObMi0BRAldqQVD/hna/4O+JGaUGBIZV/C2JAtn/UVzGDwHDJUaGfQiKit2d
         F+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=M4lDxnqSgDn1d6Qgt86bFZMydN5S7eVukH155mUVXUk=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=H2hzpBHhk+tFPpVdEE2c3s2WaDSOSVJ74WFRaQ1HEtid105L1tor094xj3RCeJoBJb
         xeo9VXF24Cb7z5Xxl4S1QRutXQ07Oqkay9t0MvphOUIQDYPOyY3MO04BhGVyxmcru9g6
         VKo5EI16eeAc9MyBICBkGDOGQ2NTAMHsyvZONBRzdenHfogl4/8OK/rbnqvEYXaQrDIf
         nPqUsyjnRFgLgquR28HhqKTRVzZtulQAjAkr8kIuyJ13hxM6I6xuR8yQc9v/+o935IU8
         ISFmsrBM5aHa77i0akdKHoPp151vnqOMl/O9Y+sJw9Aob0QjCCGupQGZrEM1LDF9o3Wz
         xVMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-20c6b3b7e95si3807835ad.121.2024.10.08.20.24.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdXC1hzLz6K98h;
	Wed,  9 Oct 2024 11:23:55 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id DA53A140447;
	Wed,  9 Oct 2024 11:24:11 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:23:52 +0200
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
Subject: [PATCH RFC V4 14/33] arm/virt: Release objects for *disabled* possible vCPUs after init
Date: Wed, 9 Oct 2024 04:17:56 +0100
Message-ID: <20241009031815.250096-15-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: zkGfblORr0MV

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
 hw/arm/virt.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 696e0a9f75..d8cae70ab2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2093,6 +2093,36 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
             }
         }
     }
+
+    if (kvm_enabled() || tcg_enabled()) {
+        CPU_FOREACH_POSSIBLE(cpu, possible_cpus) {
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
+             * for the newly created object for the same vCPU or just reuse the
+             * old QOM vCPU object?
+             */
+            if (!qemu_enabled_cpu(cpu)) {
+                CPUArchId *cpu_slot;
+                cpu_slot = virt_find_cpu_slot(cpu);
+                cpu_slot->cpu = NULL;
+                object_unref(OBJECT(cpu));
+            }
+        }
+    }
 }
 
 static void virt_cpu_set_properties(Object *cpuobj, const CPUArchId *cpu_slot,
-- 
2.34.1

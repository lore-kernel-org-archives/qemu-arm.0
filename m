Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp96795ejr;
        Thu, 13 Jun 2024 16:39:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUK19kYrBZ8RKkGXAfFTAqYMClmU4C24UhUpZR9Oi5jdT8/YhzZiarkcCF7hMzA3TJwJCFYvG1YlF21jTjolkOaGabpmFGQ
X-Google-Smtp-Source: AGHT+IEwhNOf/zUhrPLsl3mLcIUF96PEJPlI8Zv5YxKg2/POOZD696C6Kzx/3dtTJlUv7mzyQsAG
X-Received: by 2002:a05:600c:1e20:b0:421:dd8c:3588 with SMTP id 5b1f17b1804b1-4230482c204mr8382425e9.21.1718321943514;
        Thu, 13 Jun 2024 16:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718321943; cv=none;
        d=google.com; s=arc-20160816;
        b=ccnYEWIIda1bHQrM5rTbrFLb9DUQ5oF9DQ/KxTxujdLgQ9wt2W8XF9TsptNt5D2BL+
         SOOpq8kLGlk4qQePIj6Kn76P04hbi67I4tx2qxjtklTL4BMgLt7C27qii3QPzGUXTH9T
         y/Nbx4G7fLveT05g6d9Oj0MgHEHvIYSzXf1fO7VWMfJh8lDceX9HdKrxCutvyydTJDZF
         wr4vSXH68RfoheFln58Lth0zRl3GjFlnL57ru0Cdrl/qGv2P76+Rt+/YROvxjjuULuhS
         GYQi6qaaCYjSKDKCgBJpUw3ztF0AyylY5+acLJfqtvsXPrcYfrB6IeVuR8/P7g+Ztv1s
         bGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=sRRdk5qM5/sMuXTuBO8hZ6vO9i/5KHcMwVDZ8orJubg=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=C8L3BG0snImSNq9vn6Eha4xO8OeLHUxjQ9pOawX2voreRsmmzWGlC4Eyjw2KmV1GGT
         Zc7cR7aHm+cr2iBbCv49r1P5zKECy5drtdZa5bddjRuE6gVXxk4fqyRvF+Gy9aq5EQlx
         DcM85khQODU1Zmv2zMyUsEEzV2HxVpelj7xBFz0GtlsCHy79yJ9rgZkY5jts4WsCDWkq
         UD/mL8dsJEr0ws/lonvFOUpPFAJcFZXairuzg6WVfjpfihLo6vDuLHaPY5H4hYkBhqej
         yz42SNe5ni0OZ654sm775wLcDnu0DsFTTG2bdwba+TWKdQDLQb22po2AKPLG2x2fIMvp
         5jlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36075131224si1410540f8f.912.2024.06.13.16.39.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0dzJ075Cz6HJTn;
	Fri, 14 Jun 2024 07:34:20 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 526FF140B63;
	Fri, 14 Jun 2024 07:39:02 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:38:39 +0100
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
Subject: [PATCH RFC V3 03/29] hw/arm/virt: Limit number of possible vCPUs for unsupported Accel or GIC Type
Date: Fri, 14 Jun 2024 00:36:13 +0100
Message-ID: <20240613233639.202896-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: NOWrA29pw5v5

If Virtual CPU Hotplug support does not exist on a particular Accel platform or
ARM GIC version, we should limit the possible vCPUs to those available during
boot time (i.e SMP CPUs) and explicitly disable Virtual CPU Hotplug support.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 66 +++++++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 11fc7fc318..3e1c4d2d2f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2082,8 +2082,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    possible_cpus = mc->possible_cpu_arch_ids(machine);
-
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
      * to create a VM with the right number of IPA bits.
@@ -2098,7 +2096,7 @@ static void machvirt_init(MachineState *machine)
          * we are about to deal with. Once this is done, get rid of
          * the object.
          */
-        cpuobj = object_new(possible_cpus->cpus[0].type);
+        cpuobj = object_new(machine->cpu_type);
         armcpu = ARM_CPU(cpuobj);
 
         pa_bits = arm_pamax(armcpu);
@@ -2113,6 +2111,43 @@ static void machvirt_init(MachineState *machine)
      */
     finalize_gic_version(vms);
 
+    /*
+     * The maximum number of CPUs depends on the GIC version, or on how
+     * many redistributors we can fit into the memory map (which in turn
+     * depends on whether this is a GICv3 or v4).
+     */
+    if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        virt_max_cpus = GIC_NCPU;
+    } else {
+        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
+        if (vms->highmem_redists) {
+            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        }
+    }
+
+    if (tcg_enabled() || hvf_enabled() || qtest_enabled() ||
+        (vms->gic_version < VIRT_GIC_VERSION_3)) {
+        max_cpus = machine->smp.max_cpus = smp_cpus;
+        mc->has_hotpluggable_cpus = false;
+        if (vms->gic_version >= VIRT_GIC_VERSION_3) {
+            warn_report("cpu hotplug feature has been disabled");
+        }
+    }
+
+    if (max_cpus > virt_max_cpus) {
+        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
+                     "supported by machine 'mach-virt' (%d)",
+                     max_cpus, virt_max_cpus);
+        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
+            error_printf("Try 'highmem-redists=on' for more CPUs\n");
+        }
+
+        exit(1);
+    }
+
+    /* uses smp.max_cpus to initialize all possible vCPUs */
+    possible_cpus = mc->possible_cpu_arch_ids(machine);
+
     if (vms->secure) {
         /*
          * The Secure view of the world is the same as the NonSecure,
@@ -2147,31 +2182,6 @@ static void machvirt_init(MachineState *machine)
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
     }
 
-    /*
-     * The maximum number of CPUs depends on the GIC version, or on how
-     * many redistributors we can fit into the memory map (which in turn
-     * depends on whether this is a GICv3 or v4).
-     */
-    if (vms->gic_version == VIRT_GIC_VERSION_2) {
-        virt_max_cpus = GIC_NCPU;
-    } else {
-        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
-        if (vms->highmem_redists) {
-            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
-        }
-    }
-
-    if (max_cpus > virt_max_cpus) {
-        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
-                     "supported by machine 'mach-virt' (%d)",
-                     max_cpus, virt_max_cpus);
-        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
-            error_printf("Try 'highmem-redists=on' for more CPUs\n");
-        }
-
-        exit(1);
-    }
-
     if (vms->secure && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Security extensions (TrustZone) to the guest CPU",
-- 
2.34.1

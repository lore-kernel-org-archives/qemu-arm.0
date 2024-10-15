Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2336775njb;
        Tue, 15 Oct 2024 03:01:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx2YHew+jZax3CvyjTK0D9t0K0bvCGReUKkkQOxg0bMuNSC0/GIOzU6faG19aWEuYFbo2ABixp81lR5g==@linaro.org
X-Google-Smtp-Source: AGHT+IFqjXMp6rzHf85MiXIbCBnDGaoc4zLLSXW04svcUVwnWy8u/M9tUv2XqViFxYgr6w6HI0YD
X-Received: by 2002:adf:f64f:0:b0:37d:49cc:cadc with SMTP id ffacd0b85a97d-37d551fc4e0mr8546454f8f.32.1728986504980;
        Tue, 15 Oct 2024 03:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986504; cv=none;
        d=google.com; s=arc-20240605;
        b=GXMX6q56E8rEZ7WufWgfcA24207NRInaE0uuwKsRe/7VldghVxlXW3Ucaj7svITaE2
         Ts8Er/IGbjEMTNkIBjmDa44++zyQv5Jg6B+SmjZZhMKPCDRPeyLb5V2Lef/ByvWk9keb
         SOjpZgUkL39zfI937FebNojptGEPCoD/01ZFX9xy4gingvEHL1hwHvJNRzpzvImQ/Hyj
         +1gkDjJ+C19e73ECfnA7lt6Z06cGehaEh/f2hcHdnTpwLBQpjSKWmrjruFAme3+Pm2FO
         avcatcpCiNDbE20JlMWuRblc+aTfCcejwCvO5uoorGwswCXdApcw30imELpvnyimwiGk
         uVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=U8nR+ykEVBDJZLQoHFo/gujDBMc56voDxKMiH4yQBm0=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=eqygTbJR7uFHvVC9X7Ai4N83b8wZrJlcoiLVt4JQNgZT+nkO/ZNxWFhv/DJI/n8P4j
         m5W5ZwnETcdpk7mtJ5kF4BBypLmxiu4Y25x9z+2yV/2dYOcOJX4V5b01XHNVdWhhaBPf
         y7OmVU5KgvGuwewOqOo7ida/UowH6N45KAzXp9mRTokkHVu5HWE4+hxDb0dNfS9KJHnd
         22iyaWz3mh83R9gwALnVz6mfBcvJwD1hfb+xGUUhBY9Q9arQCDd7fxRNtyhjEAZbmqSM
         EXGuZ8VRwDnn1RGo0k3wkj/H6tlXf44NlGXYDgU+e4YCc7kzQkaW9vUuSDx8NXe8Zn0x
         KS4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fcb63d1si529167f8f.543.2024.10.15.03.01.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV3n57Yzz6K98d;
	Tue, 15 Oct 2024 18:01:09 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id D298A140CF4;
	Tue, 15 Oct 2024 18:01:43 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:01:24 +0200
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
Subject: [PATCH RFC V5 02/30] hw/arm/virt: Disable vCPU hotplug for *unsupported* Accel or GIC Type
Date: Tue, 15 Oct 2024 10:59:44 +0100
Message-ID: <20241015100012.254223-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: bgYqNL9eSCLe

For unsupported acceleration types and GIC versions, explicitly disable vCPU
hotplug support and limit the number of possible vCPUs to those available at
boot time (i.e., SMP CPUs). This flag will be referenced at various points in
the code to verify the presence of vCPU hotplug functionality on this machine.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 66 +++++++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8ff7e109dd..827a796ed6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2108,8 +2108,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    possible_cpus = mc->possible_cpu_arch_ids(machine);
-
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
      * for Linux, or hvf_get_physical_address_range() for macOS to create a
@@ -2125,7 +2123,7 @@ static void machvirt_init(MachineState *machine)
          * we are about to deal with. Once this is done, get rid of
          * the object.
          */
-        cpuobj = object_new(possible_cpus->cpus[0].type);
+        cpuobj = object_new(machine->cpu_type);
         armcpu = ARM_CPU(cpuobj);
 
         pa_bits = arm_pamax(armcpu);
@@ -2140,6 +2138,43 @@ static void machvirt_init(MachineState *machine)
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
+    if ((tcg_enabled() && !qemu_tcg_mttcg_enabled()) || hvf_enabled() ||
+        qtest_enabled() || (vms->gic_version < VIRT_GIC_VERSION_3)) {
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
@@ -2174,31 +2209,6 @@ static void machvirt_init(MachineState *machine)
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

Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595015njl;
        Tue, 8 Oct 2024 20:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVolSUyXc/1UxtujQgpgAVpDKw0BfQTM+Cf+HY0FX0zYF5bff1nTR2Qbj13mdmUKxJEjrMSam2xQNQNcw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZUkf2TOS7NPL8LXM/Eusl7rilzGfqiV4MsDBsRvwS7QyItoyOoozh5vUhTX5zHZyVS9uY
X-Received: by 2002:a5d:5e04:0:b0:37d:3e6d:3c32 with SMTP id ffacd0b85a97d-37d3e6d3de3mr96388f8f.3.1728444037744;
        Tue, 08 Oct 2024 20:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444037; cv=none;
        d=google.com; s=arc-20240605;
        b=NM9H+cpBJv/G1ld17YNa8IvSP0Ep5OYWFT4KSmOLHOsArdm+zhBSIOi8htvOkRaDAL
         N6ee7D0yRA5RLNsaXAUBfjaOzDLqlBTiXvDBfHdvGhPysiocu8kQ+oz9e4OXIr4Gt5Rs
         w3qjljNjxIix4qsGrZOqHXpDp36w/1thR5du1opDqsIJ2m5oxF2zXtfee1XYAxfiJPT4
         4YJcaFDYzJ2j8YwCVMehvCBvKeNcl+A6gWycJLba73+G6l+/fHwn3IOdgFVyxwMlmc8s
         m2KBhxkVdObhlCPYVrLYWNgLat2C13K9cLX88o4dJgUauubiQTBHIavIvdyqphmRdRHF
         Pb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ZZo2Tsf3MFZUKWyr8tPda7xI21QUHYasI7uxzpyngDk=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=XfVRY8EWHD4gjCa7vSghWM2wp/OzmYlL9QsabiB5ufFMs+kwZ9Lp2RQlfgbXooT8aC
         YoyWrP5rpUklmBBjN3pN0DwpB35xD3/0vq3BtkyKjo9EvgiNaKJURSxCvgaOc9Ps4pOo
         2vU4/DmEM5L0uf7+OUexN5PuRqpEQfDLyReeAIVPUY14zr8ShonjJyuupgZSMHmgbxCP
         UtyyLGxgKR49b13wNCTFFzIjs4YfUSIfAj2Hu9z0lzDaLc7LSDLetHSKAfCK6z+hLf6u
         FLk5DwqxPY3+iPQ0uFkDsOgv0loKWdkEjZyLPtipnzIYOhNaPsAjnVkgq8JvU3m1fKuu
         fJCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d16972efasi3827835f8f.688.2024.10.08.20.20.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdMQ05fQz6LD7Q;
	Wed,  9 Oct 2024 11:16:18 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id B31BF140447;
	Wed,  9 Oct 2024 11:20:36 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:20:17 +0200
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
Subject: [PATCH RFC V4 03/33] hw/arm/virt: Disable vCPU hotplug for *unsupported* Accel or GIC Type
Date: Wed, 9 Oct 2024 04:17:45 +0100
Message-ID: <20241009031815.250096-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: twuBWYTTMI9x

For unsupported acceleration types and GIC versions, explicitly disable vCPU
hotplug support and limit the number of possible vCPUs to those available at
boot time (i.e., SMP CPUs). This flag will be referenced at various points in
the code to verify the presence of vCPU hotplug functionality on this machine.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 66 +++++++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a0aeb263dc..1c730f85c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2107,8 +2107,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    possible_cpus = mc->possible_cpu_arch_ids(machine);
-
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
      * to create a VM with the right number of IPA bits.
@@ -2123,7 +2121,7 @@ static void machvirt_init(MachineState *machine)
          * we are about to deal with. Once this is done, get rid of
          * the object.
          */
-        cpuobj = object_new(possible_cpus->cpus[0].type);
+        cpuobj = object_new(machine->cpu_type);
         armcpu = ARM_CPU(cpuobj);
 
         pa_bits = arm_pamax(armcpu);
@@ -2138,6 +2136,43 @@ static void machvirt_init(MachineState *machine)
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
@@ -2172,31 +2207,6 @@ static void machvirt_init(MachineState *machine)
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

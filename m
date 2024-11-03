Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1611042njc;
        Sun, 3 Nov 2024 07:24:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcoIAuRDFzMTqiDHhCuLIZtea5Oyoe50da9BuUU5xqUI/DJ6DUXf2dbDh6rO9j4wus7mMYmohrlpF7EA==@linaro.org
X-Google-Smtp-Source: AGHT+IFSALftb4si2YBM8kEGJq49cyJHEuYxVUmUGkDBG9NlV/GcLPQeamya9sTXdd3RaWCoQvbW
X-Received: by 2002:a5d:5a8c:0:b0:381:d133:d541 with SMTP id ffacd0b85a97d-381d133d9cdmr3274207f8f.11.1730647454644;
        Sun, 03 Nov 2024 07:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730647454; cv=none;
        d=google.com; s=arc-20240605;
        b=cTF7ofMcAQtPM6Mx9F6t79oS5T+2NQ8hzUuN5sv0XaapHq4CcsZQl07an+XZA6R2hD
         LPC4HHJ/svNzusSsV7PT777RU/ajDugBEynWx2DJB2XS8KxePUSR0/J6wFLrNgf7886k
         U0bC8XaPeWvLNVQwUQWTZetn8jEjOBEKjASj/tkMD0va/YLP9RETgc0n2p9Xq/CrBp12
         6+sSNkTlhewATJjINB3cTVgChph50fFBI71s+kCyJ3E//EJjVejCKlcT6jZ/ZvCgdeZy
         q5eiRykRugQ48+5B+f139Q6qwWZN6pgSqlwkWIEw7RLkhwluRpf8ipsFAipgnJwRpo3Q
         CpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=6wVqS5e9ADoMalRccE87K9H47ri3096hyPOTVzM+IUs=;
        fh=aZ+ktIGDgW/6qknyYMJe32UNdHDchsP+Kk6AMToiipc=;
        b=kl25k3iSWWXQlp1bI0gUnMNBDxm4nAQwgSHW7Z1oRCoRoCupKljtrXsmPPCLkxAIwN
         xT0vlqR35qWxiYR4kxs4uGV9+mO0FDX31dIlEny0Xy90hioYCTx1xnPaiC6ayn3uuYnP
         oxbxcg/6xh8BILrG9tQEoNPyDVFpmdEr8et1oMMz0cKtGeLOQAXKPnKpfjSMRAj/Gp7B
         Hiv7Y/k9+52dusvS6l+QkFDp8iG5MvneT+8rfJTdoVhKH9cu1MSjSsGE+XNHcQXOQP1+
         3WKqeY4QvduEaUk9CMPMMjDlekgjrUbNIigycoGI6BfBHMQ+KtOoU7+///3CzJXTSmoE
         H+aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c1196a35si4952383f8f.593.2024.11.03.07.24.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2024 07:24:14 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XhJGl2gXYz67Kdt;
	Sun,  3 Nov 2024 23:21:35 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 57A99140B67;
	Sun,  3 Nov 2024 23:24:13 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.9) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 16:23:55 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
	<richard.henderson@linaro.org>, <peter.maydell@linaro.org>
CC: <salil.mehta@huawei.com>, <jonathan.cameron@huawei.com>,
	<alex.bennee@linaro.org>, <imammedo@redhat.com>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <maz@kernel.org>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <jean-philippe@linaro.org>,
	<lpieralisi@kernel.org>, <david@redhat.com>, <philmd@linaro.org>,
	<andrew.jones@linux.dev>, <eric.auger@redhat.com>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH] hw/arm/virt: Move common vCPU properties in a function
Date: Sun, 3 Nov 2024 15:22:56 +0000
Message-ID: <20241103152256.202444-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.9]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: btxyU0P96oXk

Refactor vCPU properties code from the `machvirt_init()` main loop with
the following goals:

1. Enable code reuse in future patch sets.
2. Improve code readability.
3. Separate out the one-time initialization of (secure-)Tagged memory,
   handling potential failures early.

Note: This is a cosmetic change only; *no* functional changes are
      intended here.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 238 +++++++++++++++++++++++++-----------------
 include/hw/arm/virt.h |   4 +
 2 files changed, 147 insertions(+), 95 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a381e9a2b..a0d3bef875 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2091,16 +2091,126 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
     }
 }
 
+static void virt_cpu_set_properties(Object *cpuobj, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    VirtMachineState *vms = VIRT_MACHINE(ms);
+    const CPUArchIdList *possible_cpus;
+    Error *local_err = NULL;
+    VirtMachineClass *vmc;
+
+    vmc = VIRT_MACHINE_GET_CLASS(ms);
+
+    possible_cpus = mc->possible_cpu_arch_ids(ms);
+    object_property_set_int(cpuobj, "mp-affinity",
+                            possible_cpus->cpus[CPU(cpuobj)->cpu_index].arch_id,
+                            NULL);
+
+    numa_cpu_pre_plug(&possible_cpus->cpus[CPU(cpuobj)->cpu_index],
+                      DEVICE(cpuobj), &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    if (!vms->secure) {
+        object_property_set_bool(cpuobj, "has_el3", false, NULL);
+    }
+
+    if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
+        object_property_set_bool(cpuobj, "has_el2", false, NULL);
+    }
+
+    if (vmc->kvm_no_adjvtime &&
+        object_property_find(cpuobj, "kvm-no-adjvtime")) {
+        object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
+    }
+
+    if (vmc->no_kvm_steal_time &&
+        object_property_find(cpuobj, "kvm-steal-time")) {
+        object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
+    }
+
+    if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
+        object_property_set_bool(cpuobj, "pmu", false, NULL);
+    }
+
+    if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
+        object_property_set_bool(cpuobj, "lpa2", false, NULL);
+    }
+
+    if (object_property_find(cpuobj, "reset-cbar")) {
+        object_property_set_int(cpuobj, "reset-cbar",
+                                vms->memmap[VIRT_CPUPERIPHS].base,
+                                &local_err);
+        if (local_err) {
+            goto out;
+        }
+    }
+
+    object_property_set_link(cpuobj, "memory", OBJECT(vms->sysmem), &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    if (vms->secure) {
+        object_property_set_link(cpuobj, "secure-memory",
+                                 OBJECT(vms->secure_sysmem), &local_err);
+        if (local_err) {
+            goto out;
+        }
+    }
+
+    if (vms->mte) {
+        if (tcg_enabled()) {
+            /*
+             * The property exists only if MemTag is supported.
+             * If it is, we must allocate the ram to back that up.
+             */
+            if (!object_property_find(cpuobj, "tag-memory")) {
+                error_report("MTE requested, but not supported "
+                             "by the guest CPU");
+                exit(1);
+            }
+
+            object_property_set_link(cpuobj, "tag-memory",
+                                     OBJECT(vms->tag_sysmem), &local_err);
+            if (local_err) {
+                goto out;
+            }
+
+            if (vms->secure) {
+                object_property_set_link(cpuobj, "secure-tag-memory",
+                                         OBJECT(vms->secure_tag_sysmem),
+                                         &local_err);
+                if (local_err) {
+                    goto out;
+                }
+            }
+        } else if (kvm_enabled()) {
+            kvm_arm_enable_mte(cpuobj, &local_err);
+            if (local_err) {
+                goto out;
+            }
+        }
+    }
+
+out:
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus;
-    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *secure_tag_sysmem = NULL;
     MemoryRegion *secure_sysmem = NULL;
     MemoryRegion *tag_sysmem = NULL;
-    MemoryRegion *secure_tag_sysmem = NULL;
+    MemoryRegion *sysmem;
     int n, virt_max_cpus;
     bool firmware_loaded;
     bool aarch64 = true;
@@ -2140,6 +2250,8 @@ static void machvirt_init(MachineState *machine)
      */
     finalize_gic_version(vms);
 
+    sysmem = vms->sysmem = get_system_memory();
+
     if (vms->secure) {
         /*
          * The Secure view of the world is the same as the NonSecure,
@@ -2147,7 +2259,7 @@ static void machvirt_init(MachineState *machine)
          * containing the system memory at low priority; any secure-only
          * devices go in at higher priority and take precedence.
          */
-        secure_sysmem = g_new(MemoryRegion, 1);
+        secure_sysmem = vms->secure_sysmem = g_new(MemoryRegion, 1);
         memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
                            UINT64_MAX);
         memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
@@ -2220,6 +2332,33 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (vms->mte && !kvm_enabled() && !tcg_enabled()) {
+        error_report("MTE requested, but not supported ");
+        exit(1);
+    }
+
+    if (vms->mte && kvm_enabled() && !kvm_arm_mte_supported()) {
+        error_report("MTE requested, but not supported by KVM");
+        exit(1);
+    }
+
+    if (vms->mte && tcg_enabled()) {
+        /* Create the memory region only once, but link to all cpus later */
+        tag_sysmem = vms->tag_sysmem = g_new(MemoryRegion, 1);
+        memory_region_init(tag_sysmem, OBJECT(machine),
+                           "tag-memory", UINT64_MAX / 32);
+
+        if (vms->secure) {
+            secure_tag_sysmem = vms->secure_tag_sysmem = g_new(MemoryRegion, 1);
+            memory_region_init(secure_tag_sysmem, OBJECT(machine),
+                               "secure-tag-memory", UINT64_MAX / 32);
+
+            /* As with ram, secure-tag takes precedence over tag.  */
+            memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
+                                                tag_sysmem, -1);
+        }
+    }
+
     create_fdt(vms);
 
     assert(possible_cpus->len == max_cpus);
@@ -2232,104 +2371,13 @@ static void machvirt_init(MachineState *machine)
         }
 
         cpuobj = object_new(possible_cpus->cpus[n].type);
-        object_property_set_int(cpuobj, "mp-affinity",
-                                possible_cpus->cpus[n].arch_id, NULL);
 
         cs = CPU(cpuobj);
         cs->cpu_index = n;
 
-        numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
-                          &error_fatal);
-
         aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
 
-        if (!vms->secure) {
-            object_property_set_bool(cpuobj, "has_el3", false, NULL);
-        }
-
-        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
-            object_property_set_bool(cpuobj, "has_el2", false, NULL);
-        }
-
-        if (vmc->kvm_no_adjvtime &&
-            object_property_find(cpuobj, "kvm-no-adjvtime")) {
-            object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
-        }
-
-        if (vmc->no_kvm_steal_time &&
-            object_property_find(cpuobj, "kvm-steal-time")) {
-            object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
-        }
-
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
-            object_property_set_bool(cpuobj, "pmu", false, NULL);
-        }
-
-        if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
-            object_property_set_bool(cpuobj, "lpa2", false, NULL);
-        }
-
-        if (object_property_find(cpuobj, "reset-cbar")) {
-            object_property_set_int(cpuobj, "reset-cbar",
-                                    vms->memmap[VIRT_CPUPERIPHS].base,
-                                    &error_abort);
-        }
-
-        object_property_set_link(cpuobj, "memory", OBJECT(sysmem),
-                                 &error_abort);
-        if (vms->secure) {
-            object_property_set_link(cpuobj, "secure-memory",
-                                     OBJECT(secure_sysmem), &error_abort);
-        }
-
-        if (vms->mte) {
-            if (tcg_enabled()) {
-                /* Create the memory region only once, but link to all cpus. */
-                if (!tag_sysmem) {
-                    /*
-                     * The property exists only if MemTag is supported.
-                     * If it is, we must allocate the ram to back that up.
-                     */
-                    if (!object_property_find(cpuobj, "tag-memory")) {
-                        error_report("MTE requested, but not supported "
-                                     "by the guest CPU");
-                        exit(1);
-                    }
-
-                    tag_sysmem = g_new(MemoryRegion, 1);
-                    memory_region_init(tag_sysmem, OBJECT(machine),
-                                       "tag-memory", UINT64_MAX / 32);
-
-                    if (vms->secure) {
-                        secure_tag_sysmem = g_new(MemoryRegion, 1);
-                        memory_region_init(secure_tag_sysmem, OBJECT(machine),
-                                           "secure-tag-memory",
-                                           UINT64_MAX / 32);
-
-                        /* As with ram, secure-tag takes precedence over tag. */
-                        memory_region_add_subregion_overlap(secure_tag_sysmem,
-                                                            0, tag_sysmem, -1);
-                    }
-                }
-
-                object_property_set_link(cpuobj, "tag-memory",
-                                         OBJECT(tag_sysmem), &error_abort);
-                if (vms->secure) {
-                    object_property_set_link(cpuobj, "secure-tag-memory",
-                                             OBJECT(secure_tag_sysmem),
-                                             &error_abort);
-                }
-            } else if (kvm_enabled()) {
-                if (!kvm_arm_mte_supported()) {
-                    error_report("MTE requested, but not supported by KVM");
-                    exit(1);
-                }
-                kvm_arm_enable_mte(cpuobj, &error_abort);
-            } else {
-                    error_report("MTE requested, but not supported ");
-                    exit(1);
-            }
-        }
+        virt_cpu_set_properties(cpuobj, &error_abort);
 
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
         object_unref(cpuobj);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aca4f8061b..239f3678af 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -143,6 +143,10 @@ struct VirtMachineState {
     DeviceState *platform_bus_dev;
     FWCfgState *fw_cfg;
     PFlashCFI01 *flash[2];
+    MemoryRegion *sysmem;
+    MemoryRegion *secure_sysmem;
+    MemoryRegion *tag_sysmem;
+    MemoryRegion *secure_tag_sysmem;
     bool secure;
     bool highmem;
     bool highmem_compact;
-- 
2.34.1

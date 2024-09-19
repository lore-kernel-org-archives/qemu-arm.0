Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1113081njg;
        Wed, 18 Sep 2024 18:41:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNJ2TFmlcrxwDmG8oH/femtWEaRDoWwR7js8RjBwZIx3ME4jcvJneFr5z+ccbEZpricVNa20xrO1CoHg==@linaro.org
X-Google-Smtp-Source: AGHT+IFopFq1pZVi7AwQGpkHKPFb3XVZUrd+GQ7REJTR/sDyfKmp0Yt6z6V3cQ2w6gTunInaO+Bt
X-Received: by 2002:a05:620a:28d4:b0:7a6:5cb3:8794 with SMTP id af79cd13be357-7ab30dc42cdmr3314437785a.62.1726710087049;
        Wed, 18 Sep 2024 18:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726710087; cv=none;
        d=google.com; s=arc-20240605;
        b=gIVHLkUKffy+FSxmvvxtb7PDdTESfJATylgTwIGA+zabaU4FNmIYmgW16s7PZdOKyM
         BLMNtL1In1Us1u65TeIABkiFX6rYlP2hIQ+FOraJzFohuWHCVUhy965dalKujmSPivEZ
         yIY0j7tjC9KMkxdjdcK1VkNpab/RNm9R0Gc0o6n2B1JU2Kv5ZjmMRvIh/EvEoR9Twon3
         QIY/sdUlKJQXhUxkwW2M0TXqX7dnGgNu6dKl5gR6lg/eX9E6LuBO1baO7WJFqP39NV/v
         TgGyb8glftZqOwUDBalsMrIZCpnov/XOMwLkoR7Q6ELsh5H4u+CVw5q8k8K/pEFLM4Yi
         qPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JkD60/JH0Tp2VzzsL+xBzLrW6ct/fu4Il1prS5IUdvk=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=PlZVHE9/w04X+I7CG/bHkDK3BF+x/mctuQScCjYHn87CbuFEdoaRNBOubycNY3RFk9
         g3ztl3m6NtNtQ7XY51EmvHkwP/lFTkttkboYjNmjVPy6+aixvcN3oy4suFK1INk47wCr
         dlSjv6FxnHuKTo7ccJCfzTS5WSNQtkWYw2jEN2CbXyTMFeDRxKZPi3Ya7/I3rDEPhVMC
         nk/EzlY8WfXhgaDwU4IpmRYYHrCbjDviJZ8egQrzwwE1cfDA8H/Cf6gX1RiuwGqiHgGW
         R0LLdKPfMS/5SLuvUCFm/0qOVKzsFOhTLMnYTVo6SKz4O0Ey3tUoNz78dSklscxGVR4y
         laiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XRiBW6Th;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08c8da3si79123185a.259.2024.09.18.18.41.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XRiBW6Th;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726710087; x=1758246087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R/RyqBpSFLfGANKmP2zWrU5SVWm2/qn58wOc7/+Iwms=;
  b=XRiBW6ThyhwYtqtWmCat7Nkuhj9Q1bXN9eTlg4EL5iKAbFzOTk0r3KTO
   xJn/HYJaSEgfDDTlNF035HVY+j8rISVETTbFRvQtYIGztjC376yygHSud
   yJbtU4sggvLsMdQE/nvHrvlVejCyqqghVbyZTmvfdVqaTdHIk8AZ1MWs0
   3tC6a+QHQoeJVgnkFm3ISmF7pcD8KPL2+w74/R3RY5VA9QgCMNFFrQM00
   f0ORavhaXIZdFeBBbZ9eYUw476raJ4bIv3ImFlRQU4uCjAvN6Bc2KWJRT
   L1JRBDBm7m3gSBPfDuF+vay7eLo1pIBSNsESE3uIYfR6EvgIlKfLJPOjL
   Q==;
X-CSE-ConnectionGUID: jtXEGmowSiuhTLOdFU4jRw==
X-CSE-MsgGUID: +cTuBsfWRtOHMjufwGLCXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25798137"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25798137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:41:25 -0700
X-CSE-ConnectionGUID: szNCjQVpTIWjD4Z0T6eu4A==
X-CSE-MsgGUID: 4gQNKxRUT0GdnsrB0gseZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70059004"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:41:18 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 15/15] i386: Support topology device tree
Date: Thu, 19 Sep 2024 09:55:33 +0800
Message-Id: <20240919015533.766754-16-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LVqZ4vob4IS1

Support complete QOM CPu topology tree for x86 machine, and specify
bus_type for x86 CPU so that all x86 CPUs will be added in the topology
tree.

Since the CPU slot make the machine as the hotplug handler for all
topology devices, hotplug related hooks may used to handle other
topology devices besides the CPU. Thus, make microvm not assume that
the device is only a CPU when implementing the relevant hooks.

Additionally, drop code paths that are not needed by the topology tree
implementation.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/microvm.c    | 13 +++++---
 hw/i386/x86-common.c | 78 +++++---------------------------------------
 hw/i386/x86.c        |  2 ++
 target/i386/cpu.c    |  2 ++
 4 files changed, 21 insertions(+), 74 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 40edcee7af29..49a897db50fc 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -417,16 +417,21 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
 static void microvm_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                        DeviceState *dev, Error **errp)
 {
-    X86CPU *cpu = X86_CPU(dev);
+    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        X86CPU *cpu;
+        cpu = X86_CPU(dev);
 
-    cpu->host_phys_bits = true; /* need reliable phys-bits */
-    x86_cpu_pre_plug(hotplug_dev, dev, errp);
+        cpu->host_phys_bits = true; /* need reliable phys-bits */
+        x86_cpu_pre_plug(hotplug_dev, dev, errp);
+    }
 }
 
 static void microvm_device_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp)
 {
-    x86_cpu_plug(hotplug_dev, dev, errp);
+    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        x86_cpu_plug(hotplug_dev, dev, errp);
+    }
 }
 
 static void microvm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index d837aadc9dea..75d4b2f3d43a 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -129,26 +129,18 @@ static void x86_cpu_new(X86MachineState *x86ms, int index,
                         int64_t apic_id, Error **errp)
 {
     MachineState *ms = MACHINE(x86ms);
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
     Object *cpu = object_new(ms->cpu_type);
     DeviceState *dev = DEVICE(cpu);
     BusState *bus = NULL;
+    X86CPUTopoIDs topo_ids;
+    X86CPUTopoInfo topo_info;
 
-    /*
-     * Once x86 machine supports topo_tree_supported, x86 CPU would
-     * also have bus_type.
-     */
-    if (mc->smp_props.topo_tree_supported) {
-        X86CPUTopoIDs topo_ids;
-        X86CPUTopoInfo topo_info;
-
-        init_topo_info(&topo_info, x86ms);
-        x86_topo_ids_from_apicid(apic_id, &topo_info, &topo_ids);
-        bus = x86_find_topo_bus(ms, &topo_ids);
+    init_topo_info(&topo_info, x86ms);
+    x86_topo_ids_from_apicid(apic_id, &topo_info, &topo_ids);
+    bus = x86_find_topo_bus(ms, &topo_ids);
 
-        /* Only with dev->id, CPU can be inserted into topology tree. */
-        dev->id = g_strdup_printf("%s[%d]", ms->cpu_type, index);
-    }
+    /* Only with dev->id, CPU can be inserted into topology tree. */
+    dev->id = g_strdup_printf("%s[%d]", ms->cpu_type, index);
 
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
@@ -399,10 +391,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     X86CPU *cpu = X86_CPU(dev);
     CPUX86State *env = &cpu->env;
     MachineState *ms = MACHINE(hotplug_dev);
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
-    unsigned int smp_cores = ms->smp.cores;
-    unsigned int smp_threads = ms->smp.threads;
     X86CPUTopoInfo topo_info;
 
     if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
@@ -434,58 +423,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         set_bit(CPU_TOPOLOGY_LEVEL_DIE, env->avail_cpu_topo);
     }
 
-    if (cpu->apic_id == UNASSIGNED_APIC_ID &&
-        !mc->smp_props.topo_tree_supported) {
-        x86_fixup_topo_ids(ms, cpu);
-
-        if (cpu->socket_id < 0) {
-            error_setg(errp, "CPU socket-id is not set");
-            return;
-        } else if (cpu->socket_id > ms->smp.sockets - 1) {
-            error_setg(errp, "Invalid CPU socket-id: %u must be in range 0:%u",
-                       cpu->socket_id, ms->smp.sockets - 1);
-            return;
-        }
-        if (cpu->die_id < 0) {
-            error_setg(errp, "CPU die-id is not set");
-            return;
-        } else if (cpu->die_id > ms->smp.dies - 1) {
-            error_setg(errp, "Invalid CPU die-id: %u must be in range 0:%u",
-                       cpu->die_id, ms->smp.dies - 1);
-        }
-        if (cpu->module_id < 0) {
-            error_setg(errp, "CPU module-id is not set");
-            return;
-        } else if (cpu->module_id > ms->smp.modules - 1) {
-            error_setg(errp, "Invalid CPU module-id: %u must be in range 0:%u",
-                       cpu->module_id, ms->smp.modules - 1);
-            return;
-        }
-        if (cpu->core_id < 0) {
-            error_setg(errp, "CPU core-id is not set");
-            return;
-        } else if (cpu->core_id > (smp_cores - 1)) {
-            error_setg(errp, "Invalid CPU core-id: %u must be in range 0:%u",
-                       cpu->core_id, smp_cores - 1);
-            return;
-        }
-        if (cpu->thread_id < 0) {
-            error_setg(errp, "CPU thread-id is not set");
-            return;
-        } else if (cpu->thread_id > (smp_threads - 1)) {
-            error_setg(errp, "Invalid CPU thread-id: %u must be in range 0:%u",
-                       cpu->thread_id, smp_threads - 1);
-            return;
-        }
-
-        topo_ids.pkg_id = cpu->socket_id;
-        topo_ids.die_id = cpu->die_id;
-        topo_ids.module_id = cpu->module_id;
-        topo_ids.core_id = cpu->core_id;
-        topo_ids.smt_id = cpu->thread_id;
-        cpu->apic_id = x86_apicid_from_topo_ids(&topo_info, &topo_ids);
-    } else if (cpu->apic_id == UNASSIGNED_APIC_ID &&
-               mc->smp_props.topo_tree_supported) {
+    if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         /*
          * For this case, CPU is added by specifying the bus. Under the
          * topology tree, specifying only the bus should be feasible, but
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 01fc5e656272..cdf7b81ad0e3 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -381,6 +381,8 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
+    mc->smp_props.arch_id_topo_level = CPU_TOPOLOGY_LEVEL_THREAD;
+    mc->smp_props.topo_tree_supported = true;
     mc->kvm_type = x86_kvm_type;
     x86mc->save_tsc_khz = true;
     x86mc->fwcfg_dma_enabled = true;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 90221ceb7313..fb54c2c100a0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8473,6 +8473,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     BusFinderClass *bfc = BUS_FINDER_CLASS(oc);
     bfc->find_bus = x86_cpu_get_parent_bus;
+
+    dc->bus_type = TYPE_CPU_BUS;
 #endif
 
     object_class_property_add(oc, "family", "int",
-- 
2.34.1

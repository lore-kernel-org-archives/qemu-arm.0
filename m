Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1112976njg;
        Wed, 18 Sep 2024 18:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAujy++j1Lpl1UqK5YqFN9P+uKhd5Z1PiyvPBHaA7MCUvmZM2gg6byVB0Hb5RUIgdnO62wMnfsrOQz5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFQJ7zD3qiL9SoVYGnUyCDGIhbKn4xzt/EGyq0xhwkHES1TP9ccMfXI7FK1UPfkVY1EhSRE
X-Received: by 2002:a05:622a:1103:b0:458:1f80:67d2 with SMTP id d75a77b69052e-45860316084mr314038761cf.33.1726710066314;
        Wed, 18 Sep 2024 18:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726710066; cv=none;
        d=google.com; s=arc-20240605;
        b=a02IWCY2kpMheH415lh3w9JP0sqN2sEK7xGunHfvIwDDgoXc1ssqFu1SCo5LbAB6Dw
         n5sR+S2bfcSXpFBukcCS5Fo6H+jSxRL3SZ+7HYQMbCLB5p2X3FjG4SyocWbSy21FugWx
         Six4gnJIIeoeKaX6ohH2iGwFFnMlHRCiG01SCWi0VswCIn+xMmx3XDqznNPyOTc9brC/
         VHL4ayo+DsaNIOxpR4eC1Oi5KTcHRI9DYYTCIifTc1hZ8nZeJXOkJVSnzaRp/rrRQB3P
         MuIwOOs0t0LsXXKzdny7swjNxvI6iiX2ExGyCbnQfWdFsGACDp4c/FUxLae/Fn+c4vRN
         P5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LjLY12BDDhqnKVVmfaqFrJ2OMiaMxVd9oNdkDhquPyE=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=g2MRUB5wv2WB3basOGd41N+ZuBHCJU0dPE+K8XTAMXEiyAW2SlToc+SE6hzX+CTQMN
         dBJQetBu1nil0Wqc8tib7WBIRBpoXZDWbXLXKyAQln14PV/6lhYHxpH0bITvJ94rCEmL
         d400bqcvLBEOugafzN3j6duEz9SWO3b/QaStIph6kK842Ii+QLCN8iLw/KKNEQHGQIlW
         UvyR5m3ot/+8I6owjMlMzBdKeLAi2ilONUUHk48eNY0DBnWNu7eba6x3cbDS7nHvBVLC
         nq8YzQTF8M40uNwB0Qs3K/0ylw9kSVIf6sfWQ2ekaTNltv77juEhalbYw4BD/gqVk9Xg
         tDRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="H4sg3J7/";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b178ed4c3si7793001cf.389.2024.09.18.18.41.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="H4sg3J7/";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726710066; x=1758246066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wx8cdMXy87jbp3iDhkGcf2ZrKApAXiC+ip9Awek7e04=;
  b=H4sg3J7/8h9fIOrQXZ2gqJiz2lje4MubItHOAGLd8F4Q1A8DovnyhDp/
   7oFqISUPnYDfbUna4SnTwwgIU5KioshijN9azLA0YJWZF7gS04M5M1D+a
   ouLa7xYnEZ68mYR/L7F8q1Bx2b0g2ch6sKbUOCOJfzS7x+j390WwJHHpI
   esObkElxFt+bPYeWadBJNo4afAZZwo2D0tIWx1eoZj2BftDK/2iQL1UFU
   LuQUg53kwclYdMFRnYeVL081UCU5Le3153m3SfibQiHZcG1FVJcE228sf
   SSS2UowoQM8QuHuaNHt8IWpmL0qgBGUUQPdmvdZ2+B8qvHdkF5wikIkOe
   Q==;
X-CSE-ConnectionGUID: wZyTTX58S6uzA5TApqUrCg==
X-CSE-MsgGUID: xFnCmuQ9Qpm1djARxaw6og==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25798060"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25798060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:41:04 -0700
X-CSE-ConnectionGUID: /9zU/3CdSJut5CeCqd6www==
X-CSE-MsgGUID: 6BJoj00JRPy92lBgaz2/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70058955"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:40:58 -0700
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
Subject: [RFC v2 12/15] hw/i386: Allow i386 to create new CPUs in topology tree
Date: Thu, 19 Sep 2024 09:55:30 +0800
Message-Id: <20240919015533.766754-13-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mRtT0Nrxv2yN

For x86, CPU's apic ID represent its topology path and is the
combination of topology sub IDs in each leavl.

When x86 machine creates CPUs, to insert the CPU into topology tree, use
apic ID to get topology sub IDs.

Then search the topology tree for the corresponding parent topology
device and insert the CPU into the CPU bus of the parent device.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86-common.c | 101 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index b21d2ab97349..a7f082b0a90b 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -53,14 +53,107 @@
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
-static void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
+static int x86_cpu_get_topo_id(const X86CPUTopoIDs *topo_ids,
+                               CpuTopologyLevel level)
 {
-    Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
+    switch (level) {
+    case CPU_TOPOLOGY_LEVEL_THREAD:
+        return topo_ids->smt_id;
+    case CPU_TOPOLOGY_LEVEL_CORE:
+        return topo_ids->core_id;
+    case CPU_TOPOLOGY_LEVEL_MODULE:
+        return topo_ids->module_id;
+    case CPU_TOPOLOGY_LEVEL_DIE:
+        return topo_ids->die_id;
+    case CPU_TOPOLOGY_LEVEL_SOCKET:
+        return topo_ids->pkg_id;
+    default:
+        g_assert_not_reached();
+    }
+
+    return -1;
+}
+
+typedef struct SearchCoreCb {
+    const X86CPUTopoIDs *topo_ids;
+    const CPUTopoState *parent;
+} SearchCoreCb;
+
+static int x86_search_topo_parent(DeviceState *dev, void *opaque)
+{
+    CPUTopoState *topo = CPU_TOPO(dev);
+    CpuTopologyLevel level = GET_CPU_TOPO_LEVEL(topo);
+    SearchCoreCb *cb = opaque;
+    int topo_id, index;
+
+    topo_id = x86_cpu_get_topo_id(cb->topo_ids, level);
+    index = cpu_topo_get_index(topo);
+
+    if (topo_id < 0) {
+        error_report("Invalid %s-id: %d",
+                     CpuTopologyLevel_str(level), topo_id);
+        error_printf("Try to set the %s-id in [0-%d].\n",
+                     CpuTopologyLevel_str(level),
+                     cpu_topo_get_instances_num(topo) - 1);
+        return TOPO_FOREACH_ERR;
+    }
+
+    if (topo_id == index) {
+        if (level == CPU_TOPOLOGY_LEVEL_CORE) {
+            cb->parent = topo;
+            /* The error result could exit directly. */
+            return TOPO_FOREACH_ERR;
+        }
+        return TOPO_FOREACH_CONTINUE;
+    }
+    return TOPO_FOREACH_END;
+}
+
+static BusState *x86_find_topo_bus(MachineState *ms, X86CPUTopoIDs *topo_ids)
+{
+    SearchCoreCb cb;
+
+    cb.topo_ids = topo_ids;
+    cb.parent = NULL;
+    qbus_walk_children(BUS(&ms->topo->bus), x86_search_topo_parent,
+                       NULL, NULL, NULL, &cb);
+
+    if (!cb.parent) {
+        return NULL;
+    }
+
+    return BUS(cb.parent->bus);
+}
+
+static void x86_cpu_new(X86MachineState *x86ms, int index,
+                        int64_t apic_id, Error **errp)
+{
+    MachineState *ms = MACHINE(x86ms);
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    Object *cpu = object_new(ms->cpu_type);
+    DeviceState *dev = DEVICE(cpu);
+    BusState *bus = NULL;
+
+    /*
+     * Once x86 machine supports topo_tree_supported, x86 CPU would
+     * also have bus_type.
+     */
+    if (mc->smp_props.topo_tree_supported) {
+        X86CPUTopoIDs topo_ids;
+        X86CPUTopoInfo topo_info;
+
+        init_topo_info(&topo_info, x86ms);
+        x86_topo_ids_from_apicid(apic_id, &topo_info, &topo_ids);
+        bus = x86_find_topo_bus(ms, &topo_ids);
+
+        /* Only with dev->id, CPU can be inserted into topology tree. */
+        dev->id = g_strdup_printf("%s[%d]", ms->cpu_type, index);
+    }
 
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
-    qdev_realize(DEVICE(cpu), NULL, errp);
+    qdev_realize(dev, bus, errp);
 
 out:
     object_unref(cpu);
@@ -111,7 +204,7 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
+        x86_cpu_new(x86ms, i, possible_cpus->cpus[i].arch_id, &error_fatal);
     }
 }
 
-- 
2.34.1

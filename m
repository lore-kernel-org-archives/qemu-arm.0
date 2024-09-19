Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85881dlb;
        Wed, 18 Sep 2024 22:56:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRiJ/eN7LFBvmw7BpwAcn6a8zolSaosXiWtdcKK4JhiBcV0b3I72tFn0lk3CBqcuvbcEGlmp/Jdsbhyw==@linaro.org
X-Google-Smtp-Source: AGHT+IEO2HDFPgnt5lbE2tv5k4vtCe/zgQMEL2iWsJCsxA7L9TUQAqS0/s9gfzhbmtXcEKlbHQxB
X-Received: by 2002:a05:6214:2f03:b0:6c3:5b2a:e3d6 with SMTP id 6a1803df08f44-6c5736e856emr420425666d6.43.1726725374765;
        Wed, 18 Sep 2024 22:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725374; cv=none;
        d=google.com; s=arc-20240605;
        b=dgZTUE+6gb6MyMth1JSf6dpjd+cp0xHlT+wLWpNNOMCBK5uLVubGEANzyI/bFztUd2
         zlv28fRTH+knh8lYaSGZCVCfSctzsrn18JFeZfnDw2MaJIDGMNnhav9HLuKo//HilW9q
         WItdIYWo6hkSu6q5sLYV28C+wioW/mTJvrqalTSQlki8BkFCHUm18k872qEkqVQQ7f/R
         E8bXmSWnsuU8U85BnMsULozP2vWyK33WQIUHvXywIN85ZFn4uiAgNOyh8ZitXYRN81ao
         gU6IdIoORiwoVtshYjVh7pT2kymmyo3SL432LOjcEqAC1jqPGDsybOTSGjhdvDjdR+2Y
         0wTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CC4mPbdPv35OyEY+fYAEHmj6/eb5tP0mYjktEkFnOyw=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=aceOOPXBAxn2V+mookZMRAhkS7qNzDyvVdngJkwRysafV0uYoke6ENF+7MrAju4Oip
         JH/kqgSw/o6W5npsCsCTwe48vwEdiJxHYu8kpC6EWTZMkyDpbF8i5OhxkuV/0XQZo7+V
         nY1Vn9+sDWCBR9sbgNaY6y3akX8dfXYByrWJ/KLHCACVouB1dD+ae6LKrfL5w/tgTEIa
         bTMf38gU9Hs7DwmyXmhkcPf1+JbfgG3VO7FZq8Vu3Lfmu9FP2iZNTrx6e3IvqZi/p0hy
         3Qc9YNl5zwyU77MkbDNhPFNIXqD3KGEw19TDV1mjn0+cbQdovSDRamztGSqGWQkOlKh2
         uwkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="M/oo9srM";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e561fefsi11380346d6.306.2024.09.18.22.56.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="M/oo9srM";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725375; x=1758261375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NEuBE48juMTcQ/dJZHqJkRWuT1BVDd+3siUk37y9rsM=;
  b=M/oo9srMkiuaf2PeFTY6NvZKzMMahm/2pM7ZOrCQ4znT4B15VZA6FKqL
   8SEp2AVdjU5zUREntL15pYbYK2BcdJv03pK5mfpt/6dHQnOstKSCDNmiu
   vB7tmDeGnMHTW20+2FBNDvSZkiyygL6h4MZ1FvHlWmuF15k6NKuLKSiE7
   b0SbRIR9FdnzJMPHL2kdXYBzAjxzDyWjpRHZlU4Eq0oez+IOHq7AqlD2b
   RjiPELbIIqgcT9Y0/ud0+y6OHtTVnitAyAYFM3CUwQ3gjvHtDh9u1+3mf
   uyRGizubuWWoOWHdMhFiRwYOw14d8gekjyrIlSXi0RwBP+FiwjFk/s0B0
   Q==;
X-CSE-ConnectionGUID: xVq3RhWmRi+Oxx4NNpzBrg==
X-CSE-MsgGUID: gucct6NjSkyWBeMbfEPA2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813631"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:56:13 -0700
X-CSE-ConnectionGUID: uRrDVkRIRWuVWkVS9YAxng==
X-CSE-MsgGUID: NLGU4weHTJKIgFAW97vQLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418749"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:56:07 -0700
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
	Sergio Lopez <slp@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 07/12] hw/core: Re-implement topology helpers to honor max limitations
Date: Thu, 19 Sep 2024 14:11:23 +0800
Message-Id: <20240919061128.769139-8-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +eQqFt393Fk6

For custom topology case, the valid and reliable topology information
be obtained from topology max limitations.

Therefore, re-implement machine_topo_get_cores_per_socket() and
machine_topo_get_threads_per_socket() to consider the custom topology
case. And further, use the wrapped helper to set CPUState.nr_threads/
nr_cores, avoiding topology mismatches in custom topology scenarios.

Additionally, since test-smp-parse needs more stubs to compile with
cpu-slot.c, keep the old helpers for test-smp-parse' use for now. The
legacy old helpers will be cleaned up when full compilation support is
added later on.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-smp.c       |  8 +++++---
 hw/cpu/cpu-slot.c           | 18 ++++++++++++++++++
 include/hw/boards.h         |  9 +++++++--
 include/hw/cpu/cpu-slot.h   |  2 ++
 system/cpus.c               |  2 +-
 tests/unit/test-smp-parse.c |  4 ++--
 6 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index d3be4352267d..2965b042fd92 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -376,14 +376,16 @@ bool machine_parse_smp_cache(MachineState *ms,
     return true;
 }
 
-unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
+unsigned int machine_topo_get_cores_per_socket_old(const MachineState *ms)
 {
+    assert(!ms->topo);
     return ms->smp.cores * ms->smp.modules * ms->smp.clusters * ms->smp.dies;
 }
 
-unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
+unsigned int machine_topo_get_threads_per_socket_old(const MachineState *ms)
 {
-    return ms->smp.threads * machine_topo_get_cores_per_socket(ms);
+    assert(!ms->topo);
+    return ms->smp.threads * machine_topo_get_cores_per_socket_old(ms);
 }
 
 CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
diff --git a/hw/cpu/cpu-slot.c b/hw/cpu/cpu-slot.c
index f2b9c412926f..8c0d55e835e2 100644
--- a/hw/cpu/cpu-slot.c
+++ b/hw/cpu/cpu-slot.c
@@ -204,6 +204,8 @@ static int get_smp_info_by_level(const CpuTopology *smp_info,
         return smp_info->cores;
     case CPU_TOPOLOGY_LEVEL_MODULE:
         return smp_info->modules;
+    case CPU_TOPOLOGY_LEVEL_CLUSTER:
+        return smp_info->clusters;
     case CPU_TOPOLOGY_LEVEL_DIE:
         return smp_info->dies;
     case CPU_TOPOLOGY_LEVEL_SOCKET:
@@ -356,6 +358,22 @@ int get_max_topo_by_level(const MachineState *ms, CpuTopologyLevel level)
     return ms->topo->stat.entries[level].max_limit;
 }
 
+unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
+{
+    int cores = 1, i;
+
+    for (i = CPU_TOPOLOGY_LEVEL_CORE; i < CPU_TOPOLOGY_LEVEL_SOCKET; i++) {
+        cores *= get_max_topo_by_level(ms, i);
+    }
+    return cores;
+}
+
+unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
+{
+    return get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_THREAD) *
+           machine_topo_get_cores_per_socket(ms);
+}
+
 bool machine_parse_custom_topo_config(MachineState *ms,
                                       const SMPConfiguration *config,
                                       Error **errp)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6ef4ea322590..faf7859debdd 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -48,8 +48,13 @@ void machine_parse_smp_config(MachineState *ms,
 bool machine_parse_smp_cache(MachineState *ms,
                              const SmpCachePropertiesList *caches,
                              Error **errp);
-unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
-unsigned int machine_topo_get_threads_per_socket(const MachineState *ms);
+/*
+ * TODO: Drop these old helpers when cpu-slot.c could be compiled for
+ * test-smp-parse. Pls use machine_topo_get_cores_per_socket() and
+ * machine_topo_get_threads_per_socket() instead.
+ */
+unsigned int machine_topo_get_cores_per_socket_old(const MachineState *ms);
+unsigned int machine_topo_get_threads_per_socket_old(const MachineState *ms);
 CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
                                               CacheLevelAndType cache);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
diff --git a/include/hw/cpu/cpu-slot.h b/include/hw/cpu/cpu-slot.h
index f56a0b08dca4..230309b67fe1 100644
--- a/include/hw/cpu/cpu-slot.h
+++ b/include/hw/cpu/cpu-slot.h
@@ -81,6 +81,8 @@ struct CPUSlot {
 void machine_plug_cpu_slot(MachineState *ms);
 bool machine_create_topo_tree(MachineState *ms, Error **errp);
 int get_max_topo_by_level(const MachineState *ms, CpuTopologyLevel level);
+unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
+unsigned int machine_topo_get_threads_per_socket(const MachineState *ms);
 bool machine_parse_custom_topo_config(MachineState *ms,
                                       const SMPConfiguration *config,
                                       Error **errp);
diff --git a/system/cpus.c b/system/cpus.c
index 1c818ff6828c..53e7cfb8a55f 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -667,7 +667,7 @@ void qemu_init_vcpu(CPUState *cpu)
     MachineState *ms = MACHINE(qdev_get_machine());
 
     cpu->nr_cores = machine_topo_get_cores_per_socket(ms);
-    cpu->nr_threads =  ms->smp.threads;
+    cpu->nr_threads = get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_THREAD);
     cpu->stopped = true;
     cpu->random_seed = qemu_guest_random_seed_thread_part1();
 
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index f9bccb56abc7..44d2213a7163 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -801,8 +801,8 @@ static void check_parse(MachineState *ms, const SMPConfiguration *config,
     /* call the generic parser */
     machine_parse_smp_config(ms, config, &err);
 
-    ms_threads_per_socket = machine_topo_get_threads_per_socket(ms);
-    ms_cores_per_socket = machine_topo_get_cores_per_socket(ms);
+    ms_threads_per_socket = machine_topo_get_threads_per_socket_old(ms);
+    ms_cores_per_socket = machine_topo_get_cores_per_socket_old(ms);
     output_topo_str = cpu_topology_to_string(&ms->smp,
                                              ms_threads_per_socket,
                                              ms_cores_per_socket,
-- 
2.34.1

Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp874536njb;
        Sat, 12 Oct 2024 03:28:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtDt3429g0ZPgE6j64ni0UB0LL59P1W1cboI4DvXdJ9fdu+UR38BV1Yy3Hzts+Se4PmwNa3qk9Jw7+jQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFjGJXg8GYknkBs8H0UEu8JSNPHMAbXiLRceb9xvO9cf5O5TNbUaBP44RCD4rtvddkLule2
X-Received: by 2002:a05:6214:4607:b0:6cb:81ba:8ac1 with SMTP id 6a1803df08f44-6cbef9bc73emr104501186d6.0.1728728923913;
        Sat, 12 Oct 2024 03:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728728923; cv=none;
        d=google.com; s=arc-20240605;
        b=MpcHux0SzLQxAg5jxHA/L+pstggsGOvUjbnsSoEc6mgZTUjRCJYfUShw37rmqDfNhj
         Nb2jl+ZSVDVoDWhBen3KNeABA0jfMjHkpcWllFRpkLYiLbX28b0awwWJBPawOkbRuEE8
         l6kzeC9HE73nN6SgJgBXq0Ato8cBPvESTGrcY0lCgjXRqR6ACeL58cxwQWXOhm3OyBo6
         +o7shPayH+Uk4uvEGCTbF4lihT+kIJd2cQFy1eVtNbHVmr+JaqF1NxwF2gVI2/0m1yzl
         Z517/zC4ftt+VSF0ZHGxikk1pEjX6wWDbGph2IU1DhYvpNgy5WPZDQ2r7i3HHag8uPA7
         UVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fJqmYK2NxgXpFpyWJnW2EA5vP5NMKXXwRKjpg3aWo+U=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=jVhc2A1H5uRsh+EBavXUxNSMY1S2gZJg9+gvcMAEOJGQs+ZvWVun5fG1ZdrlcOsZwY
         Lb9O31tnqltCJc7nSuzn/QpDfZFbgSJMwk5N22OmLtq5f0fRm5Bqh8ZIDSSwNTo8twJ1
         w3+AVETdfEPbbfnocO8FK9mBSri4IC3j1xp+M721tTWfznOfB5bkOoDepWEOwgpLtFMQ
         vfOpj3s4/1We5m28HguhG058MBqxue4VqeNN3+dYTCCkzqKpeWdwpHexoe21ZCP8WS/W
         +tuKARCSD/+iRVDFSShSqSSJVguXh+K02hVXSbEdKsP5z0u+PDNYBkAZeFsMVf2cVKWR
         0LRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Kn2NTpKd;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.8])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e0783si58893326d6.189.2024.10.12.03.28.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) client-ip=192.198.163.8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Kn2NTpKd;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728924; x=1760264924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H0czCsGdbSYUHm6Z4dKQevOBk4+bF7xCn5MvFl5IJXU=;
  b=Kn2NTpKdBjAKZIYv1Uk34xXO+EKpSX0Ei5D9w7s/C8Ntf5rwfbxiijAM
   VU60WoBfofvPga7YL7rA9tpJL2eHheUrtHpt+ieJmJKyjDTfJdsIen94P
   OPlYftscxsJHtTd8xqwb+Fk+APYwYFZhhjVNM8f7VXGNjiiTpx8vtmtRO
   lrBuCNQdTFmxu0ghH4QLrI1W/uhxN/3ueurhKWBvtul66JgcioZ11KKXa
   Tbrg6Micc/fZdLNkoECeK9VbkovuCQKl30oPg2rz/+5xA+XyxGfCy5l1D
   ajH7GZTVMmjys+75LnUFObDINFtO0rH7/Hzgi+rITOjtEATKMpaagAqXK
   w==;
X-CSE-ConnectionGUID: 2fTqrTE4TW2CmJ+hn8NWhA==
X-CSE-MsgGUID: jcbe4UOpRHiP5FhSO1bfgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45634870"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45634870"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:28:43 -0700
X-CSE-ConnectionGUID: D+s2MWIpRSSy0y7cNiepRg==
X-CSE-MsgGUID: 8vw5maFpTGW+YxivpAyN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77050832"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 03:28:37 -0700
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
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: [PATCH v3 2/7] qapi/qom: Define cache enumeration and properties for machine
Date: Sat, 12 Oct 2024 18:44:24 +0800
Message-Id: <20241012104429.1048908-3-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GdoeyY/YLXIJ

The x86 and ARM need to allow user to configure cache properties
(current only topology):
 * For x86, the default cache topology model (of max/host CPU) does not
   always match the Host's real physical cache topology. Performance can
   increase when the configured virtual topology is closer to the
   physical topology than a default topology would be.
 * For ARM, QEMU can't get the cache topology information from the CPU
   registers, then user configuration is necessary. Additionally, the
   cache information is also needed for MPAM emulation (for TCG) to
   build the right PPTT.

Define smp-cache related enumeration and properties in QAPI, so that
user could configure cache properties for SMP system through -machine in
the subsequent patch.

Cache enumeration (CacheLevelAndType) is implemented as the combination
of cache level (level 1/2/3) and cache type (data/instruction/unified).

Currently, separated L1 cache (L1 data cache and L1 instruction cache)
with unified higher-level cache (e.g., unified L2 and L3 caches), is the
most common cache architectures.

Therefore, enumerate the L1 D-cache, L1 I-cache, L2 cache and L3 cache
with smp-cache object to add the basic cache topology support. Other
kinds of caches (e.g., L1 unified or L2/L3 separated caches) can be
added directly into CacheLevelAndType if necessary.

Cache properties (SmpCacheProperties) currently only contains cache
topology information, and other cache properties can be added in it
if necessary.

Note, define cache topology based on CPU topology level with two
reasons:

 1. In practice, a cache will always be bound to the CPU container
    (either private in the CPU container or shared among multiple
    containers), and CPU container is often expressed in terms of CPU
    topology level.
 2. The x86's cache-related CPUIDs encode cache topology based on APIC
    ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
    relies on also requires CPU containers to help indicate the private
    shared hierarchy of the cache. Therefore, for SMP systems, it is
    natural to use the CPU topology hierarchy directly in QEMU to define
    the cache topology.

With smp-cache QAPI support, add smp cache topology for machine by
parsing the smp-cache object list.

Also add a helper to access cache topology level of machine.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Suggested by credit:
 * Referred to Daniel's suggestion to introduce cache object list.
---
Changes since Patch v2:
 * Updated version of new QAPI structures to v9.2. (Jonathan)
 * Merged the folloup commit ("hw/core: Add smp cache topology for
   machine") into this patch as the use case of smp-cache QAPI.
   (Jonathan)
 * Optimized the error_message line breaks to be more grep-friendly.
   (Jonathan)
 * Reduced unnecessary "else" in machine_parse_smp_cache.
   (Jonathan)

Changes since Patch v1:
 * Renamed SMPCacheProperty/SMPCacheProperties (QAPI structures) to
   SmpCacheProperties/SmpCachePropertiesWrapper. (Markus)
 * Renamed SMPCacheName (QAPI structure) to SmpCacheLevelAndType and
   dropped prefix. (Markus)
 * Renamed 'name' field in SmpCacheProperties to 'cache', since the
   type and level of the cache in SMP system could be able to specify
   all of these kinds of cache explicitly enough.
 * Renamed 'topo' field in SmpCacheProperties to 'topology'. (Markus)
 * Returned error information when user repeats setting cache
   properties. (Markus)
 * Renamed SmpCacheLevelAndType to CacheLevelAndType, since this
   representation is general across SMP or hybrid system.
 * Dropped handwriten smp-cache object and integrated cache pproperties
   list into MachineState (in next patch). (Markus)
 * Added the reason why x86 and ARM need to configure cache
   information. (Markus and Jonathan)

Changes since RFC v2:
 * New commit to implement cache list with JSON format instead of
   multiple sub-options in -smp.
---
 hw/core/machine-smp.c    | 40 ++++++++++++++++++++++++++++++++
 hw/core/machine.c        | 44 +++++++++++++++++++++++++++++++++++
 include/hw/boards.h      | 10 ++++++++
 qapi/machine-common.json | 50 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 5d8d7edcbd3f..1ce7be902e6e 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -261,6 +261,40 @@ void machine_parse_smp_config(MachineState *ms,
     }
 }
 
+bool machine_parse_smp_cache(MachineState *ms,
+                             const SmpCachePropertiesList *caches,
+                             Error **errp)
+{
+    const SmpCachePropertiesList *node;
+    DECLARE_BITMAP(caches_bitmap, CACHE_LEVEL_AND_TYPE__MAX);
+
+    for (node = caches; node; node = node->next) {
+        /* Prohibit users from setting the cache topology level to invalid. */
+        if (node->value->topology == CPU_TOPOLOGY_LEVEL_INVALID) {
+            error_setg(errp,
+                       "Invalid cache topology level: %s. "
+                       "The topology should match valid CPU topology level",
+                       CpuTopologyLevel_str(node->value->topology));
+            return false;
+        }
+
+        /* Prohibit users from repeating settings. */
+        if (test_bit(node->value->cache, caches_bitmap)) {
+            error_setg(errp,
+                       "Invalid cache properties: %s. "
+                       "The cache properties are duplicated",
+                       CacheLevelAndType_str(node->value->cache));
+            return false;
+        }
+
+        ms->smp_cache.props[node->value->cache].topology =
+            node->value->topology;
+        set_bit(node->value->cache, caches_bitmap);
+    }
+
+    return true;
+}
+
 unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
 {
     return ms->smp.cores * ms->smp.modules * ms->smp.clusters * ms->smp.dies;
@@ -270,3 +304,9 @@ unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
 {
     return ms->smp.threads * machine_topo_get_cores_per_socket(ms);
 }
+
+CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
+                                              CacheLevelAndType cache)
+{
+    return ms->smp_cache.props[cache].topology;
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index adaba17ebac1..518beb9f883a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -932,6 +932,40 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     machine_parse_smp_config(ms, config, errp);
 }
 
+static void machine_get_smp_cache(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    SmpCache *cache = &ms->smp_cache;
+    SmpCachePropertiesList *head = NULL;
+    SmpCachePropertiesList **tail = &head;
+
+    for (int i = 0; i < CACHE_LEVEL_AND_TYPE__MAX; i++) {
+        SmpCacheProperties *node = g_new(SmpCacheProperties, 1);
+
+        node->cache = cache->props[i].cache;
+        node->topology = cache->props[i].topology;
+        QAPI_LIST_APPEND(tail, node);
+    }
+
+    visit_type_SmpCachePropertiesList(v, name, &head, errp);
+    qapi_free_SmpCachePropertiesList(head);
+}
+
+static void machine_set_smp_cache(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    SmpCachePropertiesList *caches;
+
+    if (!visit_type_SmpCachePropertiesList(v, name, &caches, errp)) {
+        return;
+    }
+
+    machine_parse_smp_cache(ms, caches, errp);
+    qapi_free_SmpCachePropertiesList(caches);
+}
+
 static void machine_get_boot(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
@@ -1057,6 +1091,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "smp",
         "CPU topology");
 
+    object_class_property_add(oc, "smp-cache", "SmpCachePropertiesWrapper",
+        machine_get_smp_cache, machine_set_smp_cache, NULL, NULL);
+    object_class_property_set_description(oc, "smp-cache",
+        "Cache properties list for SMP machine");
+
     object_class_property_add(oc, "phandle-start", "int",
         machine_get_phandle_start, machine_set_phandle_start,
         NULL, NULL);
@@ -1195,6 +1234,11 @@ static void machine_initfn(Object *obj)
     ms->smp.cores = 1;
     ms->smp.threads = 1;
 
+    for (int i = 0; i < CACHE_LEVEL_AND_TYPE__MAX; i++) {
+        ms->smp_cache.props[i].cache = (CacheLevelAndType)i;
+        ms->smp_cache.props[i].topology = CPU_TOPOLOGY_LEVEL_DEFAULT;
+    }
+
     machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5966069baab3..0729066e353a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -44,8 +44,13 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                Error **errp);
 void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp);
+bool machine_parse_smp_cache(MachineState *ms,
+                             const SmpCachePropertiesList *caches,
+                             Error **errp);
 unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
 unsigned int machine_topo_get_threads_per_socket(const MachineState *ms);
+CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
+                                              CacheLevelAndType cache);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
 
 /**
@@ -369,6 +374,10 @@ typedef struct CpuTopology {
     unsigned int max_cpus;
 } CpuTopology;
 
+typedef struct SmpCache {
+    SmpCacheProperties props[CACHE_LEVEL_AND_TYPE__MAX];
+} SmpCache;
+
 /**
  * MachineState:
  */
@@ -419,6 +428,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    SmpCache smp_cache;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/qapi/machine-common.json b/qapi/machine-common.json
index db3e499fb382..b780440c7ec6 100644
--- a/qapi/machine-common.json
+++ b/qapi/machine-common.json
@@ -62,3 +62,53 @@
 { 'enum': 'CpuTopologyLevel',
   'data': [ 'invalid', 'thread', 'core', 'module', 'cluster',
             'die', 'socket', 'book', 'drawer', 'default' ] }
+
+##
+# @CacheLevelAndType:
+#
+# Caches a system may have.  The enumeration value here is the
+# combination of cache level and cache type.
+#
+# @l1d: L1 data cache.
+#
+# @l1i: L1 instruction cache.
+#
+# @l2: L2 (unified) cache.
+#
+# @l3: L3 (unified) cache
+#
+# Since: 9.2
+##
+{ 'enum': 'CacheLevelAndType',
+  'data': [ 'l1d', 'l1i', 'l2', 'l3' ] }
+
+##
+# @SmpCacheProperties:
+#
+# Cache information for SMP system.
+#
+# @cache: Cache name, which is the combination of cache level
+#     and cache type.
+#
+# @topology: Cache topology level.  It accepts the CPU topology
+#     enumeration as the parameter, i.e., CPUs in the same
+#     topology container share the same cache.
+#
+# Since: 9.2
+##
+{ 'struct': 'SmpCacheProperties',
+  'data': {
+  'cache': 'CacheLevelAndType',
+  'topology': 'CpuTopologyLevel' } }
+
+##
+# @SmpCachePropertiesWrapper:
+#
+# List wrapper of SmpCacheProperties.
+#
+# @caches: the list of SmpCacheProperties.
+#
+# Since 9.2
+##
+{ 'struct': 'SmpCachePropertiesWrapper',
+  'data': { 'caches': ['SmpCacheProperties'] } }
-- 
2.34.1

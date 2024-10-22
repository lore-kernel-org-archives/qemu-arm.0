Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083295njb;
        Tue, 22 Oct 2024 06:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaE5IYRU6eBKE9ol5JB9JINQV5udca9QdRa/5K2Yar0CIVOpn9f/DaAxjJa0PPpZg4TwK2dWEUzHX+Pg==@linaro.org
X-Google-Smtp-Source: AGHT+IEVsHOfuryxwGWUs+CHRfHRuaDvVQwADShWGOo+o70xqcgKrrQRoPIFFmF3vpCQOPtxaxNv
X-Received: by 2002:a05:620a:4406:b0:7ac:b197:3004 with SMTP id af79cd13be357-7b157b6b107mr2135842785a.29.1729604183722;
        Tue, 22 Oct 2024 06:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604183; cv=none;
        d=google.com; s=arc-20240605;
        b=EDVMfLRfhLPXKQcqw/xvM2yHdcM3QGixhcN1QS4YzHBbtq6/Dc7dWk/BvUpn7vqc/J
         r9+bTMjEpkQOGKGc0Xb05nQbtP0FUELsC6bOWc32aiYHmgFcLZeWx+wf+Mga0q/9E8Ks
         TKaiYcbRil4MHMUQrGt6c3lJj3CsOhgj2WJyuVAMtwYXOsEo2qBBLesAg9MQRJx6bR0w
         bO+EG1159jytu6xrdd35fHiGJmsjtHW8ITHByI8gyXCAibX0Mq3jhfWoYBR48VGlslbm
         t96wQSFbUKlJIw02wWn/LMX3m70KA3/P0qaBkdYDLVjDCJWauPd499y85fvaCEB/ELoL
         T/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i7uJM22T5bOVa+L5xeTjePj6Cer9Lchwgp61z1cyiXQ=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=Gq0MEjKxa4NIsd4q1BKAzVV8MMCrGQ2v9o60t9xA1x0N58BTkog5ogaWs2Gjheyuap
         JbDHcPejzr1uLsK31GcoORDiyF5hSxBwWOxbFvfzwKkatTfzKbKaE3Fgpsv6n4JAslbA
         nck3qbzZ52sLNQkNZ5vl2m9Um/tWYp66eMU76gESSsaF7oL1tryc5TNPULd7bHGijQpD
         GhkK2isLWsRaR+FVXawSbFWV8ikS5GdCTk7CdRoMrqReyXU/Y+o6QkC5eT3h/r+loaYB
         CCrYRgt/LBbw8M6gh2x/mOssKFIJ8gee7CxvxfhUafvRCZO4+htGNPC5DQP3PlGmupd4
         rDYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=jUc9M0AN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=jUc9M0AN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604183; x=1761140183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UxShiMoLv5ztumoy5EWz7J8OcY/aVPzZnSshl0fwQyY=;
  b=jUc9M0ANU78i+9D9eLGzR0V+KwUnTWq+/UQSIy2yxqlJtvr+oKmOFW1n
   ZTu+bXWUQAFfWU3eXEZGiw9iA+Tq1G39JZ34dIgBHSOaH4ZFyxNFussVH
   wHVx/wi9/PnOvJcWVNJT1MyAAx7oJRUH08Dr4Ah7SA42cSa4vgPFsOnOr
   7VhHpafaKPkQejK0xYeW76h8b/CMsf07Bspe8Fqmfj6g+jGiqctvVEXzT
   3AdWn0uHr5dB2fpSpSTmsyLwfBivs7basNbPhQnihELIhjYJllEVdtGdH
   1Ogo5cvxNROEPNhW/sy89WSJpBEyO/2R16xXjjtH1N4LoXDfngC6aHIAh
   g==;
X-CSE-ConnectionGUID: zucgpucjR2ywQQYVgA6u0A==
X-CSE-MsgGUID: +lmNG1ZzRQKQdL5ANT9VPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603667"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:22 -0700
X-CSE-ConnectionGUID: nugYYcSVQbC7Rdl5GFbc9g==
X-CSE-MsgGUID: LnksyR5YTVerAb/ci842ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782308"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:17 -0700
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
Subject: [PATCH v4 3/9] qapi/qom: Define cache enumeration and properties for machine
Date: Tue, 22 Oct 2024 21:51:45 +0800
Message-Id: <20241022135151.2052198-4-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eaFLK7q3Bax5

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

Also add the helper to access/update cache topology level of machine.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Suggested by credit:
 * Referred to Daniel's suggestion to introduce cache object list.
---
Changes since Patch v3:
 * Dropped "invalid" level check since now we don't enumerate it in
   QAPI. (Daniel)
 * Added a helper to update MachineState.smp_cache (
   machine_set_cache_topo_level).
---
 hw/core/machine-smp.c    | 37 +++++++++++++++++++++++++++++
 hw/core/machine.c        | 44 +++++++++++++++++++++++++++++++++++
 include/hw/boards.h      | 12 ++++++++++
 qapi/machine-common.json | 50 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 143 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 5d8d7edcbd3f..c6d90cd6d413 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -261,6 +261,31 @@ void machine_parse_smp_config(MachineState *ms,
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
+        /* Prohibit users from repeating settings. */
+        if (test_bit(node->value->cache, caches_bitmap)) {
+            error_setg(errp,
+                       "Invalid cache properties: %s. "
+                       "The cache properties are duplicated",
+                       CacheLevelAndType_str(node->value->cache));
+            return false;
+        }
+
+        machine_set_cache_topo_level(ms, node->value->cache,
+                                     node->value->topology);
+        set_bit(node->value->cache, caches_bitmap);
+    }
+
+    return true;
+}
+
 unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
 {
     return ms->smp.cores * ms->smp.modules * ms->smp.clusters * ms->smp.dies;
@@ -270,3 +295,15 @@ unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
 {
     return ms->smp.threads * machine_topo_get_cores_per_socket(ms);
 }
+
+CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
+                                              CacheLevelAndType cache)
+{
+    return ms->smp_cache.props[cache].topology;
+}
+
+void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
+                                  CpuTopologyLevel level)
+{
+    ms->smp_cache.props[cache].topology = level;
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
index 5966069baab3..f7591d54a3d3 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -44,8 +44,15 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
+void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
+                                  CpuTopologyLevel level);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
 
 /**
@@ -369,6 +376,10 @@ typedef struct CpuTopology {
     unsigned int max_cpus;
 } CpuTopology;
 
+typedef struct SmpCache {
+    SmpCacheProperties props[CACHE_LEVEL_AND_TYPE__MAX];
+} SmpCache;
+
 /**
  * MachineState:
  */
@@ -419,6 +430,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    SmpCache smp_cache;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/qapi/machine-common.json b/qapi/machine-common.json
index 1a5687fb99fc..298e51f373a3 100644
--- a/qapi/machine-common.json
+++ b/qapi/machine-common.json
@@ -60,3 +60,53 @@
 { 'enum': 'CpuTopologyLevel',
   'data': [ 'thread', 'core', 'module', 'cluster', 'die',
             'socket', 'book', 'drawer', 'default' ] }
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

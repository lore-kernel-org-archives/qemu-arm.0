Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp625132njb;
        Sun, 8 Sep 2024 05:43:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUE0ec/d4SkEtIq3mGkWxtf09T75zJ0r/VOyxjWN91BIoNZVSfywCJ77j30nyRzQa/yWV7GoTz+6xdSdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFcw98lc4Ko8icOgK0L01ecN1yDZxJso9MgH5VkReLl+KY8UnLaPZREqYAdtwcDZ+H4T2Kj
X-Received: by 2002:a05:6102:2ac6:b0:48f:e62f:8863 with SMTP id ada2fe7eead31-49bde1750f5mr10686200137.2.1725799424512;
        Sun, 08 Sep 2024 05:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725799424; cv=none;
        d=google.com; s=arc-20240605;
        b=YZFiAxSQByahG+NK/pJ6mpeWdvbCOLILzdwh8ySpIX3hUOfcXBi34bBdMeAkVpN+Qd
         veIM9nwtNPHRU3ytmupKGhsid0yizCNwtawmwVKN7ZEroppnpNJm5yBrNymhBuf/cY2k
         zSWeW2Nc7o4OoPfjM6HYx7mq2XH/phnoTCHqG30JcNWTaiNO6+AY896cxocr67hIIVgr
         jxdzvBlJOeexa9cpk32olyIhWe1MZIb054J18i4T5tgvQ+ckGIaxcI8+OlRnMKRrcGX7
         J3fPDTgvwnZ+cz8aKzQ/vFYIOhtAfnc+iChhkgFafS/MQkOeBo9iQL0yZCUdzeOs9MzU
         BZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1OkcmAi7PdcGK3Hewbz3hC8uV56w7yyw/amah65vXpM=;
        fh=0cJcinrZnucqYjSNYncb6+eMGja84j/gs35YiXtiMHU=;
        b=ZrBHzhe8Wo54/S80+NtgCyDH9iClADP2rfZHU3Pa8+jfoa3P3TwzGrAEydDTAEmnKI
         tlrvnUrL7SXbPaYm1NwN4AfCFRJiJTwqWy35hgANNorLqKcKNV+2Ls+tF7woSSk979Zu
         nFXkV0ykatNNsu8+VijNzWQEGMNms3F/tV4N5+T4gzIVOuiJLIWVOCvtg5Hq5ZtrcDC8
         hFYv7FbpXIStVD7g9BLPAyzcI3ZVrJw01JVQGJhmAIIeMCj4UgZOU/IIA7I7erGJp6ui
         Hp9qOxUy92odth18WpdqfXoVWBP34puEXAx+lTlaTdHNfTQZHefSzh9vBVAnF/NftqdX
         sKbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MYR3OZnW;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534787b9dsi31732186d6.435.2024.09.08.05.43.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 05:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MYR3OZnW;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799425; x=1757335425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BvJHpJ3VnH6FTy0YX6zsYzLEo6pd3YTqpGtex2MXUQQ=;
  b=MYR3OZnWB1bIKuOc4YE9PMYX7HQ93F9uNlPjoMF5/P/bwOYQhglCZhsu
   Qkav2vPy2ZtiAyP35DeLIWK70GoUufSVtjEmFd/D/g2SxX5pE/xFv3mau
   NEclRMIEPZCWM3hQRBCcS1cPuRJWqBZklqWQFJqiMOl4Y1J63OQkh7iqe
   rXgguzW/m5/VkiJUtPaFOPMx8QC9wzV5EFr2k1wcN06iMCRKLC7L1UKRJ
   6AuUHpptmVdHq5UHNQ78zFRPnBa9gZvFApKHNlw5oGscaFkpDaY0Umsak
   5gMBewFLM0gOakUPLzC1Fj5cHRI/rGecjXnho8EqySNRJhFa7mNBEuE88
   Q==;
X-CSE-ConnectionGUID: CiGbbTBLTWCOlFeBMLQ90A==
X-CSE-MsgGUID: aEakfTK9SwC2s2G8PW4qXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28238162"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28238162"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:43:44 -0700
X-CSE-ConnectionGUID: ae3sS5fNRvCsQBpoVcUQAQ==
X-CSE-MsgGUID: IwRKVVKtQM+aR2pi0qKjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97196546"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 05:43:38 -0700
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
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 3/7] hw/core: Add smp cache topology for machine
Date: Sun,  8 Sep 2024 20:59:16 +0800
Message-Id: <20240908125920.1160236-4-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240908125920.1160236-1-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XEGR+L9O4Ph/

With smp-cache object support, add smp cache topology for machine by
linking the smp-cache object.

Also add a helper to access cache topology level.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
---
Changes since Patch v1:
 * Integrated cache properties list into MachineState and used -machine
   to configure SMP cache properties. (Markus)

Changes since RFC v2:
 * Linked machine's smp_cache to smp-cache object instead of a builtin
   structure. This is to get around the fact that the keyval format of
   -machine can't support JSON.
 * Wrapped the cache topology level access into a helper.
---
 hw/core/machine-smp.c | 41 ++++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c     | 44 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   | 10 ++++++++++
 3 files changed, 95 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 5d8d7edcbd3f..b517c3471d1a 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -261,6 +261,41 @@ void machine_parse_smp_config(MachineState *ms,
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
+                       "The topology should match the "
+                       "valid CPU topology level",
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
+        } else {
+            ms->smp_cache.props[node->value->cache].topology =
+                node->value->topology;
+            set_bit(node->value->cache, caches_bitmap);
+        }
+    }
+
+    return true;
+}
+
 unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
 {
     return ms->smp.cores * ms->smp.modules * ms->smp.clusters * ms->smp.dies;
@@ -270,3 +305,9 @@ unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
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
index 9a492770cbb9..64439dc7da2c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -43,8 +43,13 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
@@ -363,6 +368,10 @@ typedef struct CpuTopology {
     unsigned int max_cpus;
 } CpuTopology;
 
+typedef struct SmpCache {
+    SmpCacheProperties props[CACHE_LEVEL_AND_TYPE__MAX];
+} SmpCache;
+
 /**
  * MachineState:
  */
@@ -413,6 +422,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    SmpCache smp_cache;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
-- 
2.34.1

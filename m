Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333356njb;
        Wed, 3 Jul 2024 20:00:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCJxOzv5wUDmhylXEPNWVyVUAk4+oE84FRtDMtiLsE2M5UKkVCCTgzI4vieEYDT/W04LeWeRWublH+YErZMFtuRLIgzinS
X-Google-Smtp-Source: AGHT+IFgt7pApQ0wS+rWraal46htu50EhZapw4eNvVquT9h2mi5DyJlhBCYzhmXahGmTby3Qs7gh
X-Received: by 2002:a05:622a:1345:b0:446:4730:f19d with SMTP id d75a77b69052e-447cbf8c6f4mr4908971cf.58.1720062055796;
        Wed, 03 Jul 2024 20:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062055; cv=none;
        d=google.com; s=arc-20160816;
        b=EE8HLOpfdiiqZ+s2QCBynoHHBAAS1itjF45si/TxA3ztG5TM/ui4dT0pU8nMvdxBur
         kU5bdh8hk21kNHIn1g4NGDmu/5kWKkGpL9vdLpBszx25QjbbkKl9ZuEAAz7s6UtMs4ge
         JoRh27e6pkEBYP6oPlHHgCYobQwIrqhJ/OfOzn6DEic9Ds5AnMJ/3plVTAr2d3HduMFD
         s5eBDQ9FH4YfhzEFwm8bVrdUOP0otlBRz/XzY5DZFGfTEVSI5FDD0fvZyufBMxbA3fi2
         omvT8M18hvxu2L+UTByzGL1bcxX8DogmZc+aH0IQEyBRhjtyiwVuUKF5dTtbh4Of//ks
         JflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mh6kynHU5duf4Ird5CA1dJ6n44vNVPeQte/7WKmRRZY=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=nuc4nGa9j1QfRgzXmj3pLfjhGfknq/4EFM7YJUbihUGgpevw3w9Qpw3SVzfsvgMq58
         +Zcyc3Ei5LW/8lqxBofkgab1zwyiLTCOznxR4lxlqb7BbpE3KZ+gF77vs1zfcT2+Md8o
         OlH3OhF9VDYYH3tMQRN9t44UoBi0DdhL2uqEm6Q1xIOshsbXxettQyWNMMfKUQhR+GrR
         +S6YrppYYoxxKaByQJ0rUnkmUhClAqbGg0XmgLGiD+fHWbJRKtHzCfLyT3ylzAL2e5Q8
         wFnti9wpuzXM25RF7OMT+lIDHCroaOscdUI3A3AOo/DQ7vg8y9xbFOZAZuuYfz7JQL6i
         JerQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="E/iVDOuK";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f7bsi141580431cf.89.2024.07.03.20.00.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="E/iVDOuK";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062056; x=1751598056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cJpn7XSiZ7Mb8L0aHM8P5RDmFvQhG9OIMsLWeDo6r70=;
  b=E/iVDOuKuX8VS27EcGgtf1cQ1zYOp0BO9L3UWqq/jg+hrS22791Al4t3
   NbIMT/+WcYG+LhgygX3SxTFq61xYlghMo8LfZmfa9+nciBlJS7BMMses+
   OcV7XSSRdkY1DZXhc39YapxNz1dqoZE6x9ZU+j7Jk3Z9REKbhuilVe8Dd
   6O1A6+g8nzygdnniWJktI3SHcoHnACij33EkMJL2og3pGIclokXy4SmLA
   4E6fflY/VkbglF/TAs18o4MKsdAscjhw/2rqw5RiFjf05CZoJxAOXzf2Z
   eP+e264GBKY6bEWIaCONhjHadkGyp4eUBpVni9CX1OR7AkmSB5tmM7m03
   Q==;
X-CSE-ConnectionGUID: onUqkyvlR/eKICP3V0TXkw==
X-CSE-MsgGUID: q9mdUeD1QSik/MpgD/f5UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838123"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838123"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:00:53 -0700
X-CSE-ConnectionGUID: ng4MCgfcS9SjCwgQvP5iWg==
X-CSE-MsgGUID: AHgzNJo6RNOHpJb5KadZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052298"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:00:48 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
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
	Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 4/8] hw/core: Check smp cache topology support for machine
Date: Thu,  4 Jul 2024 11:15:59 +0800
Message-Id: <20240704031603.1744546-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tR7KW2LKjL5P

Add cache_supported flags in SMPCompatProps to allow machines to
configure various caches support.

And implement check() method for machine's "smp-cache" link property,
which will check the compatibility of the cache properties with the
machine support.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since RFC v2:
 * Split as a separate commit to just include compatibility checking and
   topology checking.
 * Allow setting "default" topology level even though the cache
   isn't supported by machine. (Daniel)
---
 hw/core/machine-smp.c | 80 +++++++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c     | 17 +++++++--
 include/hw/boards.h   |  6 ++++
 3 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 88a73743eb1c..bf6f2f91070d 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -276,3 +276,83 @@ CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
 {
     return ms->smp_cache->props[cache].topo;
 }
+
+static bool machine_check_topo_support(MachineState *ms,
+                                       CpuTopologyLevel topo,
+                                       Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if ((topo == CPU_TOPO_LEVEL_MODULE && !mc->smp_props.modules_supported) ||
+        (topo == CPU_TOPO_LEVEL_CLUSTER && !mc->smp_props.clusters_supported) ||
+        (topo == CPU_TOPO_LEVEL_DIE && !mc->smp_props.dies_supported) ||
+        (topo == CPU_TOPO_LEVEL_BOOK && !mc->smp_props.books_supported) ||
+        (topo == CPU_TOPO_LEVEL_DRAWER && !mc->smp_props.drawers_supported)) {
+        error_setg(errp,
+                   "Invalid topology level: %s. "
+                   "The topology level is not supported by this machine",
+                   CpuTopologyLevel_str(topo));
+        return false;
+    }
+
+    return true;
+}
+
+/*
+ * When both cache1 and cache2 are configured with specific topology levels
+ * (not default level), is cache1's topology level higher than cache2?
+ */
+static bool smp_cache_topo_cmp(const SMPCache *smp_cache,
+                               SMPCacheName cache1,
+                               SMPCacheName cache2)
+{
+    if (smp_cache->props[cache1].topo != CPU_TOPO_LEVEL_DEFAULT &&
+        smp_cache->props[cache1].topo > smp_cache->props[cache2].topo) {
+        return true;
+    }
+    return false;
+}
+
+bool machine_check_smp_cache_support(MachineState *ms,
+                                     const SMPCache *smp_cache,
+                                     Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    for (int i = 0; i < SMP_CACHE__MAX; i++) {
+        const SMPCacheProperty *prop = &smp_cache->props[i];
+
+        /*
+         * Allow setting "default" topology level even though the cache
+         * isn't supported by machine.
+         */
+        if (prop->topo != CPU_TOPO_LEVEL_DEFAULT &&
+            !mc->smp_props.cache_supported[prop->name]) {
+            error_setg(errp,
+                       "%s cache topology not supported by this machine",
+                       SMPCacheName_str(prop->name));
+            return false;
+        }
+
+        if (!machine_check_topo_support(ms, prop->topo, errp)) {
+            return false;
+        }
+    }
+
+    if (smp_cache_topo_cmp(smp_cache, SMP_CACHE_L1D, SMP_CACHE_L2) ||
+        smp_cache_topo_cmp(smp_cache, SMP_CACHE_L1I, SMP_CACHE_L2)) {
+        error_setg(errp,
+                   "Invalid smp cache topology. "
+                   "L2 cache topology level shouldn't be lower than L1 cache");
+        return false;
+    }
+
+    if (smp_cache_topo_cmp(smp_cache, SMP_CACHE_L2, SMP_CACHE_L3)) {
+        error_setg(errp,
+                   "Invalid smp cache topology. "
+                   "L3 cache topology level shouldn't be lower than L2 cache");
+        return false;
+    }
+
+    return true;
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 09ef9fcd4a0b..802dd56ba717 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -926,6 +926,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     machine_parse_smp_config(ms, config, errp);
 }
 
+static void machine_check_smp_cache(const Object *obj, const char *name,
+                                    Object *child, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    SMPCache *smp_cache = SMP_CACHE(child);
+
+    if (ms->smp_cache) {
+        error_setg(errp, "Invalid smp cache property. which has been set");
+        return;
+    }
+
+    machine_check_smp_cache_support(ms, smp_cache, errp);
+}
+
 static void machine_get_boot(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
@@ -1045,11 +1059,10 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "smp",
         "CPU topology");
 
-    /* TODO: Implement check() method based on machine support. */
     object_class_property_add_link(oc, "smp-cache",
                                    TYPE_SMP_CACHE,
                                    offsetof(MachineState, smp_cache),
-                                   object_property_allow_set_link,
+                                   machine_check_smp_cache,
                                    OBJ_PROP_LINK_STRONG);
     object_class_property_set_description(oc, "smp-cache",
         "SMP cache property");
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 56fa252cfcd2..5455848c3e58 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -47,6 +47,9 @@ unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
 unsigned int machine_topo_get_threads_per_socket(const MachineState *ms);
 CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
                                               SMPCacheName cache);
+bool machine_check_smp_cache_support(MachineState *ms,
+                                     const SMPCache *smp_cache,
+                                     Error **errp);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
 
 /**
@@ -147,6 +150,8 @@ typedef struct {
  * @books_supported - whether books are supported by the machine
  * @drawers_supported - whether drawers are supported by the machine
  * @modules_supported - whether modules are supported by the machine
+ * @cache_supported - whether cache topologies (l1d, l1i, l2 and l3) are
+ *                    supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
@@ -156,6 +161,7 @@ typedef struct {
     bool books_supported;
     bool drawers_supported;
     bool modules_supported;
+    bool cache_supported[SMP_CACHE__MAX];
 } SMPCompatProps;
 
 /**
-- 
2.34.1

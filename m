Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp874558njb;
        Sat, 12 Oct 2024 03:28:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9O8PTOObjKFMXz8MAUY3UA/v53xG7uunB7XSJ5rLd0gNZz2TPFj71NYQkpfYzDgjxZnrKzqGlsVTBeA==@linaro.org
X-Google-Smtp-Source: AGHT+IFGaDVdVK8L6caNBha24a28PC3oYs9BR1AuOXQ1a33aWl1/GfxCU0zOsejDHqDwKaUvm4Hj
X-Received: by 2002:a05:6214:5692:b0:6cb:f87f:f2da with SMTP id 6a1803df08f44-6cbf87ff31dmr49766916d6.26.1728728929766;
        Sat, 12 Oct 2024 03:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728728929; cv=none;
        d=google.com; s=arc-20240605;
        b=ORORhtvSO/m+kkb/OVMYr3Nu07eCUkhzybewcqmt2kO/fyipX+wRzi+F3HMEik7GpR
         okYCgJQAA6HA2WZUnum/eOLBu2OgNAN7w1URietkjxgxxw6j03ZA3q4T86K+NXqqvHqX
         Bxm0P4i2FHl211nI7tyUYe6pzUquBgZHC7rNoTYRMcgp/QokMhYCFowoK/4s47hPC/JS
         zqU2DmcxkgQwC2IE1w+wv9rk3elez0ka/1K7NFilmP3RtLQphGWykYsGRvMCVhFtfy7V
         a7pPIQnY5O/vmj7gENpQcTKEWCIIxxz2mI4M7NLKStZf54vMplh7d+abGRX6uPxOTjjb
         AVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v8StVHJ883a8g52hv6EtZqFEaYuNLD2+2fCuHUgGAjE=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=QzQpXWAYVoGwIB7pkZE2Jcx/3Tx6E36NHeFwBbfFVZEGv0kkvAUbvyd8RYFgn7OF+0
         OXy0u9UrNoj20z6ET7H7K2nEDNn9KMMHA4pbDeffcItNKBUEJlXIdEXwjklPaVzSkCe4
         HrKFH0NBvAB+MXWCbge6FzzWPxV71VLY3dBDnMDcj6L+AvE8Nzz9nMhciTpIRjcEuMaQ
         KsOAKXGbzywaUT/Uc8V5nj1PyWur1SC8G95SkrZrIAQwD6wrJffkbPiA50M4vxLCxFHC
         +6DZX8AmvP3AJWwr/9SWDnBLNNjUCKmQC+wMqUm5jq5qfdGzNojYYAVgZvohbuE7zBqd
         IKmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TJCg3mzy;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.8])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e0783si58893326d6.189.2024.10.12.03.28.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) client-ip=192.198.163.8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TJCg3mzy;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728930; x=1760264930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J9p7Tdz/CDqM2wDqm/4H38Zb2VvdiGGpmWwRSF8KKYc=;
  b=TJCg3mzyIFTA4jWOwvoHeh/ToeW3OAJ6edCeWc94IDadbQRu3wH+DL1g
   XvNq/XSOubbNSUouTQGvEt14PznecV4YrV53t1Jp8YAiwj02AtxqWj1Vr
   0QycBvAC4j5hyCD+lqhcSlXLRIQ0vithM0dOiqr0FyRjD3GrXPhbYVkP6
   6Cy/eZGI+ZBi+zReKs7Wj3YtNhcKWu7VdSb8u9Ehqr9/cCsy1PEJDQlV5
   etljNtOsYKjxdu0CvU0StJF7XRUAzDScy7Bs2qqqn8g/WT0dkJWCrBp1s
   Bu/6Jo2wQcxTn6TgNf6W2kPdM4SEZXX/kQ9s7ATQyFuMQwqsCDFVCRAgp
   g==;
X-CSE-ConnectionGUID: Fm++QKHRQieP6iBrd6Vb6A==
X-CSE-MsgGUID: KbJyiRooQeuEpu7tE4xQyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45634885"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45634885"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:28:49 -0700
X-CSE-ConnectionGUID: 8jua+y5vSJuF4yaj4EUEng==
X-CSE-MsgGUID: 7F/JJOcZQjWrB5yLRjPEeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77050845"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 03:28:43 -0700
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
Subject: [PATCH v3 3/7] hw/core: Check smp cache topology support for machine
Date: Sat, 12 Oct 2024 18:44:25 +0800
Message-Id: <20241012104429.1048908-4-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qffd5p2BxQnx

Add cache_supported flags in SMPCompatProps to allow machines to
configure various caches support.

And check the compatibility of the cache properties with the
machine support in machine_parse_smp_cache().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes since Patch v2:
 * Polished the comment of "default" level check. (Jonathan)
 * Reduced short line wrap. (Jonathan)

Changes since Patch v1:
 * Dropped machine_check_smp_cache_support() and did the check when
   -machine parses smp-cache in machine_parse_smp_cache().

Changes since RFC v2:
 * Split as a separate commit to just include compatibility checking and
   topology checking.
 * Allow setting "default" topology level even though the cache
   isn't supported by machine. (Daniel)
---
 hw/core/machine-smp.c | 75 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   |  3 ++
 2 files changed, 78 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 1ce7be902e6e..f3edbded2e7b 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -261,10 +261,47 @@ void machine_parse_smp_config(MachineState *ms,
     }
 }
 
+static bool machine_check_topo_support(MachineState *ms,
+                                       CpuTopologyLevel topo,
+                                       Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if ((topo == CPU_TOPOLOGY_LEVEL_MODULE && !mc->smp_props.modules_supported) ||
+        (topo == CPU_TOPOLOGY_LEVEL_CLUSTER && !mc->smp_props.clusters_supported) ||
+        (topo == CPU_TOPOLOGY_LEVEL_DIE && !mc->smp_props.dies_supported) ||
+        (topo == CPU_TOPOLOGY_LEVEL_BOOK && !mc->smp_props.books_supported) ||
+        (topo == CPU_TOPOLOGY_LEVEL_DRAWER && !mc->smp_props.drawers_supported)) {
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
+static bool smp_cache_topo_cmp(const SmpCache *smp_cache,
+                               CacheLevelAndType cache1,
+                               CacheLevelAndType cache2)
+{
+    if (smp_cache->props[cache1].topology != CPU_TOPOLOGY_LEVEL_DEFAULT &&
+        smp_cache->props[cache1].topology > smp_cache->props[cache2].topology) {
+        return true;
+    }
+    return false;
+}
+
 bool machine_parse_smp_cache(MachineState *ms,
                              const SmpCachePropertiesList *caches,
                              Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     const SmpCachePropertiesList *node;
     DECLARE_BITMAP(caches_bitmap, CACHE_LEVEL_AND_TYPE__MAX);
 
@@ -292,6 +329,44 @@ bool machine_parse_smp_cache(MachineState *ms,
         set_bit(node->value->cache, caches_bitmap);
     }
 
+    for (int i = 0; i < CACHE_LEVEL_AND_TYPE__MAX; i++) {
+        const SmpCacheProperties *props = &ms->smp_cache.props[i];
+
+        /*
+         * Reject non "default" topology level if the cache isn't
+         * supported by the machine.
+         */
+        if (props->topology != CPU_TOPOLOGY_LEVEL_DEFAULT &&
+            !mc->smp_props.cache_supported[props->cache]) {
+            error_setg(errp,
+                       "%s cache topology not supported by this machine",
+                       CacheLevelAndType_str(node->value->cache));
+            return false;
+        }
+
+        if (!machine_check_topo_support(ms, props->topology, errp)) {
+            return false;
+        }
+    }
+
+    if (smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L1D,
+                           CACHE_LEVEL_AND_TYPE_L2) ||
+        smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L1I,
+                           CACHE_LEVEL_AND_TYPE_L2)) {
+        error_setg(errp,
+                   "Invalid smp cache topology. "
+                   "L2 cache topology level shouldn't be lower than L1 cache");
+        return false;
+    }
+
+    if (smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L2,
+                           CACHE_LEVEL_AND_TYPE_L3)) {
+        error_setg(errp,
+                   "Invalid smp cache topology. "
+                   "L3 cache topology level shouldn't be lower than L2 cache");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 0729066e353a..e4a1035e3fa1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -151,6 +151,8 @@ typedef struct {
  * @books_supported - whether books are supported by the machine
  * @drawers_supported - whether drawers are supported by the machine
  * @modules_supported - whether modules are supported by the machine
+ * @cache_supported - whether cache (l1d, l1i, l2 and l3) configuration are
+ *                    supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
@@ -160,6 +162,7 @@ typedef struct {
     bool books_supported;
     bool drawers_supported;
     bool modules_supported;
+    bool cache_supported[CACHE_LEVEL_AND_TYPE__MAX];
 } SMPCompatProps;
 
 /**
-- 
2.34.1

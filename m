Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp625150njb;
        Sun, 8 Sep 2024 05:43:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDqMZKgyK+/BKctwjKfvmJ6qn6waZJdps5UoYEEoG+GYvVEeTsRZNPIEvpidxK0UNJsGJAZvlIIqZNNA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2PyuLgYP7oDACQDX+JPWNkB3v7Cu41y6FkVeqAyOvv/Fcm7qGxekke3RWt/gL5MjAZ4bC
X-Received: by 2002:a05:6214:3205:b0:6c3:5b9e:699d with SMTP id 6a1803df08f44-6c5282fa26bmr106648786d6.2.1725799429814;
        Sun, 08 Sep 2024 05:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725799429; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4J84bJx9hXniPK501CTdKkeQY8YL0M2dRC8uo0ai1u2nBsWFMcISPRLlbyO0ciEkP
         yKa0UT6lbdQvcPlAVenh9hqIoF5dXyowDi+1N+tiFIge0mfjRA76gXcL7W2Dis4ERfnS
         ydlQd8cHLBrtc0KAl4cubOq1bjAR3d4GfsOjdyeKg6CgBI+7spVbpVcMGdvbrvmsmm0G
         pKeD2OII9275fyktqsKLevnb8JRtDhRJLDeiPjbina5EyhExZ8QZacfDD9cjlhFe1G1w
         hYBvuf/TiLj9zwbCA8vzZHFPmv9I9vXyhwYTKuLsKt4SNrlOq68EB8XwfZW3gEEYG7Qy
         GVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AmAkDe65mvRR5LBnNPE7sNGbYpAIzWcBzQKiQQW1FgU=;
        fh=0cJcinrZnucqYjSNYncb6+eMGja84j/gs35YiXtiMHU=;
        b=NZ9oxRMj+PkXgk/b5JhArnP8HX5fIYlQHzgZoxkk7JHqNGdT6o0Rs4zwp84DrGEnoe
         zkGunZOaqj4u7+k5BD7Ky78pUVvBVbMaMkUIfF7FTO2F+CF620cmawukP1OFU/FAb7kt
         lLK/l26kkj37EVKSA0w3t/g2kUwSooueGmRXjc6m26qIwkzUlLNSO41Gw3vTBaOhlHD5
         gQ4x8VmhEDfK92wKaRSXtaqtVDCBSXYUT3w2fraUs+N71aMP+c37aYiLfBa+VFwrD78Z
         BrL7HN29SIK6qKpkUF2I3BRmogRP0z1U9witGVrl9DJiSDt296neBOUlwUrITfE/906I
         orRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=F6Uv4NeH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534787b9dsi31732186d6.435.2024.09.08.05.43.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 05:43:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=F6Uv4NeH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799430; x=1757335430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fLVPMHMbGbgr75ZVdN2bSb3F9f9e89UFzrkPV2gAPm8=;
  b=F6Uv4NeHRoL5qtoL7uvPuk2O7epuyeB1Rpz27cqMZNmiqnyw4KQNJGdE
   y4vFwNDKrZNABswy4Lm0BhAeiz9GhXdjk/nskKUbmUmcZ4EUIKwdqbnm2
   nBoeHvtELhP+7cyN9JfkG78052wQIFFd8rREhiqmkh6KlueYB1jEegGYZ
   MM0qGGfdce/85B3NTQrCbQVc1P0yHyDL16iOIlFV6CP/FK9bBdhnfyLrs
   wHYAlltdj2QAxW3sulUweQyPhvwXlkOVDpf2JopgZ7h3pElcWEAtIbETZ
   zoS9y2tT5ujg10hCu5H5wVtmugh1P93BvsL+OIFe5MMDxKhLP926iSoaJ
   A==;
X-CSE-ConnectionGUID: zJPE3DjDTeKX/XLX95CpbQ==
X-CSE-MsgGUID: Mp1HlRfgQC6UUEVo3A43Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28238182"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28238182"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:43:49 -0700
X-CSE-ConnectionGUID: diEO//HXSLaEty83F5KDtQ==
X-CSE-MsgGUID: 5rBdS2Y5RB28Y9qO0dYIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97196586"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 05:43:43 -0700
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
Subject: [PATCH v2 4/7] hw/core: Check smp cache topology support for machine
Date: Sun,  8 Sep 2024 20:59:17 +0800
Message-Id: <20240908125920.1160236-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240908125920.1160236-1-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Nq5QncnWIEQv

Add cache_supported flags in SMPCompatProps to allow machines to
configure various caches support.

And check the compatibility of the cache properties with the
machine support in machine_parse_smp_cache().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
---
Changes since Patch v1:
 * Dropped machine_check_smp_cache_support() and did the check when
   -machine parses smp-cache in machine_parse_smp_cache().

Changes since RFC v2:
 * Split as a separate commit to just include compatibility checking and
   topology checking.
 * Allow setting "default" topology level even though the cache
   isn't supported by machine. (Daniel)
---
 hw/core/machine-smp.c | 78 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   |  3 ++
 2 files changed, 81 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index b517c3471d1a..9a281946762f 100644
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
 
@@ -293,6 +330,47 @@ bool machine_parse_smp_cache(MachineState *ms,
         }
     }
 
+    for (int i = 0; i < CACHE_LEVEL_AND_TYPE__MAX; i++) {
+        const SmpCacheProperties *props = &ms->smp_cache.props[i];
+
+        /*
+         * Allow setting "default" topology level even though the cache
+         * isn't supported by machine.
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
+    if (smp_cache_topo_cmp(&ms->smp_cache,
+                           CACHE_LEVEL_AND_TYPE_L1D,
+                           CACHE_LEVEL_AND_TYPE_L2) ||
+        smp_cache_topo_cmp(&ms->smp_cache,
+                           CACHE_LEVEL_AND_TYPE_L1I,
+                           CACHE_LEVEL_AND_TYPE_L2)) {
+        error_setg(errp,
+                   "Invalid smp cache topology. "
+                   "L2 cache topology level shouldn't be lower than L1 cache");
+        return false;
+    }
+
+    if (smp_cache_topo_cmp(&ms->smp_cache,
+                           CACHE_LEVEL_AND_TYPE_L2,
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
index 64439dc7da2c..6c3cdfa15f50 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -150,6 +150,8 @@ typedef struct {
  * @books_supported - whether books are supported by the machine
  * @drawers_supported - whether drawers are supported by the machine
  * @modules_supported - whether modules are supported by the machine
+ * @cache_supported - whether cache topologies (l1d, l1i, l2 and l3) are
+ *                    supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
@@ -159,6 +161,7 @@ typedef struct {
     bool books_supported;
     bool drawers_supported;
     bool modules_supported;
+    bool cache_supported[CACHE_LEVEL_AND_TYPE__MAX];
 } SMPCompatProps;
 
 /**
-- 
2.34.1

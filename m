Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp276850njc;
        Fri, 1 Nov 2024 01:16:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/Tqi1e0ZbE5KYil1O2H5+boyLESqBv+6jvcdekusHf78efAuRGijy/tILadW4PnlgXLNljYXZfc280A==@linaro.org
X-Google-Smtp-Source: AGHT+IF0XhamYjrtNFUAzXCwUCxDpe+yTJqgWgowH3uq53s+WfMAmxgK/UlqmuiM762KpPmQpYAy
X-Received: by 2002:a05:6122:459c:b0:50d:60fa:183e with SMTP id 71dfb90a1353d-5101535c8bcmr20364556e0c.11.1730448988314;
        Fri, 01 Nov 2024 01:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730448988; cv=none;
        d=google.com; s=arc-20240605;
        b=dcBZ4AamZTZKrXBoYncGf4ygtgEevswyJDL9wI1Yp+2h+bptieWQE+Y9vyjoaMeSCS
         d32SP+N/xHxQnkhnBNxko6nGbjmEJfPTjtlbs+zLuxL1ULJHY/QPQtOoH1Q/DBb8LqEZ
         J+lEsTZi0jJPzIjWf7A1OtGI9bnszMk5w3RhcyADmyq4EdWGn/TDXYEnuMdXFpVpC3EZ
         zXREKSoDkCig3Hky9Ow6KhkJgeyIalgilBKGaZWKqKilcZvE9W2WQCyquEECsIOB4iPn
         hSQA1J25gWZmNjpnG4yo30dw5CW8KfaZ9AsANVOOmkZ/oD+jfY3rX5cU9CtAOnddz4FK
         FA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=itRaEr/XsF9bGlPE2DrzET5pFML3RVQ8gp57mqsEmRE=;
        fh=/Q7DFfK0c6lcL5pNzN/8+EzqG4IF+hoXAsi0Ur0bC2k=;
        b=JI10smGXU0AeM+LVUM0kRBbn5UUl3sCI9sj34acfh87FLlWQTyhQMtCgHBZwR1jLqi
         H8C2lmdSnXk5K/Xe4jJBtp4OqtuSK7MNfMQ1sBLVDI4QEhZkamkqTGvkxYcqxr/daO7M
         e5XkhPC8wOaowA2jfqFQBJeZnVezq4PorlSI7Huoq2FW7GVIHpBppnxIfsn+YDYiLvxM
         nDOfqWNJXcyRUDLYI20v1F50WxiPgLQkm5jycF66zfp3sTZvmHdKv2x76zqpspgGHH2p
         0BJaWVWqlj1GJ612lscB2I1LPGWKe/Zevi4RhZKBSWkuiJfSbl82el4d/J/ADJyge6d0
         gCJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PUVHH3dj;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fe4csi37605786d6.382.2024.11.01.01.16.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PUVHH3dj;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448988; x=1761984988;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hWW510RNnBQVWsS5NN5EuNjpKq2iNzrMpdnodY3x60Y=;
  b=PUVHH3dj+HgL+zXhmvOtRq/3CWt3/NuOUnUF3QMM0y0acEvlvwq+RhyG
   ArmMEAGLL9SuzzCgiCH2TG1EIzStl9SWh2eoctj1mtOs8tHTOgvWZu9DX
   rnLwgniJJjNPucASKwF6OVHiYhGRJe01IBYh02xVLWr0aYC6Gm7Q4YzvJ
   noN+ak6lSSMh0F7f5X8Ec5kg/VJqP7Pysgsda3wiQYHgRiQhVfUZ71bie
   id6iC5W/G9nXeuns35oEdNCBqWq4PkouYWxbzj8WQGanp3rSJFNHA+Rjr
   1h18TIOImvPCo5zE9me2XroHVOmi4NAc1xvdgOcHqmmflZO1Mlf4pDXCO
   A==;
X-CSE-ConnectionGUID: eEdtjlVcSzuNRgOGYFTN7Q==
X-CSE-MsgGUID: oQe4ygKASceueRhVfnfRnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17846052"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17846052"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:16:27 -0700
X-CSE-ConnectionGUID: p/96yex/QsCHlmwk96VuAQ==
X-CSE-MsgGUID: bNhx6skIRDeQj4RNqMaPAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834620"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:16:22 -0700
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
	Alireza Sanaee <alireza.sanaee@huawei.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v5 5/9] hw/core: Add a helper to check the cache topology level
Date: Fri,  1 Nov 2024 16:33:27 +0800
Message-Id: <20241101083331.340178-6-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /pgyq1o48siX

Currently, we have no way to expose the arch-specific default cache
model because the cache model is sometimes related to the CPU model
(e.g., i386).

Since the user might configure "default" level, any comparison with
"default" is meaningless before the machine knows the specific level
that "default" refers to.

We can only check the correctness of the cache topology after the arch
loads the user-configured cache model from MachineState.smp_cache and
consumes the special "default" level by replacing it with the specific
level.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes since Patch v3:
 * New commit to make cache topology check as a separate helper, so that
   arch-specific code could use this helper to check cache topology.
---
 hw/core/machine-smp.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   |  1 +
 2 files changed, 49 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index ebb7a134a7be..640b2114b429 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -348,3 +348,51 @@ void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
 {
     ms->smp_cache.props[cache].topology = level;
 }
+
+/*
+ * When both cache1 and cache2 are configured with specific topology levels
+ * (not default level), is cache1's topology level higher than cache2?
+ */
+static bool smp_cache_topo_cmp(const SmpCache *smp_cache,
+                               CacheLevelAndType cache1,
+                               CacheLevelAndType cache2)
+{
+    /*
+     * Before comparing, the "default" topology level should be replaced
+     * with the specific level.
+     */
+    assert(smp_cache->props[cache1].topology != CPU_TOPOLOGY_LEVEL_DEFAULT);
+
+    return smp_cache->props[cache1].topology > smp_cache->props[cache2].topology;
+}
+
+/*
+ * Currently, we have no way to expose the arch-specific default cache model
+ * because the cache model is sometimes related to the CPU model (e.g., i386).
+ *
+ * We can only check the correctness of the cache topology after the arch loads
+ * the user-configured cache model from MachineState and consumes the special
+ * "default" level by replacing it with the specific level.
+ */
+bool machine_check_smp_cache(const MachineState *ms, Error **errp)
+{
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
+    return true;
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index cda12070fc52..e07fcf0983e1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -53,6 +53,7 @@ CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
                                               CacheLevelAndType cache);
 void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
                                   CpuTopologyLevel level);
+bool machine_check_smp_cache(const MachineState *ms, Error **errp);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
 
 /**
-- 
2.34.1

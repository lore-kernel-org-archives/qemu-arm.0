Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp276828njc;
        Fri, 1 Nov 2024 01:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhXAq3hA8bgBcXnwS7sbjK9m5Nqgz077jQ/4Pv9XQF+anRCxwApbwrids7iQuycFB6oGboSqC1Pxwx5A==@linaro.org
X-Google-Smtp-Source: AGHT+IErNkDv3ptCpcoqzQRXZDeORr6cLD+R0AeFaHu30EFm2ZXFTfPpUilCOqJ09/y2dhQoOqIi
X-Received: by 2002:a05:6214:4408:b0:6cc:1dd9:290 with SMTP id 6a1803df08f44-6d18584d51fmr300164946d6.40.1730448982961;
        Fri, 01 Nov 2024 01:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730448982; cv=none;
        d=google.com; s=arc-20240605;
        b=hsREE78klC8nuTnN7aj5TQlsT7XpHVzHt3NGcJ7BpUuW+WTHt7nilLWNRavVjXZ62k
         Lt56bqmH3lpLmkxmFUoQQAycIq2JtMrB+Szf+kTBeJT9t009nU1Nilw/vM6G4/5J08Vf
         DNU3LjGP2ILpgYP6gayIGjTRKjk+HOt7DqM92DalHq9Bxmqld0MBT3IkHsGpBrwCBie5
         hsdWhBuDLKfBlDWvS8Ovvgw7WcMYlAhW3eSbvg40HCCpEUWJJr2g0EY7jsn7j6OHv75F
         nSTSsOa0xu8w/a8lRzNevFoXcSUBaHk+zd7MCjp4PRrIeS601cUt9N/V26rkX9rJ/Q9z
         EG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0iFY51lH1D0hyX3RZp+N+Kc+7Fdj3kVCkhSxBN80RyE=;
        fh=eaTTmp+2XhStxW3y+BHQH9dBL4m34nwTlgFlQEpn70I=;
        b=kre59qyUSVRXpWKPtpzCJwcfP8MctyMgCPEPWJaWYNhBeEblsKjK1lPUgoziB6rKab
         RbxxsTck5/bWGYXCSSA5+ZpvvNIk8+bzE4Z0YZPKQZGA1IkhJP/0EiEYYd1idrI5p1v6
         8yM5+QfMCzEU8IA34KnnvFV0v2zLaLPL591Wo4pRdV46bjt5P4fhU6TRQRE/UQMH5RZg
         8QlDp4O+erEEV54HQVSvUFnbS81H4mx508Yt1ce3RwGQyy6ER1y6n/SBpfqKTVQ+9dl2
         y0oq/kbxLRNfvGRlJ/uwFz1k4MGerIHXnaww0/USkop/pMhXTlSf7WAGHy5JYAObu8+s
         douw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XufPBjki;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fe4csi37605786d6.382.2024.11.01.01.16.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XufPBjki;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448983; x=1761984983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E+zkEptv6x8nT44rXYHjEFJL+24l6aO0fCh+CMO/upA=;
  b=XufPBjkitYEGAzGJvmiik+gscLkHUWVH90IUmODl4L1PcTx/kByx+20A
   9Hi4mskED8RT9Qv75Yal7X2sBl1BSL+YEGmNvnzKpVdDgvKp1SGUHkLGK
   Xxm7XqmrSsub1ZEjm4x+HEx1GX8IEp+vDybqHet9iP3O+TOHhPPXmbBmG
   i7aFd2E8R/j1MMrUupqPs7BQOqdyqzMQ7ZOb0KtXlr3Ke6yFwz2pq+TFS
   jYOlJJ1l15jGoDTSrRZYviGVv4h4EITHP/ntZpOdsaDDWh71pLitmDWk5
   puHJdODiuJPGWelB+kL/fTsYl39ZhKU8FvjjWBhmgqWChEAyZlbJLwsOH
   A==;
X-CSE-ConnectionGUID: m7FyZm6DQu+TIdinQf+zrg==
X-CSE-MsgGUID: 9eV0BZVqQTaLup9ZI7srgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17846040"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17846040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:16:22 -0700
X-CSE-ConnectionGUID: lbUxUVPyRUaFO+h8PpQtzg==
X-CSE-MsgGUID: j7+CQvoERvCthoCj5OUWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834611"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:16:16 -0700
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
Cc: Yongwei Ma <yongwei.ma@intel.com>
Subject: [PATCH v5 4/9] hw/core: Check smp cache topology support for machine
Date: Fri,  1 Nov 2024 16:33:26 +0800
Message-Id: <20241101083331.340178-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: B/Gp4xjFF9w+

Add cache_supported flags in SMPCompatProps to allow machines to
configure various caches support.

And check the compatibility of the cache properties with the
machine support in machine_parse_smp_cache().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes since Patch v3:
 * Dropped cache level check because if some fields is marked as
   default, then we can't guarentee the hierarchies are correct.
   (Daniel)
---
 hw/core/machine-smp.c | 41 +++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index c6d90cd6d413..ebb7a134a7be 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -261,10 +261,32 @@ void machine_parse_smp_config(MachineState *ms,
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
 bool machine_parse_smp_cache(MachineState *ms,
                              const SmpCachePropertiesList *caches,
                              Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     const SmpCachePropertiesList *node;
     DECLARE_BITMAP(caches_bitmap, CACHE_LEVEL_AND_TYPE__MAX);
 
@@ -283,6 +305,25 @@ bool machine_parse_smp_cache(MachineState *ms,
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
     return true;
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index f12a727b4008..cda12070fc52 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -153,6 +153,8 @@ typedef struct {
  * @books_supported - whether books are supported by the machine
  * @drawers_supported - whether drawers are supported by the machine
  * @modules_supported - whether modules are supported by the machine
+ * @cache_supported - whether cache (l1d, l1i, l2 and l3) configuration are
+ *                    supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
@@ -162,6 +164,7 @@ typedef struct {
     bool books_supported;
     bool drawers_supported;
     bool modules_supported;
+    bool cache_supported[CACHE_LEVEL_AND_TYPE__MAX];
 } SMPCompatProps;
 
 /**
-- 
2.34.1

Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083355njb;
        Tue, 22 Oct 2024 06:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU212YSO/jCEH26ybHvUwkbfjuav0BIFES8g9IIZ0w/aEQZALLX0EmzLVp74cdqZoxY3YNSuHDasA+SXw==@linaro.org
X-Google-Smtp-Source: AGHT+IFIf91qbQ8ieP9eleE4VYiEmoIixe3ocrmC7d4eGTdAOTFNjQqTm1kTrJgrHZbMcDZrJnvO
X-Received: by 2002:a05:620a:404c:b0:7a9:b82e:723a with SMTP id af79cd13be357-7b1755d035dmr502772585a.31.1729604189757;
        Tue, 22 Oct 2024 06:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604189; cv=none;
        d=google.com; s=arc-20240605;
        b=iF/BnA8s6jUEoeOiuvR7zlsjbYc5MC0LX4xoM8h2naZ38BtPtzl56Hlvo+ifCufJm4
         JMU99ksT3bwgVSBrD6SVr4qQxJiYPPSXWKG1Hxvfml+ZFWfq2d04yOFnk5/MaLE5m41a
         8GAa6Cz8oolv2iuTxyfaUUBKyoFMHky1KL0UBd9dM1ToahiOt96vxvOWGCGbma3AxA7R
         3Tn2w8oFPN+SQo6WBaFvIUGhAkjozyUYKjmY/iziYoeRt9+uuTNN5PIsUUxF55hgwOrR
         dnoLPSZEeGsia9lRLUxW/TegrAn95x/uCrqMpxfM3b4I1KR29M2SaKa3LPu/rK+olWS1
         uBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F4MiQmOX12pmllMnAh6uoYCzzskgYMgszmBZuFMDfFc=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=jWAMrr6zJ8HoXGY1kDgAOrksT+IOmXSny3ihGPMacUNy2qqx8iuMgK0y0AT8YbWUnE
         YEaR40cpkwULCtdRW7oIbcX6of9Osx/n3oq6b7cv+7K2wDAG6yB9wNbqI3H7oUcRo5BN
         20wL3RLrPBe10tqTQThFcRahKTQj+xOdWyWFiTOE1RNC24gbBA3B/Y6CgmS0XS9qzOS/
         HYAS2B9E65WA+FZpNi2yZS8Ogs3AjrpEY0iGQeghe7+lDWTI8C0LonDN9kgbNqvFKDS0
         NwvEnPlOxJJSGWv9OBdSFDS8loGByVxalrP+W+dwvNrM7mgz38rOmUKYQ1AEkf0PlpaD
         iC9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GUoR4uDU;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GUoR4uDU;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604189; x=1761140189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v5TiGfpxtPYi3dX2SWWuKk9xXE8fMz5ejTsMCeSkh9w=;
  b=GUoR4uDUXHF3AesjWbqap15sVSIr2IIPZ72yikypqIf3l8jT/S7QFA/C
   fHkkpZxrnkRqUdJ+wHs3OZHdsSxxG3AYvlMLnRHPl9Mh5doUPtW6SwWf3
   GOfvpAhEytZsFFOD9MgViTfDx07hxcHtS5d3UH3sYLWBuqcIz1zX++RQp
   k6tjBCGaltef3qyOsciAxHDGTc1HDOekjS7oTANq8U5l4vXbnjIHL+yzj
   SmNxT1RgzAfmLG3Msc1J0z4dU9i5CrgEY0ccbTbWLoUpg/6OKVnnzqh3/
   wTZ6wSfeZSqFsYDDBcjZ4ixEmHPr6b3Rp13r68NNPuwZWY5336Oo7gtz4
   g==;
X-CSE-ConnectionGUID: SHDIpz78Qx6h1NB18mdXTw==
X-CSE-MsgGUID: Br8VKTOLQyeshH0UAfS+6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603683"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:28 -0700
X-CSE-ConnectionGUID: bbz1toxaTLeTW4jo0tZrGw==
X-CSE-MsgGUID: kKpqBDGMQhmbIvVHDl74SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782373"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:23 -0700
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
Subject: [PATCH v4 4/9] hw/core: Check smp cache topology support for machine
Date: Tue, 22 Oct 2024 21:51:46 +0800
Message-Id: <20241022135151.2052198-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1dEU4xmWtHig

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
index f7591d54a3d3..3d6cb5acd6c7 100644
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

Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333346njb;
        Wed, 3 Jul 2024 20:00:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFGjSu26uKhW7IxipyTdhfBUyB5YfoJBGdPUMgghtRHX+2VnBOk1NIqMZvoRdaUYVV6/nj4zKv4wweafMlh5wO8tI6HGQe
X-Google-Smtp-Source: AGHT+IERSgzIMHGaCj9wsZB3QR/RGLhC0sEEuBxYro5AKArYhBY8MUqMFEHPcx67E2/BwGd73D5i
X-Received: by 2002:ac8:5a86:0:b0:446:56d7:78b with SMTP id d75a77b69052e-447cbf20585mr5648781cf.22.1720062054547;
        Wed, 03 Jul 2024 20:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062054; cv=none;
        d=google.com; s=arc-20160816;
        b=JVDfWOAoJJ8suI8usCF2fomJ4Xrie3YETMHBLefXCehcPGix1kaPyPYm+GgJz6mA8u
         nQ86fTTOkqbIPaBYN6hMEf72GY8oWiSLxuzq5G13V+F979g4JTP8LGq0LNGIeu9ravj5
         A/neDOUSJSDPgLmQmQy8Oxs6/QMnRI6TWYzmZlFFXdyXICJ5ey792QLMQ6Z+RK3HGiLn
         aLKqEgM9Tojtz5pzu4eH0YFXJMCC56X+jmHzAYF8SWbkrjLV9SerdR3hIOLGreo9UW12
         FmeumvUgR8H2dDesv6Fr6gln3QFrNWyfUtZzB0roOiYWsN+93T9YDFV4mdUD8DClZNQ2
         S0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ex2axSXbbsEa8ad15ydVgfIqBTt/uHnXXLu3gxT4YI=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=yTp08XA0IBXLqpMlHyG2IDi8eMOqzoNJ8TKqAzhxruxduK/tSmWb1F7GyUSngVwTpi
         JibeYrT9iWo6GmzehcAWTSL1H8lYE6m+OgpUCFe+MdEADsHaUHvdTXxSeoOoHEmGD72K
         AxBLtYiPeGBIiQ1xy6J4xxQfRb4Ev8saePenBdjWRor//+bWGm9/VMP5AeTPYob938e2
         mDBY81dtGruhEb9X5No8AlLsVXNgVwG9UWQJFMd26SsDyqILyGe4waZDwx9YbWl93rJ1
         WTVHxh8EAyQg3kIV4cvlUfgclvQ/R+LVHCGF21kZhF7OALKdj1tnDqeKcWTWtLQTy9Zh
         5v1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BnSROBXN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f7bsi141580431cf.89.2024.07.03.20.00.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:00:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BnSROBXN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062054; x=1751598054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O2y+4W7xDQI5Ehrauiwct9/OVeYocKJKMH4u39+XG9I=;
  b=BnSROBXNpjhR31sCzG7B7fnbTJcuedD2sHZLx9s5fupqr17eWLrQvx3z
   F+UOIaAuQ+EVQfYegWUoVMIETw1jTTHB8Q2x2JS01r9M0bIW1CpuZg2yM
   x3IHK+ZlZo8MXhQ7E1Pts9D3YcyyEYUQQlgUaK6+e5yWXpvYpkR5wKI+F
   0NUvMX+kIY9f6pZKiJuVNBHm56S6gh3iVS1joPvVIIQ1/8SgGIOCFDK0J
   8VqGxBTvTN2p7zCJPUn8bHox9j/XOSYH1C8xY6T8hhPNuPluULmKQdCdi
   LTKsIs4fBaR5kUc8x4B7RbSD3WM+mk9nZ+0pTIc0/GqkR6bLLdY3QQrTg
   w==;
X-CSE-ConnectionGUID: Goz5xQuOTEWp+PQQeYCfxw==
X-CSE-MsgGUID: +zdHNOtmRpqHPjO1pc1oTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838108"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838108"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:00:51 -0700
X-CSE-ConnectionGUID: /7A5MSBTTam4dTB6DCKBFg==
X-CSE-MsgGUID: azFKFs3BSMWR4qbPeaPRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052203"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:00:43 -0700
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
Subject: [PATCH 3/8] hw/core: Add smp cache topology for machine
Date: Thu,  4 Jul 2024 11:15:58 +0800
Message-Id: <20240704031603.1744546-4-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SO0+qxTOth6t

With smp-cache object support, add smp cache topology for machine by
linking the smp-cache object.

Also add a helper to access cache topology level.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since RFC v2:
 * Linked machine's smp_cache to smp-cache object instead of a builtin
   structure. This is to get around the fact that the keyval format of
   -machine can't support JSON.
 * Wrapped the cache topology level access into a helper.
---
 hw/core/machine-smp.c | 6 ++++++
 hw/core/machine.c     | 9 +++++++++
 include/hw/boards.h   | 5 ++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 5d8d7edcbd3f..88a73743eb1c 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -270,3 +270,9 @@ unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
 {
     return ms->smp.threads * machine_topo_get_cores_per_socket(ms);
 }
+
+CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
+                                              SMPCacheName cache)
+{
+    return ms->smp_cache->props[cache].topo;
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 655d75c21fc1..09ef9fcd4a0b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1045,6 +1045,15 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "smp",
         "CPU topology");
 
+    /* TODO: Implement check() method based on machine support. */
+    object_class_property_add_link(oc, "smp-cache",
+                                   TYPE_SMP_CACHE,
+                                   offsetof(MachineState, smp_cache),
+                                   object_property_allow_set_link,
+                                   OBJ_PROP_LINK_STRONG);
+    object_class_property_set_description(oc, "smp-cache",
+        "SMP cache property");
+
     object_class_property_add(oc, "phandle-start", "int",
         machine_get_phandle_start, machine_set_phandle_start,
         NULL, NULL);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index ef6f18f2c1a7..56fa252cfcd2 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -6,10 +6,10 @@
 #include "exec/memory.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/blockdev.h"
-#include "qapi/qapi-types-machine.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/core/smp-cache.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -45,6 +45,8 @@ void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp);
 unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
 unsigned int machine_topo_get_threads_per_socket(const MachineState *ms);
+CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
+                                              SMPCacheName cache);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
 
 /**
@@ -409,6 +411,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    SMPCache *smp_cache;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
-- 
2.34.1

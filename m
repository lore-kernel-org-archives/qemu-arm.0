Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083641njb;
        Tue, 22 Oct 2024 06:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbJENerKQ49LJRUjR0hL13kuyWWfU4/foThYnpObReyJweCJ751vtTHrqk1guoDFFQEviHhYLoQwpKdg==@linaro.org
X-Google-Smtp-Source: AGHT+IFQfCCu1c9cdmUwsOYYZevao0q2Q5G3Bqc/L6rxd6t1kAStZO3k/Na7hTsK6wQUZ1G25KBH
X-Received: by 2002:a05:620a:400b:b0:7b1:1352:66fb with SMTP id af79cd13be357-7b176738d5fmr306129085a.29.1729604214167;
        Tue, 22 Oct 2024 06:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604214; cv=none;
        d=google.com; s=arc-20240605;
        b=dU1oQKB9YZn3FWbrFk1rKPa9ZWmgSBCrvi/RmyHaAcD8ZaQq5I3MIXopYLiGMTpoJp
         jJD+HlPdh3aICy9Y3eBnwlcUApGa8ktuTaG+5lcQObPz15EpgoeS1uZCdFZ6Ks6/RxlR
         GJGlA13xnJftIu2gir4KULmpjd0wK/AViA8KjxuX93ipSgSD3V6hQSNlhtQlEuqkCkMx
         4nI5DfFVZ9kDcSJAFqSxV7hy2nzUgOy8uswwX8hZnz/h+O+xRMTpnajfVtxHEM3a8D9r
         TwXAhq3PJC7oQL0Krt77dpNyhmy3PnHTAeDz5Lq657ceJYjvyozkTVq6dW2HnKCp9dCV
         5uGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uf8SsF5N20dRxFGQ8ib11h+JHtvwbPt1WO5YeY2YD9w=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=JXeJ/MTVy+HwDYCIrI9lKRqi32LTbdZTelcwgdXGbbEok0B8508R1JrIIOTfZBnSRZ
         Li4dnzbhnrfQa2f/GexxBF4EXUEF+74LJE13FsuFv2+xXM+L0Uw7pH1N1FmjJHxSRSKt
         51xT2b9w57BlANnrdLPUQtC7COw/q5p5HNY13rbXcn0NIzdBInOnOYEjE2olF85Yfkcy
         Evz6y2YuSPb/dWdJ4wt5PVDc0gPzTvUd/dh1X9FQbR59jAngm7xYzGewr568vn/mRwl+
         4E6iyrK03QMKNU8j+2Ubb5wd9rbCCJznBQ7RBnV1Qs1gHVzAa/60SJuOs4zA8yzV2AoI
         BZwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SU+cr+rf;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SU+cr+rf;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604214; x=1761140214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dp1CRpbyNbOs2HtP+ckcBp2tV2Btqa2nfJTthkEGR/I=;
  b=SU+cr+rfqoyFyTMMa/Z6x9hwk08oYuE80phOeJmquuwqFUcjnhX1VUEV
   Mp8e3+7ZE22GV7i/C8b/4yBJd3uxotM97sB6FoJI5OtzecL7S/0C+H45V
   FZYUjz8bXkqMfEXZqqn/bWEK7fq8ZZ+1dl/Q+gqp6tdzNtu+Y2AeKrhgc
   v8BnKQ+U7OU1KflGsbq4FObvRwYv/kGhPzASM8PkPczu95DmodzkG8Tgs
   6IVRBVckjsBLee5GfTG/8b2w8+4Xa5tHxBp6nMJ9+hPupr+2kNCtBs80R
   UTh4aW0/XEezV7OYQ6tzNZssRLB3tFpA/jXGCuY0C1CwepxMEBcDGB4JN
   g==;
X-CSE-ConnectionGUID: /yid1x7WSVCgITQg2p56uA==
X-CSE-MsgGUID: +E5yjt8vSlWjoylsK4NMeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603761"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603761"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:52 -0700
X-CSE-ConnectionGUID: nCL6oB2DT6iTPNbEDHvEzA==
X-CSE-MsgGUID: Rd6tQNijTiOTRl85kSgJ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782452"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:47 -0700
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
Subject: [PATCH v4 8/9] i386/pc: Support cache topology in -machine for PC machine
Date: Tue, 22 Oct 2024 21:51:50 +0800
Message-Id: <20241022135151.2052198-9-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FJcJrJrdJcfA

Allow user to configure l1d, l1i, l2 and l3 cache topologies for PC
machine.

Additionally, add the document of "-machine smp-cache" in
qemu-options.hx.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes since Patch v3:
 * Described the omitting cache will use "default" level and described
   the default cache topology model of i386 PC machine. (Daniel)
---
 hw/i386/pc.c    |  4 ++++
 qemu-options.hx | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2047633e4cf7..8aea2308dcb9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1791,6 +1791,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
     mc->smp_props.modules_supported = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1D] = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1I] = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L2] = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L3] = true;
     mc->default_ram_id = "pc.ram";
     pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_AUTO;
 
diff --git a/qemu-options.hx b/qemu-options.hx
index daae49414740..fe39973d97a5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -39,7 +39,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
     "                hmat=on|off controls ACPI HMAT support (default=off)\n"
     "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
-    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
+    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
+    "                smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel\n",
     QEMU_ARCH_ALL)
 SRST
 ``-machine [type=]name[,prop=value[,...]]``
@@ -159,6 +160,34 @@ SRST
         ::
 
             -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
+
+    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
+        Define cache properties for SMP system.
+
+        ``cache=cachename`` specifies the cache that the properties will be
+        applied on. This field is the combination of cache level and cache
+        type. It supports ``l1d`` (L1 data cache), ``l1i`` (L1 instruction
+        cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified cache).
+
+        ``topology=topologylevel`` sets the cache topology level. It accepts
+        CPU topology levels including ``thread``, ``core``, ``module``,
+        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
+        value ``default``. If ``default`` is set, then the cache topology will
+        follow the architecture's default cache topology model. If another
+        topology level is set, the cache will be shared at corresponding CPU
+        topology level. For example, ``topology=core`` makes the cache shared
+        by all threads within a core. The omitting cache will default to using
+        the ``default`` level.
+
+        The default cache topology model for an i386 PC machine is as follows:
+        ``l1d``, ``l1i``, and ``l2`` caches are per ``core``, while the ``l3``
+        cache is per ``die``.
+
+        Example:
+
+        ::
+
+            -machine smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
-- 
2.34.1

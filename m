Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp625207njb;
        Sun, 8 Sep 2024 05:44:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUii4zSRRORIrxvAT7aWrxW4XwS1eC9sTbia8uSlxNHxVptH+ERdr+Oy0TTJ3Y5QkvJ1nQUyzbSy0dC0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG1NLW6f1VnSOGTU7qxqRA2aqIc5L/h7VNkbU1P5OdbHpMvyUrjyDbje/+Qf1V7JyFEgpcg
X-Received: by 2002:a05:6214:3a02:b0:6bf:9076:3315 with SMTP id 6a1803df08f44-6c52830034bmr119976026d6.13.1725799446153;
        Sun, 08 Sep 2024 05:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725799446; cv=none;
        d=google.com; s=arc-20240605;
        b=Zw8SDZwDzQ1zP9/aCdF0wyWCdA1qZCWC70gNHNF+STbuvOhdoTUl6syo6ydxr+7Gns
         r+NLdH+fZulRY5Op+3tFmnPJeM1kJwt3DBaijQ8Vidk1/y0jzee1Ia7KKsGdJ9I3ZAYU
         gG5cEU1APH6QJ5yOb14FgKWokgwwMDN01OrY75AOoAk6dsWDOLr4wU093Wiiyxu2C7Zd
         TmAaRwh8xLHijCFK64YUgc92Kr1B81tibntg6TsRFC7X+l22IcTc5g39q/3sRUJpFeAZ
         UPURTkg3zKjzHwPUo6czwpE1Sl8sZAcuKEahfyZpXe1604MGOdR66A5zPNneQjwaPhQm
         r6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=18RPvmNbwVAJ6DZU8THD0edaJscZ5kKTl3d1m3AKJyg=;
        fh=0cJcinrZnucqYjSNYncb6+eMGja84j/gs35YiXtiMHU=;
        b=D1KX7MUGEPbT2gfcMy20LdimgxAgXymH6kRzzTak39gPSIeTndRR9QRS/Aprc1pzjy
         GxXS8O6dd97fBSITtARUnS6KE/dcDIoJWpT66KCAaFJWnzAsDHvpqzYkeC5vvzHp4O3P
         Ppt69/JN/AEhl5OiYDqmuzgQqp5iP0X4yx4LgDDLuGQPYiIWMPxXz97Vq3Mcvy9SW2wT
         kUdO2yJaJNIZJz3JgUxeLSkBHmMP1t0pkCsy0wN6YsK05J6ywu2dvqLzJjMWNwIZLRbf
         ev2PLP+uWeS5G0tHmdCu70+lyRyaImLn3hQTvIXpG/0bPhSbarb9SqhrjgrxJvu2nldJ
         uTqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BsJiihWo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534787b9dsi31732186d6.435.2024.09.08.05.44.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 05:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BsJiihWo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799446; x=1757335446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hMYhnFWxXSsAfwWdeOKrX4i9zZGtjRAXTsthyts1mB0=;
  b=BsJiihWoHJVx8H2ZP3vo7hEB6f2GXThlc/DIxsVeZejaesWNYymwaGx4
   k9J7GFwOyiXwAD7auoP2aAw1UJDcqdcTapcrB5c61BX60QTzIot49ILvX
   v5uHMVnt2RrO/JiME0fxfRINeBOw+RVtiFAfSpcl5bMTsDb4cl0O3FPcA
   JVDEuYhPoN1aEszyuF5ek8WEcY0vc9dfSuFFNnntykOjdMXP7cIegWkSG
   M5HMm9PbeveWLcMa57vLp183h4nE4rar8yLyeFTBRG6L+TjxCj2nUyY5m
   czZqkHvaSGAsQ4FfdPrWhbQnYOSPEKuIJ9XOm0CIDJZOR6j7sbmxJi7aD
   Q==;
X-CSE-ConnectionGUID: k3KhLlH7TPmHbmfBre2rSA==
X-CSE-MsgGUID: Oy5/pMMJTsOQbRt08spsnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28238285"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28238285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:44:05 -0700
X-CSE-ConnectionGUID: EjDF+9ZNR2CHqN/InLQCtw==
X-CSE-MsgGUID: RyU6ZH3iQmq7EhvumKf80A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97196680"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 05:43:59 -0700
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
Subject: [PATCH v2 7/7] i386/pc: Support cache topology in -machine for PC machine
Date: Sun,  8 Sep 2024 20:59:20 +0800
Message-Id: <20240908125920.1160236-8-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240908125920.1160236-1-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JRC7LJbBsTYE

Allow user to configure l1d, l1i, l2 and l3 cache topologies for PC
machine.

Additionally, add the document of "-machine smp-cache" in
qemu-options.hx.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
---
Changes since Patch v1:
 * Merged document into this patch. (Markus)

Changes since RFC v2:
 * Used cache_supported array.
---
 hw/i386/pc.c    |  4 ++++
 qemu-options.hx | 28 +++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ba0ff511836c..d562fd25aad2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1788,6 +1788,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
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
index d94e2cbbaeb1..3936ff3e77f9 100644
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
@@ -159,6 +160,31 @@ SRST
         ::
 
             -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
+
+    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
+        Define cache properties (now only the cache topology level) for SMP
+        system.
+
+        ``cache=cachename`` specifies the cache that the properties will be
+        applied on. This field is the combination of cache level and cache
+        type. Currently it supports ``l1d`` (L1 data cache), ``l1i`` (L1
+        instruction cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified
+        cache).
+
+        ``topology=topologylevel`` sets the cache topology level. It accepts
+        CPU topology levels including ``thread``, ``core``, ``module``,
+        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
+        value ``default``. If ``default`` is set, then the cache topology will
+        follow the architecture's default cache topology model. If other CPU
+        topology level is set, the cache will be shared at corresponding CPU
+        topology level. For example, ``topology=core`` makes the cache shared
+        in a core.
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

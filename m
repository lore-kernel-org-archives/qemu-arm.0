Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp276960njc;
        Fri, 1 Nov 2024 01:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+3xCUivkKGq4HHV6vNa4h8S9no7nsrY8P9MtJAz24SZbRNwhDoK8maOPWrTLtxuadGII5jRdU7jBxdw==@linaro.org
X-Google-Smtp-Source: AGHT+IHWnnwaGEr+ZCfDdxEKDdA1ZA/AeJA406U1pSoKu/8A81UHyLIGH3NYjpGyvbCFsny/DDjO
X-Received: by 2002:a05:6214:5343:b0:6cd:e38a:a91e with SMTP id 6a1803df08f44-6d1856e6a44mr263326026d6.18.1730449004882;
        Fri, 01 Nov 2024 01:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730449004; cv=none;
        d=google.com; s=arc-20240605;
        b=Ux2Yb6pUCxEwxuwFK+/AideCAMy84XeSef76edtIUkdtsBtvVI8NmdMZppCdCoR0wZ
         qIDhqvhMamGKX7MUqp4j0kcfEuOMGMoPqYE7gXHPOdqvl4MmIwUNL3rKMLkGij9pdHT9
         /DzIZKd/WaGHnSlZmY3FkuNBPKTiPoKO4hEUfV0MCISZThbpywMmgeChigu3wIdWWq0W
         LFkZD3ss3X+d2SXMdU5rM1BoA5r/SZXEpB97aYyzoE/wTvbWYQ5D9JwjfEF9W4N65jVv
         kYIm6CBA3AoTWZ9yrhnYwgldWF/J8ixDGumEO8peI3LQqcqud3uo0lkV1w2Jvynlwj2w
         Vv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qkLF8wxJDZKDZslGi6nrnhj329gmi00+lHIgxAaPJU4=;
        fh=eaTTmp+2XhStxW3y+BHQH9dBL4m34nwTlgFlQEpn70I=;
        b=C69SatBECEG1wBbiqK4IaDyoWZHBpAR6sB6WEqqidagPkW3apifAm6h/PHPESRRJo/
         V8Kw+xLq0DaIdYzSL8U8ADwMwqx9L3VcIjqL9Ux+j3ELGwdr6UyUR13eUJRt3pVXmFgY
         EJFO5GqAQ2w2nWexd+QV0cuLhF12AMpUaqBvETBFTv6Ee/7NMeHnw/4EBKSNYG1kZHfU
         8I5ptJpCQnSljxN8JAayNCYC5DthJzEQSjN2/lLwGSeqDlTwk+VGqRJDp3DcG5YSG1JW
         O0tV/Nx2mLvn1hRYMskZX6bvZDUP26eRXlJJoJYm+fkWHQ90PbiS9W6s4HE6iqV6YZsn
         PZhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="IZs//OXc";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fe4csi37605786d6.382.2024.11.01.01.16.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="IZs//OXc";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730449005; x=1761985005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xc0ZEM0XRjIyyn7cTteAHDQNg/ftofpyLFroEACPy64=;
  b=IZs//OXcqlArvrXPfvxXqLu3aafxaC3YyEc9vrtE1bK7Q/8VRXgRngdZ
   TByjVq9Kp/QWNJZYESCVygtK7iev2gaD5QHhxS7tmwFgAw3yDq0Z39YKu
   OIkBqEMELcjvDz1uCq8+r3p34koG61L/di0E4rubFEqBPQEo4MMNY+spx
   hKGkKYgCRfRWgLv4CD38teq/l8UI1yr1R27gucSAuBXEPtTuNjBTEzbGU
   Z74SCB2wFUHuoX004t1AGgc1263bfXegp3dLAhLyX1q8WO7HFpEwMyfLh
   xBIH8vVGF/eP4LWtyoqdR9SUyxwI5vUtao/vhkB8Fu4qjUwGOpg0m30o4
   g==;
X-CSE-ConnectionGUID: y6NyB7+MR3es3dAgyrTQwQ==
X-CSE-MsgGUID: oiz7POePQ4SfhH/rbR092Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17846085"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17846085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:16:44 -0700
X-CSE-ConnectionGUID: zrHITGPaQaSKU2H21ONDUg==
X-CSE-MsgGUID: NfCN/3W3RXSTpoIvp8AN+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834717"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:16:38 -0700
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
Subject: [PATCH v5 8/9] i386/pc: Support cache topology in -machine for PC machine
Date: Fri,  1 Nov 2024 16:33:30 +0800
Message-Id: <20241101083331.340178-9-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NkV/GRHyNYIv

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
index dacc9790a4b8..a18ed4a9a853 100644
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

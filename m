Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp874652njb;
        Sat, 12 Oct 2024 03:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhtuIO+uRGP8fYM1IbP+SWmeVT5Zh9ku2fdzOh3AhxMXAv6FSgfqpRtp1a70duVtRpKCoQsig87IsCYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEsEAXxgpP0iRouQtRez1P3EdSfO9CTilUOaYXPBsgmzQ84AbhBrMn5I5Hhg5jOcDt1qAHX
X-Received: by 2002:a05:6214:2e46:b0:6cb:4a84:e02a with SMTP id 6a1803df08f44-6cbeff4f83bmr93299616d6.16.1728728946569;
        Sat, 12 Oct 2024 03:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728728946; cv=none;
        d=google.com; s=arc-20240605;
        b=RO60liDfiIHpJ5uBZqsgewdvffF7OiLpDx1HVXqPY1+ENW0Ru8rWc9gSNITnDpiPPP
         beZ0xfgbj5Nem0gCC1DQETigWVHNBSuxYxOlC2m8dJ3ZjkDAcmJAvn6cGEwF+jZiXGX2
         0EbePBYAcawULlduLmTbjCzWXjymUkWdyG3zeA8ZXErFb+zNH1HbST491wdrDQncYscc
         rCqmxBYwZEly3mztWBRQFLVQBAJ4Bs984+lRQSULlFvxKhDrGI7dkL3gUnkGBZai9XDF
         yQZ1rTN1kqSstKm+RlsQLOtokPWfYRSe0wQaiYvYq7fwhhpncUaGT2E6q0yOnQTbZkIL
         WmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q9zF/N6hMuRRTkOUgrB/PPOzpXrluyvcKDRv6DZQjcU=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=h9KsxdP6s5RbD7hzwlzENg+RBtkPvg5zR7zvnCS+nInnGuGJIIADWqF27n+bmwCghT
         k0oZ2Ne5ReYtK0FUlPjnkxDHVe/bUEkvmIVPuxxW2MXxBA00ws5o2gAxlajijSwuuZYo
         8+iCsRrqfEAriBeX8HD9x8UcNYHCF7PYd9lZHK0C6JpCofzkhcpZdNZDTPfpBk3EbkZH
         t77KxBkR8QnyscPPFb3+gFiDXt2zCpELYKr2lUAdUmYuPe39+qwWccXs1ASKONBwTtG1
         5kkQZgy0QEWFb9bG0XNo/gs9J7a5sFtVvtkQjcJGLj1kS007uOxKdWWQ/nvTC6KQgRYH
         iCJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=FfgAnbGv;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.8])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e0783si58893326d6.189.2024.10.12.03.29.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) client-ip=192.198.163.8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=FfgAnbGv;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728946; x=1760264946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uqz0CxeEMFYodgXeRDwdMplzhXLtp/KziGXuIPivbUo=;
  b=FfgAnbGvCkVmGKmUBnwLFDUAbzB50mcruj6IdLD/oOSrQw4n3rimEUF0
   2QWY/EKzMnRAy4pOsNyYfaDQ0g2pk+LAiVHcdfTSfgDWNmuonb1X57IL/
   1UmwB7P8V6JyFSkqhaFQCTR5MXagwA5XyxHFa0hUFfL22Aa48iTSTAZM/
   YEIAK0k9lrMy1Mh/1aH9bmpKUv5dPiuKpkruVZb8QWZjtXUxbHPCO/ab4
   Ub/NFYBsPheQZ1NKY82wOSpOlXGcL053ErPW9FVpqQ0Gbk+l+dy6aQetG
   guUhIc80ck5HPpsV0CK2zH4vEXVF9c//QTlbxl6BcH71lE9xLg6ZbJwzy
   A==;
X-CSE-ConnectionGUID: HcvJ33/iQzK8mzocomJi0g==
X-CSE-MsgGUID: TJICbOKdT1WGRfk5zVkPCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45634940"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45634940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:29:05 -0700
X-CSE-ConnectionGUID: zpEiaCQ/TIq2/9zNkRBHqQ==
X-CSE-MsgGUID: 3VXD5jpMQOiVZMGySxNoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77050867"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 03:29:00 -0700
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
Subject: [PATCH v3 6/7] i386/pc: Support cache topology in -machine for PC machine
Date: Sat, 12 Oct 2024 18:44:28 +0800
Message-Id: <20241012104429.1048908-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Sg/ZkVdUJQG3

Allow user to configure l1d, l1i, l2 and l3 cache topologies for PC
machine.

Additionally, add the document of "-machine smp-cache" in
qemu-options.hx.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes since Patch v2:
 * Polished the document. (Jonathan)

Changes since Patch v1:
 * Merged document into this patch. (Markus)

Changes since RFC v2:
 * Used cache_supported array.
---
 hw/i386/pc.c    |  4 ++++
 qemu-options.hx | 26 +++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

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
index d5afefe5b63c..8a0cd7393f34 100644
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
@@ -159,6 +160,29 @@ SRST
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
+        by all threads within a core.
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

Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp118886ejk;
        Thu, 30 May 2024 03:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2KRLQt3/PrV8ScCMvsEK6QqDFBhIXovAlo7D8VwpI74hFgFnnqCd7mDjbhMvFg9VoSpSv07MEUjobcYp5SV9LTSJ6i1nV
X-Google-Smtp-Source: AGHT+IGFm56DYA7zL0b15kjG/isPzzWh+BEbrXNd3DVG2s8SRmVVKl6igwXUXpKaPzLPLSRqlgAd
X-Received: by 2002:a67:e88d:0:b0:48b:a4f1:c4c5 with SMTP id ada2fe7eead31-48baea14481mr1752804137.19.1717063265165;
        Thu, 30 May 2024 03:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717063265; cv=none;
        d=google.com; s=arc-20160816;
        b=W7jhxq5rXysu1MPSHbwRsQrd4fljru33x55OzcfQP/rA6vqIXKiFcZL2zKpumpTmVf
         GZLyI2xqxgdkNirBpgiPKNbw3C14mYXTVmOjC61JmwSvs5l98xQJkkAkDpoYI/mcs4ze
         kRam2xIlpxSot+8TJ7M5B4BXnkElh4/OHFpy8Eo4QZwZLyeBWiUuODKRggvlA9x7NYTd
         kxMBMmVxQra5L/TYXpm4FtK3i4DGiuzyiH6zNbwyDIQ8h9w5O2x3t0qpj7smclbO9m3I
         W3TTsjDTr2nFrxs5p0CPxj+/L5HYnuhPptCcirIkHWeT3gZXY9Uspt9G/wdrxpKKeaXd
         YBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/xG+14RUPCCyJPgCabASImME8ASZXFNM2HhtLSLXgyI=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=h25N229wY4R/W6dhUNAnamOcQFfZi0QkHU67HBuyv9c5KMey8mlX70BBT3a3dUKtyh
         57OQ4+hj1Ls4MbEraihSJzfEehV3WuHfZjwp8+9WP4SY8kn1K8QtAatkHX4L4bdRWkJV
         s8aiuxt9+ulnWfSn0byEw1RISDxJ/hWi9vU+kWCjvdUBD/BhCDwB+T/KxogiCWWtCOXC
         pExAnYAdwOhAZsDM9QmynRJ1lNXS4yQz0YgsnFlb3/WTREi2mKVc+j5NkROkXqP9K3ch
         avxDznfpVXQcKVRb9agsdcQtACbI/lE/FgIEAwX37OrOGxFfD5TKXJ2vtu0Sd9iAy6Uu
         O72A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CK9DCX6d;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-804cc02cc8asi2656177241.162.2024.05.30.03.01.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CK9DCX6d;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063265; x=1748599265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kd8Iqz6IxYjau87nIpOYyMS3R+5juiDyGSjeB2FuXwE=;
  b=CK9DCX6dmL/bqJjCyceGKDJw2EcS9eGueY9u0v5odGt1ZsRcihB0gmmR
   aZS5hbREqIwXwFdRRv+U0YXiH5dP+FqNZrTMdcXBtU5aNtlhWeV7YSyuf
   izNc/NN9coj68LCocGlfKn83nL16jcu47C3dcrHW07MXCz/72JZbdx6Me
   bg5ZH4C5xnQO5TzCTZ28H0DwaSRmlmeSZHgWlIfniISZzGL/tzVVleTED
   RP823Gbl+eiGPGH4lt42kud2MAy1PfTieTbO+9Bh76S1Q6cBepw7CDSNK
   wUfYN3ZOFz0cA8m/iy6d18qoRcbZlJ4tr68/2EzgEeZ1yxjxw+MT90L2a
   Q==;
X-CSE-ConnectionGUID: /Ywg7MksTV6Nf7z+X2NVqA==
X-CSE-MsgGUID: qCwr7jdaRy6s+puefoCRDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31032642"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31032642"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:01:04 -0700
X-CSE-ConnectionGUID: SyRY+RB0TV6YokdKL/13XA==
X-CSE-MsgGUID: aFRS7jt6QPWbeEZPIX3Qmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35705172"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 03:00:58 -0700
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
Subject: [RFC v2 7/7] qemu-options: Add the cache topology description of -smp
Date: Thu, 30 May 2024 18:15:39 +0800
Message-Id: <20240530101539.768484-8-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530101539.768484-1-zhao1.liu@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aNR98T+sDFMf

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since RFC v1:
 * Use "*_cache=topo_level" as -smp example as the original "level"
   term for a cache has a totally different meaning. (Jonathan)
---
 qemu-options.hx | 50 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8ca7f34ef0c8..29d8a4b9b68b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -282,7 +282,8 @@ ERST
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets]\n"
     "               [,dies=dies][,clusters=clusters][,modules=modules][,cores=cores]\n"
-    "               [,threads=threads]\n"
+    "               [,threads=threads][,l1d-cache=topo_level][,l1i-cache=topo_level]\n"
+    "               [,l2-cache=topo_level][,l3-cache=topo_level]\n"
     "                set the number of initial CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
@@ -294,7 +295,11 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "                modules= number of modules in one cluster\n"
     "                cores= number of cores in one module\n"
     "                threads= number of threads in one core\n"
-    "Note: Different machines may have different subsets of the CPU topology\n"
+    "                l1d-cache= topology level of L1 D-cache\n"
+    "                l1i-cache= topology level of L1 I-cache\n"
+    "                l2-cache= topology level of L2 cache\n"
+    "                l3-cache= topology level of L3 cache\n"
+    "Note: Different machines may have different subsets of the CPU and cache topology\n"
     "      parameters supported, so the actual meaning of the supported parameters\n"
     "      will vary accordingly. For example, for a machine type that supports a\n"
     "      three-level CPU hierarchy of sockets/cores/threads, the parameters will\n"
@@ -308,7 +313,7 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "      must be set as 1 in the purpose of correct parsing.\n",
     QEMU_ARCH_ALL)
 SRST
-``-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets][,dies=dies][,clusters=clusters][,modules=modules][,cores=cores][,threads=threads]``
+``-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets][,dies=dies][,clusters=clusters][,modules=modules][,cores=cores][,threads=threads][,l1d-cache=topo_level][,l1i-cache=topo_level][,l2-cache=topo_level][,l3-cache=topo_level]``
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
     the machine type board. On boards supporting CPU hotplug, the optional
     '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
@@ -322,15 +327,34 @@ SRST
     Both parameters are subject to an upper limit that is determined by
     the specific machine type chosen.
 
+    CPU topology parameters include '\ ``drawers``\ ', '\ ``books``\ ',
+    '\ ``sockets``\ ', '\ ``dies``\ ', '\ ``clusters``\ ', '\ ``modules``\ ',
+    '\ ``cores``\ ' and '\ ``threads``\ '. These CPU parameters accept only
+    integers and are used to specify the number of specific topology domains
+    under the corresponding topology level.
+
     To control reporting of CPU topology information, values of the topology
     parameters can be specified. Machines may only support a subset of the
-    parameters and different machines may have different subsets supported
-    which vary depending on capacity of the corresponding CPU targets. So
-    for a particular machine type board, an expected topology hierarchy can
+    CPU topology parameters and different machines may have different subsets
+    supported which vary depending on capacity of the corresponding CPU targets.
+    So for a particular machine type board, an expected topology hierarchy can
     be defined through the supported sub-option. Unsupported parameters can
     also be provided in addition to the sub-option, but their values must be
     set as 1 in the purpose of correct parsing.
 
+    Cache topology parameters include '\ ``l1d-cache``\ ', '\ ``l1i-cache``\ ',
+    '\ ``l2-cache``\ ' and '\ ``l3-cache``\ '. These cache topology parameters
+    accept the strings of CPU topology levels (such as '\ ``drawer``\ ', '\ ``book``\ ',
+    '\ ``socket``\ ', '\ ``die``\ ', '\ ``cluster``\ ', '\ ``module``\ ',
+    '\ ``core``\ ' or '\ ``thread``\ '). Exactly which topology level strings
+    could be accepted as the parameter depends on the machine's support for the
+    corresponding CPU topology level.
+
+    Machines may also only support a subset of the cache topology parameters.
+    Unsupported cache topology parameters will be omitted, and correspondingly,
+    the target CPU's cache topology will use the its default cache topology
+    setting.
+
     Either the initial CPU count, or at least one of the topology parameters
     must be specified. The specified parameters must be greater than zero,
     explicit configuration like "cpus=0" is not allowed. Values for any
@@ -356,6 +380,20 @@ SRST
 
         -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32
 
+    The following sub-option defines a CPU topology hierarchy (2 sockets
+    totally on the machine, 2 dies per socket, 2 modules per die, 2 cores per
+    module, 2 threads per core) with 3-level cache topology hierarchy (L1
+    D-cache per core, L1 I-cache per core, L2 cache per core and L3 cache per
+    die) for PC machines which support sockets/dies/modules/cores/threads.
+    Some members of the CPU topology option can be omitted but their values
+    will be automatically computed. Some members of the cache topology
+    option can also be omitted and target CPU will use the default topology.:
+
+    ::
+
+        -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
+             l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
+
     The following sub-option defines a CPU topology hierarchy (2 sockets
     totally on the machine, 2 clusters per socket, 2 cores per cluster,
     2 threads per core) for ARM virt machines which support sockets/clusters
-- 
2.34.1

Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1174840ejb;
        Tue, 20 Feb 2024 01:12:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhCio8L3Un0sEB0QMXAUZi1wzJDYFvqwEhS6bY1B1vA+7+pGSancfpdFKMM9pgu7KhMJ/H/J3le4iOiAhXCEU/CNYBA1VG
X-Google-Smtp-Source: AGHT+IE6h3KAFBy5DxA7/aGzzy0xcUC+lMlPY1Vz9higlQ6frGfk5TcienM1Ko1YbS6pNC/i7QRh
X-Received: by 2002:a05:620a:1217:b0:787:1aa4:db8d with SMTP id u23-20020a05620a121700b007871aa4db8dmr18016972qkj.54.1708420349687;
        Tue, 20 Feb 2024 01:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708420349; cv=none;
        d=google.com; s=arc-20160816;
        b=pHB9vOHZ8DtzHSMF9ErGMfL/TlhMJY6nrvCZCvn3h8hCBtkVngxTWr6KTBRNQbpn/a
         wLtIiESIywm+JHkFGPsdNcwlfEqvpD8TUJm+GePRZkGdi/t3HMrqBhS4Nrfw2ml1jwK/
         l4+jKxYeA8KeKMRJaKGdBR+wnYUhCY8bxmCD8Lp6G4H4jbd8b9Y6Oe7gz6BWnWZYR8uT
         dmLT6wfS2yt+GeCIjO8ZbWXc/E+c7VxcLXXMnAs6eH/Mt4WZDURNkTOiwdNAGFHtQHfd
         hVmTSNNcyoJ/M5szFSirOqf3ZQSbt7nTuUTrRKVhyGj+1ibKafXUPK0t04c9cAfWDvKP
         riEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xlHVDIczWDzsqvnRJ1iEbajqyhhtoEAGnHkRgqd3qOk=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=pI0meDYiprY6M+wzcsbKPoXix9ZWn33JRItZ6MAGsGcZMy+9pa3jKSPzeqyaufqSVt
         D0ypdWqvtjjls/b4uAxREWMLsFJ8Oh5eTl+hFTXS3dSYRV/5pA1qqOl1fP5JEErcRaSZ
         I+ViQIWj9PPQo7TgXdlk/sEarpgpPEQdxuxG4o3rnbdOnfp8Etx1sKuUvuElW+24yYJy
         9HaGxYa323hdC5AeovC6dMirQvMC99A8z41A62htfgnrlVP9Red+tXsk9KxiMYzzNy3T
         rxaBXMgzf4GsCOgLLYQJH26JlmIn2I6KNfERfYLoHlQAxP0lAYAIHDjPueQdEQfZ2rio
         91wA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WFiGKnlY;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id qs15-20020a05620a394f00b007873af4a4e7si9151366qkn.764.2024.02.20.01.12.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:12:29 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WFiGKnlY;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708420349; x=1739956349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L0AbdOq+EtfWgzb7EW1UTRtjP/6zXcB3r698FBuEvgE=;
  b=WFiGKnlYYf/orMafjcKy3NLuCFxTVQKIHiDbTURI6fEHLyCmYlt2sDwf
   DVq0kqgwU7HaKjxF/VxyFquto0sXMOOryGspfEt8PNAJ56XleXd3pjG/V
   C7tBjDyCa/BUvzQ2NF+IvrdrhvVrfLRq8ka80wgn4UiW50cb87x5HKdq7
   lsyM/waht5sLMhmwThl6RFNFZZdBqvs0MVewqOH9J5Twu6jlKr+UL7oqj
   6+WW67K34Hcyw6yj0/l44CkmIKowEH2eV31dMXnASQ4mhnPIJj8wSi+Tk
   pFCXlU4q0EWlrOwiZvpUJMOSPeVZCEjZgYh4bsyKBKRoiYiCwv7DRPv/5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2375044"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2375044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5013156"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2024 01:12:23 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
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
Subject: [RFC 8/8] qemu-options: Add the cache topology description of -smp
Date: Tue, 20 Feb 2024 17:25:04 +0800
Message-Id: <20240220092504.726064-9-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: n40A64aABZQr

From: Zhao Liu <zhao1.liu@intel.com>

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 qemu-options.hx | 54 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 70eaf3256685..85c78c99a3b0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -281,7 +281,9 @@ ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets]\n"
-    "               [,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]\n"
+    "               [,dies=dies][,clusters=clusters][,modules=modules][,cores=cores]\n"
+    "               [,threads=threads][,l1d-cache=level][,l1i-cache=level][,l2-cache=level]\n"
+    "               [,l3-cache=level]\n"
     "                set the number of initial CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
@@ -290,9 +292,14 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "                sockets= number of sockets in one book\n"
     "                dies= number of dies in one socket\n"
     "                clusters= number of clusters in one die\n"
-    "                cores= number of cores in one cluster\n"
+    "                modules= number of modules in one cluster\n"
+    "                cores= number of cores in one module\n"
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
@@ -306,7 +313,7 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "      must be set as 1 in the purpose of correct parsing.\n",
     QEMU_ARCH_ALL)
 SRST
-``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]``
+``-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets][,dies=dies][,clusters=clusters][,modules=modules][,cores=cores][,threads=threads][,l1d-cache=level][,l1i-cache=level][,l2-cache=level][,l3-cache=level]``
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
     the machine type board. On boards supporting CPU hotplug, the optional
     '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
@@ -320,15 +327,34 @@ SRST
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
@@ -354,6 +380,20 @@ SRST
 
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

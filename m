Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333193njb;
        Wed, 3 Jul 2024 20:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDiQ0Vgn7E9yZNTQDBdYaBOCOYwEK1izxa+gHPtsZsMkIuPfljkljvmtd6Cvif7PsfVs2feX0E2+CNFE1MKqtYoaoSmMAc
X-Google-Smtp-Source: AGHT+IGBtDmDJO3tU/auh2FeYOCJrCOEByX/De8iLK78VycoM9KeUZ0zgngUpoAtMG42S2en+bYE
X-Received: by 2002:a05:6122:3718:b0:4ef:247f:7ed2 with SMTP id 71dfb90a1353d-4f2f3fd76ffmr581431e0c.16.1720062036078;
        Wed, 03 Jul 2024 20:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062036; cv=none;
        d=google.com; s=arc-20160816;
        b=PNjeVvvdlg93adtDY8U/1MHc2KoRNrGxz39OcNwWYbAKn8lfbjnp0E2gE+cOixYJim
         GLhYq6YHf6Cc2n+bwv1V/WxXrhpFL+49iVhaphvEz+Xps/42B08WvsH6H3Izt4tk43pB
         O1a/we5e1nNdtfJBVmZOhU5CDeCGaGqMOy8aSf+1A+UUDvYmqJR3W2YSoTgq5HFb2/Yi
         z910tCEkJPZIGgs2J2ZvmDd1LpG2EVrZCXyuyWhXEwArj3hpGSiDcYGlBfN339NfMzN4
         geAFV7Uke6As/7BsPOxmEleCnfpzToDNjTLHMzsySnnz8HblooSXvAG43w/9LtwIaZSt
         sRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Vk/kQ4OzXhXbSJyLuURgAXpUtI7paLzykR96+vq+nYE=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=bGhFaJsV6T+IuDpWqEad9QXewsJb9uv9cFqR/uVBRuakA/7dhSziKnviAw/47hZ4d8
         cbAN+B5+2cEycTcpi9/kZqYdMk3ziFCxbmSgQ8FDrnb5vyPQDWsfQV/MxR9adbyuVWZ3
         GiSGTj95YHtE3t5FbX69iHzi5kDEJ94UZrk3gxYF0vpEfUg+IooiPA8JoAmC/C2/8jg/
         /N7gl8IVonPl/oh5tsxkjzHVBC0Cty02QtpvFBCkzYi5LbcYdy4tHo08N0wwbHO5x8nU
         FIBkojPK2rKqwjaI+yia/Dj1+f8aelU0e2kNCPPF0xy2mTGJcfaf8ozM5cdeWMo72X8i
         2JlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ml4Q4ms4;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id af79cd13be357-79d6933ab68si1386575085a.574.2024.07.03.20.00.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ml4Q4ms4;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062036; x=1751598036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KBoR7Jmf7Pr5F6X5IGhcrEKtNKryr9HfJ/qoLYd34tM=;
  b=ml4Q4ms4Gaq5cvBPey6b6jcU3K0nDJ8PapTrRbCaw3kKO4zJuuvfyGhH
   4e4ZmVFQPoaiREPKBVAH4CYvxEtKe3Y4s9Wj8rjKSOur+hCU8oB7XfCqB
   ssD4HucleDz9ZvcXd7hEjcr1/8yJ2pFnGvyvXElqNF9EayXqsGo5k+pi3
   De2lr59YnuqTGXV3CnTFvWFo4rwa7f4yhpiM2kfGVDdD05VzsnVis3BIv
   e88XSDuYpjG4SL/jkOe/b+gMpp0hDxT8s/ppV/Yl6axIZRurxCDhMOaai
   maeD4jCqm0sHjWVNdbwSRBEcRLRB7JYHa20E3pUTSMK2ogCm2gv1/FiWn
   A==;
X-CSE-ConnectionGUID: ETXDMmDIS7GIiIAsSjtXDg==
X-CSE-MsgGUID: LRdc9czOQ/69wm0EOXUX7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838048"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:00:33 -0700
X-CSE-ConnectionGUID: dGDY2TfnTCKtQ4Qs7N3qfQ==
X-CSE-MsgGUID: R7lm3lAoSgCI7aZI4Ltnlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052086"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:00:27 -0700
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
Subject: [PATCH 0/8] Introduce SMP Cache Topology
Date: Thu,  4 Jul 2024 11:15:55 +0800
Message-Id: <20240704031603.1744546-1-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GHiiIg+0qNLA

Hi all,

Since the previous RFC v2, I've reimplemented smp-cache object based on
Daniel's comment (thanks Daniel!), which is both flexible to support
current cache topology requirements and extensible.

So, I officially convert the RFC to PATCH.

Background on smp cache topology can be found in the previous RFC v2
cover letter:

https://lore.kernel.org/qemu-devel/20240530101539.768484-1-zhao1.liu@intel.com/

The following content focuses on this series implementation of the
smp-cache object.


About smp-cache
===============

In fact, the smp-cache object introduced in this series is a bit
different from Daniel's original suggestion. Instead of being integrated
into -smp, it is created explicitly via -object, and the smp-cache
property is added to -machine to link to this object.

An example is as follows:

-object '{"qom-type":"smp-cache","id":"cache0","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"socket"}]}'
-machine smp-cache=cache0


Such the design change is based on the following 2 reasons:
 * Defining the cache with a JSON list is very extensible and can
   support more cache properties.

 * But -smp, as the sugar of machine property "smp", is based on keyval
   format, and doesn't support options with JSON format. Thus it's not
   possible to add a JSON format based option to -smp/-machine for now.

So, I decoupled the creation of the smp-cache object from the -machine
to make both -machine and -object happy!


Welcome your feedback!


Thanks and Best Regards,
Zhao
---
Changelog:

Main changes since RFC v2:
 * Dropped cpu-topology.h and cpu-topology.c since QAPI has the helper
   (CpuTopologyLevel_str) to convert enum to string. (Markus)
 * Fixed text format in machine.json (CpuTopologyLevel naming, 2 spaces
   between sentences). (Markus)
 * Added a new level "default" to de-compatibilize some arch-specific
   topo settings. (Daniel)
 * Moved CpuTopologyLevel to qapi/machine-common.json, at where the
   cache enumeration and smp-cache object would be added.
   - If smp-cache object is defined in qapi/machine.json, storage-daemon
     will complain about the qmp cmds in qapi/machine.json during
     compiling.
 * Referred to Daniel's suggestion to introduce cache JSON list, though
   as a standalone object since -smp/-machine can't support JSON.
 * Linked machine's smp_cache to smp-cache object instead of a builtin
   structure. This is to get around the fact that the keyval format of
   -machine can't support JSON.
 * Wrapped the cache topology level access into a helper.
 * Split as a separate commit to just include compatibility checking and
   topology checking.
 * Allow setting "default" topology level even though the cache
   isn't supported by machine. (Daniel)
 * Rewrote the document of smp-cache object.

Main changes since RFC v1:
 * Split CpuTopology renaimg out of this RFC.
 * Use QAPI to enumerate CPU topology levels.
 * Drop string_to_cpu_topo() since QAPI will help to parse the topo
   levels.
 * Set has_*_cache field in machine_get_smp(). (JeeHeng)
 * Use "*_cache=topo_level" as -smp example as the original "level"
   term for a cache has a totally different meaning. (Jonathan)
---
Zhao Liu (8):
  hw/core: Make CPU topology enumeration arch-agnostic
  qapi/qom: Introduce smp-cache object
  hw/core: Add smp cache topology for machine
  hw/core: Check smp cache topology support for machine
  i386/cpu: Support thread and module level cache topology
  i386/cpu: Update cache topology with machine's configuration
  i386/pc: Support cache topology in -machine for PC machine
  qemu-options: Add the description of smp-cache object

 MAINTAINERS                 |   2 +
 hw/core/machine-smp.c       |  86 ++++++++++++++++++++++++++++++
 hw/core/machine.c           |  22 ++++++++
 hw/core/meson.build         |   1 +
 hw/core/smp-cache.c         | 103 ++++++++++++++++++++++++++++++++++++
 hw/i386/pc.c                |   4 ++
 include/hw/boards.h         |  11 +++-
 include/hw/core/smp-cache.h |  27 ++++++++++
 include/hw/i386/topology.h  |  18 +------
 qapi/machine-common.json    |  97 ++++++++++++++++++++++++++++++++-
 qapi/qapi-schema.json       |   4 +-
 qapi/qom.json               |   3 ++
 qemu-options.hx             |  58 ++++++++++++++++++++
 target/i386/cpu.c           |  83 +++++++++++++++++++++--------
 target/i386/cpu.h           |   4 +-
 15 files changed, 478 insertions(+), 45 deletions(-)
 create mode 100644 hw/core/smp-cache.c
 create mode 100644 include/hw/core/smp-cache.h

-- 
2.34.1

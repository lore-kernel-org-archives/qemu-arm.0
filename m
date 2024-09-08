Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp625115njb;
        Sun, 8 Sep 2024 05:43:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHHT8B989QwOuaQrF0Htqoashyi0f5GQH/d1dJqUoqQay7HxAbTkpWUuHA65LZW7eHyN/11WYjBZv3Zg==@linaro.org
X-Google-Smtp-Source: AGHT+IGMDQPbawHdPbIeMDpIQxhhNYCmempfJxB4qioyalm7btNFzGH58fSHHcRGiZBpi2aaoMIe
X-Received: by 2002:a05:6214:2e08:b0:6c5:30b4:1f75 with SMTP id 6a1803df08f44-6c530b41fd2mr55124916d6.29.1725799419142;
        Sun, 08 Sep 2024 05:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725799419; cv=none;
        d=google.com; s=arc-20240605;
        b=KMfXkaI/HsaLA4wLhHJ9c04oi+TL1rxLgjhTB/QEorY+9eXZ46ANN3i5zYtkbIR2k4
         dtAIoNUuF9K97SbYP2jAMH6etljYr0ItWE01qKPoHcL1j4j5d7Ud1969k4x/NpbW8bI3
         9jGl/TTw5nANzrZdNmKIOQsjWuKUKV8+87UOalH/E5bp6zGipwz3TYuKmHgs9KuGOzga
         ns8aHpfBPuzNsbizipg1qbOLYQMAEZgro3Cm/dDaVusC3yonBh1cbd6nMHU46hA4o3+r
         j3wLwxWqfww5vpmejagXJMYBLKVRJhzG7DG4BPBJcOFrq4kVdVJTaqnWkmCHSAJFBIlU
         xgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ERi+NlA29+yVcJDcfrlh6UOk0oJg7e1mqQhER0NvoZE=;
        fh=0cJcinrZnucqYjSNYncb6+eMGja84j/gs35YiXtiMHU=;
        b=jyhqd1dkOo4TsvdNUAtj5JGYDgmibdCMnf7bV9+Sq71feUAfxoubNQbsCjVlUbVU7H
         3Qpvme4y/XaE43/K+6a2Jb0KW3sbsTDpmXtIjFr5SEahuqs6hliBV7bDzHomU5l2dua7
         JKMcCV2ZOW2EBDG1enieg6W3ead14DuqOcUjiP2oK1DYMEqhjKA8BzogVe+KO4ZawVqH
         1I46KNuho2awSv0fUUhF8PZm3ZUgC5JvmnDdzGpOHwupNnrwSuHwJTm5bDfDbnLV5tVq
         pp1lmEXu+YzUuPcaOFRM51uzZTFWXG10i192HQptHAKbyX0m/0Ds9Pqv6vHW1k3iFo7s
         Zg2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="UAxIdab/";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534787b9dsi31732186d6.435.2024.09.08.05.43.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 05:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="UAxIdab/";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799419; x=1757335419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TSPfc9jnTH+S6KC1J5SxKbz8GdCtnNY8LQlYPm781xo=;
  b=UAxIdab/Jk/QjALQk4BQNiE0Xtx2KpJWh+Z2c2uijJ0WvPtswsmwP3ot
   u2I5qosgFBhihy0n/0FqawdT14h03zwl7+PU700E0b8c+simiJphp2HLM
   7S2BZHNsKYN5d/kdDzjSD2Bq5pxEXlBlfu5HhKg5+HjYcsrRQkk/ldN/F
   2FRHuZ20ML9hM88/1HLlONVsNCWLMKpEQN0Wv3GiMw+rtoLpYaFWBG6KC
   EJF6DkmXZp0/JR/mJs50BLMPQjB4LMztdb232zNvWkCDW/DYjNcA5K9v6
   aLClL23Gv/vyofKNky5AfIaJBhSIJHk9EB1tdAhr+vEQtGNfdKtAhK4qd
   g==;
X-CSE-ConnectionGUID: nyVYzU2lQraj01QnNg8NOA==
X-CSE-MsgGUID: Bhq7oQfhT/iVsfLaR0+FAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28238136"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28238136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:43:38 -0700
X-CSE-ConnectionGUID: AjKzOl2aREyuLMigLk23Mg==
X-CSE-MsgGUID: AsWhvwaES2qXYgNnMwSxEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97196521"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 05:43:32 -0700
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
Subject: [PATCH v2 2/7] qapi/qom: Define cache enumeration and properties
Date: Sun,  8 Sep 2024 20:59:15 +0800
Message-Id: <20240908125920.1160236-3-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240908125920.1160236-1-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7tNdn05GjSjy

The x86 and ARM need to allow user to configure cache properties
(current only topology):
 * For x86, the default cache topology model (of max/host CPU) does not
   always match the Host's real physical cache topology. Performance can
   increase when the configured virtual topology is closer to the
   physical topology than a default topology would be.
 * For ARM, QEMU can't get the cache topology information from the CPU
   registers, then user configuration is necessary. Additionally, the
   cache information is also needed for MPAM emulation (for TCG) to
   build the right PPTT.

Define smp-cache related enumeration and properties in QAPI, so that
user could configure cache properties for SMP system through -machine in
the subsequent patch.

Cache enumeration (CacheLevelAndType) is implemented as the combination
of cache level (level 1/2/3) and cache type (data/instruction/unified).

Currently, separated L1 cache (L1 data cache and L1 instruction cache)
with unified higher-level cache (e.g., unified L2 and L3 caches), is the
most common cache architectures.

Therefore, enumerate the L1 D-cache, L1 I-cache, L2 cache and L3 cache
with smp-cache object to add the basic cache topology support. Other
kinds of caches (e.g., L1 unified or L2/L3 separated caches) can be
added directly into CacheLevelAndType if necessary.

Cache properties (SmpCacheProperties) currently only contains cache
topology information, and other cache properties can be added in it
if necessary.

Note, define cache topology based on CPU topology level with two
reasons:

 1. In practice, a cache will always be bound to the CPU container
    (either private in the CPU container or shared among multiple
    containers), and CPU container is often expressed in terms of CPU
    topology level.
 2. The x86's cache-related CPUIDs encode cache topology based on APIC
    ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
    relies on also requires CPU containers to help indicate the private
    shared hierarchy of the cache. Therefore, for SMP systems, it is
    natural to use the CPU topology hierarchy directly in QEMU to define
    the cache topology.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
---
Suggested by credit:
 * Referred to Daniel's suggestion to introduce cache object list.
---
Changes since Patch v1:
 * Renamed SMPCacheProperty/SMPCacheProperties (QAPI structures) to
   SmpCacheProperties/SmpCachePropertiesWrapper. (Markus)
 * Renamed SMPCacheName (QAPI structure) to SmpCacheLevelAndType and
   dropped prefix. (Markus)
 * Renamed 'name' field in SmpCacheProperties to 'cache', since the
   type and level of the cache in SMP system could be able to specify
   all of these kinds of cache explicitly enough.
 * Renamed 'topo' field in SmpCacheProperties to 'topology'. (Markus)
 * Returned error information when user repeats setting cache
   properties. (Markus)
 * Renamed SmpCacheLevelAndType to CacheLevelAndType, since this
   representation is general across SMP or hybrid system.
 * Dropped handwriten smp-cache object and integrated cache pproperties
   list into MachineState (in next patch). (Markus)
 * Added the reason why x86 and ARM need to configure cache
   information. (Markus and Jonathan)

Changes since RFC v2:
 * New commit to implement cache list with JSON format instead of
   multiple sub-options in -smp.
---
 qapi/machine-common.json | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/qapi/machine-common.json b/qapi/machine-common.json
index 148a2c8dccca..f6fe1a208214 100644
--- a/qapi/machine-common.json
+++ b/qapi/machine-common.json
@@ -63,3 +63,53 @@
 { 'enum': 'CpuTopologyLevel',
   'data': [ 'invalid', 'thread', 'core', 'module', 'cluster',
             'die', 'socket', 'book', 'drawer', 'default' ] }
+
+##
+# @CacheLevelAndType:
+#
+# Caches a system may have.  The enumeration value here is the
+# combination of cache level and cache type.
+#
+# @l1d: L1 data cache.
+#
+# @l1i: L1 instruction cache.
+#
+# @l2: L2 (unified) cache.
+#
+# @l3: L3 (unified) cache
+#
+# Since: 9.1
+##
+{ 'enum': 'CacheLevelAndType',
+  'data': [ 'l1d', 'l1i', 'l2', 'l3' ] }
+
+##
+# @SmpCacheProperties:
+#
+# Cache information for SMP system.
+#
+# @cache: Cache name, which is the combination of cache level
+#     and cache type.
+#
+# @topology: Cache topology level.  It accepts the CPU topology
+#     enumeration as the parameter, i.e., CPUs in the same
+#     topology container share the same cache.
+#
+# Since: 9.1
+##
+{ 'struct': 'SmpCacheProperties',
+  'data': {
+  'cache': 'CacheLevelAndType',
+  'topology': 'CpuTopologyLevel' } }
+
+##
+# @SmpCachePropertiesWrapper:
+#
+# List wrapper of SmpCacheProperties.
+#
+# @caches: the list of SmpCacheProperties.
+#
+# Since 9.1
+##
+{ 'struct': 'SmpCachePropertiesWrapper',
+  'data': { 'caches': ['SmpCacheProperties'] } }
-- 
2.34.1

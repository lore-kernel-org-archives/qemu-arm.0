Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333224njb;
        Wed, 3 Jul 2024 20:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWMI3pIikQXYtacN5k97TZll1m52IMXtTn6uiXnUMYOzcIgKHiHILUE5qaOMDW4bPGTg/oiB8AgjnEMkDnWtgSusfScJij
X-Google-Smtp-Source: AGHT+IHju1dKuEzNHbLx0Re+2lYQkUTjgiMmmWpc3GTIds4zlyHPCtZE/kGCgGuz6PMlyZYIoA6O
X-Received: by 2002:a67:fd99:0:b0:48c:376f:fbfe with SMTP id ada2fe7eead31-48fee6dcb3cmr273775137.14.1720062039421;
        Wed, 03 Jul 2024 20:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062039; cv=none;
        d=google.com; s=arc-20160816;
        b=e7/00yjsYb8PVQSVKGVhnY56fh+9B33DaT5yaSbnzIT4wwivfHHZKor3tBYHc6Q5Rz
         sBwUKqs3AwF9F9YG57rO19IVtUiEIoSnEIiDNvuzgmKaXaJH6EBoJ5nfg1DcxHJXN+Pi
         GLjt1UKGW571oUmyVa1KCK1eERWbBqwGp0nmPgpTlhXHes6srn0pWfBcshjIEAtQYHas
         xmDmKD/41Wdjykz+UyS8ft2acl2d6b1Fv5B5YxKCj80icNLgORqXs+OBT5pvbBOhFran
         BM9qD/ohHh6y3XJYt4wRKTDmRlFIDdmpvvZzfpxSIezWY5TQR1e8Ex5QqHDlmnf6H6Qt
         8MXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PhzQsfV+QYZT3bmAs+Z1Ce/P88j7PjzxkrIMeIY79Wk=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=A2leKxLjw08amNlNpObLlwhI04taqo+GPVVxrfXk8G530phQaJEduKdFGHyA+x5HSM
         pMDY0iYf16XV+kGEre7DfsyniIRA3T5Jq0la0STR+GyK1oCSjGjsj5V+uLdvK6IB7P/j
         CguT5jhubH53l4OHL9nLU+0ha/BzEBG9gKk6AwXx1zEPoJMePb36RUjWfI7X+uTJWLi5
         9h2mZva0xiTldbDXMkHCaTdacAo9csndA89G+kPa046l0NcByzQimbFWkCudgzdUJIbw
         tsBUz4C+ucreTvAzaV0ULtukEebBbmm5ParJ0n75TcMWMj54dX/z0BJufhw7CZgvUmAX
         efhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="RmO/4r1a";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id af79cd13be357-79d6933ab68si1386575085a.574.2024.07.03.20.00.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="RmO/4r1a";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062039; x=1751598039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y8DVuwDfBOx2kUhfnbErHM6n5qAnJYcEiam1NpZS4vU=;
  b=RmO/4r1aTf6/xmdQXVtVk9EZo9rXSm1ycONk5cn9ADmSirKmgk3aRwDD
   R+QE+3BQJnJ8oFMyl06/aVRgMQBppllN81WqDQ389H42Gc+dUzD5c0YpZ
   Fh9sqbZIYp/tiZzmEbXgF5bxd6c+KbMV0YDXBMI5HCsUh5KynpL3Vtc5w
   +v+fGx+gC8nFNPWcviZQfS694giV7V/XqVHCJWNXLNpabcVrXtO99qdYn
   rWmTzlTM52NaIzAl5s5Tnzp+tAxOTGfzuqPuDMa6VBjcF+I/ieP7zKM5q
   MiL47dBxM0ARXbbn8keXg0aWqFgW6+ORnHzqiH+4gXqW5cqEFeoJaVEfj
   A==;
X-CSE-ConnectionGUID: 1YqxxojfQJm11Jl5IkrpEA==
X-CSE-MsgGUID: TkFJ+aJuRT2LVb0zHkJivQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838062"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:00:38 -0700
X-CSE-ConnectionGUID: i3qXcV1FRi2zABduduwTiQ==
X-CSE-MsgGUID: nB3x+nD7SyOCQEcI6EAoig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052118"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:00:33 -0700
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
Subject: [PATCH 1/8] hw/core: Make CPU topology enumeration arch-agnostic
Date: Thu,  4 Jul 2024 11:15:56 +0800
Message-Id: <20240704031603.1744546-2-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YKnuaE50TF9M

Cache topology needs to be defined based on CPU topology levels. Thus,
define CPU topology enumeration in qapi/machine.json to make it generic
for all architectures.

To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
CPU_TOPO_LEVEL_SOCKET.

Also, enumerate additional topology levels for non-i386 arches, and add
a CPU_TOPO_LEVEL_DEFAULT to help future smp-cache object de-compatibilize
arch-specific cache topology settings.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since RFC v2:
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

Changes since RFC v1:
 * Used QAPI to enumerate CPU topology levels.
 * Dropped string_to_cpu_topo() since QAPI will help to parse the topo
   levels.
---
 include/hw/i386/topology.h | 18 +--------------
 qapi/machine-common.json   | 47 +++++++++++++++++++++++++++++++++++++-
 target/i386/cpu.c          | 38 +++++++++++++++---------------
 target/i386/cpu.h          |  4 ++--
 4 files changed, 68 insertions(+), 39 deletions(-)

diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index dff49fce1154..10d05ff045c7 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -39,7 +39,7 @@
  *  CPUID Fn8000_0008_ECX[ApicIdCoreIdSize[3:0]] is set to apicid_core_width().
  */
 
-
+#include "qapi/qapi-types-machine-common.h"
 #include "qemu/bitops.h"
 
 /*
@@ -62,22 +62,6 @@ typedef struct X86CPUTopoInfo {
     unsigned threads_per_core;
 } X86CPUTopoInfo;
 
-/*
- * CPUTopoLevel is the general i386 topology hierarchical representation,
- * ordered by increasing hierarchical relationship.
- * Its enumeration value is not bound to the type value of Intel (CPUID[0x1F])
- * or AMD (CPUID[0x80000026]).
- */
-enum CPUTopoLevel {
-    CPU_TOPO_LEVEL_INVALID,
-    CPU_TOPO_LEVEL_SMT,
-    CPU_TOPO_LEVEL_CORE,
-    CPU_TOPO_LEVEL_MODULE,
-    CPU_TOPO_LEVEL_DIE,
-    CPU_TOPO_LEVEL_PACKAGE,
-    CPU_TOPO_LEVEL_MAX,
-};
-
 /* Return the bit width needed for 'count' IDs */
 static unsigned apicid_bitwidth_for_count(unsigned count)
 {
diff --git a/qapi/machine-common.json b/qapi/machine-common.json
index fa6bd71d1280..82413c668bdb 100644
--- a/qapi/machine-common.json
+++ b/qapi/machine-common.json
@@ -5,7 +5,7 @@
 # See the COPYING file in the top-level directory.
 
 ##
-# = Machines S390 data types
+# = Common machine types
 ##
 
 ##
@@ -19,3 +19,48 @@
 { 'enum': 'CpuS390Entitlement',
   'prefix': 'S390_CPU_ENTITLEMENT',
   'data': [ 'auto', 'low', 'medium', 'high' ] }
+
+##
+# @CpuTopologyLevel:
+#
+# An enumeration of CPU topology levels.
+#
+# @invalid: Invalid topology level.
+#
+# @thread: thread level, which would also be called SMT level or
+#     logical processor level.  The @threads option in
+#     SMPConfiguration is used to configure the topology of this
+#     level.
+#
+# @core: core level.  The @cores option in SMPConfiguration is used
+#     to configure the topology of this level.
+#
+# @module: module level.  The @modules option in SMPConfiguration is
+#     used to configure the topology of this level.
+#
+# @cluster: cluster level.  The @clusters option in SMPConfiguration
+#     is used to configure the topology of this level.
+#
+# @die: die level.  The @dies option in SMPConfiguration is used to
+#     configure the topology of this level.
+#
+# @socket: socket level, which would also be called package level.
+#     The @sockets option in SMPConfiguration is used to configure
+#     the topology of this level.
+#
+# @book: book level.  The @books option in SMPConfiguration is used
+#     to configure the topology of this level.
+#
+# @drawer: drawer level.  The @drawers option in SMPConfiguration is
+#     used to configure the topology of this level.
+#
+# @default: default level.  Some architectures will have default
+#     topology settings (e.g., cache topology), and this special
+#     level means following the architecture-specific settings.
+#
+# Since: 9.1
+##
+{ 'enum': 'CpuTopologyLevel',
+  'prefix': 'CPU_TOPO_LEVEL',
+  'data': [ 'invalid', 'thread', 'core', 'module', 'cluster',
+            'die', 'socket', 'book', 'drawer', 'default' ] }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4c2e6f3a71e9..4ae3bbf30682 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -236,7 +236,7 @@ static uint8_t cpuid2_cache_descriptor(CPUCacheInfo *cache)
                        0 /* Invalid value */)
 
 static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
-                                         enum CPUTopoLevel share_level)
+                                         enum CpuTopologyLevel share_level)
 {
     uint32_t num_ids = 0;
 
@@ -247,12 +247,12 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
     case CPU_TOPO_LEVEL_DIE:
         num_ids = 1 << apicid_die_offset(topo_info);
         break;
-    case CPU_TOPO_LEVEL_PACKAGE:
+    case CPU_TOPO_LEVEL_SOCKET:
         num_ids = 1 << apicid_pkg_offset(topo_info);
         break;
     default:
         /*
-         * Currently there is no use case for SMT and MODULE, so use
+         * Currently there is no use case for THREAD and MODULE, so use
          * assert directly to facilitate debugging.
          */
         g_assert_not_reached();
@@ -301,10 +301,10 @@ static void encode_cache_cpuid4(CPUCacheInfo *cache,
 }
 
 static uint32_t num_threads_by_topo_level(X86CPUTopoInfo *topo_info,
-                                          enum CPUTopoLevel topo_level)
+                                          enum CpuTopologyLevel topo_level)
 {
     switch (topo_level) {
-    case CPU_TOPO_LEVEL_SMT:
+    case CPU_TOPO_LEVEL_THREAD:
         return 1;
     case CPU_TOPO_LEVEL_CORE:
         return topo_info->threads_per_core;
@@ -313,7 +313,7 @@ static uint32_t num_threads_by_topo_level(X86CPUTopoInfo *topo_info,
     case CPU_TOPO_LEVEL_DIE:
         return topo_info->threads_per_core * topo_info->cores_per_module *
                topo_info->modules_per_die;
-    case CPU_TOPO_LEVEL_PACKAGE:
+    case CPU_TOPO_LEVEL_SOCKET:
         return topo_info->threads_per_core * topo_info->cores_per_module *
                topo_info->modules_per_die * topo_info->dies_per_pkg;
     default:
@@ -323,10 +323,10 @@ static uint32_t num_threads_by_topo_level(X86CPUTopoInfo *topo_info,
 }
 
 static uint32_t apicid_offset_by_topo_level(X86CPUTopoInfo *topo_info,
-                                            enum CPUTopoLevel topo_level)
+                                            enum CpuTopologyLevel topo_level)
 {
     switch (topo_level) {
-    case CPU_TOPO_LEVEL_SMT:
+    case CPU_TOPO_LEVEL_THREAD:
         return 0;
     case CPU_TOPO_LEVEL_CORE:
         return apicid_core_offset(topo_info);
@@ -334,7 +334,7 @@ static uint32_t apicid_offset_by_topo_level(X86CPUTopoInfo *topo_info,
         return apicid_module_offset(topo_info);
     case CPU_TOPO_LEVEL_DIE:
         return apicid_die_offset(topo_info);
-    case CPU_TOPO_LEVEL_PACKAGE:
+    case CPU_TOPO_LEVEL_SOCKET:
         return apicid_pkg_offset(topo_info);
     default:
         g_assert_not_reached();
@@ -342,12 +342,12 @@ static uint32_t apicid_offset_by_topo_level(X86CPUTopoInfo *topo_info,
     return 0;
 }
 
-static uint32_t cpuid1f_topo_type(enum CPUTopoLevel topo_level)
+static uint32_t cpuid1f_topo_type(enum CpuTopologyLevel topo_level)
 {
     switch (topo_level) {
     case CPU_TOPO_LEVEL_INVALID:
         return CPUID_1F_ECX_TOPO_LEVEL_INVALID;
-    case CPU_TOPO_LEVEL_SMT:
+    case CPU_TOPO_LEVEL_THREAD:
         return CPUID_1F_ECX_TOPO_LEVEL_SMT;
     case CPU_TOPO_LEVEL_CORE:
         return CPUID_1F_ECX_TOPO_LEVEL_CORE;
@@ -371,7 +371,7 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
     unsigned long level, next_level;
     uint32_t num_threads_next_level, offset_next_level;
 
-    assert(count + 1 < CPU_TOPO_LEVEL_MAX);
+    assert(count + 1 < CPU_TOPO_LEVEL__MAX);
 
     /*
      * Find the No.(count + 1) topology level in avail_cpu_topo bitmap.
@@ -380,7 +380,7 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
     level = CPU_TOPO_LEVEL_INVALID;
     for (int i = 0; i <= count; i++) {
         level = find_next_bit(env->avail_cpu_topo,
-                              CPU_TOPO_LEVEL_PACKAGE,
+                              CPU_TOPO_LEVEL_SOCKET,
                               level + 1);
 
         /*
@@ -388,7 +388,7 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
          * and it just encodes the invalid level (all fields are 0)
          * into the last subleaf of 0x1f.
          */
-        if (level == CPU_TOPO_LEVEL_PACKAGE) {
+        if (level == CPU_TOPO_LEVEL_SOCKET) {
             level = CPU_TOPO_LEVEL_INVALID;
             break;
         }
@@ -399,7 +399,7 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
         offset_next_level = 0;
     } else {
         next_level = find_next_bit(env->avail_cpu_topo,
-                                   CPU_TOPO_LEVEL_PACKAGE,
+                                   CPU_TOPO_LEVEL_SOCKET,
                                    level + 1);
         num_threads_next_level = num_threads_by_topo_level(topo_info,
                                                            next_level);
@@ -6462,7 +6462,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
                     /* Share the cache at package level. */
                     *eax |= max_thread_ids_for_cache(&topo_info,
-                                CPU_TOPO_LEVEL_PACKAGE) << 14;
+                                CPU_TOPO_LEVEL_SOCKET) << 14;
                 }
             }
         } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
@@ -7963,10 +7963,10 @@ static void x86_cpu_init_default_topo(X86CPU *cpu)
     env->nr_modules = 1;
     env->nr_dies = 1;
 
-    /* SMT, core and package levels are set by default. */
-    set_bit(CPU_TOPO_LEVEL_SMT, env->avail_cpu_topo);
+    /* thread, core and socket levels are set by default. */
+    set_bit(CPU_TOPO_LEVEL_THREAD, env->avail_cpu_topo);
     set_bit(CPU_TOPO_LEVEL_CORE, env->avail_cpu_topo);
-    set_bit(CPU_TOPO_LEVEL_PACKAGE, env->avail_cpu_topo);
+    set_bit(CPU_TOPO_LEVEL_SOCKET, env->avail_cpu_topo);
 }
 
 static void x86_cpu_initfn(Object *obj)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 29daf3704857..9ddba249aa9e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1653,7 +1653,7 @@ typedef struct CPUCacheInfo {
      * Used to encode CPUID[4].EAX[bits 25:14] or
      * CPUID[0x8000001D].EAX[bits 25:14].
      */
-    enum CPUTopoLevel share_level;
+    CpuTopologyLevel share_level;
 } CPUCacheInfo;
 
 
@@ -1979,7 +1979,7 @@ typedef struct CPUArchState {
     unsigned nr_modules;
 
     /* Bitmap of available CPU topology levels for this CPU. */
-    DECLARE_BITMAP(avail_cpu_topo, CPU_TOPO_LEVEL_MAX);
+    DECLARE_BITMAP(avail_cpu_topo, CPU_TOPO_LEVEL__MAX);
 } CPUX86State;
 
 struct kvm_msrs;
-- 
2.34.1

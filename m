Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1174602ejb;
        Tue, 20 Feb 2024 01:11:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+ufxwVaOu9t5/xz5G97XnruC2GUpHx01fF3ucZMo0DC3eD3EuHppBVWZ5FHgT5Bf24V6b1fqoYkZrGfWr3TouYUazIY6N
X-Google-Smtp-Source: AGHT+IH49baRfcg7tjLDBNP8A7qmSYQ9XioW5Sr72d4zd0Io0AMK2yPoEm+BKHQFhtba+dTce3bx
X-Received: by 2002:a05:620a:1a2a:b0:787:6a5b:37f with SMTP id bk42-20020a05620a1a2a00b007876a5b037fmr4946040qkb.47.1708420311854;
        Tue, 20 Feb 2024 01:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708420311; cv=none;
        d=google.com; s=arc-20160816;
        b=K3QG4yJCuCLE4B3ms+d9yFaw4U2z1JY9ja7ZL8LDAxC4hLZoWPxZdlYpY1hSKY4KVr
         YeWwCJp1d0YBLxcmBoy0H5eR1thy2t7g0NWFDOp6K64ivZyjKXlJNXSnq0v2nV+z3FQj
         w+GEH5wED7JV1rGQwspoqU9oZVHKnrcCe++wlF+J6tT+CwZMmWjVjqYlyN0ECFQXj0mD
         PaONGeTQSdZ2ib5YthLqQoYWgRbF9NdYOJwADI75s3KRQ/unYEv+XPnF3bJJplkp2pNo
         YwNTEllVB6llLmtE4dDLXI8CLe3abKHpz3BxmghV+zJ8qS/wqZUR2MdnT6kJxfdOTFEA
         ICJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fX/ovjyGqpZ77jDPMaGP9R2s47Hh/ie90qAXMY/eHKU=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=VvwlNbI8qzsO1KIrzkG+f7+zySVbsNDNmsChWtMAojy8fhaasgP9gzxiPowe5WOCa3
         9lAQ4L/iTgpy8uzQiUdmbx3g5Ce+4mAaPZVYsEqAhUXjtQDkcgqf0zxi5N/Tcbq0Cnf6
         5hukujjyyva9bx7fg/YL5PJEV0OFYlovBgHsb82tAhL2coOv0DkIR7WOqcqh3e564EI0
         SLqDD7yYeQq1UfvH7qjZIoyaZy0+8HaV7JJUQwcLPc/gT8tg71F21Hp5Dd5OK7ipKEKV
         HK8ptHzvFnqDyS0BgS4/M+t0foMwTdYy0mwe3zM4Y+5FSaGudf0jq1KoNob82JrI6qzi
         h8pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cavAbEIv;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id qs15-20020a05620a394f00b007873af4a4e7si9151366qkn.764.2024.02.20.01.11.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:11:51 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cavAbEIv;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708420312; x=1739956312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f72SFWwq+PohiF2H5sIw0CnPQG3e0SkCa+ntNndt4BU=;
  b=cavAbEIvqoaU/TefZJ9Ycp3nrWad3Jsjr/+FVXFtcQP2eunJOYoT2+vH
   pLO3ivpG5mNDj/96/l9GmQPh0R81UPtie9y/5v1O1YCumxbvFtvCV5Unf
   U2uUKD4alYB+5nKCJHtALtDWJ2GxvSz5lNE/Qg8xN/zYfxgq038tBRSRV
   ACeLxx45c4MGroiu2XMhqiIXn7c9gpFH1KyzS9WqLWg7ACOR+D9mrP7A8
   uyGGJUTxM7fsbmyk8UTwffjdtfRMqC59xz2N9Th+42oQ5vOiyQ8TMIrvm
   gGCyTgEc9UWKmTkHNRC0xfupgmmlL7W1G+bBqd3L9xsJGTLXBjsyp9SjO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2374956"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2374956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5012851"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2024 01:11:45 -0800
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
Subject: [RFC 1/8] hw/core: Rename CpuTopology to CPUTopology
Date: Tue, 20 Feb 2024 17:24:57 +0800
Message-Id: <20240220092504.726064-2-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hon/J4UzmQcQ

From: Zhao Liu <zhao1.liu@intel.com>

Use CPUTopology to honor the generic style of CPU capitalization
abbreviations.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/s390x/cpu-topology.c         |  6 +++---
 include/hw/boards.h             |  8 ++++----
 include/hw/s390x/cpu-topology.h |  6 +++---
 tests/unit/test-smp-parse.c     | 14 +++++++-------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
index f16bdf65faa0..016f6c1c15ac 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -86,7 +86,7 @@ bool s390_has_topology(void)
  */
 static void s390_topology_init(MachineState *ms)
 {
-    CpuTopology *smp = &ms->smp;
+    CPUTopology *smp = &ms->smp;
 
     s390_topology.cores_per_socket = g_new0(uint8_t, smp->sockets *
                                             smp->books * smp->drawers);
@@ -181,7 +181,7 @@ void s390_topology_reset(void)
  */
 static bool s390_topology_cpu_default(S390CPU *cpu, Error **errp)
 {
-    CpuTopology *smp = &current_machine->smp;
+    CPUTopology *smp = &current_machine->smp;
     CPUS390XState *env = &cpu->env;
 
     /* All geometry topology attributes must be set or all unset */
@@ -234,7 +234,7 @@ static bool s390_topology_check(uint16_t socket_id, uint16_t book_id,
                                 uint16_t drawer_id, uint16_t entitlement,
                                 bool dedicated, Error **errp)
 {
-    CpuTopology *smp = &current_machine->smp;
+    CPUTopology *smp = &current_machine->smp;
 
     if (socket_id >= smp->sockets) {
         error_setg(errp, "Unavailable socket: %d", socket_id);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 78dea50054a1..e63dec919da2 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -333,7 +333,7 @@ typedef struct DeviceMemoryState {
 } DeviceMemoryState;
 
 /**
- * CpuTopology:
+ * CPUTopology:
  * @cpus: the number of present logical processors on the machine
  * @drawers: the number of drawers on the machine
  * @books: the number of books in one drawer
@@ -345,7 +345,7 @@ typedef struct DeviceMemoryState {
  * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
  */
-typedef struct CpuTopology {
+typedef struct CPUTopology {
     unsigned int cpus;
     unsigned int drawers;
     unsigned int books;
@@ -356,7 +356,7 @@ typedef struct CpuTopology {
     unsigned int cores;
     unsigned int threads;
     unsigned int max_cpus;
-} CpuTopology;
+} CPUTopology;
 
 /**
  * MachineState:
@@ -407,7 +407,7 @@ struct MachineState {
     const char *cpu_type;
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
-    CpuTopology smp;
+    CPUTopology smp;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
index c064f427e948..ff09c57a4428 100644
--- a/include/hw/s390x/cpu-topology.h
+++ b/include/hw/s390x/cpu-topology.h
@@ -63,17 +63,17 @@ static inline void s390_topology_reset(void)
 
 extern S390Topology s390_topology;
 
-static inline int s390_std_socket(int n, CpuTopology *smp)
+static inline int s390_std_socket(int n, CPUTopology *smp)
 {
     return (n / smp->cores) % smp->sockets;
 }
 
-static inline int s390_std_book(int n, CpuTopology *smp)
+static inline int s390_std_book(int n, CPUTopology *smp)
 {
     return (n / (smp->cores * smp->sockets)) % smp->books;
 }
 
-static inline int s390_std_drawer(int n, CpuTopology *smp)
+static inline int s390_std_drawer(int n, CPUTopology *smp)
 {
     return (n / (smp->cores * smp->sockets * smp->books)) % smp->drawers;
 }
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 24972666a74d..f660d6b0df45 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -86,8 +86,8 @@
  */
 typedef struct SMPTestData {
     SMPConfiguration config;
-    CpuTopology expect_prefer_sockets;
-    CpuTopology expect_prefer_cores;
+    CPUTopology expect_prefer_sockets;
+    CPUTopology expect_prefer_cores;
     const char *expect_error;
 } SMPTestData;
 
@@ -395,7 +395,7 @@ static char *smp_config_to_string(const SMPConfiguration *config)
 }
 
 /* Use the different calculation than machine_topo_get_threads_per_socket(). */
-static unsigned int cpu_topology_get_threads_per_socket(const CpuTopology *topo)
+static unsigned int cpu_topology_get_threads_per_socket(const CPUTopology *topo)
 {
     /* Check the divisor to avoid invalid topology examples causing SIGFPE. */
     if (!topo->sockets) {
@@ -406,7 +406,7 @@ static unsigned int cpu_topology_get_threads_per_socket(const CpuTopology *topo)
 }
 
 /* Use the different calculation than machine_topo_get_cores_per_socket(). */
-static unsigned int cpu_topology_get_cores_per_socket(const CpuTopology *topo)
+static unsigned int cpu_topology_get_cores_per_socket(const CPUTopology *topo)
 {
     /* Check the divisor to avoid invalid topology examples causing SIGFPE. */
     if (!topo->threads) {
@@ -416,12 +416,12 @@ static unsigned int cpu_topology_get_cores_per_socket(const CpuTopology *topo)
     }
 }
 
-static char *cpu_topology_to_string(const CpuTopology *topo,
+static char *cpu_topology_to_string(const CPUTopology *topo,
                                     unsigned int threads_per_socket,
                                     unsigned int cores_per_socket)
 {
     return g_strdup_printf(
-        "(CpuTopology) {\n"
+        "(CPUTopology) {\n"
         "    .cpus               = %u,\n"
         "    .sockets            = %u,\n"
         "    .dies               = %u,\n"
@@ -438,7 +438,7 @@ static char *cpu_topology_to_string(const CpuTopology *topo,
 }
 
 static void check_parse(MachineState *ms, const SMPConfiguration *config,
-                        const CpuTopology *expect_topo, const char *expect_err,
+                        const CPUTopology *expect_topo, const char *expect_err,
                         bool is_valid)
 {
     g_autofree char *config_str = smp_config_to_string(config);
-- 
2.34.1

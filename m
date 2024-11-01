Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp276717njc;
        Fri, 1 Nov 2024 01:16:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoCdyw02AbpmvtbUpeZO/YqpJkZieIq8E756KCc/X14LctgdHdWiuOXNNS/CYYXblHEVaHOmZBNYdTyw==@linaro.org
X-Google-Smtp-Source: AGHT+IF6B+pkFc/rW51hpdPh2n4ZwKA/oyIeKY3sKe5uHOZX4gERhv2yghmg99TBbZUW32qnMtyd
X-Received: by 2002:a05:622a:3ce:b0:461:4472:b0ef with SMTP id d75a77b69052e-462ab31db7emr79204021cf.57.1730448965297;
        Fri, 01 Nov 2024 01:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730448965; cv=none;
        d=google.com; s=arc-20240605;
        b=JLmvwFRk84Uv6qHTugF2PbRCQ0lHdJnUsZGifIf1/cFsb2+5g3kcTMVtv74r/89NKc
         pnayQrmCaJrCqGm++F5zTuhftf/K6/Zm2Ok+d6MB8VDcdnadQoywVuZQwJF0GaIlBEu8
         K1zGg6kAFL1kM8DyQo+gzExJeJi5ua+MOHpT0xEYLL8HUy5OYs+qWyiF6163ighc8nH5
         R0nF4CytoeBmKF7RQZ1Vxr5zQOb4c3l00kOUbeKfFuTQaiUnooe0fV4jDMeykcqlePhx
         wkVi2AQ/RMlfuKW2kIYiFWt4+kFbY65xx+W8ZB6f2AOgGpb4DWVzqcxYs85FqVnt9zqX
         5LsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=tHdWdtX/FL6m1+sUGMRuUXl0gcJWTfNyMeK/MYpCyrs=;
        fh=/Q7DFfK0c6lcL5pNzN/8+EzqG4IF+hoXAsi0Ur0bC2k=;
        b=dFmq2FNMp4360AXGRgARfZSOXK5ImLxk3ymPgPz2D9CqX8oqe7nPKAXz3rs7YApT1w
         Z2cFPZUqduKv/kH+nxkaYAswR2US6Kr0YLjj7SJcx3haNV1W3pYVgSvYZNE07GzkIJen
         femdVqeNaNIKEakqIpqRvZzSyIH0nwEscmJW8HRKkZgmQsRmCfy4gaqK87wMMUwrRLCW
         NW5m/DTYylMtyox/2n7MQp7vOjqXpy2Yx4F1bOeRz7kt0xGz7KtqWrGmfXgSxMuiiRIB
         KSvgpZvaIbsko2ypckv/vQpnLLB21DvWbjpPTpf6kSLlyL43tuklQs7zyIUB71YkRcuA
         2Q5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=l6zpyYvF;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b2030si40528111cf.75.2024.11.01.01.16.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=l6zpyYvF;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448965; x=1761984965;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1dPWfn08NUNqOZ5PO7IBAQYY2uK5uWynR2m08PGiW3k=;
  b=l6zpyYvFGX7ygqc2KMqdauMp7YVuElBuWXs50/UZ6KsB4oRUOQIK9Cib
   fFmsn9QtBsG3VbIkUoysgNmBQ2dRELFNZXMsoZzQOMKeSa/7KZVj2jZBK
   RsfEiF6gftKLdPVt1BfSkQltLSvvtp1UezCwYNhTKjyZ5DLBnrG2KKHgv
   PjNSwh9p1mbRPPjjgtJMRGMryLdWMiJ+Tz4jdNfu8vQGWlvm3Ts+qbmYB
   WCPeBCGMaGn732kKkB5E4EKgvTsNj9jMTah4PgG+VWTdrBRc77gYiwJmv
   LJrTyW8DDVWgKWMqP1RcVE+7ZhVcADSy7nOq6sg8CCMqFjwZ3p2D9F4Kr
   g==;
X-CSE-ConnectionGUID: a3LsaMzZQMmJzKVQmvSc7Q==
X-CSE-MsgGUID: Ir5iMb9gRTSjxKefiuGz/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17846004"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17846004"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:16:04 -0700
X-CSE-ConnectionGUID: LUBhdBhGQwKOVlizCOoROQ==
X-CSE-MsgGUID: R3gWI9O9St23dpn0CDALbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834558"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:15:59 -0700
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
Subject: [PATCH v5 1/9] i386/cpu: Don't enumerate the "invalid" CPU topology level
Date: Fri,  1 Nov 2024 16:33:23 +0800
Message-Id: <20241101083331.340178-2-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8FDE+w+CPY04

In the follow-up change, the CPU topology enumeration will be moved to
QAPI. And considerring "invalid" should not be exposed to QAPI as an
unsettable item, so, as a preparation for future changes, remove
"invalid" level from the current CPU topology enumeration structure
and define it by a macro instead.

Due to the removal of the enumeration of "invalid", bit 0 of
CPUX86State.avail_cpu_topo bitmap will no longer correspond to "invalid"
level, but will start at the SMT level. Therefore, to honor this change,
update the encoding rule for CPUID[0x1F].

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Tested by the following cases to ensure 0x1f's behavior hasn't
changed:
  -smp cpus=24,sockets=2,dies=3,modules=2,cores=2,threads=1
  -smp cpus=24,sockets=2,dies=1,modules=3,cores=2,threads=2
  -smp cpus=24,sockets=2,modules=3,cores=2,threads=2
  -smp cpus=24,sockets=2,dies=3,modules=1,cores=2,threads=2
  -smp cpus=24,sockets=2,dies=3,cores=2,threads=2
---
Changes since Patch v3:
  * Now commit to stop exposing "invalid" enumeration in QAPI. (Daniel)
---
 include/hw/i386/topology.h |  3 ++-
 target/i386/cpu.c          | 13 ++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index dff49fce1154..48b43edc5a90 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -62,6 +62,8 @@ typedef struct X86CPUTopoInfo {
     unsigned threads_per_core;
 } X86CPUTopoInfo;
 
+#define CPU_TOPO_LEVEL_INVALID CPU_TOPO_LEVEL_MAX
+
 /*
  * CPUTopoLevel is the general i386 topology hierarchical representation,
  * ordered by increasing hierarchical relationship.
@@ -69,7 +71,6 @@ typedef struct X86CPUTopoInfo {
  * or AMD (CPUID[0x80000026]).
  */
 enum CPUTopoLevel {
-    CPU_TOPO_LEVEL_INVALID,
     CPU_TOPO_LEVEL_SMT,
     CPU_TOPO_LEVEL_CORE,
     CPU_TOPO_LEVEL_MODULE,
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3baa95481fbc..ca13cf66a787 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -370,20 +370,21 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
                                 uint32_t *ecx, uint32_t *edx)
 {
     X86CPU *cpu = env_archcpu(env);
-    unsigned long level, next_level;
+    unsigned long level, base_level, next_level;
     uint32_t num_threads_next_level, offset_next_level;
 
-    assert(count + 1 < CPU_TOPO_LEVEL_MAX);
+    assert(count <= CPU_TOPO_LEVEL_PACKAGE);
 
     /*
      * Find the No.(count + 1) topology level in avail_cpu_topo bitmap.
-     * The search starts from bit 1 (CPU_TOPO_LEVEL_INVALID + 1).
+     * The search starts from bit 0 (CPU_TOPO_LEVEL_SMT).
      */
-    level = CPU_TOPO_LEVEL_INVALID;
+    level = CPU_TOPO_LEVEL_SMT;
+    base_level = level;
     for (int i = 0; i <= count; i++) {
         level = find_next_bit(env->avail_cpu_topo,
                               CPU_TOPO_LEVEL_PACKAGE,
-                              level + 1);
+                              base_level);
 
         /*
          * CPUID[0x1f] doesn't explicitly encode the package level,
@@ -394,6 +395,8 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
             level = CPU_TOPO_LEVEL_INVALID;
             break;
         }
+        /* Search the next level. */
+        base_level = level + 1;
     }
 
     if (level == CPU_TOPO_LEVEL_INVALID) {
-- 
2.34.1

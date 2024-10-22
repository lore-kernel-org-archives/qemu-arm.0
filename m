Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083185njb;
        Tue, 22 Oct 2024 06:36:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSqob4vAQopGQrT6GUJHWZ2j0asf1Zmj3da0CDUBdJmI5OjZjb8M65f6JiSmrSv9KSHFIlspdz3WND9w==@linaro.org
X-Google-Smtp-Source: AGHT+IENzyzSXBI2/YMOZlG9Lc6yCgobulZsb7JctzP/1GZ2B8CeeujlUcDYaDkoxY24A1aOa2S/
X-Received: by 2002:a05:620a:4483:b0:7b1:4405:c1c4 with SMTP id af79cd13be357-7b157c2eb7amr1642511285a.66.1729604175049;
        Tue, 22 Oct 2024 06:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604175; cv=none;
        d=google.com; s=arc-20240605;
        b=WRfSOg5pvbrPHsty02A3JrKxjatNMFhPUDI/cKaWQdB3uA8sYz2jmvIkXuLEZjtpm+
         e72Qi7pIQeESqQH7JLgpJFWA8Gp6ZxEOcCHOcWSCKuLKLcN+t6r7RUnh1lf2pKnA9+T9
         STFeAeG/glSD0gd8Qp3K8cFqI4tmLUmNhKT0LYEqeX2SAflAUO4H9L8Br51yZ0Uyp/sU
         9RiYHeqT9mOJVpRmT+HvgqHB5KRQljyaH06AU4m0+EY0wH0/cDcN2ZnYcvuOm5BS9YvT
         Y77tVvnKAvAuH+NI/JIZna98Brln3m66S6KXpq3v6BgGDUDMYuTGP45vukfPevhTJ6j7
         eDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s/7/7uYJ7AQ2n8eEAJtMlb601ryTuWCQLZWpaTh39LU=;
        fh=8h7shi0yfCpjWQfPt6G8q/Uhe70OsXawCuVYUheqDjs=;
        b=WmyXKFCIHt+6LWBESjR+7zeMOOUW8duai5+Sz/7w1QSUzSRy22VI9np7lSvawYBtG+
         ojjrhO6rID8BqURcsFyV5Pa0/LjsY4mbTnjgd+4W6UeV0PnmjvPTW1h1vNZ2pIyy+lmK
         KOv3Mofp+5tvBzvehNGP1jxmtDp1Bf+Op2cQk3uXAo5zqbhGUWmziFvuzPKQyrOGDT1b
         od9f4rsky3vhlltZRyMX3oXKB+7pq4zZvdDzEWAytN8gzCY/LxP/QnxoWymCnSw+j0ur
         ODvjAI4Qd4QY5NuHlw2zZwQuDX+tJXfBZcYJWZ9Oh3CZOy+UsSkW32zE8eiYpeaUlNw6
         +OWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LnsiRURu;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LnsiRURu;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604175; x=1761140175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rfk8ITGJI1L5Cei1tN2GoDq9qTCt0wMD3MSKGrYw9Os=;
  b=LnsiRURuEB8hUkztW/JM3f76laU/+t5nBawhLdFLj1uHtULDwqQWTdgl
   ykUa96wlky8NP0jCVuIdG4+us2erYsxCigFLuqZq9xKzvn93lT8js6nz5
   OSU6bXCUzs689i+yv6xfGmtDgpNU7pbRaRdT2FKL1xCk/1Ah7bgj1MvdQ
   IgAIp4cG2JuBrFU41RqGo7kB2Gnvytjve6OWZ1TmeoQ58/TCyTut70qo8
   UMbUQFcAjFTes2VT3y2ZBBs9IlvqcEXOvw+5eULFewzP1MSlwUX77RvXs
   TZT0gg7xxbnISOf29ZMxSzQtuDoyW6V0xL2EogBV6BPuxp2WCmGt0liZS
   A==;
X-CSE-ConnectionGUID: Va9wbIMqSPKo0Klh9PTpXg==
X-CSE-MsgGUID: 89Lu4HhxQQSIdWoKBYFhbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603602"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603602"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:10 -0700
X-CSE-ConnectionGUID: pTHKGFXAR5+ONseAbwlpxA==
X-CSE-MsgGUID: 3qo7ZV6NTTmPwm6Pv4ReyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782232"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:04 -0700
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
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v4 1/9] i386/cpu: Don't enumerate the "invalid" CPU topology level
Date: Tue, 22 Oct 2024 21:51:43 +0800
Message-Id: <20241022135151.2052198-2-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VHCcG11jZPiU

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
index 1ff1af032eaa..638de9c29c4c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -367,20 +367,21 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
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
@@ -391,6 +392,8 @@ static void encode_topo_cpuid1f(CPUX86State *env, uint32_t count,
             level = CPU_TOPO_LEVEL_INVALID;
             break;
         }
+        /* Search the next level. */
+        base_level = level + 1;
     }
 
     if (level == CPU_TOPO_LEVEL_INVALID) {
-- 
2.34.1

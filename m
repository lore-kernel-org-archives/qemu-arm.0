Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083410njb;
        Tue, 22 Oct 2024 06:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXu381xzC7EE+THvGjvZIP6wz4bC5g+N9AnXzfPGExedsaTuoIT60VMYY3mcyh42ZypVGl12TnAHgI6Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IHJ8iUEvoyqyvw1T1eyXP4GDNJlfOzXxye9sBo8Jx2SxtrQiYLHWwkrRDV16vjSeqbtZuL/
X-Received: by 2002:a05:620a:1722:b0:7b1:184e:a665 with SMTP id af79cd13be357-7b157bf204dmr2169654985a.59.1729604195667;
        Tue, 22 Oct 2024 06:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604195; cv=none;
        d=google.com; s=arc-20240605;
        b=jiLV4DbCcquBbmmwWZ6gdsj3JyXtIratfCi3y6kBInzm2p7L1MVMwMdREnza+q4qGt
         0T0aB5+LSr+YoXYPuIyrwUE/8wEjatoNAk56EkXykmFrOZXvke0tkNX55NpFlPRxPvUg
         LvfzHxDotpao7pORJPH0pGClPzuPTr0gxCXnJoJagCuvdLVhQSKCgzDrHC3JNTeYI211
         5L1MZeHQ/AVs6OQ2YiNour80ylEqNiPAN6oVhK/xwfPr2289NCnTn94PtTqpDGzpIhoA
         gOFxUhiJke8dujE6eNkDIgZ2ISUFGrqbq6G07YBAlXy9D8ZYakqWwWNZZ+qQOAt3MUB/
         f8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r24SK2dtWO/SgKKW6czEwW+P5IRNwWdkeYXMLKioACc=;
        fh=8h7shi0yfCpjWQfPt6G8q/Uhe70OsXawCuVYUheqDjs=;
        b=ZKD9KRefXtu9nxmu9hvw56/v1jMK5N5l6kF4Uc7Iwv6FTHEgeNV22l8Zrm6Nr7rv3l
         o2znCn3D1U/vhJFBVPM7RsNn5ZgCEeZhs1jLkFPQ30lz67urSqVs2j6cCuXdwwGM1nci
         MDWhmE9aMot7pXJ6GD0QWReOR+ZP04PxOCM5DCjrnAwX4056W4cSWX1xONr6bwyToFJ7
         Zqi2/IPn0fUAYEGR9e6sGzObvAog0nd1/ZTdyE6gvtgjiJalvH3Ky7c+YTDcFdPDXobF
         9MB7q0uIE01IQf/r4AdfTWpeUTt6sP3zVQRZSppPLWUr+CzWmSLIamLFEyEy4SIEpNi5
         IZEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fJAGjFdL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fJAGjFdL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604195; x=1761140195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Git+7j02oNMDGgTgXnT+j1SOHf1VUhf6k7CHTi5Pq3w=;
  b=fJAGjFdLZUP3rULA/k7wDxZV022CJcqgTYxJmINYyKhU2lw1h3t6ge8p
   OBt1e7x3Vd+4DbhYWTqlFt1zZkAxx5RWFqY/NHrvNrZLq56ZUHKVgvf7V
   z5bifftUCkgMqTx6VFkEymJx3bh2loyZPCYdNarDHGw0P76TJKkDuqeqQ
   ++mwNX2kAANSmCuS7fq2f2AMTyhZqDkefqSjG7idTaOri6AA9L/5ary5e
   Mkhcv31mWNV4ZwKfYvmXWkJwfXdCYSAxyohMg9TM10koJ8mVkES8KzowO
   txt/D36mRFHxKAibu2CWRsqiJrd0Dt10dd5nBa2TvFGdBjlv+4LSejT9q
   Q==;
X-CSE-ConnectionGUID: tD2jJ/z0Q+ahocq1nus1QQ==
X-CSE-MsgGUID: 8wzI4wb8Q763zgWwarfIUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603703"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:34 -0700
X-CSE-ConnectionGUID: Zu/J4WhNRKCC4Y6LAfIRJg==
X-CSE-MsgGUID: Ih/MATrcSBepcRjmz4lYDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782388"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:29 -0700
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
Subject: [PATCH v4 5/9] hw/core: Add a helper to check the cache topology level
Date: Tue, 22 Oct 2024 21:51:47 +0800
Message-Id: <20241022135151.2052198-6-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r9GZR6K0upie

Currently, we have no way to expose the arch-specific default cache
model because the cache model is sometimes related to the CPU model
(e.g., i386).

Since the user might configure "default" level, any comparison with
"default" is meaningless before the machine knows the specific level
that "default" refers to.

We can only check the correctness of the cache topology after the arch
loads the user-configured cache model from MachineState.smp_cache and
consumes the special "default" level by replacing it with the specific
level.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since Patch v3:
 * New commit to make cache topology check as a separate helper, so that
   arch-specific code could use this helper to check cache topology.
---
 hw/core/machine-smp.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   |  1 +
 2 files changed, 49 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index ebb7a134a7be..640b2114b429 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -348,3 +348,51 @@ void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
 {
     ms->smp_cache.props[cache].topology = level;
 }
+
+/*
+ * When both cache1 and cache2 are configured with specific topology levels
+ * (not default level), is cache1's topology level higher than cache2?
+ */
+static bool smp_cache_topo_cmp(const SmpCache *smp_cache,
+                               CacheLevelAndType cache1,
+                               CacheLevelAndType cache2)
+{
+    /*
+     * Before comparing, the "default" topology level should be replaced
+     * with the specific level.
+     */
+    assert(smp_cache->props[cache1].topology != CPU_TOPOLOGY_LEVEL_DEFAULT);
+
+    return smp_cache->props[cache1].topology > smp_cache->props[cache2].topology;
+}
+
+/*
+ * Currently, we have no way to expose the arch-specific default cache model
+ * because the cache model is sometimes related to the CPU model (e.g., i386).
+ *
+ * We can only check the correctness of the cache topology after the arch loads
+ * the user-configured cache model from MachineState and consumes the special
+ * "default" level by replacing it with the specific level.
+ */
+bool machine_check_smp_cache(const MachineState *ms, Error **errp)
+{
+    if (smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L1D,
+                           CACHE_LEVEL_AND_TYPE_L2) ||
+        smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L1I,
+                           CACHE_LEVEL_AND_TYPE_L2)) {
+        error_setg(errp,
+                   "Invalid smp cache topology. "
+                   "L2 cache topology level shouldn't be lower than L1 cache");
+        return false;
+    }
+
+    if (smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L2,
+                           CACHE_LEVEL_AND_TYPE_L3)) {
+        error_setg(errp,
+                   "Invalid smp cache topology. "
+                   "L3 cache topology level shouldn't be lower than L2 cache");
+        return false;
+    }
+
+    return true;
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3d6cb5acd6c7..192f78539a6e 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -53,6 +53,7 @@ CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
                                               CacheLevelAndType cache);
 void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
                                   CpuTopologyLevel level);
+bool machine_check_smp_cache(const MachineState *ms, Error **errp);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
 
 /**
-- 
2.34.1

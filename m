Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp276927njc;
        Fri, 1 Nov 2024 01:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgz1Febp1ZoXwWNPv4Vb66CitqLqdPb7PC6ivj4eRUBbuWkhWlHdhHyLpKMGqYcP9ngXI2wZRzRTpsiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH/hNDtrmZ95T/fL8a4rvcju79jds4zh533RMqjbeHvb1vLEYaDy2JPqUsRZVX/uQXsHfAl
X-Received: by 2002:a05:6214:5bc2:b0:6ce:d6c:499b with SMTP id 6a1803df08f44-6d3460b78efmr116076106d6.42.1730448999219;
        Fri, 01 Nov 2024 01:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730448999; cv=none;
        d=google.com; s=arc-20240605;
        b=MQVTVRp+PYrsfik/yi/Ygr6LquU0LvDVyjlfPFj53MRYIHkIRhIGyGAPcCP3eadCRP
         SNSMSV6QTS0Esta2fCkCaOXOY5h4BroMgs+7Q1ZaWHY1EGOR7OOsdFyB0HAh0BZOxz4f
         JNfBGAC9IkNCPXGgHl5m5jJO4lVY5nWf9+jY2xERTIecOOQCAr5rrcDBJOnNyVef0fs8
         RaTRvmFai5uPfbxz5rSAPgBggKSlyqCaLYoA28+bgs+P3OkiNdjoip+9Jp09NWS+9M/I
         OFucwQ8f7E5Vj0hQTqpaEizIXDopf5tAy2vWiB3XN0nHN+DQNMCRP/iBdZETt1CJgFw+
         4jMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qviPWeR044cXdS5udTXsEKPmpBKES18daBHsN4CzlEo=;
        fh=eaTTmp+2XhStxW3y+BHQH9dBL4m34nwTlgFlQEpn70I=;
        b=C9/PbQiUYdhGujau+kR6e2kecy631xN/bK3+0bSsENPe7mzRnfYy+18PiqwO7oxBvx
         uIxAjDZth5KVNYthzH07JZFwmyzrkgO8mKbh26x8ghXMumDV534V66IUvlUxDeAXrbWl
         k2SCX1N/R1ABNcu4HSYh3OBtm1ANeTHuTOtowh51MROxXm4RZDGoZiyFRzKEVl4ErWuS
         LiPTtlp6iNXt/n7BuCT8tSP/0VJ3N4jGJ3bcIt4Ty4Y2sAtFCrt8V9KkgSrqrVDKhoam
         Tp2wk3kn0HcgA/fPwnqcIyKDn4MSsrLR7vhCpZavtzJzRD3a8rWPxAL+lIoHOvYqIsPl
         Kt0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Ol6RNy4y;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fe4csi37605786d6.382.2024.11.01.01.16.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Ol6RNy4y;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448999; x=1761984999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bCnGCo7lhItXTGaZkRo+zcrebUj+4UEX/OLY4d7GGMM=;
  b=Ol6RNy4yEFjiLmfLg1niaR00k6N7g73q8yGPYi2y+ZiaPXJv1uXQUuQH
   aBWWaNskAbglM8U7a0pmwP4UWVDva5c0Ij7SNDN1VxJKkXF8aYnddRn0X
   VLmdjtyHkHHhyw9fKRRC8YRU6V8r/cakn4vmslhstk4nCqsvXspt3/3wR
   b4JnPSTBpfYDlMc/TZFF9J+0YQWixMzLQCKFNGZGwY5ul1olA7z1YPXy4
   fg2RR22iojGFHrMKnZGgByieAzKLRCziBifdOHSbX4qtoIhDboaQoRCFh
   +nSnprt5rKD7v0oPwLDq1WvFA+5gZbfWU2aXmwjpwrfWVuOTFDDdv8bln
   Q==;
X-CSE-ConnectionGUID: CNdeqFH1Q3670yUURQkXjA==
X-CSE-MsgGUID: qHwneG/gTmSP06Db71YTvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17846074"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17846074"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:16:38 -0700
X-CSE-ConnectionGUID: UjbTBaHpTeWvuNuNrNxO0w==
X-CSE-MsgGUID: wPlBlOj8Sd6HAXnmqU/Jng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834675"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:16:33 -0700
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
Cc: Yongwei Ma <yongwei.ma@intel.com>
Subject: [PATCH v5 7/9] i386/cpu: Update cache topology with machine's configuration
Date: Fri,  1 Nov 2024 16:33:29 +0800
Message-Id: <20241101083331.340178-8-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: by1ZLeKtshNX

User will configure smp cache topology via -machine smp-cache.

For this case, update the x86 CPUs' cache topology with user's
configuration in MachineState.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes since Patch v3:
 * Updated MachineState.smp_cache to consume "default" level and did a
   check to ensure topological hierarchical relationships are correct.
---
 target/i386/cpu.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 09aaed95a856..1cf4cda1e647 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7753,6 +7753,64 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_limits[2] = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool x86_cpu_update_smp_cache_topo(MachineState *ms, X86CPU *cpu,
+                                          Error **errp)
+{
+    CPUX86State *env = &cpu->env;
+    CpuTopologyLevel level;
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l1d_cache->share_level = level;
+        env->cache_info_amd.l1d_cache->share_level = level;
+    } else {
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D,
+            env->cache_info_cpuid4.l1d_cache->share_level);
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D,
+            env->cache_info_amd.l1d_cache->share_level);
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l1i_cache->share_level = level;
+        env->cache_info_amd.l1i_cache->share_level = level;
+    } else {
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I,
+            env->cache_info_cpuid4.l1i_cache->share_level);
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I,
+            env->cache_info_amd.l1i_cache->share_level);
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l2_cache->share_level = level;
+        env->cache_info_amd.l2_cache->share_level = level;
+    } else {
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2,
+            env->cache_info_cpuid4.l2_cache->share_level);
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2,
+            env->cache_info_amd.l2_cache->share_level);
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l3_cache->share_level = level;
+        env->cache_info_amd.l3_cache->share_level = level;
+    } else {
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3,
+            env->cache_info_cpuid4.l3_cache->share_level);
+        machine_set_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3,
+            env->cache_info_amd.l3_cache->share_level);
+    }
+
+    if (!machine_check_smp_cache(ms, errp)) {
+        return false;
+    }
+    return true;
+}
+#endif
+
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -7977,6 +8035,15 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
+
+    /*
+     * TODO: Add a SMPCompatProps.has_caches flag to avoid useless updates
+     * if user didn't set smp_cache.
+     */
+    if (!x86_cpu_update_smp_cache_topo(ms, cpu, errp)) {
+        return;
+    }
+
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
 
     if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus > 1) {
-- 
2.34.1

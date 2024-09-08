Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp625178njb;
        Sun, 8 Sep 2024 05:44:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTMMiBDf+hXLZLVvQHxW2fMNI5CddDiHuVJSy/7lomrNjRGKtKjJ/ATeA2s8MrfbkF+KklUYVWZYuG1A==@linaro.org
X-Google-Smtp-Source: AGHT+IFUbZ7uxxeua8tBlY0eXMRcrbJ9xsjxXbmiiKu8JdeS5lx/SdoWZv8159NG0HIofKr17tMu
X-Received: by 2002:a05:6214:5096:b0:6c3:5ff2:7db3 with SMTP id 6a1803df08f44-6c518def5f3mr260166016d6.9.1725799440779;
        Sun, 08 Sep 2024 05:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725799440; cv=none;
        d=google.com; s=arc-20240605;
        b=blevNJvak+23axJHC2frnfU+6BKMGu9P3cjFzlopV0qFMbbS1vvCKdWtZvHtoUgjfk
         wPavSCKFFVsHLyS0Hm5rlqddZgyZdgFKFSUvCN2Bn6Lz3gm2SkaMb2PRPVYlpXOTK5lP
         kkIHj3TCGgNvUbm9okJiZqJvryR8LX3rMg+zFkxG1EkqZC0+O5yZk5R68GPoNu5T4Lqe
         kQXjh0zCG6bKNUf7b5oubQrRYJ76/dNssReroBAtgE7fuZiQVXYbj5sMPl/fzDdJoWCX
         D4lx24bKsqiAhE1XO1Hjtda8wphaPNeC8eTRCGSCGNUy4demCa0a8Liml8ZLUHJSGviW
         EhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UHuklT2mrWVZdfWhMeSC9QAv1IjXzwOu1yNWoRXhWB0=;
        fh=0cJcinrZnucqYjSNYncb6+eMGja84j/gs35YiXtiMHU=;
        b=lQtvGtdlgV0Ugfb8E4/TjmTi/nGDLuc2mCuL0duJbh754n1GKCYoezKIZSDDQY25CA
         cLdGMN/Bgf3I3+CJuo8CqmpJ+d9JkWkq8isQzsFuNTOBRKKUU+2NA7Xx/CV6jddqnRvb
         X5j05+zEltVNNUF2ubJHcWdesldRnOg9kjI4FZia/y2SkyUlPMbtn+c0/dcs2/jjIYSc
         gAwY8ung+DwSNigIMKcBF3WuO614eVVgkGftUCKhbBjakIHFOTx8OhnXNA81Zb4n/Opk
         tB1iWhgq+DCYN5J0a7LwdRDPuxGo7TSwjt2sXkkUMeGRfIFefUK++RhQpbsllYTkpajp
         dM+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TeCg9CpN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534787b9dsi31732186d6.435.2024.09.08.05.43.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 05:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TeCg9CpN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799441; x=1757335441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BrZawMnp3PVtM7q2OTGYiNtV3fjACaeKSFuVHbGDiaQ=;
  b=TeCg9CpNgWLo44odzhm4UWWHuXnuELC5PhQOrvelQaDYZQ9v83lLDlKW
   aNpWpr8XOukicrDF+9kmJTLfbIEL/dr1xZRNRKgikOIa8JRJqpAxv4R08
   T4WsgaA2H7/zQ1yJTbZ7olj+C2pUvMvKT5dCNmusJNea6P/iZq618OW6C
   gMoQ82g36YnAdq5aNndahr88+g3R6nxYrez7KdUAQZJI9/RqEvVD7bNeC
   xi2vjBJPQr1cczgOeck7fQUzLndEDTiZupTTMUmYTI9ydk87hUUciUmqo
   ColyVMv34nLgdXgYWfXXD83C4WMa7ZNf5V7h9qCxcLBK2ruvTlhylq3Tn
   g==;
X-CSE-ConnectionGUID: VSPwt0wJQ3SzQgoja0O40Q==
X-CSE-MsgGUID: qbwpI0cLT8Gm0TrOVrAl/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28238240"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28238240"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:44:00 -0700
X-CSE-ConnectionGUID: WDHpijXHQzaJkHt2SmF1yQ==
X-CSE-MsgGUID: e9ixptPWRbKmrxsLHzpRhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97196648"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 05:43:54 -0700
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
Subject: [PATCH v2 6/7] i386/cpu: Update cache topology with machine's configuration
Date: Sun,  8 Sep 2024 20:59:19 +0800
Message-Id: <20240908125920.1160236-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240908125920.1160236-1-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QcehIWswLoMd

User will configure smp cache topology via -machine smp-cache.

For this case, update the x86 CPUs' cache topology with user's
configuration in MachineState.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
---
Changes since RFC v2:
 * Used smp_cache array to override cache topology.
 * Wrapped the updating into a function.
---
 target/i386/cpu.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e9f755000356..6d9f7dc0872a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7597,6 +7597,38 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_limits[2] = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
+static void x86_cpu_update_smp_cache_topo(MachineState *ms, X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    CpuTopologyLevel level;
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l1d_cache->share_level = level;
+        env->cache_info_amd.l1d_cache->share_level = level;
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l1i_cache->share_level = level;
+        env->cache_info_amd.l1i_cache->share_level = level;
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l2_cache->share_level = level;
+        env->cache_info_amd.l2_cache->share_level = level;
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3);
+    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l3_cache->share_level = level;
+        env->cache_info_amd.l3_cache->share_level = level;
+    }
+}
+#endif
+
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -7821,6 +7853,13 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
+
+    /*
+     * TODO: Add a SMPCompatProps.has_caches flag to avoid useless Updates
+     * if user didn't set smp_cache.
+     */
+    x86_cpu_update_smp_cache_topo(ms, cpu);
+
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
 
     if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus > 1) {
-- 
2.34.1

Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp874627njb;
        Sat, 12 Oct 2024 03:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+qCrPRg/6DrI/7mH5okJg3Mf/lZvA5rGe+RvK1glWdzKj5DyfFpIY+b8lD7oPDHZTeIsa1C+59rFQUA==@linaro.org
X-Google-Smtp-Source: AGHT+IGkoVrWuglDpGPTjyCj9ItJ/chYATyIIl306zuBN2HnJtN2TIrFt4ivd5i5i4krs6+Fr4pV
X-Received: by 2002:a05:6214:3b84:b0:6cb:ee0b:47ba with SMTP id 6a1803df08f44-6cbf9d0b8b9mr40540646d6.10.1728728940847;
        Sat, 12 Oct 2024 03:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728728940; cv=none;
        d=google.com; s=arc-20240605;
        b=B527803xRTjCZcjkgUALhguXiEsc48oTBIpUUwKjxUt8RxSAGVgZ3ZFkBtqH7na7nj
         6DmBrTpm/ZCrARVrsSsFrOCVa2ejvg0RX+1spxYo9iuJhpmtzNNA/HVb2DbXFpwUj2ju
         lpKUduQarw1nIvixrO8ZjAZ5jxoSA/HaSpK4VZBW1467m2qcPElIQGoD/QbJE9dqtT+C
         ls10B6SHOl6HBzSFpznXWgCTD9EZn8DqUo2QJZVoE0J+bsEVcjJurDGKcL/oIowELy3w
         oQSFkknLjJD+Aa6ajCt/8pmKSqfklCOLUQbWATDL1Aqmtq0wcHjeF9oyRp2sjSWhi5pw
         7TiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TF/BrCeLA3Vm0QSpc5kEJxSKV6izJChYuz5EQi+pxE8=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=jvnpxj4BqP+gxwqrJEoR3JZBNjcdD60hIAm1U2JroWJdSVl4ZAjQmpSbunhGUQir3h
         OSyRIFLDFJYzlzCcnuADH7H8IFXHkWcBtKAWwkCJgd1W+7NP7DZ510LoO7UnLZXRw1FY
         l5JfmWj8sGyB3V7sIIClwNA3jt7BuQaaERCrx8rpcuOWJvkPliKq5uaRYPeei0/gHRWn
         fLNggtlxryEsjIZfZXRMSmkRE8PXDucMtOvSKjPvevXB8Q07JJKYJnEHPENU74TuIwqD
         A05Fy1KWyLzX1W/0HmohGlUaJhmcR6j8D1FkX6GXXEkeDQMwhf9QOPODndQz2FY1jmiG
         DyAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GdsSuvVo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.8])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e0783si58893326d6.189.2024.10.12.03.28.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) client-ip=192.198.163.8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GdsSuvVo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728941; x=1760264941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hTwITS9Ep9g3JTsw1ONqb/mB140UzyU2nuvpNS9Faz0=;
  b=GdsSuvVozVQA+20jBkhEiYjsx1rmAepVLyxlzODW9ig7Pm/RquhfcxuE
   DtCqE2tByNawbnJ6SK7TGFFFRyTaU7K6YJykC/GTcAieNCDJ8DikFOoUA
   Mbjgm3mI5L9uTOjS/EsFuP1IXHrtT9ybx9EgecduVHPrEi+J1nShKpW5Z
   COYWE1xsOefgJstNFs8Wn11EAtTyY1SGC31hz4nzyJ7yuSrSOeSIQTwsx
   DiDpFismKbqkQX2zC8w/Kpdry/XPjDwXczGPxZsYQBsVzDSveLZkriiwl
   +oen/wEwjwwVTHRYHPxbKda4rd9YQoeIEg2beel2ck+TvqH8UVLAQtkK+
   Q==;
X-CSE-ConnectionGUID: FGX5R65+S4CoI/ADEA3BAA==
X-CSE-MsgGUID: EGwKmaU7RGagNwyVxBd2LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45634924"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45634924"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:29:00 -0700
X-CSE-ConnectionGUID: tTkP4fn+TRq8J33ibN7BkQ==
X-CSE-MsgGUID: bzdAmRy2SkWle//aCvYwJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77050857"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 03:28:54 -0700
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
	Zhao Liu <zhao1.liu@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: [PATCH v3 5/7] i386/cpu: Update cache topology with machine's configuration
Date: Sat, 12 Oct 2024 18:44:27 +0800
Message-Id: <20241012104429.1048908-6-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wrSwqPZzqNQq

User will configure smp cache topology via -machine smp-cache.

For this case, update the x86 CPUs' cache topology with user's
configuration in MachineState.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes since RFC v2:
 * Used smp_cache array to override cache topology.
 * Wrapped the updating into a function.
---
 target/i386/cpu.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 202bfe5086be..c8a04faf3764 100644
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

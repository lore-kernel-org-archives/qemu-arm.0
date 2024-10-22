Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083566njb;
        Tue, 22 Oct 2024 06:36:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX04AGsXN609tNjI7+w6M8LEmcGHJ3/xwwNJwjimA5fC3bI37BzPIs2odky87MBl2z8ycuF/rNtJt1RUg==@linaro.org
X-Google-Smtp-Source: AGHT+IFmZQFlokMwJcDgJi1ObsTKqT4+I3vKvk4EmYDepKjPbbH3VE/BS5fX0NQUBtrPiozpxeyP
X-Received: by 2002:a05:6358:71cc:b0:1c3:2af3:d84d with SMTP id e5c5f4694b2df-1c39dfd2bf4mr572464455d.16.1729604207836;
        Tue, 22 Oct 2024 06:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604207; cv=none;
        d=google.com; s=arc-20240605;
        b=SkuKhTwigo6hVJ42JK8WL7HbV3/k9hzbhHgBFOPG6mst8h3gKe4xKZsYHRWvpbkkpk
         bv+X9q5iWFo6JIV9lRWFV3l+3UFHctr+4osdSk9VHx7/H/JA1o9v4DD+9QMQjzF0sRqu
         8ShadbkW7O/9zFNo1MTIuN88H/XJe84x8gTs0wxspLqlFHmePS51poCHQwMEmBu0V77q
         33GFUiLkVRKWT8QfQJTb5SfAiOlBnE45zIsoSFFAZ6ooBQj6KxKIofNqbcDhxPpSDNC/
         XNZSVDYY8uem5RHn7d/WfDV1x+UuQdrO+OwzLTtgR/c+04gVI2/ViPMk93X/ETcIX3so
         KIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Dtl6jVA+wqT5M0GacP6SfC8yURyXDnl9jIQcMbP0zhY=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=Vf/Aiy4BatDaSjzD/V2ePbwKuxq+cdv73UMNmQ3Mt0rSYRITs0UjQH21ia1pm4WjmB
         E3pvnhZpD6neLiS7jYnWoX/hlYh1zSxnsvIzfxh0TljBrC9NUZ2ev3RUrcJm1Nitqvxi
         x2hgrcEgCo0PLwdvgcEbTx8IzShlYeIG2En+8KRtdqpPrhkh31giuTYiobYzTXVGe8rA
         OST8k/gO8JixAUDONp+WPnBMFLKIq3jOhiXxnkjaAyOM1Ex2u8AWMfsxtLbQTR2YHzu/
         mrfmiIgeQEdhQgG63VJnMQ0+YXP8uDhmWxQZSY0WYblFeSaEjXMD6M0ei8LSKIxb9ELf
         SadA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ERgPnSLR;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ERgPnSLR;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604207; x=1761140207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UxX3vKGGc0Va+XOoHiSBdEGF6kMlKh+qVjh2FezrNK0=;
  b=ERgPnSLR8C9ID4UT2qh5QknHay8y8ZdbITX2OXc6bNqLDZtUGrwo8nWW
   gzj2CA5r4HhKUeIcsfO4s5/IRQKk8MXZUvruwJ3ySSYTYNu6K9HSSwtMk
   8yD1hw9qF3wuQSwKvE8snk5Mi+N9dC6ny4cDxM3Tih0pIaaMM7T63a/iD
   9Fihc22GIKwxT9rwsLffSVD6ln/CdavErCjZJNemTdOLlprGWDJHNuqSf
   1/Q+rOtJL7YLa7+kLAL3sWKNJX7g84IeIiueebU60mIIwpPdbj2bQcdsF
   n5dmA1IK/qmTGtrcS8PRRvflFixoOmo3aVcOroTcz7JA6cK5W0+fVVtaW
   g==;
X-CSE-ConnectionGUID: B4cqFAl7QvyKR7nu2J9rGw==
X-CSE-MsgGUID: 77dCyILzSbWsE1V8LWCZnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603745"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603745"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:46 -0700
X-CSE-ConnectionGUID: p9y1XFc9QCejIRpjBifUig==
X-CSE-MsgGUID: VvV4J7rER0GtN1sUVW8mPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782441"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:41 -0700
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
Subject: [PATCH v4 7/9] i386/cpu: Update cache topology with machine's configuration
Date: Tue, 22 Oct 2024 21:51:49 +0800
Message-Id: <20241022135151.2052198-8-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LX34m9FRdRDV

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
index 3a5b5557f74b..b6e12b46c9cc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7602,6 +7602,64 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
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
@@ -7826,6 +7884,15 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
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

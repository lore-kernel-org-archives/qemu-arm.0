Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333426njb;
        Wed, 3 Jul 2024 20:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9RgFi63tubjGYvzrUS8vfOFmak71cYDUvk8TFPbd5oLD2RDVSkyS/NjALPCzSYtItJG+U75B7J0UhhfDUm1PTniKsbdg+
X-Google-Smtp-Source: AGHT+IHaiQFOo7vjTMmQmMd80IHGRXPJSR91e4jg4bkvyJLHSoSUiXtUiWL3Q6hoIAcSi6iA7JWq
X-Received: by 2002:a05:622a:15c1:b0:446:3a8f:1907 with SMTP id d75a77b69052e-447cce9784dmr2401621cf.7.1720062064829;
        Wed, 03 Jul 2024 20:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062064; cv=none;
        d=google.com; s=arc-20160816;
        b=pFr7adVhyHQ3vY3Q7zPRNtgnMMZtyYGL9Axk3bduixdmz4Zu0fMgjWl3kDUb4XfzqK
         y9dGrYaGzmj1PwuLPab6BazjMQqrMb0An/mku5bzywe96qaVcDxoXYQYrxui52h1IGaM
         COQS5bMjsKN+dWvRR96EmJOrB9Isfi/wZdLQQX0obAVVOKJrLpjQ2b5e+5Ouj8oyB3AO
         tmqpw6Y95FyRuq/UoMZ9arZVupXewfPOcVES08iT/5XtYKVgIB4nat66ayKgzXXi9LFJ
         0IK61vvk7GxpctHN7RWvdlLUngHLwB0v8LvBIs2x5RLiD5aildYeYuuNeatOxKzeLtIU
         AG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8eFftjrfr51yHJQ0cHfnWRp1i+qfrtI9nJ/OF2M77Hc=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=NXQ0oF+tcNcBAHl9trT470x/jl+Dy3lCY+DKda7imR0IuIoMoM2pa3xMYbpI+YuX3s
         rz/ea23oNY7Mwl0rgxjZIANjcXuXKwBeQprgh2l/Nmloj+7cgytRyo2+nzCTnt86YuTp
         vTV9r0COxKv297teKRwMLdQGkI5XlCqG1GgmYwqJT4mrXQLewn7Ha2WLk5viSAnVUudn
         viHFNeKf0EUgbk3NuTggcSAnNxePFdTmCjquuvRvXqfeIARStd7ooDrvsn8wRU3HCuhe
         AoOMGBXc3ARrclNs49PQRExTToJiwXxQP+ujJbRQLfiRUpKUHJufeIrmQSj/Zrj8aiNK
         c9Ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HHPDjDlo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f7bsi141580431cf.89.2024.07.03.20.01.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HHPDjDlo;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062065; x=1751598065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fujCsC8Dys68Pql9dJtKAju+zQdGhBxq4c+kPZSh5nE=;
  b=HHPDjDlo5MWu8JLbTqS+H2ZzSyGJgbG+v8Xa4U3qGXouW8Syw+TA0snZ
   w/t1HHmubvNKciW3bbIdKFTBCgxXJKHmtCxNWPai5ET0Ulslw/3iRalDx
   +ts7gdhJstGeit2suyfLFnCvSzAXpEHySyJz8oSGz5uQP4smh8NiwgM+u
   fkOPf7koiFeDUEuPN1qCiBoUipHMSy+ABf4exZR95xSZBD6cqorH9HU8z
   j3SFqNRbUx2reyqH/WQmtZ++Cry9S+ngXEV+ECncNF6qai+3JZmrj6/XR
   28a/XLbpxx9OBX3aUpIAjLmPg1WPA2OIZr5vD5Afrinsfan80oE9eq12j
   Q==;
X-CSE-ConnectionGUID: sOfnklhDR1Ot+uxV+CSjXw==
X-CSE-MsgGUID: A8ViNMbOTCStmyGIyKVlVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838141"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838141"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:01:03 -0700
X-CSE-ConnectionGUID: SWw29a7FTiSSxRr5IbNo7w==
X-CSE-MsgGUID: P2ER7FN4T+qcoemaxtpO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052438"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:00:58 -0700
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
Subject: [PATCH 6/8] i386/cpu: Update cache topology with machine's configuration
Date: Thu,  4 Jul 2024 11:16:01 +0800
Message-Id: <20240704031603.1744546-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tDhBZYXay9DR

User will configure smp cache topology via smp-cache object.

For this case, update the x86 CPUs' cache topology with user's
configuration in MachineState.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since RFC v2:
 * Used smp_cache array to override cache topology.
 * Wrapped the updating into a function.
---
 target/i386/cpu.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0ddbfa577caf..403a089111ca 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7568,6 +7568,38 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_limits[2] = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
+static void x86_cpu_update_smp_cache_topo(MachineState *ms, X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    CpuTopologyLevel level;
+
+    level = machine_get_cache_topo_level(ms, SMP_CACHE_L1D);
+    if (level != CPU_TOPO_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l1d_cache->share_level = level;
+        env->cache_info_amd.l1d_cache->share_level = level;
+    }
+
+    level = machine_get_cache_topo_level(ms, SMP_CACHE_L1I);
+    if (level != CPU_TOPO_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l1i_cache->share_level = level;
+        env->cache_info_amd.l1i_cache->share_level = level;
+    }
+
+    level = machine_get_cache_topo_level(ms, SMP_CACHE_L2);
+    if (level != CPU_TOPO_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l2_cache->share_level = level;
+        env->cache_info_amd.l2_cache->share_level = level;
+    }
+
+    level = machine_get_cache_topo_level(ms, SMP_CACHE_L3);
+    if (level != CPU_TOPO_LEVEL_DEFAULT) {
+        env->cache_info_cpuid4.l3_cache->share_level = level;
+        env->cache_info_amd.l3_cache->share_level = level;
+    }
+}
+#endif
+
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -7792,6 +7824,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (ms->smp_cache) {
+        x86_cpu_update_smp_cache_topo(ms, cpu);
+    }
+
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
 
     if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus > 1) {
-- 
2.34.1

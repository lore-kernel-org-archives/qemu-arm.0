Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85910dlb;
        Wed, 18 Sep 2024 22:56:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeq1IWCPI9X5HQYQ5VC1s4yG7aHGaYrQ6ivXNJ49QQ/pmPoIA72m5MdJY+ZLFYt2R0Yz49BrpwTY6TIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG4pnmPmQVnKvqfd7KpYKsZNW9ylQA4col2rMTCITSID5/hGxiLxu+1jUJDKcezoZ1JiQGg
X-Received: by 2002:a05:6214:3c9a:b0:6c5:20c2:f34f with SMTP id 6a1803df08f44-6c57dfa58f9mr296966286d6.21.1726725380671;
        Wed, 18 Sep 2024 22:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725380; cv=none;
        d=google.com; s=arc-20240605;
        b=SdDX7hwl+yep+s6IRxPu1Ijw05waj3OFO2nEFzznmQMBfBlhu5d353IfnpTabheUxD
         TTzmU42HtgCnrQBF/6ifKe6C5Zje2Lat9wSu1rvsbbrQ1UrGCGsOV8ZV/X2o8e1f2mgA
         LwjUn3W9i/Tu8HK0aRwGKejgOI0pvXxG8w1hzYurdon1aQuWbrbfPK9u+X+kS2dfxZyQ
         heIx1CUaJbBRUv28ZFp8+ABDtQ+4laOrDKbVMZxhnyIhnN2N6tqjdnb83zYEh7QjXXRJ
         Hx9DwsAB+PVEAKs/f24bCAm3Z+7UP6+3zev/7uapbbFwoCIZ2pYOzHVx9UmLx4k3ox4c
         /HRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+LWrLtjR+PxUgTxvAPD8gfuwSJ1qwj4rPrv/G+NV0mw=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=HMNLzy0eTl+wsS0E6j7ikNUq7/VWLiFIX/WI4lmYOX2/WlwKr7xu6j5HpJ/WeD12q1
         tIUZw3JdCdbkoGXq3ZhehmgWjdVOl41bjzsDYSEg/qvnTw7risXNGl28VSN1cIJKyaeL
         i45E8DeVU051HnT/xkIh0emM4BjPp+VrFY+qTL+Ko1l2qo6OjOoViCPlgyXp53zHIb9r
         cTA1mV4DRmlFfSfZPRuGeD56mnQoWEJlI/sbKznTfDcykwuUXn/J4mPyA9xXpCPQfSju
         7HXZ+3SF4/qeOPJDZ145o3ArHUh3TJe4lDUqzMfwMlAFYPBap/7wSEf/9/XrxGk33PH5
         582A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HiyEi71R;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e561fefsi11380346d6.306.2024.09.18.22.56.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HiyEi71R;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725381; x=1758261381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=swUKe7Dk5Q6yJ5VJiLcmgO4PNjWAtrL0i/B6l+A1Xbk=;
  b=HiyEi71RM2E0F1qmx67D6S1lNJcuIaLNHyk+oz3eMET5FsNm4j9D05Ky
   EdaGNTpf4zDjX0Pt6fAdTxff2rXZc1dFfxPXdmneyj7cU6vzXvld5yRJi
   r0Ns9dCV1tw6oOuyEzEA/zNhmUtp/NR96iHwYKclbSZSMowxl8Ra/JStQ
   Ykc6d6/0gx9YI3x1oWZEB5YLvt0h2xlLLyeXrFRtarOqknMeIPaHmO3yN
   3QaBKeME95GVayGynbhxO5hU9L6gLR+nYYXstn31ZQ+omgJBCwziAK/o2
   5LjUCi8yy2qA4niGfFxUUUyQ7w+ttpKMVok4ODb+te598SRPKve1DOxJ/
   Q==;
X-CSE-ConnectionGUID: 6kPOyUC6SlC6p9mkh/6BnA==
X-CSE-MsgGUID: akF+DvTIQAKWNeqiIQY+Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813663"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813663"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:56:20 -0700
X-CSE-ConnectionGUID: 0tIfENWWT32Xu6SDNpEnXA==
X-CSE-MsgGUID: OO4hh/zZRMaI4/Pt2zCRAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418778"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:56:13 -0700
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
	Sergio Lopez <slp@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 08/12] hw/i386: Use get_max_topo_by_level() to get topology information
Date: Thu, 19 Sep 2024 14:11:24 +0800
Message-Id: <20240919061128.769139-9-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: W1llarg1XDuJ

To honor the custom topology case and generate correct APIC ID for
hybrid CPU topology, Use get_max_topo_by_level() to get topology
information instead of accessing MachineState.smp directly.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86-common.c | 19 +++++++++++++------
 hw/i386/x86.c        | 20 +++++++++++++-------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index 75d4b2f3d43a..58591e015569 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -202,11 +202,15 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 
 static void x86_fixup_topo_ids(MachineState *ms, X86CPU *cpu)
 {
+    int max_modules, max_dies;
+
+    max_modules = get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_MODULE);
+    max_dies = get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_DIE);
     /*
      * die-id was optional in QEMU 4.0 and older, so keep it optional
      * if there's only one die per socket.
      */
-    if (cpu->module_id < 0 && ms->smp.modules == 1) {
+    if (cpu->module_id < 0 && max_modules == 1) {
         cpu->module_id = 0;
     }
 
@@ -214,7 +218,7 @@ static void x86_fixup_topo_ids(MachineState *ms, X86CPU *cpu)
      * module-id was optional in QEMU 9.0 and older, so keep it optional
      * if there's only one module per die.
      */
-    if (cpu->die_id < 0 && ms->smp.dies == 1) {
+    if (cpu->die_id < 0 && max_dies == 1) {
         cpu->die_id = 0;
     }
 }
@@ -393,6 +397,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     MachineState *ms = MACHINE(hotplug_dev);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
     X86CPUTopoInfo topo_info;
+    int max_modules, max_dies;
 
     if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
         error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
@@ -413,13 +418,15 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
 
     init_topo_info(&topo_info, x86ms);
 
-    if (ms->smp.modules > 1) {
-        env->nr_modules = ms->smp.modules;
+    max_modules = get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_MODULE);
+    if (max_modules > 1) {
+        env->nr_modules = max_modules;
         set_bit(CPU_TOPOLOGY_LEVEL_MODULE, env->avail_cpu_topo);
     }
 
-    if (ms->smp.dies > 1) {
-        env->nr_dies = ms->smp.dies;
+    max_dies = get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_DIE);
+    if (max_dies > 1) {
+        env->nr_dies = max_dies;
         set_bit(CPU_TOPOLOGY_LEVEL_DIE, env->avail_cpu_topo);
     }
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index cdf7b81ad0e3..55904b545d84 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -44,16 +44,20 @@ void init_topo_info(X86CPUTopoInfo *topo_info,
 {
     MachineState *ms = MACHINE(x86ms);
 
-    topo_info->dies_per_pkg = ms->smp.dies;
+    topo_info->dies_per_pkg =
+        get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_DIE);
     /*
      * Though smp.modules means the number of modules in one cluster,
      * i386 doesn't support cluster level so that the smp.clusters
      * always defaults to 1, therefore using smp.modules directly is
      * fine here.
      */
-    topo_info->modules_per_die = ms->smp.modules;
-    topo_info->cores_per_module = ms->smp.cores;
-    topo_info->threads_per_core = ms->smp.threads;
+    topo_info->modules_per_die =
+        get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_MODULE);
+    topo_info->cores_per_module =
+        get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_CORE);
+    topo_info->threads_per_core =
+        get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_THREAD);
 }
 
 /*
@@ -103,7 +107,7 @@ static const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
     X86MachineState *x86ms = X86_MACHINE(ms);
     unsigned int max_cpus = ms->smp.max_cpus;
     X86CPUTopoInfo topo_info;
-    int i;
+    int i, max_dies, max_modules;
 
     if (ms->possible_cpus) {
         /*
@@ -120,6 +124,8 @@ static const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
 
     init_topo_info(&topo_info, x86ms);
 
+    max_dies = get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_DIE);
+    max_modules = get_max_topo_by_level(ms, CPU_TOPOLOGY_LEVEL_MODULE);
     for (i = 0; i < ms->possible_cpus->len; i++) {
         X86CPUTopoIDs topo_ids;
 
@@ -131,11 +137,11 @@ static const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
                                  &topo_info, &topo_ids);
         ms->possible_cpus->cpus[i].props.has_socket_id = true;
         ms->possible_cpus->cpus[i].props.socket_id = topo_ids.pkg_id;
-        if (ms->smp.dies > 1) {
+        if (max_dies > 1) {
             ms->possible_cpus->cpus[i].props.has_die_id = true;
             ms->possible_cpus->cpus[i].props.die_id = topo_ids.die_id;
         }
-        if (ms->smp.modules > 1) {
+        if (max_modules > 1) {
             ms->possible_cpus->cpus[i].props.has_module_id = true;
             ms->possible_cpus->cpus[i].props.module_id = topo_ids.module_id;
         }
-- 
2.34.1

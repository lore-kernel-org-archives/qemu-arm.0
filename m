Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp272396ejb;
        Thu, 30 Nov 2023 06:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRDv/evCvlVw+9tPk8z8fQWlbrtWQGXn7f0gUZwvxbAONbkRe0AhIsLM2cxEap0g5qBN9/
X-Received: by 2002:a05:6214:b0c:b0:66d:a12f:7140 with SMTP id u12-20020a0562140b0c00b0066da12f7140mr19587617qvj.18.1701355023931;
        Thu, 30 Nov 2023 06:37:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701355023; cv=none;
        d=google.com; s=arc-20160816;
        b=R0l7J3keqQX6ej9CFO6NGuELypp09RCmBFBOu0t/Tz9tSYw99fi+uf+ONlxgBdnO2k
         h7+qjDGk3EhMcdn6rNx7U6QDA8ibJp8VFEHujiy1baJMgPIXCm2w8/8IGvyUyPjysref
         OvM+sozSPiLAHq95P21bXGvW2PDdXQEmbOqP455IY5GRQ6h2O9iHy2Ru/xG+Ab5V/Jmc
         FRKxJsH6wrzbmkdiKhsZhUUNtkDZoq00N7HWsk0Dmj616As0vRAHL7+mZU8lMG8jee6b
         t5iHzxizA6FsIeqm5byLCIZZ4c+nhghZXICmnNSvxdDuE4idHqO+HLvTrhP0guAAW9QI
         bzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g6G1a8dTSfFyn165wf6V29FA7Uk+L81d2NzpIDerB8A=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=DkjhEUs8nRtzRVGSHtsylWVmKmZ43hJD3bAQh98r6JEk6LOG6Pu8iCtWKgUXu8A9gK
         h/6n5FVWmKP259PZlu3tfk46YQBeY3vgCCt7XiOntW79GOdKDP0xsvNjhL6Fm3yYFSst
         rXqScJSlkE2RXymaVUBsf7XqCNSKa5ZSsn6vVRuU0NgHsTmT4MW2XxheY5EAnDaVPur4
         8RgZSXUamAj4JV96QwLe6lybu13AB35DN+PbUV1SgbNgibN3Q+fG6K1+bVF8CownJ+1i
         fRXKeOISEYIXsS1vQP/ji7E+sMb8+DISL4etoIQSEpVkGtog4cZ5M20QEVtiQkkDujsH
         wC3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dLbeM7UV;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id 4-20020a0562140cc400b0066d1d01e982si2867qvx.148.2023.11.30.06.37.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:37:03 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dLbeM7UV;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355023; x=1732891023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1TBuBuayUq5ep3LedB2XG6MRM6nllhfykxLgfM/A+kw=;
  b=dLbeM7UV6w2dyWlKQ3TqdHLB5jTeKdQWC0WcaMa+O35ALAbNRd05mD+S
   1BAOdmy9YEYx/mGbDal/e/oEx3Yx/nGKR9EpUjv2IYA5w6Na4faoUn6PC
   ssH35CLPREl+I6scBRnuB++MrBb9A+z46rLD4VqGM7Tm1SQZP8mPk54jJ
   WE7FNo1XgCCdLrns1iITcD+KoMQnujasbVVj+215hrCHzTB2rySspMGV/
   twXWTmr8QfOWpM1zq8x4EEp8cTKoSTlMIL6jWA3k6z/trKKOsMh7s0HJk
   QNoiQ53oQt5ytQmVEyAKSNK+XIPIPyZNhAIJcDR3GdXxT6PsEVEvRD6UG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532889"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532889"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730622"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730622"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:52 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 41/41] hw/i386: Cleanup non-QOM topology support
Date: Thu, 30 Nov 2023 22:42:03 +0800
Message-Id: <20231130144203.2307629-42-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ULJ/iRBV7Im4

From: Zhao Liu <zhao1.liu@intel.com>

After i386 supports QOM topology, drop original topology logic.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 52 +++++++++++----------------------------------------
 1 file changed, 11 insertions(+), 41 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 99f6c502de43..cba8b806cdb6 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -118,7 +118,8 @@ out:
 
 void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 {
-    int i;
+    CPUCore *core;
+    int i, cpu_index = 0, core_idx = 0;
     const CPUArchIdList *possible_cpus;
     MachineState *ms = MACHINE(x86ms);
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
@@ -153,34 +154,17 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
 
-    /*
-     * possible_cpus_qom_granu means the QOM topology support.
-     *
-     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
-     * i386 completes QOM topology support.
-     */
-    if (mc->smp_props.possible_cpus_qom_granu) {
-        CPUCore *core;
-        int cpu_index = 0;
-        int core_idx = 0;
-
-        MACHINE_CORE_FOREACH(ms, core) {
-            for (i = 0; i < core->plugged_threads; i++) {
-                x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
-                            OBJECT(core), cpu_index, &error_fatal);
-                cpu_index++;
-            }
-
-            if (core->plugged_threads < core->nr_threads) {
-                cpu_index += core->nr_threads - core->plugged_threads;
-            }
-            core_idx++;
+    MACHINE_CORE_FOREACH(ms, core) {
+        for (i = 0; i < core->plugged_threads; i++) {
+            x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
+                        OBJECT(core), cpu_index, &error_fatal);
+            cpu_index++;
         }
-    } else {
-        for (i = 0; i < ms->smp.cpus; i++) {
-            x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
-                        NULL, i, &error_fatal);
+
+        if (core->plugged_threads < core->nr_threads) {
+            cpu_index += core->nr_threads - core->plugged_threads;
         }
+        core_idx++;
     }
 }
 
@@ -460,20 +444,6 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /*
-     * possible_cpus_qom_granu means the QOM topology support.
-     *
-     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
-     * i386 completes QOM topology support.
-     */
-    if (!mc->smp_props.possible_cpus_qom_granu) {
-        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
-        x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
-        if (*errp) {
-            return;
-        }
-    }
-
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
         kvm_enabled() && !kvm_hv_vpindex_settable()) {
         error_setg(errp, "kernel doesn't allow setting HyperV VP_INDEX");
-- 
2.34.1

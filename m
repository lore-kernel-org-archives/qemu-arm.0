Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269315ejb;
        Thu, 30 Nov 2023 06:32:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlzUTAAwqYmtR8VA4LqiePFvCT46CnVBD2xrRlZW084JitAla1R5ZPGFhkf/his1g/D2ZR
X-Received: by 2002:a05:620a:6186:b0:77d:59d9:bc00 with SMTP id or6-20020a05620a618600b0077d59d9bc00mr26947959qkn.69.1701354776440;
        Thu, 30 Nov 2023 06:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354776; cv=none;
        d=google.com; s=arc-20160816;
        b=svbeh497w0mGkee3aT+kNJWXUDCfhkRbxUAv7JcAV88kWmTrfoiZ5YEYZsykZnXgFa
         lwf/4hLHr8hQ7RbLdRY2pZCBwh2Vml78F/hzJsl8p2fxqcQObxrSQyCjNeN9z++rcNvL
         rnvUVqWJDNl9+cKwQtUJ/MI5LHqkmCD9wXi2b8Qqbyp6UqiQ/BDYk1ky6zWYvppshdQQ
         UiPyx1EoY5LFvHsx4SPnYoin4Yey5ItnTIpINMRNwXS0r1+Rs95nMKeFq+cD6FBLl6Wn
         Xs08C/eH/IqMdi+ZwnYhpDk85/RBF0ef/R4KAMY4IYYF6b42EHBBmQ9dB9qbXwHIfwl6
         daXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mcfNavNIfJF1Jh8YROim1Zq1MWbjYV/5adwJH68M0GU=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=QVYG+Dj1amk1KpLllvKyw9SubibKgXRO0k3mVbS4sM0HlF2brcY+nN6tpf82FMBmPf
         PYJXv7SUl+EWeUK19pzSh2CvRk/xyATRbTGv1/ZcDBed9O68N1a3kTcyugC7BHatzN4L
         BTcvrIX/2VTMb+63ceaBxecEhB1l47pOKf/l3pVofQUZ+N2e8vZxMxuTVQn03peozdUI
         JRIcjqwdJILBIoxmEzb3LWCdxECEi6WQOh4MRoZQ2YS1PQyl7LYtuaSMq2KCSzMwT4rN
         YIDMJ3g3otP+3TEzlRk1cVfNpGbrKOKxe+7WRxXXacEXwg+B7l/KPwa9LLdXXuDwrnAT
         1Mkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZrqAURBX;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id f19-20020a37ad13000000b0077da9bb9868si1095369qkm.446.2023.11.30.06.32.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:32:56 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZrqAURBX;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354776; x=1732890776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rj2qhjfojWttufVsjPIiSdC7tmdmcTNlZ7nywO+2iko=;
  b=ZrqAURBX0AU04eDmngRZe0Tm4HxrshGk39Uniu7fzVwHURWac3W7nAfC
   Fy9DTnNdsW031zljCZm8FDq1La1xuXA9Uzuz39cJG3hei7upRCwOek11g
   8nDfQNX5zfffOHvi4wpTe10qsKOdqlHESGsxi0s7TpWwMjZUl7t3ZIE7+
   tWd8E9bQqEbZF0hiLOAZHJ7ljbosclMaUZpKpr3rhhgzLHd1XozpsT6jv
   NpnRrhloxKnXBxZM9xm6pKMId5z3+5T/DLjXGhBkVkmH8rxLxet7+uafT
   GpyYXDoV5xXQmvlMZhOa4JQAl+8IyU6/wtCLlNCiPC3CvZ7n3vHrIcIcF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531707"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531707"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729870"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729870"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:26 -0800
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
Subject: [RFC 13/41] hw/core/cpu: Convert CPU from general device to topology device
Date: Thu, 30 Nov 2023 22:41:35 +0800
Message-Id: <20231130144203.2307629-14-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8jmjkuKR/P0R

From: Zhao Liu <zhao1.liu@intel.com>

Convert CPU to topology device then its parent topology devices could
count the number of CPUs when new CPUs are added into topology tree.

Note since CPUs are created from *_init_cpus() in MachineClass.init() or
added from hotplug way, it depends on board initialization. Thus CPU
topology device isn't marked as DEVICE_CATEGORY_CPU_DEF and it will only
be created after board initialization.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 accel/kvm/kvm-all.c   |  4 ++--
 hw/core/cpu-common.c  | 25 +++++++++++++++++++++----
 include/hw/core/cpu.h |  8 ++++++--
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e39a810a4e92..2eee3eb95907 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3953,7 +3953,7 @@ static void query_stats(StatsResultList **result, StatsTarget target,
         break;
     case STATS_TARGET_VCPU:
         add_stats_entry(result, STATS_PROVIDER_KVM,
-                        cpu->parent_obj.canonical_path,
+                        DEVICE(cpu)->canonical_path,
                         stats_list);
         break;
     default:
@@ -4045,7 +4045,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
         stats_args.names = names;
         stats_args.errp = errp;
         CPU_FOREACH(cpu) {
-            if (!apply_str_list_filter(cpu->parent_obj.canonical_path, targets)) {
+            if (!apply_str_list_filter(DEVICE(cpu)->canonical_path, targets)) {
                 continue;
             }
             query_stats_vcpu(cpu, &stats_args);
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 82dae51a550b..e9ed84ff5386 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -195,6 +195,16 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
     Object *machine = qdev_get_machine();
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    /*
+     * The parent topology realize() must be completed before cpu_resume()
+     * where the CPU starts to run.
+     */
+    cc->parent_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
 
     /* qdev_get_machine() can return something that's not TYPE_MACHINE
      * if this is one of the user-only emulators; in that case there's
@@ -225,6 +235,7 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 static void cpu_common_unrealizefn(DeviceState *dev)
 {
     CPUState *cpu = CPU(dev);
+    CPUClass *cc = CPU_GET_CLASS(cpu);
 
     /* Call the plugin hook before clearing the cpu is fully unrealized */
     if (tcg_enabled()) {
@@ -233,6 +244,7 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 
     /* NOTE: latest generic point before the cpu is fully unrealized */
     cpu_exec_unrealizefn(cpu);
+    cc->parent_unrealize(dev);
 }
 
 static void cpu_common_initfn(Object *obj)
@@ -275,6 +287,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(klass);
     CPUClass *k = CPU_CLASS(klass);
 
     k->parse_features = cpu_common_parse_features;
@@ -282,9 +295,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->has_work = cpu_common_has_work;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-    dc->realize = cpu_common_realizefn;
-    dc->unrealize = cpu_common_unrealizefn;
     rc->phases.hold = cpu_common_reset_hold;
     cpu_class_init_props(dc);
     /*
@@ -292,11 +302,18 @@ static void cpu_class_init(ObjectClass *klass, void *data)
      * IRQs, adding reset handlers, halting non-first CPUs, ...
      */
     dc->user_creatable = false;
+    /* CPU is the minimum granularity for hotplug. */
+    dc->hotpluggable = true;
+    device_class_set_parent_realize(dc, cpu_common_realizefn,
+                                    &k->parent_realize);
+    device_class_set_parent_unrealize(dc, cpu_common_unrealizefn,
+                                      &k->parent_unrealize);
+    tc->level = CPU_TOPO_THREAD;
 }
 
 static const TypeInfo cpu_type_info = {
     .name = TYPE_CPU,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_CPU_TOPO,
     .instance_size = sizeof(CPUState),
     .instance_init = cpu_common_initfn,
     .instance_finalize = cpu_common_finalize,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c0c8320413e5..a700f7c39140 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -20,6 +20,7 @@
 #ifndef QEMU_CPU_H
 #define QEMU_CPU_H
 
+#include "hw/core/cpu-topo.h"
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
 #include "exec/cpu-common.h"
@@ -146,7 +147,7 @@ struct SysemuCPUOps;
  */
 struct CPUClass {
     /*< private >*/
-    DeviceClass parent_class;
+    CPUTopoClass parent_class;
     /*< public >*/
 
     ObjectClass *(*class_by_name)(const char *cpu_model);
@@ -191,6 +192,9 @@ struct CPUClass {
     int reset_dump_flags;
     int gdb_num_core_regs;
     bool gdb_stop_before_watchpoint;
+
+    DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
 };
 
 /*
@@ -456,7 +460,7 @@ struct qemu_work_item;
  */
 struct CPUState {
     /*< private >*/
-    DeviceState parent_obj;
+    CPUTopoState parent_obj;
     /* cache to avoid expensive CPU_GET_CLASS */
     CPUClass *cc;
     /*< public >*/
-- 
2.34.1

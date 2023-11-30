Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269532ejb;
        Thu, 30 Nov 2023 06:33:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq3nelE/aTVuEAbNUVienDDx3DJyFGCQHRphBkZ3uetkJbfMYKKM4jzFtC5zkhJfhsetfv
X-Received: by 2002:ad4:58e5:0:b0:67a:2c08:48be with SMTP id di5-20020ad458e5000000b0067a2c0848bemr16019971qvb.33.1701354795850;
        Thu, 30 Nov 2023 06:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354795; cv=none;
        d=google.com; s=arc-20160816;
        b=fDM/h1aYqM5BpnYA1GBZivjS5e1VjuFJr1hfz0V9xx7sovkdb7XpAdZV6bttp6fKuw
         zrKUciqavajlMMLjmQMkt78M4KXiJ7SZR3hlsrpY9XZL9NuG2K0aqMOXJQ8LOdtp9atR
         sYMhSI9pD2wZQlZ18eAHRMD0mKEWHInCIfrVZtOdMn24y5mmjGV413u1TEwh8JL8MJ3b
         +boNrwva44lGVV6p5oReHyL/g2mCBY2u2Gg2jqEcgGmDYkeeu8uMM7ks5ekP9IZT+/gp
         y2VSH94ZGEhQU51REJNSqLpbEcztbtKvwfJGRnLjmBlFx11zonpcKVeO2cMgkFXyqQeL
         20bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PoXZj8aaDNB0evERxmuMyMPNmizNbKB+o/Ve6C0oTsk=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=mUKNjhRj8Qoko6SOWz7P6WOmSPkTusSrO8gKMj+DBIGD8TOEn4h7m6GGyMNVAgvORI
         QwGoYz1G1gHLKkC6VGoGnBj8Re+mAGyBRaVCe1f7ePZ8tTMIr07aGvsNG8XjA2zJz7WU
         GJ+yop60TH6nHLc4mXOS4MFAI3Jn3mCaRyCOSsXYCWazuvPVjUQgUqkXvhhDIv1OAcCw
         Uk6+1hf8rw7wyFM1dOvchMXXVOWBwofvA2w27vUgSB02L0yY8aa47lQpcACy0Tg8qFF1
         s6sh7PX8FhzqSxC/uHyFHroMIYjJpiHSa3PikXZbzDDKiOMr6JPLecmomfV5zJEPzejy
         SE/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mFKfJZne;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id t17-20020a05620a0b1100b0077d98c323dfsi1049128qkg.500.2023.11.30.06.33.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:33:15 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mFKfJZne;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354795; x=1732890795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8LquYvv0CgMyC9ho8G2nSKazoduQFmRgmZ/sS4KE0RQ=;
  b=mFKfJZnepeTAdDZmmr//CV+28ud2/fbCn5VYsePxJoCljVmsKPr5Rgef
   tzSt/RKAcld8mO59A/+vFRDZ/O6GVg+J6Yo+1g9kvWnI7YcFJ3oC6XfT2
   sY2l8Nog0KseuNlGXrwv+w5YouM8onbyJI7Ju1LctznJKwhbPAo3TjdF+
   aub8U6L/F7iibjtuFFXoSqOvdb5vmQ+gyhwPBdn7JvR+PEt2MFAxNBIO7
   YrXq7N19Ex4X1hGXIi58EOdYza7tx4HasDMPzzmlQaea66D5G2I+b64PJ
   KvKzlitNH95l+lZVGSUea8p1YvOjDr93HLAXNx0xcrcKq4wuamYrfc0Vw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531886"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729990"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729990"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:04 -0800
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
Subject: [RFC 17/41] hw/cpu/core: Convert cpu-core from general device to topology device
Date: Thu, 30 Nov 2023 22:41:39 +0800
Message-Id: <20231130144203.2307629-18-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: a0/5ost7MQwi

From: Zhao Liu <zhao1.liu@intel.com>

Convert cpu-core to topology device then user could create core level
topology from cli and later the cpu-cores could be added into topology
tree.

In addition, mark the common cpu-core as DEVICE_CATEGORY_CPU_DEF
category to indicate it belongs to the basic CPU definition and should
be created from cli before board initialization.

But since PPC supports CPU hotplug at core granularity, ppc-core should
be created after board initialization. Thus, mask the category flag
DEVICE_CATEGORY_CPU_DEF for ppc-core.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/core.c                   | 19 ++++++++++++++++---
 hw/ppc/pnv_core.c               |  6 +++++-
 hw/ppc/ppc_core.c               |  5 +++++
 hw/ppc/spapr_cpu_core.c         |  7 ++++++-
 include/hw/cpu/core.h           | 13 +++++++++++--
 include/hw/ppc/pnv_core.h       |  1 +
 include/hw/ppc/spapr_cpu_core.h |  1 +
 7 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 15546b5b2339..261b15fa8171 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -27,6 +27,7 @@ static void core_prop_set_nr_threads(Object *obj, Visitor *v, const char *name,
                                      void *opaque, Error **errp)
 {
     CPUCore *core = CPU_CORE(obj);
+    CPUTopoState *topo = CPU_TOPO(obj);
     int64_t value;
 
     if (!visit_type_int(v, name, &value, errp)) {
@@ -34,6 +35,7 @@ static void core_prop_set_nr_threads(Object *obj, Visitor *v, const char *name,
     }
 
     core->nr_threads = value;
+    topo->max_children = core->nr_threads;
 }
 
 static void core_prop_set_plugged_threads(Object *obj, Visitor *v,
@@ -53,6 +55,7 @@ static void core_prop_set_plugged_threads(Object *obj, Visitor *v,
 static void cpu_core_instance_init(Object *obj)
 {
     CPUCore *core = CPU_CORE(obj);
+    CPUTopoState *topo = CPU_TOPO(obj);
 
     /*
      * Only '-device something-cpu-core,help' can get us there before
@@ -64,11 +67,14 @@ static void cpu_core_instance_init(Object *obj)
     }
 
     core->plugged_threads = -1;
+    /* Core's child can only be the thread. */
+    topo->child_level = CPU_TOPO_THREAD;
 }
 
 static void cpu_core_realize(DeviceState *dev, Error **errp)
 {
     CPUCore *core = CPU_CORE(dev);
+    CPUCoreClass *cc = CPU_CORE_GET_CLASS(core);
 
     if (core->plugged_threads > core->nr_threads) {
         error_setg(errp, "Plugged threads (plugged-threads: %d) must "
@@ -78,25 +84,32 @@ static void cpu_core_realize(DeviceState *dev, Error **errp)
     } else if (core->plugged_threads == -1) {
         core->plugged_threads = core->nr_threads;
     }
+
+    cc->parent_realize(dev, errp);
 }
 
 static void cpu_core_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+    CPUCoreClass *cc = CPU_CORE_CLASS(oc);
 
-    set_bit(DEVICE_CATEGORY_CPU, dc->categories);
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
     object_class_property_add(oc, "nr-threads", "int", core_prop_get_nr_threads,
                               core_prop_set_nr_threads, NULL, NULL);
     object_class_property_add(oc, "plugged-threads", "int", NULL,
                               core_prop_set_plugged_threads, NULL, NULL);
-    dc->realize = cpu_core_realize;
+    device_class_set_parent_realize(dc, cpu_core_realize, &cc->parent_realize);
+
+    tc->level = CPU_TOPO_CORE;
 }
 
 static const TypeInfo cpu_core_type_info = {
     .name = TYPE_CPU_CORE,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_CPU_TOPO,
     .abstract = true,
     .class_init = cpu_core_class_init,
+    .class_size = sizeof(CPUCoreClass),
     .instance_size = sizeof(CPUCore),
     .instance_init = cpu_core_instance_init,
 };
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 8b75739697d1..315b823e7d38 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -334,6 +334,7 @@ static void pnv_core_unrealize(DeviceState *dev)
 {
     PnvCore *pc = PNV_CORE(dev);
     CPUCore *cc = CPU_CORE(dev);
+    PnvCoreClass *pcc = PNV_CORE_GET_CLASS(pc);
     int i;
 
     qemu_unregister_reset(pnv_core_reset, pc);
@@ -342,6 +343,8 @@ static void pnv_core_unrealize(DeviceState *dev)
         pnv_core_cpu_unrealize(pc, pc->threads[i]);
     }
     g_free(pc->threads);
+
+    pcc->parent_unrealize(dev);
 }
 
 static Property pnv_core_properties[] = {
@@ -380,11 +383,12 @@ static void pnv_core_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PnvCoreClass *pcc = PNV_CORE_CLASS(oc);
 
-    dc->unrealize = pnv_core_unrealize;
     device_class_set_props(dc, pnv_core_properties);
     dc->user_creatable = false;
     device_class_set_parent_realize(dc, pnv_core_realize,
                                     &pcc->parent_realize);
+    device_class_set_parent_unrealize(dc, pnv_core_unrealize,
+                                      &pcc->parent_unrealize);
 }
 
 #define DEFINE_PNV_CORE_TYPE(family, cpu_model) \
diff --git a/hw/ppc/ppc_core.c b/hw/ppc/ppc_core.c
index 3857f3150052..0a700d6a5b42 100644
--- a/hw/ppc/ppc_core.c
+++ b/hw/ppc/ppc_core.c
@@ -72,6 +72,11 @@ static void powerpc_core_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCoreClass *ppc_class = POWERPC_CORE_CLASS(oc);
 
+    /*
+     * PPC cores support hotplug and must be created after
+     * qemu_init_board().
+     */
+    clear_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
     object_class_property_add(oc, "core-id", "int",
                               powerpc_core_prop_get_core_id,
                               powerpc_core_prop_set_core_id,
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 5533a386f350..c965c213ab14 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -235,6 +235,7 @@ static void spapr_delete_vcpu(PowerPCCPU *cpu)
 static void spapr_cpu_core_unrealize(DeviceState *dev)
 {
     SpaprCpuCore *sc = SPAPR_CPU_CORE(OBJECT(dev));
+    SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_GET_CLASS(sc);
     CPUCore *cc = CPU_CORE(dev);
     int i;
 
@@ -254,6 +255,8 @@ static void spapr_cpu_core_unrealize(DeviceState *dev)
     }
     g_free(sc->threads);
     qemu_unregister_reset(spapr_cpu_core_reset_handler, sc);
+
+    scc->parent_unrealize(dev);
 }
 
 static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
@@ -366,12 +369,14 @@ static void spapr_cpu_core_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_CLASS(oc);
 
-    dc->unrealize = spapr_cpu_core_unrealize;
     dc->reset = spapr_cpu_core_reset;
     device_class_set_props(dc, spapr_cpu_core_properties);
+    dc->hotpluggable = true;
     scc->cpu_type = data;
     device_class_set_parent_realize(dc, spapr_cpu_core_realize,
                                     &scc->parent_realize);
+    device_class_set_parent_unrealize(dc, spapr_cpu_core_unrealize,
+                                      &scc->parent_unrealize);
 }
 
 #define DEFINE_SPAPR_CPU_CORE_TYPE(cpu_model) \
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 87d50151ab01..591240861efb 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -10,15 +10,24 @@
 #define HW_CPU_CORE_H
 
 #include "hw/qdev-core.h"
+#include "hw/core/cpu-topo.h"
 #include "qom/object.h"
 
 #define TYPE_CPU_CORE "cpu-core"
 
-OBJECT_DECLARE_SIMPLE_TYPE(CPUCore, CPU_CORE)
+OBJECT_DECLARE_TYPE(CPUCore, CPUCoreClass, CPU_CORE)
+
+struct CPUCoreClass {
+    /*< private >*/
+    CPUTopoClass parent_class;
+
+    /*< public >*/
+    DeviceRealize parent_realize;
+};
 
 struct CPUCore {
     /*< private >*/
-    DeviceState parent_obj;
+    CPUTopoState parent_obj;
 
     /*< public >*/
     int core_id;
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index 3b9edf69f9fb..ca04461c8531 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -51,6 +51,7 @@ struct PnvCoreClass {
     uint64_t xscom_size;
 
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
 };
 
 #define PNV_CORE_TYPE_SUFFIX "-" TYPE_PNV_CORE
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index dabdbd4bcbc9..46cf68fc8859 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -39,6 +39,7 @@ struct SpaprCpuCoreClass {
     const char *cpu_type;
 
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
 };
 
 const char *spapr_get_cpu_core_type(const char *cpu_type);
-- 
2.34.1

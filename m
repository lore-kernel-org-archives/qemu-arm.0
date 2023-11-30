Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269390ejb;
        Thu, 30 Nov 2023 06:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu731YSkh8dCDCH2OpQkiEGF7Oh0bj4LvEi8eDt4MXdYPDIMpYfRRLSZILeoTSn+5ijse+
X-Received: by 2002:a05:6214:5603:b0:67a:e8c:664a with SMTP id mg3-20020a056214560300b0067a0e8c664amr23375218qvb.55.1701354782586;
        Thu, 30 Nov 2023 06:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354782; cv=none;
        d=google.com; s=arc-20160816;
        b=DgagIBXOlHiFoEwA5eGuoPFVje705MZOh2IbepDPN5FKzhWKIqb6NdFkffjGGE9Crm
         jHd8yM5bu7Rk3G8mgWPp5s7h2tgmGzvekucG3fyekVuNcGLx/5Jt2K7Drk5F17bfRYjC
         XCZtsPx/VdOWqLw4NBKTo+9svAqbLSVIS16DWUAyla0N8R+5fyHYFwZxRBfwMB1Uap7A
         ynN1HeQy665VfeHJ8CSyBb+ynPjcjzWCtV40ZlUOTf86WODZhpt16ha85DMzUt/kglHG
         nJT32ORD0TruOdUV+Kabpy5WRLSQ0zxkFlasdsOKCxOOXf8xMX/ragCch8MpofL7lgNG
         mefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s0FHlh5NocTVAQ8QPRfvhIq5od/9G9VD8e1wobWtIiw=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=t00yx/OLrfGmLixAJinB47xZYNA4fWTyoArm9GJFWM5AQY4fNcCHoUnBVtq1uJ6Iri
         JX+V20qiREROWd6ctQgfKvRyEad2lDE/WsFw4MBH3HyBmUbBUzN+zegnE0G6nBfyddvX
         TAVwS1C3+WWYl/2EmymcBPg51NS6Ln6/xpMjybOB5kY2BLouuUM3zUz6PfOexPK41t1v
         T/id5aQpJhFf1N+TSj7oDVu9aaIibAQlYAP5NPhY4Kw08BPligYFDgc61lhF7hNg1gIz
         DtOHrxMvDib5EdJ45L5FGOC84BVSgK8RDu4u4sBqyTv77SKpVcnlGBi8a+qvRKadLZ1z
         G9zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=jUqSgfJ6;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id c5-20020ad45ae5000000b0067a9038bd92si125442qvh.12.2023.11.30.06.33.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:33:02 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=jUqSgfJ6;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354782; x=1732890782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HQNocPVaV+DgJS+Ld4DvaS6hVw4IdYUlBhgQdcIl19Q=;
  b=jUqSgfJ6B22AqZ6G2M2TD14W3jhsWHK7sHNAR9sHntDwkhoyzEueI363
   9G9j+/zo7/noioKEWqTVLlH0aU7nLchtXA+183vtOvo99pPtoutbNXk4j
   nezL+bTX0+VY+3bR25LiKBQl9QXxHUuiNTANT7e/TOJJoXI/kTjdmqudw
   x3+hNFXlFYOcCuBXUlGPjXO64KmZzL16DWciHk9GIo5jpZNQfuO2E2eAX
   0nChNWHDaGnaRU6pbm7+1n2kUj7kG1ScJFDuGWjkOKX32APE1aM0LdJhP
   WY87gk/KhJTgdlIlAIaOzdOBkrQYxXFv+hibPMuqxP308r3H9hRncXj7s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531810"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531810"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729932"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729932"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:45 -0800
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
Subject: [RFC 15/41] hw/cpu/core: Allow to configure plugged threads for cpu-core
Date: Thu, 30 Nov 2023 22:41:37 +0800
Message-Id: <20231130144203.2307629-16-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ilDq/GUtnUzD

From: Zhao Liu <zhao1.liu@intel.com>

When the core abstraction is applied for the architecture support CPU
hotplug, the plugged CPUs and unplugged CPUs are distributed among the
cores created in the topology tree.

Add plugged_threads field to help cpu-core decide to how many CPUs to
create.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/core.c                   | 33 +++++++++++++++++++++++++++++++++
 hw/ppc/pnv_core.c               |  6 +++++-
 hw/ppc/spapr_cpu_core.c         |  6 +++++-
 include/hw/cpu/core.h           |  9 +++++++++
 include/hw/ppc/pnv_core.h       |  2 ++
 include/hw/ppc/spapr_cpu_core.h |  2 ++
 6 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 7e274d6aebb7..15546b5b2339 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -36,6 +36,20 @@ static void core_prop_set_nr_threads(Object *obj, Visitor *v, const char *name,
     core->nr_threads = value;
 }
 
+static void core_prop_set_plugged_threads(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    CPUCore *core = CPU_CORE(obj);
+    int64_t value;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    core->plugged_threads = value;
+}
+
 static void cpu_core_instance_init(Object *obj)
 {
     CPUCore *core = CPU_CORE(obj);
@@ -48,6 +62,22 @@ static void cpu_core_instance_init(Object *obj)
     if (current_machine) {
         core->nr_threads = current_machine->smp.threads;
     }
+
+    core->plugged_threads = -1;
+}
+
+static void cpu_core_realize(DeviceState *dev, Error **errp)
+{
+    CPUCore *core = CPU_CORE(dev);
+
+    if (core->plugged_threads > core->nr_threads) {
+        error_setg(errp, "Plugged threads (plugged-threads: %d) must "
+                   "not be more than max threads (nr-threads: %d)",
+                   core->plugged_threads, core->nr_threads);
+        return;
+    } else if (core->plugged_threads == -1) {
+        core->plugged_threads = core->nr_threads;
+    }
 }
 
 static void cpu_core_class_init(ObjectClass *oc, void *data)
@@ -57,6 +87,9 @@ static void cpu_core_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     object_class_property_add(oc, "nr-threads", "int", core_prop_get_nr_threads,
                               core_prop_set_nr_threads, NULL, NULL);
+    object_class_property_add(oc, "plugged-threads", "int", NULL,
+                              core_prop_set_plugged_threads, NULL, NULL);
+    dc->realize = cpu_core_realize;
 }
 
 static const TypeInfo cpu_core_type_info = {
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index a90d1ec92bd8..8b75739697d1 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -276,6 +276,8 @@ static void pnv_core_realize(DeviceState *dev, Error **errp)
 
     assert(pc->chip);
 
+    pcc->parent_realize(dev, errp);
+
     pc->threads = g_new(PowerPCCPU *, cc->nr_threads);
     for (i = 0; i < cc->nr_threads; i++) {
         PowerPCCPU *cpu;
@@ -376,11 +378,13 @@ static void pnv_core_power10_class_init(ObjectClass *oc, void *data)
 static void pnv_core_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    PnvCoreClass *pcc = PNV_CORE_CLASS(oc);
 
-    dc->realize = pnv_core_realize;
     dc->unrealize = pnv_core_unrealize;
     device_class_set_props(dc, pnv_core_properties);
     dc->user_creatable = false;
+    device_class_set_parent_realize(dc, pnv_core_realize,
+                                    &pcc->parent_realize);
 }
 
 #define DEFINE_PNV_CORE_TYPE(family, cpu_model) \
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 7c2ea1424747..5533a386f350 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -331,6 +331,7 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
         (SpaprMachineState *) object_dynamic_cast(qdev_get_machine(),
                                                   TYPE_SPAPR_MACHINE);
     SpaprCpuCore *sc = SPAPR_CPU_CORE(OBJECT(dev));
+    SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_GET_CLASS(sc);
     CPUCore *cc = CPU_CORE(OBJECT(dev));
     int i;
 
@@ -339,6 +340,8 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    scc->parent_realize(dev, errp);
+
     qemu_register_reset(spapr_cpu_core_reset_handler, sc);
     sc->threads = g_new0(PowerPCCPU *, cc->nr_threads);
     for (i = 0; i < cc->nr_threads; i++) {
@@ -363,11 +366,12 @@ static void spapr_cpu_core_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_CLASS(oc);
 
-    dc->realize = spapr_cpu_core_realize;
     dc->unrealize = spapr_cpu_core_unrealize;
     dc->reset = spapr_cpu_core_reset;
     device_class_set_props(dc, spapr_cpu_core_properties);
     scc->cpu_type = data;
+    device_class_set_parent_realize(dc, spapr_cpu_core_realize,
+                                    &scc->parent_realize);
 }
 
 #define DEFINE_SPAPR_CPU_CORE_TYPE(cpu_model) \
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 17f117bd5225..87d50151ab01 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -21,7 +21,16 @@ struct CPUCore {
     DeviceState parent_obj;
 
     /*< public >*/
+    int core_id;
+
+    /* Maximum number of threads contained in this core. */
     int nr_threads;
+
+    /*
+     * How many threads should be plugged in this core via
+     * "-device"/"device_add"?
+     */
+    int plugged_threads;
 };
 
 #endif
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index 56c3f6b51f2f..3b9edf69f9fb 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -49,6 +49,8 @@ struct PnvCoreClass {
     /*< public >*/
     const MemoryRegionOps *xscom_ops;
     uint64_t xscom_size;
+
+    DeviceRealize parent_realize;
 };
 
 #define PNV_CORE_TYPE_SUFFIX "-" TYPE_PNV_CORE
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index db3e515051ca..dabdbd4bcbc9 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -37,6 +37,8 @@ struct SpaprCpuCoreClass {
 
     /*< public >*/
     const char *cpu_type;
+
+    DeviceRealize parent_realize;
 };
 
 const char *spapr_get_cpu_core_type(const char *cpu_type);
-- 
2.34.1

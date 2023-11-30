Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp271589ejb;
        Thu, 30 Nov 2023 06:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFV/m1DjrLwzcjDs3aRtFQwC9nbO2b+ecFprC+HT/nR3OwMHPECcSarlV2SWgUW8sO4zEZ9
X-Received: by 2002:a05:622a:1b13:b0:423:a0a0:9709 with SMTP id bb19-20020a05622a1b1300b00423a0a09709mr22270534qtb.20.1701354958055;
        Thu, 30 Nov 2023 06:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354958; cv=none;
        d=google.com; s=arc-20160816;
        b=huYpPt9ti/TJHwF3j6id2eEBXM5qdog2/HwAuskQwTz/6/eIzBeITtNBPmssHPCKVJ
         aivpEz4Yb+5P27xwUCGvl377gIeJkwR5fNp9NOi+OP+V+Iqa8R0+LZ2KmZnG3tYSm3Od
         gJmVBGFNEU5HrBwa0IxZtPU/2t/TirfG2hf+J22XekD4cpbgVpAQ/zHy0lpBvhDXryKO
         2DY2B1uLQDIll8ipAv6/7lzDgYauRBw7h2kLFBllpmBpbkRlzwpfs+dRh3F3Evew2z+Q
         cMfxW7iOD9iYXCsdnTepSsaeDg/Fve75eQm9XVDKSgLxiIjrkrF93QcOse+2ApHhArpz
         77sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Eu6idYEam8+HyrNZPh3b4H+LK4Wbsj6ztuwJv9PdeAU=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=lt9OOu3J04CUcEAIUPe80Ri5MXS9KDjmarJKJy49yRZdsNIz7gLu+yDycdCbyPQuP4
         zdjhP8JMcdYKL/cwZV3DJWCAYF1xBVwglNFR5EsVZAfnLNdsKmpNTad2o6VykM8w7idk
         WQP3VRbUJWbKQSACxScEGmeCOUFnePTR1bONR7UL3Iz+zcuMMG+FGT+RyJrSl4Jkg2WN
         Q4StvUib/1DY+HOwmbpX66K3P66imJdGb1xTxkqDkhzWMq7f1RsUwQ79lYuExX6A/2we
         RofqcwwEC02xkirQmJzvQc0FUeMNCvWuMZF7ADqlth+5sbCJhNGkrlOpQ2BRJFAT6+sC
         oN9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=lzQcMP4U;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id bz11-20020a05622a1e8b00b004239c668f1fsi1236475qtb.623.2023.11.30.06.35.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:35:58 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=lzQcMP4U;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354957; x=1732890957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/v8heKKPYeoDkQz9adBaYazg44MH5EQbkce1fx19vRE=;
  b=lzQcMP4UDkdz1K27Z7Bmi1Z2I1lNQ3m8f7xZ6c3hE6/i56BWsrXgox9P
   a1yviYZPrr6C9rUAeGDROma+Un/pm0JiOF/DZf/jciTGR7LUjFIsA30gp
   t/jF+3m2vhVw6Gy62dsJcrV4GQ6fcWJMb1o+rCJPX8D2dsKzNU8WfjXec
   of2dTgvQ1U1tabhGo6biaOsQ0LW4SiApmOrkaUW/zd9/8rUFzRwt1qmxi
   IvPIfi09syq4DU1gkOghqN8u2nu990EzcNp0sjXzo+1qkmxjjjsj9wkiM
   owf7IbBUQ42PqUANIKg6YPBUuJy5DI3qDCwqg7HL+EzX4iUbZq5HpeC1P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532516"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532516"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730319"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730319"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:44 -0800
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
Subject: [RFC 34/41] hw/core/topo: Implement user-child to collect topology device from cli
Date: Thu, 30 Nov 2023 22:41:56 +0800
Message-Id: <20231130144203.2307629-35-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lqt2z0MOI7a7

From: Zhao Liu <zhao1.liu@intel.com>

Support user-child for topology devices.

This will affect these 2 aspects:
1. For the basic topology device (with DEVICE_CATEGORY_CPU_DEF
   category), user could specify "parent" to build the topology
   relationship from cli. And cpu-slot will collect all topology
   devices.

2. For the hotplug topology devices (ppc-core or CPUs of other arches),
   user-child could help to search the correct topology parent in
   topology tree with the index properties. This is compatible with
   the original behavior of inserting CPU/core from cli. And this
   requires arch to support QOM topology with a few arch-specific
   modifications, before this support, hotplugged CPUs/cores are
   inserted into cpu-slot by default.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 44 ++++++++++++++++++++++++++++++++++++++
 hw/core/cpu-topo.c         | 38 ++++++++++++++++++++++++++++++++
 include/hw/core/cpu-slot.h |  3 +++
 include/hw/core/cpu-topo.h |  4 ++++
 4 files changed, 89 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 45b6aef0750a..413daa66aaad 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -559,3 +559,47 @@ bool machine_validate_cpu_topology(MachineState *ms, Error **errp)
 
     return true;
 }
+
+Object *cpu_slot_get_free_parent(CPUTopoState *child, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUSlot *slot = ms->topo;
+
+    if (!slot) {
+        return NULL;
+    }
+
+    /*
+     * For CPUs and cores that support hotplug, the behavior is to specify
+     * some topology sub ids. This requires special handling.
+     */
+    if (level == mc->smp_props.possible_cpus_qom_granu) {
+        CPUTopoClass *child_tc = CPU_TOPO_GET_CLASS(child);
+
+        if (child_tc->search_parent_pre_plug) {
+            return child_tc->search_parent_pre_plug(child,
+                       CPU_TOPO(slot), errp);
+        }
+    }
+
+    /*
+     * For other topology devices, just collect them into CPU slot.
+     * The realize() of CPUTopoClass will check no "parent" option case.
+     */
+    return OBJECT(slot);
+}
+
+char *cpu_slot_name_future_child(CPUTopoState *child)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUSlot *slot = ms->topo;
+
+    if (!slot) {
+        return NULL;
+    }
+
+    return get_topo_global_name(&slot->stat, level);
+}
diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 351112ca7a73..143b0a148b17 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -20,8 +20,10 @@
 
 #include "qemu/osdep.h"
 
+#include "hw/core/cpu-slot.h"
 #include "hw/core/cpu-topo.h"
 #include "hw/qdev-properties.h"
+#include "monitor/user-child.h"
 #include "qapi/error.h"
 
 const char *cpu_topo_level_to_string(CPUTopoLevel level)
@@ -272,10 +274,38 @@ static void cpu_topo_unrealize(DeviceState *dev)
     }
 }
 
+/*
+ * Prefer to insert topology device into topology tree where the CPU
+ * slot is the root.
+ */
+static Object *cpu_topo_get_parent(UserChild *uc, Error **errp)
+{
+    return cpu_slot_get_free_parent(CPU_TOPO(uc), errp);
+}
+
+static char *cpu_topo_get_child_name(UserChild *uc, Object *parent)
+{
+    return cpu_slot_name_future_child(CPU_TOPO(uc));
+}
+
+/* Only check type. Other topology details with be checked at realize(). */
+static bool cpu_topo_check_user_parent(UserChild *uc, Object *parent)
+{
+    CPUTopoState *topo;
+
+    topo = (CPUTopoState *)object_dynamic_cast(parent, TYPE_CPU_TOPO);
+    if (!topo) {
+        return false;
+    }
+
+    return true;
+}
+
 static void cpu_topo_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+    UserChildClass *ucc = USER_CHILD_CLASS(oc);
 
     /* All topology devices belong to CPU property. */
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
@@ -290,6 +320,10 @@ static void cpu_topo_class_init(ObjectClass *oc, void *data)
     dc->hotpluggable = false;
 
     tc->level = CPU_TOPO_UNKNOWN;
+
+    ucc->get_parent = cpu_topo_get_parent;
+    ucc->get_child_name = cpu_topo_get_child_name;
+    ucc->check_parent = cpu_topo_check_user_parent;
 }
 
 static void cpu_topo_instance_init(Object *obj)
@@ -310,6 +344,10 @@ static const TypeInfo cpu_topo_type_info = {
     .class_init = cpu_topo_class_init,
     .instance_size = sizeof(CPUTopoState),
     .instance_init = cpu_topo_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CHILD },
+        { }
+    }
 };
 
 static void cpu_topo_register_types(void)
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 9e1c6d6b7ff2..1a63f55f52c3 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -102,4 +102,7 @@ void machine_plug_cpu_slot(MachineState *ms);
 void machine_create_smp_topo_tree(MachineState *ms, Error **errp);
 bool machine_validate_cpu_topology(MachineState *ms, Error **errp);
 
+Object *cpu_slot_get_free_parent(CPUTopoState *child, Error **errp);
+char *cpu_slot_name_future_child(CPUTopoState *child);
+
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index d27da0335c42..6cef26cce0b7 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -48,6 +48,8 @@ OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
  *     new child (including direct child and non-direct child) is added.
  * @check_topo_child: Method to check the support for new child (including
  *     direct child and non-direct child) to be added.
+ * @search_parent_pre_plug: Method to search proper topology parent of @child
+ *     from @root.
  */
 struct CPUTopoClass {
     /*< private >*/
@@ -59,6 +61,8 @@ struct CPUTopoClass {
                              bool is_realize);
     void (*check_topo_child)(CPUTopoState *parent, CPUTopoState *child,
                              Error **errp);
+    Object *(*search_parent_pre_plug)(CPUTopoState *child, CPUTopoState *root,
+                                      Error **errp);
 };
 
 /**
-- 
2.34.1

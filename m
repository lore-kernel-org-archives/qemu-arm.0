Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp271161ejb;
        Thu, 30 Nov 2023 06:35:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqDk40585eqiUGWEL1vmiS0k4FBOquPV7cIpuTbLUNqyusYG6lJ0zd3hwBZuAo+qrIuOmx
X-Received: by 2002:a05:6870:6784:b0:1dd:4271:3a88 with SMTP id gc4-20020a056870678400b001dd42713a88mr25423861oab.58.1701354926966;
        Thu, 30 Nov 2023 06:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354926; cv=none;
        d=google.com; s=arc-20160816;
        b=V3K29kMrnmBI5djuyu01TD15gDAAqKYABT72VPZbrsHxtuqqfRJye1yIfLYITi3dDe
         Eu1huaUv5cIW1IUFAnun8zkN6gsORQUo6E2JDZK87czaoIxVOdMXsG47FpN9/7RL/8kY
         oHKkvu7xJZ/K/t9Aie6wdVbuWIRMoS2S+GwiQGf8+9aYXeHDL6fTB55+d0hjbXpel2LC
         5oLHfc3FS3TXcW6G5ZhjrvVMFMyhNC3HIhzr5XNg/bR9gJDKgKXGPTgC0K6bX+NyTsDc
         5C6Tnp2xlV51MBJojqoI0js++SS01HPFmkuXW05UiMRCGkvcw/Mhjje6uniDJvPED7+8
         PXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sn66a9bPrp4KNlWbcDoa9kt45YGbbvfHbM1x5RGU4U0=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=ItnACAjsu/NE0aiAHG+5Pv1Hh++yerDFVi9AsKVOzB5M4qEemqy6JEzt/irhnVCG1F
         o2gQGLaLTKP7HUc8ErDfxPodxiEK4knGugbQbFKqtwQeREsBggdo5tdgm5W25K6fC9kw
         zI2Ay8LuyvFRzJpIuC5f2ODsW0ByE63q8EujCbmfcpb1BD4Ug63H/dW/goJdCgYWNdCw
         un+6jKgz2AXoqSlFhi633Cu0hUif1pxhqOdsrhyHQtmnXIDTZlsKspqYhnJqi8mOnsXf
         634Acii1lsr5d71sM95HGcvz+h+hJROp8g56XaAFuU/Hz2ZsI+QlOTc0DOOuzIdndqtw
         QD9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KBVmNrXf;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id cc17-20020a05622a411100b00423aa24d8c7si1204648qtb.113.2023.11.30.06.35.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:35:26 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KBVmNrXf;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354926; x=1732890926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f8dzVIiaV15FUJhTAcShJBTihquI/MGo+GvFSgqbGOs=;
  b=KBVmNrXf0jr/ocJ1dMv3RJ4GeezN/D1eOKUOAgMQZ1Jl6FYopYQeIRxi
   XsBFeRkWisBCNVLQQhXtMSbB3sV0GsjnOuu5HDfDnTl+YsIm5/UZ2Ncja
   WclvS8zR2OYRvSnpnrKctAMdrVh9nDeoJskszWRK8u5gHXuKupjyw1AzT
   zPVCPvr8R/LXVutPUuMC6DPYn0mVwg409xoOLsAw+KM1adhPJDUmJsmEP
   91CCfmOYJzueKsA0RuVyC+dnp8dsg9qxxeNAIpKjLwpb1k2FXu8ndCZxO
   po350qESlE6zwIE+ujasntYj24hovTMWQsTmq3l9bwIJc8rwxnmT9w/Oh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532409"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532409"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730271"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730271"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:15 -0800
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
Subject: [RFC 31/41] hw/machine: Plug cpu-slot into machine to maintain topology tree
Date: Thu, 30 Nov 2023 22:41:53 +0800
Message-Id: <20231130144203.2307629-32-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: N/135qgohFwW

From: Zhao Liu <zhao1.liu@intel.com>

Add a cpu-slot in machine as the root of topology tree to maintain the
QOM topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 31 +++++++++++++++++++++++++++++++
 include/hw/boards.h        |  2 ++
 include/hw/core/cpu-slot.h |  7 +++++++
 system/vl.c                |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 2a796ad5b6e7..4b148440ed3d 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 
+#include "hw/boards.h"
 #include "hw/core/cpu-slot.h"
 #include "qapi/error.h"
 
@@ -165,3 +166,33 @@ static void cpu_slot_register_types(void)
 }
 
 type_init(cpu_slot_register_types)
+
+void machine_plug_cpu_slot(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    ms->topo = CPU_SLOT(qdev_new(TYPE_CPU_SLOT));
+
+    object_property_add_child(container_get(OBJECT(ms), "/peripheral"),
+                              "cpu-slot", OBJECT(ms->topo));
+    DEVICE(ms->topo)->id = g_strdup_printf("%s", "cpu-slot");
+
+    qdev_realize_and_unref(DEVICE(ms->topo), NULL, &error_abort);
+    ms->topo->ms = ms;
+
+    if (!mc->smp_props.clusters_supported) {
+        clear_bit(CPU_TOPO_CLUSTER, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.dies_supported) {
+        clear_bit(CPU_TOPO_DIE, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.books_supported) {
+        clear_bit(CPU_TOPO_BOOK, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.drawers_supported) {
+        clear_bit(CPU_TOPO_DRAWER, ms->topo->supported_levels);
+    }
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index da85f86efb91..81a7b04ece86 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -10,6 +10,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/core/cpu-slot.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -398,6 +399,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    CPUSlot *topo;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 7bf51988afb3..1361af4ccfc0 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -78,6 +78,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     when necessary.
  * @stat: Statistical topology information for topology tree.
  * @supported_levels: Supported topology levels for topology tree.
+ * @ms: Machine in which this cpu-slot is plugged.
  */
 struct CPUSlot {
     /*< private >*/
@@ -87,6 +88,12 @@ struct CPUSlot {
     QTAILQ_HEAD(, CPUCore) cores;
     CPUTopoStat stat;
     DECLARE_BITMAP(supported_levels, USER_AVAIL_LEVEL_NUM);
+    MachineState *ms;
 };
 
+#define MACHINE_CORE_FOREACH(ms, core) \
+    QTAILQ_FOREACH((core), &(ms)->topo->cores, node)
+
+void machine_plug_cpu_slot(MachineState *ms);
+
 #endif /* CPU_SLOT_H */
diff --git a/system/vl.c b/system/vl.c
index 65add2fb2460..637f708d2265 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2128,6 +2128,8 @@ static void qemu_create_machine(QDict *qdict)
                                           false, &error_abort);
         qobject_unref(default_opts);
     }
+
+    machine_plug_cpu_slot(current_machine);
 }
 
 static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
-- 
2.34.1

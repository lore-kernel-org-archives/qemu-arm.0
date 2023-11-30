Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp270908ejb;
        Thu, 30 Nov 2023 06:35:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzo9YDsG/D3PZ69l6I64crENzrfbnufDa3PIn7GUSIiqByKkwvYClYfkltRYLblt+B/P0Q
X-Received: by 2002:ac8:5b91:0:b0:423:789c:65a5 with SMTP id a17-20020ac85b91000000b00423789c65a5mr33435452qta.52.1701354908086;
        Thu, 30 Nov 2023 06:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354908; cv=none;
        d=google.com; s=arc-20160816;
        b=fURxi1zB/0pTbdTe6keGsd8zzQKoCXt4qYFmC5816YcgOPwap3Q08+cl0eoqCcTTAq
         TXjBVOFX5Zi2Of+8FHoyTSBozUnYG3XgUiEfOykbqKa6hT4lBAcZKTwp+0BOW3t0djbY
         8k11vgscrN+xl2JJQoAUQ07sVBRe25ThwNm19EPFi0ivd25bUbYmcE9KLpXWIqfC3djs
         2XJL2A3G3JCXUxiDx8vjrVsWt2yfXDLL5XNG/C+aj9gDewNnw+gy4CYrSu4apc+DH7zl
         CSKNSlZZfVgo9T+04sb8AWAPou0aYnzuVfmM4waXVqprziiLr9sJSfxWTzUjCT93+jqS
         FSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Nifg9vBUOfnBo+UdWWuT66+sHZgL97f+w4zZVOX+mus=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=sBpsEJwLYkAkXTRv99YlkiMN7BwRk64Kj7lcY5bQUUJPP3SnMe6/IjhfUacDUc1l3J
         c2JaVentLTvRCoEbBwOfUMp7xKfbw5ZwxqA104b99IOl6kUK0MgCZTuYwhTemHCECzf0
         jAC4126Hk5oisuZ2vHtHmMNqay6FaxGGnCu1X2ngUnVaxvG8KI8713nErGV5Op5AtqN7
         Zh/Hin4hLfoM1RxVqH2z+BWk4AWX0wuzMF5phrXeIKiz0JI3XowWewdXYBd5wBsAIIrN
         1DL+lP0Q9m3Y8nnQdILtPaKRCXFW9TtEADVX78uTnzdgvQiuqv2eintN18T+MbzG7uhR
         2CaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bKpi4JTY;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id ge10-20020a05622a5c8a00b0042398ddfec3si1242337qtb.58.2023.11.30.06.35.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:35:08 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bKpi4JTY;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354907; x=1732890907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3aKtyhn4HEa/g5VVCwXVJ9czPMzUH1bTJvhs1x/p4jk=;
  b=bKpi4JTYVrSxeKgadYKPwOMHJBmJo/CNhSt5/U5iuUl1xtDICw7yGnzs
   q6uQUKwcMhERH4rhkgznF0OZFq1BlLa0E3DJVO8imnrRC2FZW+IO0MUSF
   x+6hfx7Zh76zL17G/MqXDd0EIePcYAwn+kxYth7LxbmReRgcJ6uAfeeJ1
   dh7Q9ziBVnlj74pqSBw811xJBqb6lWVO8h8BosyKpyC5/ymvrTyitkLU6
   X/FsgGMGLHxNii0Pd6MwQKlVvo2PSReAEVbXlHBIISDPvfeb8CGPMVk23
   M9HVNi42Kpe6tAUV+aC2iUg5tpNtVVoAM7DCN87UkMvdfjqukmHPze1OK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532339"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532339"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730181"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730181"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:56 -0800
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
Subject: [RFC 29/41] hw/core/slot: Statistics topology information in CPU slot
Date: Thu, 30 Nov 2023 22:41:51 +0800
Message-Id: <20231130144203.2307629-30-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wBq/KtKCyfsL

From: Zhao Liu <zhao1.liu@intel.com>

The CPU slot, as the root of the topology tree, is responsible for
global topology information collection and updates.

When a new topology device is added to/deleted from the topology tree,
update the corresponding information in the slot.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 41 +++++++++++++++++++++++++++++++++++-
 include/hw/core/cpu-slot.h | 43 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index a6b7d98dea18..e8e6f4d25532 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -22,14 +22,44 @@
 
 #include "hw/core/cpu-slot.h"
 
+static inline
+CPUTopoStatEntry *get_topo_stat_entry(CPUTopoStat *stat,
+                                      CPUTopoLevel level)
+{
+    assert(level != CPU_TOPO_UNKNOWN);
+
+    return &stat->entries[TOPO_STAT_ENTRY_IDX(level)];
+}
+
 static void cpu_slot_add_topo_info(CPUTopoState *root, CPUTopoState *child)
 {
     CPUSlot *slot = CPU_SLOT(root);
     CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUTopoStatEntry *entry;
 
     if (level == CPU_TOPO_CORE) {
-        QTAILQ_INSERT_TAIL(&slot->cores, CPU_CORE(child), node);
+        CPUCore *core = CPU_CORE(child);
+        CPUTopoStatEntry *thread_entry;
+
+        QTAILQ_INSERT_TAIL(&slot->cores, core, node);
+
+        /* Max CPUs per core is pre-configured by "nr-threads". */
+        slot->stat.max_cpus += core->nr_threads;
+        slot->stat.pre_plugged_cpus += core->plugged_threads;
+
+        thread_entry = get_topo_stat_entry(&slot->stat, CPU_TOPO_THREAD);
+        if (child->max_children > thread_entry->max_units) {
+            thread_entry->max_units = child->max_children;
+        }
     }
+
+    entry = get_topo_stat_entry(&slot->stat, level);
+    entry->total_units++;
+    if (child->parent->num_children > entry->max_units) {
+        entry->max_units = child->parent->num_children;
+    }
+
+    set_bit(level, slot->stat.curr_levels);
     return;
 }
 
@@ -37,10 +67,18 @@ static void cpu_slot_del_topo_info(CPUTopoState *root, CPUTopoState *child)
 {
     CPUSlot *slot = CPU_SLOT(root);
     CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUTopoStatEntry *entry;
+
+    assert(level != CPU_TOPO_UNKNOWN);
 
     if (level == CPU_TOPO_CORE) {
         QTAILQ_REMOVE(&slot->cores, CPU_CORE(child), node);
     }
+
+    entry = get_topo_stat_entry(&slot->stat, level);
+    entry->total_units--;
+
+    /* No need to update entries[*].max_units and curr_levels. */
     return;
 }
 
@@ -73,6 +111,7 @@ static void cpu_slot_instance_init(Object *obj)
     CPUSlot *slot = CPU_SLOT(obj);
 
     QTAILQ_INIT(&slot->cores);
+    set_bit(CPU_TOPO_ROOT, slot->stat.curr_levels);
 }
 
 static const TypeInfo cpu_slot_type_info = {
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index d2a1160562be..fa2bd4af247d 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -25,6 +25,47 @@
 #include "hw/cpu/core.h"
 #include "hw/qdev-core.h"
 
+/**
+ * @USER_AVAIL_LEVEL_NUM: the number of total topology levels in topology
+ *                        bitmap, which includes CPU_TOPO_UNKNOWN.
+ */
+#define USER_AVAIL_LEVEL_NUM (CPU_TOPO_ROOT + 1)
+
+/**
+ * @VALID_LEVEL_NUM: the number of valid topology levels, which excludes
+ *                   CPU_TOPO_UNKNOWN and CPU_TOPO_ROOT.
+ */
+#define VALID_LEVEL_NUM (CPU_TOPO_ROOT - 1)
+
+#define TOPO_STAT_ENTRY_IDX(level) ((level) - 1)
+
+/**
+ * CPUTopoStatEntry:
+ * @total: Total number of topological units at the same level that are
+ *         currently inserted in CPU slot
+ * @max: Maximum number of topological units at the same level under the
+ *       parent topolofical container
+ */
+typedef struct CPUTopoStatEntry {
+    unsigned int total_units;
+    unsigned int max_units;
+} CPUTopoStatEntry;
+
+/**
+ * CPUTopoStat:
+ * @max_cpus: Maximum number of CPUs in CPU slot.
+ * @pre_plugged_cpus: Number of pre-plugged CPUs in CPU slot.
+ * @entries: Detail count information for valid topology levels under
+ *           CPU slot
+ * @curr_levels: Current CPU topology levels inserted in CPU slot
+ */
+typedef struct CPUTopoStat {
+    unsigned int max_cpus;
+    unsigned int pre_plugged_cpus;
+    CPUTopoStatEntry entries[VALID_LEVEL_NUM];
+    DECLARE_BITMAP(curr_levels, USER_AVAIL_LEVEL_NUM);
+} CPUTopoStat;
+
 #define TYPE_CPU_SLOT "cpu-slot"
 
 OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
@@ -35,6 +76,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     where the cpu-slot is the root. cpu-slot can maintain similar
  *     queues for other topology levels to facilitate traversal
  *     when necessary.
+ * @stat: Statistical topology information for topology tree.
  */
 struct CPUSlot {
     /*< private >*/
@@ -42,6 +84,7 @@ struct CPUSlot {
 
     /*< public >*/
     QTAILQ_HEAD(, CPUCore) cores;
+    CPUTopoStat stat;
 };
 
 #endif /* CPU_SLOT_H */
-- 
2.34.1

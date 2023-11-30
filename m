Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp271061ejb;
        Thu, 30 Nov 2023 06:35:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZZAWtjXoukC5Y4WTIfR+Lhus/GSO4MBNpzf/ErkBflAeJgiDM3PDlhdOYpMSJinuuh0ZT
X-Received: by 2002:a05:6830:4ac:b0:6bd:a47:7bb6 with SMTP id l12-20020a05683004ac00b006bd0a477bb6mr20071290otd.14.1701354918099;
        Thu, 30 Nov 2023 06:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354918; cv=none;
        d=google.com; s=arc-20160816;
        b=TrH7O0ZSv1KqSzRdR6jpXrUJbVkRUJ1fnKp+KUcOqTEM2XT0bldxg80QzcQOIV2JhQ
         iRhH/oPWmFKw+myZJxOfsxT/UrBX+zIV8pR593JS0obUi+W0XSgbKcUXZeHZFjCKRoMr
         8QxxccWm98fLWPFlPXfvfwCdld7a646DtCZmU/zzax8VCiNx8+3ZFefEaBB+9UtFr/xO
         Vyv5hxOUzOxTOT/OeRfEDT9AT8tnYeGOtZGPlMd7fzPjkU0glV1olWl8xxErU2U7+NPa
         o9TWyXkTDZC7zdcS6DplHysfJuEx7SEhI/hJaJ6e6c8/h/Z42LRIgig08KBP1IW2lZUt
         6cKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OmYa/5gkNTA0z+R1wsqm4BWqfL45cJ4MgBQ2Q5U3oKw=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=lXbswsC/l9+ReCgJpP6HDIL0r+Jx9ZaCDLRjn9OAbAcKG+3wKypTMEASa1iHjvDrqX
         4/xU0CN4ETFeJEdIcUckKvrNTeHFts/Bk75Zt6mfeql2nJ7RPsiTP7aQgZuUidxVVKd8
         fa1kqJmfgP/Qjnr7XUX47OfxZy5KULUZrUnA/2udLguMwa3xoBcON1U6zUrTcrALPW4Z
         FbNrbVq2NuDINp+HfoT/EEC8lIn2j8m+UIMTfr/1HiikArOobPaPtpA/WnR3zl6IHjNI
         qhiTt2viIqGyB5ZQ18n+G31d7yQ5pzbRd3JI+P/tJMcVWPmgYB/JJZ/G6Gl61prKWxPj
         XyJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=C0fzL8HI;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id v5-20020a0ccd85000000b0067a36984183si753264qvm.464.2023.11.30.06.35.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:35:18 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=C0fzL8HI;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354917; x=1732890917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HnOAO3NMx1dRMWQIeSpDRtg/0be+6N1pOpK/5nWbTXE=;
  b=C0fzL8HIwbpmd1OG2LqPrVrFixy2m+UO1s90M8D+KKVIfCARoF+uvcug
   zzfCpaITI2or2GxsGK8cpDpHOhzFOkrSTt2yCZNif88hhdU338zKb0VGc
   z3vATxFlO7sH5JCWm9tI4c+ZJvc/jlL59Zrs1Dfn5k2yCQIGITo2oJsrF
   j2Zl8i5AZiCiJVkKIO/A0PRLTxLDwYGOsJsL6J6xa7CqIvhmuKi926hlq
   e7BoI3JpRymHg4mdDJdY514WZy8W2E/AkU2IRs+YzXHobgwEuyOyiP7/T
   h7h9WxX/E4fYdDaX8RzOvM0JNJ4fFa/uBWBWX5axOUlz7gFZV9h2l18GA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532371"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532371"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730225"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730225"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:05 -0800
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
Subject: [RFC 30/41] hw/core/slot: Check topology child to be added under CPU slot
Date: Thu, 30 Nov 2023 22:41:52 +0800
Message-Id: <20231130144203.2307629-31-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: olzz+FIqPRhb

From: Zhao Liu <zhao1.liu@intel.com>

Implement CPUTopoClass.check_topo_child() in cpu-slot to be compatible
with the limitations of the current smp topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 37 +++++++++++++++++++++++++++++++++++++
 hw/core/cpu-topo.c         |  2 +-
 include/hw/core/cpu-slot.h |  2 ++
 include/hw/core/cpu-topo.h |  1 +
 4 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index e8e6f4d25532..2a796ad5b6e7 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 
 #include "hw/core/cpu-slot.h"
+#include "qapi/error.h"
 
 static inline
 CPUTopoStatEntry *get_topo_stat_entry(CPUTopoStat *stat,
@@ -94,6 +95,37 @@ static void cpu_slot_update_topo_info(CPUTopoState *root, CPUTopoState *child,
     }
 }
 
+static void cpu_slot_check_topo_support(CPUTopoState *root, CPUTopoState *child,
+                                        Error **errp)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel child_level = CPU_TOPO_LEVEL(child);
+
+    if (!test_bit(child_level, slot->supported_levels)) {
+        error_setg(errp, "cpu topo: the level %s is not supported",
+                   cpu_topo_level_to_string(child_level));
+        return;
+    }
+
+    /*
+     * Currently we doesn't support hybrid topology. For SMP topology,
+     * each child under the same parent are same type.
+     */
+    if (child->parent->num_children) {
+        CPUTopoState *sibling = QTAILQ_FIRST(&child->parent->children);
+        const char *sibling_type = object_get_typename(OBJECT(sibling));
+        const char *child_type = object_get_typename(OBJECT(child));
+
+        if (strcmp(sibling_type, child_type)) {
+            error_setg(errp, "Invalid smp topology: different CPU "
+                       "topology types (%s child vs %s sibling) "
+                       "under the same parent (%s).",
+                       child_type, sibling_type,
+                       object_get_typename(OBJECT(child->parent)));
+        }
+    }
+}
+
 static void cpu_slot_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -104,6 +136,7 @@ static void cpu_slot_class_init(ObjectClass *oc, void *data)
 
     tc->level = CPU_TOPO_ROOT;
     tc->update_topo_info = cpu_slot_update_topo_info;
+    tc->check_topo_child = cpu_slot_check_topo_support;
 }
 
 static void cpu_slot_instance_init(Object *obj)
@@ -112,6 +145,10 @@ static void cpu_slot_instance_init(Object *obj)
 
     QTAILQ_INIT(&slot->cores);
     set_bit(CPU_TOPO_ROOT, slot->stat.curr_levels);
+
+    /* Set all levels by default. */
+    bitmap_fill(slot->supported_levels, USER_AVAIL_LEVEL_NUM);
+    clear_bit(CPU_TOPO_UNKNOWN, slot->supported_levels);
 }
 
 static const TypeInfo cpu_slot_type_info = {
diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 687a4cc566ec..351112ca7a73 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -24,7 +24,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
-static const char *cpu_topo_level_to_string(CPUTopoLevel level)
+const char *cpu_topo_level_to_string(CPUTopoLevel level)
 {
     switch (level) {
     case CPU_TOPO_UNKNOWN:
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index fa2bd4af247d..7bf51988afb3 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -77,6 +77,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     queues for other topology levels to facilitate traversal
  *     when necessary.
  * @stat: Statistical topology information for topology tree.
+ * @supported_levels: Supported topology levels for topology tree.
  */
 struct CPUSlot {
     /*< private >*/
@@ -85,6 +86,7 @@ struct CPUSlot {
     /*< public >*/
     QTAILQ_HEAD(, CPUCore) cores;
     CPUTopoStat stat;
+    DECLARE_BITMAP(supported_levels, USER_AVAIL_LEVEL_NUM);
 };
 
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index 453bacbb558b..d27da0335c42 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -102,5 +102,6 @@ int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
 int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
                                      unsigned long *levels,
                                      topo_fn fn, void *opaque);
+const char *cpu_topo_level_to_string(CPUTopoLevel level);
 
 #endif /* CPU_TOPO_H */
-- 
2.34.1

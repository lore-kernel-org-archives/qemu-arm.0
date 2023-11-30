Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp268922ejb;
        Thu, 30 Nov 2023 06:32:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6BdgTMZyAhgTlag6LSCA1hAC5Y4yr78k7Z+/LttIChSsUtjCQdPJiMqeH2oJETbF5DSFG
X-Received: by 2002:a05:622a:1048:b0:423:83a1:7bbf with SMTP id f8-20020a05622a104800b0042383a17bbfmr38425306qte.28.1701354745153;
        Thu, 30 Nov 2023 06:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354745; cv=none;
        d=google.com; s=arc-20160816;
        b=GFpuy2xLENW9fa1xk2Iq2QHUoyIeV5LWa/cuoTij1JyY6FkUNy29CqONxJg8sktP8z
         41rLLPEoUZp9bdj9dYd5kwAqtsJHHsCrJOZ3oJ0vmsL5egtc/d2mH/O23j2et4oVYFl/
         c/j0y3T8eG8C6P3nm6KW92S4N/d95qBOJyk8yRZrlBziDqjQ/XW1X8m12AZpZJ6oafT2
         DPsp+q/ZJ1jabC0+hRtUDipw+ZxXH58/NfUcJpy5hUexlWfdps69h0yA4Nmq+HsUuubY
         5OpfAfgfYRQnTUhff+rSacjYmMVXtzw4b18V4t9VixKVRzGsyX50uWvbnamDQqGjd/Kg
         z2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=egKEKzuYkZhiitXdPHNW6UEtM16vlgAvbgxAKTOu1yo=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=Ba96avqHx1SX1kztlkModsqzxRe1G2OkgXQFfkP36ZuqtU8fZX03hF4Kh8fAFvFI1m
         zBU28t/tx+taACmQCeHYV6pJTPfsfEk7qijsRY4pwnJf+CflxkPRpp1dEZ38ARvGifk5
         T3EXKYUr3N7xoViEfUX3otaZtxEL0JQHRDei5CY89Q7NDuwN4BsFBRLsmwoVdQ4T5+uU
         jnFJdlymMgeKb8zOo6uM0klEuoneNVO4bdM6rBaX/xIk3jVSXTK+euldSCejhlRZ9bly
         +0lRvqE5EwOpFxfCnKxofvGGr6xZW5X92rErDuIpdT9vMjASdbli2B64L+ll4SqUYmZp
         fJ7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="BHQusIU/";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id v6-20020a05622a130600b00423e77b183fsi1200560qtk.710.2023.11.30.06.32.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:32:25 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="BHQusIU/";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354745; x=1732890745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zcorAWDLgR7QueFdQsmIMfIxo58a5rqxmGG3Y6CdsHI=;
  b=BHQusIU/dLjU7NIEFO13j/KoSWNdsI89J3t8B9uBenczJR1PmTV8FBLm
   E+ahwlmHKBlzwa/iZqQxhUBjic7ds+AAPrO9R5H+q7O77VBGHJjTmswfd
   BTEbjWhbo3q3CqVZbQ4XINjGAu8BO549AFEZlGI3g6yCFb/bx6VvpMmUG
   cXpnY2RuaT07IlBdECwHVDfU+VbKPQGxfth0hudjh4wLdyASHe9LXoswi
   QJc1MBj7MaPiD/Oq6G7ODk4xQLtt73mMyalO6wxMisttEb8xw4F/xnPU6
   6+8cg7H5cXSIcLhjUFbW2W1vKgDlbk2VKCyytVbSo8u6zagME+9U3J5ZQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531483"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531483"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729745"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729745"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:48 -0800
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
Subject: [RFC 09/41] hw/core/topo: Support topology index for topology device
Date: Thu, 30 Nov 2023 22:41:31 +0800
Message-Id: <20231130144203.2307629-10-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: F5dWIZ5cluAw

From: Zhao Liu <zhao1.liu@intel.com>

Topology index is used to identify the topology child under the same
parent topology device.

This field corresponds to the topology sub index (e.g., socket-id/
core-id/thread-id) used for addressing.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 77 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-topo.h |  6 +++
 2 files changed, 83 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 4428b979a5dc..3e0c183388d8 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -50,6 +50,66 @@ static const char *cpu_topo_level_to_string(CPUTopoLevel level)
     return NULL;
 }
 
+static void cpu_topo_refresh_free_child_index(CPUTopoState *topo)
+{
+    CPUTopoState *child;
+
+    /*
+     * Fast way: Assume that the index grows sequentially and that there
+     * are no "index hole" in the previous children.
+     *
+     * The previous check on num_children ensures that free_child_index + 1
+     * does not hit the max_children limit.
+     */
+    if (topo->free_child_index + 1 == topo->num_children) {
+        topo->free_child_index++;
+        return;
+    }
+
+    /* Slow way: Search the "index hole". The index hole must be found. */
+    for (int index = 0; index < topo->num_children; index++) {
+        bool existed = false;
+
+        QTAILQ_FOREACH(child, &topo->children, sibling) {
+            if (child->index == index) {
+                existed = true;
+                break;
+            }
+        }
+
+        if (!existed) {
+            topo->free_child_index = index;
+            return;
+        }
+    }
+}
+
+static void cpu_topo_validate_index(CPUTopoState *topo, Error **errp)
+{
+    CPUTopoState *parent = topo->parent, *child;
+
+    if (topo->index < 0) {
+        error_setg(errp, "Invalid topology index (%d).",
+                   topo->index);
+        return;
+    }
+
+    if (parent->max_children && topo->index >= parent->max_children) {
+        error_setg(errp, "Invalid topology index (%d): "
+                   "The maximum index is %d.",
+                   topo->index, parent->max_children);
+        return;
+    }
+
+    QTAILQ_FOREACH(child, &topo->children, sibling) {
+        if (child->index == topo->index) {
+            error_setg(errp, "Duplicate topology index (%d)",
+                       topo->index);
+            return;
+        }
+    }
+}
+
 static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
 {
     CPUTopoState *parent = topo->parent;
@@ -80,7 +140,18 @@ static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
     }
 
     parent->num_children++;
+    if (topo->index == UNASSIGNED_TOPO_INDEX) {
+        topo->index = parent->free_child_index;
+    } else if (topo->index != parent->free_child_index) {
+        /* The index has been set, then we need to validate it. */
+        cpu_topo_validate_index(topo, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
     QTAILQ_INSERT_TAIL(&parent->children, topo, sibling);
+    cpu_topo_refresh_free_child_index(parent);
 }
 
 static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
@@ -135,6 +206,10 @@ static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
     QTAILQ_REMOVE(&parent->children, topo, sibling);
     parent->num_children--;
 
+    if (topo->index < parent->free_child_index) {
+        parent->free_child_index = topo->index;
+    }
+
     if (!parent->num_children) {
         parent->child_level = CPU_TOPO_UNKNOWN;
     }
@@ -180,6 +255,8 @@ static void cpu_topo_instance_init(Object *obj)
     CPUTopoState *topo = CPU_TOPO(obj);
     QTAILQ_INIT(&topo->children);
 
+    topo->index = UNASSIGNED_TOPO_INDEX;
+    topo->free_child_index = 0;
     topo->child_level = CPU_TOPO_UNKNOWN;
 }
 
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index ebcbdd854da5..c0dfff9dc63b 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -24,6 +24,8 @@
 #include "hw/qdev-core.h"
 #include "qemu/queue.h"
 
+#define UNASSIGNED_TOPO_INDEX -1
+
 typedef enum CPUTopoLevel {
     CPU_TOPO_UNKNOWN,
     CPU_TOPO_THREAD,
@@ -53,6 +55,8 @@ struct CPUTopoClass {
 
 /**
  * CPUTopoState:
+ * @index: Topology index within parent's topology queue.
+ * @free_child_index: Cached free index to be specified for next child.
  * @num_children: Number of topology children under this topology device.
  * @max_children: Maximum number of children allowed to be inserted under
  *     this topology device.
@@ -66,6 +70,8 @@ struct CPUTopoState {
     DeviceState parent_obj;
 
     /*< public >*/
+    int index;
+    int free_child_index;
     int num_children;
     int max_children;
     CPUTopoLevel child_level;
-- 
2.34.1

Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp270775ejb;
        Thu, 30 Nov 2023 06:34:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL754p48S8n7oUgEBTM12OjOLMFFtNUj+pzxgRy4LUVQ2EmwepsuVWZbyFUZhVgnsft1ei
X-Received: by 2002:ac8:42d7:0:b0:423:cd70:a910 with SMTP id g23-20020ac842d7000000b00423cd70a910mr9990270qtm.16.1701354899109;
        Thu, 30 Nov 2023 06:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354899; cv=none;
        d=google.com; s=arc-20160816;
        b=IxeE18ZyBgQocmNOo1iwtscIw+/iMhIVem/S5E/H1pJHo5fM0a7ARASwMZ3CfvhDeo
         hhvlQD/mkt0QGlVvQ1xUNT8spHAVVLZJSu5xlXI+hPciAWYzktlgpKLh3EuaN43NLh2F
         b+EylFMHDGlc6fMYFW4NhQCVX65scP6PkWOWoz5KZ/KkvzMONadt2qgiIobnV642sjVb
         +IYqtw80fi8TqTb6QWtn+/tk0dlV8PjrxbBVcrikXlOMf11/ZKV3IZf8R/u1xeAjPrwD
         rv1eP2A+4b9/PHJKLUC7dJgECjzKaiMclz/d/q92iDw+7Vdh/sLNoQt9PflKDN9Sqjhx
         RogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d0Ga5ikdsdqlhyMzLOc2LbcPBfD9RM1dLJtf4FVVs78=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=NJLvC/oX2jkvjvC0FISAZInh1WOGR9LtSGVG4byRS5ZAYjvvQ+4hKoAubVF5KeT1Ob
         fGQbnCaonVzgc4HGE+CTw8JuEogojhjRXnN0+nJgesz+doG+7uY1jJlM8520WMhDI4UC
         DXvaOfc0esXIB00QfCwcSk9UUmGjRwpKbcw72MBvODqI9OxlygoZs12GcBVdYG/LKaiC
         2pyqAwHSeLmwI2vaNAD2pLsnNIz+vwGHGfFZR2vhGhfL4yd3hHZQ9jaiO67eyom9OzA7
         WHt5NOMi2oeHXh6bLK7ABvzhYtPQG4HsqbK/AuAx47GyDb2NxFBnMUjjpjEbQd39q8oj
         DrEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=C6X5Ftzj;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id y11-20020a05622a164b00b00423e4453177si1203368qtj.691.2023.11.30.06.34.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:34:59 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=C6X5Ftzj;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354898; x=1732890898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FbB6vbX6bR4dqU1fCV07ghJ+c5nYYHlqh35CAqrTsmY=;
  b=C6X5Ftzjr3qufornHD4QbhdH7yYB2zNkz92LccZnSp/zG+x5Cd5K8fcK
   aauMozS+22014MvJT1xgtBLA6uV4OXfX3iNajd4vTsBMT0C2/I+IDRCLm
   XHSAL13j1AU3htiWxQc57GwHbCcr2/Oa/ZFi+V5OYPW0pqMJooMN/zsaq
   CkJb5RG0E4WMcKcH1mgFGaIAkenfMdN5jyYsghmOmtH2HNISnhveE/tPt
   ykoBQeEwgYjXzHep2f0x0qqQ8i4YEvQJSwNUc2WDC/G7y6CBZzpyty4GP
   mZFJwhtHyZ1m8qwSFagEDgmn97wc6vhicEPlaaa4jFyF8yUxbMLqCYFNH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532315"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730130"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730130"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:47 -0800
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
Subject: [RFC 28/41] hw/core/slot: Maintain the core queue in CPU slot
Date: Thu, 30 Nov 2023 22:41:50 +0800
Message-Id: <20231130144203.2307629-29-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BTTTac1bVGu5

From: Zhao Liu <zhao1.liu@intel.com>

Maintain the cores queue at cpu-slot to facilitate direct traversal
of all cores.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 43 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-slot.h |  9 ++++++++
 include/hw/cpu/core.h      |  2 ++
 3 files changed, 54 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 5aef5b0189c2..a6b7d98dea18 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -22,6 +22,40 @@
 
 #include "hw/core/cpu-slot.h"
 
+static void cpu_slot_add_topo_info(CPUTopoState *root, CPUTopoState *child)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+
+    if (level == CPU_TOPO_CORE) {
+        QTAILQ_INSERT_TAIL(&slot->cores, CPU_CORE(child), node);
+    }
+    return;
+}
+
+static void cpu_slot_del_topo_info(CPUTopoState *root, CPUTopoState *child)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+
+    if (level == CPU_TOPO_CORE) {
+        QTAILQ_REMOVE(&slot->cores, CPU_CORE(child), node);
+    }
+    return;
+}
+
+static void cpu_slot_update_topo_info(CPUTopoState *root, CPUTopoState *child,
+                                      bool is_realize)
+{
+    g_assert(child->parent);
+
+    if (is_realize) {
+        cpu_slot_add_topo_info(root, child);
+    } else {
+        cpu_slot_del_topo_info(root, child);
+    }
+}
+
 static void cpu_slot_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -31,12 +65,21 @@ static void cpu_slot_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 
     tc->level = CPU_TOPO_ROOT;
+    tc->update_topo_info = cpu_slot_update_topo_info;
+}
+
+static void cpu_slot_instance_init(Object *obj)
+{
+    CPUSlot *slot = CPU_SLOT(obj);
+
+    QTAILQ_INIT(&slot->cores);
 }
 
 static const TypeInfo cpu_slot_type_info = {
     .name = TYPE_CPU_SLOT,
     .parent = TYPE_CPU_TOPO,
     .class_init = cpu_slot_class_init,
+    .instance_init = cpu_slot_instance_init,
     .instance_size = sizeof(CPUSlot),
 };
 
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 718c8ecaa751..d2a1160562be 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -22,17 +22,26 @@
 #define CPU_SLOT_H
 
 #include "hw/core/cpu-topo.h"
+#include "hw/cpu/core.h"
 #include "hw/qdev-core.h"
 
 #define TYPE_CPU_SLOT "cpu-slot"
 
 OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
 
+/**
+ * CPUSlot:
+ * @cores: Queue consisting of all the cores in the topology tree
+ *     where the cpu-slot is the root. cpu-slot can maintain similar
+ *     queues for other topology levels to facilitate traversal
+ *     when necessary.
+ */
 struct CPUSlot {
     /*< private >*/
     CPUTopoState parent_obj;
 
     /*< public >*/
+    QTAILQ_HEAD(, CPUCore) cores;
 };
 
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 591240861efb..65dc10931190 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -40,6 +40,8 @@ struct CPUCore {
      * "-device"/"device_add"?
      */
     int plugged_threads;
+
+    QTAILQ_ENTRY(CPUCore) node;
 };
 
 #endif
-- 
2.34.1

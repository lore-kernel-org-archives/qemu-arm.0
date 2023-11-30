Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269017ejb;
        Thu, 30 Nov 2023 06:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyuLOWl3RY7Ska1Lud5e64lnYl3xj2DkUbWc/aArok9AHE9HTufpJpmM/E/bapPLCNqtzT
X-Received: by 2002:a05:622a:1b8d:b0:420:5b48:4a54 with SMTP id bp13-20020a05622a1b8d00b004205b484a54mr30839839qtb.23.1701354751752;
        Thu, 30 Nov 2023 06:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354751; cv=none;
        d=google.com; s=arc-20160816;
        b=TQMMEiT9fo1tkLR7F+AtjLouiF/ZxApoXjGNcU6y213t+BDpoEN9mbNUdKswXokaoW
         L0YaWQiK3G30sccFVp61UF7e04M0BES8W0RqR4LnJViIuatdOlzt5CIpJ6NegH6Xfgq4
         /HYmfB4osxXsJ/LHhVzyPndFzAcU4FcbdmtBdKPNslRkUc68bUQRvpPvYq7VhGBjh7fE
         RHG1RxhEFimPcWE8HEo79CE6gBdv0twrhvnhX6/TYXFqfla7ZhKeMJGC5ns+Ag9PENk7
         IUyd/hr2Dy+uXVTTU9GcrS/tFiPhPEtLPFMm6NTq9qH/ZokKvOFUQ3qmIs5/yWIKRfdo
         0zBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4Vtg8nuhFDKaL6AO7+xqdwzFixRs65nxKO/xum/WD+g=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=GUZyD79nY4PrRomrw/NqEZniZafUNAHFTPwTqauHGaFavyP1j6woCCyKi2r4Fd8dgv
         8SftMzaD00xUDHEi82SBK0YgiybMvRmmJHT2YSCcPnhCKweBAFt6dpg85J9Ku/Q7XMbM
         zOdBrqhDSgxzDG3cJg9L4lWJw3wo4wpyF51wX0MUUA7ARKK7+4qa5bnthepYnTmzGFe0
         dN4waUEtUCmdi+n3+bKm1jbvRJijuCNpSwodLA9Tvd03FM1x/hnrd6ns/74Lodyn5dGC
         8YkzYnF2c87VbBVtOYUCcjJslycCo52YIG7FsN3FRXAw9zVh/Cv75CDHb+VGfIcaiBER
         CZNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="Qtj3/uJm";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id v6-20020a05622a130600b00423e77b183fsi1200560qtk.710.2023.11.30.06.32.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:32:31 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="Qtj3/uJm";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354751; x=1732890751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rfkBnAETWygr5TaDQC+NvTNqfHDXa5mpCuKsaH8rIdY=;
  b=Qtj3/uJmyY+MYtSXQeGvNan3+L9IwkxiCXn33LUP6lSDlK3IXb7PL5jm
   r5y1mkn1/R2DRyNuksCLbHBJQAqbfR7r5X6TTLrdTWQ1ImTuyc9JJ6k9A
   vAqZ9Qn+jKTS6jQrX4BMwbH7Nd3D0CN9YBrm+Q/ej9+pxw9RMatrFqQRc
   kDJKjPYXALiyakZgHXB+M21zEJQD9VaqQpYMUpsQwSTqM6GsCpM2CG3B5
   QH+rWtPYtBW8ZNfVyNATMUQAMoJyKx8oOWfsFQxEH9Ic6m/8nUquItM01
   nx7h1Rrdx2h2UJMc/fWkysI67n2tbBU88GZN0Ce3I+vJx3vqdIQOTWhwX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531541"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531541"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729798"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729798"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:58 -0800
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
Subject: [RFC 10/41] hw/core/topo: Add virtual method to update topology info for parent
Date: Thu, 30 Nov 2023 22:41:32 +0800
Message-Id: <20231130144203.2307629-11-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hesQeJATrLXa

From: Zhao Liu <zhao1.liu@intel.com>

When a new topology device is inserted into the topology tree,
its'parents (including non-direct parent) need to update topology
information.

Add the virtual method to help parents on topology tree update
topology information statistics.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 20 ++++++++++++++++++++
 include/hw/core/cpu-topo.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 3e0c183388d8..e244f0a3564e 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -154,6 +154,20 @@ static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
     cpu_topo_refresh_free_child_index(parent);
 }
 
+static void cpu_topo_update_info(CPUTopoState *topo, bool is_realize)
+{
+    CPUTopoState *parent = topo->parent;
+    CPUTopoClass *tc;
+
+    while (parent) {
+        tc = CPU_TOPO_GET_CLASS(parent);
+        if (tc->update_topo_info) {
+            tc->update_topo_info(parent, topo, is_realize);
+        }
+        parent = parent->parent;
+    }
+}
+
 static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
 {
     Object *obj = OBJECT(topo);
@@ -178,6 +192,11 @@ static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
 
     if (topo->parent) {
         cpu_topo_build_hierarchy(topo, errp);
+        if (*errp) {
+            return;
+        }
+
+        cpu_topo_update_info(topo, true);
     }
 }
 
@@ -203,6 +222,7 @@ static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
         return;
     }
 
+    cpu_topo_update_info(topo, false);
     QTAILQ_REMOVE(&parent->children, topo, sibling);
     parent->num_children--;
 
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index c0dfff9dc63b..79cd8606feca 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -44,6 +44,8 @@ OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
 /**
  * CPUTopoClass:
  * @level: Topology level for this CPUTopoClass.
+ * @update_topo_info: Method to update topology information statistics when
+ *     new child (including direct child and non-direct child) is added.
  */
 struct CPUTopoClass {
     /*< private >*/
@@ -51,6 +53,8 @@ struct CPUTopoClass {
 
     /*< public >*/
     CPUTopoLevel level;
+    void (*update_topo_info)(CPUTopoState *parent, CPUTopoState *child,
+                             bool is_realize);
 };
 
 /**
-- 
2.34.1

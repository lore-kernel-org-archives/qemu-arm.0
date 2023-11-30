Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269064ejb;
        Thu, 30 Nov 2023 06:32:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm4yLjjyppTqYIk4oC1YsXlIoa9irRoZKWdpAo/be9vTJl/hWB3JS/s7S35eMOe5p0lUHf
X-Received: by 2002:a05:6808:10cd:b0:3b2:ec66:d868 with SMTP id s13-20020a05680810cd00b003b2ec66d868mr29994405ois.41.1701354756588;
        Thu, 30 Nov 2023 06:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354756; cv=none;
        d=google.com; s=arc-20160816;
        b=0No7GhqffeYn2mN1LmjicZrztoIzqvISdwSUu9FKymuTETvlLXCr5Y4lopmg5lmSXS
         VGnh8B6J+BQrHlM1rjNqkmfkvdzpCakBNM+IZOYc+98ByiKjUeEz5hgxFgkvo++dyCS8
         U3SF+LTAscR47vchd+jJto48/SA5Dj7TxtIzD5OlPdyhmWfKgOG0KXZtoiYHD/8PGQjK
         jWOqcSwPR5ZgExp+bddRg/vWqFkcTpRD1Tgh3wUwD5E6Ag5MfqRKYAPQ46PrBqMunC03
         EdZ81O0EviHA0wMphXgVYsbzzkZLIGtYD7MsFeJszEbE1xQO70chK39xaqufWi7XAExE
         OxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ihp/jx5seYg7c0g5X0s3RsUl526zGV7js1rt+zrZCHs=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=KePPMVJ2B0Mak601NDfUXTJRO2egqKAu+baSRiMAKg9xMiaqbkNAjfxGGPweDBolcv
         iXWG8DTm1ne5V4VzsQPZ/mtoLXfKqSnqJzxaNhA3wryL+h6JaMKRZD5qAxdKiOQa3EHR
         HAriFgLkCxtk7/pnNu3luMCGmtldyHuhN2iyxX/91qjqL0nIpZd6PsR61QyP/Dw26vfv
         VDqUsOG2HNCpGwwKbLOi5BHCCfwooIDR6yLQe5BJ1OJjJYIDGSylcWFebf8Hn1p9JVlo
         If+oMFQt/VgGbHdLMOLkQWsjJgvrcHyYQVQ77Yu3q4WdP/9uJT/nxdohZZJzPUoYlfty
         iueQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XLB9kBVX;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id v6-20020a05622a130600b00423e77b183fsi1200560qtk.710.2023.11.30.06.32.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:32:36 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XLB9kBVX;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354756; x=1732890756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qW0hllcBGqseRYTHsmnEpW0X6HH9DmoP+0BU5Dr4Av4=;
  b=XLB9kBVX/3kSERjHtrnb57vUN8VMf87YrvycEkKe3yun4DiR0bYSrlvT
   uvpt8z6DHvshgrbVmNz6/3wumQQFY7cVonZObh0usBwo+PncLjk8/g9id
   olqdAG4aHBCs8iBU6SlnuMJnI9eXFH4XOI5mNRBlBh9YIGBlVUjkMrAM3
   6YdV1T3QAYC5jsUiITFi9dr/AIwlkKra1Y4Ke84Z5ySQxDvuG3/8WiTpB
   dvxmnPCx1pGzTgB1j897ZYb1Jz/AF8TcCwvGrfgNYzmeFN4K9PirKsC0Y
   cOrpwJiawOBCPBBQFtKJBEOL4Xsc6Yx5iRPR8oA1CkJIGr9z3HyfVlH1P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531605"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531605"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:32:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729823"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729823"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:07 -0800
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
Subject: [RFC 11/41] hw/core/topo: Add virtual method to check topology child
Date: Thu, 30 Nov 2023 22:41:33 +0800
Message-Id: <20231130144203.2307629-12-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 17nmciEX8QpZ

From: Zhao Liu <zhao1.liu@intel.com>

When a new topology child is to be inserted into the topology tree, its
parents (including non-direct parents) need to check if this child is
supported.

Add the virtual method to allow topology device to check the support for
their topology children.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 22 ++++++++++++++++++++++
 include/hw/core/cpu-topo.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index e244f0a3564e..cba2dc747e74 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -168,6 +168,23 @@ static void cpu_topo_update_info(CPUTopoState *topo, bool is_realize)
     }
 }
 
+static void cpu_topo_check_support(CPUTopoState *topo, Error **errp)
+{
+    CPUTopoState *parent = topo->parent;
+    CPUTopoClass *tc;
+
+    while (parent) {
+        tc = CPU_TOPO_GET_CLASS(parent);
+        if (tc->check_topo_child) {
+            tc->check_topo_child(parent, topo, errp);
+            if (*errp) {
+                return;
+            }
+        }
+        parent = parent->parent;
+    }
+}
+
 static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
 {
     Object *obj = OBJECT(topo);
@@ -191,6 +208,11 @@ static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
     }
 
     if (topo->parent) {
+        cpu_topo_check_support(topo, errp);
+        if (*errp) {
+            return;
+        }
+
         cpu_topo_build_hierarchy(topo, errp);
         if (*errp) {
             return;
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index 79cd8606feca..1ffdb0be6d38 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -46,6 +46,8 @@ OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
  * @level: Topology level for this CPUTopoClass.
  * @update_topo_info: Method to update topology information statistics when
  *     new child (including direct child and non-direct child) is added.
+ * @check_topo_child: Method to check the support for new child (including
+ *     direct child and non-direct child) to be added.
  */
 struct CPUTopoClass {
     /*< private >*/
@@ -55,6 +57,8 @@ struct CPUTopoClass {
     CPUTopoLevel level;
     void (*update_topo_info)(CPUTopoState *parent, CPUTopoState *child,
                              bool is_realize);
+    void (*check_topo_child)(CPUTopoState *parent, CPUTopoState *child,
+                             Error **errp);
 };
 
 /**
-- 
2.34.1

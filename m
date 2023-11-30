Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp270120ejb;
        Thu, 30 Nov 2023 06:34:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYvTfPuawfXTyuc230E1aXpYT4RKnIKHhy3JcGE4Jhr3T4/oREYi9XSWwYYa2Y+vrjwyc0
X-Received: by 2002:a05:6214:d8e:b0:67a:3b18:1b1e with SMTP id e14-20020a0562140d8e00b0067a3b181b1emr17729980qve.54.1701354842405;
        Thu, 30 Nov 2023 06:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354842; cv=none;
        d=google.com; s=arc-20160816;
        b=SEzEOo6Twjxj68Gx2DUAI37ZP1e6mING8Hh/C+qS7KqH7+QQdNkV4AS7z06YmM17XI
         IVB4Ino1NejDANc2x038raX7J2sxiI6Pc6JoBv/dO3UqhDCwGv8VoaQ9KrIznxNLgKLi
         qB+qdqaUG6qx9tzPahm6QIVOM2HxXSH/KYzwybx9QZz/0P2CQsxKLjOroPAkbRh58dEj
         VhCD7TXpoH1xSl0XU3vSoloYHA6XoZGscc7bW4k3epzKAvokHOZp/cQON1e/c9hzYZrl
         sfnmuNIAJCzppYKTVLOE7LUCcrAJcia34tZ6xQ6jJ2CZVdwmQsxwwYh7gnhtUoKs7IfO
         nopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=isIZewBlWhHlPIRd4AOCKWvDW7hj+Xa7GjguZrlH764=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=o1qttKrO0sanHbiKf9eW5w0WmdF1t2/VgxWaOexYcSlW9HvlG9LOipKNxnlk6Sk7HR
         VbOj0qnvEwqcL1btuuk174b71a+mMb+Ua4hVpfmH3m96uAjujPxLFmZxUmvNJ7wPLcBP
         oalzUHmpJeS9S4cIuvOTq3w5rhZy9mRNRZzuI5dk0ao+JtRR3r1BOJmtBiHQjUt68FJy
         GBeVz8GhvRLNmCIeawYjMIougvXhCrRm6FRS2Pf2Kuav2NwoHn4reTa4DscluSkMNlq8
         OvNnJn0+cRUGTLv1P8l0SC512tuosiLEkfjgrDI2p3LgYS6ECYAUaYZVfW9+riHYrYcj
         GneQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=npfBwEWs;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id jh3-20020a0562141fc300b0065d124684a6si1086825qvb.88.2023.11.30.06.34.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:34:02 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=npfBwEWs;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354842; x=1732890842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ojKaeiijveA4rQSsZpp2eyLul8UTXwtywNBoYac3pw0=;
  b=npfBwEWswmS5Yfn4Uco6zXxF4JaLt+FE+79DM7e5JMLR1nPnwK6VCEdH
   j7WoigdZOks41koEQQm4W4dCraScHUs4wZlrWZ0lvKeDas54JpDuf3vLK
   lWKFlXEgXZOFfRma+kA0PuxNbu4WaEYYnyYIpBixOQfHKxlpofixhCcIf
   1zPXWZSUCvFAhJlqpVMbpMpsRVruNGVR34syuRx1JcddDh+DVuDCLToYw
   BxnbIaQtYvda/pX3j9EQtf7uuTphajgy+kDCv3tkcTgVq2WOryvDHLwst
   plCZfJMCKgcpOwzKEfpCOz0ejh6nQdSCM38o9iBosvh8376dMc2GrGMVa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532108"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532108"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730060"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730060"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:50 -0800
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
Subject: [RFC 22/41] hw/cpu/cluster: Convert cpu-cluster from general device to topology device
Date: Thu, 30 Nov 2023 22:41:44 +0800
Message-Id: <20231130144203.2307629-23-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jTY83GgNd5gb

From: Zhao Liu <zhao1.liu@intel.com>

Convert cpu-cluster to topology device then user could create cluster
level topology from cli and later the cpu-clusters could be added into
topology tree.

In addition, mark the cpu-cluster as DEVICE_CATEGORY_CPU_DEF category to
indicate it belongs to the basic CPU definition and should be created
from cli before board initialization.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cluster.c         | 11 +++++++++--
 include/hw/cpu/cluster.h |  7 +++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 8a666c27d151..adf0ef23e8d4 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -86,15 +86,21 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
     if (cc->tcg_clu_ops->collect_cpus) {
         cc->tcg_clu_ops->collect_cpus(cluster, errp);
     }
+
+    cc->parent_realize(dev, errp);
 }
 
 static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(klass);
     CPUClusterClass *cc = CPU_CLUSTER_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
     device_class_set_props(dc, cpu_cluster_properties);
-    dc->realize = cpu_cluster_realize;
+    device_class_set_parent_realize(dc, cpu_cluster_realize,
+                                    &cc->parent_realize);
+    tc->level = CPU_TOPO_CLUSTER;
 
 #ifdef CONFIG_TCG
     cc->tcg_clu_ops = &common_cluster_tcg_ops;
@@ -103,8 +109,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo cpu_cluster_type_info = {
     .name = TYPE_CPU_CLUSTER,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_CPU_TOPO,
     .instance_size = sizeof(CPUCluster),
+    .class_size = sizeof(CPUClusterClass),
     .class_init = cpu_cluster_class_init,
 };
 
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index b3185e2f2566..888993c36da4 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -20,6 +20,7 @@
 #ifndef HW_CPU_CLUSTER_H
 #define HW_CPU_CLUSTER_H
 
+#include "hw/core/cpu-topo.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
@@ -84,11 +85,13 @@ struct TCGClusterOps {
 
 struct CPUClusterClass {
     /*< private >*/
-    DeviceClass parent_class;
+    CPUTopoClass parent_class;
 
     /*< public >*/
     /* when TCG is not available, this pointer is NULL */
     const struct TCGClusterOps *tcg_clu_ops;
+
+    DeviceRealize parent_realize;
 };
 
 /**
@@ -100,7 +103,7 @@ struct CPUClusterClass {
  */
 struct CPUCluster {
     /*< private >*/
-    DeviceState parent_obj;
+    CPUTopoState parent_obj;
 
     /*< public >*/
     uint32_t cluster_id;
-- 
2.34.1

Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269182ejb;
        Thu, 30 Nov 2023 06:32:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0R4R+YQyolqdko5KNqe3aw8Bl6JYCxQjjxSL8lLWFYT70wZev2uS+CueRcfPIHvJpG/iv
X-Received: by 2002:a05:622a:209:b0:41e:29ac:1300 with SMTP id b9-20020a05622a020900b0041e29ac1300mr26618397qtx.27.1701354766185;
        Thu, 30 Nov 2023 06:32:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354766; cv=none;
        d=google.com; s=arc-20160816;
        b=Pw/9aTYxRe+5PEyHBJlgJPHCvAk/zBWXOluwT7w+tij6BXNqJR6ctf79kVNQ2nfGG/
         kgNa92g9oXhNHxNTDZZqp9ekdsyKe3MA053muq+51JFRLVgJlm1kMJFRw11r6FpmIJpE
         FeYKNDHS9VEuVTAR+MxmXdj+SfJiQgdZ60pcIKPO0aeKfDOaed/AaUaew7zPiPCnt9IR
         mbALkAX6mZITo3djtQe1tZXMNzAC0r9Pzgla7QpBt2mYTKkdnzQbrCsH+ufXhqSoXFRF
         e901xMNBLDD7cQ+g5/T7DA9aM3bzuW2Qb8tPDfPDw9BAtLf1+/tRYJQrfE2SXCCWsZTX
         5p0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8fHZmOwnvs/K8ZQ2CmExFFPXoErkUG0bXhl59nNixrE=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=a5xgK7RNKvFMLhfUW2niu6f5miCPZio0zHmwJn6oNmSRSNK6G8hod3ZPV04gFN8A7D
         UQS8wGmMcMbIMb12xKQ2aXru4CBJA78Qt1Twmb/4a5b8bS+ewsiZWLt+sgIh/CPP4Kl7
         MSqEm8qh1D3omSEhLOyaBP3ff+rTvVNBu3DvsaEOThZvQIr6zTV8gHtDqasHCF5oCZoj
         TH9F5HYGrvdYk+i31e9gsux1+4DPCDEqyMxpYL8f1rAyHPt2MGdvQ7koTmw5sJwy5h3e
         0OaWjTQA5vtN1P6Qxve5BqfNHiTmZ5A1MLwK4Mk3enuTIlgSfuLVntZIuH33mZAk4kTA
         GHEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mZ8qI8ub;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id v6-20020a05622a130600b00423e77b183fsi1200560qtk.710.2023.11.30.06.32.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:32:46 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mZ8qI8ub;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354765; x=1732890765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=giqm05kbC3tYOPrffoLra7vHI+bWgR59/qNt+YCSQ+8=;
  b=mZ8qI8ub3MMMskDdP7+C3sRyGHhe3sCp61bSKMM5w726qOPQO93UL0K9
   4D4dQEX/UigaEkqMbjY2MFz4fzvmPXmjRhcdsoI0Ua7UdjtvcWR5YjgXP
   q6ejxTVjeSWtOVBnU770FySTrQurqpG1vwwNtzX6e6QkarHtLN2OgYpR1
   IQp1vEU2JWG4o+QRL/PDty+51XkuAlLAV51Czis1kc1BBMrCmZMi6zSAF
   WW3zQbHUcShd4de4p9ve+6HmPGXra52WhitZT5BCcTv8n7Js4VDhHHAHw
   g2qPK1q2uy9s+N2W7D7JdbzM+JRcD6oUQecHC3jqHB8OKp+5ZPqDOtYic
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531665"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479531665"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729853"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729853"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:17 -0800
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
Subject: [RFC 12/41] hw/core/topo: Add helpers to traverse the CPU topology tree
Date: Thu, 30 Nov 2023 22:41:34 +0800
Message-Id: <20231130144203.2307629-13-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bvBnMC3HWWm7

From: Zhao Liu <zhao1.liu@intel.com>

The topology devices will be organized as a topology tree. Each topology
device may have many topology children with lower topology level.

Add the helpers to traverse the CPU topology tree.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 41 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-topo.h | 13 ++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index cba2dc747e74..687a4cc566ec 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -318,3 +318,44 @@ static void cpu_topo_register_types(void)
 }
 
 type_init(cpu_topo_register_types)
+
+static int do_cpu_topo_child_foreach(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque,
+                                     bool recurse)
+{
+    CPUTopoState *child;
+    int ret = TOPO_FOREACH_CONTINUE;
+
+    QTAILQ_FOREACH(child, &topo->children, sibling) {
+        if (!levels || (levels && test_bit(CPU_TOPO_LEVEL(child), levels))) {
+            ret = fn(child, opaque);
+            if (ret == TOPO_FOREACH_END || ret == TOPO_FOREACH_ERR) {
+                break;
+            } else if (ret == TOPO_FOREACH_SIBLING) {
+                continue;
+            }
+        }
+
+        if (recurse) {
+            ret = do_cpu_topo_child_foreach(child, levels, fn, opaque, recurse);
+            if (ret != TOPO_FOREACH_CONTINUE) {
+                break;
+            }
+        }
+    }
+    return ret;
+}
+
+int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
+                           topo_fn fn, void *opaque)
+{
+    return do_cpu_topo_child_foreach(topo, levels, fn, opaque, false);
+}
+
+int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque)
+{
+    return do_cpu_topo_child_foreach(topo, levels, fn, opaque, true);
+}
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index 1ffdb0be6d38..453bacbb558b 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -90,4 +90,17 @@ struct CPUTopoState {
 
 #define CPU_TOPO_LEVEL(topo)    (CPU_TOPO_GET_CLASS(topo)->level)
 
+#define TOPO_FOREACH_SIBLING         2
+#define TOPO_FOREACH_END             1
+#define TOPO_FOREACH_CONTINUE        0
+#define TOPO_FOREACH_ERR             -1
+
+typedef int (*topo_fn)(CPUTopoState *topo, void *opaque);
+
+int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
+                           topo_fn fn, void *opaque);
+int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque);
+
 #endif /* CPU_TOPO_H */
-- 
2.34.1

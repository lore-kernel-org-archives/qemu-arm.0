Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp269885ejb;
        Thu, 30 Nov 2023 06:33:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBucFebVPLgLVufdoOvU+wcoNVbw00MPxaRqVwRWL6XL5dj9xbp3fC6RnLIdU4LyQsC6eZ
X-Received: by 2002:a05:620a:1474:b0:77d:6347:62e0 with SMTP id j20-20020a05620a147400b0077d634762e0mr21865233qkl.45.1701354823850;
        Thu, 30 Nov 2023 06:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354823; cv=none;
        d=google.com; s=arc-20160816;
        b=xhXrYPK6dCrHKTf3ksGWiI6erjjBACu7VJn6iUKNintxpLVHsH8E2cejo7OTmjoiBg
         f9eZpja71Bgcy/nJ7nILhVZFJM1c/Id9GsB+GYm4Or1VWYSEN0m8BdXjJ067seREb1Q+
         ZTmM1S1TpIaqXgJ8jeKHSBxMWGIqnh+3ObdhJoxE/L7VGjhzN0WC3ReR5Hnx9DnwZHDj
         TffRvFBBM3x7eAo6aQmgsMpBjibT1rdefFgGXDQvxdQGrbHTk3EYKU8iyI5+Jj+H/VCD
         vSieCjTsoz4rEPyxhLdGNG0Jc2CGk+0qvt1kNpt8XXCKsk0ow3tola1fzCCbfLqjGLE/
         5hlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H0/HHxPul43ILHrjzXmJE45WyoGhVmQ9EcVwjgMPIwo=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=yQcvO6d0y0GCwvy5F/275cMm1WonR6RJyuK1/1A+dBxzvWda1KPxEV05f98H4Jv2Jd
         zL5CGqOpNyKiij6qEqmE7VGFXSfmLqlo6EW/cHg8Xm1D0yMjwvjVQORzw6NjqKPmuBt8
         SopuDiKbAfGXNSu0JhbfEkFYGo9AfcDF4jLCoh8ghjsEr8imjxlpJiru8hSymHWTfzXx
         N+cBStC40DHuRUBxoqRntTGO3k0GNQn0Z+lAuWsV6iN1HhL39kEnxKbM44Xx0Yjs2f/1
         oxT+sjdfjalH/82bTT8Yq+bOa+icl/n84s9cR6gWrmFF9V6x+4fttuPGJlqW409u/hqw
         a8+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="XbTDDe/+";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id qj14-20020a05620a880e00b00770f3ea254fsi1170953qkn.171.2023.11.30.06.33.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:33:43 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="XbTDDe/+";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354823; x=1732890823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tVF0CmmcOBEuYyYp6LOjwJOc13qp/jolnKC9SQQ9zpo=;
  b=XbTDDe/+lm6QR5BZUbLAcCD4l6h5Q5800yy3KL0dkNgZb6ZsJdYjz0CN
   0tKVW/lQF1fLC3H5cC8VtiQbGFsKk5U16ceSSF2wyFwHuW+l1lxIRYCmn
   ahAgICYyZFl24E2TtDsvSWOgKL8zzvr585BzF8ueleoJXvXIJpQ4+QkDI
   sh2AiE0IK69KOd5PekrMu5DkoLfYAyvvpr4vx8LqSXjAZt3Lom35Nu7gv
   cbB9oH2cM4/yXZA8TmxDBAufE8gZYOQ0g36Y/Z9q10EfOuK2LD/KL29QK
   aIW3wGT4tjrM37KvMucugp+K1sLrAUjTDop9vbbSjp0Ml/3I6y6I6+uCt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532016"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532016"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:33:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730040"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730040"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:32 -0800
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
Subject: [RFC 20/41] hw/cpu/cluster: Descript cluster is not only used for TCG in comment
Date: Thu, 30 Nov 2023 22:41:42 +0800
Message-Id: <20231130144203.2307629-21-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ybePRDKJc+tC

From: Zhao Liu <zhao1.liu@intel.com>

Update the comment to make the cpu-cluster description more general for
both TCG and accel cases.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cluster.c         |  2 +-
 include/hw/cpu/cluster.h | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 340cfad9f8f1..27ab9e25a265 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -1,5 +1,5 @@
 /*
- * QEMU CPU cluster
+ * CPU cluster abstract device
  *
  * Copyright (c) 2018 GreenSocs SAS
  *
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index c038f05ddc9f..b3185e2f2566 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -1,5 +1,5 @@
 /*
- * QEMU CPU cluster
+ * CPU cluster abstract device
  *
  * Copyright (c) 2018 GreenSocs SAS
  *
@@ -24,17 +24,27 @@
 #include "qom/object.h"
 
 /*
- * CPU Cluster type
+ * # CPU Cluster
  *
- * A cluster is a group of CPUs which are all identical and have the same view
- * of the rest of the system. It is mainly an internal QEMU representation and
- * does not necessarily match with the notion of clusters on the real hardware.
+ * A cluster is a group of CPUs, that is, a level above the CPU (or Core).
+ *
+ * - For accel case, it's a CPU topology level concept above cores, in which
+ * the cores may share some resources (L2 cache or some others like L3
+ * cache tags, depending on the Archs). It is used to emulate the physical
+ * CPU cluster/module.
+ *
+ * - For TCG, cluster is used to organize CPUs directly without core. In one
+ * cluster, CPUs are all identical and have the same view of the rest of the
+ * system. It is mainly an internal QEMU representation and may not necessarily
+ * match with the notion of clusters on the real hardware.
  *
  * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs in an
  * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
  * not have the same view of memory (for example the main CPU and a management
  * controller processor) they should be in different clusters.
  *
+ * # Use case for cluster in TCG
+ *
  * A cluster is created by creating an object of TYPE_CPU_CLUSTER, and then
  * adding the CPUs to it as QOM child objects (e.g. using the
  * object_initialize_child() or object_property_add_child() functions).
-- 
2.34.1

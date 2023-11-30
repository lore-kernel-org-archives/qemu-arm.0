Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp272119ejb;
        Thu, 30 Nov 2023 06:36:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKE02OTaF4hKaspVpl633Xy0nTHqKcOgH+m6iIQpPY6U3qU0QvhKKwdY+TyYTUGchc2Hq0
X-Received: by 2002:a05:620a:3f4a:b0:77d:d041:a235 with SMTP id ty10-20020a05620a3f4a00b0077dd041a235mr4038746qkn.2.1701355001974;
        Thu, 30 Nov 2023 06:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701355001; cv=none;
        d=google.com; s=arc-20160816;
        b=H+KOsk8v0FnXWD6WBgtveKEZb6o1ZEbZFCe9sbw/OLQ324qmpCokUB76NqOAlu7KXH
         o/65YxsLORP/jxc8HtADWP8waC6QZI0iFgMrt8zswZiQW20QNuhqQDiOS0frP7qHYRUB
         UDZeStQ1ix5DNm0mUM5grOtR0QB8AuBexDUzlVwqcSUikmzsDGZab9PrCE1vA2+GWWGg
         LMHLeS90BJn6TIfS4eP94lmlltIFzf/43//3/I66/hiXhw+ycwr3A7m59z47a5TzpNTH
         /vEEtcv+Pz41dZG6om6Jsi4mHV4KPTGCOF4xMynYt7uhSGsvG9qlFjOxRwWc2JmWvFjJ
         8ouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p12BeQhcmKSgnkJJJQ3ZDkbTcZ5sKuxF+tV1dPV93lU=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=uJmh9YDeaX8bTaiCM86fx/H275l9JyyBiIV/Zq4ExJ1FArPJGLsL677CEVth7yHHos
         StdnQS/9HSk+ztxM9AFxeiXjd6uiFKk7Jcx4woinbffNHLeCJnHVscTZnKM+NLf8ZoXT
         vAJT8O33ZFqOJEZ7Yf2PcCQIuYGw8uidw4Py6lVvK6uQmUVPHqr6MafyfwnZwI9s5WsN
         tqDT9pMiOIj+WHenUALbL0D//8Red9ZAIGL+NfeOy99uh+JWbMH9SROa3Wt55eZhSlSX
         FhrFnXNiZgJqZ332UqnknLIW017BOAAPY5Xn/Kx/nYXeVRCdQAfW6h++zSyCq7vGDYzj
         nYxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GzrGyTaL;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id p9-20020a05620a22a900b0077a2952b4a0si1103260qkh.696.2023.11.30.06.36.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:36:41 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GzrGyTaL;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355001; x=1732891001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lndGadsp6lchipVix45sBuugJYcXf54DoIQPmPepLjo=;
  b=GzrGyTaLqfRnzGQrsf/BD6vINM25sd3CLD90mm0Pvn4Rciw3A19rJv9K
   B1+Kj5YA6/hmvhMULRLwbpa2d14M7JEEsBzJT6V3rJthAHEbLB/U9wIAx
   zCSYp1ejvEy0IjRGntzpTtksuZVGDzOYSvS8RbksD3R+K9yX9Qj2Cot0b
   PIggf4JvPRbDPuC5aEmNNsJYeGC3bl815LqL4qLHWwkcznayqwmcb086e
   d/lOHxTYA+LYtibSo74jOuf8ARm/Ivfcm1duiXhs203ZuT6TiI6iQ0dn3
   UGtJf/1xOsa5H11lOY8zO91+SNlfQb1Xr+Y+Axb2bIw8N6w7jDiE2njhR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532689"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532689"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730506"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730506"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:14 -0800
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
Subject: [RFC 37/41] hw/i386: Allow i386 to create new CPUs from QOM topology
Date: Thu, 30 Nov 2023 22:41:59 +0800
Message-Id: <20231130144203.2307629-38-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O4ALG0ie+Tob

From: Zhao Liu <zhao1.liu@intel.com>

For QOM topology, maximum number of CPUs and the number of plugged CPUs
are configured in core level.

Iterate through all the cpu-cores to determine how many CPUs should be
created in each cpu-core.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 3c99f4c3ab51..febffed92a83 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -152,9 +152,35 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     }
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
-    for (i = 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
-                    NULL, i, &error_fatal);
+
+    /*
+     * possible_cpus_qom_granu means the QOM topology support.
+     *
+     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
+     * i386 completes QOM topology support.
+     */
+    if (mc->smp_props.possible_cpus_qom_granu) {
+        CPUCore *core;
+        int cpu_index = 0;
+        int core_idx = 0;
+
+        MACHINE_CORE_FOREACH(ms, core) {
+            for (i = 0; i < core->plugged_threads; i++) {
+                x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
+                            OBJECT(core), cpu_index, &error_fatal);
+                cpu_index++;
+            }
+
+            if (core->plugged_threads < core->nr_threads) {
+                cpu_index += core->nr_threads - core->plugged_threads;
+            }
+            core_idx++;
+        }
+    } else {
+        for (i = 0; i < ms->smp.cpus; i++) {
+            x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
+                        NULL, i, &error_fatal);
+        }
     }
 }
 
-- 
2.34.1

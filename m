Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083493njb;
        Tue, 22 Oct 2024 06:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVL1JOciPNAHBWo0fXlRSZDJDTCDDow9islcz9FsmGLHyTIn8iFZe6FY/2jkuxDCTrRIui+QqubDgJKdw==@linaro.org
X-Google-Smtp-Source: AGHT+IEdBMA6FhM1avuEcZpin+FyNCsYtvcnHZJochzC4hoL1VdFkNixpiOLw70v2B18NQFucCV4
X-Received: by 2002:a05:620a:394c:b0:7a9:b8d1:a1d with SMTP id af79cd13be357-7b157b7efcamr2422505185a.38.1729604201795;
        Tue, 22 Oct 2024 06:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604201; cv=none;
        d=google.com; s=arc-20240605;
        b=BRhV7fUFN9I8EvBwGeZ8mJI/efJnnI/bzOR8pKSx6s9ehbi8oVgw2yrGD/VjU4F+B3
         J3VuZmRui5xHbLaYyPbrur3/eKOyc6kp1tJVYnYc/l6jycdFc3YANej2i32U/zAwpjPf
         dOuf3kD8bkidlhaANmST//N6VMjGOEzSm536blDlqIlQTWWSKmpwjUR6V5vycpRKZfmG
         ZKSnrYXPjFsVVKZeb0HJ0gUm9GMa5Z0VMM/AHdWt/H5eQJ4+5PCsyB0Y1f5SRoof3DKq
         OwQurOXs9Z8BCGaPNA7sjKuYfpuh288bN+x0jguiHXXRbcgLq89igFOsg38wmxSSbeth
         ZQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D0fjEBv6SHFhGRRz+pabQ6mxWdS16vVjAuBeqqXlIpY=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=S8MLGHl3frxooWA789PmZugCKsd6SsL9zGPhWSJWFAbGqL+QpgHHe82D2bpzq26dGM
         C/dFcjEWxqMBHMZlJOog1tFK9V7r+qJz8pnF0MYMKBcgcn4c0Ibm1ZJVuJasUM457sMG
         GKjWAxG9uFSnS4hq0aCiR9c/M/bdk/OZcyN92J62gOYDA4BwkDeom9VnET7TpjtZCQ11
         N0OBvIwAwcKZTCuiivwRGoA16u/UXVlMvWOBCKIsN+NJEQ6gsxz05tRYgdPhyQeootMm
         UEnBe8PkmJ3jXp81IM6cnjAs/ImHla8OxjuuzynvNOiNdp2BU2iv3RyprLHHKzoonnCA
         kfqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PmmXtkVH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PmmXtkVH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604201; x=1761140201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QiNSK6DAQM/vMK0hhZySRePzcs3gJqhWvw2eEAcE7DQ=;
  b=PmmXtkVHw3q+DNXS0d0H/U6nHdvHiailPvR/dJ4QelRrVc0NljCPCMxc
   NdEepXl259caj4mAjtP/q59UFWlpcDXyR92pnpXpCefL/ceR6Y8s0YJu5
   yd5oaNn5hrgJdv+scDWAOjQhcnvc+mo7A6px3pj6tNjFDJk4euj2LJNC8
   BxjvQ1FszvvhoTVO6qS0jebASVX1yIhDlC0gKjRv5G9ijRn2f+kY8qL1+
   1XOY519cm8TujRFy2Y+E9uI7s8FACnuY6u/puDGjxZ/JvtQMpJ1uPNswd
   MO+ZUZshprDIo4nsnF6c2ChhcqNYYVo4p2oAXh87hVQQyb8c4LNjR28KL
   w==;
X-CSE-ConnectionGUID: 3PQx9y26ScO8OujvvrU7bA==
X-CSE-MsgGUID: tB+ulHJvSamdTNyU5Hi5fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603720"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603720"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:40 -0700
X-CSE-ConnectionGUID: PDm5F9Q+Rs6pChB6l5swYQ==
X-CSE-MsgGUID: opfRim5ZRSuIaDccgRUNrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782413"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:35 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: [PATCH v4 6/9] i386/cpu: Support thread and module level cache topology
Date: Tue, 22 Oct 2024 21:51:48 +0800
Message-Id: <20241022135151.2052198-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PG9XN3Hpa/F8

Allow cache to be defined at the thread and module level. This
increases flexibility for x86 users to customize their cache topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/i386/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f1cbcaf9f4ad..3a5b5557f74b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -240,9 +240,15 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
     uint32_t num_ids = 0;
 
     switch (share_level) {
+    case CPU_TOPOLOGY_LEVEL_THREAD:
+        num_ids = 1;
+        break;
     case CPU_TOPOLOGY_LEVEL_CORE:
         num_ids = 1 << apicid_core_offset(topo_info);
         break;
+    case CPU_TOPOLOGY_LEVEL_MODULE:
+        num_ids = 1 << apicid_module_offset(topo_info);
+        break;
     case CPU_TOPOLOGY_LEVEL_DIE:
         num_ids = 1 << apicid_die_offset(topo_info);
         break;
@@ -250,10 +256,6 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
         num_ids = 1 << apicid_pkg_offset(topo_info);
         break;
     default:
-        /*
-         * Currently there is no use case for THREAD and MODULE, so use
-         * assert directly to facilitate debugging.
-         */
         g_assert_not_reached();
     }
 
-- 
2.34.1

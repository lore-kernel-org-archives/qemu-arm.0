Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp874594njb;
        Sat, 12 Oct 2024 03:28:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUR4Eh3OJ04B3+WvzSUZZUUfTF3VCwrlnMkk77HqRSoDB6OfI/AysB2I1Ft6BwYOEnEXRBUEi+FyuEqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEjtxnbeC1esXqGzSvNzjitU3QM30XJNg2YHYMHZx4NEvHvdgSIkdOyFAIDxB+JdFXQoR2j
X-Received: by 2002:a05:6214:5c41:b0:6cb:e943:bf with SMTP id 6a1803df08f44-6cbf9e76fd3mr48891196d6.37.1728728935316;
        Sat, 12 Oct 2024 03:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728728935; cv=none;
        d=google.com; s=arc-20240605;
        b=Zg4v+QRfXBgRsPYrGcT5PVqPh6oIYEqObxclv+7/4kXjFYo5tTI0HQt0McrbSqQF8R
         vzAyXvwq7/JjtRuwn5Xr/e26las7EUUkA1646dFlOhhRDsBlxBPIKvN2DGApDYmNwCd1
         rx6vT9wngsGZbqZCs/H3xpSTZK940hB6KNQGvABgisevrXdA9dLHamNQL1RN4d8lMSv6
         wCbi0Urf9/cAxqj5qzuwf2gGJxvj0Nv8nuWfeTzOkVyP0VwYOPQdaleb/Zmx3BWtwN6X
         UOUs1yqOUhgcwSvAT1VdL/Bc6bRtCYQJqcWAlQZN0R59E19LIdduJgVUHytD86a4J9Ot
         zRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CqOIW4np+3mDhTOiVi+sRsCZoXrnUiqDSb/cDWirMWU=;
        fh=8eQtOxmAA+DVnDFHfSMUWmFEgm9/ojWbxLxqamETElY=;
        b=HwGwbwMxIXHYC/J3I9Y2aIJgUMkLyFZWXPDb0Lh9omuiiVLoiV8lEkN6W6KbANCp/p
         YaaXHQ7LjcUMpG8NDadiriUmgqPOhNQ5MiA1+jk4d1029ow6XrKs9G24GiKvrYbp5bwZ
         MxSiv/7kBZMiltevadfJlqiUg58B8VKb4+45i/GW5kniUFl2HBgU0Xah5NgWoq8/+Tiy
         yiebfUSkDnV9DbktvdDBDwJUucOHf11A0fGibjOdoC7o2jN9ZW1zGyENDFY6y1H2X2fV
         WqnefCfFaUrTlQ6k4rVdt024sdmftkq1JJAXGqGlzBK82xgylImCNqMFPPD6DdN9bfQq
         D7Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hCPhtqdP;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.8])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e0783si58893326d6.189.2024.10.12.03.28.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) client-ip=192.198.163.8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hCPhtqdP;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728935; x=1760264935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eGq2BnytsrQRn74+62hETUgMwOQV0zS4jkHL1KP2Mqs=;
  b=hCPhtqdPvtERumnDY64Nbws1ZKlDWMVZejEfSHqSKpGqC1eHlBmeQXEg
   U8vtHnTNykn+5HsmTLAWbH6Vx/MMPZ0OL4EX/C0IIxD2sJKIszQJhc3zB
   CH5g9Nfw5RT2hlUj1+DlrrbKeLAoXI4NI7kxnG7LJkV6fE7aAIolwi93g
   H9ARAoUBGidGyezK+xpn0idfhPtEHwPA73iGxhdxi7uFYjyB4EZhI5rpW
   nOsLdqKfv7+kxv9kUGGBlX2nmzHjc9RX6udyMUnGKmY9pcwcyAk4cQzTU
   Cc5pN4jJe+brwkEx2RoGWMGrbUxU8BNRtu/ZHPlO9492pHvHCrdaQueOA
   g==;
X-CSE-ConnectionGUID: TZP/vgOIQPWVUOe/y3e5kQ==
X-CSE-MsgGUID: eJqQwz+OQxuvvOvM/KxexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45634901"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45634901"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:28:54 -0700
X-CSE-ConnectionGUID: rjQu1VD/RciFLAyVibtHAw==
X-CSE-MsgGUID: 5zW56g5hQ6mxOXFo7Uwd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77050851"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 03:28:49 -0700
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
Subject: [PATCH v3 4/7] i386/cpu: Support thread and module level cache topology
Date: Sat, 12 Oct 2024 18:44:26 +0800
Message-Id: <20241012104429.1048908-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Yq4zkLchDSWi

Allow cache to be defined at the thread and module level. This
increases flexibility for x86 users to customize their cache topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/i386/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c84e32c9c303..202bfe5086be 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -241,9 +241,15 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
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
@@ -251,10 +257,6 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
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

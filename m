Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp276900njc;
        Fri, 1 Nov 2024 01:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT9SYzqLCDbwAElgiwGi4ZRqQY7M7vtFR5y+FI7XG6L6DIAd/i+1cPVrkhMJ4DMkC+EvMX0wGS/INspg==@linaro.org
X-Google-Smtp-Source: AGHT+IHtBe6kExiJyM+0GLliyHMEWBaBgmo+hGeZNi5OH4V811SDtWbicoYLVKMEgK0JQ60XxRvc
X-Received: by 2002:a05:6214:5c89:b0:6d3:55ee:35d with SMTP id 6a1803df08f44-6d355ee0410mr73300906d6.7.1730448993820;
        Fri, 01 Nov 2024 01:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730448993; cv=none;
        d=google.com; s=arc-20240605;
        b=GLZ8RBjX4TrREjmAx6Wd0t+0y7rTpKqvhpCdxIojY4RpnRD7TiSKA7OSsBa3j9Zjch
         /bpgMJ6GKj9iKOMqrcrpA+HqSzZL0515Eajj7J+luzvSMejZWSq42ke+/rVvKGjKsUxw
         iDKQcgx0Me45o/9/Bfl+IlK97bz6xQX2fHI/jPZjfZ1dcA1csG5PON0zgluMmVdr9UBo
         b/9iRnDWG+gW9bNCXGjOwtayEWPxK3As2+HlqN4TmNuVL2oNS/UjvKH9KGJOMDn/X7uf
         WtjViGQ7Iwm+LkZK1hMWQv70or2sQ/g9Qke3E2PNEwsohf5bH3BPBt+evPbMl+DmWmVv
         HIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gLW4V9jJ67HX16rkfMNSocK4BeExM6bMIdBZoNY2oZs=;
        fh=eaTTmp+2XhStxW3y+BHQH9dBL4m34nwTlgFlQEpn70I=;
        b=HnAO9DLNcJVWGvehBgGLU3s1YY5hcCaahgLa/DQnYEdHAGXf1efCzcp/LrBLMHnF7Q
         7UDfjniSM7l0HcmV9jmiPTD5bhHSA6StloSgY0ANZewYPRTw3eCL1F7HTFbp8y3xznLK
         GbpKshIOeOV+45usa8D8eAS1jKctT+HAohUk27ksNiIHlHDJCsuK2G4pOq+lOm3y9vEf
         La4wVRYwGD0ykw4okEY+W+y9sBjN5W7RwieI/vNtGC2wxMkMzNT8mHvUEtKAQlhTpkd2
         jgVO+ZT4iXyfVs7vilFfIjlDbfoa4vGY0tMzj7mzwn0Qrj7vzNSFTLyqjF6XoDc6srUT
         ts9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Xn0Z5HmH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fe4csi37605786d6.382.2024.11.01.01.16.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Xn0Z5HmH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448994; x=1761984994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EGbj8vANOciytGjaNrt6k0e5IUuBc6pcu0CAwcWWiBE=;
  b=Xn0Z5HmHZmzKGptnD4FB02ElbLYOgR71kbdqzDoK4Xdxpr4KmMLO9MdF
   MTc9ziYzVb/Masd8LwJ4GNRxZadov45yf92r+mx6f6gyCh+galJKTXc/p
   fzP6KqOuD6G5Ea8Otvm1mM6pd/1D012tzdD/uWQBTxbHzGTawaOob9X3t
   /9c7IC7/fXxlNaxYayZimGQwevZGnBbTbVKVKRNsBw08nzbLWNiSCIQwe
   KR+jUh+StrPhCiAkbr3y1siXDcj3EwaeQYpGIyS0Y8BITDikSsxWd8gJQ
   NzMdQ/7FCy35i3I4Wq7wRS7Mx9ZXu3kBeez/rOGcsU4ZotfG6Sl0tWYvL
   w==;
X-CSE-ConnectionGUID: hp6l1T8iRNW9mqXmqNcHfQ==
X-CSE-MsgGUID: 5gzBLjlVSVKSfgd0qBLliw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17846062"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17846062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:16:33 -0700
X-CSE-ConnectionGUID: dcN29vuBQH2Be9GsJjYitw==
X-CSE-MsgGUID: uZqiM3dqRvOYw1MHcf0HIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834642"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:16:27 -0700
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
	Alireza Sanaee <alireza.sanaee@huawei.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Cc: Yongwei Ma <yongwei.ma@intel.com>
Subject: [PATCH v5 6/9] i386/cpu: Support thread and module level cache topology
Date: Fri,  1 Nov 2024 16:33:28 +0800
Message-Id: <20241101083331.340178-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u8+gp+WZ9Xg1

Allow cache to be defined at the thread and module level. This
increases flexibility for x86 users to customize their cache topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/i386/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d46710a4030f..09aaed95a856 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -243,9 +243,15 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
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
@@ -253,10 +259,6 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
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

Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333381njb;
        Wed, 3 Jul 2024 20:00:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmNq3/e8WLLKheXxVvb+Le5yVgz8AaFuMu0pZ3m1J1dxQVepwir2Xl8G4fwfz7KuterWL180v+VLQZ4AqAmT21wUPePoA2
X-Google-Smtp-Source: AGHT+IGiDv9I/GuDUwJ1HBIxJ6X8b2zUAPLkxtW4Haa2ErWH1oLz/SAU7AVSP1fCZ/TKfaMxFhSi
X-Received: by 2002:ac8:5fcb:0:b0:446:5d42:1c1b with SMTP id d75a77b69052e-447cbf54ff1mr4443411cf.38.1720062059752;
        Wed, 03 Jul 2024 20:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062059; cv=none;
        d=google.com; s=arc-20160816;
        b=PCMb6IyGhy8Uy3KoC2fc1iJnOtAnKRWw6CLc/JbyMqPk3YKYpHSYYQWLNmK0c98zq3
         +WLgYK59ejCLA708aMfeRtcMwbGUlAR/uaY0y6A/Kn1O6o+PM7nPwsuB7RekzrKEMbRp
         yGSc70ZNIUCAiPyd8QIFLc5xEjnDEBjRGF9drW30ysXyb+oMtSAAggSkZR/uVy05UWTh
         JLVX6o3VkXhuiccFwIXvWbDN55JV8L5115qBdBldNEaoBk/KCRmbgLC6AvMjGx5kHyKl
         JTXM7MgPO1qIrNASl2CrIxXMHgqDJKuVgS/NDArahWptSQTyFZGYWG3h5XNB7Hj+vDP1
         wu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wMZqX1SvTTpVbBLuWhwz4uwMZqgdvZaPvP0CxQY6oP8=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=annELdiFqJjICc0Qe21YC7kXqdxQdPMg1HJS5yI+xkJ7t56FSXVx3ChsmOVgGa7Uwe
         +AKetxQ2KDVSGaoX8IAqxB2Ag2FfnzFy77DnmYTZu2l4enDeHkkVq1oVb5XXK8BEKu0s
         gUo6Sdz6BNKbky3nPTKStFRfeJoX/cNrMpxH4uktUMYfjDo7YEvSV7KsN/9GWL+54Z85
         TU5lQfoMLojC8gtpAJSYtoePYRGKraOriIjwUYvO0IrC5p+UkMCgtyiO8TY22ebGANrP
         MsC+bSTqsjXL/KjQc9k/o0yq3qtmTVQGchLS3idLulLwrZEDdk6bltFjxAQ42A5RWfqN
         qjfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fsBtpdKE;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f7bsi141580431cf.89.2024.07.03.20.00.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fsBtpdKE;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062060; x=1751598060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WvA5kdecwjQmICQjAc3CQ0RARFRwW0D39pFCdSGsMJs=;
  b=fsBtpdKEdDFhSa7LOA//09977dr4VQGBoZS6u3bKmbftQNJPYSLqRGlq
   S2xB+1KuoI9iNuIqEGvSIaAdv5tDXlVemVwCPD8rX8KNEWz+XiRBYqcsD
   3rxheVC00MN2hZYKK/B4IbxA1ULtDD5tIZcvUYEFfLku+yvGeGS4E40yd
   PoS2M/04m3/L/XwqjEnYHSm9vh03P/O7FpaaltVPUmCsUhzwke+5rSz6n
   3aV2Eu776ERpThtWZqqCvJ1D2d1Mb5rZmdiJnq2RnQLCVYE44VfUY5yra
   bdNoxuJIjOKcJBvCg3Yd+3rNbxPm9SqvekbjX9r4Kmy9iQzqWlP5lJjLj
   Q==;
X-CSE-ConnectionGUID: 86Qz6rUSRjyWO9wDqQBHIw==
X-CSE-MsgGUID: S67m1ODlRIWkoYSwhrCf+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838129"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838129"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:00:58 -0700
X-CSE-ConnectionGUID: QYzkN/9dTKaDrPxBswrhTQ==
X-CSE-MsgGUID: iWwTKPgkQhy4cReKgVsBCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052354"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:00:53 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
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
	Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 5/8] i386/cpu: Support thread and module level cache topology
Date: Thu,  4 Jul 2024 11:16:00 +0800
Message-Id: <20240704031603.1744546-6-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mZCTko59b/bD

Allows cache to be defined at the thread and module level. This
increases flexibility for x86 users to customize their cache topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4ae3bbf30682..0ddbfa577caf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -241,9 +241,15 @@ static uint32_t max_thread_ids_for_cache(X86CPUTopoInfo *topo_info,
     uint32_t num_ids = 0;
 
     switch (share_level) {
+    case CPU_TOPO_LEVEL_THREAD:
+        num_ids = 1;
+        break;
     case CPU_TOPO_LEVEL_CORE:
         num_ids = 1 << apicid_core_offset(topo_info);
         break;
+    case CPU_TOPO_LEVEL_MODULE:
+        num_ids = 1 << apicid_module_offset(topo_info);
+        break;
     case CPU_TOPO_LEVEL_DIE:
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

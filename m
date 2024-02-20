Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1174740ejb;
        Tue, 20 Feb 2024 01:12:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWf6GAl5yTuhGgqJi0Ntg65hcATmxxjasWXWb4sh8RbEGO5oDdzqwrKFXW5PDUlOz0xl9Vwix64MtE4djhgQRL3cUNw+bKq
X-Google-Smtp-Source: AGHT+IGYkGQdABuvUzpLSOx47xAz7xicJCclyyRftR8XN0c5QVLGHsTY4dhjoYr91H924kO4Pd6G
X-Received: by 2002:a05:620a:531a:b0:783:bd16:e46a with SMTP id oo26-20020a05620a531a00b00783bd16e46amr14705679qkn.58.1708420333210;
        Tue, 20 Feb 2024 01:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708420333; cv=none;
        d=google.com; s=arc-20160816;
        b=qJ2OW4xixDcKJWD7OOMJ3WDwDti7S+aZ6TN1C1PD+unWFBcWCQsn61zv7bBS6A3Y64
         apBnxa2sH1BQh4mG7z+/45fJnbYMAOqaOzBfaBwYwWOxcyiw3h7u9MNZHLnrwb7Ppp2G
         jt/L3aOSF7kB7QTmRFKWybhVUsiKcslISEeiTq17dRTugnM5xveN0BX6pRkjgvkilLeR
         S87b9img+xyc6iWqTq30AAiKoMi0TpRl6r6uCGDYxvMfhZZ9tRsP0ObgOWbg0awsjl9D
         +qIEpspW/HO7s7LK1IlORulQNO6mDBxWc2AIMT9SuMTzawhw6Ion63G82D0h3RG7SVoR
         OF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cUYeLAZW0KBw1vwajpBZMV3SU2/ZD+h09pXDANbjwB0=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=SohcN7MylumLx0XfiSkMo94zaFfhNOMaelmYwaAC3eKpDG5ltjHTzLAy5gZjL3DodI
         fukvZvnv5+/HX+oxpMpicMT7o6s1HgByYprH5UAepIxoB2SUOZactLwN2HePS3mEg6Yc
         iCrQQIzvZJJANmKvwfK8gZt0tGpS3bng+IsV5yco7XWHOkgifj79I7uEviF/XTr6SeWV
         +fDabRLiV9fjLWRZnsqeyeC86Lx5su+hZxdmWyKqWxQtnA+6pcP8Lm6DJ8OkvEGN7Rof
         lSA6nVM87c+sr++Y+lR7b3BITI1YHih87oZ+YeLFJcljm8Fhf+881Hj7pe2ZOiNcWat2
         3sBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=N18e662w;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id qs15-20020a05620a394f00b007873af4a4e7si9151366qkn.764.2024.02.20.01.12.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:12:13 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=N18e662w;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708420333; x=1739956333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nmSGxPZR9yko6kQTreGOACQxkbHYm1OXOe8DkqwHjxw=;
  b=N18e662wZIZ1TDaDWUTZbUowwxTcbghYTmy4H1NhkfEbPSNcjDmoziYN
   Y7H8i3tXA7HM3Qy0um6YasLZXGLatVoUIiEtwNfT4Z8WGQ65MJVML55Ee
   dg2RVO98WxYmsg3zEMxfJxF2nhjqBLkuAyq+JYKtFMNseHMsDkrQvDiRT
   Pq9faRsYrELFw+lfjs82+Jm+cJ/t88ddfgj2+evuhgVC6dhs3hzG5mkOo
   djK8FIgyUOQ+A0jh2ZLmwVs/hIg3Rk4fn4BgsyqBUquAEa3UHgo9yWkEB
   2iKCStmntVgRCBw518bgthzSMMBIubYC26X1XtYX/KWDkNIIWOpoXmmKk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2375006"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2375006"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5013025"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2024 01:12:06 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
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
Subject: [RFC 5/8] i386/cpu: Support thread and module level cache topology
Date: Tue, 20 Feb 2024 17:25:01 +0800
Message-Id: <20240220092504.726064-6-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2ioqDXw3yM+3

From: Zhao Liu <zhao1.liu@intel.com>

Allows cache to be defined at the thread and module level. This
increases flexibility for x86 users to customize their cache topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 725d7e70182d..d7cb0f1e49b4 100644
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
-         * Currently there is no use case for SMT and MODULE, so use
-         * assert directly to facilitate debugging.
-         */
         g_assert_not_reached();
     }
 
-- 
2.34.1

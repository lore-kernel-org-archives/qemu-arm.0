Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp625165njb;
        Sun, 8 Sep 2024 05:43:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxLmrpN+DmgQ26DFPafrBOYa7/4VuQCHUZFqzn/QqvOQjpX4Vf4KqDgocSa7MLj4VAN6Cwnz45dtW/mg==@linaro.org
X-Google-Smtp-Source: AGHT+IGyomvPwt0HVfGwEy03sUd59Z4ACHq4/wh718Dic1mU/clmmAB/AO7fW0LuZOQcWRMaPhWS
X-Received: by 2002:a05:6214:4289:b0:6b5:e895:82f0 with SMTP id 6a1803df08f44-6c52851331amr117348666d6.43.1725799435376;
        Sun, 08 Sep 2024 05:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725799435; cv=none;
        d=google.com; s=arc-20240605;
        b=R8UUh1HFhEjn149ZPXCcGxvvrf21zfq6sDPQh158xBWC9QaZNVw6X9B1/Bh8Kel1KH
         x5GK2Ddv+CfIOdrTy38T1xfnnRPdKQcAosJ7Wh/IPCGRtVl/58dE5ivnW09rWyHqMIOb
         QL+fRtSpqykPOJg2MJ52zivsg1THu3/MAr8Gi0rQZQIBRf4ShL/3KKEGiSJEQuQ+QS9w
         wxdQx92VWz4BA07OcAJuQ3TD7MAltYQ7vJ8eoOE1Vv5aOukcTIm00He1nDhrSlDW+htF
         jxQTRs+aXfdjpiC1xpiD02jdL6aUBQhBAOPeWU7+4Rs3V+UGWY9N25JpIFNuAyfM00Ks
         fnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GFxqLV1efGvT9TFAtDWeI9PELZ4RuiNB68H+0tpYDH4=;
        fh=0cJcinrZnucqYjSNYncb6+eMGja84j/gs35YiXtiMHU=;
        b=gI5qnFDTSDaZtTPoYhwh4sLcondCW6q2MfMd/IspMAAfYhor3PMEM02e4OU/+fTVbM
         81paKhz+YAFkCgN4dq5xp0avhRJfch0cKexz0h1cJXpWnt1uOVVbAJQZesoY7Z8xKgmW
         3n6i1v3Eg/17nVgFgi28KOnjW+009kgogq3G7ZainrFZRD7kqaYKJXX1J92VDr7Xa7WT
         KaSOJKMyqhgS9bwamnziKWZvAZK9plIa8pQi/hudnd3CqzDaNOa11rTuLcwlkRG+gKrP
         mVgvmauaVFr4gyWH93Yd6rkvDPAkNADBaupKLNziTUKoxo0RDvxqf0L0O+1BzqQHnRW8
         JeSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Jxnsmv8V;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534787b9dsi31732186d6.435.2024.09.08.05.43.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 05:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Jxnsmv8V;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799436; x=1757335436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mnsZhLOSkIt6OGn4y2rRLWIdhUwNFa/JuPtwCtNqbec=;
  b=Jxnsmv8VXeM6Cqoa5BflNvWXnkD9h5tziOFg1mYfrEgZnylA25pQjsdZ
   QBNkQ6RmAD1Oqp+MKYPblC6lyucMhViqQxnDHSk0hXuSPcCo/ZlUKwdcx
   ThKPNLdRBPKbIhr9+uM5K2J2JAWw3g5ZRVH2TPZUqD3iRde5SGLzGO4Lb
   qAByaNJy5r7Ef7sa1MBpkKymFs6YFQ6fy2A25LHM3JxKnNZjNzkUmOCH2
   wjZYxTqSV3yScQYhWSLXkrse+K5Ri5uLdgjjnQ53j2KIDmwLavSl2vbv5
   j6mYY5ZTDP/i8SOYKI8K7DM+PTJoConcy6WWBh5J9ODjluZk5QP1nNmaY
   Q==;
X-CSE-ConnectionGUID: 0S7RpfleRZeyUFOr4aaKLA==
X-CSE-MsgGUID: E1Vqi8HGTFCCHpB8OSwjpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28238213"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28238213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:43:54 -0700
X-CSE-ConnectionGUID: bvTZQcDaRguVcTIRDYQTng==
X-CSE-MsgGUID: KH+c+HSBRdiHXCVmCm6NkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97196618"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 05:43:48 -0700
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
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 5/7] i386/cpu: Support thread and module level cache topology
Date: Sun,  8 Sep 2024 20:59:18 +0800
Message-Id: <20240908125920.1160236-6-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240908125920.1160236-1-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HdbhKs9i931K

Allow cache to be defined at the thread and module level. This
increases flexibility for x86 users to customize their cache topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
---
 target/i386/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e3a81bc64922..e9f755000356 100644
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

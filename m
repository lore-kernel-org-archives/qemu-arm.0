Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp118689ejk;
        Thu, 30 May 2024 03:00:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyY10GDFRxY5GR6SBByxaiU19hLSs/ZOLCYQHaQP3Be0zUIr0WLpSmu6D/y974xqJw8BFO++cNRAG3NL1DMQKeM1fGuOPB
X-Google-Smtp-Source: AGHT+IF9WC6rqD5BK5EjMuM2HOk07FGyp7V5cXXsFxWPtK9WTENKh9AIynIw1RLbAxEya10335wY
X-Received: by 2002:a05:6102:4a04:b0:48b:aa85:a6eb with SMTP id ada2fe7eead31-48bae99ce5amr1735366137.17.1717063248116;
        Thu, 30 May 2024 03:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717063248; cv=none;
        d=google.com; s=arc-20160816;
        b=Xol9N9fK756gPT/GNt6VMOYqdYPKFeYVAPZh4XH6QdQQMRHkwwdE8pZMdWd0+2KfFS
         GVIYgjhVzDRx2xs3SRnx5t/J8FQPn/ARJTTNAFKiGAdGETabtCVqUh5nWrc5aYTjLXQh
         AAHtXGGOSsSZyI86KzK1BYIm/rr9fdygQroaGxoA29xJ0RV5F3iWeSuU56x+cvBFjYed
         W6kBWSKIfffqtZXMdoVqLUyrRDXIRzlKQSTSbzD2y4nqnvBxObQS3S9a27R7MS+c4chK
         Eciwv6koNO0TJTq7OdcrO2c0zoOX319K8tQBQuz2Q5PlxmeN2oiuQCQcr6/d6eqPT0Ar
         KTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9p9iUBYf+NZQxZkk2EI31T6XYLVcRd8dah8E2NDbEUw=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=zZk7LdrRPuVnL4+hlxiqVuKncZupjOJh+xn61rg+6gnptfwbjRtGVEH3tkZAC5e42J
         v5tZx1/AY9rK355Bi+5+6TA6/tl0/lS2VcifnCxb2+O4NZSCvoqgV1GOG7RQAHIbBkUX
         oSWzVvLu7TMUxh4eBCtnL07TcfWdmy358PAfmdC1Yppx7Bww/oV6S3mnNrwANtt5SuuV
         S0U1IMARVXRRYz7EH7AU3ykVZl5RYdHClQ0ajqyvofwv3ajpTa/HYFNBl51VXHYsRaRk
         G1OLeN5EdWm6VPNBRDntwmhVuYxKXkIBCjvZuSjePWEaDP7B2wfN07vaS45NoMwn9WOe
         UUGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kpZSo5dg;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-804cc02cc8asi2656177241.162.2024.05.30.03.00.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:00:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kpZSo5dg;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063248; x=1748599248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iUVuwDv8IlCBNKOZ1ofL/GWf0HNwQI4LTyFUGM4Cs7g=;
  b=kpZSo5dguxB9y2eNce/FsorbIDWVGbCN7on8ngRQZE16rnVzaOevfE93
   VRCC5D3J2nl4uDljzPj2siSTxLdW2CjEP5XHG61MHT5t9Eqzcf3suMO7a
   CxJFOE+LOtd2eocX8JOCe74k0fccxpX7MO6DZvIdTIBWGRrDyGmI8BTB9
   xXq+x90lEXYy4POF+Y3qb2kK836VBnkFgdUk7CBHmXvk32NhhfmSOUIZ6
   Eh2sjwiZsZmD3Wqn0K4BGFbEuNa7DjC7PpztlkxHHq8cAxFo6Ej1hhiRP
   jQw2h56YvoVfAASPfyOUBOJDLZcXTCJhHKQV7FcKAVoJeca7hDiRx0xeO
   g==;
X-CSE-ConnectionGUID: HoY5n4iAQnOr6CbK63f6JQ==
X-CSE-MsgGUID: oXB54SYSQBuyIZ4lLq6s6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31032535"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31032535"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:00:47 -0700
X-CSE-ConnectionGUID: 9uWka8WTQZqxrJEPByh1OA==
X-CSE-MsgGUID: 5Q3UyZ3qRfeH+DYgEY/FpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35705073"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 03:00:42 -0700
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
Subject: [RFC v2 4/7] i386/cpu: Support thread and module level cache topology
Date: Thu, 30 May 2024 18:15:36 +0800
Message-Id: <20240530101539.768484-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530101539.768484-1-zhao1.liu@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cdX572Bbu6cl

Allows cache to be defined at the thread and module level. This
increases flexibility for x86 users to customize their cache topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b11097b5bafd..3a2dadb4bce0 100644
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

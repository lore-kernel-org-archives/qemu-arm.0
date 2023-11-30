Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp270025ejb;
        Thu, 30 Nov 2023 06:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+c/Jesu1zMBbxxsCr9R89ljFvKD35h3ZM1LDlEr2oG4CjFr4ganM3QsYManXikk4io9Vy
X-Received: by 2002:a05:622a:410c:b0:423:b92a:7fb5 with SMTP id cc12-20020a05622a410c00b00423b92a7fb5mr19487333qtb.12.1701354833341;
        Thu, 30 Nov 2023 06:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354833; cv=none;
        d=google.com; s=arc-20160816;
        b=zIdKHUfxjgJJX4UUZGIjqV2eRdiyW+/ym9Ta2EJmDRYRp2hNfParIHl/HT99KROJ+j
         BmyJw6pTL9b0miC/89sGUCrgNdDkgwgQuCLobvgiUlwC0PovJqKfkWachYmXNFGcEcxD
         GR4m69Zy9lDkLGmfzHm+DNL8PlSa5wlED2U9EodC70PBh8CDmcfgAqX80ECSKQTlxTzV
         MIuZYdtGaBG91rJ9D8/NcD4tNExzYjJ6e98TP4tRH4wJPuDcTW1DAvx448Ld3JTL5Tsj
         V8ezdbT4le8PKi0oZQMb5WR3dMsek0rmRb21Wj7LTGMhH6VSn/45OZpbNmLlepY+nhNf
         xj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yK1DTcZIT0smB57A3nagVnG+VCzq4+olInu+M+g13pA=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=Di7BtVAJFSGkJ8s4SHA5dDXB+vA0/bv/7RNiaciDqusUaRisuBFeONOTdzFhd5jzs2
         ew3m4+VUddGIW95a6CY+EjIUGr7H/T9qCcMJqZ3m9zw+OzGD6m/lPbDzc9Q1RIzYcNGJ
         eNw0MatI517gEV0RbossdzjacrCPCJgOWm8AjnSPO5gsLxyWoWspLQNzz157L1HsPqeq
         12gZ4/GQ+GDF7BOL5f6f6rY/NN5qgAL9J2y7CXGpvUWwFIgsfkfPXrt1JDBmXcuMQ30A
         WQ5B1gme3hJMMBL4JKXadj4sUPRQ2s/o9iaYkWExvy7v1hr14ixx2gCwFFGHMbSz8pub
         0sEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mGg+D15k;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id fy26-20020a05622a5a1a00b00423e5d68a49si1257521qtb.363.2023.11.30.06.33.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:33:53 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mGg+D15k;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354833; x=1732890833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TLbpY7EX///aEBUshQ9nHMg5QAVw4jJxDP0uMhZZdFI=;
  b=mGg+D15kVa+FbiZDXgQ6ZHjLcP9IGa1SsWu3qFYa5gpgh/ypdPCj33A1
   JeaefoQgFaOxS0GfiGS4R4pew1nb1z85dO9W3SMF6vIyapkKz1ep6keIr
   Hkk6+n8wSmLaUhekVwfsA4tXRHWK9z93cuU0jmxbhO4mlfMexQXen7MZ/
   K8nPxIx0WKn/j0czd1kxmDaugQQ/HwUndD0MNsBwKGvWVvsl7E0qp2qXw
   IKnQqN27c0AH8wYlEU3qWl+lC4SPw7tgvvf4ULlmsjWzWM6xml0aHDpyw
   zlwFs0BYs278c3IBTdGSOfz5ftKbnY379boc4ijmFfn/FAWZ3iJZCN22j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532053"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532053"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730047"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730047"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:41 -0800
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
Subject: [RFC 21/41] hw/cpu/cluster: Allow cpu-cluster to be created by -device
Date: Thu, 30 Nov 2023 22:41:43 +0800
Message-Id: <20231130144203.2307629-22-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 90hxWy1IS6Lg

From: Zhao Liu <zhao1.liu@intel.com>

Since we will extend cpu-cluster to build CPU topology in virtualization
case via -device, remove the original limitition.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cluster.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 27ab9e25a265..8a666c27d151 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -96,9 +96,6 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, cpu_cluster_properties);
     dc->realize = cpu_cluster_realize;
 
-    /* This is not directly for users, CPU children must be attached by code */
-    dc->user_creatable = false;
-
 #ifdef CONFIG_TCG
     cc->tcg_clu_ops = &common_cluster_tcg_ops;
 #endif
-- 
2.34.1

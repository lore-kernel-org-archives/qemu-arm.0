Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp267479ejb;
        Thu, 30 Nov 2023 06:30:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR09I8K/1xRxZoPW2covNgP5nidI5SHiwTZvG0eyqdDo289bcc0HBdG0m5K9HVUFlXQFdI
X-Received: by 2002:a05:6808:ec1:b0:3b8:4dd7:b9ca with SMTP id q1-20020a0568080ec100b003b84dd7b9camr26480276oiv.39.1701354644911;
        Thu, 30 Nov 2023 06:30:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354644; cv=none;
        d=google.com; s=arc-20160816;
        b=qYPRkx4YlrImoO8J4q8LINN7R+uqjqVBEt3RtWnpHLm5vpE3HYYrnEc/64BaSgixjF
         vF2tzlNAM32GykVW8XpBzz6F6vCXwObgcWBF6ukcOmYICa9RIIuro/sjsib3QRxVlCls
         z+Jx34CVvRDiLViXfVK2vKjTfDW/zLmD9H1zjFMoMYGLTq/ttu0k1g+5jcryiILVxK9U
         3hBf1Y7I0pdFILJFm+zaPXZIJpB1LA62uhm3FRLBxf/p7q9xlIBx9ZLQ9+jL6gOsjyEY
         HTCOvM+MUqyjfOT6GpQaYA53xYBSSlXhD1hE0Gpu9GHiOIHq2HyMwStmf9WDkeDk+2yW
         Fdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Mh5AYPt2XvJ2l2amFs/NXpXuRrrIbtSIYhnGvUCj4wE=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=Hg57EwJ4NoLl6Qv3wcUqla2nAjWgeRatvD+shEL4bE4SWb/dMkBgf2t0XyYMVl8n9d
         tlC3t8cnbvh4O1uhH/6gOTcgWcQWlNuibyHhPON+Igjy+76PgX+lVb/Rnb2QEGo2gyVz
         jzRnwNRJ3+/QWYnHBvhNgZoKq6Y2sP5zTqLtSZdi2u9/UChPItI5KNEa5ry2kfX9v/Na
         AmyOSCnhn5RqOnQHCab6RAHpxlUhZlLtfywaHfHo5WfHmmULmW23sNkE3X7PYsGw9cxn
         LXFSpIrzH7k3E5NbuYQzlWVBP7HkIlSIbN0rmG9dci8Q4UcDagaS7SmXFj57mlM/Sw/q
         GuCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="dc4v6De/";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id oo11-20020a05620a530b00b0077d6805627asi1077131qkn.411.2023.11.30.06.30.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:30:44 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="dc4v6De/";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354644; x=1732890644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GonVMos5FsS7CHBj98lIck+6Zgp9gIFuSW7kS7bFSf0=;
  b=dc4v6De/Eq21q8Dg2C+pZQe06H2ngepiNqHH3KNF06bJfft3waC+pgMJ
   E0qAFK8oAtTmqSWe2JuVke7czCtfPgQsjevAeladJ5+wtHoJfeQkaweNi
   xKgDZkmaS1neXrfc8qwOi26kohWOOs1Jjcts38jfjw5bjJwhBFqgUXd7Y
   2+jZMCfnu3c++ec54f7ZXq5cHJ71Wtbe3uCP7naQqc8ocL58o1CVlPDn7
   eMmurXg/IU8fz6Dcokt+Q0rABNCjvS7jAXw5mVj0q5lIBwQZ48TVfOzIa
   vuNTHadN71WGAl5rH14MHYj2FEGli0wx8y4P+3oLSwoVmi42nXqiL3ngn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479530852"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479530852"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729601"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729601"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:30:33 -0800
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
Subject: [RFC 01/41] qdev: Introduce new device category to cover basic topology device
Date: Thu, 30 Nov 2023 22:41:23 +0800
Message-Id: <20231130144203.2307629-2-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2q/DmDjNcDqB

From: Zhao Liu <zhao1.liu@intel.com>

Topology devices are used to define CPUs and need to be created and
realized before the board initialization.

Use this new catogory to identify such special devices.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/qdev-core.h | 1 +
 system/qdev-monitor.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 151d9682380d..97b7cfd04e35 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -86,6 +86,7 @@ typedef enum DeviceCategory {
     DEVICE_CATEGORY_SOUND,
     DEVICE_CATEGORY_MISC,
     DEVICE_CATEGORY_CPU,
+    DEVICE_CATEGORY_CPU_DEF,
     DEVICE_CATEGORY_WATCHDOG,
     DEVICE_CATEGORY_MAX
 } DeviceCategory;
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index a13db763e5dd..0f163b2d0310 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -173,6 +173,7 @@ static void qdev_print_devinfos(bool show_no_user)
         [DEVICE_CATEGORY_SOUND]   = "Sound",
         [DEVICE_CATEGORY_MISC]    = "Misc",
         [DEVICE_CATEGORY_CPU]     = "CPU",
+        [DEVICE_CATEGORY_CPU_DEF] = "CPU Definition",
         [DEVICE_CATEGORY_WATCHDOG]= "Watchdog",
         [DEVICE_CATEGORY_MAX]     = "Uncategorized",
     };
-- 
2.34.1

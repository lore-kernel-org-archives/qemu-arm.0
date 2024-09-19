Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85801dlb;
        Wed, 18 Sep 2024 22:55:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIfm4X0WuOfS0fvnErPylh6+JM2DLtASAQT2l02xE+4oHjs5OpI/6VU2SUavpXlK+3mHyvu9fmmG/JJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFBtwTKig5/AFKstTk9W5cGpBvNEGpT7jtHbU/XZXGT7WWF6ZsFVNAGneWuryOAJriTizOd
X-Received: by 2002:ac8:584c:0:b0:453:74cc:ce09 with SMTP id d75a77b69052e-4599d22410fmr386713251cf.8.1726725356929;
        Wed, 18 Sep 2024 22:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725356; cv=none;
        d=google.com; s=arc-20240605;
        b=Bhr+/ba3Rm7lWvHRzSrl8u2q8uQ6Wi6S+gykOgC0thRhrxoOMjcO3nC4SCoFARiAjO
         Q6Go3Tx1X/MYsVBF774ow1KTHOM9J3Uo14K9VOVlGmAaKOWcUX7xyQcnRjj7ZJzHHxtk
         BlFoQqug8dVmpiGInvkMmAGWb1whjhQg81mKwiWsyFEpqIqcAsKGjbjSSWkS1ywjNZX8
         B1il4osxhz0250eNGxDbMR5hu7nSZ/Rgm1uj68t9l0430HQtrW92RbpWKtTELCP/16Yn
         MpXcZNId5dsV62kyu8Yaw57bgS6ELiAY9wh1vWY+6t80+/kgyFtBn7u/tPQdiW5z7tRT
         J9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=98pJ/T3m6o/vwkHTQOMGhSZPRyUNpXswpE6iMAgcduo=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=fM6EdM7xyJrJhvV8U6u0keiUXvBN9Sbuil60hJgI03MLA0CGq0BnnrtMpCbxvKrE1T
         WevmHPvU+wilPZDFJDM7fAyukZpb/jIHt5pUxZj93qsju2XEvOG4KQksERybwi/jZhzW
         tBwqHfZQ1YBRRZBVIBldw6+H58ncXQhQPBXK7wN22iC3a9DAMJPD2QIg6s9GRdbc/7/U
         7sZaKdhzvveiHkR1SLkD32DYltmSVaRrQaE1u/+tsv2xRiMSx89SkLgbUAQWc7zMVsXD
         O+JYk+xaOag5+3YnHlZY6b/wdQeDp5kRIMXTl4sWzHebEmc6iXH1Z1PSiUklx56yQDkr
         Tivw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TWo1KaSR;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1792f416si10980571cf.563.2024.09.18.22.55.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:55:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TWo1KaSR;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725357; x=1758261357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/cMy+TVZMq4kWR7qIMuMwsU4jrTnlPcE1TIfBgg13Sg=;
  b=TWo1KaSR3EkYxQ1t6iq7BdB7ubeIThuDZWRwjP7Ov5TUprxGb0y2w7A+
   HQKdTRxDUxUHAk3T8XRJvbyF425KIRE1x3EN4lN2G6DET6pe54wBtSM/G
   yMsiuapKj42y4pRY0+2hgQqCbTcM3aMFXMPZhmL7I3Tdut1kbTr+brXNf
   9eAqSwB+77NDhkzZxioOJausmjZbKf2UNCIX39EeQNCZp1sXi2eLVloTG
   BvycP17UlZZhiGWNIhBl3egxSVPxAhxMci8JDUMs8fxupanfFnq5Pjrup
   WpFFXX0oYcnasgX/iVGYFfCZnmSow8PkwRjCzu5AbGW56xEgtRcgsayqy
   g==;
X-CSE-ConnectionGUID: 1ykXxMvEQIWpIn6wZsFVgA==
X-CSE-MsgGUID: hFzedO+WSTWHLDcrL9Kvjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813473"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:55:43 -0700
X-CSE-ConnectionGUID: HLpTBuCBQpubXQuDEb2ZXA==
X-CSE-MsgGUID: hbxUqHsUT/+8D401YpRrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418634"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:55:37 -0700
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
	Sergio Lopez <slp@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 02/12] qdev: Introduce new device category to cover basic topology device
Date: Thu, 19 Sep 2024 14:11:18 +0800
Message-Id: <20240919061128.769139-3-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: S8/3Xmi3tQKK

Topology devices are used to define CPUs and need to be created and
realized earlier than current qemu_create_cli_devices().

Use this new catogory to identify such special devices, which allows
to create them earlier in subsequent change.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cpu-topology.c  | 2 +-
 include/hw/qdev-core.h | 1 +
 system/qdev-monitor.c  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/cpu/cpu-topology.c b/hw/cpu/cpu-topology.c
index 3e8982ff7e6c..ce3da844a7d8 100644
--- a/hw/cpu/cpu-topology.c
+++ b/hw/cpu/cpu-topology.c
@@ -164,7 +164,7 @@ static void cpu_topo_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
 
-    set_bit(DEVICE_CATEGORY_CPU, dc->categories);
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
     dc->realize = cpu_topo_realize;
 
     /*
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 77223b28c788..ddcaa329e3ec 100644
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
index fe120353fedc..07863d4e650a 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -179,6 +179,7 @@ static void qdev_print_devinfos(bool show_no_user)
         [DEVICE_CATEGORY_SOUND]   = "Sound",
         [DEVICE_CATEGORY_MISC]    = "Misc",
         [DEVICE_CATEGORY_CPU]     = "CPU",
+        [DEVICE_CATEGORY_CPU_DEF] = "CPU Definition",
         [DEVICE_CATEGORY_WATCHDOG]= "Watchdog",
         [DEVICE_CATEGORY_MAX]     = "Uncategorized",
     };
-- 
2.34.1

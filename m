Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85735dlb;
        Wed, 18 Sep 2024 22:55:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVs0AYxu6ayP1i7BHkoJP1KwEl24QQP/gTizO+fjgb1WFj3kW5l1X21fhuYOGMs193u6BRuxZMpYxo8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGbCpyfK93jDX5sRG6E5Xrz8sKKd70+LvP2CilEFxR0ustYzup3JnwXxQDb6RPIoRKBnZT0
X-Received: by 2002:a05:622a:5291:b0:458:38cf:410e with SMTP id d75a77b69052e-4599d23e041mr312178841cf.22.1726725338280;
        Wed, 18 Sep 2024 22:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725338; cv=none;
        d=google.com; s=arc-20240605;
        b=XMZkJuQubOtuG+aSwNFhzeTzKy5+0frA9JCDGVwNen5lPOxd7jPBPrdd4PAqmVuvas
         xtmnkcM6x6ixMxH7SpL3XQxIRDSOKPxIpEyo2I5vGUB2F/6Lhv5NTatFDC/PosSyhMYs
         2XWgT2sHAqBo9GOTP3Sa7h8P+WG1SlJ+mlgO0rt3DuopROOC9iKtICHEEeKcRxS65gjX
         fVH1SVpHJtaFC0BAr9A6u7Fq4U17j5zE3a7s+uqOm5mrfxLZzvRIRD5yXZGgXjIbC5np
         Fd/f7F24gimY62SpopvzfzTj1ChIrSWfuCXafwDD0zF5TqPsrrVQsdGRZwaXEIODfs6s
         j7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PzpT6+aTdwyBbXmISyMnjylr9Tqo17Pen5GywsaZS64=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=U8ZOy45avZVpEwDAVL2zQXGu7nl04G/iOMABI5CF/FhBkgd3PpRoQK+9w8V8/yl1hs
         BuV9R5cjlI+t3ICtsnJMCvJMUmyhkX8fCfunZcUCR5Jl5SzO+Yy2LhXaCu5dh0284zPq
         Bk1PY16Z8ucdf/ZcgY1PCo152ju23fKNpNQGCVQIANGUxZbv6Zr3EPhTeTqfveTR4gG8
         Ix8zWXvsQNFeDKh4XoUqLvIIK15ZZgbz25jGuEmXU6rPp9yXGz4ORd8ouRJXOocrSAUO
         P3+1c76JwJOcbhPSL7is8/v7Kwo9E//mp5+oaP3fGdM1kR6VM2Piuu6Y52Y82ulv+9EQ
         GBhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=A9VGJkm2;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b17931f19si12134001cf.562.2024.09.18.22.55.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=A9VGJkm2;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725338; x=1758261338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8vg6cBFZQesBlTuKocwFM3B2ozeoI/WHoRcB8vhHX3k=;
  b=A9VGJkm2dEYQKjCeC5POKwV3dJ1hEXzHOD0KBu80NjX9lP0XxhrLpo9O
   hSNgG9OTQBpmqWXj9LFoHUZ+wSIWNjPzO767XrhULfrK4tmKnkoKKFjCT
   qKBtCi3oMZAVomUPNicpeE5GPfVQ0WjQpc5Pj7dD1cqJEohJ9xNLDmbQx
   Jh+SLYDMfjk/oFFlJRf60WL/6snSXkj8ZsuZIXo5AHCJvSivqcLIZwoQs
   u6OXxOGQNB82Ud1G3ccWo5j9rHgUHyBiLVRoKFTXCFDatOfbsVvsrTwKR
   VPiYxu6z6vx6eoWlCvSmjJNXHfg/2AUO0g+rp5kZw9HzjzYiYse57hRio
   A==;
X-CSE-ConnectionGUID: t9yQjkXtSXyG19otwtzzfw==
X-CSE-MsgGUID: yRj7vQVxSR2B/rLPVjVpXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813443"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:55:37 -0700
X-CSE-ConnectionGUID: bQQEQDoBRhGmcoS6NdtmMA==
X-CSE-MsgGUID: oV7dFcGcTuSTNDb8wim0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418610"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:55:31 -0700
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
Subject: [RFC v2 01/12] qdev: Allow qdev_device_add() to add specific category device
Date: Thu, 19 Sep 2024 14:11:17 +0800
Message-Id: <20240919061128.769139-2-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DTelSlJu+l5V

Topology devices need to be created and realized before board
initialization.

Allow qdev_device_add() to specify category to help create topology
devices early.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/net/virtio-net.c    |  2 +-
 hw/usb/xen-usb.c       |  3 ++-
 include/monitor/qdev.h |  4 ++--
 system/qdev-monitor.c  | 12 ++++++++----
 system/vl.c            |  4 ++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index fb84d142ee29..0d92e09e9076 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -935,7 +935,7 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         return;
     }
 
-    dev = qdev_device_add_from_qdict(n->primary_opts,
+    dev = qdev_device_add_from_qdict(n->primary_opts, NULL,
                                      n->primary_opts_from_json,
                                      &err);
     if (err) {
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 13901625c0c8..e4168b1fec7e 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -766,7 +766,8 @@ static void usbback_portid_add(struct usbback_info *usbif, unsigned port,
     qdict_put_str(qdict, "hostport", portname);
     opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict,
                                 &error_abort);
-    usbif->ports[port - 1].dev = USB_DEVICE(qdev_device_add(opts, &local_err));
+    usbif->ports[port - 1].dev = USB_DEVICE(
+                                     qdev_device_add(opts, NULL, &local_err));
     if (!usbif->ports[port - 1].dev) {
         qobject_unref(qdict);
         xen_pv_printf(&usbif->xendev, 0,
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 1d57bf657794..f5fd6e6c1ffc 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -8,8 +8,8 @@ void hmp_info_qdm(Monitor *mon, const QDict *qdict);
 void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
-DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
-DeviceState *qdev_device_add_from_qdict(const QDict *opts,
+DeviceState *qdev_device_add(QemuOpts *opts, long *category, Error **errp);
+DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
                                         bool from_json, Error **errp);
 
 /**
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 457dfd05115e..fe120353fedc 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -632,7 +632,7 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
     return prop->name;
 }
 
-DeviceState *qdev_device_add_from_qdict(const QDict *opts,
+DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
                                         bool from_json, Error **errp)
 {
     ERRP_GUARD();
@@ -655,6 +655,10 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         return NULL;
     }
 
+    if (category && !test_bit(*category, dc->categories)) {
+        return NULL;
+    }
+
     /* find bus */
     path = qdict_get_try_str(opts, "bus");
     if (path != NULL) {
@@ -767,12 +771,12 @@ err_del_dev:
 }
 
 /* Takes ownership of @opts on success */
-DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
+DeviceState *qdev_device_add(QemuOpts *opts, long *category, Error **errp)
 {
     QDict *qdict = qemu_opts_to_qdict(opts, NULL);
     DeviceState *ret;
 
-    ret = qdev_device_add_from_qdict(qdict, false, errp);
+    ret = qdev_device_add_from_qdict(qdict, category, false, errp);
     if (ret) {
         qemu_opts_del(opts);
     }
@@ -897,7 +901,7 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
         qemu_opts_del(opts);
         return;
     }
-    dev = qdev_device_add(opts, errp);
+    dev = qdev_device_add(opts, NULL, errp);
     if (!dev) {
         /*
          * Drain all pending RCU callbacks. This is done because
diff --git a/system/vl.c b/system/vl.c
index 193e7049ccbe..c40364e2f091 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1212,7 +1212,7 @@ static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     DeviceState *dev;
 
-    dev = qdev_device_add(opts, errp);
+    dev = qdev_device_add(opts, NULL, errp);
     if (!dev && *errp) {
         error_report_err(*errp);
         return -1;
@@ -2665,7 +2665,7 @@ static void qemu_create_cli_devices(void)
          * from the start, so call qdev_device_add_from_qdict() directly for
          * now.
          */
-        dev = qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
+        dev = qdev_device_add_from_qdict(opt->opts, NULL, true, &error_fatal);
         object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
-- 
2.34.1

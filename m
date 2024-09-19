Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85809dlb;
        Wed, 18 Sep 2024 22:55:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWZCPGsiUMacFi20hFjZuV8GbYmUFhddCC0LTg0WdN4ov3lRhBCRkTdHt87WelM4m2vFt+03Ji2YYvcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFY9KOUr6S+yDVjAkJf3yJmeqNXzygbC3SZuVk/2/apXDqzk9nxCUe/VH2wDdrmQSUocAC7
X-Received: by 2002:ac8:7d02:0:b0:458:3ac9:11ed with SMTP id d75a77b69052e-45b1609a3dcmr32322271cf.25.1726725359674;
        Wed, 18 Sep 2024 22:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725359; cv=none;
        d=google.com; s=arc-20240605;
        b=U+ap8TAU7ZZTvh72mMWMQsJbGmJvZXBIH/L7NKBafLrfLsrVjKZClUfoPFkTlGi2yL
         8ZBrbX1Ie7UyYrieCAcUiHMBZLARv2narReJitvdgBCFUDcH545vjBkcq8H2UGnd9eX0
         3tafkKO8xNN/Vgn839S4WmAQABjeOY66lshKujhBP/ovychyrImROIqaseumxZE3fCq5
         M7s8qht8sHKqGJjpBf8mPc93khrc/+OKEIwkhE82+LTX7Zkl04vpnt4bdDBS9pzFz1H+
         4nuVGWdWCmZ6ZPYEbWdSJVEX0aof2yomj5TwauB61A0J4CdlDRSuTahozk0zgJtyRAbj
         Tnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kt+TcOPJ5v/UOrom1g1vGGE5QOHJGxNfdnhP6Yzxe/4=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=BX07agFnIo2F+iWV8t1ASz78AAsv1SFCFgeCzg5XoFz2U9gfSMGA3vHcKmYFYq+HvI
         Hekk/QiJ7PlDXxf1+9zurOkMwOdnPjBgTWrkkgat7Algnct4FU8pI70LRWqmhTcLxVNJ
         7Fd57jN70tJ3pCZGfBK0E+K3pu7k3/xvYgmMSqF/sePquoDaw4gtTVMedVxTr4PvCP/4
         Ew/MK/nXFInqunfViq76ekRys4uYAPN36HyKiCOds5u8EndoBGh8PTXQovmgndWVBEkq
         Md+F1ZhqCe8M9YiauDP6tyUYxl+acmKobK7fLqIFNJTf9rn3/lwxfE3tZhR77Brcbnnl
         XugA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=beRd1qGq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1792f416si10980571cf.563.2024.09.18.22.55.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=beRd1qGq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725360; x=1758261360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CwVrpvp1WDScgEYLWjHPu+YgDBg0b3NbDgIP9DAGUe8=;
  b=beRd1qGqvdk9X6315+XZAJjWw5uRzK8JCzzNoGAFMTesyTDLRdFQvqQc
   QlaVsXOHS1fU6WDuRk1ON8aRZe6XZwzWdUIDGo3tphFR1ei7wFJ5ACLW5
   ISipIWb0/DNwfE0O6BDEBXXMliTLcDeRjNcZo9xxZ81yzUHgtmBsbbVks
   i9AyqHtlaXlxnihO7S4aPeuFuxuqytl3A4mBmQn5A4exstncbNmiER0dR
   8hHSI7L51IaZOGfbyMAT/1FUq/uqKdQyFrATT0isB9Sq912As4f6Ww1G0
   ULmFpm6T7j+VSpBH5vhVIUzofpsL6nDinj0elCNpKLmFkx0kl6iJfNYzY
   A==;
X-CSE-ConnectionGUID: LvLprIETTVOuJx8kQPJF6g==
X-CSE-MsgGUID: A5+5Cx2JSAOLfPcBaQxt1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813510"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:55:49 -0700
X-CSE-ConnectionGUID: cnG4W7PSTWykvtbW1B+1LQ==
X-CSE-MsgGUID: X7u2e1dAQ1u80SUmmx+ZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418644"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:55:43 -0700
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
Subject: [RFC v2 03/12] system/vl: Create CPU topology devices from CLI early
Date: Thu, 19 Sep 2024 14:11:19 +0800
Message-Id: <20240919061128.769139-4-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A5Cj6E/insz1

Custom topology will allow user to build CPU topology from CLI totally,
and this replaces machine's default CPU creation process (*_init_cpus()
in MachineClass.init()).

For the machine's initialization, there may be CPU dependencies in the
remaining initialization after the CPU creation.

To address such dependencies, create the CPU topology device (including
CPU devices) from the CLI earlier, so that the latter part of machine
initialization can be separated after qemu_add_cli_devices_early().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 system/vl.c | 55 +++++++++++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index c40364e2f091..8540454aa1c2 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1211,8 +1211,9 @@ static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
 static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     DeviceState *dev;
+    long *category = opaque;
 
-    dev = qdev_device_add(opts, NULL, errp);
+    dev = qdev_device_add(opts, category, errp);
     if (!dev && *errp) {
         error_report_err(*errp);
         return -1;
@@ -2623,6 +2624,36 @@ static void qemu_init_displays(void)
     }
 }
 
+static void qemu_add_devices(long *category)
+{
+    DeviceOption *opt;
+
+    qemu_opts_foreach(qemu_find_opts("device"),
+                      device_init_func, category, &error_fatal);
+    QTAILQ_FOREACH(opt, &device_opts, next) {
+        DeviceState *dev;
+        loc_push_restore(&opt->loc);
+        /*
+         * TODO Eventually we should call qmp_device_add() here to make sure it
+         * behaves the same, but QMP still has to accept incorrectly typed
+         * options until libvirt is fixed and we want to be strict on the CLI
+         * from the start, so call qdev_device_add_from_qdict() directly for
+         * now.
+         */
+        dev = qdev_device_add_from_qdict(opt->opts, category,
+                                         true, &error_fatal);
+        object_unref(OBJECT(dev));
+        loc_pop(&opt->loc);
+    }
+}
+
+static void qemu_add_cli_devices_early(void)
+{
+    long category = DEVICE_CATEGORY_CPU_DEF;
+
+    qemu_add_devices(&category);
+}
+
 static void qemu_init_board(void)
 {
     /* process plugin before CPUs are created, but once -smp has been parsed */
@@ -2631,6 +2662,9 @@ static void qemu_init_board(void)
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine, mem_path, &error_fatal);
 
+    /* Create CPU topology device if any. */
+    qemu_add_cli_devices_early();
+
     drive_check_orphaned();
 
     realtime_init();
@@ -2638,8 +2672,6 @@ static void qemu_init_board(void)
 
 static void qemu_create_cli_devices(void)
 {
-    DeviceOption *opt;
-
     soundhw_init();
 
     qemu_opts_foreach(qemu_find_opts("fw_cfg"),
@@ -2653,22 +2685,7 @@ static void qemu_create_cli_devices(void)
 
     /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
-    qemu_opts_foreach(qemu_find_opts("device"),
-                      device_init_func, NULL, &error_fatal);
-    QTAILQ_FOREACH(opt, &device_opts, next) {
-        DeviceState *dev;
-        loc_push_restore(&opt->loc);
-        /*
-         * TODO Eventually we should call qmp_device_add() here to make sure it
-         * behaves the same, but QMP still has to accept incorrectly typed
-         * options until libvirt is fixed and we want to be strict on the CLI
-         * from the start, so call qdev_device_add_from_qdict() directly for
-         * now.
-         */
-        dev = qdev_device_add_from_qdict(opt->opts, NULL, true, &error_fatal);
-        object_unref(OBJECT(dev));
-        loc_pop(&opt->loc);
-    }
+    qemu_add_devices(NULL);
     rom_reset_order_override();
 }
 
-- 
2.34.1

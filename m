Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp268249ejb;
        Thu, 30 Nov 2023 06:31:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9my0mPukrg7aRWyylAT4+JZ00Fx3Fh7Fp6rPxd41vD2Eq7oa0HlZYxUdD87nkFLXtNci9
X-Received: by 2002:a05:622a:309:b0:41e:1a9a:780 with SMTP id q9-20020a05622a030900b0041e1a9a0780mr27311794qtw.66.1701354695009;
        Thu, 30 Nov 2023 06:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354694; cv=none;
        d=google.com; s=arc-20160816;
        b=YewkqEJN2vl+u8csxXrUrfZ6va510AU0o7hmE0sgxAsepFFr2z+YhzRB7zXH089KSU
         J3uOfK4X2tFRwZ4xbuzL1w8Eo/kgbwJy/5gHol7b5VSGDWheANyEyt6TuoeeVzNhb/K/
         e3VvUY4Gcg675oF6fA6g6heDb6CiqkWMQm8y3AiDB7ozkphDqbjrJPnGSaQ42XVLjDqg
         SK0dtmfuHNUsJQfD56tJcm1Tiy8mJU/nYJPnQYz/7yjq9IUrZwE1JADd3sqTS+e7ABlk
         oF5GwYc+5vjWsVAqJ6jXvoteL+/04ElXCC/iZ7eslVr8OnA+9bSpcoX8L51pd93OBuC7
         CKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y1KluPvB6T6+FK2U/+G/V/aKTIFxa1bokHonKpE74aM=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=rgOET+d5kaZm8d3iNtfY58GWQ4Ugwna1JkaAZoVrbJYRUOLFYwBxKR3UP65fkiup6f
         Il1RngFtKT0CSFcheg8ZzqPVZ0Frgz20aCCpZXyUnId4d5dBXLWzWFwpwvFEw0x5OE2l
         4hsbTiBrE+vznQxMh17FObtKPJ3P+XXtJTHBIkzWfPdDXpvpK7PTEwAzpPGU9D1F5R+v
         P+bA7yn675Hz7mMRmiE5ni31WCx0Ws5dw/hljU0jgpaU9YjRUyEdATUwE9xP9apIodw5
         M2szIFimoPs6g6OQt72CLj5O6bd+4Dgv8a6qCRHOyjc6DwDtB0f/cJ6mPcsjJVYFGrpo
         k0rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="Kt/2N9Y3";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id 19-20020ac85913000000b00423e85ef5fasi1182364qty.497.2023.11.30.06.31.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:31:34 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="Kt/2N9Y3";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354694; x=1732890694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=50lNzU4oWEfgKNc9gIKf0MEOC0NyWyVi0AxeNokOwXU=;
  b=Kt/2N9Y3v/DtmsKN2swIPZRAC9T6INcdp8i6Tk0gM14FtaHo8CQr/Rqk
   D9iv4V5Hg7c0oQ8c2oSfwTEO59KpfRMsyJa6+SyVkdiT8LHN8DG7YpZ4b
   0MvuRs6UFWN33dQ2il/EBmNqmhwG/mWWd5wYNEetLUdIOdqPeSOwK925L
   XVVSnQ5nDPE+Nmk4jEWPbr+m1LbuSzpUGcIQlH4o3XcMiufIAMrNzcqUV
   jYLg4kZBJ7aYY6PTlY625UxgR3K3DT7dBjGtimW0LN9YNP+Bh/7qm9g+g
   EWnTEELIeArwyr+2wtBdRDTIbogVddkq4H94QYISEymDv/3nYUzYei284
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479530954"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479530954"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729615"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942729615"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:30:52 -0800
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
Subject: [RFC 03/41] system: Create base category devices from cli before board initialization
Date: Thu, 30 Nov 2023 22:41:25 +0800
Message-Id: <20231130144203.2307629-4-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: B/I1yiuEvNmE

From: Zhao Liu <zhao1.liu@intel.com>

Topology devices are required to complete CPU topology building before
*_init_cpus() in MachineClass.init().

Add a qemu_create_cli_base_devices() before board initialization to
help create and realize topology devices from cli early.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 system/vl.c | 51 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 0be155b530b4..65add2fb2460 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1197,8 +1197,9 @@ static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
 static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     DeviceState *dev;
+    long *category = opaque;
 
-    dev = qdev_device_add(opts, NULL, errp);
+    dev = qdev_device_add(opts, category, errp);
     if (!dev && *errp) {
         error_report_err(*errp);
         return -1;
@@ -2617,25 +2618,13 @@ static void qemu_init_board(void)
     realtime_init();
 }
 
-static void qemu_create_cli_devices(void)
+static void qemu_create_cli_devices(long *category)
 {
     DeviceOption *opt;
 
-    soundhw_init();
-
-    qemu_opts_foreach(qemu_find_opts("fw_cfg"),
-                      parse_fw_cfg, fw_cfg_find(), &error_fatal);
-
-    /* init USB devices */
-    if (machine_usb(current_machine)) {
-        if (foreach_device_config(DEV_USB, usb_parse) < 0)
-            exit(1);
-    }
-
-    /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
-                      device_init_func, NULL, &error_fatal);
+                      device_init_func, category, &error_fatal);
     QTAILQ_FOREACH(opt, &device_opts, next) {
         DeviceState *dev;
         loc_push_restore(&opt->loc);
@@ -2646,13 +2635,40 @@ static void qemu_create_cli_devices(void)
          * from the start, so call qdev_device_add_from_qdict() directly for
          * now.
          */
-        dev = qdev_device_add_from_qdict(opt->opts, NULL, true, &error_fatal);
+        dev = qdev_device_add_from_qdict(opt->opts, category,
+                                         true, &error_fatal);
         object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
     rom_reset_order_override();
 }
 
+static void qemu_create_cli_base_devices(void)
+{
+    long category = DEVICE_CATEGORY_CPU_DEF;
+
+    qemu_opts_foreach(qemu_find_opts("fw_cfg"),
+                      parse_fw_cfg, fw_cfg_find(), &error_fatal);
+
+    /* init CPU topology devices which don't support hotplug. */
+    qemu_create_cli_devices(&category);
+}
+
+static void qemu_create_cli_periphery_devices(void)
+{
+    soundhw_init();
+
+    /* init USB devices */
+    if (machine_usb(current_machine)) {
+        if (foreach_device_config(DEV_USB, usb_parse) < 0) {
+            exit(1);
+        }
+    }
+
+    /* init generic devices */
+    qemu_create_cli_devices(NULL);
+}
+
 static void qemu_machine_creation_done(void)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
@@ -2701,8 +2717,9 @@ void qmp_x_exit_preconfig(Error **errp)
         return;
     }
 
+    qemu_create_cli_base_devices();
     qemu_init_board();
-    qemu_create_cli_devices();
+    qemu_create_cli_periphery_devices();
     qemu_machine_creation_done();
 
     if (loadvm) {
-- 
2.34.1

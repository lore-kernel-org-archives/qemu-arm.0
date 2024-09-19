Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85817dlb;
        Wed, 18 Sep 2024 22:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlVcXXs8mig1XdWcm7IcJu8m0tW7yzPHNyhw4EMtH44xSv3jtmt+oQ5QXt4pjAAaVMSCEFhNdUIWQbWA==@linaro.org
X-Google-Smtp-Source: AGHT+IG6YCkGvgq/9lIwwoQyBky2+9JwxeEVD+HxTJTurphzgtKVUfGzssk68AqSzHj5Auxuvjaj
X-Received: by 2002:a05:622a:4e8b:b0:458:611b:ac38 with SMTP id d75a77b69052e-458611bb077mr341707621cf.42.1726725361176;
        Wed, 18 Sep 2024 22:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725361; cv=none;
        d=google.com; s=arc-20240605;
        b=Rrq/K0X4lzhZVimGgAGahUchMfVr0NUA2+cqoXuGzuAVVVIHU3PDZbKAsKFFZF4j0W
         9OcHIF0XdNHh99VW5jiBTdXSS/BAqpJu+Jl+EztD3beR8P2FYxvaBxZLfKNKZM5yQkFi
         FvI+dNt05Xi3ELAqlWeIe/8sW6m7SsgDJ9krfQzH+oFF4utzN9QdrXOEZvpXirv+Wuq1
         f5WR6ra5uvTT8pCDJrB9yTqyMCKdKeBIu++xWtOMtAjRqb1stAOBZYlmCSY36ZrJQNcZ
         ekYjFKt2Wf/Fg66ff69bhw4Ix5buVEeHE+Zp39LeDe+bbNbv0gFzaC0V8x1/vrGZ0FNP
         mggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HpfUKWZf41qzfjNaXASQcHIajRGsIJjcjRlq0sgN2M4=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=CK3UTvN7c6Vk/nnt0p7PZHSaSCb23ykI23hgPhgFdmeyUxmVibhaSwf3x/2ewjYwJa
         QnCdweMrYT2tSYL4v3EwXHfOTbYw9R4ru7EAWzavi7OgUxH7A14r9moVs5N0rGjsOjLw
         MJbENo4XTxcFFARz5jPh1VjpRAcRQFU89071U0urqGInPXWvSejq+bFQf8r/low3qJxm
         nJM31nhwpx6OOJL663aIybwCiszroZqzJ0ns7qK+TcYnK2PvnAUUqYCRRBwrm087tbJ5
         Bp2XE7Xoq72w8tfTbKkv9y/eI2ZrHmG8w2zBbzWs14G+IVwuMuG18NU/Odc0FIQiTckG
         nmKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="H/ZNKm2i";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1792f416si10980571cf.563.2024.09.18.22.55.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="H/ZNKm2i";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725361; x=1758261361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5fYW0Qp5HK4dCgA8zTvCnqjoH/YS2wAEp4x5hqFcPU=;
  b=H/ZNKm2iJ9l+DalPP4o/gCnd7MSIhVDeh0nqsfNSm+GaC6bX6FC9XAct
   8SLAH0BIFwNi/4BjgHcxhuCzF0IaN32yA+RIAyyIu9UnU7m53s4gmw7NI
   Luo6vViOCrNKa7l6zmhnIBK8b7mUwi00LL4AP7JT7L6A1Rq++QVMPKtKW
   wF69FAJI+U6zqqhEAniRcWIpYQcJPYEpSeaXUrrvqmHxbb0eoCdZTX54e
   iK/6MBBxAViD0UT2QWGk1608oYO/0ksf2IIzAJJ84EmFlk9ls4iTv0Hcw
   4lpOUbG+GVSZDrx8HwxehXv1pSLsKjYm8ebbLYES4EZCGJMC/4gT9Qsvp
   g==;
X-CSE-ConnectionGUID: LtLD8YlVS0GlzaSSeg1Sbw==
X-CSE-MsgGUID: oXM7YUixROmx9unpWj/cKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813536"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:55:55 -0700
X-CSE-ConnectionGUID: izHbtgFiQeKuhayuq/BgHg==
X-CSE-MsgGUID: 8GpqZCUxQfG5uQ4iHEKGyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418665"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:55:49 -0700
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
Subject: [RFC v2 04/12] hw/core/machine: Split machine initialization around qemu_add_cli_devices_early()
Date: Thu, 19 Sep 2024 14:11:20 +0800
Message-Id: <20240919061128.769139-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eY2OQqq7CudJ

Split machine initialization and machine_run_board_init() into two parts
around qemu_add_cli_devices_early(), allowing initialization to continue
after the CPU creation from the CLI.

This enables machine to place the initialization steps with CPU
dependencies in post_init().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine.c   | 10 ++++++++++
 include/hw/boards.h |  2 ++
 system/vl.c         |  4 +++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 076bd365197b..7b4ac5ac52b2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1645,6 +1645,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
     accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
+}
+
+void machine_run_board_post_init(MachineState *machine, Error **errp)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(machine);
+
+    if (machine_class->post_init) {
+        machine_class->post_init(machine);
+    }
+
     phase_advance(PHASE_MACHINE_INITIALIZED);
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a49677466ef6..9f706223e848 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -33,6 +33,7 @@ const char *machine_class_default_cpu_type(MachineClass *mc);
 
 void machine_add_audiodev_property(MachineClass *mc);
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp);
+void machine_run_board_post_init(MachineState *machine, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
@@ -271,6 +272,7 @@ struct MachineClass {
     const char *deprecation_reason;
 
     void (*init)(MachineState *state);
+    void (*post_init)(MachineState *state);
     void (*reset)(MachineState *state, ShutdownCause reason);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
diff --git a/system/vl.c b/system/vl.c
index 8540454aa1c2..00370f7a52aa 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2659,12 +2659,14 @@ static void qemu_init_board(void)
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
-    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine, mem_path, &error_fatal);
 
     /* Create CPU topology device if any. */
     qemu_add_cli_devices_early();
 
+    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
+    machine_run_board_post_init(current_machine, &error_fatal);
+
     drive_check_orphaned();
 
     realtime_init();
-- 
2.34.1

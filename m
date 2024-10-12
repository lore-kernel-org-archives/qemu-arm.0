Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp874690njb;
        Sat, 12 Oct 2024 03:29:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd9VQMP7Ry/3gKrphwh2ilquHtEpuFGFLKshBD6/BJf/pczxfIvr2Sl6L41y3LhhNAmITlBMn/xd8N8g==@linaro.org
X-Google-Smtp-Source: AGHT+IGOFaXQMxgYcSc5HtQp9C1yKkImT3wpJ4OOhVrLF/KiMs75i8y2PC3GegI5ynt63mlbmTKV
X-Received: by 2002:a05:6214:33c7:b0:6cb:aa7b:b8cc with SMTP id 6a1803df08f44-6cbf0044cacmr68880996d6.16.1728728952534;
        Sat, 12 Oct 2024 03:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728728952; cv=none;
        d=google.com; s=arc-20240605;
        b=Gs6W2RgXm1khVZX1mL+UhA8mbOqHbgXuvSuI00KgYiul2xhepl9KV5629XrMMwfuks
         vgZVxlnv6xAuThMGsAvfDNCiIlHSDIDPSiHBWg6X/oKFW14x0sjgSKRMe2KHHkB7ZT9V
         1poJCkpIZTbppJWXVWdwK0ucfrU/OZftR3m0S3bSq7ywzWQzlKuQjaMmtErDv2qfkl01
         A6qv1rYt14q8buvZbxngiawuN1PaDvkipqJUYY57LnhUMoVRFB2XFg+ZLP5CwhHk/mcy
         KPAK5avEBSQXqveQwuXPaSmOfSOQGNQIItvVzPzUDN2b1W0JIQuz/fW1BCEloK13FAxO
         rsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OgTLLdmyJQAdjUDZ8Uv7ctD552RPylhDjNHpJplbFeU=;
        fh=8h7shi0yfCpjWQfPt6G8q/Uhe70OsXawCuVYUheqDjs=;
        b=lzhlugBDuKpwLKLb0bUlyFMYOWlUOS1APyfUaThsNIzbk4wm0JPjkuvaJNC7lCY/6j
         8BtMc1AuMEfHgGbJnfFkuoPyqkCzshjohQwFcgVLx2dxXWot+bq5h7lPcjv+oK7m5ws+
         07/9exKRDxJaKRMRa8NeVZ14HEERIQs7c5rlmjhbi0pSkoQy9g83C8K8QfcD5cyOcY/u
         FNrB1Gfn1DFe/oQUBGDON9wpJNpUXG2ujisxErO15qVxsjoUHJ41FoGkE4gYT6GmB8uY
         UIT5bdQuj9PHccBJzICSI5PUIGWyDVdapOT12686giClext9tTIIHdjfOzPRXdVuqCP5
         rR1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Hg1adh+D;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.8])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e0783si58893326d6.189.2024.10.12.03.29.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) client-ip=192.198.163.8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Hg1adh+D;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728952; x=1760264952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i+35KcqWfRxigU2EIhaJxKdHSfXUSTicv5fw/oXO2lw=;
  b=Hg1adh+D2ZnAE62s5ucZGEZyNf3b1vMPZHKV7xpdzASKdpj9P4lxTJjN
   Y0q0ZzgxFMqMXQDA/fm7n7ZmingAL80eeSKRoOtdohZe3OLVSW/WAeGYL
   9mBvSps2z7rZ9FxXeS1v8zh5ejfwYM3uiEk34bXmEdx9ibyuloK+HrUHD
   8FFOkvc9Az01PJDcbqC3MVJetdMzSthP2W6OzFoNKOpXu1rdVcEOuGftM
   YLks3K9L/uD0DtQo+eZ4uBC5W+Bq0xBxXTR3sir0OsVOUUTOPiqILA3Xj
   ddyRb+vPg7+klDTyYbOjGJKHIC3qmsR5h51l0igE6GugwsKRSjPvRMVYz
   A==;
X-CSE-ConnectionGUID: ds1h0wYxR32K/Ph70KMjsg==
X-CSE-MsgGUID: xCmY77EVSx+w1nhRXE3mRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45634961"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45634961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:29:11 -0700
X-CSE-ConnectionGUID: iSUSYFKcSyyEaLI1013xMA==
X-CSE-MsgGUID: WLmQSF1tQ+WlPwsdfAOydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77050877"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 03:29:05 -0700
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
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 7/7] i386/cpu: add has_caches flag to check smp_cache configuration
Date: Sat, 12 Oct 2024 18:44:29 +0800
Message-Id: <20241012104429.1048908-8-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: N1jAPXfM8tM4

From: Alireza Sanaee <alireza.sanaee@huawei.com>

Add has_caches flag to SMPCompatProps, which helps in avoiding
extra checks for every single layer of caches in x86 (and ARM in
future).

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Note: Picked from Alireza's series with the changes:
 * Moved the flag to SMPCompatProps with a new name "has_caches".
   This way, it remains consistent with the function and style of
   "has_clusters" in SMPCompatProps.
 * Dropped my previous TODO with the new flag.
---
Changes since Patch v2:
 * Picked a new patch frome Alireza's ARM smp-cache series.
---
 hw/core/machine-smp.c | 2 ++
 include/hw/boards.h   | 3 +++
 target/i386/cpu.c     | 9 ++++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index f3edbded2e7b..16e456678cb6 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -367,6 +367,8 @@ bool machine_parse_smp_cache(MachineState *ms,
         return false;
     }
 
+    mc->smp_props.has_caches = true;
+
     return true;
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index e4a1035e3fa1..af62b09c89d1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -153,6 +153,8 @@ typedef struct {
  * @modules_supported - whether modules are supported by the machine
  * @cache_supported - whether cache (l1d, l1i, l2 and l3) configuration are
  *                    supported by the machine
+ * @has_caches - whether cache properties are explicitly specified in the
+ *               user provided smp-cache configuration
  */
 typedef struct {
     bool prefer_sockets;
@@ -163,6 +165,7 @@ typedef struct {
     bool drawers_supported;
     bool modules_supported;
     bool cache_supported[CACHE_LEVEL_AND_TYPE__MAX];
+    bool has_caches;
 } SMPCompatProps;
 
 /**
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c8a04faf3764..6f711e98b527 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7853,12 +7853,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
 
-    /*
-     * TODO: Add a SMPCompatProps.has_caches flag to avoid useless Updates
-     * if user didn't set smp_cache.
-     */
-    x86_cpu_update_smp_cache_topo(ms, cpu);
+    if (mc->smp_props.has_caches) {
+        x86_cpu_update_smp_cache_topo(ms, cpu);
+    }
 
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
 
-- 
2.34.1

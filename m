Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp277013njc;
        Fri, 1 Nov 2024 01:16:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuHt1XAmJVJwky3ZIieHu7wx8wBYC2ytNnw27QHVdth47/lCdh9XAuC7bzLhKS8wyVxiHX6nTW85CaQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHOraC338yRZz+PORp9mEYLXCcyOEiN4RrPF23BsKvmMjfTz2WrmyhRTL4Aj3Y6g2rXkFRQ
X-Received: by 2002:a05:6214:5410:b0:6d3:5b7c:6cc6 with SMTP id 6a1803df08f44-6d35b7c6dcamr38489346d6.32.1730449010554;
        Fri, 01 Nov 2024 01:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730449010; cv=none;
        d=google.com; s=arc-20240605;
        b=OPx1w5/VYxVJetRInGexkEbor6vjyQoIg83mhDi4RKY+KkKUbVRtMQKqdBD/2C+R8h
         MBPBQ9XPk/Sikr70vA6F6Et8B3b0UfnLfQDCp5kqAgA44tjE7mq/WJmCfRg1yBWHDPf7
         1gqRMhZnj8kCvZM6asPQSN/H4OPs68Au9QzK4AQ05kitm+ux8Jgt6PEjXkNt7RkMcxBV
         b7x1OxS0NmgKq5X55YmbIUHM9M1V2kX78tOTbcAiLkHzujT8IemG5VDkL2KhwTDjj6zI
         BR7oveSYVnpZSFnZlUwQe86UCE2vphNeVTbha+JGGcY6k56/u5WLcLREweinPVSSQe1l
         v3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=dlnSKUGbAVnScE0hipLS5rVF9YVnuqQjBOa3jo8SatU=;
        fh=/Q7DFfK0c6lcL5pNzN/8+EzqG4IF+hoXAsi0Ur0bC2k=;
        b=TZwWSS3FK+ukLW/XJ/JyvemetWJBKNT5UrxrJIIUbaI6RitpRAb5S6yGPDjR12NJU4
         D/3SC0Hw8+DoIltx3VMQIgVvftPm2A88xkwjYHyN6smNgpAi2zwdY3oBM5/alk3jxJkU
         vVnqsNEZ33lUM/5j4x1eaWEghsemiLBr6YFtRalsd1qkkeZOAbMC8MvbMZSUfKy9A5w8
         C0XUYxB2OnJyF0qSTKfZGkP4iVOp0vKYgQI64cEAZkMAu8jUfWORWOqiRcSykgwYziWx
         oL4rmT0AlWqucSl9ZKW1h37H0MhEHlpFLT31fo0bZd4QtR+2Fgduu7RTqgBRnw+TEQgY
         RbnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dix4thVq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fe4csi37605786d6.382.2024.11.01.01.16.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dix4thVq;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730449011; x=1761985011;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=se3A3A+kRvSwSAobc6tYFr7xeZZ8F/aVOqRAc4gXB10=;
  b=dix4thVqRrVYri1xtZP+MXeN68hc8uF2VMURvbjqsvPzGsnPfC/fVA78
   f4qEZEt3gx4vC0gvdrDs3H3Wn+X1s4JK7dPyBf+wTQkTTPMQk6Y1vu7vg
   WCFvGdQHLsATuQPu2+Yk3XitvcLp+3igugbCXKqwrS4F6PqvBao13DTLG
   HlPuAydvUtKN/VQW6oe7mM8QS/yMIXNgi+j3yhOuXRU3iWpZZNYvBBaI7
   nULvI8vZhSUEpoSf3smMr8gDtTps9/aBTvKjQ2zizAmXKLaBE2h4sjGEo
   xRfgE/dNbx2Tz2hPI3j46ZCkPg+28ZtJy7/7h2uGmJY0D4h0BnpS87lsX
   A==;
X-CSE-ConnectionGUID: RUMDcvKITXGfdGYF1Csp/Q==
X-CSE-MsgGUID: D5U23fQdTWKymCHwF9PpZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17846099"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17846099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:16:50 -0700
X-CSE-ConnectionGUID: MfnoaelzSjKKq1CkEaOG1g==
X-CSE-MsgGUID: DHNWzy+0SfuGlV9pH5NKow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834736"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:16:44 -0700
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
	Alireza Sanaee <alireza.sanaee@huawei.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v5 9/9] i386/cpu: add has_caches flag to check smp_cache configuration
Date: Fri,  1 Nov 2024 16:33:31 +0800
Message-Id: <20241101083331.340178-10-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101083331.340178-1-zhao1.liu@intel.com>
References: <20241101083331.340178-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dcPEGw+foCQU

From: Alireza Sanaee <alireza.sanaee@huawei.com>

Add has_caches flag to SMPCompatProps, which helps in avoiding
extra checks for every single layer of caches in x86 (and ARM in
future).

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
 hw/core/machine-smp.c |  2 ++
 include/hw/boards.h   |  3 +++
 target/i386/cpu.c     | 11 +++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 640b2114b429..6ae7c4765402 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -324,6 +324,8 @@ bool machine_parse_smp_cache(MachineState *ms,
             return false;
         }
     }
+
+    mc->smp_props.has_caches = true;
     return true;
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index e07fcf0983e1..2d650bbf13c4 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -156,6 +156,8 @@ typedef struct {
  * @modules_supported - whether modules are supported by the machine
  * @cache_supported - whether cache (l1d, l1i, l2 and l3) configuration are
  *                    supported by the machine
+ * @has_caches - whether cache properties are explicitly specified in the
+ *               user provided smp-cache configuration
  */
 typedef struct {
     bool prefer_sockets;
@@ -166,6 +168,7 @@ typedef struct {
     bool drawers_supported;
     bool modules_supported;
     bool cache_supported[CACHE_LEVEL_AND_TYPE__MAX];
+    bool has_caches;
 } SMPCompatProps;
 
 /**
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1cf4cda1e647..49f19f896197 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8035,13 +8035,12 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
 
-    /*
-     * TODO: Add a SMPCompatProps.has_caches flag to avoid useless updates
-     * if user didn't set smp_cache.
-     */
-    if (!x86_cpu_update_smp_cache_topo(ms, cpu, errp)) {
-        return;
+    if (mc->smp_props.has_caches) {
+        if (!x86_cpu_update_smp_cache_topo(ms, cpu, errp)) {
+            return;
+        }
     }
 
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
-- 
2.34.1

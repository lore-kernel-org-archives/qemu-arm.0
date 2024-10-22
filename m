Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083732njb;
        Tue, 22 Oct 2024 06:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFhmJr7+RYMNjnXnyGpvgBOZ4wzZVA2JGa4+BMXan0sKgzHpENE6cYDRRVOUN4BjnqXMZy7wdusQLDlg==@linaro.org
X-Google-Smtp-Source: AGHT+IE0fW5G0f9wol3hx0eGycYEiHXmrxeUzfekeV/WDWxtq1rjatpRxoRvnbgCztjNyl/KgC9m
X-Received: by 2002:a05:620a:271e:b0:7b1:53ed:ae4b with SMTP id af79cd13be357-7b175238724mr473155785a.61.1729604220037;
        Tue, 22 Oct 2024 06:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604220; cv=none;
        d=google.com; s=arc-20240605;
        b=b8pVZUexGoOK12ldNGokJfObSLCYjLF4oG4vWe+CKcrrsn8vb1cHxpiBcgDv09H4yp
         sqp+X66uiSxJycm0e8+uCNILyJvOOiS85hJ5KC7Va2FqTONA/yk7trWyK2W8dHdKRBvR
         sJIMsiRtnfzz89KAPoysrks0VprMhdA/IJx3b87b2dlQVP6cDKYaTJtg58mKF+5nzdHE
         tUyUFYiyKv9jvgK158tsYHSYd4RgaGprWr4wZDw4ZgBQBKH9bUjjxArCu/l+zv8JvP/A
         uht8u8OuffvWRujh5WixaV9Pzz6xz7zdpANRT3q7NkcgaOWn6PAeBE7XT2fQq6hPVxA4
         VKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GulXwNsHDmzHZq1pAiZguiLowTRNCV0SzUhUZW8QJpw=;
        fh=8h7shi0yfCpjWQfPt6G8q/Uhe70OsXawCuVYUheqDjs=;
        b=RO+Y8yBiFnMx1jCMx70pAroAWx8zJvZHRGx7kM8vnEdVdgo0CxRDPGYG7rISY66WZp
         58ODVe2dx2bF0y1yQyntrY5XB8wDsksQ9Q3zjAoGZiaNbhpy0xEtJq2OeXoD6sxPDo3z
         Deb96uZxbZZbFL3UQ2v/z2WqPa0giIjUQSM26CJeAREIrJ7JxY+rnjtdSB9mObSZYHan
         cpjs4i7Piq/YV+0fI2qwNJehnmnKC/TDZSTNZg9FN1R7tCvGjLuPyV3Z3fph9WNbaH1T
         ft8UoSjCfttG6FvGrQwwYKqYv4KetU0i5OB9D/tk6G82CxIqJyXoyqfj89xfAWHT4rPA
         oXDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BSocPHnA;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6bc57si711900885a.346.2024.10.22.06.36.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BSocPHnA;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604220; x=1761140220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TEjT9vfLlCt/Mc8nTWxqbY6vNGP1X8MOONe4ssw/sls=;
  b=BSocPHnAoGa9ZgTk5J2XWGXwM7+MLute2Y/NzeRY6IR06RaujuUHRKFM
   Hh0XQW3GeM/yRUDrknd7ZL1dYAnTYBJ/+v/hMss0M9vfAHysktI3Cygh6
   sY0IJlJ6wYzjlLbYuGuwdQtTX6IwWkDa25E5/8WUJ3kXXCeSJBE74SJ4V
   cdHwZ19pTYpefDUY5hYC6l7/c75u5zzntUh3UGzD/rf45looCKWbv4hP3
   ClwvOrKPlsFblMvF7IBPR3/qhQ4yMtkkGeAkFgQMvd2R+wU4dTV886pZl
   pAZKD7dkEXRCplT5OhZYkxO3XbdyW4dM6j8sxy7kn8tdzXKnpqStr/rfW
   A==;
X-CSE-ConnectionGUID: L1vQWBkTTDa3raCDNGh90g==
X-CSE-MsgGUID: nwtDZ19cSrOfwBTHH/VZUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603791"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603791"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:58 -0700
X-CSE-ConnectionGUID: 0mi/KwG8SrmbGUlx6dY4Bw==
X-CSE-MsgGUID: QFOw/PCjSN68kmzEB8qccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782484"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:36:53 -0700
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
Subject: [PATCH v4 9/9] i386/cpu: add has_caches flag to check smp_cache configuration
Date: Tue, 22 Oct 2024 21:51:51 +0800
Message-Id: <20241022135151.2052198-10-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022135151.2052198-1-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xJZfdZzn8jod

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
index 192f78539a6e..e6680701eec3 100644
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
index b6e12b46c9cc..9a81402e71c4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7884,13 +7884,12 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
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

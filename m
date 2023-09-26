Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp995791ejc;
        Tue, 26 Sep 2023 03:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6PrDjNKB5uOtTVrxz0jK3wD9PjoSaAAQgDzDtFEQSt3uficrkGDmRd3UYJTbNDlz6OfSF
X-Received: by 2002:a5d:58ee:0:b0:320:a19:7f87 with SMTP id f14-20020a5d58ee000000b003200a197f87mr9413077wrd.18.1695724747874;
        Tue, 26 Sep 2023 03:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695724747; cv=none;
        d=google.com; s=arc-20160816;
        b=suto3VZd9d24zXxLn8ggi0Bp61HHLdbPWl+8GkRYbC4NAl/VwLkt7c8eZrL+fz9qA4
         IcLmxlj4mBkQqcIOjTCgbau3FuhTk0tmi9ivC1h12w9iJa3Q4J8YCo/9aP5dI3ejrZe0
         YF/uNj6kAH0skncj9iCOfOz+21QfcWiHV9K4bBzPVvjjXEV+0kYjRd9CPu/Nbf6qNiob
         r2W1CD2k5BImEZ7uIK7GG/LXsu1qcz505O/UjiEFH6JMebR5JIslKIj6QLdRzxIm5cuH
         X/I/n7FlJdsnRqZDCYaKiQ2WQies7aWUCTz4FeIAd6PGUB8hgswrNQYrHy0hxuoRFUuz
         8vuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Tv+7FXnla0ywiiamjl7v38APyAgIMEGosvKh6700xwQ=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=Kiu+UnZ7Q7tiLCBqNON5BcR2/srnlgwcDz1O6Xrr7pLXTmYHe96cqZgUUPYWZpdQOd
         7NjnWkUAuJAe200NESlSZP6bpmzLYA3c5CSyOteFn+b5tzbZiFlf1WUfUQmqJJ7uj8X5
         p4Yg22jodN6wbyRgjfOT2onV3rUbWjHBEVtxIF5abitDM6j5FJwuA6I6ZTzzHYUCrDeO
         VTTFKOe7c56afKEXnM1VU6PgOYVEsvwR4gQc1axmc86AJojOnDNuHt9UFQCjhhVJF0AC
         URRI/wvfcdvbQXmjWYJoXN0Y0MiskS6MRmjz9SuvANAOxBMIVx5GBn5o2R/TlSyUHsF6
         L+1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g4-20020a5d5544000000b0031ffcadf84dsi5812452wrw.356.2023.09.26.03.39.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rvx1W66cbz6J7yR;
	Tue, 26 Sep 2023 18:34:07 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:38:48 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 37/37] hw/arm/virt: Expose cold-booted CPUs as MADT GICC Enabled
Date: Tue, 26 Sep 2023 11:36:54 +0100
Message-ID: <20230926103654.34424-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926103654.34424-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926103654.34424-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: uCj3PtxDBQuK

Hotpluggable CPUs MUST be exposed as 'online-capable' as per the new change. But
cold booted CPUs if made 'online-capable' during boot time might not get
detected in the legacy OS. Hence, can cause compatibility problems.

Original Change Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3706

Specification change might take time and hence disabling the support of
unplugging any cold booted CPUs to preserve the compatibility with legacy OS.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 19 ++++++++++++++-----
 hw/arm/virt.c            | 16 ++++++++++++++++
 include/hw/core/cpu.h    |  2 ++
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 377450dd16..879c83a337 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -710,17 +710,26 @@ static uint32_t virt_acpi_get_gicc_flags(CPUState *cpu)
     }
 
     /*
-     * ARM GIC CPU Interface can be 'online-capable' or 'enabled' at boot
-     * We MUST set 'online-capable' Bit for all hotpluggable CPUs except the
-     * first/boot CPU. Cold-booted CPUs without 'Id' can also be unplugged.
-     * Though as-of-now this is only used as a debugging feature.
+     * ARM GIC CPU Interface can be 'online-capable' or 'enabled' at boot. We
+     * MUST set 'online-capable' bit for all hotpluggable CPUs.
+     * Change Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3706
      *
      *   UEFI ACPI Specification 6.5
      *   Section: 5.2.12.14. GIC CPU Interface (GICC) Structure
      *   Table:   5.37 GICC CPU Interface Flags
      *   Link: https://uefi.org/specs/ACPI/6.5
+     *
+     * Cold-booted CPUs, except for the first/boot CPU, SHOULD be allowed to be
+     * hot(un)plug as well but for this to happen these MUST have
+     * 'online-capable' bit set. Later creates compatibility problem with legacy
+     * OS as it might ignore online-capable' bits during boot time and hence
+     * some CPUs might not get detected. To fix this MADT GIC CPU interface flag
+     * should be allowed to have both bits set i.e. 'online-capable' and
+     * 'Enabled' bits together. This change will require UEFI ACPI standard
+     * change. Till this happens exposing all cold-booted CPUs as 'enabled' only
+     *
      */
-    return cpu && !cpu->cpu_index ? 1 : (1 << 3);
+    return cpu && cpu->cold_booted ? 1 : (1 << 3);
 }
 
 static void
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e46f529801..3bfe9b9db3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3151,6 +3151,10 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      * This shall be used during the init of ACPI Hotplug state and hot-unplug
      */
      cs->acpi_persistent = true;
+
+    if (!dev->hotplugged) {
+        cs->cold_booted = true;
+    }
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -3214,6 +3218,18 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
         return;
     }
 
+    /*
+     * UEFI ACPI standard change is required to make both 'enabled' and the
+     * 'online-capable' bit co-exist instead of being mutually exclusive.
+     * check virt_acpi_get_gicc_flags() for more details.
+     *
+     * Disable the unplugging of cold-booted vCPUs as a temporary mitigation.
+     */
+    if (cs->cold_booted) {
+        error_setg(errp, "Hot-unplug of cold-booted CPU not supported!");
+        return;
+    }
+
     if (cs->cpu_index == first_cpu->cpu_index) {
         error_setg(errp, "Boot CPU(id%d=%d:%d:%d:%d) hot-unplug not supported",
                    first_cpu->cpu_index, cpu->socket_id, cpu->cluster_id,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ffd815a0d8..f6b92a3285 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -441,6 +441,8 @@ struct CPUState {
     uint32_t can_do_io;
     int32_t exception_index;
 
+    bool cold_booted;
+
     AccelCPUState *accel;
     /* shared by kvm, hax and hvf */
     bool vcpu_dirty;
-- 
2.34.1

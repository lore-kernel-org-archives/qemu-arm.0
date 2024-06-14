Received: by 2002:a05:7022:c43:b0:7e:eb73:5b3b with SMTP id ej3csp1477367dlb;
        Thu, 13 Jun 2024 17:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUb7HA0sij2eo6jbXji6tB+cqtUIpTPjeo/WQqNqUuHm/X6IacpGXYPDGKYl6H1efG98oRjQSQY5BboXWU/3SNbDxm82y8
X-Google-Smtp-Source: AGHT+IF5Z3cb472pTkbUO/DVs8wMexyyVpwuj/pRhRQx06kkq1nl+GDntTJPtll9YPRQatQtLcbg
X-Received: by 2002:a05:600c:4e92:b0:422:e7e8:588a with SMTP id 5b1f17b1804b1-42304827316mr14008175e9.16.1718324496163;
        Thu, 13 Jun 2024 17:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718324496; cv=none;
        d=google.com; s=arc-20160816;
        b=YW+yibuziJS8NboHDHu2FWjjrKRu83Rpwm5ccLZ1UkGFVD3LMfRiRJnF71TRjLdigg
         xlqYyreN3yVDHNUxVzKb6/xnwUjKXmBrqwByM8o3TAz7xZRjicoyNSVJyqG07AZhQ/Dy
         Bl6Nt7jJpIpb892f/hq0UshnTKDeXpaqPunVUopb80n01eGqBVRLufsmWMWHykfeX78f
         8L27E/zBE369oLkpOX4m86FZ4/bTsaIZZCjLq3mYYHzf8ZV8ceyxbIEZp6TmxegizZRE
         iRNK5Nga6nJGCi6aztMYaHSSmT4EvhJXPVN+5/rBNgSE4GXYiuODA9kPljNRghaqbIlb
         M4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=g59Gho2DCi+2udBEJ1G+A3MddRGoG4bdeNWMZP+Foqc=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=EIELsO1MjtkYBfqOScxrfxio5zO57t281KZ5hY2Z28QeGrU5M7fqwOcnELP/k0ZMS8
         2M4L+OM9IbFZ7nJbC/+6eM1TxWA4gZ4XdI6t/9KvspDciR0cin6sewyQ7fmQDrmjat+I
         mRFxgFs1nPZOHxsWFEHiGBY0szKxpEiVPQ2pZGUwsPBD2DMWLWqbcXs22ONdOXh4SDJv
         U8Yng1jg3UsfTedlCyd7jg9H59li36ad5REHsCBCGkad1nbEJM952kDpXCHPDOCl7swj
         YOGUjuH9q0V9JBrD4IKuLyWRwuLLaDgEvIX+Igz6eZ8KlAd9WibvyzvLHcnDEZeH7urV
         Qbyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-422874e928csi29563995e9.167.2024.06.13.17.21.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 17:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0g0C36Qwz6H7Jk;
	Fri, 14 Jun 2024 08:20:11 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id E4C20140CF4;
	Fri, 14 Jun 2024 08:21:34 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 01:21:12 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 29/29] hw/arm/virt: Expose cold-booted CPUs as MADT GICC Enabled
Date: Fri, 14 Jun 2024 01:20:58 +0100
Message-ID: <20240614002058.203058-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: n9lKmUAf35Gl

Hotpluggable CPUs MUST be exposed as 'online-capable' according to the new
change. However, cold-booted CPUs, if marked as 'online-capable' during boot
time, might not be detected by legacy operating systems. This could cause
compatibility problems.

Original Change Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3706

Since updating the specification might take time, it is necessary to disable the
support for unplugging any cold-booted CPUs to preserve compatibility with
legacy operating systems.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 29 ++++++++++++++++++++---------
 hw/arm/virt.c            | 16 ++++++++++++++++
 include/hw/core/cpu.h    |  2 ++
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cb613103f..322ed8e35b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -667,17 +667,28 @@ static uint32_t virt_acpi_get_gicc_flags(CPUState *cpu)
     }
 
     /*
-     * ARM GIC CPU Interface can be 'online-capable' or 'enabled' at boot
-     * We MUST set 'online-capable' bit for all hotpluggable CPUs except the
-     * first/boot CPU. Cold-booted CPUs without 'Id' can also be unplugged.
-     * Though as-of-now this is only used as a debugging feature.
+     * The ARM GIC CPU Interface can be either 'online-capable' or 'enabled' at
+     * boot. We MUST set the 'online-capable' bit for all hotpluggable CPUs.
      *
-     *   UEFI ACPI Specification 6.5
-     *   Section: 5.2.12.14. GIC CPU Interface (GICC) Structure
-     *   Table:   5.37 GICC CPU Interface Flags
-     *   Link: https://uefi.org/specs/ACPI/6.5
+     * Change Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3706
+     *
+     * Refer to the UEFI ACPI Specification 6.5:
+     * Section: 5.2.12.14. GIC CPU Interface (GICC) Structure
+     * Table: 5.37 GICC CPU Interface Flags
+     * Link: https://uefi.org/specs/ACPI/6.5
+     *
+     * Cold-booted CPUs, except for the first/boot CPU, SHOULD be allowed to be
+     * hot(un)plugged as well. However, for this to happen, these CPUs MUST have
+     * the 'online-capable' bit set. This creates a compatibility problem with
+     * legacy OS, as it might ignore 'online-capable' bits during boot time, and
+     * hence some CPUs might not get detected.
+     *
+     * To fix this, the MADT GIC CPU interface flag should allow both
+     * 'online-capable' and 'enabled' bits to be set together. This change will
+     * require an update to the UEFI ACPI standard. Until this update occurs,
+     * all cold-booted CPUs should be exposed as 'enabled' only.
      */
-    return cpu && !cpu->cpu_index ? 1 : (1 << 3);
+    return cpu && cpu->cold_booted ? 1 : (1 << 3);
 }
 
 static void
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a2200099a1..770b599acf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3163,6 +3163,10 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      * This shall be used during the init of ACPI Hotplug state and hot-unplug
      */
      cs->acpi_persistent = true;
+
+    if (!dev->hotplugged) {
+        cs->cold_booted = true;
+    }
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -3223,6 +3227,18 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
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
index e13e542177..99b699b47f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -556,6 +556,8 @@ struct CPUState {
     uint32_t halted;
     int32_t exception_index;
 
+    bool cold_booted;
+
     AccelCPUState *accel;
 
     /* Used to keep track of an outstanding cpu throttle thread for migration
-- 
2.34.1

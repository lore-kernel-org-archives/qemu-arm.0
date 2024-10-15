Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2345102njb;
        Tue, 15 Oct 2024 03:18:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNlb3PhswE6A2Ra9arSzl9GtcphsFFyHrw+8pAOUfdmgC4XYgW0rxhuCgyaSYmspB0tmDT7XMWq9fW2A==@linaro.org
X-Google-Smtp-Source: AGHT+IGGzrhLkdXm1M/QkNynkHhrpEtIIdy4jdrUnP3JRtlbPKio1o/cdj3nCm5iU9rfAogoGBdA
X-Received: by 2002:a05:6512:3402:b0:535:68ab:7fdd with SMTP id 2adb3069b0e04-539e54f023amr4830096e87.19.1728987517974;
        Tue, 15 Oct 2024 03:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728987517; cv=none;
        d=google.com; s=arc-20240605;
        b=cUyTN1jcA9MqgX7oKxkxjB/SFLJqiGvbYdi/XtNUvRmFa8DFHSUbTvGdvFiW/9zdd2
         vyPHRJKR44kALg0hJeIF80mvbyysu03worhORpXIo3Jo/6XElhqrug+IL5ET4tkK+RFl
         06im9AZAMwLIIEGYbP7kaG4VvnOHHfXAszG28mqMO6QAC/2WgIMMK7qJqbZ5wxPk+wDU
         kFGA32USZ+J7RF4tlbVlTL9TRUE+2rpATn2AZBm4rdfwWMkNKmf9rNMqqkRqkz36wrN6
         FZO8NdcZNJuBsGdnlgMS7CNfyMS7DVNEP5vlcW6kujYo9zph+gkoK/8ZUx29FpNuok0V
         Z/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=EUplQQggQ5IxMmc5a0Tv3ZxPsR4daBO9cjnU+fSQFPk=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=loWjVBnwk9j6PthyuBcezimqJMrKmGnbvveIbUsiki4ojzk3DUNsy881r9N3G80yxQ
         W/2xVgWUER1j+f8RKeTbxm2eKrOF6RR4yBH0j4GR55PxQRrBzMBMj2uS9moZAPlbd4Ki
         ztRj5sbssjXsoadOCRNf04h7MOFCBTYgXZbkZt5CL/N4/3s1hXqBX8yGHQVW4zeFynbE
         Ok0zIvTNvgVgTOs4mOqevrsVS4Rdbn6bYdRU0bnh77msYmGNq6Z1YXSJI8o4YmkmTujA
         vQ0SwBDRx1zPr277MSqLqpYplmuWNudT1sJgIrIvK+QSE6mn40wi8qK6hygzKW9Fx5XK
         snEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4313f55eceesi5791665e9.39.2024.10.15.03.18.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:18:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSVQ356K0z6FGyW;
	Tue, 15 Oct 2024 18:16:59 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id E8EA91404F5;
	Tue, 15 Oct 2024 18:18:36 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:18:17 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 30/30] hw/arm/virt: Expose cold-booted vCPUs as MADT GICC *Enabled*
Date: Tue, 15 Oct 2024 11:18:00 +0100
Message-ID: <20241015101800.254351-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: jVXeCECIZXV7

Hotpluggable vCPUs must be exposed as "online-capable" according to the new UEFI
specification [1][2]. However, marking cold-booted vCPUs as "online-capable"
during boot may cause them to go undetected by legacy operating systems,
potentially leading to compatibility issues. Hence, both 'online-capable' bit
and 'Enabled' bit in GIC CPU Interface flags should not be mutually exclusive as
they are now.

Since implementing this specification change may take time, it is necessary to
temporarily *disable* support for *unplugging* cold-booted vCPUs to maintain
compatibility with legacy OS environments.

As an alternative and temporary mitigation, we could introduce a property that
controls whether cold-booted vCPUs are marked as unpluggable. Community feedback
on this approach would be appreciated.

References:
[1] Original UEFI/ACPI proposed Change Bugzilla – TianoCore
    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3706
[2] Advanced Configuration and Power Interface (ACPI) Specification, Release 6.5, Aug 29, 2022
    Section: 5.2.12.14 GIC CPU Interface (GICC) Structure / Table 5.37: GICC CPU Interface Flags
    Link: https://uefi.org/sites/default/files/resources/ACPI_Spec_6_5_Aug29.pdf (Pages 138, 140)

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 16 ++++++++++++++++
 include/hw/core/cpu.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15d9c2d8ac..d1172151be 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3174,6 +3174,10 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virt_update_gic(vms, cs, true);
         wire_gic_cpu_irqs(vms, cs);
     }
+
+    if (!dev->hotplugged) {
+        cs->cold_booted = true;
+    }
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -3248,6 +3252,18 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
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
index 4a74c383ab..7b7ca2c32c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -571,6 +571,8 @@ struct CPUState {
     uint32_t halted;
     int32_t exception_index;
 
+    bool cold_booted;
+
     AccelCPUState *accel;
 
     /* Used to keep track of an outstanding cpu throttle thread for migration
-- 
2.34.1

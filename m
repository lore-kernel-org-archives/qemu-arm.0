Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp599861njl;
        Tue, 8 Oct 2024 20:38:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUd8Kq1BwzNllNT2AvgIRiYCA1QnO/oX4utXlJnkF9+PURbDinJx5QTjVBHsTvlBXosCL6feSFll5iagA==@linaro.org
X-Google-Smtp-Source: AGHT+IHQasAciIyh2xNdWlkeMVGXlIlqLZZ+xGeaQysqQhgGVqvuXakJvIPCoLWSdNWkmqx4ITxo
X-Received: by 2002:a05:600c:3c96:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-42f94c0c9c4mr32419785e9.14.1728445129388;
        Tue, 08 Oct 2024 20:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728445129; cv=none;
        d=google.com; s=arc-20240605;
        b=NOALTfLIGmzaTUzxGtGG6rPBNTj68lu+atSumhtNxI5FT3WaatScGiREiK3tcGI/Eo
         cZsigX/NeutMbtfLcO6lL+sgfkWJt1ffrSR1sK5U1jaxf1uYgeDeKxmwiPoVUaAvIrDY
         OGD+gwtdHw5aF7FEsSZQEgtAr3c4q+wP1q0meVByD0sPgUXyLA0L6pIWQSi3z7HQGrzj
         DY4ikEZrfp2rtnYUgf6zN1oKBMuymhcpPwb5ws9CXm7OwlNziKJFEcpaFXbrXkmiwk30
         tSV3KoLdvxl4u4Iw0zlyp81Nukou816mMoLsyO0SCZ0VHasDp9h6cni4S7bStxWOfsYL
         uSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Rgr8Pij/6ilcQakfio8iV4dEM+NK0t/ANMshr0QVr3k=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=Njwnaoat1BAeLpi633+K3M+GuENyrVKCRVkY29w9rhq6puIHa08fwLnUEJB6p0y3pm
         KYRn43LFOjOJV1Rt0oG5ceqf9bFTnANp0zQvXHpDf3ZlDPwKq4sHM9nrkkueuv1m+i4W
         GHLIznckCJ3bU7ZjqLQ4zZdyE2K5gwh69H5oy8PGIXChXckM3OMqPJVZ/Xa7vUWwMxkD
         LDfZDY7//oOZ0wpZYB0GXbeXexoF9oAc56dPOOaXOwyLNS2OARBzwz1GUgu4V/TnyspV
         0sqpbhiJCjl0w6ilcqPn9G8mKlCylZ33uEvsIy4Lwc+6wmKFBKTQuUib0VMjU8uWT+n/
         YhAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d16911818si3910209f8f.112.2024.10.08.20.38.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdqw0TCdz67yqV;
	Wed,  9 Oct 2024 11:37:32 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 81D02140447;
	Wed,  9 Oct 2024 11:38:48 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:38:29 +0200
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 33/33] hw/arm/virt: Expose cold-booted vCPUs as MADT GICC *Enabled*
Date: Wed, 9 Oct 2024 04:37:04 +0100
Message-ID: <20241009033704.250287-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009033704.250287-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
 <20241009033704.250287-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: oNGOikhIx6RK

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
index 5d440f9121..208f4ecfe1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3176,6 +3176,10 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virt_update_gic(vms, cs, true);
         wire_gic_cpu_irqs(vms, cs);
     }
+
+    if (!dev->hotplugged) {
+        cs->cold_booted = true;
+    }
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -3255,6 +3259,18 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
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
index 2e62d5f1a5..8dcca3bcb7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -570,6 +570,8 @@ struct CPUState {
     uint32_t halted;
     int32_t exception_index;
 
+    bool cold_booted;
+
     AccelCPUState *accel;
 
     /* Used to keep track of an outstanding cpu throttle thread for migration
-- 
2.34.1

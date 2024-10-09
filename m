Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595776njl;
        Tue, 8 Oct 2024 20:23:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIN/GkNBDhqmlLZZMyU/x5iILe2LOtgWlP5qq7H+KKEbtAPAVVO8i9F2SOvpBkpIjkFnhZ9aybP/y6Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IHrovHLo4O0xMs8ZcbsQjBnlc7iKXUO+8B5+DBj7KY/ocLBrbgzehurvcf1kVWKe4aE3B1J
X-Received: by 2002:adf:a296:0:b0:37c:fde2:93b6 with SMTP id ffacd0b85a97d-37d3aa23802mr458499f8f.11.1728444213860;
        Tue, 08 Oct 2024 20:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444213; cv=none;
        d=google.com; s=arc-20240605;
        b=j5dvtQDb3lejNypnShPyCy9lCyJ5JnPWK5DswlpmzYMwY+I0y4lkNJ7beMowfstFvI
         6Ifu85J1igt0vlSzui2FL1gsi7O0VU3Om7uR2eeG11t33lMKlB3tl7eUJBriK+dD0/so
         u4NC5O/xYwnzP4jm6+p3Df9NQ3D1KbjQ4O9cl0ONA2t5qyCYS8nWfwyRuPGUmWin/vD4
         AbWMURNHkmGUrQ/U/q9G/zkRo1ONotfSnYHprNpAzKpqeO7dcRu3TYoZ7ZN64dp5QLUn
         tCxraN8bCGwxkI70So9w7OJQvKh2haKq6db4mG7yOFcy2ADZSrhTvhbhAerkgz4M3/+Y
         TZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=wxrxgFoR/2MR1WZun579KOGl6N23rAA4faCNurTSrjo=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=LKIb01HU80wWxCzOt5kxTcTUgBvemsq1/Ro0C7Si3o1v+ypgmd3gidFxICkR5otCOL
         HMFUrMCZmEx8o5bo+sEwRPCox4C7lxkeZ0UDqssVrhAnckjzA0pHUbsx0zK4Von7XSc7
         My2Rgq2hiPzL5kwDTZ5rP0jrJn2JqFhUCOmgk57zT0wj3KerqBScA+FCmTTumbCYw6lu
         RCRlcNIsYykm9wHcEuXf2m4VN1+YgrzHn9EGudDnAXmupKtWyU00iIvkSiHeHxc9GAzh
         EkSCxLFXCQJMKXgWpGXuVboq8Jve3IqNQGusDS1qAbtTQczhQFwbfy3hlk8CTxiFqbfk
         xEwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d169119bcsi3710913f8f.150.2024.10.08.20.23.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdQp2LWQz6LDBS;
	Wed,  9 Oct 2024 11:19:14 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C66E140447;
	Wed,  9 Oct 2024 11:23:33 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:23:13 +0200
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
Subject: [PATCH RFC V4 12/33] arm/virt: Create GED device before *disabled* vCPU Objects are destroyed
Date: Wed, 9 Oct 2024 04:17:54 +0100
Message-ID: <20241009031815.250096-13-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: DFGVaOYLhhHZ

ACPI CPU hotplug state (is_present=_STA.PRESENT, is_enabled=_STA.ENABLED) for
all the possible vCPUs MUST be initialized during machine init. This is done
during the creation of the GED device. VMM/Qemu MUST expose/fake the ACPI state
of the disabled vCPUs to the Guest kernel as 'present' (_STA.PRESENT) always
i.e. ACPI persistent. if the 'disabled' vCPU objectes are destroyed before the
GED device has been created then their ACPI hotplug state might not get
initialized correctly as acpi_persistent flag is part of the CPUState. This will
expose wrong status of the unplugged vCPUs to the Guest kernel.

Hence, moving the GED device creation before disabled vCPU objects get destroyed
as part of the post CPU init routine.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3986f6d9fc..e40e6c23e4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2452,6 +2452,16 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms, sysmem);
 
+    /*
+     * ACPI CPU Hotplug state MUST be initialized before destroying disabled
+     * vCPUs in the cpu post init routine
+     */
+    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+        vms->acpi_dev = create_acpi_ged(vms);
+    } else {
+        create_gpio_devices(vms, VIRT_GPIO, sysmem);
+    }
+
     virt_cpu_post_init(vms, sysmem);
 
     fdt_add_pmu_nodes(vms);
@@ -2504,12 +2514,6 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms);
 
-    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
-        vms->acpi_dev = create_acpi_ged(vms);
-    } else {
-        create_gpio_devices(vms, VIRT_GPIO, sysmem);
-    }
-
     if (vms->secure && !vmc->no_secure_gpio) {
         create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
     }
-- 
2.34.1

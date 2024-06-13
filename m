Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97733ejr;
        Thu, 13 Jun 2024 16:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZEDrG/RirP/Ubh05C/5vhzwOpUNY8res+to0B4JG844xH572bdcsh60PGSVupYdExdEHgSCu/RjE+VR3MmB7SUGeW6b+Q
X-Google-Smtp-Source: AGHT+IH6yFPzJCPHRXFv2MgXB0VVwKyb1U+L6Egf5K3L8+K1tL6P7L8aZKh1IHiG/kSmwZ2caKU2
X-Received: by 2002:a5d:4307:0:b0:35f:276c:ac5f with SMTP id ffacd0b85a97d-3607a767509mr687152f8f.40.1718322125037;
        Thu, 13 Jun 2024 16:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322125; cv=none;
        d=google.com; s=arc-20160816;
        b=lvahTeAbpRqxbkFW0BD/bDK7rhyhjjhu9iR65/CZguXyevf3YQvODHOfzE+s1rm5wz
         o5V42Ew26l6nmmS4yeuKul1apyGGbsjWQ0jbldk8pI3dw18XlwbOaDo6qrc5X2h8yC8R
         oN9rVRfsc2UedADVsSSoWAAxiGolT1HnEBvNdeUsvuATLp3fCseYOcnnaAZIFRemVNNI
         BIRqLWZNGZIEmoiSRA7V7OCfa8WMsa2BunuPZ7NkofxALa71rctN9c0cw9rNYudwr6gp
         KTihA7q2JtNMGVb7dKoVXNSgllZL+u1X3UsHbD5AZ70nLvyNNnTQq9WxMGGM31ObKY1L
         Ds9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DhM7rRiTUxshJdhqrbw/sZ/WvaJD6UX5Cb/qQAX150w=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=DtG5LY5nJdDDf25XYvdA3WSK0ivRAtUYzzgeRZfQq/bTOIcx62EtMOwVMEfzwkPQ+4
         AWwejgYvqA7exJ6l1sNruWH1xfh/QofatUlbvRHXPom831Ou2dn+QelxONBOldjBchx9
         xcHT4E7Obrf+yhddgZCOZSutCVgjCuP9+j2/RglShu2qtKRQlqE9PUc9Umvom7FQ1mpy
         BTkltHpCSlyBLduMrNsr9zqg/9XpCHthcrS+IH/klgFAIoeLfX7MDdkwoDDnpgkVSit1
         KfYwG46pi5/t5VlH/vhc6PAtzHWJeCMEFcQWN1d73jNgR6G2ARxbDSNCWQKtmieKLyaQ
         yRHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-360750c4fabsi1464083f8f.270.2024.06.13.16.42.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f6c2x72z67MmR;
	Fri, 14 Jun 2024 07:40:40 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id D6E7314065C;
	Fri, 14 Jun 2024 07:42:03 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:41:41 +0100
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
Subject: [PATCH RFC V3 11/29] arm/virt: Create GED dev before *disabled* CPU Objs are destroyed
Date: Fri, 14 Jun 2024 00:36:21 +0100
Message-ID: <20240613233639.202896-12-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: wNaE2vPff0NI

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
 hw/arm/virt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 918bcb9a1b..5f98162587 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2467,6 +2467,12 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms, sysmem);
 
+    has_ged = has_ged && aarch64 && firmware_loaded &&
+              virt_is_acpi_enabled(vms);
+    if (has_ged) {
+        vms->acpi_dev = create_acpi_ged(vms);
+    }
+
     virt_cpu_post_init(vms, sysmem);
 
     fdt_add_pmu_nodes(vms);
@@ -2489,9 +2495,7 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms);
 
-    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
-        vms->acpi_dev = create_acpi_ged(vms);
-    } else {
+    if (!has_ged) {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
-- 
2.34.1

Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2050666njb;
        Mon, 14 Oct 2024 12:23:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3XqKWotorcF6TfNWdmwiT7cUXHRKV6aQHx3B/+KwvYambPWLFbRMPXD9DsyNv+DBuRQ2pe4SeP/8/Og==@linaro.org
X-Google-Smtp-Source: AGHT+IEIGzdiECAYvM3JZjMBVkK6rVY5TBnv7Tp7UFowbYjvrLKXfRTcmy2hgcW0S1u55nTsNEYX
X-Received: by 2002:a5d:4e0f:0:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-37d55190237mr8128387f8f.9.1728933808525;
        Mon, 14 Oct 2024 12:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728933808; cv=none;
        d=google.com; s=arc-20240605;
        b=WyAp6getSjELdiaX+JAZ7luupxwLMqpq2VY6HC6/AaKwXHAxPBNiRTpq8ZSv47zF2c
         5pSlS1Pvtig29FTEQbaiZKPJ2U8AvMmkjSWtYQyA5sLh5A/wXwy5GRPF3so1FIcwiP7S
         Eh9kQv38yd9ZDx/q2T2N5RgQazIKMmMIHmbuM47gD3u0qI3Z4qkYbJC7NCor40l6y4px
         fFGymxoeGwUlqFo+uGqNdO85B5y/DXUa4BvbpaEHz7iRiA5kkFiEMkZHuQo3KjLkhXe+
         IL3UxdE59kzeWbF9FPnIz9o685VOGE3/svo0qCn4vLo3DZoZ0wRkdwg64GDCiLWw7DTR
         tZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=O+AaJir7Zw40w4Q5t3TWoV8L0ahJOww8nws314WeTpo=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=HFo5l7ohkGFahlTaFHqMeyfEOQx9zQe6VYr5jmGwwjGbO9BSQc6KJe1zh5ezQsyOnG
         0/97NfVuweNNf6sxvGdVDowhHj1+SYlp/D2TrK/FxlNh0tn9FU7/9c6L9NlFDTJogPV6
         l8ozRj0cF6eqL6Dc4qNK39qF0l681pHgTh0OFRdHmN2dvhjqJMolMnzzCVSmX+9hSzLG
         7aZnOdL6BX7yrfnZhamb/UIJGTHxAIaUczm9hMxrAFmHE+m0FkE9uT1zRS4dwQ5O05Jx
         4tocnW9OcHIYhP+1Ee2b6+Uj7m8VGRO2iA/1lOlu5FyiXslysRxuSuwRIjpiTQ9JhVpj
         +ANA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d4b711458si4876464f8f.57.2024.10.14.12.23.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XS6YD2CLrz6K6lC;
	Tue, 15 Oct 2024 03:21:52 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id A643D1400D9;
	Tue, 15 Oct 2024 03:23:27 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 21:23:08 +0200
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
Subject: [PATCH V1 2/4] hw/acpi: Update ACPI CPU Status `is_{present, enabled}` during vCPU hot(un)plug
Date: Mon, 14 Oct 2024 20:22:03 +0100
Message-ID: <20241014192205.253479-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014192205.253479-1-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: v9FKM6drU1mk

Update the `AcpiCpuStatus` for `is_enabled` and `is_present` accordingly when
vCPUs are hot-plugged or hot-unplugged, taking into account the *persistence*
of the vCPUs.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 083c4010c2..700aa855e9 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -291,6 +291,8 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
     }
 
     cdev->cpu = CPU(dev);
+    cdev->is_present = true;
+    cdev->is_enabled = true;
     if (dev->hotplugged) {
         cdev->is_inserting = true;
         acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
@@ -322,6 +324,11 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
         return;
     }
 
+    cdev->is_enabled = false;
+    if (!acpi_persistent_cpu(CPU(dev))) {
+        cdev->is_present = false;
+    }
+
     cdev->cpu = NULL;
 }
 
-- 
2.34.1

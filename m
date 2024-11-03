Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1489847njc;
        Sun, 3 Nov 2024 02:27:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXj0KQSy8StS1ztePTdrZRYenJTtv+V5kN6pMJltrU8oyRGOXuOpXYcg2/qwyOnJs/sHrYcUpqdsih7eQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHrxLFE6EcmQgMyS1qz8oT/rPk9UMElIzSvCWX9swl4CvZjZ/mOfWvEiF7r2EkcGtXBdFb6
X-Received: by 2002:a05:600c:4215:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-431bb9e6031mr139752715e9.33.1730629623641;
        Sun, 03 Nov 2024 02:27:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730629623; cv=none;
        d=google.com; s=arc-20240605;
        b=G7/ZxeL49yQNyywippMH7BHgpzo7a6bOGJknvEtbUT6lIplOj045ugQLxW2NQBuL66
         uu25p3CrrU3j+qAYePMjaHJx9cS1hMRFgRU3ENdvaj9QrcPseZx+Gb2heUx/l3p5P9GR
         6a4V/2cnUv/u5B43AjJPvG8OrVx2AZsockvNHbTS0oATt+wYyWqYbapELdNDPcWyhf2s
         vEitg6EEsgur9Trlxqg5exNybe552AgXseokLuqG0nSf6GpCIIFZ76clA4t3LVMFkAFY
         sxeBTZzIKu5dGEhmO6NliDoKdEwYthNUdK70V6Ru85XuLLHPRTktwCLBTzIBg0t0OJOc
         9p1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=YSQjjkVI9ZniQcQkLTdjxggiq++FOl0ayT63s34Pb7U=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=MT3/mvW/kHj5bOhRqqrJJ9IZI9ZhCiNKpHg8t6HQgjWAgwnf5XqMHwZ7FwE/M8BZDD
         f0GAmEYeloGRuW3kR0Bu679wFjbrYC5DLtjhJOEjk37CqoUMhAHz0cTdwTciMvcaGxZW
         0ESnm3tmGptJ1DneUYe1lINKWLBoHiDPnMAdW0ct+kMgzUo/CbXgDyyk+jsAaoMAablD
         ZtEmTjeagfpdvAatERiA5Nn6blJtS15ZxWrmN3HN6MJVIJpzdR4zb+8dsuMzExX61OGu
         zVxN+jfVSN+Bfb4fnRbmcI2/xB+v1Qxn4/avNQc4giR7FvKT+7BlRL1vCPacUfqmlxGg
         KXBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4327d61e839si48676895e9.121.2024.11.03.02.27.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2024 02:27:03 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xh9gs2XXVz6K5vy;
	Sun,  3 Nov 2024 18:24:25 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id A5E32140B67;
	Sun,  3 Nov 2024 18:27:02 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.154.43) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 11:26:43 +0100
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
Subject: [PATCH V3 5/5] hw/acpi: Update GED with vCPU Hotplug VMSD for migration
Date: Sun, 3 Nov 2024 10:24:19 +0000
Message-ID: <20241103102419.202225-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241103102419.202225-1-salil.mehta@huawei.com>
References: <20241103102419.202225-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.154.43]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: MvH0YbJqFeED

The ACPI CPU hotplug states must be migrated along with other vCPU
hotplug states to the destination VM. Update the GED's VM State
Description (VMSD) table subsection to conditionally include the CPU
Hotplug VM State Description (VMSD).

Excerpt of GED VMSD State Dump at Source:

    "acpi-ged (16)": {
        "ged_state": {
            "sel": "0x00000000"
        },
        [...]
        "acpi-ged/cpuhp": {
            "cpuhp_state": {
                "selector": "0x00000005",
                "command": "0x00",
                "devs": [
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    },
		    [...]
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    }
                ]
            }
        }
    },

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/generic_event_device.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index d00f5a6c1c..663d9cb093 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -331,6 +331,24 @@ static const VMStateDescription vmstate_memhp_state = {
     }
 };
 
+static bool cpuhp_needed(void *opaque)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+
+    return mc->has_hotpluggable_cpus;
+}
+
+static const VMStateDescription vmstate_cpuhp_state = {
+    .name = "acpi-ged/cpuhp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpuhp_needed,
+    .fields      = (VMStateField[]) {
+        VMSTATE_CPU_HOTPLUG(cpuhp_state, AcpiGedState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_ged_state = {
     .name = "acpi-ged-state",
     .version_id = 1,
@@ -379,6 +397,7 @@ static const VMStateDescription vmstate_acpi_ged = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_memhp_state,
+        &vmstate_cpuhp_state,
         &vmstate_ghes_state,
         NULL
     }
-- 
2.34.1

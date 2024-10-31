Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4280njc;
        Thu, 31 Oct 2024 13:07:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxd6qCsEcWHRAs4VGWhaRkKCtQjUHOKOZ3TR0V+KfhbEvV5Sqti/gG2WPDjnwhqxFWT9raier8ssn15A==@linaro.org
X-Google-Smtp-Source: AGHT+IETFCN7sULnFFqnGWM9v0iaGHSDhBWsdf4sYzrRTfk8GS7Ah4MprVlC2PRDRdthO7T7/Oyl
X-Received: by 2002:adf:f7ca:0:b0:37d:34f6:92a with SMTP id ffacd0b85a97d-38061220071mr15322726f8f.51.1730405279419;
        Thu, 31 Oct 2024 13:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730405279; cv=none;
        d=google.com; s=arc-20240605;
        b=il6AP9RW2LKSFS2HNDk02roj7z3eGVTDkL4R+tBSXfDsWYz8YjjH/5P/1zMK89Vdhj
         Mqtd9JYeE2ipiwNcxlOzjAQDITuyCRXEux0BvkZ4sxTm0wWPRtC0SYJ2qRfiVCmmPchB
         33UiB7QB12KcIVWQBcTOMDvLZOlKq5pZyuCGojA2LVEFdl66tR63g4s+etER5axIm7Z7
         hOcvWejLVEYOzQme0JGGj7441PaMgTLeQVSw7WuVASU1KoFK+7wbCpE39gZHudP5RAIR
         5t/q+IW/1NMPMUzURWfJ2Jc1WXK/WedL3J17fNebaaR9WO4GhtW46PvdCXNYVbOBjr1r
         dZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=0XUol1bTlvT5DBMz/IGKlfE01NhDaVIhxkQqDhUCbqM=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=iWv9hu+5MAN8MTKcTJVTBCvEYswfltcUocYrLfOutkkJrB1VsQ8f1sGhVJR3aBUfwO
         mYHSKDuYR7pB4R5LfFJ/h6bbiilqCJNhn4P+xZXfOL+ALQHeZ3gU5JZmeUM6vk1ezHBi
         uwv8LwVr6Y6DK8k6TPzFwcNIIXQS/FWhV1sYmNYiJPGPzDUDx1aAZ4Xkk9QYG1GRPW0F
         +xGup2L5Tv3BwiCn622EQb9+UBXA3d7Rh6Fkk7mOqJi+tLcynq4jbeu2ZXKt9ha8kfBS
         WzF5Z0TFzpEQM4TmG5axKLEgxKtt3pvSsXi/EY2lfUoItvlsjKig6p6r/r4nolAJkKw/
         Wwkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c1174844si1481988f8f.468.2024.10.31.13.07.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XfZfk0L2Mz6L6wx;
	Fri,  1 Nov 2024 04:02:54 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 12727140A9C;
	Fri,  1 Nov 2024 04:07:47 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.152.207) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 21:07:27 +0100
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
Subject: [PATCH V2 6/6] hw/acpi: Update GED with vCPU Hotplug VMSD for migration
Date: Thu, 31 Oct 2024 20:05:02 +0000
Message-ID: <20241031200502.3869-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031200502.3869-1-salil.mehta@huawei.com>
References: <20241031200502.3869-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.152.207]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: x80GPUgsP9i4

The ACPI CPU hotplug state `is_enabled` must be migrated along with
other vCPU hotplug states to the destination VM. Update the GED's VM
State Description (VMSD) table subsection to include the CPU Hotplug
VM State Description (VMSD).

Question: How to stop `is_enabled` state being migrated in case of x86?

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
                        "is_enabled": true,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    },
		    [...]
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "is_enabled": false,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    }
                ]
            }
        }
    },

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c                  |  1 +
 hw/acpi/generic_event_device.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 017b847815..514d671bfb 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -308,6 +308,7 @@ static const VMStateDescription vmstate_cpuhp_sts = {
     .fields = (const VMStateField[]) {
         VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
         VMSTATE_BOOL(is_removing, AcpiCpuStatus),
+        VMSTATE_BOOL(is_enabled, AcpiCpuStatus),
         VMSTATE_UINT32(ost_event, AcpiCpuStatus),
         VMSTATE_UINT32(ost_status, AcpiCpuStatus),
         VMSTATE_END_OF_LIST()
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

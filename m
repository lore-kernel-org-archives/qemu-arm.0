Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2050948njb;
        Mon, 14 Oct 2024 12:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXN4CaejdBo/jsIVwEXoyHjiEvmasXfzeyFLq7eAYwa+TQvVDpEAmaNeChTvPF7Eq9BjLtf3X85b45yEA==@linaro.org
X-Google-Smtp-Source: AGHT+IHmula6GoObPBO+42P3IXOUuSnG3P70vUgF2uocdQgsLjO7Oj+mYIMjTHdVsN/oKTX4M9Ym
X-Received: by 2002:a5d:62cc:0:b0:37d:4c8f:2e1 with SMTP id ffacd0b85a97d-37d5ff2c395mr5619294f8f.22.1728933848558;
        Mon, 14 Oct 2024 12:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728933848; cv=none;
        d=google.com; s=arc-20240605;
        b=dxIvndAFBG6bQhCe0CytxHvTBKojSsud39trLUc/ukxklHzN4oxTFg9r+XDUidxZX3
         wg0DYrevTEblgSG3N+fvkowD0dB3vu/X2W8XnwIu/MY8anyVaeHJKtYg3eM8bTylcQZd
         p0alshi1Wi6q0+L8hRdNJvuBpGq7ELgbMhAmgfg2JtnBbeKpxTYxUtVRcMy3RJ3v/fnL
         /iziI29C/csjPML1JfTe1jajsLgILi+63L6NAmgdBlGHo7QwDCXTMNDeF7WfR3QpYpTb
         7m4uZHhGs54lMwQQsvYSEhrcHjb6eIrNiX/W7BWaYQp8qcsdSMMOICTcNcRq1oxIzExq
         qsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zjo00XovtEcCnZh4t8Wo5NIyAAuf551rSj8vynjf6c8=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=AyhKXzz1nERjZWvlWkLcYV5u7oVqGWZ+SaayA6R3JaWFEumFmAwWQwXNGyYi0sx9/V
         XhIeN4Zckz2Dq1zKhSMTabczonVuHlUkLF1+yNu/k28+l/GZzxsfAPEajvWsjEpVBMxN
         Rw759qiUiQ5asl+AVJjXkdNhtfPXDAtj127cTf6tZjk6y2gZ9/GiCHWREr5ChOi3vDaD
         6yFPJ/vCsIz54BWUIB/w0vr+ENjp2UGLnIISStr5x4P7+0uQpOP6Ye45q2sjmFLqxG1Q
         ZpIdpn1c6McZMaDq6QbOWFXKo83Xbs/LChNbVC6pT1wBNIflPi9QQBkI1SEuE4gHGfXX
         r3dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d4b744a6dsi4806874f8f.271.2024.10.14.12.24.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XS6Z02Wphz6K6T7;
	Tue, 15 Oct 2024 03:22:32 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id B124A1400D9;
	Tue, 15 Oct 2024 03:24:07 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 21:23:48 +0200
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
Subject: [PATCH V1 4/4] hw/acpi: Populate vCPU Hotplug VMSD to migrate `is_{present,enabled}` states
Date: Mon, 14 Oct 2024 20:22:05 +0100
Message-ID: <20241014192205.253479-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014192205.253479-1-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: zgpQW4RItC1o

The ACPI CPU hotplug states `is_{present, enabled}` must be migrated alongside
other vCPU hotplug states to the destination VM. Therefore, they should be
integrated into the existing CPU Hotplug VM State Description (VMSD) table.
Depending on the architecture and its implementation of CPU hotplug events
(such as ACPI GED, etc.), the CPU hotplug states should be populated
appropriately within their corresponding subsections of the VMSD table.

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
                        "is_present": true,
                        "is_enabled": true,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    },
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "is_present": true,
                        "is_enabled": true,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    },
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "is_present": true,
                        "is_enabled": true,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    },
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "is_present": true,
                        "is_enabled": true,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    },
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "is_present": true,
                        "is_enabled": false,
                        "ost_event": "0x00000000",
                        "ost_status": "0x00000000"
                    },
                    {
                        "is_inserting": false,
                        "is_removing": false,
                        "is_present": true,
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
 hw/acpi/cpu.c                  |  2 ++
 hw/acpi/generic_event_device.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 23ea2b9c70..d34c1e601e 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -340,6 +340,8 @@ static const VMStateDescription vmstate_cpuhp_sts = {
     .fields = (const VMStateField[]) {
         VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
         VMSTATE_BOOL(is_removing, AcpiCpuStatus),
+        VMSTATE_BOOL(is_present, AcpiCpuStatus),
+        VMSTATE_BOOL(is_enabled, AcpiCpuStatus),
         VMSTATE_UINT32(ost_event, AcpiCpuStatus),
         VMSTATE_UINT32(ost_status, AcpiCpuStatus),
         VMSTATE_END_OF_LIST()
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 15b4c3ebbf..a4d78a534c 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -331,6 +331,16 @@ static const VMStateDescription vmstate_memhp_state = {
     }
 };
 
+static const VMStateDescription vmstate_cpuhp_state = {
+    .name = "acpi-ged/cpuhp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_CPU_HOTPLUG(cpuhp_state, AcpiGedState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_ged_state = {
     .name = "acpi-ged-state",
     .version_id = 1,
@@ -379,6 +389,7 @@ static const VMStateDescription vmstate_acpi_ged = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_memhp_state,
+        &vmstate_cpuhp_state,
         &vmstate_ghes_state,
         NULL
     }
-- 
2.34.1

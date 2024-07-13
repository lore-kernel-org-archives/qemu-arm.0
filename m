Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp1457812nji;
        Sat, 13 Jul 2024 11:27:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdIRFRt1Gp5Qyn9HKqzMC+hzim3Cgj6B4q3u+sb0gy/4KxNXxOUeu+8OzUasoT/b56R7mlQXiVPpf6fzhHErg1cyfdcxRs
X-Google-Smtp-Source: AGHT+IEGxKcBwlrirLuPF65XQlwzcngjO5GvlEjFZ6yiT6DfJgIcjnhat95QmQdgumEpwjPva1Vz
X-Received: by 2002:a05:600c:6dca:b0:426:5269:9838 with SMTP id 5b1f17b1804b1-426707cc905mr101479345e9.4.1720895242405;
        Sat, 13 Jul 2024 11:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720895242; cv=none;
        d=google.com; s=arc-20160816;
        b=I7PE9FlwXN+jbdudPlBt3lFVSqK1TSES97g2zUWOCQFnJH2KctOSadyepRZM4GuOKc
         uC3KBZ4Rlm6hK11vL2Ig7tq+LIioyq/M4Z5vdM4aW+YiCZznudBUwkZbCoDJAmyL56G/
         P/F/v4fRKhDX88pfqGl88Tjb3TNA9cYZJOFgBR07lYHwd5ELeVNFC555HvND+0gnO81B
         uhtPzpBCQbMykQa8Mc+5RFUi3MfCeU6nCeyZf1J0XCflhwx6NwzzRTCiUbFS26jQtZPH
         HZhtyCuxXJampe7OyG/yctIPLwOpn/6XkbEUoHoEB+FKz/QbDuTVwKG1x9mdncClVoje
         aJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ObkmnwmTyZaL1zPmXzgKtfzOaPFzqULigIRHiv0UYCY=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=TzeXMCd+S52Y9oHZfcOfKjtuwep5b18035MqklBuS3QwBEsNuut766P+gmntPQgIv2
         FoOKQfcqAeLGesep4RJeZDM7OknAqXNvlOUuwP/BqoYzHu4EKkD2muyHjQsCQDqxfOy5
         /ZbiC2uj9QxIxMwCrznbpOucZ5NYQdRlW1AnG94DvfK8XGV6lm81t+YpRlXKuMcjNcgU
         ojblnrbleasbAEFJ3rVjaIf6iTBH/XARojIa2rAl+ujIkqIwRvTfDtLF/5zHGqOP33Xo
         v2NKDA3JhM1BPp4Fi2maqVDBKnV5WmuB0o4x9VWLILC6IFhLUb6xcBVdpIkMi7rx3EyC
         gdAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-427a5e7f20bsi10367785e9.75.2024.07.13.11.27.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2024 11:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLxjx44xHz6J9yj;
	Sun, 14 Jul 2024 02:26:13 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 93590140DAF;
	Sun, 14 Jul 2024 02:27:21 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.172.138) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 19:27:01 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Shaoqin Huang <shahuang@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH V15 4/7] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Sat, 13 Jul 2024 19:25:13 +0100
Message-ID: <20240713182516.1457-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713182516.1457-1-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.172.138]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: dG8vEltGH4se

OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
results in start of the CPU scan. Scan figures out the CPU and the kind of
event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
method with the call to method \\_SB.CPUS.CSCN (via \\_SB.GED.CSCN)

Architecture specific code [1] might initialize its CPUs AML code by calling
common function build_cpus_aml() like below for ARM:

build_cpus_aml(scope, ms, opts, xx_madt_cpu_entry, memmap[VIRT_CPUHP_ACPI].base,
               "\\_SB", "\\_SB.GED.CSCN", AML_SYSTEM_MEMORY);

[1] https://lore.kernel.org/qemu-devel/20240613233639.202896-13-salil.mehta@huawei.com/

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/acpi/generic_event_device.c         | 3 +++
 include/hw/acpi/generic_event_device.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 1b31d633ba..15ffa12cb2 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -108,6 +108,9 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                 aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
                                              MEMORY_SLOT_SCAN_METHOD));
                 break;
+            case ACPI_GED_CPU_HOTPLUG_EVT:
+                aml_append(if_ctx, aml_call0(AML_GED_EVT_CPU_SCAN_METHOD));
+                break;
             case ACPI_GED_PWR_DOWN_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index e091ac2108..40af3550b5 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -87,6 +87,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 #define GED_DEVICE      "GED"
 #define AML_GED_EVT_REG "EREG"
 #define AML_GED_EVT_SEL "ESEL"
+#define AML_GED_EVT_CPU_SCAN_METHOD "\\_SB.GED.CSCN"
 
 /*
  * Platforms need to specify the GED event bitmap
-- 
2.34.1

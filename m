Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp323942ejc;
        Wed, 11 Oct 2023 12:45:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqw1P6TtsultjE5j9mBivl4WjML+HdXd5GlfL3RKfzHoJ5FR+W0sb2b9TtRNKOKsqbYUWu
X-Received: by 2002:a05:600c:3586:b0:406:849c:52c3 with SMTP id p6-20020a05600c358600b00406849c52c3mr18329843wmq.22.1697053536259;
        Wed, 11 Oct 2023 12:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697053536; cv=none;
        d=google.com; s=arc-20160816;
        b=o8cXFBtbKJDwh+mF3UDzfNAdF2JTJWvbUfW0pL4XuoYgMPaJyYCxFxvvs3bbtYDNAf
         j46FENXmzcDTgaUQ66kuSaw5/iyQ3kUVKyPR/x6RMyHQMwcRlq5+aVIhcmPkM1mddH6m
         ZiVa/4fT16ZMufDHYxGnI7OJuestQFHrjl3HZCU8R4fQWPHJ0B5L0ZRV2mD0OnsxRWFv
         bJ/ifvw5mD8qfbtKFRdlmD78nssWeT8KZVfnXJwduS1hB6DiZo1YQVWhUenjNHE3hNs3
         2oL0OW/h9JSh2nBUIwC0ljjJq4J5Re0Kavq1Kbsqidlpt8UtsQuXcppZgl82jZLE/lyq
         61tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Qbwm51F0IVlVvRt+2cwFAASvbIkjN38ETM1lfAPCsBo=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=AyNDk2ccHP5IkXObw77Bgak/KaS+b523yMEMXMuVAKbs37AMACjMwx8+nf84tyqz7W
         e/4B3BxBXq7FQIHOZFCGoW4SjN5fJ1ucPQO8/Up+eyCPVhTI7nPSixwEugdKI8+HPXIh
         SlT3VtegsEeuPNXfUlfMwHW5GMLSQ1xaILVNFmq2t4mMgmjf65R0uSKOuHEN0avMQmuX
         5VaNsh6mYYV1pU+4z3UOGAS4qzX86INTnRdGzqbjd5yOBO7EiJsRc7WnfADbqRRnWWln
         aLfSTT/acqPoV5GpKQVtj0RMLF8vgKw2NuK4/ASh/GLwkiF9pfnirgdgAOtnnFYVK1vf
         wLlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id f12-20020a05600c154c00b00400f8f92c08si8101483wmg.52.2023.10.11.12.45.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 12:45:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5NXT3wrPz687PR;
	Thu, 12 Oct 2023 03:45:13 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.169.226) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 20:45:17 +0100
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
	<linuxarm@huawei.com>
Subject: [PATCH V5 3/9] hw/acpi: Add ACPI CPU hotplug init stub
Date: Wed, 11 Oct 2023 20:43:49 +0100
Message-ID: <20231011194355.15628-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231011194355.15628-1-salil.mehta@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.169.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: ibUGY5xBDDEx

ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
stub to avoid compilation break.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
---
 hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
index 3fc4b14c26..c6c61bb9cd 100644
--- a/hw/acpi/acpi-cpu-hotplug-stub.c
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
     return;
 }
 
+void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
+                         CPUHotplugState *state, hwaddr base_addr)
+{
+    return;
+}
+
 void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
 {
     return;
-- 
2.34.1

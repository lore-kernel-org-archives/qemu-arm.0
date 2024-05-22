Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp683265ejb;
        Wed, 22 May 2024 14:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtkZbis7sJkRuCFypS2ZBClfXK3QPI2Z7Vs36gk8UrW7inGs0u5Jxso9v6ssDW07qby8K5aRGaTQ88z71ECG7O6uLys7mX
X-Google-Smtp-Source: AGHT+IGbFTojsHZw6+r9OibZIJuRVBy2cn7FPoxxpiDdx53majqYWyoF0+zyeM6/v7AbRV9U9BfX
X-Received: by 2002:adf:f70d:0:b0:34a:d19:d553 with SMTP id ffacd0b85a97d-354d8ccd6b7mr2674164f8f.5.1716412485458;
        Wed, 22 May 2024 14:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716412485; cv=none;
        d=google.com; s=arc-20160816;
        b=U43i1572khU3n2+GD6AnjEGqZr0vEFaRWRN3ggGgW+b6LvPWrMZ/b65LoPnJav2dRu
         nflFe0gvImrWO2U4rzFjKj8UcB/k/O0ih6l41FaXHVRavhbOlr+1J/m08nTqfkB6/oo0
         GKp91YYMdc73emG3hhnqewlRdaq6kXiFNHbd4k1MTFspgSEmBR9uIYQalTQAsmvGmPSQ
         kqDb/GhciiaP00DKvIe6PbmfFP/dRTp45xKtvFlmF6KmQhf4SfnBnoDUAHVPWZ6cvuT/
         93+1Yun6q0lNALMM74ViPUDdaQlBx2KimzEjszJZa8X4n514Jc1ZeN+zsz4gAQvc7vgG
         4GCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=uBUJDLrGpdWmnp4ClXutksJ3WX3nuq0vvvTIEOir7yo=;
        fh=M0HTAxrI6BYZKxYd63sfeObsGy+Uhk81OO6h++LFq4Q=;
        b=Ap2eTBq8Q0oqjauP/l3eYluCAonItJaPm/xLjhRsLRp9nWMzdZmWCODReY3JPjRnkf
         eZWs8HQz3bUo2xmjxfS6lc3g4RvmK0PpVbQPwbH8sWsKma6fHPl9NJzxcvq1JZf7gi0j
         01LE6M8dqctm56TVwZLJ5kc2FGl6uPZtnbl9Z4lFaaXkpqPIftzjmqdm6+2ICDe0tGN4
         H+OGvnDv1/YnvSyBoKNhVi63WN92QjnCHX3KD6atT9ivuBhSw75coNjCVqkH9sfPTuic
         lLn5iEyarW6EfRIY9/UKMw73cyVEIdx5M+Grwi+SH+N3xR2IxmiPl5kQCyh+sVYHov5B
         Vvuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-351c613adb4si11258001f8f.1082.2024.05.22.14.14.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2024 14:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vl3r81j4jz6JB1G;
	Thu, 23 May 2024 05:11:04 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 790C7140B18;
	Thu, 23 May 2024 05:14:44 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.48.156.123) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 22:14:23 +0100
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
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>
Subject: [PATCH V11 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
Date: Wed, 22 May 2024 22:11:11 +0100
Message-ID: <20240522211111.232114-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522211111.232114-1-salil.mehta@huawei.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.156.123]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: d2pzGQyw/kWw

GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
and non-hotplug events like system power down event. Each of these can be
selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
the CPU hotplug event.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
index 0bd3f9399f..3acd6fcd8b 100644
--- a/docs/specs/acpi_hw_reduced_hotplug.rst
+++ b/docs/specs/acpi_hw_reduced_hotplug.rst
@@ -64,7 +64,8 @@ GED IO interface (4 byte access)
        0: Memory hotplug event
        1: System power down event
        2: NVDIMM hotplug event
-    3-31: Reserved
+       3: CPU hotplug event
+    4-31: Reserved
 
 **write_access:**
 
-- 
2.34.1

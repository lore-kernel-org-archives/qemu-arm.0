Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1753389ejb;
        Mon, 20 May 2024 16:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh4YsFsY6Z8fPYefAbT/SG7Ko1RCWfPZvP3xfPmGdQkw5JrgFlLZXjYqkDbGbsGzddmlBfJ3rbjYHz5juYEXNslkqG7uTI
X-Google-Smtp-Source: AGHT+IEk1D5Mnd7lIDBWMck1CaXghCB0zWP30o9nzARf8zBv4isyCYDd9QQIoqiCZ0ETsVkHVJ4s
X-Received: by 2002:a05:6000:a88:b0:34c:e62a:db70 with SMTP id ffacd0b85a97d-3504aa63447mr27916123f8f.67.1716248189045;
        Mon, 20 May 2024 16:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716248189; cv=none;
        d=google.com; s=arc-20160816;
        b=OhZWqM/OoI4sElAuBgVjs+QhWD1WmtT1+rfrUnOL5urMXBsTmMAIDBllwp4yrB1Ugm
         MdzZZQQAoUICtvNWibb6Y7NxFq4LLYXvbO9AgSvjWjCeTBt1/AHc3ZMD2rbj/r7sb0ei
         BU9W3HX576Dbz4QM7eVhtJCGz3gZTAJrVo8rkJf884C4W1pIUl1WOFgMQTdY440qFG6/
         3iEWrsQzAa2fD4OXLiqAdHTg7p0YjpqF2KWsp1+tUwQYsBPxi0Kze2cqae9GYirrM9Gm
         ab8JOLPXZOukxIs/g13e9JAlXH5rX0eSSskOtHRVslrQnNa4GeByCfGiSWlKGCAtDxes
         62uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=uBUJDLrGpdWmnp4ClXutksJ3WX3nuq0vvvTIEOir7yo=;
        fh=M0HTAxrI6BYZKxYd63sfeObsGy+Uhk81OO6h++LFq4Q=;
        b=D+Jl/yHN4MP/2aunqscuOdFUPEGilR1y63n+79q9aCV8YgVCajsVCiGhMVmxUYZ/FN
         R6RGAVarZkzkSmAEGKZNg9WjZqmA2vR6NRv2L+GTjkTJcfyVyMB7/O0VDc32ltyN27ef
         85Jz7MUZVddV0NGeeKyfg+qe1w4/ZIvnQhazYvw23Aw+uDR34mgbB5WFrC/IPMa6g7rr
         3Hm52YbVJiS/9jMdQl9EaqEjDgkojHzTMPPb/bvTmiRKXDV1SHCKldbPy2T6RptigWxB
         ZmniaZ/qJ34mlmdYMEP8YAB0DCbq1YvJjdQyzBoN5tHsiW1kSoyMJtFG1m5nwZaw9b34
         yVXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-351cc68ac6fsi7665837f8f.404.2024.05.20.16.36.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2024 16:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vjv7w3Kg4z6J682;
	Tue, 21 May 2024 07:35:40 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D09E140516;
	Tue, 21 May 2024 07:36:28 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 00:36:06 +0100
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
Subject: [PATCH V10 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
Date: Tue, 21 May 2024 00:32:41 +0100
Message-ID: <20240520233241.229675-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520233241.229675-1-salil.mehta@huawei.com>
References: <20240520233241.229675-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: fYoIuJwdbiLu

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

Received: by 2002:a05:7022:52b:b0:7e:eb73:5b3b with SMTP id 43csp991147dlj;
        Fri, 7 Jun 2024 05:00:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWa0ThYyC839E40xPJezVbxHtoj6RPie6XEsbuS9oYNMMM/v9Hm81chdBIU2syG/9xcgjFI/eMSjlXVo/R0BPrp16o6wgO8
X-Google-Smtp-Source: AGHT+IHVyKT78l3DhnDzZsGwd0CUEeto6aYdBE8/ak16xQ7CnfHpY+ompMsjMsmQi+Q6ToAxiuDp
X-Received: by 2002:a05:600c:3b92:b0:421:716a:9567 with SMTP id 5b1f17b1804b1-421716a97e0mr7438025e9.40.1717761649837;
        Fri, 07 Jun 2024 05:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717761649; cv=none;
        d=google.com; s=arc-20160816;
        b=bdjFmgI7U3UsMFYjcibYGfMct5LYhyaYn3rR30N2Lf6O3XXrzctTblrJexPAHWwDvr
         0u2d3b7kGqLWOQjs/7/QiFvOCnAzqFGl9jpipgl7nvoXPsC61NtDOrGk5OLi8OP+kWrB
         qMUkjt8o28yBmxYUZ7iuromV3q+e4Omr4dSYEtJYG2B847jvcxgmzpL7060NzdX7Qot8
         daNxPZngD/VEONF8722xq5n7bV8TUHk/m5Hf31WTVUBjd60f18P7PfgaWClNIwUlAF8I
         39l0hvF9Zg0ADUCoIz2yMycJrmXRb0iFTomfbyMz4fYeO8l7ROeZkNcaEpLLZCvdvxOB
         rqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=s4VgJcpSG2yoyDOfikjoGabf9D9tPQsRudQpzEdJvS0=;
        fh=cH6gq7hYQohuPrDBsnchzAV1+o1/H/MtYW/eo67+LEA=;
        b=p159m807EO6SykiC5UqXAPfWoGvloY9KAsprGR3LcoF37yRmdCTSEsCKUqsbKoN9Mn
         tPQ/ACX6MZA9Elhy4oI+j3vk9urda+9wa7GonlMyqspR7R0o46dvtYhpgKwQFMFgEdUN
         MOIDAZ0ya49AJMBjLagSlV39dPauoMK6u+jcPULENeoZTeTbkwehN/T8Sy6jvwqtCk/J
         OY3EWpXCEKgtSTv4MmdMXzBMxOQHQxwMt0ykDtBHumcJbubrrEvSeN64gx/PLgPBjqsV
         IqiMg/YRVJF9A8sKfCcBHH4KhXK2ebNtD7EuxWkTG1QfEBOSAZ5TtBSlwmH2niaK6rN+
         5iew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4215c18b911si21490455e9.150.2024.06.07.05.00.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2024 05:00:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VwfrQ48lyz6H8j3;
	Fri,  7 Jun 2024 19:59:34 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D3A61404F4;
	Fri,  7 Jun 2024 20:00:48 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.48.147.102) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 13:00:26 +0100
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
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Zhao Liu
	<zhao1.liu@intel.com>
Subject: [PATCH V13 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
Date: Fri, 7 Jun 2024 12:56:49 +0100
Message-ID: <20240607115649.214622-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607115649.214622-1-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.147.102]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: m4XQNg+8cx45

GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
and non-hotplug events like system power down event. Each of these can be
selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
the CPU hotplug event.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zhao Liu <zhao1.liu@intel.com>
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

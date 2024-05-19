Received: by 2002:a05:7022:fd07:b0:7c:9548:a19d with SMTP id up7csp4598549dlb;
        Sun, 19 May 2024 14:10:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU65ByCTnjxMtS5VkIY4/42ZO0BQBVu2MTU0oq9C5OoIiDvAzy81eNfx5SX4TjptT0Zlkq3cxm1TCeqSJkT0cmtdPp7WLaJ
X-Google-Smtp-Source: AGHT+IFXE41QQBc7RvJ1G4f4VQAd348IBthIHg8xZ0cbSW1w+oIbnfxqD36vx3RQrpliv6LC9869
X-Received: by 2002:adf:ecc9:0:b0:352:2700:3f34 with SMTP id ffacd0b85a97d-3522700401emr6163449f8f.32.1716153035972;
        Sun, 19 May 2024 14:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716153035; cv=none;
        d=google.com; s=arc-20160816;
        b=PhPV+ALU9ofIkvivUOzKnSl0rVHfW+Xpqd9gThpbpcVK8dyoZ51bvv4siiBUFikMvR
         egGq9YR7vq7uUWqaIPPL3fCMbSNOrX5s9Da7I5l4TcGIz817LumUswiyIXqBGrBDZ6jd
         afllSu6d2ObK7Y+xagn0veemn4xkczFzDxXIkdXBBw8BlvtBiGn/CCb7wzmLeCQj9Eyp
         nLhANmNhdxrSNWZCR1twCNI47mwzo1WohlkoH2ywov5bERZlyx68pOGUCZf8RGymmCHa
         yAgtFdZuMUxTYAlDtPvhh5RuPAx96EiWejThOm4fWnJYtPzO2IqBtfkxIgJiqEcSbt9J
         HAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=uBUJDLrGpdWmnp4ClXutksJ3WX3nuq0vvvTIEOir7yo=;
        fh=M0HTAxrI6BYZKxYd63sfeObsGy+Uhk81OO6h++LFq4Q=;
        b=lvVfrd3hTCw4ZOMtp4uWsqIDDPJuhVVyhrms51W/w64NoBZCrDp9xJ0T9OYZfBNvRt
         pqXcp9AgJCFTHkzAi8ilICJCeVt4UziJ9l1AFaHSmK/v1zyLOQWCn1PYfhlvvVYQtInO
         JihrBgQ4ER8Ju2ss4ovNmOz9MuDmObNpoHpQ2Urm2of5X7vSAMKhdNjYGFa9DQG+cxub
         SyJWRNyRZFaDHtRmmG7yPhFCDgROjOSQCGmiFh9ziaZntYXNC03v13bj67S70UqfPG54
         1jq4R+U03/74+BeBFdLwlh+hOYK2NQOvZCGR1cWAGSfK7OLV80s6Saly6Fv2EENeMJyv
         cPhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4202db09feasi43486475e9.95.2024.05.19.14.10.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2024 14:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjCy462pZz6K99D;
	Mon, 20 May 2024 05:09:48 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id D52321400DD;
	Mon, 20 May 2024 05:10:34 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 19 May 2024 22:10:14 +0100
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
Subject: [PATCH V9 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
Date: Sun, 19 May 2024 22:06:20 +0100
Message-ID: <20240519210620.228342-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519210620.228342-1-salil.mehta@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 0m3YDBIbmOh4

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

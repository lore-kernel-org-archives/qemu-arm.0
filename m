Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp902156ejk;
        Wed, 29 May 2024 16:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUi03QNQg395G6LgE6x70TC+b0XoYF1vAuHpWiFGu/uLuXeSgk+5IGCpAo7dF3ddVSCb/BvD2uvkSVXhu71fmMGzZCU8rkd
X-Google-Smtp-Source: AGHT+IHKC1Xpt881YowFD8HG6TtQHgRomTm+359Q5LOfBIfgtduxlOtRGqFmbP4pDK5+DYJLxYJy
X-Received: by 2002:a5d:4bc3:0:b0:354:fb80:b515 with SMTP id ffacd0b85a97d-35dc00be9c7mr349965f8f.47.1717026389952;
        Wed, 29 May 2024 16:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717026389; cv=none;
        d=google.com; s=arc-20160816;
        b=hdehxJ070nyA57b4jhoMLIvPW/aPd6Pu4wjw+RR10Jnk+Jlw9tFrLGos99IMIPrCsM
         r76ZbM2KxfXLUwRl1XRT9oszWR8diynyCA5luTNp1lVI9HxzydoxCPf6H6KOnWc6+zFA
         31DXDV9gSlFqt3EBYmtP9Mr47cbJkc2Yfp2RQX97i8zp6UT0eT0J4PNdeP4VSvJyTL+q
         sz0s01L5XqQJsaRa8yjktJfPKqzzR2sLI1AEBIx9On20geHJWcQ+wHy1LpkTlZ5CU8aY
         Vvdj7kZjQY3YSDM+g3M4+tHeaA+vH/Fc7J0Q0GX3wrkatDRHSadoUm1q8Bt8KXLS1+5N
         efVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=s4VgJcpSG2yoyDOfikjoGabf9D9tPQsRudQpzEdJvS0=;
        fh=cH6gq7hYQohuPrDBsnchzAV1+o1/H/MtYW/eo67+LEA=;
        b=AIuLCiavXJtP36Ey2xODfOZFMwq6DyTaWzTkQ1IBtdYL7IAO3rrBSW2yCgSurpOutZ
         tKIfNF9p5By4FYMhbnTXLLw+oGLpXuMWbZmHiMj1qyx0qvaQUwJvLKT9kdU4+9nGI0pH
         /D7L6YT3Kem+t7zFHEwe/ZPQrdxqcsmaSScZCXCMPcNnnXQ9Fb0SHD7k6hvCu5yYtUqU
         WhDUu0nO+AV0X/JPWqaLafAAl75pdeUXQwCSJSB5M9KpVz393+OMIWaZ73J/d5ntxYQP
         sxENsXtJ354GjFXly30/8SaSH3gKxCtUjQbYHyYyq/Of/7fIFNHxZiaVUAN3AEUHVHnl
         u4bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-359e8e6d866si3897040f8f.701.2024.05.29.16.46.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2024 16:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VqQsc4dDcz67pJF;
	Thu, 30 May 2024 07:42:28 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id F08BF140B33;
	Thu, 30 May 2024 07:46:28 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.246.47) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 00:46:07 +0100
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
Subject: [PATCH V12 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
Date: Thu, 30 May 2024 00:42:41 +0100
Message-ID: <20240529234241.205053-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529234241.205053-1-salil.mehta@huawei.com>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.246.47]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: VNfSHewvN6Up

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

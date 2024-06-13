Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97557ejr;
        Thu, 13 Jun 2024 16:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0XRlzCFYrkTJb84Viun7DO+EUZeTFQnb3W5WS2OSxISJZWdco3IUHqwC0Md560UY7EBATFIeQScuw91D9ZUs6wfQDNO08
X-Google-Smtp-Source: AGHT+IEfMeSdqni/Wsv5qtmhbSN//eLt4bLhpdO73LnCqGZjSRXIz3sLj+7KGAsFvqaMuDHzbW07
X-Received: by 2002:a05:6a20:12c5:b0:1b2:b16f:3b26 with SMTP id adf61e73a8af0-1bae7e22a3emr1373551637.7.1718322083991;
        Thu, 13 Jun 2024 16:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322083; cv=none;
        d=google.com; s=arc-20160816;
        b=W4Bl5Kw3ZTYualVsJBkbrC7/4dF8Bo381fjivXKVXwupph/4OCJ/4s2j0+a7WKbEC9
         rBSV7C2xBR4Sgx5SPciC+2dhLH40/UkXGCyAvIsVJU+rSrnkz35btRk0SHCp8mH1gRAB
         c9txc7IEb4dUW5yEW80o94Wa9j9kVo8KTDy75jXmNrw+51WhoNhbOo3iBl3Dzm570TGe
         O4gC9pg3tmYjpRu5kblTOJPsqiXky4rn5I3ryKIof2J8iF3Bi4ydeeFHY7wh+SOtsYW+
         9brYcFm1XI5IY0dTqPnnvLCZCq+zVo7LPSMnho/nPpHjUfdAN4iAw7Rz5hOHu6aH6/nW
         cwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=I8IYfPCa+0Q93TssD9RzAI1KnwBHiX37853PPp2+BmY=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=nkxY2Fij0S1zD6DXBkjX+JncrDtfPLj+RFscsih8eVX1kKHzIyvcOCjom5+ai0n7BS
         USi8FWYVFa1vjX6mRoMofpzU5xGqVwnW49l8OVTXBSRnYsJh07dZIVZEpRCKNsQYeUwj
         IgDrx7Ty6GbSTyCYLW+nMs6QBg+GGGAki8dAWCPcLqiNa0r5wXpEwndVcdQlR8GatBuG
         2c8EziWFRJbxpw80lAdlaUlplZJasEoNo6NvLV/9kE37Dvg5yyDLpc14pmyvKuoz8CrO
         be6hgug25kF8tTwvIGkPHpva9AlQHFeFca0gNxghPp6BqFORkJwo/s8UePNOHpmMR6dc
         J6iQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 41be03b00d2f7-6fedd5e8997si2174370a12.3.2024.06.13.16.41.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f1w2Fbvz6H8xV;
	Fri, 14 Jun 2024 07:36:36 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B92414065C;
	Fri, 14 Jun 2024 07:41:18 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:40:56 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 09/29] arm/acpi: Enable ACPI support for vcpu hotplug
Date: Fri, 14 Jun 2024 00:36:19 +0100
Message-ID: <20240613233639.202896-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: sTbBq1dhyUXC

ACPI is required to interface QEMU with the guest. Roughly falls into below
cases,

1. Convey the possible vcpus config at the machine init time to the guest
   using various DSDT tables like MADT etc.
2. Convey vcpu hotplug events to guest(using GED)
3. Assist in evaluation of various ACPI methods(like _EVT, _STA, _OST, _EJ0,
   _MAT etc.)
4. Provides ACPI cpu hotplug state and 12 Byte memory mapped cpu hotplug
   control register interface to the OSPM/guest corresponding to each possible
   vcpu. The register interface consists of various R/W fields and their
   handling operations. These are called when ever register fields or memory
   regions are accessed(i.e. read or written) by OSPM when ever it evaluates
   various ACPI methods.

Note: lot of this framework code is inherited from the changes already done for
      x86 but still some minor changes are required to make it compatible with
      ARM64.)

This patch enables the ACPI support for virtual cpu hotplug. ACPI changes
required will follow in subsequent patches.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8b97683a45..e94f19a26a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -33,6 +33,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select ACPI_CPU_HOTPLUG
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-- 
2.34.1

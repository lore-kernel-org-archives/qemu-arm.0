Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp981404ejc;
        Tue, 26 Sep 2023 03:08:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGodPdOCZMTyGWAvuT1HVho2m99HjfRAzRJnf6oXL8YTgqkGDvB9in11Cy2f1nmXZwVIUtT
X-Received: by 2002:a05:6808:1486:b0:3a7:5cc1:69b0 with SMTP id e6-20020a056808148600b003a75cc169b0mr12763768oiw.7.1695722920213;
        Tue, 26 Sep 2023 03:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722920; cv=none;
        d=google.com; s=arc-20160816;
        b=tPbpRJDkQHwvwLBsZezx8YWuFQbFyfhpj3Uz9HnUUBq49vS3O2sr2GGtuAA2vRtWE0
         RXs0wOsxRBAkGc13u7xYVub1LZonrPmFOkKUWTLr80xTEefTxlrgmctT4oTmxK9kmpjI
         QfbH99wOagxK8ZXsF64Y9nkVfqMrR5/xfke33BjizPvBs+E9UY3yPB4UrciapX60QlIP
         K7SRdfe2oLU6VLlI0SP5ndoHHcDGiFKz8ktb2Wg23dNbNV13g/h0MVVrtN5mwhrFPaqI
         WAydqdkJC+yT9IfJP2W7SBRWQ9opy4tuBgjDpxOo+lfeUAlT2zAmeDWT+7wkLK9mPUnS
         5csA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ddOt9Qoh1Ni9v7k426KyOJ0oo3XRJxXCBiuFxJXdnpo=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=jhZE+MU0qm9iLNMVxu63xpg3KAQ4pc8SZTIO0b3bvOBAgKv//4vbBbc6CwAEX7vUIp
         b40VuhocLYQGBSPojGmpwssZFlCciO+0ryX4zuozzleVwqkJzug8kmhtdhr9EsR4osk2
         VOG/ggk4vMEMgsDcQEoxBAaDL+zMVh6iJQ3cizXx0fEVsDSXw8zXv5/GVOHfPdNF3u+H
         2aRP0YDmpozZT4mIEOIyJnELgLze2/U/I70uJnZ9W5VfCiFZsDfstmRSzJTcFWbWV18N
         J65C2l1AdhynMLG0uGpHdd/abxwtnZLsFuBtE34VCtPErOiI2wCuC0MgKNLGmD3pNfbX
         hRSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 36-20020a631564000000b00573fef93a87si12091123pgv.834.2023.09.26.03.08.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwQf2xDXz6K62N;
	Tue, 26 Sep 2023 18:07:22 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:08:17 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 10/37] arm/acpi: Enable ACPI support for vcpu hotplug
Date: Tue, 26 Sep 2023 11:04:09 +0100
Message-ID: <20230926100436.28284-11-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: lAz/X1RBrBqF

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
index 7e68348440..dae06158cd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select ACPI_CPU_HOTPLUG
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-- 
2.34.1

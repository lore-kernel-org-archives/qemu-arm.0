Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1087882lfb;
        Thu, 16 Jun 2022 07:19:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWGikxqOlKz36UOH4sVyNYG4pJkVw/EIXALVnnOH/8mLYbKaMOqlRCbS8zV1Lvp6pK0ayf
X-Received: by 2002:a17:906:7793:b0:715:7b:4e9f with SMTP id s19-20020a170906779300b00715007b4e9fmr4502583ejm.117.1655389183017;
        Thu, 16 Jun 2022 07:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655389183; cv=none;
        d=google.com; s=arc-20160816;
        b=ECQobw2gAhVSx9ZQ0PpAZghwWoChJzblQ1ZqusdRwAUDIorQYa4RRQUkNkyz45m2kS
         HspfPXUz3UIVe8k+ADPGGM4tNC5J5ycqGDSk0rFPtA4WRlo9331ZJCDusFLeXDp83t6o
         m4MlhMdsoIB9OXknLXsJbR3XRYJHzfOT9Th0Vhh8gbX2er9f250vqNILyU3O0GIiYVyb
         WtsJ8cx44D7y1o38z3hSahsK4yM1OuHzxF7LdYCEVe2vBjwX79+JSiMwVWJaZ9clTXeG
         EBXXeF/NydJ+xgc74OebniOVkYoRbIvnRhN/825pq6QTqnZfLjqPrARlZrukpbeoMT5u
         BR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=CT3zI7rAdud2CFcHWEV7kV0Z/6THEjGIbzBphCSzVkE=;
        b=gIRFsoBdJyli8KcGn5HRyeF4yMFQNF7fB23Az6gTLF1aLhMf9214WBv1VExdr+lAfH
         TQmATcmRxYiEo2EbtP/uxM7hjVq37O9VMA/2kmlDj2VATI+P108CSwOs1g9WnZrplySe
         IBXS3S4OtwFZP6/SiTd+zufu7fuHG+vQJVs6XPXa0tST75ejDStSVcJHnUqxUg5I0dr3
         NBpwMktV8I2JdbEsdWO/tz9c5AbhqiNtCQ2aTjtcp3z6/nvOXwVd1697wYoqpk1r8/5D
         Gu0eRasOyTD1HqgtPoGM597ie83ouxmqXyGrOI/9sAYsCNO4uqJ/ZsxcuQp3yCZUCMtz
         8Qhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i19-20020a1709067a5300b006e6f361280fsi1938578ejo.724.2022.06.16.07.19.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LP45Q10fbz67JpL;
	Thu, 16 Jun 2022 22:18:02 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Thu, 16 Jun 2022 16:19:41 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 16 Jun 2022 15:19:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, "Michael S . Tsirkin"
	<mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
	<linuxarm@huawei.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
	<a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v11 0/2] arm/virt: CXL support via pxb_cxl
Date: Thu, 16 Jun 2022 15:19:48 +0100
Message-ID: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-TUID: wKpyI59PxO9D

Previously patches 40 and 41 of
[PATCH v10 00/45] CXl 2.0 emulation Support
https://lore.kernel.org/qemu-devel/20220429144110.25167-45-Jonathan.Cameron@huawei.com/#r

Now the base CXL support including for x86/pc is upstream (patches 1-39)
there are no dependencies between the next few CXL elements in my queue
so they can be reviewed / merged in parallel.  Hence I'll be sending switch
support (43-45) separately and hopefully DOE / CDAT support in a few days.
I'm assuming this particular series should go through the arm tree if
the maintainers are happy?

Changes since v10:
 - CXL machine setup is now entirely from the supporting machines rather
   than via code in machine.c and vl.c.  Change made for x86 in:
   https://lore.kernel.org/qemu-devel/20220608145440.26106-1-Jonathan.Cameron@huawei.com/
 - Dropped Ben's sign off from patch 1 which resulted from him carrying
   these patches of mine for a while. It isn't a useful bit of history
   to carry now they are back to me.

This short series adds support for CXL host bridges and CXL fixed memory
windows on arm/virt.  Two types of memory region are needed:
1. Register space for CXL host bridges (static allowance for 16)
2. CXL fixed memory windows: Ranges of host PA space which
   are statically mapped to an interleave across 1 or more CXL host
   bridges.

Both of these types of region are described via appropriate ACPI tables.
As the CEDT table is created with the same code as for x86 I don't think
there is much value in duplicating the existing CXL bios-tables test.

The second patch adds a single complex test. We test a lot more configurations
on x86 but it does not seem useful to duplicate them all on ARM and this single
test should act as a smoke test for any problems that occur.

Run through CI at:
https://gitlab.com/jic23/qemu/-/pipelines/564934276
Intermittent (unrelated I assume) failure in msys64 aio-test resolved
with a retry.

Thanks,

Jonathan

Jonathan Cameron (2):
  hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
    pxb-cxl
  qtest/cxl: Add aarch64 virt test for CXL

 hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++
 hw/arm/virt.c            | 44 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  3 +++
 tests/qtest/cxl-test.c   | 48 ++++++++++++++++++++++++++++++++--------
 tests/qtest/meson.build  |  1 +
 5 files changed, 121 insertions(+), 9 deletions(-)

-- 
2.32.0

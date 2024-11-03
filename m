Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1489589njc;
        Sun, 3 Nov 2024 02:26:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW5XiTj46k9/nambRuQAjAV+veHCrYyu5XRZkAqDsU0rjOm/aKQjG4v6l9TCBdIVLXrbDkTvZ8hJgdJ7w==@linaro.org
X-Google-Smtp-Source: AGHT+IEgbmQ9LTL8cSqtJeup5K5vZbq02/33FYSwgTsFqMv9c0dIYW3UlyQZDtWPeBZoXH1IChv4
X-Received: by 2002:a5d:47a7:0:b0:37c:d1e3:ebd2 with SMTP id ffacd0b85a97d-381be7bae19mr10905864f8f.29.1730629565299;
        Sun, 03 Nov 2024 02:26:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730629565; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcqsZf+YMYAz84WqKYIlTXYYIAlusB4g/cfko8B6R/A/8zQTg9JeWKgrSn/Df5Dr8t
         rug98GwNt3Gj+emZER116qqI/gqzq+lyi5yhpx1NGDxFx2YvE3Y/gMwIdNyX1Rms1yqP
         kj++E04VEV6IHs1byTho+TTvdhIhRl+CIGSmVIV3qBiaHd9qCY/R4/g8GGD1+0ZdtIFa
         RAK7J32pHKS9UNAByJziy0IgnPG8Y9CtitGYeGn6FLn01mSBxs0OGAKiqA+gcyYThLYF
         rE1uPukQhZV9lxyUgJhd9WtPpFpaZbOjBtUjhMe++UCJaAlpuChc/CXYFd7ozMe+Kx5v
         lgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hzsP50dTkGg2PCAvMRdu2Rly35OsPtIkf1sK9CN2ySM=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=FR7Wx2stvvaOKwSr00FhiRrERPUi0Lw/iMBAXcORO6IGpqd0hwh6EGxtLdJnkkMFjU
         uNt/8t3FcJit9iRQi4M2Kv2UE+CsuyS7mOAdNpmacDrGe0rmJ6hOH3czk/EpTBe64a2h
         67R8CocqpZGeZ4Gzcxh1h35fu2NGNIWvDD3ULUPHldPNDaVIc4AyFnxe90ZR0LYtGrWE
         O2Gh9Ae3u8HCaejqz8T3JrGVDwykE1y3Ul3Jo1VvegiR60HqTbqnP0ov+3QvvkvIEHG3
         Duo6nHZPyWsKiV4VlV7IRxd8bZX4OufW28nNncNotIhUNzRvmjfed+vLMTtLDuLZg0X3
         tuCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c11aea9dsi4843390f8f.756.2024.11.03.02.26.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2024 02:26:05 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xh9fl0pRWz6K5qb;
	Sun,  3 Nov 2024 18:23:27 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 6913F140B67;
	Sun,  3 Nov 2024 18:26:04 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.154.43) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 11:25:45 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH V3 2/5] qtest: allow ACPI DSDT Table changes
Date: Sun, 3 Nov 2024 10:24:16 +0000
Message-ID: <20241103102419.202225-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241103102419.202225-1-salil.mehta@huawei.com>
References: <20241103102419.202225-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.154.43]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: MQCJGhmUC3PL

list changed files in tests/qtest/bios-tables-test-allowed-diff.h

Reported-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 41 +++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..512d40665d 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,42 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/x86/pc/DSDT",
+"tests/data/acpi/x86/pc/DSDT.acpierst",
+"tests/data/acpi/x86/pc/DSDT.acpihmat",
+"tests/data/acpi/x86/pc/DSDT.bridge",
+"tests/data/acpi/x86/pc/DSDT.cphp",
+"tests/data/acpi/x86/pc/DSDT.dimmpxm",
+"tests/data/acpi/x86/pc/DSDT.hpbridge",
+"tests/data/acpi/x86/pc/DSDT.hpbrroot",
+"tests/data/acpi/x86/pc/DSDT.ipmikcs",
+"tests/data/acpi/x86/pc/DSDT.memhp",
+"tests/data/acpi/x86/pc/DSDT.nohpet",
+"tests/data/acpi/x86/pc/DSDT.numamem",
+"tests/data/acpi/x86/pc/DSDT.roothp",
+"tests/data/acpi/x86/q35/DSDT",
+"tests/data/acpi/x86/q35/DSDT.acpierst",
+"tests/data/acpi/x86/q35/DSDT.acpihmat",
+"tests/data/acpi/x86/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/x86/q35/DSDT.applesmc",
+"tests/data/acpi/x86/q35/DSDT.bridge",
+"tests/data/acpi/x86/q35/DSDT.core-count",
+"tests/data/acpi/x86/q35/DSDT.core-count2",
+"tests/data/acpi/x86/q35/DSDT.cphp",
+"tests/data/acpi/x86/q35/DSDT.cxl",
+"tests/data/acpi/x86/q35/DSDT.dimmpxm",
+"tests/data/acpi/x86/q35/DSDT.ipmibt",
+"tests/data/acpi/x86/q35/DSDT.ipmismbus",
+"tests/data/acpi/x86/q35/DSDT.ivrs",
+"tests/data/acpi/x86/q35/DSDT.memhp",
+"tests/data/acpi/x86/q35/DSDT.mmio64",
+"tests/data/acpi/x86/q35/DSDT.multi-bridge",
+"tests/data/acpi/x86/q35/DSDT.noacpihp",
+"tests/data/acpi/x86/q35/DSDT.nohpet",
+"tests/data/acpi/x86/q35/DSDT.numamem",
+"tests/data/acpi/x86/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/x86/q35/DSDT.thread-count",
+"tests/data/acpi/x86/q35/DSDT.thread-count2",
+"tests/data/acpi/x86/q35/DSDT.tis.tpm12",
+"tests/data/acpi/x86/q35/DSDT.tis.tpm2",
+"tests/data/acpi/x86/q35/DSDT.type4-count",
+"tests/data/acpi/x86/q35/DSDT.viot",
+"tests/data/acpi/x86/q35/DSDT.xapic",
-- 
2.34.1

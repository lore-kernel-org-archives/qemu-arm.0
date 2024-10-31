Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3479njc;
        Thu, 31 Oct 2024 13:06:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7soKx53qiUjs7h2vzRTcLFUpLuiDwOOhANgeTnbb4hTVqlczKy9r1Rm8qG3sSd+rpR6wPG+C9+zt1/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEQTr3eROCUsfj/HxCXpMFvT7rpK5LLz+MhUncJof0ldQKL2NOpIZdNS41yuWMXEhweoluL
X-Received: by 2002:a05:6512:128a:b0:539:f2f6:c70f with SMTP id 2adb3069b0e04-53b7ecd58cdmr4266768e87.8.1730405208288;
        Thu, 31 Oct 2024 13:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730405208; cv=none;
        d=google.com; s=arc-20240605;
        b=NEtcyisQbLk1LTHsM1NhDQSHOBGMp5LQzo6R/RH04VFxM4AyhyhfNHN7mcC6DCg8pG
         EmXGTc5Q7sng9bffgdO/LRw4umxRgtpSSCxnW1ZffBMHX3odADmuEhtHre7iHZ0npMF9
         0cPJ7kGQ8LlN9OnIzAYImj8MmORjpkGJGJRVCX4bWIex1y/QpyS23K/w1Bl76FrPdsN+
         w7BUWWhzxS9PuMG4jUWZrWoGdTr8hdc+cO8mQC0xraqnwS2rfDvxgYsG02i/OYuoyLa0
         cUkcnV1bYcaVfCJnIX4Lzofy/CtTQr74Bdqv4XSUoED2uOvXnLBUu4E5rr7GB3pBlxWQ
         IWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hzsP50dTkGg2PCAvMRdu2Rly35OsPtIkf1sK9CN2ySM=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=LEAI28gCvTVTEmXhFMazZziC5+T6EZzodQ0veEnX1nPdaM8BGk0TbGIDga53SSH9+m
         StxSDoQueafiHVJMZirdthn9TUwsKDuODg7PRhMrdp0cI31zFroH2EupUkCVkyEtahvf
         2MJhzrLmxqI3c9ikDxvDtgtSO2nkhc3gaxKXLUl5gKou0UrdWlCwnpumlaY44bVh17l7
         ooU5bD1o0QoOIht58SgMcka612FhMhWZbA3MzJEX/clEVIBV1PJI9aPisZh5mEee5351
         0LI0NOWA+SkQf4qAhuPTxsSd8kmGdNsr+97Fx4x0cQwIj1rDdm9wMleuA2GoepFNCdH/
         y2Pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c1176d18si1480472f8f.493.2024.10.31.13.06.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XfZdZ2mSnz6LDK5;
	Fri,  1 Nov 2024 04:01:54 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 63E2414058E;
	Fri,  1 Nov 2024 04:06:47 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.152.207) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 21:06:27 +0100
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
Subject: [PATCH V2 3/6] qtest: allow ACPI DSDT Table changes
Date: Thu, 31 Oct 2024 20:04:59 +0000
Message-ID: <20241031200502.3869-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031200502.3869-1-salil.mehta@huawei.com>
References: <20241031200502.3869-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.152.207]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: C9eMmSPwPmw+

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

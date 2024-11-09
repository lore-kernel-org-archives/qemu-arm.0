Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5290138njc;
        Fri, 8 Nov 2024 16:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVh3HD9EPA3LEWHxtSdfl6IIgVVsDuaKANSALPT5V06ZUeyEZoDlCFV92mipsFf6R/TMRG79LsrDPxNeg==@linaro.org
X-Google-Smtp-Source: AGHT+IFkPcAm+m3L1OIV6pgFf18q25VCUOn4oktm6/8iGdmelh2CLAU8Rfgx3NyDN8wDS93kWFp8
X-Received: by 2002:a05:6a00:1307:b0:71e:6728:72d5 with SMTP id d2e1a72fcca58-724132c1a44mr6667766b3a.15.1731110893719;
        Fri, 08 Nov 2024 16:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731110893; cv=none;
        d=google.com; s=arc-20240605;
        b=cwxGjw4fkvp80myGbk5QIPmRK8QVfXVNX+UxlL8b+CwNxCGm1ha0eEGHTbuWsBpFlU
         bny9IOkLLDqRT78CIwh+zR2EvEF/YMEWb0YjXr0t7kGL+xeaNx68KCCJnSlq47fPY4mx
         XHCdmE8TpsmMGpZToAymR0I/WrjQVnsGh8GQUBh4rjfuepsGdoqU2wu2TQRGtxc6pDhW
         k1N0g99Ktvuf4Tmnn2lNoqYn+wjsXhwdwxgLeiAi5aEA9NW+2UsBOUYhEj6K1Njz0dnt
         QTwzqRoM9RA4nGFYIjIGNkn2R/Dk6PJ7T9wdXTXyNgulmlYA0I5dZ0qJOJv+z1AR99UE
         9wDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zoGAge3NNc2l2OYbk7DrC6lUB/HWMMEBkCjVJ5sqCio=;
        fh=r8ajd3FUMdtDxzqs0wLEINYA6psD113amket9C+CNXU=;
        b=d7V7KWVNweJVibZeTnh9oILf9PdyjNanoXJBcjWJZcWv5PX57XQKh4xITExG7A5zp5
         ButUVOLC71qoDtu5plLND0Q7hI9rb9Iq7wyF/GEL6k7FzXJg20ubSX2WQ+AdMZTk++5G
         v0/yfzwhbacuNqkyQB8ULvTBh9b+EgO5GkgSvgXxsOexihi9XFdlSjTEuoMoX9bt53OW
         nFB3zHVA2LAk5HH6+1bFr4Xx8iifxmRSpVIEoRNpQHL3e9wyO5yMYcjd7gWTlxfyx5PQ
         SbR6HDLuZNzk9A0TSwa2JQfyXHo+cl23Sr4JM8rUflwaUjKddj6pgsyIGSrxxFl9i4OK
         CHEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-724078a2329si5669602b3a.83.2024.11.08.16.08.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2024 16:08:13 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xlbh31hv3z6K5VY;
	Sat,  9 Nov 2024 08:06:27 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 970BB140517;
	Sat,  9 Nov 2024 08:08:11 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.150.69) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 9 Nov 2024 01:07:57 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
	<imammedo@redhat.com>
CC: <salil.mehta@huawei.com>, <jonathan.cameron@huawei.com>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<anisinha@redhat.com>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
	<david@redhat.com>, <philmd@linaro.org>, <peterx@redhat.com>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>, <zhao1.liu@intel.com>,
	<linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: [PATCH V2 1/3] qtest: allow ACPI DSDT Table changes
Date: Sat, 9 Nov 2024 00:07:26 +0000
Message-ID: <20241109000728.206825-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109000728.206825-1-salil.mehta@huawei.com>
References: <20241109000728.206825-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.150.69]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: b92MGb7wy6/2

list changed files in tests/qtest/bios-tables-test-allowed-diff.h

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20241106100047.18901c9d@imammedo.users.ipa.redhat.com>
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

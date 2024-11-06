Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3493802njc;
        Wed, 6 Nov 2024 05:04:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUASvjKhWdO4s7C9h0TZ59wHtE4xHFz7bd8bpLXFB8aLLI8zaAVfkn9l7WhekNUe87AyOrwI5u0z8v+6A==@linaro.org
X-Google-Smtp-Source: AGHT+IHh9oyWV86YJmJ+mEyHdyHC1v2r7mACr+5BIGBZcnW4mtizQqaFsZunB+drYHjSl0u5QUUd
X-Received: by 2002:a05:600c:4691:b0:431:4e25:fe42 with SMTP id 5b1f17b1804b1-4319ad24a5cmr353390205e9.32.1730898267518;
        Wed, 06 Nov 2024 05:04:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730898267; cv=none;
        d=google.com; s=arc-20240605;
        b=NeFAyB5IpYKT4OB3phC1RinTGvFVKFEcmttpLnewx6DGOjkKbX48Kqif7jLEpM3A0Z
         N5lV7jQXulm3vmeDA5VOPUIvR9CMVsBXlKSzXQlAcNV9wQ9+5wrabZLs0PlARRe13c00
         tCb1/wpZv528cwSz0jFRjyjaGUxz8i6NtPl37ogyg77DhnE82Dw1PtPoGj5TUthjpyLD
         z632k0HDPfsDzvqUc590tYNcitbVqFuHPT0I2rubJXEGMJYe5KOqErmUH927ReVE3nje
         CcSC9FbV0beXAji7ePv1/LvYY6S3knc27DguAJKqT6hqKpw/NXEEMCsOCboEdyGWZnTv
         fpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zoGAge3NNc2l2OYbk7DrC6lUB/HWMMEBkCjVJ5sqCio=;
        fh=r8ajd3FUMdtDxzqs0wLEINYA6psD113amket9C+CNXU=;
        b=cm8RgOlUqoqtV0StwtQlP9WsoQae0xCK/zCrQ0wqlgJn5IL7kmV6lb3aO16u1R96xW
         RDJLJC7RTfMj/Bw8KvdQ7eJIzQnvMfdjX0qWkapaV8biHbGOjOmM1cmq6WRRgfPLdZqv
         s4kuFtMNQiiZF8dzBlBehvT8lou9Egpk9uTbQAGoWjrSrP1VQ+YNvRTOKyBtOtX43Zzx
         hIvTo0bKHfPAqtM7EBDB/qOwOgN4WKqgjb2NHHnZPdJhUBfmLselpBEsE3296ylgzwe2
         VAZ58D6tB7vSrOI3eNsCwfXhyNIsSJSeBqCvl3/E7n9gIm8Uluci1EwQ5drB5Q5AUtX6
         ejsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-432aa756012si9283815e9.205.2024.11.06.05.04.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:04:27 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xk51t4r2qz6K6vm;
	Wed,  6 Nov 2024 21:01:38 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id EAB23140B33;
	Wed,  6 Nov 2024 21:04:25 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.112) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 14:04:11 +0100
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
Subject: [PATCH 1/3] qtest: allow ACPI DSDT Table changes
Date: Wed, 6 Nov 2024 13:03:29 +0000
Message-ID: <20241106130331.205020-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106130331.205020-1-salil.mehta@huawei.com>
References: <20241106130331.205020-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.170.112]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: Wx9aGklwFJu3

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

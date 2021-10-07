Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp950519lfp;
        Wed, 6 Oct 2021 20:14:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDyEhqN+hxmD8BIMjYgi73bxbbzaPIROwImDSiQ9v6QLekvtIUnlfFMKVCR6KE1sVeePGr
X-Received: by 2002:a37:a858:: with SMTP id r85mr1381397qke.5.1633576484907;
        Wed, 06 Oct 2021 20:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633576484; cv=none;
        d=google.com; s=arc-20160816;
        b=CA1B5n6ViylCFjFxR7xDMFTuX2BM5S9pY9ZN/XarQLfoalhJ98TbxKxdPkxCJuU/ZX
         glmO9CNju/lH81vV7WddYVpqdELmYcUE5fnYgk60XZKMMa0RcPoW5QgDNZtoXp0XLLuF
         26D4YewD9eaN8/J3Eybfxhb15MQnXTwdUK7KWVYAgj3jghiIbao9DdAku3BmOHngfUBN
         jChx+PAyZpX1Ma9viJlURrm8iDfi2+Dc7em4+3Jyb+q7EeRMyt51LhSx3X/fuWZWN70l
         fkjFysE5ZOaikISRUbYl0bpo340FAqAAlIqZmQ0GAcWUuEczqX0jEklrPLpeo2NS6L8L
         koWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=LFPGxQ5NsZIi0GX3NZtxlN6sFvpG62mPnZh9ji3Tt8A=;
        b=0q3N1xG0jKuzxLRcnFLfJf/hV510+j3MEBAEJ7IJgKfT2ERi6qbeM5gVgEbXLcoEGy
         h9mUZJZnsqyDPI5fWQVckVkIVWHfN3WY3xzaZa49pkCI/yPIIzWbtGKgo8yQHcetPwPD
         2DQkXpRmZReH9G252HPMd/kAt+vvc2H6ZuPzjnNX6c5/WNMdqFADTqbmu3YGVP8kvbZM
         z2bEzgH18aGCLgGGJH+zXL2+b/cgQ6CQggjsHaXgP0aYq/WzIyq9vKYM7nMs1GY5hdCk
         n4t4e20NH2PWQ24ARCZvqyPntTsn4rDkMrLHQkDxSo0ZZxJxZKKUJEsmmkWRrbATO9jM
         PsMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si12153572qvi.201.2021.10.06.20.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 20:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:48862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYJro-0007X1-8B
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 23:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlU-0004rh-CP; Wed, 06 Oct 2021 23:08:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlR-00018m-6W; Wed, 06 Oct 2021 23:08:12 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HPx3W5WKSzbcwt;
 Thu,  7 Oct 2021 11:03:35 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:58 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:57 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v7 8/8] tests/data/acpi/virt: Update binary files for PPTT
Date: Thu, 7 Oct 2021 11:07:46 +0800
Message-ID: <20211007030746.10420-9-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007030746.10420-1-wangyanan55@huawei.com>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vwDduXHE8YDm

Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.

Disassembled output of the updated new files:

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180810 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 *
 * Disassembly of tests/data/acpi/virt/PPTT.pxb, Thu Oct  7 09:58:26 2021
 *
 * ACPI Data Table [PPTT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
[004h 0004   4]                 Table Length : 0000004C
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : A8
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
[025h 0037   1]                       Length : 14
[026h 0038   2]                     Reserved : 0000
[028h 0040   4]        Flags (decoded below) : 00000001
                            Physical package : 1
                     ACPI Processor ID valid : 0
[02Ch 0044   4]                       Parent : 00000000
[030h 0048   4]            ACPI Processor ID : 00000000
[034h 0052   4]      Private Resource Number : 00000000

[038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
[039h 0057   1]                       Length : 14
[03Ah 0058   2]                     Reserved : 0000
[03Ch 0060   4]        Flags (decoded below) : 0000000A
                            Physical package : 0
                     ACPI Processor ID valid : 1
[040h 0064   4]                       Parent : 00000024
[044h 0068   4]            ACPI Processor ID : 00000000
[048h 0072   4]      Private Resource Number : 00000000

Raw Table Data: Length 76 (0x4C)

    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/data/acpi/virt/PPTT                   | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.memhp             | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.numamem           | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.pxb               | Bin 0 -> 76 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 5 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
literal 76
zcmV-S0JHy4P*hY*00002s6tOeNK+s}SWrVCARr(C0000&SWrU&000006aWAL00000
i0000000000000006aWAU0000a00000000000001^0tW#A

literal 0
KcmV+b0RR6000031

diff --git a/tests/data/acpi/virt/PPTT.memhp b/tests/data/acpi/virt/PPTT.memhp
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
literal 76
zcmV-S0JHy4P*hY*00002s6tOeNK+s}SWrVCARr(C0000&SWrU&000006aWAL00000
i0000000000000006aWAU0000a00000000000001^0tW#A

literal 0
KcmV+b0RR6000031

diff --git a/tests/data/acpi/virt/PPTT.numamem b/tests/data/acpi/virt/PPTT.numamem
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
literal 76
zcmV-S0JHy4P*hY*00002s6tOeNK+s}SWrVCARr(C0000&SWrU&000006aWAL00000
i0000000000000006aWAU0000a00000000000001^0tW#A

literal 0
KcmV+b0RR6000031

diff --git a/tests/data/acpi/virt/PPTT.pxb b/tests/data/acpi/virt/PPTT.pxb
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
literal 76
zcmV-S0JHy4P*hY*00002s6tOeNK+s}SWrVCARr(C0000&SWrU&000006aWAL00000
i0000000000000006aWAU0000a00000000000001^0tW#A

literal 0
KcmV+b0RR6000031

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 4b365aa46b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
-"tests/data/acpi/virt/PPTT.memhp",
-"tests/data/acpi/virt/PPTT.numamem",
-"tests/data/acpi/virt/PPTT.pxb",
-- 
2.19.1


Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5290101njc;
        Fri, 8 Nov 2024 16:08:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnboi34KML9ut7yKx8MIWZjH6W4TxT12BbQsRiumZD8Sx/NjKMA4diBXZvMxKEdQ1NouFCHnka9I7vfw==@linaro.org
X-Google-Smtp-Source: AGHT+IGHkSj628kKjB8VcpjtLdDo9miyoMJicP7QsVC/oWDiF1wtJBdU2aSXBpFyrHTI59uJdicq
X-Received: by 2002:a17:902:d4c5:b0:20e:552c:5408 with SMTP id d9443c01a7336-211835cc3ffmr62742395ad.51.1731110890486;
        Fri, 08 Nov 2024 16:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731110890; cv=none;
        d=google.com; s=arc-20240605;
        b=d9fRr6pBTPTyy++upY3U+McmWAjwCsHaAdveuXZzG9zQETiHls5tqUgnGDa3YndUzn
         6FAZd75UYH1XExvup7bsYN3tMQbypBdiVQ57STsEIcQZxEPLhMqnhQPq5lLXlHAZn2n7
         WYcexrQkKoV1fqeh9ffsF/ZKZW371vcXkH1x7znjSpW4emR+u763YC4v2Se3d/34ivQO
         KDTQJlOYkk0Hq89mxIV8mqcdTb5WhYvxDumBgbfz7Z2v3HRELjth60V40E1lPNp70Y/w
         6FQUyu3sNtTVy6X2Tb+b+TFeOXP3kjL3VVOXl/FhwmXvRfv1++1wTyOvIvkbCckVE+ap
         raSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Das08dq/GmN6T/TlYWCwd4Bq8FXXFyKErX7YTQ+phX8=;
        fh=r8ajd3FUMdtDxzqs0wLEINYA6psD113amket9C+CNXU=;
        b=YIp34qjZUWibhcVPphdB+TrSOsyPsi2v5hE3VBnh2CuZV+XM3avaJ2qyWwtCKvgg6s
         DA8WJu5Ak3cMpGLKmPWrja2X1urxpYZ9rjGryUefruAzV89ypYKUpSzsrokL6TKZULy4
         ifLRvJgAQCChrVhGthJO1BQFAcmz5/08WiBO67yGazCwMWCu+3J+Lyiz7dZDrB0h4oeZ
         1yrC9R7g/P3KPe616PXdpU91hJDIqG6ZRr2+vkGw0EFiwqxJ5Xoe4RNEhkreqW/ORxzI
         VamiF8gl1DPaHUy7YqmcX86ADHlO7RQAuc+JhhyNGkjJCmfqLahfENv0H6q4s7hSMZdF
         rvYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-21177e4a15fsi56795155ad.211.2024.11.08.16.08.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2024 16:08:10 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xlbgn0rKJz67nWm;
	Sat,  9 Nov 2024 08:06:13 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 7941D140453;
	Sat,  9 Nov 2024 08:07:57 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.150.69) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 9 Nov 2024 01:07:43 +0100
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
Subject: [PATCH V2 0/3] Fixes CPUs AML & acpi-bios-tables to be x86 backward compatible
Date: Sat, 9 Nov 2024 00:07:25 +0000
Message-ID: <20241109000728.206825-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.150.69]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 3Agvq+Tkpr3A

Fixes the the CPUs AML code and its corresponding golden masters ACPI
tables files for backward compatability of live migration on x86 platforms
i.e. when newer Qemu is migrated to older Qemu without `CPRS` Bit present
in the register block. This also reverts the ACPI ABI change introduced for
checking the `presence` of vCPUs dynamically (feedback from Igor Mammedov)

Fixes [PULL 60/65], [PULL 61/65]:
Message-ID: <bf1ecc8dad6061914730a2a2d57af6b37c3a4f8d.1730754238.git.mst@redhat.com>
Message-ID: <4d62d15b11909e9af121577e707b88f2e4524371.1730754238.git.mst@redhat.com>

Salil Mehta (3):
  qtest: allow ACPI DSDT Table changes
  Fix: CPUs presence logic in _STA for x86 backward compatability
  tests/qtest/bios-tables-test: Fix DSDT golden masters for x86/{pc,q35}

 hw/acpi/cpu.c                                 |  49 +++++++-----------
 include/hw/acpi/cpu.h                         |   1 +
 include/hw/core/cpu.h                         |   1 -
 tests/data/acpi/x86/pc/DSDT                   | Bin 8561 -> 8528 bytes
 tests/data/acpi/x86/pc/DSDT.acpierst          | Bin 8472 -> 8439 bytes
 tests/data/acpi/x86/pc/DSDT.acpihmat          | Bin 9886 -> 9853 bytes
 tests/data/acpi/x86/pc/DSDT.bridge            | Bin 15432 -> 15399 bytes
 tests/data/acpi/x86/pc/DSDT.cphp              | Bin 9025 -> 8992 bytes
 tests/data/acpi/x86/pc/DSDT.dimmpxm           | Bin 10215 -> 10182 bytes
 tests/data/acpi/x86/pc/DSDT.hpbridge          | Bin 8512 -> 8479 bytes
 tests/data/acpi/x86/pc/DSDT.hpbrroot          | Bin 5068 -> 5035 bytes
 tests/data/acpi/x86/pc/DSDT.ipmikcs           | Bin 8633 -> 8600 bytes
 tests/data/acpi/x86/pc/DSDT.memhp             | Bin 9920 -> 9887 bytes
 tests/data/acpi/x86/pc/DSDT.nohpet            | Bin 8419 -> 8386 bytes
 tests/data/acpi/x86/pc/DSDT.numamem           | Bin 8567 -> 8534 bytes
 tests/data/acpi/x86/pc/DSDT.roothp            | Bin 12354 -> 12321 bytes
 tests/data/acpi/x86/q35/DSDT                  | Bin 8389 -> 8356 bytes
 tests/data/acpi/x86/q35/DSDT.acpierst         | Bin 8406 -> 8373 bytes
 tests/data/acpi/x86/q35/DSDT.acpihmat         | Bin 9714 -> 9681 bytes
 .../acpi/x86/q35/DSDT.acpihmat-noinitiator    | Bin 8668 -> 8635 bytes
 tests/data/acpi/x86/q35/DSDT.applesmc         | Bin 8435 -> 8402 bytes
 tests/data/acpi/x86/q35/DSDT.bridge           | Bin 12002 -> 11969 bytes
 tests/data/acpi/x86/q35/DSDT.core-count       | Bin 12947 -> 12914 bytes
 tests/data/acpi/x86/q35/DSDT.core-count2      | Bin 33804 -> 33771 bytes
 tests/data/acpi/x86/q35/DSDT.cphp             | Bin 8853 -> 8820 bytes
 tests/data/acpi/x86/q35/DSDT.cxl              | Bin 13182 -> 13149 bytes
 tests/data/acpi/x86/q35/DSDT.dimmpxm          | Bin 10043 -> 10010 bytes
 tests/data/acpi/x86/q35/DSDT.ipmibt           | Bin 8464 -> 8431 bytes
 tests/data/acpi/x86/q35/DSDT.ipmismbus        | Bin 8477 -> 8444 bytes
 tests/data/acpi/x86/q35/DSDT.ivrs             | Bin 8406 -> 8373 bytes
 tests/data/acpi/x86/q35/DSDT.memhp            | Bin 9748 -> 9715 bytes
 tests/data/acpi/x86/q35/DSDT.mmio64           | Bin 9519 -> 9486 bytes
 tests/data/acpi/x86/q35/DSDT.multi-bridge     | Bin 13242 -> 13209 bytes
 tests/data/acpi/x86/q35/DSDT.noacpihp         | Bin 8269 -> 8236 bytes
 tests/data/acpi/x86/q35/DSDT.nohpet           | Bin 8247 -> 8214 bytes
 tests/data/acpi/x86/q35/DSDT.numamem          | Bin 8395 -> 8362 bytes
 tests/data/acpi/x86/q35/DSDT.pvpanic-isa      | Bin 8490 -> 8457 bytes
 tests/data/acpi/x86/q35/DSDT.thread-count     | Bin 12947 -> 12914 bytes
 tests/data/acpi/x86/q35/DSDT.thread-count2    | Bin 33804 -> 33771 bytes
 tests/data/acpi/x86/q35/DSDT.tis.tpm12        | Bin 8995 -> 8962 bytes
 tests/data/acpi/x86/q35/DSDT.tis.tpm2         | Bin 9021 -> 8988 bytes
 tests/data/acpi/x86/q35/DSDT.type4-count      | Bin 18623 -> 18590 bytes
 tests/data/acpi/x86/q35/DSDT.viot             | Bin 14649 -> 14616 bytes
 tests/data/acpi/x86/q35/DSDT.xapic            | Bin 35752 -> 35719 bytes
 44 files changed, 19 insertions(+), 32 deletions(-)

-- 
2.34.1

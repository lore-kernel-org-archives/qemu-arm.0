Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3493607njc;
        Wed, 6 Nov 2024 05:04:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHdti5rPmHAa1kHsCduf4zQoYKGnG6NSXgRvG3Dpemw9XWI0jYISU4MpZ0N9i2hacSFWRHpJr3q7eGFw==@linaro.org
X-Google-Smtp-Source: AGHT+IFSG6/iJH6LW8I3aEUeeFb+55SXWloKH/nBevrGqd/64JEbRmRWJR1x3tIyVBCasFSKzASz
X-Received: by 2002:a05:690c:c14:b0:6dd:fb47:2184 with SMTP id 00721157ae682-6ea64aec9bfmr196862617b3.13.1730898253118;
        Wed, 06 Nov 2024 05:04:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730898253; cv=none;
        d=google.com; s=arc-20240605;
        b=JbUCrpLKI4B/4CDHaeV+CN5n54TTDZbhRVnXYgFSWGSQMU7oQZtCvu+y9zA9fd42Qs
         VM0WvIBQfxtvFs1YL2hXMF3AZG1tX7IEp0wzSZuWXoOaZx+wRvJXRvO6Du+n5y7llZ+5
         2mBR2wmEQkm+O1kFSV5pCgFR7iSOZMfTMhkdgGZMiX7JO5/2QirSKEmSKc30fzHm0dAY
         c9Rvsp8RFgfnS7f63bk1Ujnb3Wyzd1Hpi3XfHuZlJP987TuukUCNaXw6KNzjJ1fZZNhx
         sI2DMAaAchMiJwdP9A8JH13rHp17xu5U26ALFlOTv4JXUmFOdqq0rGwzkPXI4udMdkJ+
         GvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=wcUBrxsFtJnUOTyz+tm/W38EHZOrl2HL/UE+MnpkNlA=;
        fh=r8ajd3FUMdtDxzqs0wLEINYA6psD113amket9C+CNXU=;
        b=T1H8vZjhfcjIrBYfkTcQwLNheiQSfouAX4Vsh4SJZOVUxYHQ7DSN4DrGLS68oXnpgY
         QQWSMHAUURnZmeAxxuPE/kYGUrEISKd/EiV/F2vhKgYiHwKHt3ggqmoaxqZqeA814NgZ
         3GpUCaRa3h6cNRI8+HHk6uqaNb1in03X58b0ALpwyF9RK9i4brKRg/n1NNkN536XmcwE
         fbPdtyZ4iDMbij9+PTngP39hl7PSF56cSxJL5aThJTCiIafiVcEepVRKW8SmLe8ezkUX
         XjqIj9cNo0ZbcvVS6g9fxpKpAjBahRuhJq3HwRtnBqKfDE+PCyI0xWZ/I6cqkly0R1cu
         zrPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 00721157ae682-6ea8d22e6a9si67480077b3.218.2024.11.06.05.04.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:04:13 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xk54m51Kmz6LDWB;
	Wed,  6 Nov 2024 21:04:08 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 33A2214011D;
	Wed,  6 Nov 2024 21:04:11 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.112) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 14:03:56 +0100
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
Subject: [PATCH 0/3] Fixes CPUs AML & acpi-bios-tables to be x86 backward compatible 
Date: Wed, 6 Nov 2024 13:03:28 +0000
Message-ID: <20241106130331.205020-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.170.112]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: w62mGqyF2C9E

Fixes the the CPUs AML code and its corresponding golden masters ACPI
tables files for backward compatability of live migration on x86 platforms
i.e. when newer Qemu is migrated to older Qemu without `CPRS` Bit present
in the register block.

Fixes [PULL 60/65], [PULL 61/65]:
Message-ID: <bf1ecc8dad6061914730a2a2d57af6b37c3a4f8d.1730754238.git.mst@redhat.com>
Message-ID: <4d62d15b11909e9af121577e707b88f2e4524371.1730754238.git.mst@redhat.com>

Salil Mehta (3):
  qtest: allow ACPI DSDT Table changes
  Fix: Reverse CPUs presence check logic for x86 backward compatability
  tests/qtest/bios-tables-test: Fix DSDT golden masters for x86/{pc,q35}

 hw/acpi/cpu.c                                 |  22 +++++++++---------
 tests/data/acpi/x86/pc/DSDT                   | Bin 8561 -> 8561 bytes
 tests/data/acpi/x86/pc/DSDT.acpierst          | Bin 8472 -> 8472 bytes
 tests/data/acpi/x86/pc/DSDT.acpihmat          | Bin 9886 -> 9886 bytes
 tests/data/acpi/x86/pc/DSDT.bridge            | Bin 15432 -> 15432 bytes
 tests/data/acpi/x86/pc/DSDT.cphp              | Bin 9025 -> 9025 bytes
 tests/data/acpi/x86/pc/DSDT.dimmpxm           | Bin 10215 -> 10215 bytes
 tests/data/acpi/x86/pc/DSDT.hpbridge          | Bin 8512 -> 8512 bytes
 tests/data/acpi/x86/pc/DSDT.hpbrroot          | Bin 5068 -> 5068 bytes
 tests/data/acpi/x86/pc/DSDT.ipmikcs           | Bin 8633 -> 8633 bytes
 tests/data/acpi/x86/pc/DSDT.memhp             | Bin 9920 -> 9920 bytes
 tests/data/acpi/x86/pc/DSDT.nohpet            | Bin 8419 -> 8419 bytes
 tests/data/acpi/x86/pc/DSDT.numamem           | Bin 8567 -> 8567 bytes
 tests/data/acpi/x86/pc/DSDT.roothp            | Bin 12354 -> 12354 bytes
 tests/data/acpi/x86/q35/DSDT                  | Bin 8389 -> 8389 bytes
 tests/data/acpi/x86/q35/DSDT.acpierst         | Bin 8406 -> 8406 bytes
 tests/data/acpi/x86/q35/DSDT.acpihmat         | Bin 9714 -> 9714 bytes
 .../acpi/x86/q35/DSDT.acpihmat-noinitiator    | Bin 8668 -> 8668 bytes
 tests/data/acpi/x86/q35/DSDT.applesmc         | Bin 8435 -> 8435 bytes
 tests/data/acpi/x86/q35/DSDT.bridge           | Bin 12002 -> 12002 bytes
 tests/data/acpi/x86/q35/DSDT.core-count       | Bin 12947 -> 12947 bytes
 tests/data/acpi/x86/q35/DSDT.core-count2      | Bin 33804 -> 33804 bytes
 tests/data/acpi/x86/q35/DSDT.cphp             | Bin 8853 -> 8853 bytes
 tests/data/acpi/x86/q35/DSDT.cxl              | Bin 13182 -> 13182 bytes
 tests/data/acpi/x86/q35/DSDT.dimmpxm          | Bin 10043 -> 10043 bytes
 tests/data/acpi/x86/q35/DSDT.ipmibt           | Bin 8464 -> 8464 bytes
 tests/data/acpi/x86/q35/DSDT.ipmismbus        | Bin 8477 -> 8477 bytes
 tests/data/acpi/x86/q35/DSDT.ivrs             | Bin 8406 -> 8406 bytes
 tests/data/acpi/x86/q35/DSDT.memhp            | Bin 9748 -> 9748 bytes
 tests/data/acpi/x86/q35/DSDT.mmio64           | Bin 9519 -> 9519 bytes
 tests/data/acpi/x86/q35/DSDT.multi-bridge     | Bin 13242 -> 13242 bytes
 tests/data/acpi/x86/q35/DSDT.noacpihp         | Bin 8269 -> 8269 bytes
 tests/data/acpi/x86/q35/DSDT.nohpet           | Bin 8247 -> 8247 bytes
 tests/data/acpi/x86/q35/DSDT.numamem          | Bin 8395 -> 8395 bytes
 tests/data/acpi/x86/q35/DSDT.pvpanic-isa      | Bin 8490 -> 8490 bytes
 tests/data/acpi/x86/q35/DSDT.thread-count     | Bin 12947 -> 12947 bytes
 tests/data/acpi/x86/q35/DSDT.thread-count2    | Bin 33804 -> 33804 bytes
 tests/data/acpi/x86/q35/DSDT.tis.tpm12        | Bin 8995 -> 8995 bytes
 tests/data/acpi/x86/q35/DSDT.tis.tpm2         | Bin 9021 -> 9021 bytes
 tests/data/acpi/x86/q35/DSDT.type4-count      | Bin 18623 -> 18623 bytes
 tests/data/acpi/x86/q35/DSDT.viot             | Bin 14649 -> 14649 bytes
 tests/data/acpi/x86/q35/DSDT.xapic            | Bin 35752 -> 35752 bytes
 42 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.34.1

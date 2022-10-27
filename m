Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp250953ejn;
        Thu, 27 Oct 2022 03:03:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/noV5zUBCEZxestQ4MaUNo10/p+8276TkRkuY8vuFMlzdBYVRwFyHjazpC18JMbgTan1u
X-Received: by 2002:ad4:5c64:0:b0:4bb:5aed:86d8 with SMTP id i4-20020ad45c64000000b004bb5aed86d8mr24374218qvh.105.1666865017189;
        Thu, 27 Oct 2022 03:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666865017; cv=none;
        d=google.com; s=arc-20160816;
        b=hMWCjcqt93MNXOrZ7WI9pAgwmoo/8Dl8k13vc2bnO54ChiDIlxL8X6vi6+RDiZcURr
         hpB2+9f1Vx2d1VURCPSO4RjSaf8Y/m6ny34KbASUqdlz2w517aqh0x6IvUrDjCBeCTaS
         0eiHncq/0RBdD9upFNYjNQtE8XIuJK+SyeqKSzdPPZ5+g55TY0tR17m/gtnno5JBoj9w
         uJRwqMPatMM8EGBYvwXXV5gYvYY/iHJgcuvisTKmoitgXN9AWqOEmclxGQ15KlBRqfly
         OMXTrMm3Hqz7yzLJW0c8K1LUcL4ijDrOWQcRKKlAnxw5/daNCIJpJwMEKum/FkdRmquE
         Lscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:from:reply-to:sender:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=shHUBw2z6qijfOEaGdo89lrCXpJGXZ+mJJcvyff36yk=;
        b=pEFTYQ21+K9mdeXKsWL05CO9wQSHYCUbD6EPVovXYEaASED4anUbSbRuPNsxw4M7c1
         Us+0edKRXbiP/hWSRz8vHnC96FS6vOMEJkOyxwZEiTWRv2vnnaIWRX+OdkHUJ7tMJZSM
         25hWUPx9SlbRe60faFptP9f5s4FG0j/E9BmwRzMvunDFWnm2hFR55t33mGF5GJDFSba4
         uiHZZI9deK6qWIzV09rdHmQCnyMWm58x8B/fNfgGr78fK9MpDlCcPsx1W30+axsspvcu
         TBVFK5Vblft3IUj7AuFh4S/WOFLC3cqVMj/T4u31NDivNiENO2TYyulYcYcD5ki6ggZN
         gjdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac8518a000000b0039cd5f0838bsi570420qtn.102.2022.10.27.03.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 03:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onzhk-0003Az-A6; Thu, 27 Oct 2022 06:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzhH-00016y-Ox; Thu, 27 Oct 2022 06:01:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzh9-0003us-JT; Thu, 27 Oct 2022 06:01:11 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Myh2p6Tj7z67ZcT;
 Thu, 27 Oct 2022 17:58:42 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Thu, 27 Oct 2022 12:00:38 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 11:00:38 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH v3 0/8] AArch64/HMAT support and tests
Date: Thu, 27 Oct 2022 11:00:29 +0100
Message-ID: <20221027100037.251-1-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GdEXPLaW6yxO

This patchset adds support for AArch64/HMAT including a test.
It relies on other two patch sets from:

Brice Goglin: to support -numa without initiators on q35/x86.
  https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
Xiang Chen: to enable/support HMAT on AArch64.
  https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/

I further add a test with ACPI/HMAT tables that uses the two
patch sets.

Changes from v2:
- Rebased and fixed a merge conflict

Changes from v1:
- Generate APIC and PPTT ACPI tables for AArch64/virt
- Avoid using legacy syntax in numa/bios tests
- Delete unchanged FACP tables

Brice Goglin (4):
  hmat acpi: Don't require initiator value in -numa
  tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
  tests: acpi: q35: add test for hmat nodes without initiators
  tests: acpi: q35: update expected blobs *.hmat-noinitiators expected
    HMAT:

Hesham Almatary (3):
  tests: Add HMAT AArch64/virt empty table files
  tests: acpi: aarch64/virt: add a test for hmat nodes with no
    initiators
  tests: virt: Update expected *.acpihmatvirt tables

Xiang Chen (1):
  hw/arm/virt: Enable HMAT on arm virt machine

 hw/arm/Kconfig                                |   1 +
 hw/arm/virt-acpi-build.c                      |   7 ++
 hw/core/machine.c                             |   4 +-
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
 tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
 tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
 tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
 tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
 tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
 tests/qtest/bios-tables-test.c                | 109 ++++++++++++++++++
 13 files changed, 118 insertions(+), 3 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

-- 
2.25.1


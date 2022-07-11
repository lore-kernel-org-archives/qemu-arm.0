Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp740013lfp;
        Mon, 11 Jul 2022 03:49:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8zxUR5RbyNIR1BHl0lz1oD/5g5QCEsawcQSWo7Ut8nudqWSpgiY4WyvV6iGtmRufGnT67
X-Received: by 2002:ac8:5f10:0:b0:31d:2a6a:76d1 with SMTP id x16-20020ac85f10000000b0031d2a6a76d1mr13436082qta.317.1657536564672;
        Mon, 11 Jul 2022 03:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657536564; cv=none;
        d=google.com; s=arc-20160816;
        b=U5Gqlp5DCBfBiX06uebmFhB+0JWJj2J/NKAXXz92TEV6vGC/RIBI1rLFyVnyGR/qxZ
         fYLDc0uh087v2XCDZ1MppdrJGevEroPqQWJvFQs/RFKS3+WsqxojFcqc9rEJvoitZpCK
         Y7iGSpVQN0F1FEuwa9DtKKtycPnGzwoFsN++VLU9mNjc+Up+jgmEU6/+m7CkLEHVx0F5
         GVncrbu7RfcKUGayyuueA4wok3S3/cVThTq+7AP/Kp8zTcKFIWdhEDBWENQBKKLxAUrt
         9iokNZARB36UHf0I2gHUiQhp/3fvEq9TNeOfbpDN3SHX+Z6Pz444c1KT/u+lQ57q0o3G
         Rijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=z++GpD69TzoMLSfGhKjjK4UI5kiLj2Y8s/wwWzBjjmA=;
        b=SVzImaaVf0Tm/4DKRvU0MFiFG08kevF17x1gRysKMOpgS24eUG7Ja8PVPUmo2jFnNA
         c8biZsIEAddtzUYf4i4ibcbZu4NCE5KsoeGs5ONA5aIyeoVSY0eWb5HUabTSeicW7FVA
         hng7EwDd4zX5Fj+WEdxCIYhzMG0gm9fgdnx2Mko1DuhH3pUJCQ7mVhpg28X9Nft8xVl1
         /EiW4luF8e7CZ6GFFnPpi35cfiNatui5wKTkH5+1OcKPeGn8wWTIhT1kGOuD3AGRWDIT
         vgtsN3+eUrulcqYT8S+vG0L0qdWnPcYkiSZFnJ3A1j2P/i5BgZAsW9opixTsiLVmOpOL
         kQrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo7-20020ad45f07000000b00472f63ecb25si4021550qvb.149.2022.07.11.03.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 03:49:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oAqyh-0000PF-3s
	for alex.bennee@linaro.org; Mon, 11 Jul 2022 06:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAquN-0004bN-PD; Mon, 11 Jul 2022 06:44:55 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAquL-0006qE-4m; Mon, 11 Jul 2022 06:44:55 -0400
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LhL6F2FnBz689LS;
 Mon, 11 Jul 2022 18:41:41 +0800 (CST)
Received: from lhreml751-chm.china.huawei.com (10.201.108.201) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 12:44:38 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhreml751-chm.china.huawei.com (10.201.108.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 11:44:38 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH 0/8] AArch64/HMAT support and tests
Date: Mon, 11 Jul 2022 11:44:28 +0100
Message-ID: <20220711104436.8363-1-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml751-chm.china.huawei.com (10.201.108.201)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>
X-TUID: ibPW8HKeklyZ

This patch set adds support for AArch64/HMAT including a test.
It relies on other two patch sets from:

Brice Goglin: to support -numa without initiators on q35/x86.
  https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
Xiang Chen: to enable/support HMAT on AArch64.
  https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/

I further add a test with ACPI/HMAT tables that uses the two
patch sets.

Brice Goglin (4):
  hmat acpi: Don't require initiator value in -numa
  tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
  tests: acpi: q35: add test for hmat nodes without initiators
  tests: acpi: q35: update expected blobs *.hmat-noinitiators

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
 tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
 tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
 tests/data/acpi/virt/FACP.acpihmatvirt        | Bin 0 -> 268 bytes
 tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
 tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
 tests/qtest/bios-tables-test.c                |  99 ++++++++++++++++++
 13 files changed, 108 insertions(+), 3 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/FACP.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

-- 
2.25.1


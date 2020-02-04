Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4686681lfp;
        Mon, 3 Feb 2020 17:46:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSqEFI8SD9AQKYbeUmCzpkx3PVA5yDmkTP0IXsvMUbpBkgMBcMqVrN0GKZOrNtLGpfPD51
X-Received: by 2002:a37:7005:: with SMTP id l5mr25460035qkc.334.1580780765661;
        Mon, 03 Feb 2020 17:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580780765; cv=none;
        d=google.com; s=arc-20160816;
        b=08H+eBKMxybqd7MxPbHyH8hsZl0zFWJJwlukT7BXgxLcEUWBdV9N0TI8CZCsElnvBA
         BJlSc8ilwvGnIRoKFlZ/eTThtkBFW38axg282Co8D7rg1c+rdqLmAgSv4nN4os5MIpMC
         4reOSqwRnVW3IIXDUQAX3+AECYMy5Q7rZKGa5D76PMPkvlBixqvgI3+AtAD3OVRL2AL8
         3ZKn2vD1LksIRjWrxudiJx02DropbGfbEnE+4cyVB0t8jahI6sUCvEdnesjRzCFf4cUV
         k04j7Iha09ZBT/1d1n4rK/7rK3ju0+53PFwqbw/QoOpOCJ87UHgWk/fArtfMt2EblUEL
         N+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=IZgGS8qL2BGEX6iTp46kWAcDnDHCG7kZwVpBTlW/xqY=;
        b=yMsXgNDbABSZrDoQLeQYClQLeuUm642Y/36lF3m2GIRwyWLeDgnMV9dwYV0wsVzNof
         ZKOtZWGqc6tQk4UdquTtlYDuEk/SnSoXluY5fCOKU50IknJJIu9T0yV9aVRbxnLA8jiV
         QQ8X90uIQiUg064agWXtC9HIHkS2z+ytZXbkvf4Q+yc1UhVFhAWfJ+OSjnCf0hvIU4NY
         IHNNyhtkf0Cw+urld/TXsjmV13yY/NN6/bZZOMrg70mO/0PFkfE3ZKIt05JCpaJq99yC
         REaPh2eMpraLh2xYd2fh1ocWkU+towMB3SEO9zz6wb4dhbHmgCjpC7raDIoHOHwMCuZI
         jSQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si13014624qtg.24.2020.02.03.17.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 17:46:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynHx-00070A-2r
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 20:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynHR-000703-Vt
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynHP-0006xG-0k
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:45:33 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:50634 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynHN-0006rV-5L; Mon, 03 Feb 2020 20:45:30 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4631BB1E560719FDA459;
 Tue,  4 Feb 2020 09:45:24 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:45:16 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/7] Some cleanup in arm/virt/acpi
Date: Tue, 4 Feb 2020 09:43:18 +0800
Message-ID: <20200204014325.16279-1-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQBALOd0Dfre

Remove conflict _ADR objects, and fix and refine PCI device definition in
ACPI/DSDT.

History:

v3 -> v2:
- update commit message for patch 4/7.
- remove diff keywords in commit message of patch 7/7 to avoid applying p=
atch
  failure.

v1 -> v2:
- flow the work flow in tests/qtest/bios-table-test.c to post ACPI relate=
d
  patches.
- update commit messages for removing "RP0" and "_ADR".
- add 3 more cleanup patches.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org

Heyi Guo (7):
  bios-tables-test: prepare to change ARM virt ACPI DSDT
  arm/virt/acpi: remove meaningless sub device "RP0" from PCI0
  arm/virt/acpi: remove _ADR from devices identified by _HID
  arm/acpi: fix PCI _PRT definition
  arm/acpi: fix duplicated _UID of PCI interrupt link devices
  arm/acpi: simplify the description of PCI _CRS
  virt/acpi: update golden masters for DSDT update

 hw/arm/virt-acpi-build.c          |  25 ++++++-------------------
 tests/data/acpi/virt/DSDT         | Bin 18462 -> 5307 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 6644 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 5307 bytes
 4 files changed, 6 insertions(+), 19 deletions(-)

--=20
2.19.1


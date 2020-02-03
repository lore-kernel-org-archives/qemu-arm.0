Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3333781lfp;
        Sun, 2 Feb 2020 16:17:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPSQaZR2aB/tJliuYLcDQ2AEEbJUdubzOamvDZsmQ5mUGaDWMDXabkJW1jJuuI3/+5FLJh
X-Received: by 2002:a05:620a:15ab:: with SMTP id f11mr20635773qkk.195.1580689042029;
        Sun, 02 Feb 2020 16:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580689042; cv=none;
        d=google.com; s=arc-20160816;
        b=0tD669ROmUMezGOqOgKS4lH/R9DaR9rjmNvnuSesAmhRdt/FcPNgmgeB3FiSZxnPvJ
         Pz5pcbwWjHaQtMx+qsj4yhJ0pIjhMNk31zuEEXEbTU6v/qJrmFO8noWQbY2lUzvi59dh
         CBPiJt9vNNRbYN1s9vtzXmYRn4lvz6P9+Wwt4mqTwlKqh3IcEKv8IfAzAshKg00AC4dO
         3ZLqyzmjc39cC4USD189mQhFmFPZV9rTqYcONZ0HyiUAYWaOJqN/Z7/1svTiKK2Db20B
         g8Va7oxRojlyjJEV18FJneDJevm0rEaaSZH5cW4YjuqpeIX+QsRTsjZ12vGvB9El2mtN
         mtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=MKYa8eRBXYUY6SFXpv3dZNUy99x6mQTvaOonXTNLiJg=;
        b=S2xtQFG03QAWSrRaRotdkInA26lng5l0wXs5vIOE/tRD7zipsypbbQTyvFV8gs7o4p
         RRomxAi8KPD1P4j1ixcPPD0VXm6+o7rm3Sv4vmkJo4pmCt0o5QzhORjQh1VusN6bo4D5
         Al1nTkxtLIBRzUIBHDCCsuIOJd21lMHW3EuvUQmQDuTD8xy1b+ffV7/dZoezokLsFiTS
         khfGDbEJkmKS/jvBXTxSt+0IGFYwx6Gk//moXbjsyDLBhO3MAaFHhIZp5a+V61ssI6Ak
         u2taAOvne1AcYZP1ROCbAEH6K6cZKWHoCuNASqcCx6djCJxk1SLV7QGXcNHGKtIyI8sC
         5qFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si11095798qtd.214.2020.02.02.16.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 16:17:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyPQX-0006jZ-AG
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 19:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQN-0006jO-8o
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQM-000415-7S
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:11 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2747 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQL-0003xZ-TR; Sun, 02 Feb 2020 19:17:10 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4475E60500058D32F454;
 Mon,  3 Feb 2020 08:17:04 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:16:55 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/7] Some cleanup in arm/virt/acpi
Date: Mon, 3 Feb 2020 08:14:58 +0800
Message-ID: <20200203001505.52573-1-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
X-TUID: ss1XGwkR/vLy

Remove conflict _ADR objects, and fix and refine PCI device definition in
ACPI/DSDT.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org

v1 -> v2:
- flow the work flow in tests/qtest/bios-table-test.c to post ACPI relate=
d
  patches.
- update commit messages for removing "RP0" and "_ADR".
- add 3 more cleanup patches.

Heyi Guo (7):
  bios-tables-test: prepare to change ARM virt ACPI DSDT
  arm/virt/acpi: remove meaningless sub device "PR0" from PCI0
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


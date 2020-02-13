Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp67034lfp;
        Wed, 12 Feb 2020 18:37:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzTcYIpPTf5NKJ94fqmttfWtT6rqz8NmILShO1nbRinaShPeNw9pDDkVpcMdYiHZ7MYE+cX
X-Received: by 2002:a05:620a:535:: with SMTP id h21mr7303650qkh.184.1581561425588;
        Wed, 12 Feb 2020 18:37:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581561425; cv=none;
        d=google.com; s=arc-20160816;
        b=tCL6DycbWKyYVKeRpek73ObQJ4J7JElaOekrrobeVJjg/DWJu9arlVA/LeQbsF9Zi6
         Pf7M2XcoZH8SgcHSHzTYClSWHFmW58UvzTVzPrQNffadnxPa1MwMGDw5MzvHW+BqqswS
         3Lc3GvBThSwPsO91F2Wzu5j1+fl/hKJn1MxSIx8xt3dK8jHE01dIFkZvimvAO1wnIzMx
         UGXMw9f+XwyiddnPk63ymP4QmVzWhtG7+AE8yz5pttjXsfHJQe0HOuboDsFPzQv56NjS
         DHAxP4aPRsU3+esy0YUoUB1j0wjKBvXs9or+bMpsAsNZBfBTUt5UxXxfuaIn+gKX3mS1
         fOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=yxQqJr/pNX4f0uNC91KGiqRVc3isnY8zpdJHU49tA1Y=;
        b=O9Ez1Hx+VqMf8vCG+YU30Rr1lfRlnCIrfw5wWh2mL66ShxkOlgt5eWyCWsiMPSuMLU
         1DxAytYaE5yZYYhkHNENJvPHaXoXdeyCCkLQ2Qn5SswQzYIcEnBDs2t05NlRVsPNon53
         tMuF3iEkIXFv3DrWim0qSh/kyqBbT7KAYzb5/ZhhNdWBj/pB2ympvmyb7Lj7xNXIsM8I
         6j7t3UT1iXV0UQwriSX84Bf15xyXcQ0glF7G/98xIAxKBSKMdcUgzR5ZHlk7QWxjVI0N
         xvCTBrd71csoBzxVD6DI2ar8uP4qYhwxt3/dnc5OgAsMpWl5gnjrfSIJjZ4DAmwXzZaA
         8sEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si511136qtq.307.2020.02.12.18.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 18:37:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j24NE-0008TS-Rw
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 21:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j24M3-0007CC-67
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j24M2-0000YD-8u
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2703 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j24Lz-0000Q7-Rp; Wed, 12 Feb 2020 21:35:48 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1529E4D80926B91EB21C;
 Thu, 13 Feb 2020 10:35:44 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 10:35:33 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 0/4] arm64: Add the cpufreq device to show cpufreq info to
 guest
Date: Thu, 13 Feb 2020 10:35:28 +0800
Message-ID: <20200213023532.902-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T2xmYYpxzUeA

On ARM64 platform, cpu frequency is retrieved via ACPI CPPC.
A virtual cpufreq device based on ACPI CPPC is created to
present cpu frequency info to the guest.

The default frequency is set to host cpu nominal frequency,
which is obtained from the host CPPC sysfs. Other performance
data are set to the same value, since we don't support guest
performance scaling here.

Performance counters are also not emulated and they simply
return 1 if read, and guest should fallback to use desired
performance value as the current performance.

Guest kernel version above 4.18 is required to make it work.

Ying Fang (4):
  acpi: add aml_generic_register
  acpi/cppc: add ACPI CPPC registers
  arm_virt: add the cpufreq device model
  arm_virt: create the cpufreq device

 default-configs/aarch64-softmmu.mak |   1 +
 hw/acpi/Kconfig                     |   4 +
 hw/acpi/Makefile.objs               |   1 +
 hw/acpi/aml-build.c                 |  22 +++
 hw/acpi/cpufreq.c                   | 247 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c            |  74 ++++++++-
 hw/arm/virt.c                       |  14 ++
 include/hw/acpi/acpi-defs.h         |  32 ++++
 include/hw/acpi/aml-build.h         |   3 +
 include/hw/arm/virt.h               |   1 +
 10 files changed, 397 insertions(+), 2 deletions(-)
 create mode 100644 hw/acpi/cpufreq.c

--=20
2.19.1



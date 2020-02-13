Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp294709lfp;
        Wed, 12 Feb 2020 23:36:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwG+hDPyNiGkygy2VRjH1b8xYjgpgShdpGu9VxfFpApSaVNBq8y2NqNtJ5VHZW29AQChvIb
X-Received: by 2002:ac8:5456:: with SMTP id d22mr23302524qtq.377.1581579419554;
        Wed, 12 Feb 2020 23:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581579419; cv=none;
        d=google.com; s=arc-20160816;
        b=bR/loCQ61WQNK1B4S3jAq6WZGL/cBmLpd/76SQMow65OFk1luNkriJ60RBAe0eWakS
         8yE2z8iR3IlyKbmIrm2eDguX7OcW7MHcaUKH0CvjMYXlC0oZ0+tzOntFSZEoH2fnP9+M
         HuEdLuOMDNC8rvceYOFOo4RMVIBc/7FJ9SNuiYXXP8UgyZXFjQ8tlYUjPW7yyVlSn0cA
         uLvBZURE33hwRep86F8hlhtXy9Jc66vD9bXir4g5t3HzLL3gkwQQnzf8zpZ/2WGbuV6P
         sUAATtk7/GPZ36n0fb+gAbRBoEJNkwgqD7KpNe6hR3P8NLLmLT6js0Nakgtp+9RcGyeV
         cSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=zIfytClLx0tkImMhuF94endNiFP7vSMHN7fYvxuAMiQ=;
        b=aT93odtzk4l20WyURmsy88dFqXESkUd6JWSOKIRi4PAItiyD6jz6csnzwvq5ayGpCJ
         Fl5UL+/RXlCrA2ruN4GnvVk6JsOBkICK7VQRv+FH+shD6OOVgbVc7RZPz7WhH2UNwV4o
         0vqS1d7RTQp7VBbjZNGeCyikQoC0X/F9OPr3+dSZztLvDk585RgrVm8NlBvauU4QnMoh
         57BukOeprKJYrDl76cTFvgSk0c9B6UrOaWV/Ys4osjQT+czvsce8gqLGWOZET/FNYzAn
         Ko7XcrWKvKHdrgs0069ixi6i2iwizZJhJ+zsTRTZDXDyllqhuYqizst/AeCEmv6/4V3m
         7m2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u201si810054qka.190.2020.02.12.23.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 23:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j293T-0001ni-0E
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 02:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j293J-0001hY-70
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 02:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j293G-00056C-Js
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 02:36:48 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2704 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j293F-00054T-AL; Thu, 13 Feb 2020 02:36:46 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 95436FE84DA4358ECCBC;
 Thu, 13 Feb 2020 15:36:39 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 15:36:31 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 0/4] arm64: Add the cpufreq device to show cpufreq info to
 guest
Date: Thu, 13 Feb 2020 15:36:26 +0800
Message-ID: <20200213073630.2125-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5RlyWvAWTIph

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
  acpi: Add aml_generic_register
  acpi/cppc: Add ACPI CPPC registers
  arm: Add the cpufreq device model
  arm: Create the cpufreq device

 default-configs/aarch64-softmmu.mak |   1 +
 hw/acpi/Kconfig                     |   4 +
 hw/acpi/Makefile.objs               |   1 +
 hw/acpi/aml-build.c                 |  22 +++
 hw/acpi/cpufreq.c                   | 249 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c            |  74 ++++++++-
 hw/arm/virt.c                       |  14 ++
 include/hw/acpi/acpi-defs.h         |  32 ++++
 include/hw/acpi/aml-build.h         |   3 +
 include/hw/arm/virt.h               |   1 +
 10 files changed, 399 insertions(+), 2 deletions(-)
 create mode 100644 hw/acpi/cpufreq.c

--=20
2.19.1



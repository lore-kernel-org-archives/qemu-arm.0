Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp45616lfp;
        Wed, 12 Feb 2020 18:09:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBRCdtWvfhCZr6YKSodqMT38EYAbsmfc5UesGMG9ww8BmkpoaROLHc3LzWU5ZVoyIemrYc
X-Received: by 2002:a05:6214:1149:: with SMTP id b9mr9552804qvt.227.1581559742733;
        Wed, 12 Feb 2020 18:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581559742; cv=none;
        d=google.com; s=arc-20160816;
        b=PFVhTkxn+rjOWUerFijMEa3cV7CzP8o2IzNA3p84cY6ErKZwkB9OnVKA/7KI+Tr7Ky
         jyG0eSDBFbusndqAF4VSMdERRLLE7e116m7It/2yFhh3N66g5A+CgujAfhOTHEZoYnFs
         a/FAmK29fwb7awkILAcZ0OS3c4+1DapygUymdXNHHGaCYEYGNc2f7GZHtm+vdfv4lOif
         XFB6y0kS0ixdclJIRF5gtvRmL6VjfMPs0azQYXWavp0VFeMY9gdI6qySo5gjO90E+nSG
         0b1I23wuQlQRqTTrgQuHLogmA0UGdU0vzomRxecIcWkyYjWwyL6Z0/Ll5OrrDHZsZ0RK
         B0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=0OeKv2vZygkCSSOYfAcysiqGL1hee6AfZwjJodNtAvw=;
        b=wi8TVU4zYFUwxXgjrIajdgWTNHg+LtwRcLVE6UUN2coOkQEzBQAwY7PDsUFwXrfTKK
         vHyKsOLGzOW90HfGdzjMAdRtYE3C+ITB1jYQp21M+lxVWwA4oKmLe6yisyYW5zm075mB
         DmDawfNKA1/B4husXFjOd4POx7vnPxU/TJsgh2arjffvYXwApnDV4lqbcYcQX/GZuEBk
         gocaZN7LSN8V+2DK/b2ymUug7WcQFoQ20E0oY5kUqq7iT6+cNG8ffHUHXwNzBMoZCGHL
         tFfFQXWDeOBueDH63le+7PFfWdeIQtXb1i6BBO6rqX6IfQzzfdG4UwBTmQJRgdVvoDlV
         EmMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si314564qvo.41.2020.02.12.18.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 18:09:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j23w6-0007T9-7e
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 21:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j23ue-0004qX-GD
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:07:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j23ud-0005LV-3g
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:07:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2701 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j23ua-00058m-EP; Wed, 12 Feb 2020 21:07:28 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id ED2FDBF577883D4F94D6;
 Thu, 13 Feb 2020 10:07:20 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 10:07:13 +0800
From: <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 0/4] arm64: Add the cpufreq device to show cpufreq info to
 guest
Date: Thu, 13 Feb 2020 10:07:08 +0800
Message-ID: <20200213020712.447-1-fangying1@huawei.com>
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
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MpCxXGdmBV6w

From: Ying Fang <fangying1@huawei.com>

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



Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp619354wrm;
        Fri, 4 Oct 2019 08:59:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIZ0OyvvLtTaGl7DqpYsYnSJXphS9j/Ngkcge6d67v0gTKoRbi1GEI69L/hDy7kl7kF4dX
X-Received: by 2002:ac8:47d6:: with SMTP id d22mr16227812qtr.54.1570204779831;
        Fri, 04 Oct 2019 08:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570204779; cv=none;
        d=google.com; s=arc-20160816;
        b=T8Vv37trxKAI1OA5SJ/GA8rr/yspHOyxBnutbxnxLAjQNCIhwpTQHGpNsSwFx4JA6p
         /kNSYzuIhxJO5jVAe9s4v6Wh0HIcEKgln2dyJvb3Cl0D9N45gwjHRXC98fCoKgUt+X8q
         v7PHt9QcWFNSdDOlYqdJP9g69Ac6bpcnUxTAD+bR1uuQlon+6CVP6VJIEReIr22/prFF
         hptFmRF6TccnxZeYeyzGgggQYmcOFS0wK6josiHpD09PAtErRWi3uri6XB8TL3DuwmQj
         D/xWPLhRG/7YhzgtJk7IPoiYiztFkwn+snFWKldBMtexlgInMeqjXF+0F/ZacJEfIjBi
         7Juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=p6+59pam/YNaGC8sm7X8TUDSZ+p80VXv4HPFfOkpu/Y=;
        b=e0hSQn0NAFPUKjvdI7WayA40Dw4mbfwLMa9677LtEAQTH7aqjYzGqfTXKvREhG+eM/
         KJ5rt0flc4PLDJ2au/UaPUDt9EEjVQyf8Ati2LLmVfcTh01LwPOtCdVEeqmvERR9XhCl
         UnrQQeEZ+0NN8/ieFVFiJX5Dbz0BPl3ZQ30Rur7faJAUtyLyfiOTSsAvgDzsZr7HY6yQ
         z0ILmR/twzl4eUjZDpXbIQ1s8KkkfMtM1QXKphoKrXBG2f1AaXvy9mXMMJ7XWWEjJLu2
         uG5slsH9d5gDXZFhhktw9XyGGYGnmjPr5W4lGpjGoAWHiRjEVVfNQI1cK7pbZiAmqg2c
         uj9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p57si6041733qtk.10.2019.10.04.08.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 08:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGPzX-0002AM-0X
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 11:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuQ-0006Jx-3A
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 11:54:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuO-0000Vu-ME
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 11:54:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:44540 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuO-0000Mn-93; Fri, 04 Oct 2019 11:54:20 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D0FF42812587D8540905;
 Fri,  4 Oct 2019 23:54:07 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 4 Oct 2019 23:54:00 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH 0/5] ARM virt: Add NVDIMM support
Date: Fri, 4 Oct 2019 16:52:57 +0100
Message-ID: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: peter.maydell@linaro.org, lersek@redhat.com, linuxarm@huawei.com,
 xuwei5@hisilicon.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tE3NR//WpF7/

This series adds NVDIMM support to arm/virt platform.
This has a dependency on [0] and make use of the GED
device for NVDIMM hotplug events. The series reuses
some of=C2=A0the=C2=A0patches posted by Eric in his earlier
attempt here[1].

Patch 1/5 is a fix to the Guest reboot issue on NVDIMM
hot add case described here[2].

I have done basic sanity testing of NVDIMM deviecs with
both ACPI and DT Guest boot. Further testing is always
welcome.

Please let me know your feedback.

Thanks,
Shameer

[0] https://patchwork.kernel.org/cover/11150345/
[1] https://patchwork.kernel.org/cover/10830777/
[2] https://patchwork.kernel.org/patch/11154757/

Eric Auger (1):
  hw/arm/boot: Expose the pmem nodes in the DT

Kwangwoo Lee (2):
  nvdimm: Use configurable ACPI IO base and size
  hw/arm/virt: Add nvdimm hot-plug infrastructure

Shameer Kolothum (2):
  hw/arm: Align ACPI blob len to PAGE size
  hw/arm/virt: Add nvdimm hotplug support

 docs/specs/acpi_hw_reduced_hotplug.rst |  1 +
 hw/acpi/generic_event_device.c         | 13 ++++++++
 hw/acpi/nvdimm.c                       | 32 ++++++++++++------
 hw/arm/Kconfig                         |  1 +
 hw/arm/boot.c                          | 45 ++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c               | 20 ++++++++++++
 hw/arm/virt.c                          | 42 ++++++++++++++++++++----
 hw/i386/acpi-build.c                   |  6 ++++
 hw/i386/acpi-build.h                   |  3 ++
 hw/i386/pc_piix.c                      |  2 ++
 hw/i386/pc_q35.c                       |  2 ++
 hw/mem/Kconfig                         |  2 +-
 include/hw/acpi/generic_event_device.h |  1 +
 include/hw/arm/virt.h                  |  1 +
 include/hw/mem/nvdimm.h                |  3 ++
 15 files changed, 157 insertions(+), 17 deletions(-)

--=20
2.17.1



Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8267981wrx;
        Fri, 8 Mar 2019 03:44:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYWlKhU3G7Gorow3gAffTzaq3Uk8PsKMeVlLL5CAQHfP8aqNG4QHv3vmHFg46eK83qH+B8
X-Received: by 2002:a25:7752:: with SMTP id s79mr15280848ybc.29.1552045486926;
        Fri, 08 Mar 2019 03:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045486; cv=none;
        d=google.com; s=arc-20160816;
        b=bzrgdHaSDFMbburqz9R9V3W/59pZl1Iqka8ZkpundNomSflhun/YSE4Tu8AxGd1QTm
         X+wWrDfevNhqSmCCMqNj9affGh4cMrkxHDRypC4qnYoTNkp6RUGNwHKpuY8QTmAjT9Ak
         X7UUnT+aX24Yzzg1rFAFYIwKMBPzbBp/HkaR1qiISdY+31Hl4xNecKPHHFTAY+0q9biW
         TYaJmVimCJIOqaeJ8IDLZkkP037+i9+uV/SZN9hyZRLFq6ildUDaT8tfUJCyJ5iQ3Tfl
         0yqj54yKM3gD9pz5EQk7dsTT2FCjQjcvU66K68V5gc+HLgnwoNPeJVq64lZVXSCrj8IB
         /Kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=pVhhs/05QCwF8ozOzbUMQigb0T0yO3jUHCI8UKepi2g=;
        b=PGjIXm2ALNHQgV2WaI/wDeCgqcf2qrrJ39LSXuv9cZhKTn009A/8O+8tgJN9n+i8P6
         Jtg6//sbt4kl5ANJGXDkUZ59ULwPr+gGq5dKJr34sFVHHQTDl6i98DCXl8bxNijS/Hx1
         A4waeI/41dvAqHHpxHCb5SNO5PwmSaTEfaccvfyDejQTeGkk90sQj36yXKhGiESCApQC
         Q9cdkBz1+y2QXCxefZUxF9q5YDVSEC0AKwc1DrJvB2xcS+YWsmKhLlza04vGC6IpTkFV
         wm36evmY1q2rV5zenJhprIWuS/4gJLgCrM67+q3M5HW9nL4e0AmPX32ql/kZq4zf4/g7
         oEqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y140si4472659ywy.310.2019.03.08.03.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:44:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Dvh-00085D-DW
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvR-00083u-0F
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvP-0004sk-1R
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2187 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvO-0003x5-Jg; Fri, 08 Mar 2019 06:44:26 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id EACDA5DAFEDF94D7BAA8;
	Fri,  8 Mar 2019 19:44:12 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:04 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:07 +0000
Message-ID: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v2 00/11] ARM virt: ACPI memory hotplug support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ecm964PWYU7m

This series is an attempt to provide device memory hotplug support 
on ARM virt platform. This is based on Eric's recent works here[1]
and carries some of the pc-dimm related patches dropped from his
series.

The kernel support for arm64 memory hot add was added recently by
Robin and hence the guest kernel should be => 5.0-rc1.

NVDIM support is not included currently as we still have an unresolved
issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
can be included, but not done for now, for keeping it simple.

This makes use of GED device to sent hotplug ACPI events to the
Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
Sebastien to add the hardware-reduced support to Nemu using GED
device[3]. (Please shout if I got the author/signed-off wrong for
those patches or missed any names).

This series can be applied on top of Eric's branch here[4].

This is sanity tested on a HiSilicon ARM64 platform and appreciate
any further testing.

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10837565/
[2] https://patchwork.kernel.org/cover/10783589/
[3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
[4] https://github.com/eauger/qemu/tree/v3.1.0-extended-memmap-v12


RFC --> v2

-Use GED device instead of GPIO for ACPI hotplug events.
-Removed NVDIMM support for now.
-Includes dropped patches from Eric's v9 series.


Eric Auger (1):
  hw/arm/virt: Add memory hotplug framework

Samuel Ortiz (3):
  hw/acpi: Do not create memory hotplug method when handler is not
    defined
  hw/arm/virt: Add virtual ACPI device
  hw/acpi: Add ACPI Generic Event Device Support

Sebastien Boeuf (1):
  hw/acpi: Move constant definitions to header files

Shameer Kolothum (6):
  hw/acpi: Make ACPI IO address space configurable
  hw/arm/virt: Add ACPI support for device memory cold-plug
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
  hw/arm/boot: Expose the PC-DIMM nodes in the DT
  hw/arm/virt: Add GED device configuration and build aml
  hw/arm/virt: Add GED irq routing and Enable memory hotplug

 default-configs/arm-softmmu.mak  |   4 +
 hw/acpi/Makefile.objs            |   1 +
 hw/acpi/ged.c                    | 198 +++++++++++++++++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c         |  58 ++++--------
 hw/arm/Makefile.objs             |   2 +-
 hw/arm/boot.c                    |  42 +++++++++
 hw/arm/virt-acpi-build.c         |  31 ++++++
 hw/arm/virt-acpi.c               | 161 +++++++++++++++++++++++++++++++
 hw/arm/virt.c                    |  93 +++++++++++++++++-
 hw/i386/acpi-build.c             |   3 +-
 include/hw/acpi/ged.h            |  61 ++++++++++++
 include/hw/acpi/memory_hotplug.h |  31 +++++-
 include/hw/arm/virt.h            |   8 ++
 13 files changed, 649 insertions(+), 44 deletions(-)
 create mode 100644 hw/acpi/ged.c
 create mode 100644 hw/arm/virt-acpi.c
 create mode 100644 include/hw/acpi/ged.h

-- 
2.7.4



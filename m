Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1139354wrv;
        Tue, 16 Jul 2019 08:41:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzI9Op8zqKq0aHjA0QgQvyk8djTxI9bszkNhIfdSzmp3Aajgx883yuqw2CeLXqn3WnHh/Tg
X-Received: by 2002:a17:906:5042:: with SMTP id e2mr25797936ejk.220.1563291688562;
        Tue, 16 Jul 2019 08:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563291688; cv=none;
        d=google.com; s=arc-20160816;
        b=FKEG8CgBSmuPSw7wVOFxBFLBNkR6L27vNb+BR+zZ2Yj+0STFF5LIiTIZWwlKHXsOvB
         sLUmfMvVnvWFjDB7ZW7uSYMY8CV4y05KMN0tDYS9gi4oJlJWJDwiWxKj1oRycHOCuSQp
         GnKA32VyW1593s4AW3ed6BenOKZXRSfVc8uvmKAQ3W2TKuVvuwIDITJGTe2VXWInfM56
         GZQENc+S9oYmWoGZbbwE2ekfxGF7/orDW1Ga6ljzGRuAwsG369uaxxR4BKrVNgxFwe3J
         0aVRir3AJran7K2iIJHuD4uazrQEXjA7HQPI4alqcUEicEeBXD46xkIKYFLVSJoCA7MG
         xbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=DWBJvmJkSljxKEuXcklPTIT79VBSBtek/c8Fk4D1oZM=;
        b=XkB5l1Nj+O/9qkrbdTZDIYu9Pdo7C2FUHPDmBxzblhlJS1exhdcTGUaU6Jm+To0I3n
         +q67FfrVcZI8uU9eouKOUD5q56mK9ElvK0o3l3bV087IU80Hi9v4Xy7/fSlVmGrCkch1
         wwwtSgrIc4PSK+v5ZisyHnNBPE7El0YgNgecM8lEcrQ+EvIpR2sCIAlNYuRTpi3M9gr6
         wBJk38Jw8KkGcFVasOmteungXNjB5rL7z70hUtI7co5WlL9hbVBBSKTEumnSWLSuMRfC
         QkEUtyQM55A0kGoVzRoEbxy4dlElBg+1LdEdLVp8qc+NL+ST8TzyQr8VIEur23OKGvbH
         ZKPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si12453367edq.237.2019.07.16.08.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnPa3-0007yT-1y
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 11:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36654)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZs-0007f4-No
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZq-0004Pf-7n
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:16 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33296 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZl-00045n-PW; Tue, 16 Jul 2019 11:41:14 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 41B1FFA22C875A88A5D4;
 Tue, 16 Jul 2019 23:40:44 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 23:40:36 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 16 Jul 2019 16:38:06 +0100
Message-ID: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v7 00/10] ARM virt: ACPI memory hotplug
 support
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GvAoM+gtREJ6

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

This is sanity tested on a HiSilicon ARM64 platform and appreciate
any further testing.

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10837565/
[2] https://patchwork.kernel.org/cover/10783589/
[3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
[4] http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/651763.html

v6 --> v7
- Added 4.2 machine support and restricted GED creation for < 4.2
  This is to address the migration test fail reported by Eric.
- Included "tests: Update DSDT ACPI table.." patch(#10) from Eric
  to fix the "make check" bios-tables-test failure.
  
v5 --> v6

-Addressed comments from Eric.
-Added R-by from Eric and Igor.

v4 --> v5
-Removed gsi/ged-irq routing in virt.
-Added Migration support.
-Dropped support for DT coldplug case based on the discussions
 here[4]
-Added system_powerdown support through GED.

v3 --> v4
Addressed comments from Igor and Eric,
-Renamed "virt-acpi" to "acpi-ged".
-Changed ged device parent to TYPE_DEVICE.
-Introduced DT memory node property "hotpluggable" to resolve device
 memory being treated as early boot memory issue(patch #7).
-Combined patches #3 and #9 from v3 into #3.

v2 --> v3

Addressed comments from Igor and Eric,
-Made virt acpi device platform independent and moved
 to hw/acpi/generic_event_device.c
-Moved ged specific code into hw/acpi/generic_event_device.c
-Introduced an opt-in feature "fdt" to resolve device-memory being
 treated as early boot memory.
-Dropped patch #1 from v2.

RFC --> v2

-Use GED device instead of GPIO for ACPI hotplug events.
-Removed NVDIMM support for now.
-Includes dropped patches from Eric's v9 series.

Eric Auger (2):
  hw/arm/virt: Add memory hotplug framework
  tests: Update DSDT ACPI table for arm/virt board with PCDIMM related
    changes

Samuel Ortiz (2):
  hw/acpi: Do not create memory hotplug method when handler is not
    defined
  hw/acpi: Add ACPI Generic Event Device Support

Shameer Kolothum (6):
  hw/acpi: Make ACPI IO address space configurable
  hw/arm/virt: Add 4.2 machine type
  hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
  hw/acpi: Add system power down support to GED
  hw/arm: Use GED for system_powerdown event

 hw/acpi/Kconfig                        |   4 +
 hw/acpi/Makefile.objs                  |   1 +
 hw/acpi/generic_event_device.c         | 352 +++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c               |  35 +--
 hw/arm/Kconfig                         |   4 +
 hw/arm/virt-acpi-build.c               |  58 ++--
 hw/arm/virt.c                          |  99 ++++++-
 hw/core/machine.c                      |   3 +
 hw/i386/acpi-build.c                   |   3 +-
 include/hw/acpi/generic_event_device.h | 106 ++++++++
 include/hw/acpi/memory_hotplug.h       |   9 +-
 include/hw/arm/virt.h                  |   4 +
 include/hw/boards.h                    |   3 +
 tests/data/acpi/virt/DSDT              | Bin 18476 -> 18493 bytes
 14 files changed, 625 insertions(+), 56 deletions(-)
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h

-- 
2.17.1



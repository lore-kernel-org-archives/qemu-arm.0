Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11749397wrv;
        Fri, 26 Jul 2019 03:47:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNIOIZxbMlZ32dr4RQisihKFrRJvnSgxgolwig1/bANh5d/oEHe3vEeMeXDvkaUwy8B6Ih
X-Received: by 2002:ac8:47d5:: with SMTP id d21mr6968229qtr.360.1564138023489;
        Fri, 26 Jul 2019 03:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564138023; cv=none;
        d=google.com; s=arc-20160816;
        b=Kx3iVAhApEHHM1POtyt2l41BhVhDfbVwqqTq08u375bwtXYpjReNMHKMA0moBcVWQE
         DOy7Mv67A2z9FWK1AgQ2s6BQuGGobYMl52zAVZZzQWRK+v+4CIpRpH0ff5y3FCKHtya2
         FM2SGHjF3GPQCT+JnhOO0PjWFPIQaRATKQAv5R1K5HzcUtvku2rD5/n1H0Gb8D2yLK1C
         8yrLi8b4JUScT1mNu0cUlNvCdiduO3kpd3P64Nrm/j0wEaQslKVGa8gYpbrH/2EYP+nR
         u45Vyp9JKnTHvXTMHZl8z4cgEUoYdTRnS6UkTK4qOmbCp2S4mU9bOVwxWUGX+o/M4/D2
         pq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=F44qwQWQTVwLVjPFn8JbBoJT8n67XV/PHp6Y6H/hohg=;
        b=AwJ//OYg3VxiiFG8yo2gcpjvzkgFbWv9JpxrSV8mEf8Z/ugUnnsdas5feh852jwBxO
         f+9dSs192kUUhc5femcqKeN8lIGowgDv/RPOn95J+Rm+zDsOhVTEK3BhSyHdwLIZucu3
         0l9BtYcKYT6EHue3Lt5JveMuT4icVU4Be1XRjyRCVflZfbj2ERaP3tTqqdxfAEUsIBE4
         hx09RCChfx4D2dhbED60BkZ53iLGN4ZBUqevrxiN7+GAnj/RZEusUfaIhcbrSykPG+M0
         fXp9Xw3LI47lFGtg9ma0Gw9AZ5u+cU5uKit4MWygOaM/ywOnG5OJ/u6TzEjXYja6iMiH
         eOVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x47si34090268qtk.204.2019.07.26.03.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 03:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqxka-0007OB-8j
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 06:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43015)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkJ-0006mz-Iz
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxk4-0005gm-Cd
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:46:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2241 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxk4-0004qv-0Q; Fri, 26 Jul 2019 06:46:28 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E0E9BF0D0223E0E7695C;
 Fri, 26 Jul 2019 18:46:15 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Fri, 26 Jul 2019 18:46:05 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Fri, 26 Jul 2019 11:45:10 +0100
Message-ID: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v8 0/9] ARM virt: ACPI memory hotplug
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
X-TUID: NoAxuWX7r4LL

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

Note:
Attempted adding dimm_pxm test case to bios-tables-test for arm/virt.
But noticed the issue decribed here[5]. This is under investigation 
now.

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10837565/
[2] https://patchwork.kernel.org/cover/10783589/
[3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
[4] http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/651763.html
[5] https://www.mail-archive.com/qemu-devel@nongnu.org/msg632651.html

v7 --> v8
 -Addressed comments from Igor.Please see individual patches.
 -Updated bios-tables-test-allowed-diff.h to avoid "make check"
  failure (patch #6) and dropped patch #10
 -Added Igor's R-by to patches 4 & 5.
 -Dropped Erics's R-by from patch #9 for now.

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

Eric Auger (1):
  hw/arm/virt: Add memory hotplug framework

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
 hw/acpi/generic_event_device.c         | 330 +++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c               |  35 +--
 hw/arm/Kconfig                         |   4 +
 hw/arm/virt-acpi-build.c               |  29 ++-
 hw/arm/virt.c                          | 125 +++++++++-
 hw/core/machine.c                      |   3 +
 hw/i386/acpi-build.c                   |   3 +-
 include/hw/acpi/acpi_dev_interface.h   |   1 +
 include/hw/acpi/generic_event_device.h | 103 ++++++++
 include/hw/acpi/memory_hotplug.h       |   9 +-
 include/hw/arm/virt.h                  |   5 +
 include/hw/boards.h                    |   3 +
 tests/bios-tables-test-allowed-diff.h  |   1 +
 15 files changed, 623 insertions(+), 33 deletions(-)
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h

-- 
2.17.1



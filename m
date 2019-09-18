Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6469006wrp;
        Wed, 18 Sep 2019 06:08:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5OgreDMq4qSFVs46+73TDsFkd78q6Vd/3WrzpKjV5X63kNzg2IzK7AmreyTr8ct6rxfDe
X-Received: by 2002:aa7:c5c2:: with SMTP id h2mr10447831eds.260.1568812119504;
        Wed, 18 Sep 2019 06:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568812119; cv=none;
        d=google.com; s=arc-20160816;
        b=tcxxjwpyT/kt2UoEpJljZ3JiV0MUSR5z09M56D74Ihn/lknhU5wYatlCJHg3ZnFqHE
         c46nYzp8HC+ZM7yAzFUI4VtG45ZN9qngtSBoexLsIYOd15aaZ87kKPeNixPnGo2TACcn
         92tkXrPD4MhwJ3hrVvF1VL1ju183ETIl9ulFJMSrpHcuXiVrXH4BHfdGSR/tjC20UIrB
         eKzieAgfiazEPPTdviy6qdYfJPT4UgLFgFwaSPqKrDj0AnK268e6ELNhgbBqomXmibd3
         N24gc2nvWkJ0aCdXj8zOmK1g1PxO7lg2YKVgKmQ3051hkb7jwt6IohEC4incD0dFFNgS
         WLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=zaJXQQxpUfkCKYxDeiXkTvMXdYN/upCq77agHjkzWGg=;
        b=okt/7LAIrqUYJfM6h4nRcSUoKvaOjlrcuf0s7ftt4JodbDqSUJ2DLTWaMCl0wjQujk
         qA5q7TqqW06bfwGxgnlsqHSVAkknWwogA4lFwPGjwbh6Avph/lQz6SmU/AE9VKQOD0Ns
         KuuaUrDu0QQ+HxY7auVVUAUNOMNpRvns3Dq8TQyhpBraW9eWf8cIJZXcWckLIJnX3VcC
         /h8mR9uX66LjTInAQH6xHoOdslXTre/jXfB/kXkM0k/supGYtKREAtDpULJGwWmgk7TZ
         RKdgvkNs42yLL4R1iuqe01N5hE/L+YqDUjhxjYhyFziCsT5wjjgcbfQef9Ipk3iSEGre
         OJsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si3601274eda.111.2019.09.18.06.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 06:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAZhE-000498-RZ
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 09:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgo-00046t-Lf
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgm-0003CR-QS
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:10 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42438 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgm-00031p-Fb; Wed, 18 Sep 2019 09:08:08 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A3F8C43B493B396779E0;
 Wed, 18 Sep 2019 21:07:57 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Sep 2019 21:07:48 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 18 Sep 2019 14:06:22 +0100
Message-ID: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH-for-4.2 v11 00/11] ARM virt: ACPI memory hotplug
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
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B/k88iuXZYKG

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

v10 --> v11
-Changed patch #10 to update bios-tables-test-allowed-diff.h with a
 list of expected ACPI tables.
-GED document changed to rst format (patch #9)
-Addressed comments from Igor (patch #3 & #5)
-Igor's R-by to #7, #8 & #11.

v9 --> v10
 -Fix for "make check" failure on x86_64(Patch #1).
 -Minor updates based on Eric's comments.
 -Dropped patch "hw/arm/virt: Add 4.2 machine type" as this is already
  in master now.
 -Added R-by tags by Eric.

v8 --> v9
 -Changes related to GED being a TYPE_SYS_BUS_DEVICE now.
 -Re-arranged patches 8 and 9.
 -Added GED ABI documentation(patch #10).
 -Added numamem and memhp tests to arm/virt(#11 and #12)
 -Dropped few R-by tags as code has changed a bit.
 -Please see Individual patch history for details.
 
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

Shameer Kolothum (8):
  hw/acpi: Make ACPI IO address space configurable
  hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
  hw/arm: Factor out powerdown notifier from GPIO
  hw/arm: Use GED for system_powerdown event
  docs/specs: Add ACPI GED documentation
  tests: Update ACPI tables list for upcoming arm/virt tests
  tests: Add bios tests to arm/virt

 docs/specs/acpi_hw_reduced_hotplug.rst |  70 ++++++
 docs/specs/index.rst                   |   1 +
 hw/acpi/Kconfig                        |   4 +
 hw/acpi/Makefile.objs                  |   1 +
 hw/acpi/generic_event_device.c         | 311 +++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c               |  43 ++--
 hw/arm/Kconfig                         |   4 +
 hw/arm/virt-acpi-build.c               |  35 ++-
 hw/arm/virt.c                          | 124 +++++++++-
 hw/i386/acpi-build.c                   |   7 +-
 hw/i386/pc.c                           |   3 +
 include/hw/acpi/acpi_dev_interface.h   |   1 +
 include/hw/acpi/generic_event_device.h | 103 ++++++++
 include/hw/acpi/memory_hotplug.h       |   9 +-
 include/hw/arm/virt.h                  |   5 +
 include/hw/i386/pc.h                   |   3 +
 tests/bios-tables-test-allowed-diff.h  |  16 ++
 tests/bios-tables-test.c               |  49 ++++
 18 files changed, 748 insertions(+), 41 deletions(-)
 create mode 100644 docs/specs/acpi_hw_reduced_hotplug.rst
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h

-- 
2.17.1



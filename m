Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp653025wrg;
        Wed, 22 May 2019 09:24:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXmKfoLVhUAu6ZjkrBbJLHR4AbcI+ahZnIXsCQANmdXG98j2uCa96QheislEAMqWD9usAp
X-Received: by 2002:a50:a522:: with SMTP id y31mr89958604edb.69.1558542275483;
        Wed, 22 May 2019 09:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558542275; cv=none;
        d=google.com; s=arc-20160816;
        b=rfOz8jIAtBWoTEHDZYUA9Vjcx/SEGu0MZcamChTidbBrxem8rcJJeWVGpy3HjE8C+m
         a60mpW68T9VpIOY6otad1X2Y5VIOx8tUagsVHTv/YmWFKqTZ3XlJF9NKVQHmC+Njjasx
         g3HeL3F6/0f49Q0rE3XhiH7vvl17+bXwZnYTMoHeQ2TH9DnWsNyZlCUvgiasPu+bxxyV
         ciTfnd1tLA4LMnVgX/ra2QS5tPBdCbd912VesCPeR+hTdzezbHaWdxghASZxbdd4MreZ
         QCCXnxOFrLmJ/7iXRUpFSl7Tu45Zo93CsyR4R0Al3gPhbOfE5ESgC/52AD2QGSdHKeSv
         JJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=o3FHWblU4CydKSBytpmqIIcE1pnl9XMBt5NrKHdakT0=;
        b=iFbeXpeLFOSpwQHA336clWJlGk09ESHUN0sAA16Plq5wZhu3Y+dpwi+m/Dtaaz8XFu
         y8zDO02Pi+lLLSwEBQOn/f/YHpfh4H3e6/9czhzNcaXhw+9k9zAKL9r5eVyEfbcu1/Dm
         gQGIAGXlgZMcLzwlcnhlxnTuviRzCE/x1EO7DOQX69npfXZeIcgGTJMiQ90PqCAW7wzE
         JeND4rl/jfb9gLqRa9akOZPTnbzpJVt9SNZCOMvstqz3vZOdX/3tiiIqCICXaYuKeMDg
         FS+mJhJOOZe0x7MmuaqWrS+2GwWXZ6OTEJnFwJvc+sj/6g51Psei/iPmPOUfnj6DE3TY
         AAEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si13998162ejg.384.2019.05.22.09.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 09:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTU2c-0006EN-Ih
	for alex.bennee@linaro.org; Wed, 22 May 2019 12:24:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU2T-0006EE-PD
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:24:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU2S-0000Wb-Gj
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:24:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41102 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU2R-0007zo-Sw; Wed, 22 May 2019 12:24:24 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id F2929D413ED8CDFFE42B;
	Thu, 23 May 2019 00:24:03 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 23 May 2019 00:23:56 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Wed, 22 May 2019 17:22:44 +0100
Message-ID: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v5 0/8] ARM virt: ACPI memory hotplug support
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zv44mfPaozD+

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

Shameer Kolothum (5):
  hw/acpi: Make ACPI IO address space configurable
  hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
  hw/acpi: Add system power down support to GED
  hw/arm: Use GED for system_powerdown event

 hw/acpi/Kconfig                        |   4 +
 hw/acpi/Makefile.objs                  |   1 +
 hw/acpi/generic_event_device.c         | 348 +++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c               |  35 +--
 hw/arm/Kconfig                         |   4 +
 hw/arm/virt-acpi-build.c               |  58 ++---
 hw/arm/virt.c                          |  88 ++++++-
 hw/i386/acpi-build.c                   |   3 +-
 include/hw/acpi/generic_event_device.h | 106 ++++++++
 include/hw/acpi/memory_hotplug.h       |   9 +-
 include/hw/arm/virt.h                  |   3 +
 11 files changed, 603 insertions(+), 56 deletions(-)
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h

-- 
2.17.1



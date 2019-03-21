Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp98892wrx;
        Thu, 21 Mar 2019 03:58:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpZ9V7TwHuHW5ZUgQyYbLT6B5QnnZ413DZuOWolNplMakOXYSPXmg535GKUQaHoYP8zQCT
X-Received: by 2002:a5d:5343:: with SMTP id t3mr2168152wrv.49.1553165906663;
        Thu, 21 Mar 2019 03:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165906; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoESOrdD3/iTEjTJcHHTRtoOqWVZ/wJcOVATgFbI+DBlQIVJfOVV559WKIDlY3NdlU
         s/Fk7B4t/QVibnohnvS0rMCHQ01jvzVWh23PgR8T9jYC1aG7MM5eecbgfXEQudeeO1Qd
         o3cMLL67jJy3r0972DQHIabN4NwSQzW1/goYG5jxvaTz/64Zf5qnKL2J1RynIX7AZJvW
         VAZhyVRZ+GKdjqOU1zJR4tTx25g/On2yI0boeJJX8gScNof7h9lpaNBtJMbOiMy43QRK
         HToBMe73TK8AgnKbiObAyEJ/FHfHcsEO/Eo+ZR0tyNG4t/DnkpVAh/UXl0rpc5fw9e64
         liIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=JlBhsCDmGccdiqAUJuiUIKIur6Ur7+hKrDXLHL1AMM8=;
        b=c9cZgAQPMS2gUBlXZnvUFeDO82DgbZumgofAA2ic/Q9ZiazAI7aGDA7sMyEvOMPXvy
         LBLof41b/jAk/hCusZ46CjrtuWDeKrrIN+jRxkSGWam8d9LPIhIIMMke6sndCtzHiqtf
         64ca2MJBlJbYFE+yAB42l/oRWlQsKscahvBNVRrgMOBGIWW/oUZVTDGnSziPhXT5r7qp
         gqalXGjqJdVG6BzvPgBAWdhtQ7EJfZtq7VlSVTZA3QtSyZOI9EvmzKatyrYxevaztZEx
         XZDSF5eJ7IHDc2uPJVn8fAA0dbrjYu/BD07LfL+udUpbuJCc6zquT27VOI4bDuMvvjEb
         RUbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si3104239wrj.112.2019.03.21.03.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vOz-000215-Dc
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:58:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHm-0004Td-DR
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFp-0001CX-Rn
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:48:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2251 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFp-0000Mn-7g; Thu, 21 Mar 2019 06:48:57 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id AA5F01A24D99B9141026;
	Thu, 21 Mar 2019 18:48:47 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:48:37 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:35 +0000
Message-ID: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v3 00/10] ARM virt: ACPI memory hotplug support
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
X-TUID: SP5QxiUdXRUI

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

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10837565/
[2] https://patchwork.kernel.org/cover/10783589/
[3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c

v2 --> v2

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

Samuel Ortiz (3):
  hw/acpi: Do not create memory hotplug method when handler is not
    defined
  hw/arm/virt: Add virtual ACPI device
  hw/acpi: Add ACPI Generic Event Device Support

Shameer Kolothum (6):
  hw/acpi: Make ACPI IO address space configurable
  hw/arm/virt: Add ACPI support for device memory cold-plug
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
  hw/arm/virt: Introduce opt-in feature "fdt"
  hw/arm/boot: Expose the PC-DIMM nodes in the DT
  hw/arm/virt: Init GED device and enable memory hotplug

 default-configs/arm-softmmu.mak        |   5 +
 hw/acpi/Kconfig                        |   4 +
 hw/acpi/Makefile.objs                  |   1 +
 hw/acpi/generic_event_device.c         | 313 +++++++++++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c               |  34 ++--
 hw/arm/boot.c                          |  44 +++++
 hw/arm/virt-acpi-build.c               |  27 +++
 hw/arm/virt.c                          | 121 ++++++++++++-
 hw/i386/acpi-build.c                   |   3 +-
 include/hw/acpi/generic_event_device.h |  68 +++++++
 include/hw/acpi/memory_hotplug.h       |   8 +-
 include/hw/arm/virt.h                  |   5 +
 12 files changed, 614 insertions(+), 19 deletions(-)
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h

-- 
2.7.4



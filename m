Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4556403wrx;
        Tue, 9 Apr 2019 03:31:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytgHBp7ZtqE2orrdW/j8T6/Wro1lFfFj6JCrvcFF12AdiZ277qDv9ys8ayjsru2UpU58xY
X-Received: by 2002:a5d:4646:: with SMTP id j6mr15220577wrs.56.1554805874871;
        Tue, 09 Apr 2019 03:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554805874; cv=none;
        d=google.com; s=arc-20160816;
        b=Vzt9hrBVkhW+ECFLFzR73YAwIrasYhQrZqP2WXhNYpum+EYl0VDhwtG87QgE8HxckW
         4lA89QrGZ4DvSRdh18+TEKZu1NnGxJMu3bsBjmMg6P84/sIHUC03SjYt+3ZVrsIbL+cs
         Be4F/UZYEQ8umBNMn5pDv1MRFJ/PA9kxCUck5atp7BgUT36I2of1UphLXgTvuM/ZR6wB
         5SUXqn0Pn9F7FkQz63LQ3ZGGsobOnhNZV31ZBNBPk70v1Yc1IHHffNOcoJC4Rou2KCQI
         eG/bUPDQ87o6HrOM7VPiEfYAIDFbRQ/7vwiSVBOZPSKOa2D3XqgIv9paChpV6U3LuNN2
         UaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=kdilPfxWykdeAXVOex3XY9Kif17wCI074OGxw2DnLr4=;
        b=SWfFmGTtrdyduoHV5Zrm4+DMJEPg5XTpFaxf7FamJRmB2fwJt1XYypHzMgsF49H95+
         10L3i/e75k1mMM2dtZ61LDcLf3XQddNVke8CxOECAs3I1ZGeBb3JEcfIjwuFz/wvAZ9f
         tpWR66uPALT7k+zUgZamH639iag3DVeE2cIrjemBn0ZVMVQlk2stOUMUvzT0ALtZOMCM
         J/ErdO6dZ1vgZc69O+nGIGzSnUaFcpsakmb6eBYLmCSkKqRzMcYijZASTpDNHVx/U44F
         Jow5wHT7RhviIhMbni0k1gnypELnVag7ZI9/1ZYyk/QaIs9LuZev7pmgAct87uhP40LJ
         29Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si20400040wro.36.2019.04.09.03.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 03:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDo25-00062r-RA
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 06:31:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1q-00062J-9B
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1p-0007G4-02
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:30:58 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2258 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1o-0007Bx-GR; Tue, 09 Apr 2019 06:30:56 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 5C57B8640ACF8D4AC4B1;
	Tue,  9 Apr 2019 18:30:47 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 9 Apr 2019 18:30:40 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Tue, 9 Apr 2019 11:29:27 +0100
Message-ID: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v4 0/8] ARM virt: ACPI memory hotplug support
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
X-TUID: qIbhHhLd3EA2

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
  hw/arm/boot: Add "hotpluggable" property to DT memory node
  hw/arm/boot: Expose the PC-DIMM nodes in the DT

 default-configs/arm-softmmu.mak        |   5 +
 hw/acpi/Kconfig                        |   4 +
 hw/acpi/Makefile.objs                  |   1 +
 hw/acpi/generic_event_device.c         | 311 +++++++++++++++++++++++++++++++++
 hw/acpi/memory_hotplug.c               |  35 ++--
 hw/arm/boot.c                          |  64 ++++++-
 hw/arm/virt-acpi-build.c               |  18 ++
 hw/arm/virt.c                          | 102 ++++++++++-
 hw/i386/acpi-build.c                   |   3 +-
 include/hw/acpi/generic_event_device.h | 121 +++++++++++++
 include/hw/acpi/memory_hotplug.h       |   9 +-
 include/hw/arm/virt.h                  |   4 +
 12 files changed, 654 insertions(+), 23 deletions(-)
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h

-- 
2.7.4



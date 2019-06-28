Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2707660wru;
        Fri, 28 Jun 2019 10:00:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2uN4nCuBlXC+4jaofJn8ISCW8HXhIDDKCskm18Vvbhyvw7Xt0qPVr8BJiF9IHPgEYV0Vs
X-Received: by 2002:a50:fb86:: with SMTP id e6mr12702125edq.203.1561741227685;
        Fri, 28 Jun 2019 10:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561741227; cv=none;
        d=google.com; s=arc-20160816;
        b=gJezw86H/RKs+/LPljhM4RcPcZnVp7sKuntkGN/lC3lL5FreB/d2PVEwU4Pb+BzR60
         SGOXj5KMAoWOcpcsKvtVwEL2603T2W8E2/uFwiiBP4JFP7x++XSnqi43pGdp/kCTCPGH
         392a2e2RwldMEd2/blsoz4PL9CIQnpicsPl52nGX4wNPVCGNLcUhPDHDafo3YhnjqqRv
         6NRxxi62t6OXwOKqZzW6H5XR/35X6DU5emCZEA5zhNaVmhBdoZ8xYc/wqDW1QbWcFjzv
         WLEH0drDQjvZo628fnQ+nssS5+L0ToV5MANLRXCHG3rRY9QdOL3+Fuzzq6MWZE7lF+D7
         SR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=2QQVLiNMISeDK5ErLNcuViCZa4sSWJxKmw+pUJbxQtk=;
        b=vtCr+SosAT7MMYIuRQyaFBMekS1/EIRAnUNJdT2LDUaH/LY2txgzEM0WSntSTpnfoH
         ep0SqbPhjSkEMc+33HKeE8wXh6/ZSha7tNhikqUJon6hAzMY0X3I9eq3Rpl0VGco44t8
         x/DDUmOZgPFTVWinh9cTrcuRjJjWqZLK6wf02LpSpw0sY8PBfk7BiFvkqCsYwHiDWC20
         WSm4DxPQ8ERjzly08jLECrT1jJSQcGgjJEOPeM3VqZDC8bvBikWrDHfL11CZ2//lc45z
         M8Ucrq+1DwVqHADcsRix9VFty9fZXagbwynIsYQPQFr6cTF4oAla0eEGHoLk8i30Blcp
         gL1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l58si2709747edb.340.2019.06.28.10.00.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 10:00:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hguEc-00018X-N6
	for alex.bennee@linaro.org; Fri, 28 Jun 2019 13:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46625)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hguAx-0007ZP-89
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 12:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hguAu-0003c0-F1
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 12:56:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55372)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hguAu-0003bc-6s; Fri, 28 Jun 2019 12:56:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0D6CA30832D3;
 Fri, 28 Jun 2019 16:56:35 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7955C888;
 Fri, 28 Jun 2019 16:56:28 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <86a13b18-f339-0436-6301-72afb000ed45@redhat.com>
Date: Fri, 28 Jun 2019 18:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 28 Jun 2019 16:56:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 0/8] ARM virt: ACPI memory hotplug support
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
X-TUID: CgVz3Zp51LiF

Hi Shameer,

On 6/25/19 2:14 PM, Shameer Kolothum wrote:
> This series is an attempt to provide device memory hotplug support 
> on ARM virt platform. This is based on Eric's recent works here[1]
> and carries some of the pc-dimm related patches dropped from his
> series.
> 
> The kernel support for arm64 memory hot add was added recently by
> Robin and hence the guest kernel should be => 5.0-rc1.
> 
> NVDIM support is not included currently as we still have an unresolved
> issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
> can be included, but not done for now, for keeping it simple.
> 
> This makes use of GED device to sent hotplug ACPI events to the
> Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
> Sebastien to add the hardware-reduced support to Nemu using GED
> device[3]. (Please shout if I got the author/signed-off wrong for
> those patches or missed any names).
> 
> This is sanity tested on a HiSilicon ARM64 platform and appreciate
> any further testing.

Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> 
> Thanks,
> Shameer
> 
> [1] https://patchwork.kernel.org/cover/10837565/
> [2] https://patchwork.kernel.org/cover/10783589/
> [3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
> [4] http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/651763.html
> 
> v5 --> v6
> 
> -Addressed comments from Eric.
> -Added R-by from Eric and Igor.
> 
> v4 --> v5
> -Removed gsi/ged-irq routing in virt.
> -Added Migration support.
> -Dropped support for DT coldplug case based on the discussions
>  here[4]
> -Added system_powerdown support through GED.
> 
> v3 --> v4
> Addressed comments from Igor and Eric,
> -Renamed "virt-acpi" to "acpi-ged".
> -Changed ged device parent to TYPE_DEVICE.
> -Introduced DT memory node property "hotpluggable" to resolve device
>  memory being treated as early boot memory issue(patch #7).
> -Combined patches #3 and #9 from v3 into #3.
> 
> v2 --> v3
> 
> Addressed comments from Igor and Eric,
> -Made virt acpi device platform independent and moved
>  to hw/acpi/generic_event_device.c
> -Moved ged specific code into hw/acpi/generic_event_device.c
> -Introduced an opt-in feature "fdt" to resolve device-memory being
>  treated as early boot memory.
> -Dropped patch #1 from v2.
> 
> RFC --> v2
> 
> -Use GED device instead of GPIO for ACPI hotplug events.
> -Removed NVDIMM support for now.
> -Includes dropped patches from Eric's v9 series.
> 
> Eric Auger (1):
>   hw/arm/virt: Add memory hotplug framework
> 
> Samuel Ortiz (2):
>   hw/acpi: Do not create memory hotplug method when handler is not
>     defined
>   hw/acpi: Add ACPI Generic Event Device Support
> 
> Shameer Kolothum (5):
>   hw/acpi: Make ACPI IO address space configurable
>   hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>   hw/acpi: Add system power down support to GED
>   hw/arm: Use GED for system_powerdown event
> 
>  hw/acpi/Kconfig                        |   4 +
>  hw/acpi/Makefile.objs                  |   1 +
>  hw/acpi/generic_event_device.c         | 352 +++++++++++++++++++++++++
>  hw/acpi/memory_hotplug.c               |  35 +--
>  hw/arm/Kconfig                         |   4 +
>  hw/arm/virt-acpi-build.c               |  58 ++--
>  hw/arm/virt.c                          |  88 ++++++-
>  hw/i386/acpi-build.c                   |   3 +-
>  include/hw/acpi/generic_event_device.h | 106 ++++++++
>  include/hw/acpi/memory_hotplug.h       |   9 +-
>  include/hw/arm/virt.h                  |   3 +
>  11 files changed, 607 insertions(+), 56 deletions(-)
>  create mode 100644 hw/acpi/generic_event_device.c
>  create mode 100644 include/hw/acpi/generic_event_device.h
> 

Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp948455wrp;
        Wed, 25 Sep 2019 08:36:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyP4uBuzSiRdTixwM6bN1RaUoCUFBDnBeXn7igjzEGiGfvD15/JfnkWGyQkFcD4nVMupyU0
X-Received: by 2002:aed:35ef:: with SMTP id d44mr9564803qte.306.1569425777935;
        Wed, 25 Sep 2019 08:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569425777; cv=none;
        d=google.com; s=arc-20160816;
        b=IPYMLEjAtTQRPVRlR+IDt8i5rPhe4D6ee4prynJ00+Eykg2Ax9kwL5aa+YknPNXHsT
         zLkYRbjcOXB4qN/BgR7HtegNCtaIXhhVFkmhKpQrCY/HWC9RlZDsZJtzgnXZeXMFbVFs
         TLa43fwtn5p2f/Rcvza7oie1SQntBszWZF+QtXn65CoS6SNid9hznjBka9EWNzAW2LYl
         hWqaxJSNvekFvjGw9ag5aKBvyzlAi7P8a5QymgdDdWCcsA6jlavd95KHQgAGMMx31IoF
         GR57tczWZ986J36mey6BE2n4OKLK2HR0mH+CL00k124BUX1P5SODsIoBVeT/97dAICQm
         Ln+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=e/bmLjCa9Rajlqe45lLMWmkvo103KWdADdqgmLTMxIc=;
        b=ZuVw7dMnAKhYNRGpAZKPX+YXrruYxUpdHqj3Gwpq0rNVK3v1r6ucnIxo8iZ4HKXEM4
         udbT3DQt8DvGqGNdCIBdUwheABgFWNq+fh1OZndiF2/4tYKb1Qkmv2yRh8Ot+GvgIQWw
         Wa5tpMtrYfTlZGG/KCmgmAWmYSe/0jDnmxMK8twRPnl3v47Htg8oEugUoICtDzBVmC8t
         y+wPech6Px+ibhHlV2BB+S/oGL6UBM6jXc4noa/TEVf6GGmbJtT1ZMZDfcJy1ljfJ/q+
         C/oI4ydSaG2Q6NPnGshVEq8CsuVxo+kjbNZA1upaZZox7C24g+bdG+58FtMjrYO0cc+0
         0MDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si4428457qtj.253.2019.09.25.08.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 08:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD9Ky-00086v-KV
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 11:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iD9Dp-0001nT-F2
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iD9Dn-0000Ot-NE
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:28:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41706)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iD9Dn-0000Oc-Eb
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:28:51 -0400
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FD118830C
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 15:28:50 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id r17so5801135qkm.16
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 08:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e/bmLjCa9Rajlqe45lLMWmkvo103KWdADdqgmLTMxIc=;
 b=iSVkcn66BHZPesM4ZCI9ONvo5jykzZl0889MlAXHXhhQuoP8qLYfUPnXTw/hZ4iduZ
 xN9lHq8JACiM/WdI6MZXDpqTtRMbKNJal4WLGrrg3ehJrL2X3DFmyOr8iXcN5c5mWZYc
 mWUQ0TGx8blZG7sEjKcbgnj1Lnmz+ujyVXslvgEADce79bAelaJj1DzlbECWaYTrJLbh
 GSKc06AArL5FN1E69JMZft6kLXH3LQL+nTohcXSmey5/z3xjkV8jx7/Vbt+ML3bWZBIv
 xq90loETTv1v2g8WUTyeCEcE9lLqKMvE4JLhlfUKePeZxdT3VV5VYn5olcMgd1KAjQLB
 dZfQ==
X-Gm-Message-State: APjAAAXnNpAuYD1F2381C8xdqNwj/Ik5yivEE0uziTL0m5bgoew7eBnK
 A5FJ3OTHCUt7U+zFpALtmS2bp0W03Zqo87Qn3xq9jmuHbb/C3t4RwacCOap2psySpTcPYFKWyeU
 tEGK45NFGjYFD
X-Received: by 2002:a37:9503:: with SMTP id x3mr4118670qkd.418.1569425329800; 
 Wed, 25 Sep 2019 08:28:49 -0700 (PDT)
X-Received: by 2002:a37:9503:: with SMTP id x3mr4118639qkd.418.1569425329540; 
 Wed, 25 Sep 2019 08:28:49 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id 194sm2768893qkm.62.2019.09.25.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 08:28:48 -0700 (PDT)
Date: Wed, 25 Sep 2019 11:28:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH-for-4.2 v11 00/11] ARM virt: ACPI memory hotplug support
Message-ID: <20190925112804-mutt-send-email-mst@kernel.org>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KZUhYKgWhdRt

On Wed, Sep 18, 2019 at 02:06:22PM +0100, Shameer Kolothum wrote:
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
> 
> Note:
> Attempted adding dimm_pxm test case to bios-tables-test for arm/virt.
> But noticed the issue decribed here[5]. This is under investigation 
> now.
> 
> Thanks,
> Shameer


Which tree is this going through? Mine or ARM?


> [1] https://patchwork.kernel.org/cover/10837565/
> [2] https://patchwork.kernel.org/cover/10783589/
> [3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
> [4] http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/651763.html
> [5] https://www.mail-archive.com/qemu-devel@nongnu.org/msg632651.html
> 
> v10 --> v11
> -Changed patch #10 to update bios-tables-test-allowed-diff.h with a
>  list of expected ACPI tables.
> -GED document changed to rst format (patch #9)
> -Addressed comments from Igor (patch #3 & #5)
> -Igor's R-by to #7, #8 & #11.
> 
> v9 --> v10
>  -Fix for "make check" failure on x86_64(Patch #1).
>  -Minor updates based on Eric's comments.
>  -Dropped patch "hw/arm/virt: Add 4.2 machine type" as this is already
>   in master now.
>  -Added R-by tags by Eric.
> 
> v8 --> v9
>  -Changes related to GED being a TYPE_SYS_BUS_DEVICE now.
>  -Re-arranged patches 8 and 9.
>  -Added GED ABI documentation(patch #10).
>  -Added numamem and memhp tests to arm/virt(#11 and #12)
>  -Dropped few R-by tags as code has changed a bit.
>  -Please see Individual patch history for details.
>  
> v7 --> v8
>  -Addressed comments from Igor.Please see individual patches.
>  -Updated bios-tables-test-allowed-diff.h to avoid "make check"
>   failure (patch #6) and dropped patch #10
>  -Added Igor's R-by to patches 4 & 5.
>  -Dropped Erics's R-by from patch #9 for now.
> 
> v6 --> v7
> - Added 4.2 machine support and restricted GED creation for < 4.2
>   This is to address the migration test fail reported by Eric.
> - Included "tests: Update DSDT ACPI table.." patch(#10) from Eric
>   to fix the "make check" bios-tables-test failure.
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
> Shameer Kolothum (8):
>   hw/acpi: Make ACPI IO address space configurable
>   hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>   hw/arm: Factor out powerdown notifier from GPIO
>   hw/arm: Use GED for system_powerdown event
>   docs/specs: Add ACPI GED documentation
>   tests: Update ACPI tables list for upcoming arm/virt tests
>   tests: Add bios tests to arm/virt
> 
>  docs/specs/acpi_hw_reduced_hotplug.rst |  70 ++++++
>  docs/specs/index.rst                   |   1 +
>  hw/acpi/Kconfig                        |   4 +
>  hw/acpi/Makefile.objs                  |   1 +
>  hw/acpi/generic_event_device.c         | 311 +++++++++++++++++++++++++
>  hw/acpi/memory_hotplug.c               |  43 ++--
>  hw/arm/Kconfig                         |   4 +
>  hw/arm/virt-acpi-build.c               |  35 ++-
>  hw/arm/virt.c                          | 124 +++++++++-
>  hw/i386/acpi-build.c                   |   7 +-
>  hw/i386/pc.c                           |   3 +
>  include/hw/acpi/acpi_dev_interface.h   |   1 +
>  include/hw/acpi/generic_event_device.h | 103 ++++++++
>  include/hw/acpi/memory_hotplug.h       |   9 +-
>  include/hw/arm/virt.h                  |   5 +
>  include/hw/i386/pc.h                   |   3 +
>  tests/bios-tables-test-allowed-diff.h  |  16 ++
>  tests/bios-tables-test.c               |  49 ++++
>  18 files changed, 748 insertions(+), 41 deletions(-)
>  create mode 100644 docs/specs/acpi_hw_reduced_hotplug.rst
>  create mode 100644 hw/acpi/generic_event_device.c
>  create mode 100644 include/hw/acpi/generic_event_device.h
> 
> -- 
> 2.17.1
> 

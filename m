Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3680109wru;
        Tue, 2 Jul 2019 04:08:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzG3K0pS4kwIHTQ+wn+lg+e9XYgeW5IiH2hS82l2PAzmFklLD+IYU87P6ANmY/dDCAQ3t9B
X-Received: by 2002:a17:906:4555:: with SMTP id s21mr27843784ejq.199.1562065737667;
        Tue, 02 Jul 2019 04:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562065737; cv=none;
        d=google.com; s=arc-20160816;
        b=XFMNC1l0SpPe9sOPOH4EklhR55ixx+agOlBm896x6ZZPMPNOra7shbmfMfSANg6Abb
         8Vvw0arNWwwxnb0jAVfKhyRZ9fPPQjduyyYGGRJY7yOtW3NosxoE1vnczscUZvxcT2mJ
         RdHG/tRjUmYuJGICpAAuBEWgaINN8HDVvF9+WQjsDCmDw/B7uBtei/Xtmo7vzyoT7mLJ
         TH2MXWX+K3z+1iP1C9Q813XmG7y0VjdRUK+zTbVvs0EZVdco79gqDq6b0vVNaezuE0ee
         pffCPzC5XKw4kWvPpKO+tGNGOX9nLdhLzVOERHpjVo4qZcxiAgDgChNqbqeSwA1c4UyW
         eX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=14zysge9kbKTrMJ9eOjU/kbMaZqlHtztYaniq1p6i9E=;
        b=CZRMKOaOcJQ4S9S1SfdXuYwtn3fcW6bsKVZJ2UAXLCn1tuP9TFh0ZrPeINHcCEbD6g
         NSUQYYy5uZ7SRH2pLoNSm5kAueQxiuFdt+To/TEGJhZsJsr6DKbrwyIJ5tCp+JPNNErn
         KG1uvoEtl77ATCHkF1bS0n3CFD9Eq3Qlz4vYHmQYdsQfNq8d9MeLUxxC0viwfeY74PLu
         K/yGGDsX+USEMndKHQmV4dC3TBtPhynI3nK4lcpjmkRo6j9+m63Ty+KckmqS8h4rfNaA
         4g2aCXAEX3quJ1g6QskXSmrI1EeHw8aJIikjjApK8h6z2GQC5XUBp0ibPBm3tBcsPF3m
         pPiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t55si11710452edd.95.2019.07.02.04.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 04:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiGee-0001BS-PB
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 07:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hiGdC-0007fB-21
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 07:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hiGdA-0001Qh-Kv
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 07:07:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hiGdA-0001O3-BK; Tue, 02 Jul 2019 07:07:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DBF88552A;
 Tue,  2 Jul 2019 11:07:18 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDCF25C1A1;
 Tue,  2 Jul 2019 11:07:07 +0000 (UTC)
Date: Tue, 2 Jul 2019 13:07:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190702130703.0e74cbe6@redhat.com>
In-Reply-To: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 02 Jul 2019 11:07:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 0/8] ARM virt: ACPI memory
 hotplug support
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
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tVCcYUYd5EAo

On Tue, 25 Jun 2019 13:14:13 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

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

There are several things I'd fix/amend but it's nothing that couldn't
be done on top as bugfixes (I'll comment later on specific issues).

However as a whole from ACPI and memory hotplug POV series looks more
or less ready for merging.

I've asked Eric to test migration (I'm quite not sure about that part),
(CCed David)so on condition it works:

  Reviewed-by: Igor Mammedov <imammedo@redhat.com>


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


Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8531146wrx;
        Fri, 8 Mar 2019 07:55:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbHC7J1q3YX5utsxftjh/LAElfynv93KLsNBpFoL/sxZIEthQHMVARcwe6/i9sOsDrx2g9
X-Received: by 2002:a0d:ea86:: with SMTP id t128mr4009397ywe.432.1552060556043;
        Fri, 08 Mar 2019 07:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552060556; cv=none;
        d=google.com; s=arc-20160816;
        b=DjcBkeW0WZBmaINVqOwOegDLZjRie5OHvqAvEVWbf41H3+pPMu37Nns1sI8rXPGhc8
         dt/9KVmvOmwPLH5w8dt2q87bgnvhTFffE9ANdlvOFfEmMNDu05vcWSLQ48or51gbUYZO
         JjtSU9frfQkwOYzxrROblRaRSpdPQurkjF+mBGKNmR9K8RRjPP4rE0BeAULNzE8c1+4x
         QF9KJnBCIv7KdFy0xKsHnFfEoOWRNY0mMnPant/w1ZYoiLscqYSFebDjr+DAfHDrxjGh
         T/xtQs7Qw3Mv4pk209aSiYJuXcve+VN/oetuot+eca76F6AQPTp2gmdQlRuFh/Kard3S
         oMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=LL1I3QNRoCJwn9ylVl2dZokGTxkI0Dmi5qunRfeCIYM=;
        b=kDksmGYozax8cvkFiEWhyaeh3b/fj0G3/AahY8IeeLqBpRZEafMGmzG9ZF976LVIcA
         QclGi0C0ELKSwdGx/rW/17AGA+d5gF5WW1rcbrdL25oTmT5au6+PGrdV3hbDYEfiXYJR
         nYD0fUrkFxcXbl+L+j0d5suRFAsgpjtjWoaXB5awaaKXDkPnHZYBQe0p29h9bGhcNWTy
         zv0O0Jd7LcioxCkqOjPNwiqZ6R520TPHMmahVJserjdRh2Z2Vi3e8sV56LsfEJEGw5DX
         KPaqa/c03mCWn+KER+PRwWSbfip7eiqEGFVHokjdweFVab37Tl3uq6vQ3bQmlfooRDP0
         /tyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p189si5024299ywe.106.2019.03.08.07.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 07:55:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Hql-0001HY-Ir
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 10:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2HpN-0000es-KI
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 10:54:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2HpM-0005fG-Da
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 10:54:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h2HpJ-0005c9-W5; Fri, 08 Mar 2019 10:54:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C90CE81DFF;
	Fri,  8 Mar 2019 15:54:24 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 699375C225;
	Fri,  8 Mar 2019 15:54:20 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7cb625b1-626d-e105-63a7-5c89ef3452ff@redhat.com>
Date: Fri, 8 Mar 2019 16:54:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 08 Mar 2019 15:54:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 00/11] ARM virt: ACPI memory hotplug
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jul8EqzV0szh

Hi Shameer,
On 3/8/19 12:42 PM, Shameer Kolothum wrote:
> This series is an attempt to provide device memory hotplug support 
> on ARM virt platform. This is based on Eric's recent works here[1]
> and carries some of the pc-dimm related patches dropped from his
> series.
> 
> The kernel support for arm64 memory hot add was added recently by
> Robin and hence the guest kernel should be => 5.0-rc1.
> 
> NVDIM support is not included currently as we still have an unresolved
s/NVDIM/NVDIMM
> issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
> can be included, but not done for now, for keeping it simple.
> 
> This makes use of GED device to sent hotplug ACPI events to the
> Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
> Sebastien to add the hardware-reduced support to Nemu using GED
> device[3]. (Please shout if I got the author/signed-off wrong for
> those patches or missed any names).
> 
> This series can be applied on top of Eric's branch here[4].
> 
> This is sanity tested on a HiSilicon ARM64 platform and appreciate
> any further testing.
> 
> Thanks,
> Shameer
> 
> [1] https://patchwork.kernel.org/cover/10837565/
> [2] https://patchwork.kernel.org/cover/10783589/
> [3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
> [4] https://github.com/eauger/qemu/tree/v3.1.0-extended-memmap-v12

You have a minor conflict wrt upstream due to

7c28b925b7  build: convert pci.mak to Kconfig

which adds CONFIG_LSI_SCSI_PCI=y in default-configs/arm-softmmu.mak

Thanks

Eric

> 
> 
> RFC --> v2
> 
> -Use GED device instead of GPIO for ACPI hotplug events.
> -Removed NVDIMM support for now.
> -Includes dropped patches from Eric's v9 series.
> 
> 
> Eric Auger (1):
>   hw/arm/virt: Add memory hotplug framework
> 
> Samuel Ortiz (3):
>   hw/acpi: Do not create memory hotplug method when handler is not
>     defined
>   hw/arm/virt: Add virtual ACPI device
>   hw/acpi: Add ACPI Generic Event Device Support
> 
> Sebastien Boeuf (1):
>   hw/acpi: Move constant definitions to header files
> 
> Shameer Kolothum (6):
>   hw/acpi: Make ACPI IO address space configurable
>   hw/arm/virt: Add ACPI support for device memory cold-plug
>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>   hw/arm/boot: Expose the PC-DIMM nodes in the DT
>   hw/arm/virt: Add GED device configuration and build aml
>   hw/arm/virt: Add GED irq routing and Enable memory hotplug
> 
>  default-configs/arm-softmmu.mak  |   4 +
>  hw/acpi/Makefile.objs            |   1 +
>  hw/acpi/ged.c                    | 198 +++++++++++++++++++++++++++++++++++++++
>  hw/acpi/memory_hotplug.c         |  58 ++++--------
>  hw/arm/Makefile.objs             |   2 +-
>  hw/arm/boot.c                    |  42 +++++++++
>  hw/arm/virt-acpi-build.c         |  31 ++++++
>  hw/arm/virt-acpi.c               | 161 +++++++++++++++++++++++++++++++
>  hw/arm/virt.c                    |  93 +++++++++++++++++-
>  hw/i386/acpi-build.c             |   3 +-
>  include/hw/acpi/ged.h            |  61 ++++++++++++
>  include/hw/acpi/memory_hotplug.h |  31 +++++-
>  include/hw/arm/virt.h            |   8 ++
>  13 files changed, 649 insertions(+), 44 deletions(-)
>  create mode 100644 hw/acpi/ged.c
>  create mode 100644 hw/arm/virt-acpi.c
>  create mode 100644 include/hw/acpi/ged.h
> 

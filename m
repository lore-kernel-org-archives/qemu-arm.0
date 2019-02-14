Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1236050wrp;
        Thu, 14 Feb 2019 09:23:40 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbumVV98dC1P42Bn5xyhcvFHn/S5rfciNbtQKYsVAdrhjkeLvWWZoAMF+VE3nkDUdK8G9lq
X-Received: by 2002:a81:2209:: with SMTP id i9mr4235565ywi.2.1550165020339;
        Thu, 14 Feb 2019 09:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550165020; cv=none;
        d=google.com; s=arc-20160816;
        b=UG3aZXHtgHWszowaVakPAwRV5FqbSbHBF8od4Xs9tLCBqZdMyMMkZzLwh6CQyiL6Cn
         dlXvj3soZcLRzK5yaLFRMFrSK+VXW8XQkn0J/oL/zU2b7kGGLUNOOQKHxlSAPLpnbnQs
         bCnVW87gZ+w3z7lE9kw2BpdEameonUYz8gdtfy702tPPq3Wu5+f71nJqANUUQzKEZ0hj
         GQ+xoKTuqq35k0Q6HybhxH2Ji2K3jObJnl6aDr80k489dTL4ggmFG7Ca056+Tp6qaAHg
         RgZ74193NVJ8kQUT+kHPcs48+B7/2uj2TdVd3K+AKp/snkTg5ZX7Zb0b1sZtmFS3xWTY
         HiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0X2M21ljn1Hvr6z2IRqKKkGLhnSePt0vnRCyu7C75k=;
        b=GdCU1K3T58wvRr20ntCo6n+lq3Q7RvvVKav5gDKOJD90LTXHJixkWSvcWZDqBHuX2p
         q3LTGNQN46dEdTuCsgVktMtuJ3BMUnTOjBownLUbZrV5D7lv4Pby0BXINKu1HjiqxR3G
         6Fn275i6n78YUG8vnK/XWZt96skqGfN6HXM/H5oXIGrdJkQPToww3lWe1gkOeX7HuCCs
         5WqQRtkcFLMzwvftq/A62yO3jhufP6x6PWPEXhgiEwB7TJZWKjavAKc57N2Yb1S47jon
         2PrEJSm8L49u+5yOhBss7Vhf4mtIdK8zEQz0a7lrdMaNPzisIK5aZ7Ie93fcIALvepBo
         ZkaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KysLRzKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b83si1717828yba.304.2019.02.14.09.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 09:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KysLRzKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guKjb-0002ti-OW
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 12:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKeW-0006tZ-3L
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 12:18:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKUQ-0001fq-0Z
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 12:07:59 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKUP-0001Za-Ig
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 12:07:57 -0500
Received: by mail-ot1-x343.google.com with SMTP id v62so2887077otb.3
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 09:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y0X2M21ljn1Hvr6z2IRqKKkGLhnSePt0vnRCyu7C75k=;
	b=KysLRzKr7dmYttPh2v3FNgi4SRWRFOxNRxuTS6dfnAt/jpiVq0JKxPAZjLb9cq2ajp
	yLg8+8lR2PvNzDC9bGqDw4lRsUFuhoRpMHUnAT433PT5kizQVLmUrqa1aMBZH479CdM1
	2obv9E8AgmXLVTATvCYxlfQ/XMwR/gsqN5Qz7vsAto/AkN4YLV9Duc5SiPT9/jGBjP9H
	iQ/dghJYG83iMaSWogM4mgaiziSxO70KTUIYDQ7fZf0bS4kwvSrxNgKNHF/un4kbJIMD
	v6Sv3jrerp9msmP0uaKRUfLLkBmeSR95tsIHc67yrOw5mGHNXDHOgcyNzpg5KIGUtD4x
	b2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y0X2M21ljn1Hvr6z2IRqKKkGLhnSePt0vnRCyu7C75k=;
	b=X4t0hKwrbuxM02ZCkV9f09drlH2JhRCxUHmyHEIZwpI/ZaoEiDK2n4ViznEe1/beN2
	zHM12ZKU8Nno8VvK9P/a1dLR0RBayDN+oh1FPUtca6Fu970qzV8fsYfVHMgUmU4znIYp
	4YL5QB99uAmR42AaPaAAa/L5sW9zsutjsnJsb8pbajaqAXOss04dTAL0GU80/vtMSAVg
	Z7tvDINJgjCYFcwWCvW0n8F6AbspmHn4LzIzrJFUKijFkxIImibXtC1VfpbeYNIEtNP/
	+nMiZPT6YTZ8irOp/XrQCJnAbM+iCrOT1ZTqfQhP2vWJHyhY9P4JBEuhX8vclkDu8TWQ
	n8mg==
X-Gm-Message-State: AHQUAuaZe6tK1AA+qG7l+e2BNL3H/b9v4HccosnDKRka2WDSO2SGpTec
	V25VWvmbLYR6sRpPPBTo5eY3nIHPvsYtjDE3gI3wig==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr2908981otq.316.1550164073123; 
	Thu, 14 Feb 2019 09:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-6-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 17:07:42 +0000
Message-ID: <CAFEAcA9z83y2Xfp0QC5-uKY-6d5zOvxiD=vy7=oG9N2onqCnmA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v6 05/18] hw/arm/virt: Split the memory map
 description
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: muaYxoVIK1H8

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
> In the prospect to introduce an extended memory map supporting more
> RAM, let's split the memory map array into two parts:
>
> - the former a15memmap contains regions below and including the RAM
> - extended_memmap, only initialized with entries located after the RAM.
>   Only the size of the region is initialized there since their base
>   address will be dynamically computed, depending on the top of the
>   RAM (initial RAM at the moment), with same alignment as their size.
>
> This new split will allow to grow the RAM size without changing the
> description of the high regions.

This change makes it clear that "a15memmap" is badly misnamed.
I think we should change it to "base_memmap" here.

>
> The patch also moves the memory map setup into machvirt_init().
> The rationale is the memory map will be soon affected by the
> kvm_type() call that happens after virt_instance_init() and
> before machvirt_init().
>
> At that point the memory map is not changed, ie. the initial RAM can

"At this point" ?

> grow up to 256GiB. Then come the high IO regions with same layout as
> before.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v5 -> v6
> - removal of many macros in units.h
> - introduce the virt_set_memmap helper
> - new computation for offsets of high IO regions
> - add comments
> ---
>  hw/arm/virt.c         | 45 ++++++++++++++++++++++++++++++++++++++-----
>  include/hw/arm/virt.h | 14 ++++++++++----
>  2 files changed, 50 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a1955e7764..2b15839d0b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -29,6 +29,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/arm.h"
> @@ -149,11 +150,20 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> +};
> +
> +/*
> + * Highmem IO Regions: This memory map is floating, located after the RAM.
> + * Each IO region offset will be dynamically computed, depending on the
> + * top of the RAM, so that its base get the same alignment as the size,
> + * ie. a 512GiB region will be aligned on a 512GiB boundary.

I think you should say here that if there is less than 256GiB of RAM
then the floating area starts at the 256GiB mark.

> + */
> +static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> -    [VIRT_HIGH_GIC_REDIST2] =   { 0x4000000000ULL, 0x4000000 },
> -    [VIRT_HIGH_PCIE_ECAM] =     { 0x4010000000ULL, 0x10000000 },
> -    /* Second PCIe window, 512GB wide at the 512GB boundary */
> -    [VIRT_HIGH_PCIE_MMIO] =     { 0x8000000000ULL, 0x8000000000ULL },
> +    [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> +    [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
> +    /* Second PCIe window */
> +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>  };
>
>  static const int a15irqmap[] = {
> @@ -1354,6 +1364,30 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

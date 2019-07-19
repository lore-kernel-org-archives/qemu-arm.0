Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3783475wrv;
        Fri, 19 Jul 2019 09:47:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxeNTZaNqMMWAw7EpFiUSYUS75pXIdLP7dTJ/tztU9OQFQkFCqIqWCndQQCSF4UcuZJyaI
X-Received: by 2002:a17:906:af86:: with SMTP id mj6mr14605069ejb.157.1563554870992;
        Fri, 19 Jul 2019 09:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563554870; cv=none;
        d=google.com; s=arc-20160816;
        b=yGyNYHlqXaGCHld/XwP1g0M2yS0D14DqTuIEfY47fETIW3yY1sSqimw8LxLF5kPvNb
         z6TGOd8Bw5LnQFyZus/X0bj9HFfJmySLa+PQwO/NB9qvDyvrypiWzKRA1vcCMPdCJd5d
         KI+5bld1C+iWuRDPxBPhR3EmB9qqkRQIDYK63WM3bSbmoEZXLqEaYoZ1mzPsfhpv9Cfl
         rgSkEdluZYRAdzH8+wWG5gFrC3V1V1ehLyagoZwA6p0xHpZryvg+CA7+08R2cKorP78B
         nnlncyFzn2XVuYn2fYtUsuH+AGWMOiDQ3q+Lmhjx05nYyDMNWDk7fdOUg8p/xWhgQ3MU
         MFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=vq/1njf9PygBg32sSxcoBRqOUHCJ6SdsFVFBk0xDPU4=;
        b=vaI8B5Y69KeGEpEM539xIFk7Juca73XvvFV4E8X5pXM0QdtaRbYNTHfKtjZFivZ9gB
         uDWEfqRUrCZykxArlDbIlwU5mM9IoHdN33wHxcvv+0M4ki2YAtxh0qEFov+/rYbwLvMI
         xLNO3Er+q46ROOBEldciQ11aAayjbWZJbJa/ybHXLYHiQwu4Ef/MPWhO9LMbj29npbdr
         TOyi9zMMMjQv5d9JdyR+/uWe6W+3D6PymRFTd42wP4Z1VygfHVKX3JcveC8GJ+2rEgjk
         +SfYXlGdAHeecJi6a8sGiYwAHaPwoYm6vMZ7s70ceFO6qUHHIl56wzVlBKDOhV/W09xn
         uD7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si115254ede.193.2019.07.19.09.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2019 09:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hoW2v-0001Nu-Qj
	for alex.bennee@linaro.org; Fri, 19 Jul 2019 12:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.rutland@arm.com>) id 1hoW2s-0001Na-2K
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 12:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.rutland@arm.com>) id 1hoW2q-0006Th-9v
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 12:47:45 -0400
Received: from foss.arm.com ([217.140.110.172]:43914)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <mark.rutland@arm.com>)
 id 1hoW2n-0006IT-1B; Fri, 19 Jul 2019 12:47:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6096344;
 Fri, 19 Jul 2019 09:47:36 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 061A23F59C;
 Fri, 19 Jul 2019 09:47:35 -0700 (PDT)
Date: Fri, 19 Jul 2019 17:47:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190719164729.GA22520@lakrids.cambridge.arm.com>
References: <20190516144733.32399-1-peter.maydell@linaro.org>
 <20190516144733.32399-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516144733.32399-4-peter.maydell@linaro.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.110.172
Subject: Re: [Qemu-arm] [PATCH v2 3/4] hw/arm/boot: Avoid placing the initrd
 on top of the kernel
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/IRyTTP3eQ3

Hi Peter,

I've just been testing on QEMU v4.1.0-rc1, and found a case where the
DTB overlapped the end of the kernel, and I think there's a bug in this
patch -- explanation below.

On Thu, May 16, 2019 at 03:47:32PM +0100, Peter Maydell wrote:
> We currently put the initrd at the smaller of:
>  * 128MB into RAM
>  * halfway into the RAM
> (with the dtb following it).
> 
> However for large kernels this might mean that the kernel
> overlaps the initrd. For some kinds of kernel (self-decompressing
> 32-bit kernels, and ELF images with a BSS section at the end)
> we don't know the exact size, but even there we have a
> minimum size. Put the initrd at least further into RAM than
> that. For image formats that can give us an exact kernel size, this
> will mean that we definitely avoid overlaying kernel and initrd.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/boot.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 935be3b92a5..e441393fdf5 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -999,20 +999,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      if (info->nb_cpus == 0)
>          info->nb_cpus = 1;
>  
> -    /*
> -     * We want to put the initrd far enough into RAM that when the
> -     * kernel is uncompressed it will not clobber the initrd. However
> -     * on boards without much RAM we must ensure that we still leave
> -     * enough room for a decent sized initrd, and on boards with large
> -     * amounts of RAM we must avoid the initrd being so far up in RAM
> -     * that it is outside lowmem and inaccessible to the kernel.
> -     * So for boards with less  than 256MB of RAM we put the initrd
> -     * halfway into RAM, and for boards with 256MB of RAM or more we put
> -     * the initrd at 128MB.
> -     */
> -    info->initrd_start = info->loader_start +
> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> -
>      /* Assume that raw images are linux kernels, and ELF images are not.  */
>      kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
>                                 &elf_high_addr, elf_machine, as);
> @@ -1064,6 +1050,26 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      }
>  
>      info->entry = entry;

Note: this is the start of the kernel image...

> +
> +    /*
> +     * We want to put the initrd far enough into RAM that when the
> +     * kernel is uncompressed it will not clobber the initrd. However
> +     * on boards without much RAM we must ensure that we still leave
> +     * enough room for a decent sized initrd, and on boards with large
> +     * amounts of RAM we must avoid the initrd being so far up in RAM
> +     * that it is outside lowmem and inaccessible to the kernel.
> +     * So for boards with less  than 256MB of RAM we put the initrd
> +     * halfway into RAM, and for boards with 256MB of RAM or more we put
> +     * the initrd at 128MB.
> +     * We also refuse to put the initrd somewhere that will definitely
> +     * overlay the kernel we just loaded, though for kernel formats which
> +     * don't tell us their exact size (eg self-decompressing 32-bit kernels)
> +     * we might still make a bad choice here.
> +     */
> +    info->initrd_start = info->loader_start +
> +        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);

... but here we add kernel_size to the start of the loader, which is
below the kernel. Should that be info->entry?

I've seen this trigger a case where:

* The kernel's image_size is 0x0a7a8000
* The kernel was loaded at   0x40080000
* The end of the kernel is   0x4A828000
* The DTB was loaded at      0x4a800000

... and the kernel is unable to find a usable DTB.

Thanks,
Mark.

> +    info->initrd_start = TARGET_PAGE_ALIGN(info->initrd_start);
> +
>      if (is_linux) {
>          uint32_t fixupcontext[FIXUP_MAX];
>  
> -- 
> 2.20.1
> 

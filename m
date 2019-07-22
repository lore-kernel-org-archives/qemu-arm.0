Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6816263wrv;
        Mon, 22 Jul 2019 04:59:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZ1NCfSzT8tDC7URGa0NsHE7mgxKDksdlQdRc3e10RfhUiA57nNoS2XpuXb+FGs1OT1tGS
X-Received: by 2002:aed:2ca3:: with SMTP id g32mr50551399qtd.359.1563796759670;
        Mon, 22 Jul 2019 04:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563796759; cv=none;
        d=google.com; s=arc-20160816;
        b=T+iVr7XN5yj5QFx/OHRj8fHjttlpadot+m9R9eIPMw4gxPbDw4qJRUoRaTwNV48pCT
         YmNzlyX4IzaOBqLWxcmTT+Yny6BB0BkpI7CvsKYmsu38I5zS/6jUo5lc8FV27IaJkcUI
         bwnNFsvF129G1B04nKnKGpv7w64yET4YzyRQn8ecgxx+w8KZ4xY7NZuDJhTHAbA9Y418
         ZGGczL4cWT11q1FhzFWa1J2tnQTDtCCHNyOsXHVzFMkRXi4yfx9H9pmBAMpi8oVCzyi4
         pZ5xVs0IlmWB1Rvu3VNO5q9/MNDVBHxKn+NMVEhjAK4yL2cuV9vHJAMmIJt6TZgeKPgC
         +Nqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqKQ7cXKJ1z7FTKs4TehgVkv9/3MjuQ1pzUNh98uYSc=;
        b=cHgNSH4Pn8ecwnL1/rMad5/PLM0U35yywk0Rt7QrRjeaojbYPmIO84JRK/Yo9uUJ2/
         2Dsqb0MavGxx9ejBfD4r+kzfN7eEdn5EErZIrw58IotjFrLh9vxFw+wTbUnH/hPT+OUk
         3JAiWikpu9p/HMU6kwTQCVHW2IhswuavXOBc1SnXI2CteuFDRkbYCI7V6ahgyXvqbiUq
         Wva+Zk/UuFOBKrJLaH9Wl0rxJs2BleuhiukvihgplYOxni8cGmTUDUyaCcil2fejcGZU
         rph01EAD7c+m1ubSu+/NbV8f2WOEUzp2NVm37ROxW3XGLLRJBy0RZtR6uuHKeJDijBAK
         GTcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ezZQpMQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h40si26840547qta.172.2019.07.22.04.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 04:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ezZQpMQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpWyM-00027l-OJ
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 07:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56558)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hpWyI-000267-Ex
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 07:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hpWyH-0002MH-4V
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 07:59:14 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hpWyG-0002Lp-TP
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 07:59:13 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so1444076otq.12
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2019 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CqKQ7cXKJ1z7FTKs4TehgVkv9/3MjuQ1pzUNh98uYSc=;
 b=ezZQpMQxrTtc+6pnxh/RFQAAvu4DbBbNg8hEap23CfdzNJ7R2rD6mcnxlqaPrVnqmW
 hC66ZF8cDIAmYKYsRaGVHnIyIeipTuWWro6FOGh1OhEqnB2DrFMs4c5wnL4yz0Pt2LaG
 sBcVpIXgLQr3Fn7AyeCywsYYcCjDePEIjBwX0bHRVu0lqKLNhUMln8OfP1h/BoDAXOvN
 N7LQQ/j6cLottztJuYwbhiNGkb2KVg4J/wWw9A7jBBm1qeNT449wL7Fgg1GV1ftSDmEM
 eiTFYdyAC6w9zgDJS9nYH1uO5xBiTtwnt3fxwFnwAqywoq0TlbbYej8SZchD7c+eLsUc
 kudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CqKQ7cXKJ1z7FTKs4TehgVkv9/3MjuQ1pzUNh98uYSc=;
 b=MJtrDGUR/lkt8CXm9SNYyo7tneG8Sz8BANQuRKm2erjdoIBzTeDKJUtHpRcrl6Ojrs
 tbZj03ScLB5Tq+FjCj3uLaw4DQ2f5oMv28c22aCSzPijZdvet4YyYG3G35ZlM0PEILO+
 nTvt8q0fiSAG8ydWvTFlPETVBhRx/ha05sEUr2ZdfRpSiDo4J/LAEptSnIvFjdWaWGvd
 NwoE87YTLpa5XslA42r6EPJJRqGo6l6WHGOsKqfeZz9eSYCUH+1lwfCiEk5Wy1KzGhc9
 a02z7wfJV6kilJlwE6G4nvgvB13Cjf84SdQ5cLSjOYtXLjv19mi7lds4cBdeLw+VJTah
 pGtA==
X-Gm-Message-State: APjAAAUS+ipB3IXJFzLapNq+H3EJ1dAW0IJxt85jK39PVPcW9UDoy5EU
 HndOc5rWJLG4QjrP70juHoz6/vbkYx7B7/FlPo7prQ==
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr44391642otr.232.1563796752009; 
 Mon, 22 Jul 2019 04:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190516144733.32399-1-peter.maydell@linaro.org>
 <20190516144733.32399-4-peter.maydell@linaro.org>
 <20190719164729.GA22520@lakrids.cambridge.arm.com>
In-Reply-To: <20190719164729.GA22520@lakrids.cambridge.arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2019 12:59:01 +0100
Message-ID: <CAFEAcA_i_0=xAp86RJVSpurAdWfT5KDfgoh6Y51-mwBJa=_QTQ@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6k/JYoOIKHrZ

On Fri, 19 Jul 2019 at 17:47, Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Peter,
>
> I've just been testing on QEMU v4.1.0-rc1, and found a case where the
> DTB overlapped the end of the kernel, and I think there's a bug in this
> patch -- explanation below.
>
> On Thu, May 16, 2019 at 03:47:32PM +0100, Peter Maydell wrote:
> > We currently put the initrd at the smaller of:
> >  * 128MB into RAM
> >  * halfway into the RAM
> > (with the dtb following it).
> >
> > However for large kernels this might mean that the kernel
> > overlaps the initrd. For some kinds of kernel (self-decompressing
> > 32-bit kernels, and ELF images with a BSS section at the end)
> > we don't know the exact size, but even there we have a
> > minimum size. Put the initrd at least further into RAM than
> > that. For image formats that can give us an exact kernel size, this
> > will mean that we definitely avoid overlaying kernel and initrd.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/boot.c | 34 ++++++++++++++++++++--------------
> >  1 file changed, 20 insertions(+), 14 deletions(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index 935be3b92a5..e441393fdf5 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -999,20 +999,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> >      if (info->nb_cpus == 0)
> >          info->nb_cpus = 1;
> >
> > -    /*
> > -     * We want to put the initrd far enough into RAM that when the
> > -     * kernel is uncompressed it will not clobber the initrd. However
> > -     * on boards without much RAM we must ensure that we still leave
> > -     * enough room for a decent sized initrd, and on boards with large
> > -     * amounts of RAM we must avoid the initrd being so far up in RAM
> > -     * that it is outside lowmem and inaccessible to the kernel.
> > -     * So for boards with less  than 256MB of RAM we put the initrd
> > -     * halfway into RAM, and for boards with 256MB of RAM or more we put
> > -     * the initrd at 128MB.
> > -     */
> > -    info->initrd_start = info->loader_start +
> > -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> > -
> >      /* Assume that raw images are linux kernels, and ELF images are not.  */
> >      kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
> >                                 &elf_high_addr, elf_machine, as);
> > @@ -1064,6 +1050,26 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> >      }
> >
> >      info->entry = entry;
>
> Note: this is the start of the kernel image...

It's the entry point, which isn't quite the same thing as
the start of the image (if we just loaded an ELF file then
'entry' is whatever the ELF file said the entrypoint is, which
could be a long way into the image).

> > +
> > +    /*
> > +     * We want to put the initrd far enough into RAM that when the
> > +     * kernel is uncompressed it will not clobber the initrd. However
> > +     * on boards without much RAM we must ensure that we still leave
> > +     * enough room for a decent sized initrd, and on boards with large
> > +     * amounts of RAM we must avoid the initrd being so far up in RAM
> > +     * that it is outside lowmem and inaccessible to the kernel.
> > +     * So for boards with less  than 256MB of RAM we put the initrd
> > +     * halfway into RAM, and for boards with 256MB of RAM or more we put
> > +     * the initrd at 128MB.
> > +     * We also refuse to put the initrd somewhere that will definitely
> > +     * overlay the kernel we just loaded, though for kernel formats which
> > +     * don't tell us their exact size (eg self-decompressing 32-bit kernels)
> > +     * we might still make a bad choice here.
> > +     */
> > +    info->initrd_start = info->loader_start +
> > +        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
>
> ... but here we add kernel_size to the start of the loader, which is
> below the kernel. Should that be info->entry?

loader_start here really means "base of RAM". I think what
we want here is something like

  info->initrd_start = info->loader_start + MIN(info->ram_size / 2,
128 * 1024 * 1024);
  info->initrd_start = MAX(info->initrd_start, kernel_end);

where kernel_end is just past whatever the highest addr of the kernel
is, which is not something that's totally trivial to calculate
with the variables we have to hand at this point.

thanks
-- PMM

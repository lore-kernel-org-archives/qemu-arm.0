Received: by 10.25.21.96 with SMTP id l93csp1122006lfi;
        Fri, 24 Jun 2016 09:06:40 -0700 (PDT)
X-Received: by 10.55.220.7 with SMTP id v7mr5945909qki.31.1466784400378;
        Fri, 24 Jun 2016 09:06:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y193si5359396qkb.170.2016.06.24.09.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 09:06:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTct-0003Xb-L3
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 12:06:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bGTSe-00005o-K7
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 11:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bGTSb-0005ii-9C
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 11:56:03 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:33412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>)
	id 1bGTSV-0005gg-Br; Fri, 24 Jun 2016 11:55:55 -0400
Received: by mail-oi0-x234.google.com with SMTP id u201so120799618oie.0;
	Fri, 24 Jun 2016 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0gYGpVFYb63OiblgmvnDa4s6oEGOFcTCZ93Z3wAOwuQ=;
	b=RFjGGVNRsALbHKp/orZSwnqal+qwqIIfTMWedaNOBv1z2sF09jT5k3gIvG1euJK3/X
	ljp7QLbbv3/JhkSb3E0l0iAn2YoZ4be75qAT8sPVR+BapitZ5qB+eaeXSmSNIXQXO6oM
	jc1dC1baYru61ryH+Oc/oeLu0c3qJLp2gBpcv55s7ODHqQqSfShhsPJR9IcGUJpvtNQp
	sDrg1zESQ/LVKNk6l5dHsmHAd87uWXghQ5hbLbb5AgHl0cU5etCq9T7SOmD+oMDcH+2/
	MOABvSWEKkimjx164jVXp4kBEvhnJJH9gSJXDr2OFT0xTgZgbJKZ9xFagEwsJ6F9bxJ2
	Yolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0gYGpVFYb63OiblgmvnDa4s6oEGOFcTCZ93Z3wAOwuQ=;
	b=W2YqnaQzq5EJ0v0eEjIHVaaLxtyl4vXoX4B5iNp+GGJ/95eUxiX+zOAavfE0FoxKq7
	tYJhcjarJRHHtTJdkTj8ZmhSKqT/FHdYwpmmZrqwDIbbDNZU4sPgRQbHl4iNFyDds4MW
	rkJVZaTif/H+bOCFgcrp0DUnZigDMO42kl8QIFx9Pi886GYHjoQ+KPOXNpPXpQ4rPBge
	g3S/LBdCBjUUBi9V4RzxzML+/VKe/qjuHS4HGDaMazbfHQeU74/Mwq3aOKTYHZSFGNCj
	FHRuGyiGaEkHy513QnHtRX2rJzfiWBQZ64pwIXORFOLGvjFb1u6k6zoj3OdQ9rCgZQMF
	5v8A==
X-Gm-Message-State: ALyK8tLfyeZW9i6Wvm1wG3iuuiLIWwE2ZDH5cUEiY/34ixRine2MJhrDshFhvHBitS8j2GCyWQXBVD/aYmH4Kw==
X-Received: by 10.157.46.53 with SMTP id q50mr3627148otb.121.1466783754340;
	Fri, 24 Jun 2016 08:55:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.63.53 with HTTP; Fri, 24 Jun 2016 08:55:53 -0700 (PDT)
In-Reply-To: <CAFEAcA-yDXDjNzHKRc+Tkt3SUZVRf86hxRcJi43RBom+9hmbYQ@mail.gmail.com>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
	<CAFEAcA-yDXDjNzHKRc+Tkt3SUZVRf86hxRcJi43RBom+9hmbYQ@mail.gmail.com>
From: Tsung-Han Lin <tsunghan.tw@gmail.com>
Date: Sat, 25 Jun 2016 00:55:53 +0900
Message-ID: <CA+BS1oEShVeBaOZWOwmq_-k7t1TuEW+cn_FbF=X2dYz7ndV0zA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::234
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [RFC] target-arm: fix semihosting ram base issue
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIeve5KKvs6I

2016-06-24 1:26 GMT+08:00 Peter Maydell <peter.maydell@linaro.org>:

> On 17 June 2016 at 03:37, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
> > Hi, I made some changes to TRY TO fix the ARM semihosting issue in
> > SYS_HEAPINFO handling.
> > This problem has been bothering me for quite a while.
> >
> > A new global variable 'main_ram_base' is added while a new memory
> > API, memory_region_add_subregion_main, is also provided to let
> > SoC/board creator to initialize this variable.
> > I am not sure if this is a good idea (to add a new API)
> > or maybe we just let SoC/board creator to simply
> > set 'main_ram_base' in their 'xxx_realize' functions?
> >
> > As for Cortex-M series, 'main_ram_base' is set during cpu initialization.
> > A64 semihosting handling is also added and use zynqmp as an example.
> >
> > Any comments/reviews are big welcome!
> > Thanks in advance!
>
> Hi. First of all, unfortunately we can't accept any
> patch from you unless you provide a signed-off-by: line
> (which is basically saying you have the legal right to
> provide it to us under QEMU's license terms; see
>
> http://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
> for more detail). We can fix up most other stuff, but
> this one is a hard requirement.
>
> Hi, Peter,

Thanks for the comments.
Well, actually I was just trying to throw out some of my thoughts and get
some feedbacks and comments.
(not intend to get merged :p) since the approach I used involved some API
changes and I am not sure if that's a good idea or not. But I will make
sure next time I send out something that will just as the normal patch sets
should be.
Thank you for all those comments.


> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 23c719986715..8124f71992b4 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -206,7 +206,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev,
> Error **errp)
> >          memory_region_init_alias(&s->ddr_ram_high, NULL,
> >                                   "ddr-ram-high", s->ddr_ram,
> >                                    ddr_low_size, ddr_high_size);
> > -        memory_region_add_subregion(get_system_memory(),
> > +        memory_region_add_subregion_main(get_system_memory(),
> >                                      XLNX_ZYNQMP_HIGH_RAM_START,
> >                                      &s->ddr_ram_high);
>
> This isn't necessarily the main RAM for this board --
> if you don't pass more than XLNX_ZYNQMP_MAX_LOW_RAM_SIZE
> as the RAM size then the only RAM is the low ram at
> address 0. In any case, even if you do have enough RAM
> to go through this code path, the executable being loaded
> might be linked so it goes into the low RAM alias at 0,
> in which case using this address as the heap start/limit
> would be wrong.
>
> >      } else {
>
> If we can avoid having to change every board to specify this
> that would be nice. (Most of them already specify the RAM
> base in vbi->bootinfo.loader_start.)
>
> Is your use case passing an ELF file to QEMU to run?
>
Yes, I always use an ELF file to do some experiments.

> I suspect what we actually need to do for boards like
> the Xilinx with more than one RAM area is address the
> /* TODO: Make this use the limit of the loaded application.  */
> and actually use the values from the loaded executable,
> rather than guessing them.
>
> This would also address problems with the Cortex-M cores,
> where the application being loaded might be linked to
> be in RAM (non-zero start) or to be in flash (zero start).
>
> We should also be able to do a better job of guessing for
> simple boards with one RAM area at a non-zero offset,
> but if we look at the ELF files we're loading we might
> not need to bother...
>
> > diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
> > index 8be0645eb08b..d30469688b01 100644
> > --- a/target-arm/arm-semi.c
> > +++ b/target-arm/arm-semi.c
> > @@ -599,17 +599,32 @@ target_ulong do_arm_semihosting(CPUARMState *env)
> >              unlock_user(ptr, arg0, 16);
> >  #else
> >              limit = ram_size;
> > -            ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
> > -            if (!ptr) {
> > -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> > -                return (uint32_t)-1;
> > -            }
> > -            /* TODO: Make this use the limit of the loaded
> application.  */
> > -            ptr[0] = tswap32(limit / 2);
> > -            ptr[1] = tswap32(limit);
> > -            ptr[2] = tswap32(limit); /* Stack base */
> > -            ptr[3] = tswap32(0); /* Stack limit.  */
> > -            unlock_user(ptr, arg0, 16);
> > +                       if (is_a64(env)) {
> > +                               uint64_t *ptrx;
> > +                               ptrx = lock_user(VERIFY_WRITE, arg0, 32,
> 0);
> > +                               if (!ptrx) {
> > +                                       /* FIXME - should this error
> code be -TARGET_EFAULT ? */
> > +                                       return (uint32_t)-1;
> > +                               }
> > +                               /* TODO: Make this use the limit of the
> loaded application.  */
> > +                               ptrx[0] = tswap64(main_ram_base +
> ram_size / 2); /* Heap base */
> > +                               ptrx[1] = tswap64(main_ram_base +
> ram_size);         /* limit */
> > +                               ptrx[2] = tswap64(main_ram_base +
> ram_size); /* Stack base */
> > +                               ptrx[3] = tswap64(main_ram_base +
> ram_size / 2);  /* limit */
> > +                               unlock_user(ptrx, arg0, 32);
> > +                       } else {
> > +                               ptr = lock_user(VERIFY_WRITE, arg0, 16,
> 0);
> > +                               if (!ptr) {
> > +                                       /* FIXME - should this error
> code be -TARGET_EFAULT ? */
> > +                                       return (uint32_t)-1;
> > +                               }
> > +                               /* TODO: Make this use the limit of the
> loaded application.  */
> > +                               ptr[0] = tswap32(main_ram_base + limit /
> 2);
> > +                               ptr[1] = tswap32(main_ram_base + limit);
> > +                               ptr[2] = tswap32(main_ram_base + limit);
> /* Stack base */
> > +                               ptr[3] = tswap32(main_ram_base); /*
> Stack limit.  */
> > +                               unlock_user(ptr, arg0, 16);
> > +                       }
> >  #endif
>
> This is making two bug fixes at once. The part of
> this which is fixing the 64-bit code path to write
> 64-bit values into the data block is a simple
> non-controversial bugfix, and it should be in its
> own patch. Making better guesses at limit values
> for system emulation is trickier (see remarks above).
>
> You've also got some problems with your code indent,
> which should be four-space. scripts/checkpatch.pl can
> tell you about some style issues with patches.
>
> I suggest you start by sending a patch which just fixes
> the 64-bit case to write 64-bit values, since that's the
> easy bit.
>
> thanks
> -- PMM
>

Seems like you already have the solutions! thanks anyway :p
(was just still trying to get more understanding of the code base :p)


-- 
Tsung-Han "*Johnny*" Lin

Page: http://tsunghanlin.github.com/
Email: tsunghan.tw@gmail.com

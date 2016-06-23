Received: by 10.25.21.96 with SMTP id l93csp636860lfi;
        Thu, 23 Jun 2016 10:27:00 -0700 (PDT)
X-Received: by 10.55.179.195 with SMTP id c186mr45768328qkf.28.1466702820810;
        Thu, 23 Jun 2016 10:27:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w203si1111592qka.104.2016.06.23.10.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 10:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG8P6-0007M9-6G
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 13:27:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8P1-0007KN-EV
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:26:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8Oz-0007Rt-RE
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:26:55 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8Oy-0007RW-Gy
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:26:53 -0400
Received: by mail-vk0-x231.google.com with SMTP id j2so116219969vkg.2
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MTCmNC598QVaWBs7dCbsqq5UIUnixadMBD8EAGeKRgw=;
	b=aBpRBBYtDCX9t/nundPWR058nysDf3fFa27JBbLAHMGcFT32OmueMM3bTnJGBry1Ma
	2uTJJkHzF8lmwGSX0/V0+2AE0orLrHJkViV6ksTD+mXTukrj3qPmnL5dTqXGR9WWK2aZ
	elKDmJpxHZ7rKrRxkHwq2TK0BZo0cmrdMc2Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MTCmNC598QVaWBs7dCbsqq5UIUnixadMBD8EAGeKRgw=;
	b=NVLWgDB7biqOxjff/eR07YpnjLyfFVRc/d4uDa9DN8x8Z+Zsz+ED8EwfKqw2kkCTVS
	pGATNWcE9YiIA/QoX1+EiNREBS4b9YrL74be+F1pmyRWc37gOwcyjJSLF1ohgvoDlLzY
	lLwQt0RguCsY1sWXiJV1xIFpsqoEpC0Fopjpd6oPUP59ZU0p7Zjr4Dx+Hspbu5i68/Ku
	mfTf54BSXrW/yJUxQLTgzkWc8HfBGV1JyKoZ5ZNktzv3LYbqbidtmgX9EPh3QUJVhRRm
	6nDezBG3e2CN5JznJ6HRVgArNHh/ANx3C0dMzTECHD+aaFtzUCTfmwZNBsPd611eLJrn
	itMg==
X-Gm-Message-State: ALyK8tLlozPN+xlQnuMFDLOT2PjXGirSiRMLuKtgCRFsN79wd9CuQgcnL5jTmUaYrY0vVpyB/xxDgJbi+RxhVlX2
X-Received: by 10.31.96.207 with SMTP id u198mr13631192vkb.50.1466702811963;
	Thu, 23 Jun 2016 10:26:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 10:26:32 -0700 (PDT)
In-Reply-To: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 18:26:32 +0100
Message-ID: <CAFEAcA-yDXDjNzHKRc+Tkt3SUZVRf86hxRcJi43RBom+9hmbYQ@mail.gmail.com>
To: Tsung-Han Lin <tsunghan.tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [RFC] target-arm: fix semihosting ram base issue
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3zWwxyIqeF+b

On 17 June 2016 at 03:37, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
> Hi, I made some changes to TRY TO fix the ARM semihosting issue in
> SYS_HEAPINFO handling.
> This problem has been bothering me for quite a while.
>
> A new global variable 'main_ram_base' is added while a new memory
> API, memory_region_add_subregion_main, is also provided to let
> SoC/board creator to initialize this variable.
> I am not sure if this is a good idea (to add a new API)
> or maybe we just let SoC/board creator to simply
> set 'main_ram_base' in their 'xxx_realize' functions?
>
> As for Cortex-M series, 'main_ram_base' is set during cpu initialization.
> A64 semihosting handling is also added and use zynqmp as an example.
>
> Any comments/reviews are big welcome!
> Thanks in advance!

Hi. First of all, unfortunately we can't accept any
patch from you unless you provide a signed-off-by: line
(which is basically saying you have the legal right to
provide it to us under QEMU's license terms; see
http://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
for more detail). We can fix up most other stuff, but
this one is a hard requirement.

> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 23c719986715..8124f71992b4 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -206,7 +206,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          memory_region_init_alias(&s->ddr_ram_high, NULL,
>                                   "ddr-ram-high", s->ddr_ram,
>                                    ddr_low_size, ddr_high_size);
> -        memory_region_add_subregion(get_system_memory(),
> +        memory_region_add_subregion_main(get_system_memory(),
>                                      XLNX_ZYNQMP_HIGH_RAM_START,
>                                      &s->ddr_ram_high);

This isn't necessarily the main RAM for this board --
if you don't pass more than XLNX_ZYNQMP_MAX_LOW_RAM_SIZE
as the RAM size then the only RAM is the low ram at
address 0. In any case, even if you do have enough RAM
to go through this code path, the executable being loaded
might be linked so it goes into the low RAM alias at 0,
in which case using this address as the heap start/limit
would be wrong.

>      } else {

If we can avoid having to change every board to specify this
that would be nice. (Most of them already specify the RAM
base in vbi->bootinfo.loader_start.)

Is your use case passing an ELF file to QEMU to run?
I suspect what we actually need to do for boards like
the Xilinx with more than one RAM area is address the
/* TODO: Make this use the limit of the loaded application.  */
and actually use the values from the loaded executable,
rather than guessing them.

This would also address problems with the Cortex-M cores,
where the application being loaded might be linked to
be in RAM (non-zero start) or to be in flash (zero start).

We should also be able to do a better job of guessing for
simple boards with one RAM area at a non-zero offset,
but if we look at the ELF files we're loading we might
not need to bother...

> diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
> index 8be0645eb08b..d30469688b01 100644
> --- a/target-arm/arm-semi.c
> +++ b/target-arm/arm-semi.c
> @@ -599,17 +599,32 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              unlock_user(ptr, arg0, 16);
>  #else
>              limit = ram_size;
> -            ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
> -            if (!ptr) {
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                return (uint32_t)-1;
> -            }
> -            /* TODO: Make this use the limit of the loaded application.  */
> -            ptr[0] = tswap32(limit / 2);
> -            ptr[1] = tswap32(limit);
> -            ptr[2] = tswap32(limit); /* Stack base */
> -            ptr[3] = tswap32(0); /* Stack limit.  */
> -            unlock_user(ptr, arg0, 16);
> +                       if (is_a64(env)) {
> +                               uint64_t *ptrx;
> +                               ptrx = lock_user(VERIFY_WRITE, arg0, 32, 0);
> +                               if (!ptrx) {
> +                                       /* FIXME - should this error code be -TARGET_EFAULT ? */
> +                                       return (uint32_t)-1;
> +                               }
> +                               /* TODO: Make this use the limit of the loaded application.  */
> +                               ptrx[0] = tswap64(main_ram_base + ram_size / 2); /* Heap base */
> +                               ptrx[1] = tswap64(main_ram_base + ram_size);         /* limit */
> +                               ptrx[2] = tswap64(main_ram_base + ram_size); /* Stack base */
> +                               ptrx[3] = tswap64(main_ram_base + ram_size / 2);  /* limit */
> +                               unlock_user(ptrx, arg0, 32);
> +                       } else {
> +                               ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
> +                               if (!ptr) {
> +                                       /* FIXME - should this error code be -TARGET_EFAULT ? */
> +                                       return (uint32_t)-1;
> +                               }
> +                               /* TODO: Make this use the limit of the loaded application.  */
> +                               ptr[0] = tswap32(main_ram_base + limit / 2);
> +                               ptr[1] = tswap32(main_ram_base + limit);
> +                               ptr[2] = tswap32(main_ram_base + limit); /* Stack base */
> +                               ptr[3] = tswap32(main_ram_base); /* Stack limit.  */
> +                               unlock_user(ptr, arg0, 16);
> +                       }
>  #endif

This is making two bug fixes at once. The part of
this which is fixing the 64-bit code path to write
64-bit values into the data block is a simple
non-controversial bugfix, and it should be in its
own patch. Making better guesses at limit values
for system emulation is trickier (see remarks above).

You've also got some problems with your code indent,
which should be four-space. scripts/checkpatch.pl can
tell you about some style issues with patches.

I suggest you start by sending a patch which just fixes
the 64-bit case to write 64-bit values, since that's the
easy bit.

thanks
-- PMM

Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp830707wrh;
        Fri, 3 May 2019 10:34:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxW7bOXQm442XwdDzKXJmLNbyf2Ermlm8cneuWvnNQyeI5cTocTVoOZQfgJ6tALmQSEiUo
X-Received: by 2002:adf:f390:: with SMTP id m16mr7969515wro.25.1556904854258;
        Fri, 03 May 2019 10:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556904854; cv=none;
        d=google.com; s=arc-20160816;
        b=qiaOrUziAOpAVhUlyJJle8Veq9vpHqfo7BCuE0pZXNEjQcwhfhewHZvhR/x4Opj78U
         NUAnbA41afcsmibkYv5m/eG+VzWawvL4iARN3ReUPtG1FS6gY8CvPXhPlkpNXLHzAL6i
         G0j7Nq1Av5rAFFJ/gnj9TTE2WgQeaFFw2FkCxKoen6r4FsZmXH0dt4cFFuqHhF4C7rpH
         rMWipoyFd8sid6IpkQDm/FgcUw+znMwLvGqnbRkNj8MdQTIrVsdR3jYnQrNa50NdC4X2
         1TXu74HzUiZPCPwQ8EdlkKaWKYCoviBxQinucb/Q8MzxZNKiETwyDnl/wRqtM4aHaGJ9
         4yFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fAbaWIprqYabI26Q7gG1BG024NYmOUIooaRDhTV5jkw=;
        b=CFaw64TyZ8k0ovfjnCqegySO77c71iqWahFOYPnSS9yazAwwKN0jKL+7sSHZPqMmZU
         ktHHLIDR42CCdDA2euLbTCHPvyIaCR4eppvuhv4l65+iHxzBsDnVsKVjofU7JJL4DSCi
         b5120hLQh2fnB0vpTjlk7vOkL2QQoStEGDTQe46/2U4M8hvgpVOWtov/coBS4zM2bVQL
         LmD0asCK/hUHmkFMrr+QUfmugK4+lF2Bu1AGVChILziLvCMwj9C7F9wYLkor/GgHqiTE
         /ceXv5QFosCPthV68iQNH++SW5yG38cml7WGlBT34D3gr/Hyac9zQVuMf0CN//orbUCQ
         YWxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hMJWQdl5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si2002607wrj.264.2019.05.03.10.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 10:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hMJWQdl5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMc4b-0002SL-AX
	for alex.bennee@linaro.org; Fri, 03 May 2019 13:34:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMc4F-0002Ph-OF
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMc4E-0003DY-MV
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:33:51 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMc4E-0003D3-Hh
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:33:50 -0400
Received: by mail-ot1-x341.google.com with SMTP id b18so6008604otq.3
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fAbaWIprqYabI26Q7gG1BG024NYmOUIooaRDhTV5jkw=;
	b=hMJWQdl5epKcK1EIaeGCRoLGcC4jEEdqIWLiAZ4S+JW2Vk2twX630DCwuFyxrYyC9s
	Lx+WPCXJ9i2t6D2c6uJqZJoBCALjX2BSte0Tu3AdGXgw0+rCmdT9tavpdiD7oAo1OzMQ
	853DjzfZzNsXcg5PEnwH5Yp5XG7rPDQTjrLIG5JBQtUceTW+1Ad1inuHTHTmytS3WvWf
	o7/ZAkgjRSRzZg+uI20ko4w/qVQnFxkFjBI3uqUEvEyJTcRssIVTgdvM/a/Tjhdmk1HN
	ndgBVXEbnsRXrj+BsvvYaANWez8yOe1Wxcv/kXwg+gSFLruOWeyN8Y2+obD4EPV3cddU
	Dr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fAbaWIprqYabI26Q7gG1BG024NYmOUIooaRDhTV5jkw=;
	b=rmhByRnJXHl8UPHYZ3LsWmN1nRdk6W9Eg0eYDT2toH/i31bnyVx05+/HaBuU9Ea05b
	HkmE+w/oAcg7wlEZo/tP82ySVOGyxqDoVj2MGEu8Mn+uDkfa74oTQE2Ui1mUFXcemPnE
	3jo11KxAXuWmHBQpmgeKOT8eY5xNV2/e0gDG4gw/M4iWk9yLKOaXqb2F7pnR2NL2xDJI
	Oq0MUrztoZTgH46EQFZWt616x5Fc5RqUMbWfVirVorjiy5YLEq6uSX89CfgQ3rCAtScE
	WxYZw1d3njCA9brgP+1FPeRCctBYMfcwrZ37Sb5gjnecvJyq4Pxrm1fuJmzSo2AGCsJ9
	0fUw==
X-Gm-Message-State: APjAAAXw9xBRuPqCJ3hO6z87LJw1GsZEPpI37N8xpW3qv/tIqjj2Wpbf
	dCPU98steoyep/9FTyMaf+XrSCbEFFBSaI7BGqRZ8MinPTo=
X-Received: by 2002:a9d:6d19:: with SMTP id o25mr6789007otp.151.1556904829239; 
	Fri, 03 May 2019 10:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190503171347.13747-1-peter.maydell@linaro.org>
	<20190503171347.13747-2-peter.maydell@linaro.org>
In-Reply-To: <20190503171347.13747-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 18:33:38 +0100
Message-ID: <CAFEAcA8cG_hd=6+zeYDG5o68Z-62rmXfK4SBLWUz2tVvgPobpw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/boot: Avoid placing the initrd on
 top of the kernel
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
Cc: Mark Rutland <mark.rutland@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TzKe+RV9Gm1s

On Fri, 3 May 2019 at 18:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
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
> index a830655e1af..7c978fedde4 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -998,20 +998,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
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
> @@ -1056,6 +1042,26 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>          exit(1);
>      }
>      info->entry = entry;
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
> +    info->initrd_start = TARGET_PAGE_ALIGN(info->initrd_start);
> +

I belatedly realized that we should probably check here whether
this is off the end of the ram, as otherwise following code
will get an underflow in "info->ram_size - info->initrd_start"
which is unlikely to result in useful behaviour.

thanks
-- PMM

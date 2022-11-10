Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp247090ejx;
        Thu, 10 Nov 2022 09:19:50 -0800 (PST)
X-Received: by 2002:a17:90a:6d43:b0:213:d04:7529 with SMTP id z61-20020a17090a6d4300b002130d047529mr1512810pjj.181.1668100790019;
        Thu, 10 Nov 2022 09:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668100790; cv=none;
        d=google.com; s=arc-20160816;
        b=R+0Em7dwrPM4WbkeZbe0/HrwfXMI1JoZhATercIAiPXcQaKmz2ZVyZ2tdLz5g92lkn
         mmE9e01VobaRhlwzcBZ2dLKuwtijwrdm1BbCmiuvc0j8HsAcTkZBjCDFXVAp+N6CPgJk
         1MuR+XbjN50ExDYI6UaX0zynAsf58C9isamWwPMwdhTOM6+zsey7wnvVNQtqZ+4LbvSr
         puZWV7XFdcTye/tFfC/T3RZIIcuILI6IGfnYudKNmja3Bw9BsiO8WGzCsRhCwl77kjfD
         ooUzdVt4Bey6OyrKqxDFitTrxEB/OYxplEwbBhUt1OGtmAt4ZIRqmUjHCcZHzc8mXM8x
         z09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YCfnkQXm4Y3T6Oa0/8s0s2VLJruSLvpqi4pAAQcleS0=;
        b=U7GNQ5Ggsst0qmIdkICQN/mt2WoWKcqG7rKSXJSP20jeLGjVLVYxLtwHw+y/fdmm21
         rroAn8b1C6I/4y4P36rcy5KgS6t7lew2nF5wrGcKU9cMkYcyBZ2YLQ4RPmuuXC7sMksG
         yswSGLo8aBNSAF2iM5ewCWwhjIyKrvzV9Zim2lr/MjDamVuvww0JyoJCNmMVhFTOEtI7
         9jJXgpptoQ4x7t1LStvwOcbKhdX+IjSMowl4YFvQ+9aR9hmTNWTNR4LheUMeDzu/pLGo
         3n+OKdihZb5HtGLrWn3b8f/EGLJbpKKdNQFQxn1iOp0gt15SeaolUvg2Xc3SMJQHIAw6
         1fgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbk6sdKI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e3-20020a170902ef4300b00186989178absor7248475plx.67.2022.11.10.09.19.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Nov 2022 09:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbk6sdKI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YCfnkQXm4Y3T6Oa0/8s0s2VLJruSLvpqi4pAAQcleS0=;
        b=kbk6sdKIA+BhRNrAtfrM2Liaoq7mmcQjfgI7xDt6TIT8MHIFLrZZWI57HLI/hW66va
         caJlwuBsYEa2BaRn3cGcqHpFA0uSISXmgJhs8jrbgvU/EJBMUVtVNitpkad5g2MxQjIQ
         Yos+ibO9vPKbrICJ6weKu4ai92bOjJT909vqQhyQrXFdcmDtHA6v663mJf59ITGTQtha
         9BiSt+3qhHyIq9l5Ms2/o0U7NiCFneoEA69s4AGzrZ4qLZRkApKCFLZa7w5Q61KAPQ5I
         pmfCl+lvScKjLDVS9SrjvvlNvHM/1tg2QgqCnQrULqCDqZ5l+84gzA2jqnazmjZM//ai
         PmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCfnkQXm4Y3T6Oa0/8s0s2VLJruSLvpqi4pAAQcleS0=;
        b=tjW6DesqzyMAQTlYVbplfz71kKgp7lHUmmNl3TZyENN1WB8SrGoUOav18Cep4kcR83
         YT27l6JRBDG3G8TikESQoDokO0CgAT0Ir6ZJ+3Gxor8ADMhi0Vj6tF9vbifEdBt/iUsN
         BQSuwGtgZjjKojSO3XjKwQm50lJdLrpW5g48Fgln1suXMFRR2mPiJLX4dFO7c0qqAtEl
         pFY6DZFiScXk6ErB0mlh7Gy4BStk2faWUPhZYydPENiuz6LhO/U+KviZct5WSC7U2DHD
         XBqe2DPtF0QXbd5B0JCunqUooPDUMSeRyjbf2z86Dr0NlPFhjdyg+qTuV/tK6C2oHOcK
         f3DQ==
X-Gm-Message-State: ACrzQf1w8FZtiishqiQ9dNqkOGVZjPXlfvI1RnkabLO5JCG9kohJ8S3a
	yoJdz/Uwecm7BaZDVSiRigdU2HZCRAhg0JmkIeLWVnvwfA3LNA==
X-Google-Smtp-Source: AMsMyM4JGRfu3WMID0lGKYA6MRsSPjiFZzHilzZXIXQIhdWbcr5KqK/VnT8GZyeJ28TYlq/FH8RCvR5vNI70JqegUlA=
X-Received: by 2002:a17:90b:f06:b0:212:cb07:fb82 with SMTP id
 br6-20020a17090b0f0600b00212cb07fb82mr82103302pjb.221.1668100789513; Thu, 10
 Nov 2022 09:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com> <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com> <875yfpbg38.fsf@gmail.com>
In-Reply-To: <875yfpbg38.fsf@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 17:19:38 +0000
Message-ID: <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: JJLSu3/hx3lP

On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> >> > I think this lowmem does not mean below 4GB. and it is to make sure
> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
> >>
> >> The wording of this comment pre-dates 64-bit CPU support: it
> >> is talking about the requirement in the 32-bit booting doc
> >> https://www.kernel.org/doc/Documentation/arm/Booting
> >> that says
> >> "If an initramfs is in use then, as with the dtb, it must be placed in
> >> a region of memory where the kernel decompressor will not overwrite it
> >> while also with the region which will be covered by the kernel's
> >> low-memory mapping."
> >>
> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
> >> if you don't put the kernel, initrd, etc below 4GB.
> >
> > A kernel person corrects me on the meaning of "lowmem" here -- the
> > kernel means by it "within the first 768MB of RAM". There is also
> > an implicit requirement that everything be within the bottom 32-bits
> > of the physical address space.
> >
>
> Thanks for your comment.
>
> In this view, initrd shouldn't be placed higher than 4GB ? But it
> seems the Linux kernel can boot when there is no memory below 4GB.

A *32 bit* kernel cannot -- it is completely unable to access
anything above the 4GB mark when the MMU is off, as it is on
initial boot. This QEMU code handles both 32 bit and 64 bit
kernel boot. These days of course there is 64-bit only hardware,
and that might choose to put its RAM above the 4GB mark,
because it isn't ever going to boot a 32-bit kernel anyway.

thanks
-- PMM

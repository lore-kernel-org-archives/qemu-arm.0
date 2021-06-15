Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2817532lff;
        Tue, 15 Jun 2021 03:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXQuAlAoXM7sZotdTu9oW/4pgb4vsPnHFko9pfiPoeaT2+jORR+psijLPR+LDRye9XM/jt
X-Received: by 2002:a25:fc1a:: with SMTP id v26mr19352649ybd.486.1623753680974;
        Tue, 15 Jun 2021 03:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623753680; cv=none;
        d=google.com; s=arc-20160816;
        b=HCs/Mq+NJb+nBpYYEQUAW0GGscGL+u3YsKeO3/NfjE7EX1Wq5/u5fXN6cUBEjRaOPa
         LVelK+QWxGcjU1MLG7octCQHRPU/wKfEn/Lr4be/8Qsux4ZvpClRWr+PRRu0NS21MTA0
         fxZgP0Hw1WRuhvaciaT7URn4NGG4kU+sdy/di/nfe5F1tfAUgbyMl6C6XuY2PNabQZM8
         yu6zEKQEbzU4/GGBoCTlAQ+Bkod9GYQ0LlxP+dJJrcDqWBd+VGvVqRmwQrdVeRaOgdPe
         Aa3oW8ORwhMXr0TyZOoIe+SrTlt+0Mx9rlRJmhUlOapD632mF7mskcvRnq21KyTsPQUS
         0UgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ky3cimQWhOYafWrZiZYmtahXi2f272EJQV3NdOgm49g=;
        b=dsxyiRHbhs+bH/0WupXAKKQmejLUD2psw/BqfYzowIMusWlBQ2m1AtE5YcwUhhdbTq
         tYg2VAFZSTSpnEerlmQJbEie7EwwG5iPsKL1wXck4HqM2A88RS7OJnSH2ostl4kZmoc0
         KZFl76g1Wvnv4Pdt4L5Dt2VM1fZFLDLVdplZkDrX6zWNi4byeKgNbqyci1a+cbHHmd/m
         uc+3pQ8PtlKh8vM4TxD+UH46Zk9ztFt3i3dvjmvgrpbgDwRCuh5ntkZ2HRNidscQGrMs
         4wWucmQyqU3IcmJ0pC26Caqh7CGJ50cgINq0N+whTFTFMbDHTReUg1DQkm4Ri8McloWI
         usEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ea3+nE8w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si10840301ybm.365.2021.06.15.03.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 03:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ea3+nE8w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt6VU-0000Vt-AW
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 06:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt6VK-0000Vc-Ta; Tue, 15 Jun 2021 06:41:10 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt6VF-0006h4-Ht; Tue, 15 Jun 2021 06:41:10 -0400
Received: by mail-io1-xd34.google.com with SMTP id f10so28343480iok.6;
 Tue, 15 Jun 2021 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ky3cimQWhOYafWrZiZYmtahXi2f272EJQV3NdOgm49g=;
 b=Ea3+nE8wRN5Lw8lOiHuBT4RESeSqU4G7Foz8UcANlfuoYkDHj4HlRGwaff2aGNE30a
 zHrKEnyS1w/z2j3fGOnm7B822hVMs5NBeOwIZEw6zsuLXG+4TKQ8+GV/OOesv2RqZ3rj
 2H6IxX0cicwefr0QOQTD0654zRUPtWm/EDI5TGKmE9SII3SZI6F4ETOgWmxJLbAmr5+M
 +JYd7+edb4N9AGiIf0UKdAifXI7uG+PSQLoaFj+7JvYYxs4nYlLgdyEd8QaBT3gfLrLy
 xqaIex2MT+WHLDlttBAsIdI84CzPIrtnMHj5dbp3YbdMUSzPQrdesjUIyzrvaWAJ+lpu
 aX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ky3cimQWhOYafWrZiZYmtahXi2f272EJQV3NdOgm49g=;
 b=IXUgJpd1dOtRa/y2I0oRbmg11Ilu7IALLi8wQ3syXevuNtGFLywvUUWfg1nNvpHk4U
 q5t3D5xNZC0Bms1JtGnZ5SiBfo3dAD1C6KYHQExH2h2YgI8CkxTu7tZdrBP4fZYtenEj
 l0qTNINIFX9eFNtKPLTIifxkTLcrjK/aGrjRn/i38O1l79+ZuAHljYuKj60dJBsQGMbE
 txRT7hmJtLUN8PHcV3u/weeNJ3xsGFl6h9BDXMl/DlY8C/Fl9uCrljB7BAGILJxDcOrq
 91r7MeGgAnyIDQQZSRagMgFN7S0a8NHmlPola1w1Jh8lSlntVPe5+pYQVSOxYJEeS+kM
 lgCg==
X-Gm-Message-State: AOAM5312sE/ZVb8S9eOEQsB2RDZromonxPWIbjhRIMbTSpBLNrGzkShf
 5aXDRYuOpUIzg/4c7+jSzbXrnrPADZtblet3+ws=
X-Received: by 2002:a02:8816:: with SMTP id r22mr20997182jai.135.1623753663869; 
 Tue, 15 Jun 2021 03:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
 <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
 <CAKmqyKMETmc0sJbG8FdUokg9Ke_hg5ohZ2YnLzyQO1xwzpXMRA@mail.gmail.com>
 <7e8a01c5-0130-1003-8396-af8d4b45d2c0@crans.org>
In-Reply-To: <7e8a01c5-0130-1003-8396-af8d4b45d2c0@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 20:40:37 +1000
Message-ID: <CAKmqyKNtzSyX7paN8jfKWWNzBpVx61_o05E3uCQMCTxGHhwEAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fGmNw+ffvNN

On Tue, Jun 15, 2021 at 7:15 PM Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
>
>
> On 6/15/21 10:04 AM, Alistair Francis wrote:
> > On Tue, Jun 15, 2021 at 5:50 PM Alexandre IOOSS <erdnaxe@crans.org> wrote:
> >>
> >> On 6/15/21 9:41 AM, Alistair Francis wrote:
> >>> Aren't you missing some timers, like timer[5] 0x4000_0C00?
> >>>
> >>> Alistair
> >>
> >> I double-checked using the reference manual and the datasheet and there
> >> is not timer[5]:
> >> - page 36 of
> >> https://www.st.com/resource/en/reference_manual/cd00246267-stm32f100xx-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf
> >
> > Strange, https://www.st.com/resource/en/datasheet/stm32f100rc.pdf
> > describes Timer 5 and page 282 of the document you linked talks about
> > timer 5 as well.
> >
> > Alistair
> >
> >> - page 30 of https://www.st.com/resource/en/datasheet/stm32f100cb.pdf
> >>
> >> I believe ST is skipping numbers to guarantee that timer[n] will have a
> >> consistent address on different STM32 SoC.
> >>
> >> Thanks,
> >> -- Alexandre
> >>
>
>  From what I understand from other STM32F100xx reference manuals:
> I am implementing all peripherals in the STM32F100xx reference manual
> which match with what is actually in the STM32F100RB SoC (used in the
> STM32VLDISCOVERY).

Ah, my mistake. The STM numbering always confuses me.

>
> STM32F100RC SoC implements more peripherals (more USART, more
> timers...). Adding these peripherals in stm32f100.c means that the
> STM32VLDISCOVERY machine would have peripherals that does not exist on
> the real target. Do we want to avoid that?

Yep, this is fine as is.

>
> Should we keep stm32f100.c with the common subset of peripherals and
> extend it when a machine is using a variant with more peripherals?
>
> I believe this issue is also linked with what Philippe proposed: we
> could abstract STM32 SoC in the same way ATMEGA is abstracted. This
> would make a lot of sense since the STM32 family has a lot of
> similarities and we don't want to bloat QEMU with N times the same code.

I agree. That's the best way forward and I think it's a good goal. We
don't have to block this series on that though. If you would like to
work on a shared abstraction that would be great :)

Once the IRQs are fixed:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Thanks,
> -- Alexandre
>

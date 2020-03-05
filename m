Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3290156lfi;
        Thu, 5 Mar 2020 11:30:27 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuh98uCtdkD7ItUQEI3agQ1uyfYsmxXMbWgdjb4yoeWmELCleXSN39ozTyyKSlyJNGgBfbd
X-Received: by 2002:a37:4c81:: with SMTP id z123mr9538746qka.320.1583436627432;
        Thu, 05 Mar 2020 11:30:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583436627; cv=none;
        d=google.com; s=arc-20160816;
        b=zIBoSzx/bOByKwHp++pfHTVqSummzxw/OylV3h+dB0eEq6DUaoM5ZowQyq956U66bB
         VcBK0RZ0ara7+ekoNZNjy8/0rVq2j9ypb5LliL2l4aPjryyUmw3ffXpxgKKImPvZ4uem
         lGInrro1KelM2FBNh0f+dbmAvvxx+ajZNVRl3J2ebQEJDD90kJHPJIr4bacjb532m0EN
         9o0QeXw6KwgiZ5HwlvJD3xmurBqot9DqtrGC6QAMF5cf6BYhHPNsXEzVeyFBne+unb+u
         +ivJBsdHFNUjaH6D22lo0Ke/0J+sCqhhjLJXj8sPOFcLByIonnfek77xFdubYW/xdXsj
         vQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v9QggBIEmSoZGmgupBp1v67qDm64qmC/63NMF4LdOOg=;
        b=A9lWGu/z6msU9AUDlwW9TREihrI/HuyjNW78AtHv8WCREAA2RJfBwNIj0rTR0xDekb
         JE/vviI3oexOkrKOnCvQvzXyQyX2MfPMcBebyN8J6xF1Er3abX8at60OY1W3h5aMyAw2
         mGUtROORPw+0kUBtIuXJkebX66Is7pwomxuxpMYhCUfGZU5FeJAvJGE6IXqN44TucQtS
         aIPox4a5/SdgX6JJ6ZLZA4Zpy3joWFA+Bhqc7v0GNzu7Rju3GBinC6pLiZTgKBTdfRgJ
         jFWgHb/X0WDmJvu+f/iqZ85bve5U8VNe847gVSfyaJiKyaJtqPax8TpiYiaxKjhD8cBs
         V5qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LYSTaiLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si1038165qtk.236.2020.03.05.11.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 11:30:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LYSTaiLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9wCP-0003U8-N8
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 14:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9wCG-0003Rh-LJ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 14:30:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9wCF-0000Gc-Kb
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 14:30:16 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9wCF-0000GH-Eg
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 14:30:15 -0500
Received: by mail-ot1-x342.google.com with SMTP id 66so6868701otd.9
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 11:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v9QggBIEmSoZGmgupBp1v67qDm64qmC/63NMF4LdOOg=;
 b=LYSTaiLoUzY4MJJ3WqmdbnISImWXlmm9BFjoHYo7MRUa19XG/kwH7f6vZcA4cmY7Os
 TyXn+KB8nysDK5ngafuM0Nx2nqJX0UZ9lG1M1Jt3yVlttFwfljCADib8X7csHHKAmsmT
 uEJXPIXh5dNdngNOGY+zrfITnp6SBe6eOZv+Fr8jTY5+CW6Jq0z7wke+OlfljPPRAGXm
 dVDyNMC4cIVWQpxzOZR+ZT/SCvBy6Av1U5beblwNkBoR1fVjjsDicJn0CYjSaIvRVLFs
 UWt2KRVLICWD1j+y8cdWcV5xD6M3PF33g5qhgcG7QEV56YUsA7+ZJrogk6U2mjcRKBny
 o7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v9QggBIEmSoZGmgupBp1v67qDm64qmC/63NMF4LdOOg=;
 b=uR5fHuEHgRFPK3Pi1yVxcpK5pbn1Bj0UWBuDgp0+gsy05nbBqJ3Ndec+Y1hXJHadXU
 8G2KmP+UAWg+JsYoX8WsCi2qUIheCOqK5P4qiW1SbueunAdNVuX87l/s2WEsO03qoe5u
 f34TMUAaRxob223QSPtBl0aYKyVIIrCjaoQ13QEE914c8piG/2ICff2HPzYUpb0RrL44
 8so8/t7UhS9Lmq2pgP43kBcWC4yFEaHw6BaTaDctiG7lBL2BsU8gJIM4j3MUMwEwAGj5
 hJSb9nDX6h2bms8kmuhCk5OurPcgZEdWMPSVb/iQTOgd8FD2apGeifiPwdYO5mhHGurI
 R/nQ==
X-Gm-Message-State: ANhLgQ1mAkog8cEvk1Q8RnsAhDqrxTH6zthbH+2YeZgx5KPUEkjSAPfB
 qOyzoTAsUJJlqhguANTMh6217F+BpLCDSsTi5jnSgQ==
X-Received: by 2002:a9d:76c9:: with SMTP id p9mr20859otl.135.1583436614587;
 Thu, 05 Mar 2020 11:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20200229141011.58989-1-root@stephanos.io>
 <CAKmqyKP1QFiWSQzUsoV9TLWBQ8hrx+yg7UM2=DnAoCAanLRuwA@mail.gmail.com>
In-Reply-To: <CAKmqyKP1QFiWSQzUsoV9TLWBQ8hrx+yg7UM2=DnAoCAanLRuwA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 19:30:03 +0000
Message-ID: <CAFEAcA_O6ScMF0fJgHORVXDQ+PvFNW4w6kBkeeB0vHixHo0zqA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/stm32f405: Add preliminary RCC emulation support
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Stephanos Ioannidis <root@stephanos.io>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r7XENc7Za+9s

On Thu, 5 Mar 2020 at 19:24, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Feb 29, 2020 at 6:12 AM Stephanos Ioannidis <root@stephanos.io> wrote:

> > +typedef union {
> > +    struct {
> > +        uint32_t hsion : 1;
> > +        uint32_t hsirdy : 1;
> > +        uint32_t reserved0 : 1;
> > +        uint32_t hsitrim : 5;
> > +        uint32_t hsical : 8;
> > +        uint32_t hseon : 1;
> > +        uint32_t hserdy : 1;
> > +        uint32_t hsebyp : 1;
> > +        uint32_t csson : 1;
> > +        uint32_t reserved1 : 4;
> > +        uint32_t pllon : 1;
> > +        uint32_t pllrdy : 1;
> > +        uint32_t plli2son : 1;
> > +        uint32_t plli2srdy : 1;
> > +        uint32_t reserved2 : 4;
> > +    };
> > +    uint32_t reg;
> > +} RccCrType;
>
> This is a pretty interesting way to represent the registers

Is it portable, though? I thought C bitfield order and
packing was implementation-defined, which would mean that
you can't guarantee that this union will give you the
required thing in the uint32_t half.

I think it would be better to do this the way that
other device models do it, and avoid bitfields.

thanks
-- PMM

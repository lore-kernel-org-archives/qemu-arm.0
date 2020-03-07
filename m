Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4898634lfi;
        Fri, 6 Mar 2020 18:12:13 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvrDyDI00dbz9vM/zkros8qwelzKjDGCKiZcZyGaGrPMKoHWYVN2qzofx1o2gyCVP+ag5ms
X-Received: by 2002:ae9:e20a:: with SMTP id c10mr5388917qkc.139.1583547133698;
        Fri, 06 Mar 2020 18:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583547133; cv=none;
        d=google.com; s=arc-20160816;
        b=pB+c5OLA/2NRm+hqg666AHsvEOU2/+hDdOQ3De3OnUKZdNHi2mi6iref55eX7kFQMc
         RbTvZ+BsvqrgKM6OMJR8MgRakJIO0xcNrkVCsWZd+AHRd/tZnaYgMqlwjKKFFrKBRFW+
         8hxvDKOL4bYJNAc5Xm0r4OjRJO81xkIxjGg4ROq+i+NJoFyrT/vkC5P/lZWC2LOjGPsZ
         +7KFJS/+uZh1vOJG0H1+DnfJkjCz7chuWKp6Hmb8pHvMwXf/vZdcV9Bijcq5zuZMGZ+X
         ZSv8EO2/cvQR3bUWnD5+rL+kT3rwsUthbIFjDrNcOT3z8BrAxp2GTlosVou8/PW/maXz
         NhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9/PvS9v3w6r+2piSor+3FOIHmJEuAulYDCStu3UObY=;
        b=L0qESjwuh+bCEn2T9u9abzjr7odW1Pj30aseyEPh+pW6QI1np+xjXH6Za5uie6z6be
         Yz/GoHt9ckt4a55hG5Cvl6oekX3J5644kkFLmcG7bIjSaOFQKyWnrflFd1TyoePvmn9Q
         HcYgpao0qWoOZWh3RwfCkyRpsEIdtEHyYbIL6meTIp0iQn6c5dpFp/9aJvl3Gist6poP
         p46DASoN0LRijYsm28YDQ7TcmqCZ5sfTRl8fP1DZz+sm3dfyBbiY0BvZTs+AijnMk1vM
         WLSyYTCYrBLnVlFjCV1MrFxM+0+5pEjdVVDCU6WEiL0ldzQRxfEUpYXIAnCsn8u5OmIF
         ZqXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=q8i+BiZD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si2377750qkj.322.2020.03.06.18.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 18:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=q8i+BiZD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAOwn-0003tz-5f
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 21:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jAOwV-0003ts-4L
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 21:11:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jAOwT-0004wT-QW
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 21:11:54 -0500
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:47091)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jAOwT-0004tg-M6; Fri, 06 Mar 2020 21:11:53 -0500
Received: by mail-ua1-x944.google.com with SMTP id h22so1414358uap.13;
 Fri, 06 Mar 2020 18:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9/PvS9v3w6r+2piSor+3FOIHmJEuAulYDCStu3UObY=;
 b=q8i+BiZDvG2OJvu69XxkoodxhOGF8msOpn7X9ptnQtmS9VfV4O9TTAArvfWhx9GwZd
 l7byjP+qRRiERu5G6nAgKcbOR9MrpKCoTqghnvo2iN/flxdbfjEcrij0WQaIlRuiI4tR
 kqeSuz2eDzV8DaWksWTRRRpzdIogbLOrQFDJZoEh7Dg0D7VDcbqlm3tvoZ591+R5PWal
 VKi52lzFLdTpzREYVZTwolGEtWBguephXe4+BSNT65smD2Klms66jwDePJ+gPFjwurbN
 hXVr/pxI+kX3ZSv9mNLTyMmvMugfkXfMTOX7KDgyeV76fOszV34BPIuysM1MIVJr6RMq
 94/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9/PvS9v3w6r+2piSor+3FOIHmJEuAulYDCStu3UObY=;
 b=uUJYmV0TeK5C0i5dZzjm1hN8XgMEJXeQvEifNkB6HL0jeG7SOZbP8fq+STvzh/M0iV
 x4VRJj26Xg0tP5QBf4EGrPRw3B4Yz8ogupBx7JSio/V3mRvHuEzal43MGJXHYusfhZVD
 SuNEck89bGnQIIQonYYBWON51FBoXWZZ/xKwbRXF2QS3QWH8GkW8eNXo24ajjGsy+Gsc
 MpJoQEUC1fgSM9ic847usE+Izqyad63739wH1OlZ6t1C6MDeYQYVV1iG6KPoj6zTkcBE
 QvE5alj0Sxa2+MimBkS7i0vU5R5Dt4+IGvsCyKgAGQyVPwOJd91ujujaQF8LxkzwNhCO
 ZgkQ==
X-Gm-Message-State: ANhLgQ1oGRmJxCwiI297Msd8JZWxks/kK8M0WcJSZrMCSGPFl1s66vxj
 s9Jux1YpqOMbyNkCZuLHnyyIWzLqbJdV+9mFcWo=
X-Received: by 2002:ab0:2302:: with SMTP id a2mr3432633uao.21.1583547112826;
 Fri, 06 Mar 2020 18:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20200229141011.58989-1-root@stephanos.io>
 <CAKmqyKP1QFiWSQzUsoV9TLWBQ8hrx+yg7UM2=DnAoCAanLRuwA@mail.gmail.com>
 <CAFEAcA_O6ScMF0fJgHORVXDQ+PvFNW4w6kBkeeB0vHixHo0zqA@mail.gmail.com>
 <SLXP216MB0285BF0CF1158A96DDABA736BDE30@SLXP216MB0285.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <SLXP216MB0285BF0CF1158A96DDABA736BDE30@SLXP216MB0285.KORP216.PROD.OUTLOOK.COM>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 6 Mar 2020 18:11:25 -0800
Message-ID: <CAKmqyKPewWrntQpsJLV-VJ5Px6dtm3Xq51gNL1nRhdt8WiXPiA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/stm32f405: Add preliminary RCC emulation support
To: Stephanos Ioannidis <root@stephanos.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FFhlgHzS/GQs

On Thu, Mar 5, 2020 at 4:48 PM Stephanos Ioannidis <root@stephanos.io> wrote:
>
> > Is it portable, though? I thought C bitfield order and packing was implementation-defined, which would mean that you can't guarantee that this union will give you the required thing in the uint32_t half.
>
> They are indeed implementation defined. As for packing, it is often controllable; as for order, I do not recall seeing a compiler that dares to change the order by which the fields are specified; though
> I understand the concern if QEMU policy is to be as portable as possible.
>
> Does QEMU have any form of bit field manipulation macros (e.g. GET_BIT_RANGE(a, b), SET_BIT_RANGE(a, b), ...)?

The register fields that I pointed out earlier should do what you want.

You can look at other devices and see what they do.

Alistair

>
> -----Original Message-----
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Friday, March 6, 2020 4:30 AM
> To: Alistair Francis <alistair23@gmail.com>
> Cc: Stephanos Ioannidis <root@stephanos.io>; Alistair Francis <alistair@alistair23.me>; open list:All patches CC here <qemu-devel@nongnu.org>; open list:ARM TCG CPUs <qemu-arm@nongnu.org>
> Subject: Re: [PATCH] hw/arm/stm32f405: Add preliminary RCC emulation support
>
> On Thu, 5 Mar 2020 at 19:24, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Sat, Feb 29, 2020 at 6:12 AM Stephanos Ioannidis <root@stephanos.io> wrote:
>
> > > +typedef union {
> > > +    struct {
> > > +        uint32_t hsion : 1;
> > > +        uint32_t hsirdy : 1;
> > > +        uint32_t reserved0 : 1;
> > > +        uint32_t hsitrim : 5;
> > > +        uint32_t hsical : 8;
> > > +        uint32_t hseon : 1;
> > > +        uint32_t hserdy : 1;
> > > +        uint32_t hsebyp : 1;
> > > +        uint32_t csson : 1;
> > > +        uint32_t reserved1 : 4;
> > > +        uint32_t pllon : 1;
> > > +        uint32_t pllrdy : 1;
> > > +        uint32_t plli2son : 1;
> > > +        uint32_t plli2srdy : 1;
> > > +        uint32_t reserved2 : 4;
> > > +    };
> > > +    uint32_t reg;
> > > +} RccCrType;
> >
> > This is a pretty interesting way to represent the registers
>
> Is it portable, though? I thought C bitfield order and packing was implementation-defined, which would mean that you can't guarantee that this union will give you the required thing in the uint32_t half.
>
> I think it would be better to do this the way that other device models do it, and avoid bitfields.
>
> thanks
> -- PMM

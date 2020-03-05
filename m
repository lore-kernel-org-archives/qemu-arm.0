Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3308983lfi;
        Thu, 5 Mar 2020 11:51:47 -0800 (PST)
X-Google-Smtp-Source: ADFU+vs6n/hBFLp0pfONncTy5re7giywz2nnUKHDAytOR95f9zyA64LKnyfD8ikX3Jh18InBriNM
X-Received: by 2002:a05:6214:209:: with SMTP id i9mr382158qvt.54.1583437907386;
        Thu, 05 Mar 2020 11:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583437907; cv=none;
        d=google.com; s=arc-20160816;
        b=IozmzE8aoeNdK0JNO9fQEQNGXrFE7LXwmvz1D9ehpL1T3/8J4PHa8zZ4z5flhoBpw8
         dGQmUuucUIwNC/Npa0vv2JjPBb3F7yVPqcEAfBGfFMruioKRoaeeXvGZzwrjBT33JP67
         rz4AZituly7WiT43m/lGerov2OSn9V1zYuc549ZId+Wsyfh3ZDJSpJeU7uP7431A2GMx
         ny6yym4KAXXZoHFVG8H/QnyCX0d88NizqKNBK3wDSJLJW3BV339cIjATZGbTV/5dhLYY
         MB8dqcZ+Lsim+laBtB5Ne01XYkW35dkvEQlSCsZlCdUWVvllmvDssdEeR55mJ6dtwGKa
         rWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GKElllibpcvRWEhrnifCMB0YbyIa2Zcxj7sNsXWVa0g=;
        b=YfnHovBBaHs6rBMbQ/GfTfukiJaYkY75NPvtkVbZOvWVrQmM5rqkvcbJ7Ch9+z43Tg
         Y7fA2jYjpAo7Qa69BRCZgA87x7ZZEv1BlaWSOAGKSER+kr+DpkR2p1LWpCY2/GkrlYMx
         2Wgv43S6kuLd5cS7kgkfMotpN5UjGiLKCGCnCcBcdKyuErF6Np+Qi22ZL1VxofDB+0Yn
         cZxt+2v0Nv1jjjoulJTuUbHnwZEXKjO8twiX3dQwGeSlaHFiUJ9vBnXCuWj/aUrXZwF3
         6JR4EBGfQK+6q7EnIdpQVzxKCBI8af43Vif3mogMAzqsWIA2xMeitqSeXhv3s3SVcBbb
         nkdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dahG+KWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si776044qtr.28.2020.03.05.11.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 11:51:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dahG+KWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9wX4-0007h2-SK
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 14:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j9wWx-0007gn-BM
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 14:51:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j9wWw-00049z-B2
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 14:51:39 -0500
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:40099)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j9wWu-00048X-8V; Thu, 05 Mar 2020 14:51:36 -0500
Received: by mail-vs1-xe41.google.com with SMTP id c18so4420987vsq.7;
 Thu, 05 Mar 2020 11:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GKElllibpcvRWEhrnifCMB0YbyIa2Zcxj7sNsXWVa0g=;
 b=dahG+KWo92MfpdfHw15aexMlALyGlJxjk8/C7ouogLkWeWm6SS3ewQy/JbL/Ok+v+e
 KwZNU7IxkesshiU7il/UanRlofUOLpOZniRVEj9VXYXp8kJwueXly9VKPaDvvY7x0GSh
 +41JMQBbTujawmo8NB/O3U1H3Tk1RYQUw3GjPxKk+RrIrBlv35eyLVtoZ3mZ+Zl2gMG3
 /cEj3n2yotkhvE38ltexHM9aPesNmaW+LmB6eSuXuYN9HaOhPTRIusvE405LtcEWOVio
 hd8lMjELok7BglDlI+BrqwxN+xVYEkqIO2PwIRxWOGStuz9t0AY6yD3NjI7ZIaGFWOHS
 J5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GKElllibpcvRWEhrnifCMB0YbyIa2Zcxj7sNsXWVa0g=;
 b=TkpmQRJi5aHD51hkDnjY4pS/QjfHuIpkN2vgKlYqK0f40aD3KJpNT4sDTbZM1G7eQd
 soPHHdqAoZeGc8sl6fYSCOFcUgIdPV8weD/dY3Vv/WpLpEgj9fEhSZ4WgcW/YL4Hdvh5
 o5sc3hkP9IOGrhkHJf7z8VkZfzmbYrio9P2D5ljG61MljoZxWjQYvmG1Gye+VYtMoy1R
 d8OWzrruJSAZOIWGVwT6CjMPS2yajxoPbzrUm7k2+MWky1M0hDU61HXl6Tn6AjkWdw2m
 Wh25yjCgGx6GuC4GhaZQenuXveu+s60dcAurVhnKvdVga0T3NVjxU0lwkslnCGUst9Oj
 yjlw==
X-Gm-Message-State: ANhLgQ16EQlLrOFGUB9PhVhtfdVrUirW+HUAlhXKKLsL1F/CxDSdSf61
 moxrHf8CTMfC1PZJR5n+fE/thUGu8SH0mZ4R8+s=
X-Received: by 2002:a05:6102:205:: with SMTP id
 z5mr324369vsp.151.1583437895635; 
 Thu, 05 Mar 2020 11:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20200229141011.58989-1-root@stephanos.io>
 <CAKmqyKP1QFiWSQzUsoV9TLWBQ8hrx+yg7UM2=DnAoCAanLRuwA@mail.gmail.com>
 <CAFEAcA_O6ScMF0fJgHORVXDQ+PvFNW4w6kBkeeB0vHixHo0zqA@mail.gmail.com>
In-Reply-To: <CAFEAcA_O6ScMF0fJgHORVXDQ+PvFNW4w6kBkeeB0vHixHo0zqA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Mar 2020 11:43:47 -0800
Message-ID: <CAKmqyKPp3tSf4vpxPh9ozH0G9=__DSU3BFYB2JPvJUjgg9-iyw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/stm32f405: Add preliminary RCC emulation support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e41
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
X-TUID: uHJZ4emK2ChK

On Thu, Mar 5, 2020 at 11:30 AM Peter Maydell <peter.maydell@linaro.org> wrote:
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
> Is it portable, though? I thought C bitfield order and
> packing was implementation-defined, which would mean that
> you can't guarantee that this union will give you the
> required thing in the uint32_t half.

Yep, it is implementation defined, this won't work correctly then.

>
> I think it would be better to do this the way that
> other device models do it, and avoid bitfields.

I agree, I would recommend the bit fields I mentioned earlier as that
is similar to what you already have. You don't have to use the
RegisterAccessInfo method if you don't want to. I think the ARM SMMUv3
is an example of using the bit fields with the traditional QEMU
read/write functions.

Alistair

>
> thanks
> -- PMM

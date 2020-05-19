Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp675lfb;
        Tue, 19 May 2020 15:29:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDmmO5SK9sVBMXvgzSzQ/OjdlD5DvDJGW+eaH7S2Fc9CVKpO5Bo6caR0GPXf+rzVpVcD48
X-Received: by 2002:a37:5d7:: with SMTP id 206mr1337652qkf.86.1589927359336;
        Tue, 19 May 2020 15:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589927359; cv=none;
        d=google.com; s=arc-20160816;
        b=bMlCVQxooBtsPhMt/lK8ANLxWECULw7sSMD97DDY0A8gYXx4EStyLVH9SsPlY1jNPE
         n8fhJtcWZ33DTRhrhubXIUz3fBdMn3pk+aqwSCFL7G62HsEBBcseIPvIJTwW2ryBiUA/
         pPoBOA1hZyOm6wdl6ien5yD6WUi5Cth83qr2qKaqAQSgPHxHjWdX78rCeGCAdcLhqWIJ
         yIZiu7tlu1CrCguZHRIeYgRRgSO1jTXoxDRm3Jx5QM/yJTWMKPWDvTl38s86dOfLPrbu
         S66YYlgFK3jpplNFK8ON3cEC0/RV/t+IFFSygx7RzmF6FrBU/iuz2oY5Y7sINyYOXiRh
         scfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1doeUOGFgBSzvlVpQkD9kEmwRWQv9uyq48LXCg2Xzw=;
        b=ctzOXhYCqPQJDhOXz7iX0X0zcFYGeBER0+vLkDnRULa3echQzz7U+xaIfcRyfadv9P
         id61yPWwVAYNyEG2t3Bodh/4r7FvsypQr+ANwsKao9bW5uzLWgN4Wd7wUjxSyelyYfz0
         AS4p1goHQezsdPlBSkGzP7DfHszSPEbJp7QisanMPyE0HRAnJgvJ3H8Pdb8Z6j5okvAh
         P16cXGgl48h5B2CUNEFgdMpr1jUKelmoEhEn2f+64dGxQ4OXoxRpo1hxsKBnVy8lsbip
         KivRGA+jdUXqJLoB2JpGAFBGKXhQfIULUimldrag2wA5fW4MfAj+J9Gxohazmw+u5vMT
         S0mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAkoZc2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si667978qtp.325.2020.05.19.15.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 15:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAkoZc2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbAje-0006Rd-Qa
	for alex.bennee@linaro.org; Tue, 19 May 2020 18:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jbAjX-0006RP-Bb; Tue, 19 May 2020 18:29:11 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jbAjW-0002SQ-AJ; Tue, 19 May 2020 18:29:11 -0400
Received: by mail-io1-xd41.google.com with SMTP id 79so1015938iou.2;
 Tue, 19 May 2020 15:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1doeUOGFgBSzvlVpQkD9kEmwRWQv9uyq48LXCg2Xzw=;
 b=VAkoZc2E1LLQg6yTaOlK/N6DT3YhKOP5UVJKWGq6VKBQXvXnL+fiPsaDUt2X7kH1fZ
 8ABN6U0PO3KB1V06dWcr4YBWOKXVKZ1PDedM3O32gzQMZYKxVxowHrz3g8VYGYb84PJh
 5QX5g94B/F0rUEn1euP3GLBLjlhr5KrLB316Ctjg8XG/M99XaBnONNRO1ZQ2baFxEHmX
 wM1rwQDoH6U+WKWx292NMfJk6qZ1w7eczupeI9ENEjY1E50bdBuSHpwY8WIzIKpH8Wf8
 9hEwfMmSU9NvBYcRJvY5SzLN9SubzGHu8CdrK7eCA3iIRQB3mW97elCDFel8AidOAX7/
 Zhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1doeUOGFgBSzvlVpQkD9kEmwRWQv9uyq48LXCg2Xzw=;
 b=lBwW+oqCnqINYoXscIJST5xstBA8uykLRAUbGfD+j10vo5EjiRMKlut3uunMjRBGtc
 aCHkY2nVxFe7mWhfcjaVkfhku/bbXijbL1KqJN4NKusObkfxA4fASG9sjAFt9548AGIm
 D0u8x9xvlbKRP1wStHFLibMS42caQVBzxo0EL0asJnnV6hf1GDeZo3cWrzdPE5bGZXNU
 p//eHTlay97YXFse4z3632997ksYOLn2zu5SDy1aXVC7doJjXgpPc5rEHnP1illASO6a
 bIN2dKIpGpEW08KykwofbwfqmJNSsTK+r1mt+O9yHUka0SiiULh8430LCiScGscFz8Vo
 cIFQ==
X-Gm-Message-State: AOAM531OL7C7ZcmqTy2awHQjO8RWoMT99fFk622r/6h+kZpt/kQBjD9f
 0h8VElWYTjjofpdCTnM+IkcQZ0h8chYM2YmmRnw=
X-Received: by 2002:a6b:5c14:: with SMTP id z20mr1115418ioh.176.1589927348963; 
 Tue, 19 May 2020 15:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-2-armbru@redhat.com>
 <CAKmqyKOun2FyT+JR8cyrP9eQn9xFDAppFb4W12ym-TPGt9h7Hg@mail.gmail.com>
 <87d0707bri.fsf@dusky.pond.sub.org>
In-Reply-To: <87d0707bri.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 May 2020 15:20:15 -0700
Message-ID: <CAKmqyKM3oOLfAxupqfabrj_epQCCE_YbwnkU4cRd5mtg8+7_yg@mail.gmail.com>
Subject: Re: [PATCH 01/24] arm/stm32f405: Fix realization of "stm32f2xx-adc"
 devices
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AhC3znpSwB0x

On Mon, May 18, 2020 at 10:08 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Alistair Francis <alistair23@gmail.com> writes:
>
> > On Sun, May 17, 2020 at 10:06 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> stm32f405_soc_initfn() creates six such devices, but
> >> stm32f405_soc_realize() realizes only one.  Affects machine
> >> netduinoplus2.
> >>
> >> I wonder how this ever worked.  If the "device becomes real only on
> >> realize" thing actually works, then we've always been missing five of
> >> six such devices, yet nobody noticed.
> >
> > I must have just been testing the first ADC.
> >
> >>
> >> Fix stm32f405_soc_realize() to realize all six.  Visible in "info
> >> qtree":
> >>
> >>      bus: main-system-bus
> >>        type System
> >>        dev: stm32f405-soc, id ""
> >>          cpu-type = "cortex-m4-arm-cpu"
> >>        dev: stm32f2xx-adc, id ""
> >>          gpio-out "sysbus-irq" 1
> >>     -    mmio ffffffffffffffff/00000000000000ff
> >>     +    mmio 0000000040012000/00000000000000ff
> >>        dev: stm32f2xx-adc, id ""
> >>          gpio-out "sysbus-irq" 1
> >>     -    mmio ffffffffffffffff/00000000000000ff
> >>     +    mmio 0000000040012000/00000000000000ff
> >>        dev: stm32f2xx-adc, id ""
> >>          gpio-out "sysbus-irq" 1
> >>     -    mmio ffffffffffffffff/00000000000000ff
> >>     +    mmio 0000000040012000/00000000000000ff
> >>        dev: stm32f2xx-adc, id ""
> >>          gpio-out "sysbus-irq" 1
> >>     -    mmio ffffffffffffffff/00000000000000ff
> >>     +    mmio 0000000040012000/00000000000000ff
> >>        dev: stm32f2xx-adc, id ""
> >>          gpio-out "sysbus-irq" 1
> >>          mmio 0000000040012000/00000000000000ff
> >>        dev: stm32f2xx-adc, id ""
> >>          gpio-out "sysbus-irq" 1
> >>     -    mmio ffffffffffffffff/00000000000000ff
> >>     +    mmio 0000000040012000/00000000000000ff
> >>        dev: armv7m, id ""
> >>
> >> The mmio addresses look suspicious.
> >
> > Good catch, thanks :)
>
> I'd love to squash in corrections, but I don't know the correct
> addresses.  Can you help?

Yep, thanks for squashing it in.

The three addresses are:

0x40012000
0x40012100
0x40012200

and they all share interrupt number 18.

Let me know if you want me to do it.

Alistair

>
> >>
> >> Fixes: 529fc5fd3e18ace8f739afd02dc0953354f39442
> >> Cc: Alistair Francis <alistair@alistair23.me>
> >> Cc: Peter Maydell <peter.maydell@linaro.org>
> >> Cc: qemu-arm@nongnu.org
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Thanks!
>

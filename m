Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10176463lff;
        Fri, 17 Jan 2020 10:45:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwevZn4bVp0Bascc1mc+I6lFXSR0c48wyaDwbWSpoyJIbs/+c3Tt6d4wuqifczijllbTXhk
X-Received: by 2002:a05:6214:13ef:: with SMTP id ch15mr9184592qvb.183.1579286709273;
        Fri, 17 Jan 2020 10:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579286709; cv=none;
        d=google.com; s=arc-20160816;
        b=lvvhqrayyPmALEPIFtKdnn8EtRpcNv9bLEIW6zv/OzbNQOe9+6EaijSKcG7vqd9nxc
         cr7ej6EJxw9l+4ksSyppvhwq/BmjJVsDmMw+QZVxgOnl1IR2Qrhnj7N7Luz0HmKcJHRQ
         BZMwc1eVk07/daRe1rYfah4QmVsX0a5gyLKSb7990ukg2CzVwVVVbHExnzRf9S3AWeMb
         r9a7SDyj20jfEsRqYPNueEBNicJ4vLkzGkFxDAz/hhsDAzZvIhtyoKR50T1Bjg0EZZ0d
         2afJBZbROr4hOeYsN/ffljTGbyOMJlImwHAyTFhySAKTk423b24M1IkARIa2hlgyiVNP
         S0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/FVu51Op0a4Se1tMHsJ70/J8wXfsAdBp/IiqnssJyqc=;
        b=v2zYhn6sNKcWSrk9lqJPBkd/zc+vRgvTjSBDd60pOHKa/2oerRFw0M0QZwQdlbopVV
         5VsQDcf2ZrF2A9L2W6Ong0QJrPcNX/35T9YYo262MuPZwYCQypMA9xhbvsvgs9wSZzcL
         Z9q3IGeAvoUpv8ECCnu3P47amWGWK07WuhWwALLInhXnF8tFs36iPOtPGZeG86oYEtox
         pm7B/2TEY+fn+rK4RHwAva74QtPGvTj7k0Hdfnx6zi9vuhu/QTrkGtokUe/pFfurjCg7
         kbrBrcHdEwcx+8DjNPjpC/sYuYOBHpdKTU9aXUAyxQuwvPRNT3rUTlpCOm6vWuLNtV0d
         5mYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cs3PsVox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v38si14966268qtj.318.2020.01.17.10.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 10:45:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cs3PsVox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isWcG-00069o-LA
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 13:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isWc4-00067F-Cq
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:44:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isWc3-0005GA-1c
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:44:56 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37221)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isWc2-0005FP-RM
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:44:54 -0500
Received: by mail-oi1-x241.google.com with SMTP id z64so23106583oia.4
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 10:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FVu51Op0a4Se1tMHsJ70/J8wXfsAdBp/IiqnssJyqc=;
 b=Cs3PsVoxYYQsENmDo9UOkMI/ZNgz6f5OcB9nmuXffFthNeaChMEd5Ek6ToISEtFav1
 Ynzet14+BMSjY+7t7z/mN//N09+TLFF6Wef+An5hP6JZBFvdGFxn5Yp+c6p2YkXhWf4f
 vqpZ68DVrmnYkczBs9j3Z7CY/DWUVYMkdwX6iAVG2/cxa/dXZrhQQ3pp6aD8Jk1ungW7
 BB5BL9Pk98umL7n3u1uAtXV/DDWAN54C811+nOVKvro9m6gf0h+gEG4hI6IIGMR6EL8G
 wwQG5sdq/3de0LrZkX6ebgkWohhKpBHOk4gvPwuEjhlxddI2/HVTVA4EBOeuTfwjoaAf
 D9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FVu51Op0a4Se1tMHsJ70/J8wXfsAdBp/IiqnssJyqc=;
 b=On0zaq+lKLlyQ0iYxR7Q7bmCSp+3Qv5EZH3Ph5u8Cs73neyuwCXzvWdH0RPxN7zIHl
 cr3lgznT5wq4nEQ5hWRVFYm31ZYl+nwW9omgvUcrQhlOmjAq8hhQw6yL3hK/rRm/rNaM
 6DNcYWrqYprAlRTjCOB/K/D9YlRy1fjIKwrRm1Xrs1mMhAe/z0V59hFMl2DVLm+nIw3o
 zBS+o5ddgR56TJewiPGSC15ioaV01TFN5dolVlHjQW/2ujNjjxahr73v3YvGC4F/eBQh
 wKSO7cMCVTY1i1GqoZwGRaAXXQsxReiASDgG0Ey0rA+ahyJ8qMQCJP/lkv1Oahyq471e
 m5BA==
X-Gm-Message-State: APjAAAUSPAIXIbFKPvwP9O7dVBDkrO/GIqns7NbwzBKaUigOEny6GC/4
 jOk+LFd7gAjupBjepOAC/pB6wpUlZl/CXJxnVQ+ngA==
X-Received: by 2002:aca:f484:: with SMTP id s126mr4301199oih.48.1579286693769; 
 Fri, 17 Jan 2020 10:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
 <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
 <20200117182939.GC13396@roeck-us.net>
In-Reply-To: <20200117182939.GC13396@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 18:44:42 +0000
Message-ID: <CAFEAcA9zWeW1k-K7qVzCSOA70BmOCa9onT2z_QUQK-=0AJ+NjQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KOUmb921LVcQ

On Fri, 17 Jan 2020 at 18:29, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jan 17, 2020 at 01:48:06PM +0000, Peter Maydell wrote:
> > On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > The Exynos4210 serial driver uses an interrupt line to signal if receive
> > > data is available. Connect that interrupt with the DMA controller's
> > > 'peripheral busy' gpio pin.

> > Rather than having the uart and pl330 pointers be locals,
> > they should be fields in Exynos4210State. (Otherwise technically
> > we leak them, though this is unnoticeable in practice because there's
> > no way to destroy an Exynos4210State.)
> >
> Out of curiosity: Is that a new leak because they are now tied together,
> or is it an existing leak ? I don't find many DeviceState entries
> in xxxState structures, so find it difficult to determine if/when/why
> there is such a leak.

Yes, it's an existing leak, though it's more of a conceptual leak
than one that valgrind would actually complain about. (The object
isn't totally unreachable because there will be references to it
in the QOM tree. Keeping track of your child objects only becomes
really important if the device is hot-pluggable, because if you
can hot-unplug the device you get a real leak if it hasn't cleaned
up its child objects.)

Aside: I think this code is written this way because although it's
a container device it has been incorrectly written against
the pattern of a board model. Originally board models did not
have any "this is the board" struct that they could keep things
in, so the only way to write board model code that created,
configured and wired up devices was to have it do it in a
way that didn't keep track of the things it created once the
board init function returned. This code is part of an SoC
"container" device, so it does have a state struct that it
could use to hold either embedded device structs or simply
pointers to device objects, but the code is written like the old
board-model code. (These days even board models have a suitable
state struct they can use.)

include/hw/arm/armsse.h is an example of a device state struct
with a lot of embedded device state structs in it. (Not all device
state structs have names ending "State".)

thanks
-- PMM

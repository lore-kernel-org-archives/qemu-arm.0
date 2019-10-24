Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2392852wrq;
        Thu, 24 Oct 2019 07:02:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQqEg8XQKIP0VEL6LyUM/jrc7aRzNbRSqrEg+euwhxWBl+xfUsR6p7PG+gMHtFtlM5iACG
X-Received: by 2002:ac8:3711:: with SMTP id o17mr1347768qtb.159.1571925758621;
        Thu, 24 Oct 2019 07:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571925758; cv=none;
        d=google.com; s=arc-20160816;
        b=WT1A91KaegXsvZKn45rLvkX1Z3FcV6WsQF14R6R+hxmoUTenTH9YtJYsarhT4KbHEl
         J7ihzKNWSBxblxpJ36OrizWlqoJWSv2Hx4vtozmHOOg+SZj5aaXSIHQKNbkndUTvH4Z1
         QtKVDfBl5HRgiNaR70Fitpx9DKInvGF5sjVqSdg+ARUh02DDxU4KFtykcaRSFtpucjFZ
         FvUlQR1+d0WyTLAaa8J4nJe8dnOEuMpRi4c0MidySI4rXveAMcFGKrMBpBOl9m7lVeAC
         i+cwbbIiKrPhIMDUh3I0d+1z0YBTWBY1EflsJwTTm0SyT5KsFBNkTu6MBgUc3Fz8qDHj
         iT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ooq7dmnoQZtK8JLOj0nV7TogF6dsbmHh45dAnnb9lFM=;
        b=iedEfZb5wXrcJfpGPwqbS9fuqIV7UItg6qAPHqSqNGq0MltRfUOSkYEUZRqACSePVJ
         DPhw5WnwfIy1MtDRuDP7Vbqv1lBbSe2n5mDxmNwNFta+sHhPlQhv4A1ZTErVQi6JiFAC
         4ismElyMV5z8OhFnXKHaRPGA8XTKuDS5NC/SBOrQ3VbdCKxVHeNlSw6coOhIADhGD59d
         cSwBYnNz4hnAiVAfqgjRfLRZgAuP2ok21MYs8lgtwy1+irA5rVjJnIHMcvGTqFvnkzWM
         YbTYDW9Pk2KOvwI328BU0qjmL/8fNyEUHY2UQwtjU5O9JGQDQHp4vLSETdSwcUiJvvDY
         dVKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xqZp6AVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si14077971qtm.2.2019.10.24.07.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 07:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xqZp6AVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNdhF-0002IZ-Nq
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNdUv-0007Yq-H4
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 09:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNdUt-0000MV-SC
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 09:49:53 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNdUt-0000MA-Jp
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 09:49:51 -0400
Received: by mail-ot1-x342.google.com with SMTP id u13so1938832ote.0
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ooq7dmnoQZtK8JLOj0nV7TogF6dsbmHh45dAnnb9lFM=;
 b=xqZp6AVygjUS+fLnDwZgV0rNwHygjKB0AVtyfOav+XZTbD8ZjMGAshzqTijQAdnM4P
 oqowkWWEuFnbf+8xvh1suLDt/O7EDOjUrLXATOzZSAxsTOZCQX+FzIySbF7jJf4fWRAg
 cV9TJttna/8HGY5DqA4khngD0ze72KTPTe7T23EBU+6uqrr/mUQohznAUq4sC4qE+4nz
 SJd1U5hdzu6V3pqw/VrtQAuREXihKL8X6zWQFbN5VsPOPJ+rzKY7E9rlixCr01NsTmMX
 cjwqlEJ2Tj9jEQWN6c5Ik1oS8nJYdNW7t01aDluQ5/DnILyqWwDi5KCQ49uNDNXpaLWB
 gr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ooq7dmnoQZtK8JLOj0nV7TogF6dsbmHh45dAnnb9lFM=;
 b=TbXa996GU6BTryM0h5KB+gPzGjWCWeF1XwqPplqIqBi3pw2jOHkkh07GFv0dBC7dZr
 ul9Q6OiVenUpgBrIWzbt+d+Jk95ockuZ0DuFz+WIczOcMp0o2von69gHsAXXj6StsZSr
 kuKPbMYpwiCvcZp66ykCTzfoMmu2XkR2JPCQeXWiPxxuiQHjPpshEV2Ult6R/WvG7hvs
 3i0stU6/rhpQfpevn4sVqeWjLOjIlVPDGuHEZaB6mwQMoF+/bm438htM1D2+gTP7WBio
 bifs2WxjLO3J/Yd2QPVjOPxy0O3LBpo8pXX4WKqOFS0hVsBDyu5t7bnjwfSYKNrKGs3H
 RaoA==
X-Gm-Message-State: APjAAAVQmS2Zvb5twqC1GnROd5yaZ+tydPvPxUd5uEclfk8lef0qMvi+
 XtA6bBWaB5DFnjuOFSvh8H0DhqXPN/HJ8coYWotIVQ==
X-Received: by 2002:a9d:708e:: with SMTP id l14mr11906940otj.135.1571924990613; 
 Thu, 24 Oct 2019 06:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191019234715.25750-1-f4bug@amsat.org>
 <CAFEAcA_WTyJ2AWZfKQSipFmn46ztG1XTL9sE9P2QDD7ob-FKFg@mail.gmail.com>
 <1ad1b559-13c4-ed2c-f82b-e6a516219e57@amsat.org>
In-Reply-To: <1ad1b559-13c4-ed2c-f82b-e6a516219e57@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 14:49:39 +0100
Message-ID: <CAFEAcA8Zst6XbPWiAat=z1s7HBzEMscsP=ibrPxP75kHXjZ3Kw@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] hw/arm/raspi: Add thermal/timer, improve address
 space, run U-boot
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Herring <robh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hOphyfxBZQp4

On Thu, 24 Oct 2019 at 14:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 10/24/19 3:42 PM, Peter Maydell wrote:
> > On Sun, 20 Oct 2019 at 00:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>
> >> Since v2:
> >> - fixed issue in videocore address space
> >> - allow to start with some cores OFF (to boot firmwares)
> >> - add proof-of-concept test for '-smp cores=3D1' and U-boot
> >> - fixed my email setup
> >>
> >> Previous cover:
> >>
> >> Hi,
> >>
> >> Some patches from v1 are already merged. This v2 addresses the
> >> review comment from v1, and add patches to clean the memory
> >> space when using multiple cores.
> >>
> >> Laurent, if you test U-Boot with this patchset again, do you mind
> >> replying with a "Tested-by:" tag?
> >>
> >> The next patchset is probably about the interrupt controller blocks,
> >> then will come another one about the MBox/Properties.
> >>
> >> The last patch is unrelated to the series, but since I cleaned this
> >> for the raspi and the highbank is the only board with the same issue,
> >> I included the patch in this series.
> >
> > I'm going to apply 1-10 and 14 to target-arm.next.
> > (I've reviewed 10, and the rest have been reviewed.)
>
> Thanks!
>
> Do you mind amending this to patch #3
> "hw/timer/bcm2835: Add the BCM2835 SYS_timer"
> or should I respin (or resend it alone)?
>
> -- >8 --
> diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
> index 49b40b55f9..3387a6214a 100644
> --- a/hw/timer/bcm2835_systmr.c
> +++ b/hw/timer/bcm2835_systmr.c
> @@ -115,10 +115,7 @@ static void bcm2835_systmr_reset(DeviceState *dev)
>   {
>       BCM2835SystemTimerState *s =3D BCM2835_SYSTIMER(dev);
>
> -    s->reg.status =3D 0;
> -    for (size_t i =3D 0; i < ARRAY_SIZE(s->reg.compare); i++) {
> -        s->reg.compare[i] =3D 0;
> -    }
> +    memset(&s->reg, 0, sizeof(s->reg));
>   }
>

Sure, I'll just squash that in.

-- PMM

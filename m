Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp418756ejq;
        Thu, 18 May 2023 04:43:50 -0700 (PDT)
X-Received: by 2002:aa7:d31a:0:b0:50d:f881:1afc with SMTP id p26-20020aa7d31a000000b0050df8811afcmr4516240edq.23.1684410230146;
        Thu, 18 May 2023 04:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684410230; cv=none;
        d=google.com; s=arc-20160816;
        b=hKLF9xnFRT8Qh+7Dfz6D/s+aQtXyaG0KwUqIFAK0TMl7yyosMC1PSdOdPTLWynQfkR
         t1FnDO4kFEuR4xrspb+mlFyS6QyFSSidcEGZpgVGSiChyofD6aodCR7vzF+dCaLpgEZF
         Ibd1OKkAShpcjQ8L0UOdGCBA13CNE2TTEPMYv5hC/OST0fW8P8ZuGvX+mTPiYwa1ikZ/
         30dKyF5O1SSRgIJQgTLeGC7BslCmPStZqtPciKgIdyBGflSHdX0l3TCRPNeVkM86bskN
         4k2MjF3UNUCbfWGrJTqJY1NHq+RL+E6ZpRc5hJgYftILY2hoj35R+xjCf9WxlhxlvIx7
         1jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJZg7lol9uI4nA7+TzoP5++HFha6j4j/3Bkc6g2Z5PU=;
        b=gL5wNltErPAQ88uPdvl8kuWd0cS40mHwtznvU4DS5Vo08QvEseV+NM+SVXw4unY95U
         YguWuISiJQw1QC7KpGyd4KjHlK9jWQbuOvFF+FBlXK4Xd8Au7M73gz71TSpzvA78unuh
         yMJrnxkxfT9eSlQe/MbnyMjD5naamCZf3Y4s9DnhV0QzaeVY+jC+WxTaYG9rfZRA/EMd
         6nIWr4hCIKPqFt7Nnc6aR1ceUtp800alTNRei0vUrTb9u9sO2kcGqEiKdfbalgbQx6e+
         mFyyAw8brgdeTLumj49LOn1c5ZV1AihX67/Ef/iHEFtQsdxFNP6kEhNydSCMK4Nepxi/
         +vDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjnwThd0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d22-20020a50cd56000000b00509f91bd36csor513180edj.3.2023.05.18.04.43.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 May 2023 04:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjnwThd0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684410230; x=1687002230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJZg7lol9uI4nA7+TzoP5++HFha6j4j/3Bkc6g2Z5PU=;
        b=pjnwThd0pdKsuflo83JmNGVelXllgqIS5MDjj/2vKm4Fsxhxnv6LyLvB3BHucB9Dwp
         kMCOPTRofke4JdlhxqUp3cry1gtYc8S/D0oDWs93t95P50nwWIxDOtujOXMTVAwpoX9k
         24mO6lBcLbBVxt3kgQnTJMRpSpR2qMa/vwTyflXkFjv6niSLIhm/XFWKr7EeBwR7pc+F
         YCm89VZuXMgG4cZSL9Cgwu9v9N5Q9S7ZRy+QKxReSUM441xHeCTWDj2AlzxPt/MWP/VB
         ZInYFq2hJPHrfXIwPpdFCn+IcSL0P9DDVvHa2POxDtmvK0VMfp6kCTouZ2oM93ch7+bM
         +oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684410230; x=1687002230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJZg7lol9uI4nA7+TzoP5++HFha6j4j/3Bkc6g2Z5PU=;
        b=B0141O5OphCQD1zqiy09y+0ma1Gu4pcxbp5ITxxY1CJpM4ZJDfQtyAcYyxHCE0zJUN
         HxjyeoNQwr6OAKy8uP5X/cvjK7fXO7Bgq7bAH7E5JOmO/jOUIwTG7ihpi/cE/OHwL4JX
         Y8SAR+wLNFJXfAYxie4sykynI1UZitGqT4IGg1+CyLNuvMelnG7jtxPQeCMRHr8SKJMY
         /tSleEBLKgFt4H3S+lGWgMejJRC+SKaJUdHjmBHP6OrRnkaruOlUj4EV82BtJn2zDj+e
         Le9s1iTFlXJQAC2MuM+UYe9HuS1dkzeWtxd3Vp7dIdODjN+22GE4wykvqzc9KmXV5rUh
         Dwng==
X-Gm-Message-State: AC+VfDyARzlBPqTeq4zTce6sA/GE0PwrPqAENXugcNi9CmfzS8Pcr9BU
	U/1E2sP5w6MAbJlbS+5hhG2Cb+iPifGtt/xfWe1hb6rrPffWu4N9OhI=
X-Google-Smtp-Source: ACHHUZ5Ao6feoH7H1dCbS93e0AEM0/DxsoVXb0uiODPcnUcZZYwefu4Enqxuk1P+Ls1kGwLWsftZ4lLsmuxeS2/s95E=
X-Received: by 2002:aa7:c94b:0:b0:50b:f929:c6d3 with SMTP id
 h11-20020aa7c94b000000b0050bf929c6d3mr4255933edt.1.1684410229736; Thu, 18 May
 2023 04:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230516104420.407912-1-alex.bennee@linaro.org>
 <CAFEAcA8fu-+YUeuhVw8mpgYXO=ueXrCecC-LkhFwoubUkMvg4Q@mail.gmail.com> <87a5y1nbbv.fsf@linaro.org>
In-Reply-To: <87a5y1nbbv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 May 2023 12:43:38 +0100
Message-ID: <CAFEAcA_b8WPQe4tjeTeL2mYHH+0KYXreUhiQ_Bn9cDBne-GDnw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: add RAZ/WI handling for DBGDTR[TX|RX]
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Anders Roxell <anders.roxell@linaro.org>, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: iTmio3ghwwVJ

On Thu, 18 May 2023 at 12:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 16 May 2023 at 11:44, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> The commit b3aa2f2128 (target/arm: provide stubs for more external
> >> debug registers) was added to handle HyperV's unconditional usage of
> >> Debug Communications Channel. It turns out that Linux will similarly
> >> break if you enable CONFIG_HVC_DCC "ARM JTAG DCC console".
> >>
> >> Extend the registers we RAZ/WI set to avoid this.
> >
> > Applied to target-arm.next, thanks.
> >
> > (In theory we could implement the DCC and wire it up to a
> > chardev, which might be a cute way of getting early debug.)
>
> I wondered about that - does DCC give you anything that you can't get
> with semihosting (which I think also can support earlycon)?

It gets you a debug console without having to trust the guest
not to scribble all over your host filesystem :-) I'm not sure
this really justifies the effort of the implementation, though.
(Also, as usual the awkward part is the UI and how you'd let
the user specify the chardev to connect up.)

> I found it a little unclear if this is an always available feature.
> Should you expect any modern Cortex/Arm chip to support DCC when
> attached to jtag?

My guess is if you can attach to it over jtag at all then
the DCC channel will be there.

-- PMM

Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp416080ejb;
        Thu, 25 May 2023 05:55:34 -0700 (PDT)
X-Received: by 2002:a05:6402:7cf:b0:50b:d1b6:c372 with SMTP id u15-20020a05640207cf00b0050bd1b6c372mr3994550edy.26.1685019333997;
        Thu, 25 May 2023 05:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685019333; cv=none;
        d=google.com; s=arc-20160816;
        b=cIyggRfeJSmFhQLM/vwHL+CE4PFvoGwP7+F3fHFIIwk/cKCcWkdE0L+2D08Btsf8xd
         YqshfUOLtBims6VngqQLa5mqw2cAv8wr1n77cRAK+lP7ScBQ9ZWls+No/3/3V3Fc7g9d
         Ug/PYhvqwvdCchXeCSpucGiMt1GNm7FbZwnuYxMoBTdElWhGzRUnTWGkVu0nI+szTrBJ
         b7bCxAgQfNlqqAZrIeqAUGWnUWBK1Q/FR/KtFwSr7NnmvzRx3j6d8ZzZsF6XI96qqqS1
         ChTzPpZYhgqB+TpDN8eFc83JcUKxWqeiJR/OyJ1r5P9BxAo1QVSSxzXt3kL+3CbpPwB1
         vVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wnmdK1okFEDTpG2HnSm1Ma2k5nLE93zVWkO2eo3JDt8=;
        b=fT7+k+5ZfR9GGWj1H1HPQF/jUGpvaT7rzCJbBv84uAA85wOwKx375HZEs9puyuGhuy
         Ml8qv7Izz2FDQOO6KlV+/YGFLAcFFHSAKNppRjW2wVpwGi5wjnRxCS50ALfT00b9EL8S
         jFXGFHORBsD84BWIcxqIG1vAZQKarQkjmEO9q3BqjarJ15bzBBtI1S+BbOGNAKZLb2w9
         xYyZWdSlAxvzKm0KmHke20zmKODzN3mNkl2lkIvCfwZ8o5Ilu1gSjAdfGPvXDGwp1+Ns
         A5iMoNxlupgoEivzQTNOgPQfuVHEx9B4bnYDFjIdkz77TgedCFUho2ctjSSAcT6i3xEk
         gs1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1ThRSoi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e5-20020a50d4c5000000b00510ddb2b94csor785566edj.3.2023.05.25.05.55.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 May 2023 05:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1ThRSoi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685019333; x=1687611333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnmdK1okFEDTpG2HnSm1Ma2k5nLE93zVWkO2eo3JDt8=;
        b=i1ThRSoi4Pi+lk6otkvkqL1fGzBoQz6m1oGgKy3ksdPU9WJB9eCybPET9Ycds1ul/H
         fcviK/R5nfIKLYCSuBcTLwY3EjEdzxd1G+aykY5+6TssPUmTmdiGmwL6a0l9lVHgnMLJ
         Z0VmsUPeXrKVtTeGc/KTwySW56w0m137BqbZfZUywrljPchGHv11Vya+CdzFyggbHLDT
         DIRD0aVYn6TMi9kMVK5E4z37xZFQCOwcQk7SN4Pxtpx/NqhqrXLRasKCoXicKSoDGUWj
         TLLkS+teJSJlLNDvcdWs0EFoOggO6oHSlxdNHb+KvJeq9ZAPW1yefHIflyLnnvsJLuZI
         QkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685019333; x=1687611333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnmdK1okFEDTpG2HnSm1Ma2k5nLE93zVWkO2eo3JDt8=;
        b=BMkfhSJGaeIDY41hnS/pJatBSG28CK6jMFvFdZH3JmMI05V107p+JL9UOtal3v1ut0
         hw9qIemxskZazB5BQd+7m4U5BeltprWxf5xM3V+vNbmsf9/iU4Pel24XTC0R9CisZ7mB
         sqmDpvhtg0pDCFZlxOIalaDJLkZtfbzI4QTO44dyaJu1iB5KQl9djFcNnVjAstYN7Zdw
         Fa0c+iDtTJVHfy1MVoIFkRUQJ1W4eD596RAZd5iRX0PUM0LpN9+WCxULA/etF3FN/IcS
         5oAFlnLZuCO9UzpKqa1BjSiJWe/EisSsVdOpApSXCK3OA8y43nl2hFHefLJZseUvzC8v
         tKsg==
X-Gm-Message-State: AC+VfDwkMedq23cAmzhGte0nXNJ/n0ehPl5dl1jeLNY47NhSUnQHDFMh
	bYjZZhZaHYbO3ykz5/jrZh+4hxakdh5JVnwLb+Cjoc8W/18uOfbTfXM=
X-Google-Smtp-Source: ACHHUZ7RzGG6CIfkdRteLHTtjZLPLrU/LVW6L4fMWA2d28PeDuS2HyfAsvAcm3e7uzxYqr0SXI0ADdqACo8y1Nrx9XA=
X-Received: by 2002:aa7:d1c8:0:b0:50d:89a3:d909 with SMTP id
 g8-20020aa7d1c8000000b0050d89a3d909mr4186530edp.30.1685019333545; Thu, 25 May
 2023 05:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230522153144.30610-1-philmd@linaro.org> <20230522153144.30610-10-philmd@linaro.org>
 <CAFEAcA_7dkWB9qPkzYmW6_F1eaAet0PPk0PHywGS2EpAkFAsUQ@mail.gmail.com> <87zg5stvyi.fsf@linaro.org>
In-Reply-To: <87zg5stvyi.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 13:55:22 +0100
Message-ID: <CAFEAcA9EYLWnm6kEZGJn=Ah_wy1oE+8u0bZuVPq8=wTxtUo_Hw@mail.gmail.com>
Subject: Re: [PATCH 09/12] hw/char/pl011: Check if transmitter is enabled
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YQBM74X89iU4

On Thu, 25 May 2023 at 13:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 22 May 2023 at 16:32, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Do not transmit characters when UART or transmitter are disabled.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >
> > Last time somebody tried to add checks on the tx/rx enable bits
> > for the PL011 it broke 'make check' because the hand-rolled
> > UART code in boot-serial-test and migration-test doesn't
> > set up the UART control register strictly correctly:
> >
> > https://lore.kernel.org/qemu-devel/CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0=
xr5WquR213mBUBg@mail.gmail.com/
> >
> > Given that imposing these checks doesn't help anything
> > much and might break naive bare-metal tested-only-on-QEMU
> > code, is it worthwhile ?
>
> Surely we aim to be a correct model so the fix should be in our naive
> and incorrect code?

In our own test suites, sure -- we should probably fix that
even if we don't change the PL011 model to require it.
But if we let this kind of thing get past us in our own testsuite,
it suggests there's probably a lot of similar naive code out
there in the world -- these Arm boards with PL011s are pretty
commonly used for "my first bare metal assembly program" stuff
and there's a lot of cargo-culting of how to do things like
serial output, and programs that were never tested on any
real hardware...

thanks
-- PMM

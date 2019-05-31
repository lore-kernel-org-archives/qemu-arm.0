Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp858980pjq;
        Fri, 31 May 2019 09:21:54 -0700 (PDT)
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr2493943otj.105.1559319714740;
        Fri, 31 May 2019 09:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559319714; cv=none;
        d=google.com; s=arc-20160816;
        b=nADJwJNjGLoe3uALcgCTnVcIQLkBAw1hsEXdeTXb0lknKfqErFjW0rDznb9tBBLzTZ
         15SAIf3wjvAYzkurNvmF/td0/dQKMjBLgdrdesHzgV342JYruy87eg2t+5ojfFDYYYBi
         dXpin1K0QorBsWikppkiejFDPR2ouxPldpxAu3bRXZdO/4WVwwZk8Lx0dPszQogoNrAA
         mshEyREWA70SxjlHhudIfVInJRGGPZLS/9l854HIou/h1tv0BNDfB0Gb4eU/9C5SKU6u
         a7pB4qPR3c2oJSGTjZ8IRCmULh9m5MJ5uGg8cFxCM6fK6mrG4gGrEfIbO6AvZAXU5bUR
         khOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0emDJioIFk0tduFleQFkf5DeJDgDNS63MamuovSIrH0=;
        b=nV/rhtMWUDnrDipFW7HAAJJ4+y5Jorldf7aMpaXXCIdd8h40Jf9pmJ2+FgI6KI+Tzk
         rnEYVxB5yMGN5OcvvAOLvD8jvIViC7M0S8ehP7NSWfPsVrUlhODv2xw8qr8TRrUWwpSm
         c7R8CWJU8R2cbopZWaUkK438eZMIsS6c7FDjuqB0xDUNnUhZ01GBMUEZd3iB84MvYpgv
         3krf534oHrg4W8XSiKcrRtYkpRES1OCwCwqMFKNOC5ePOqkrmnSTYCEeXIYvA36OZEWL
         qEGY+3op6qVFDDJ0OLvMtnuVL8GpqNaVmiErwJB7QESChPJa1cFXbEWhkFnUhk3MbuOv
         CuNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RephA6JP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p5sor847296otf.84.2019.05.31.09.21.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 May 2019 09:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RephA6JP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0emDJioIFk0tduFleQFkf5DeJDgDNS63MamuovSIrH0=;
        b=RephA6JPpJ4HeyaJ3T8sxSyXKYCFiV0R7HnMng0oFWsI/8NswwZmMOXxVaLJp+yKby
         xZeY6VreqoR2/0DR8Y7pFvOH+wMCggiMaUKJuNEbv9sT04OIDvqr/iklZaJ68NCFoCOT
         zwTIZaDNgCy0QJU0dNvfy8llqpY6RhCGyy8iFTnu4CKOfx9jdaQm0xJzSDaYaD+tBWad
         HajhH2PEupEqNKm1NAUX5YiEf10QgnYc3Eknb6moXHmMHKCrlFVcspXh6u6sm4VsqKhP
         i8o8XOW8U9w6fynmxkMh8vdfZ5eEpC0MWXsmIQX93TghGe8oW/cYZ8wnG9oFun+0SgEV
         Pj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0emDJioIFk0tduFleQFkf5DeJDgDNS63MamuovSIrH0=;
        b=e0avOgHvJIyaHOSNBpMsTBtTJA2SLQfudYonFKOxtKMc3IaIqjo0d703w+8n5+NH3w
         jlGQqNVipN6YEVjA2nNYWdbFuAmRt5iceB0vxuPqEYobO8tb5w4+wPQoa8/p2XGuT/nI
         uGYgKMZmTEBfmBCdenhJ52M2Kzibhpf/09/jZR+x5I15PZMvy66kWdAiYJyOpMsHALyF
         ULpx8kbFHLPHhslOKkB76x5u4qMJ8RGsJYrJg6Bn0TZ9lTBoPHX0X1GhkWulTN6tybNA
         1QI1VRAi9cFJ+tI/anG3+5n28ot27Sh5bt01pzOgsVjTz41V16JOH13Nau7qJ42EqpaT
         krBQ==
X-Gm-Message-State: APjAAAWApbPQtCRud9/9xJlhqzODvFN0OvWR389nqzlWILGiHRYEfK6T
	zCrEEuRTsDxgdgoRYhKjjc/Lg0no64NLP2edtkAvkg4J
X-Google-Smtp-Source: APXvYqyYOX4iJd5wwfLagRDExDKN3HDfsh6RuCAl349mfvt2yWNU+5LF4ifE+Y2enzyYnWCH4Axaw8IEJ0icg6Dj0/g=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr2540782otp.91.1559319714329;
 Fri, 31 May 2019 09:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190531154735.20809-1-philmd@redhat.com>
In-Reply-To: <20190531154735.20809-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2019 17:21:43 +0100
Message-ID: <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Miroslav Rezanina <mrezanin@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fT8navJ/3IfS

On Fri, 31 May 2019 at 16:47, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Amusingly Miroslav and myself hit this issue at the same time.
>
> Currently there is no way to pass a CONFIG_X to sources in target/,
> except via a Makefile rule (and filling with stubs).
>
> Paolo says this is on purpose, CONFIG_X selectors are meant for
> devices and we try to avoid having config-devices.mak in
> config-target.h.

...but some things in target/ are devices (like the Arm CPUs,
which inherit from TYPE_DEVICE).

Is there a way we can have a Kconfig fragment that expresses
"if you asked for an Arm CPU then this should 'select SEMIHOSTING'" ?

thanks
-- PMM

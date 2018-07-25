Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp651035wru;
        Wed, 25 Jul 2018 05:37:14 -0700 (PDT)
X-Received: by 2002:aca:d04b:: with SMTP id h72-v6mr3018303oig.17.1532522234756;
        Wed, 25 Jul 2018 05:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532522234; cv=none;
        d=google.com; s=arc-20160816;
        b=FpZcH83x2HPUNCOX9Evrgu5uZvh3IqBi0hRzphDQRWLOAf76iPgqrwCeW0UCROp1BB
         S8tFw++sPZQiWGR0kU3QhJ4rWbiGlHF7BGUwA9IaZrO7uBSF9/AXi0Z9hePIRv+hPb4r
         U112vvm+Ybas62S4aYCAh4FCsAhmyUUMoq04v71mjP57WZbm32N53NNN8JCAHtMW/ap1
         jXyohn/voYd9WvvaGKZ0ojzZoM+C/AnA/SwRSBkFMCyDs7rJjIt7cZ0kj3mNCk7SWwcZ
         P/bbzxbb4xyshuc8dZPB0okBMBf6NguVNJoC8rPJwD8tNpa85HJbGAxZx9rkdsbFlZO8
         XvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=l+68Bd07geJKKvf05HoAN+4YFUqn9eY3csThe351Lmg=;
        b=BzmHBTk+AqBIca5bRPZPdMh7LeZsLgkOcuMlJXWVHw8JVlmETilR9Fu6NSYL4rj7nl
         VY5hH7ht+j1zYVrI6qX2wIyOPvjHGB8XGkr+cmVi1yDOWlGa5mLA66L0A3mxquBf8w+8
         FJ+lcseNZmLkkKFJjF1cFU+bqrak8CdDqdQQrG9yjb643DLPnCsrB7E9fUt8eKZu5hdK
         F8yQkHBmYxPWRqCsqOw1QbR2emVLEPWcBkRRwDbmmMQzobJRRJkBK95t7uW+C/53MaN+
         0r8g501iZtfIR4DdeYFaa8sYkHlUw2RekyPlQxUWYeMiPiYHMeUij6hiE960uaQZ6Rj8
         6MKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqMO6Dq9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e74-v6sor3538558oic.158.2018.07.25.05.37.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 05:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqMO6Dq9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=l+68Bd07geJKKvf05HoAN+4YFUqn9eY3csThe351Lmg=;
        b=VqMO6Dq9Ts8uNIHB8EEwQtgvBG7WFipp08gbIx7t1vdgEUyxYaE22PHituL2EwLBOS
         xlhn/y0Sl7O8YZc3OA9YWBV6Elrm9zHRWL/l9MlAGLU0SYhiuldwdkgZ5cyM1TnjWFEq
         tSH2EPiHemidlErZxGvydOs0cmDAVxvgJ3c9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=l+68Bd07geJKKvf05HoAN+4YFUqn9eY3csThe351Lmg=;
        b=oTdN5NbG9VXsU7eKlfRgcoZ9/dmCXcuhX7gAySbnRsJ00IGSxXtBMMJNpw2r8F/P21
         pI2ca3l6+A2Ft9Os0K2qCH9fUEMlydrv2WcWv9ar4nG2OcIhuBURAmtQWkJam72svDxl
         ZyJ/FvVfUZbWphU1oauXXa2wxaMlK1xi6ix+q1nR/1hUOXDM21bDQUMPprBBjg6ZNQVv
         +SPZV8ME1+4Xg+biwNykMWmWfGjJJoMmHz5PJnKSpdl6aY1Q98lYoFHsNBCaak5hatfV
         ZF3qXUo3jZj4PVGmhxQEFGvunkJGmpkbY3HKJZEyr04Lt7emtOUlU5ye6//NH2S6RjYP
         dV2g==
X-Gm-Message-State: AOUpUlFGega0EvjDPxI7dzTKDK956u6MxdN3333Sed4xCvlqx1tiA+gx
	sewobqcjwrJ5DfQoEyY3bOYFck0uWUgyGt6obvaWCabK
X-Google-Smtp-Source: AAOMgpd+WeQHbipIXHMVMFI8jXfEeobUa0PtrkmwWsEemFXpSPp1hohEiYPsLz2We3Fuxt1V8XsESQkyV4Tk2d6GYWQ=
X-Received: by 2002:aca:4a49:: with SMTP id x70-v6mr2883735oia.11.1532522234438;
 Wed, 25 Jul 2018 05:37:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 05:36:54
 -0700 (PDT)
In-Reply-To: <CAKv+Gu9n5Y9tghjR7VJcnH96-rzDWvhY4UCkPtFP9hNUh=LK=Q@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <CAKv+Gu9n5Y9tghjR7VJcnH96-rzDWvhY4UCkPtFP9hNUh=LK=Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Jul 2018 13:36:54 +0100
Message-ID: <CAFEAcA8xvU6Xxzig=9rYRqT7w0cCw_D32Rw3Rk7jxp8FF8TQHg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 0P9rg35kM1kE

On 25 July 2018 at 13:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> To prevent spending a disproportionate amount of time on inventing
> ways to parameterize these 'models', which includes interfaces not
> only between UEFI and QEMU but also between ARM-TF and QEMU (and
> potentially between UEFI and ARM-TF as well), could we please consider
> fixed configurations for the non-discoverable bits?

Yes, I had assumed that would be the way this would work. After
all for the hardware setup we're trying to be a "best practices/
reference" demonstration for, the firmware would consider all
the non-discoverable hardware to be basically fixed, right?

(Maybe we could have some sort of "board revision" register so the
firmware could figure out if it was looking at the equivalent
of board rev A/B/C and whether some of the fixed devices exist,
but I think we should only do that if it's the kind of thing
that we're expecting/recommending real h/w manufacturers do.)

thanks
-- PMM

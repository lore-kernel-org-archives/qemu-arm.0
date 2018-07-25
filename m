Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp634314wru;
        Wed, 25 Jul 2018 05:19:30 -0700 (PDT)
X-Received: by 2002:aca:4d56:: with SMTP id a83-v6mr2899517oib.205.1532521170384;
        Wed, 25 Jul 2018 05:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532521170; cv=none;
        d=google.com; s=arc-20160816;
        b=lBxS2XhCy+wbEOToNIjnn+ke8P/9vCOj5HooqOG/rAdQz2yWvc28wkdUTioq/swHhA
         8YJPHu21nx1hRyc3nT8yRWeZd2sc/xQf4+QlEWgHyNd/s05D+y4j1/DlhjaQScTfovhK
         cIvmt/koNW+wXUF5K+p7pOQ0XV92jOfEXUO36PDG6R6pGJUdvp114RaSmnq7GI83iSuI
         3EqIeHv22nnhm+fvxnvKvww3wxj4WFtqt2Qw1UKz0A1nt1sDwEEzw/NZTooqeC2gIEms
         7nj4QXVJqynMFrBrXONQpIr91RXqvLZMqHOJ3GTdsUIjNpPKEyl+02rsJlHh4NiOEqUJ
         b1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=dC+yxewFI/apWPQE32Nq6PvVA0chDku/rl6Xeehpm9k=;
        b=jlqT0qnimwd3hDux0MlbTGg73fy+JUrvQX77YEXhQ11uJKcwVZGuTuCo3eSIOJqDOY
         XZS66jDbE5A60Pjkt8GTtd2hy4zfd6pGxh/X+UGbN7dmhB+gac3gc9RTeQ93go5STB59
         8erX6xVdXBMayoKSy/kN0FMm/c6oJEvrJ8oEiEJUD4jsyENXu+8Mm85fhdM4+5/r61tm
         hi5LBt4zJhYA+lNiRYuQD8r46FefsoPKtdQAq5kcZfG0Nlvv/kPYo3f+Aw+7LlbnZsUk
         OdG4R9yZQGLBKbnEhQ9Ds/FSztbIXZIhQd4PsSvANSPupJfn0VMaBkGkLnOVvnJlTNPI
         JgTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bfGQkQp1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v145-v6sor8418625oia.118.2018.07.25.05.19.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 05:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bfGQkQp1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=dC+yxewFI/apWPQE32Nq6PvVA0chDku/rl6Xeehpm9k=;
        b=bfGQkQp17nxaDlURM/JrArc+dOEAgSUK68Ee+knoyhb1MbFA4tWtsyWkdM3dNGrDVw
         rVy37vSJHH7M4Th6KPeOc2S541/X1NBVyhGj8EnzL4SkUV3T0xdw1/3zVfVjPh152qxH
         bwCoNayxt8C3CtkUCXvkhf8XoNx+twnABO1/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=dC+yxewFI/apWPQE32Nq6PvVA0chDku/rl6Xeehpm9k=;
        b=a4aO/WpB8XBmOGcXBdxraosbkjQIqd9dGX0bb33y5nrgvuRSP1N/h3hPJaW08NeFmK
         OmO2DjvPu+A3fHIDQptLpzgJ8ObN6sdv6WybrMYslItfFF26EYkyJtxE0yPJShxrOK+h
         fvLgVxqsGdF4cmGgq8Qqvpnj6Jcq4MNJ2BKJ5zXkFK3EMkfGkvtiUM9k5QIx6EfZlzd2
         Et5N1EsJUzrkspxWE1seV4FwqGgMFPhGswiRlxMB6hKSBUsX8RmiaxQX5s6QRbeSKykO
         gZuYOyUZ6LQu0eLVqZ7jAyFL+/KG/vR5Z8nS8Mc8MGxezFX2N6n3lbotaA7YpC+Le8FN
         gLZg==
X-Gm-Message-State: AOUpUlF0q9pDBpCeCUwSlKuvt6pBbcCFLXGOaTTyx8LtAqWeafGE77MY
	aLAWeFSsaCUosSzmCsHPZtWwKZbtgx9f9Y/2fTtT1ZRv
X-Google-Smtp-Source: AAOMgpftSGu4Q9JHriB5oo9OEmpRU8Zs2gwmeoSdRq2MI77/nydBCuJKA/FLEGLu2xRHYERXSnDKmwC1yaMYue77roc=
X-Received: by 2002:aca:4a49:: with SMTP id x70-v6mr2826281oia.11.1532521169913;
 Wed, 25 Jul 2018 05:19:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 05:19:09
 -0700 (PDT)
In-Reply-To: <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Jul 2018 13:19:09 +0100
Message-ID: <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ADaZpnIRXAfE

On 25 July 2018 at 12:44, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 06:46:59PM +0800, Hongbo Zhang wrote:
>> For Armv7, there is one typical platform 'vexpress', but for Armv8, no
>
> Wasn't the vexpress model designed for a specific machine?

Yes.

> Namely for
> Arm's simulator?

No.

> Is the vexpress model really something typical among
> all the Armv7 platforms?

No.

"Vexpress" is a model specifically of a development board
produced by Arm (the versatile express). It's useful if you
want to run code that runs on that devboard, but (as with
most of the devboards we model), it's not necessarily ideal,
because it has all the limitations of the real hardware it's
modelling (in this case the big ones are limited memory, no PCI).
The hardware it models is also quite old now (maybe 7 or 8 years)
and it's not really "typical" of anything. (In the primarily
embedded space where most v7 CPUs are there's not really anything
that could be described as "typical" anyway: everything is
different.)

For most people who just want to run Linux on an emulated v7 CPU,
I would recommend the "virt" board, for the same reasons I
recommend it for v8 cores.

>> such typical one, the 'virt' is typically for running workloads, one
>> example is using it under OpenStack.
>> So a 'typical' one for Armv8 is needed for firmware and OS
>> development, similar like 'vexpress' for Armv7.
>
> What is a "typical" Armv8 machine? What will a typical Armv8 machine be in
> two years?
>
> Note, I'm not actually opposed to the current definition (because I don't
> really have one myself). I'm just opposed to hard coding one.

AIUI the aim here is to provide an emulated platform that is
set up in the way that server-style armv8 machines are
recommended to be set up, so it can be used as a testbed and
demonstration for the firmware/OS software stack. The hope
is that following "best practices" results in a "typical"
machine :-)  But the word "typical" is probably not really
very helpful here...

I would expect that in the future we'd want this machine type
to evolve with the recommendations for how to build server
platform hardware, which might indeed be different in two years,
since it would be the development platform for writing/testing
the firmware/OS stack for that two-years-time hardware.

thanks
-- PMM

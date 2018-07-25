Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp643265wru;
        Wed, 25 Jul 2018 05:29:11 -0700 (PDT)
X-Received: by 2002:a02:9962:: with SMTP id d31-v6mr19454237jak.1.1532521750904;
        Wed, 25 Jul 2018 05:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532521750; cv=none;
        d=google.com; s=arc-20160816;
        b=dGQmq6RpihFHdtB/86HWkibDXamIUBKGd5IC0eolDczUYkarHRREekJx9J630BcACo
         CiijABvdXqiCHf8FomI8jGmcce+DVhhx8FfZtAUaK8QXwAfVbS+QevNYzeIy8JsLI3YS
         fi7pnZL04M6CXP9jrSxtLa60ma1iQ1JAsrNA+h7eHv/NanN0AE1wHz6Kp/rVQIfo0SQc
         KYeW0wCTNvRrEPAOnWp9eETEeuMGCMI3R/szziO9gf7JctFTDf98cxdfQ0CTJ/TUg57j
         IoTV6WDi2ENCjeawIMf1Zr/vTIqK793wVGWk1iEXoS0kfjAQOh92O78RglK3hjRf5XD1
         NGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Fw4UXBxDUB6gq+AyzJO9yfB5bzCPcrQTxWv2CyzfUvA=;
        b=HUOa4dAUTbN3ulAPu4I4xVZk2odZgAobZQrUDs/bbRTkSEy3k2Ry+ABmU7+Q5FDs14
         01eMZsohGw2FHtIEahT6iKMtmqQwAw80yNYIZUinzlCw/y6fJ/oT9cU+/znhXdqHdyGI
         R855FpadcjOAkgbXmvaZ7GI1XLYAP73BdNd49p8lLX3XZNEx7p7luhAlm/THD2KFsY7g
         wS+5V4bM3d7FEAIFf3inUb6ZpL0Rx8tQtjl/Nyk/cP+ao+LpWet7YVdzhzGcJqFJ6VrT
         q1STC41BDg11l9eDi/K/ymiqePQIl3VGY/uCY6NtAgvRRBFwNZm//lUxxtYKLZuDDdgu
         Sn+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVuXtKlp;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q14-v6sor4511624ioh.155.2018.07.25.05.29.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 05:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVuXtKlp;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Fw4UXBxDUB6gq+AyzJO9yfB5bzCPcrQTxWv2CyzfUvA=;
        b=EVuXtKlpAIWxPnM6uiTd8bqQPr1FJ5cCUGSUln7m1+RkoH7Y/lJWf4vHV7KymolpGB
         LP7VqBsZR4xyMGjAZddR100JRKxAgfXoVh31zfKALLGyEu4Xv+hmirWE9t+85+3Rp44d
         F5uAESO/pDHnD0Tk5irlQ3ZldWXfCXtw2hi3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Fw4UXBxDUB6gq+AyzJO9yfB5bzCPcrQTxWv2CyzfUvA=;
        b=tM9WC+lQ4tnofgs1ns67AC4QTUZzryByr1dltyJtOUteI5yS5kvTblFirm0lYFnboe
         d04h8OHa8ncx0jH5uXgyfMHQBqXSSOcqrRYteObCptnv8SKhcP8u8yLyaE6Vz1n8cR9K
         51yd4vd8gynynZzCpe+eUtBVOtZY2j54LNPE/5DQ9iz2nKXV5qXogBaOM99v6qtfyGVa
         SSKNsysHp9HGJb2UBULeOeqiQkUul5nifbSgTZJLla1CpR/R6WpCcgPbIhd9OhLVhfyu
         xF2nNkuRJt1kdbFvJwrQCuwKoL6BOVpGUgZcFNXnUImoLJtyHFF66xGUvdlyF0iBwjfr
         jBXA==
X-Gm-Message-State: AOUpUlFc9oYiN4VbfiYHBvcFXy0GmtlF9xuTZrb/K58OGMq3G3uR0Kuq
	nlOd9uAN1f2oJAr2XHKgn5PLUnW6/J7WElO/3otE0zej
X-Google-Smtp-Source: AAOMgpeSHUiK5cmRrTMc4Vz54y+1JlwPNuhgpAriORbfjyfkFXgKCuowUjtSKkpP4xDaTVEx/Gr/sbXrvPB8TrRQdNw=
X-Received: by 2002:a6b:be83:: with SMTP id o125-v6mr16483640iof.173.1532521750401;
 Wed, 25 Jul 2018 05:29:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 05:29:09
 -0700 (PDT)
In-Reply-To: <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 25 Jul 2018 14:29:09 +0200
Message-ID: <CAKv+Gu9n5Y9tghjR7VJcnH96-rzDWvhY4UCkPtFP9hNUh=LK=Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Kidx9evDsu4H

On 25 July 2018 at 14:19, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 July 2018 at 12:44, Andrew Jones <drjones@redhat.com> wrote:
>> On Wed, Jul 25, 2018 at 06:46:59PM +0800, Hongbo Zhang wrote:
>>> For Armv7, there is one typical platform 'vexpress', but for Armv8, no
>>
>> Wasn't the vexpress model designed for a specific machine?
>
> Yes.
>
>> Namely for
>> Arm's simulator?
>
> No.
>
>> Is the vexpress model really something typical among
>> all the Armv7 platforms?
>
> No.
>
> "Vexpress" is a model specifically of a development board
> produced by Arm (the versatile express). It's useful if you
> want to run code that runs on that devboard, but (as with
> most of the devboards we model), it's not necessarily ideal,
> because it has all the limitations of the real hardware it's
> modelling (in this case the big ones are limited memory, no PCI).
> The hardware it models is also quite old now (maybe 7 or 8 years)
> and it's not really "typical" of anything. (In the primarily
> embedded space where most v7 CPUs are there's not really anything
> that could be described as "typical" anyway: everything is
> different.)
>
> For most people who just want to run Linux on an emulated v7 CPU,
> I would recommend the "virt" board, for the same reasons I
> recommend it for v8 cores.
>
>>> such typical one, the 'virt' is typically for running workloads, one
>>> example is using it under OpenStack.
>>> So a 'typical' one for Armv8 is needed for firmware and OS
>>> development, similar like 'vexpress' for Armv7.
>>
>> What is a "typical" Armv8 machine? What will a typical Armv8 machine be in
>> two years?
>>
>> Note, I'm not actually opposed to the current definition (because I don't
>> really have one myself). I'm just opposed to hard coding one.
>
> AIUI the aim here is to provide an emulated platform that is
> set up in the way that server-style armv8 machines are
> recommended to be set up, so it can be used as a testbed and
> demonstration for the firmware/OS software stack. The hope
> is that following "best practices" results in a "typical"
> machine :-)  But the word "typical" is probably not really
> very helpful here...
>
> I would expect that in the future we'd want this machine type
> to evolve with the recommendations for how to build server
> platform hardware, which might indeed be different in two years,
> since it would be the development platform for writing/testing
> the firmware/OS stack for that two-years-time hardware.
>

To prevent spending a disproportionate amount of time on inventing
ways to parameterize these 'models', which includes interfaces not
only between UEFI and QEMU but also between ARM-TF and QEMU (and
potentially between UEFI and ARM-TF as well), could we please consider
fixed configurations for the non-discoverable bits? If there is a new
and improved sbsa model in the future, we could call it sbsa-2.0, no?

On the firmware side, I would like to implement this using build time
configuration options only, with the exception of memory size and
other things that are expected to be runtime discoverable on the real
world counterparts of our model.

I should also note that Hongbo's remark about running such firmware on
real hardware as well is slightly off the mark: we want to *model*
real hardware rather than a guest machine abstraction, but we have no
intention to share firmware builds between the sbsa model and physical
hardware.

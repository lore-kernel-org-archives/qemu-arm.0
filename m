Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1980783wrp;
        Thu, 12 Sep 2019 03:49:27 -0700 (PDT)
X-Received: by 2002:a05:6808:89:: with SMTP id s9mr7733476oic.130.1568285367097;
        Thu, 12 Sep 2019 03:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568285367; cv=none;
        d=google.com; s=arc-20160816;
        b=QoYaldfU6HrIXhkoBlaF8QX+EgsIfW0pNpi6eQrBTQZXGaHY2sHaIWKcyUQ6WYl0EI
         UYdfkWYwUbo8XlcJ0tT1dDoqos+m8b40Muud6A6g6BcL6kV9JxLpqjqKPJIMOv41fbsm
         8uMf3kr3vLELronB+Kr/xMI5F6mZo5XxJVMqfJgVx06j7g+rjo+yxEP994/Qe5BijEiv
         /JhKUDlHmCDJoNGBapjFQD5w/JL9q2+89cFzfmO8YVyxsEt0+CVRMHdI8g2IMhyzvF/v
         BE2Pw0aeDhjIIdfpD5SIiSeYKo4PzBKl2Ctia71BbA0jLIvbXi6yiiXw5FjT99WlT5+S
         Jqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q5VTwor9a7Dn86swCsiRvDfmvYRINwG/MuN+Q6rb6c0=;
        b=EIM6Vi+3udq5ArfDggtZF1BIcGihhdAMk+XtN0kT9KciE9Mcdcz/OCGOOlNRGRhfXv
         +cLxefrQZnNP9qJVgIWtZizj8zm0yMwM2NEq0YICTgYaGa/zttCnqHgbWWhsM1gxAeLe
         t6wMPKRUvqdrFnkHzk1zA9T+bw2BW47MQz+yPDfUus1lE87WKEh8cj42t3Mw3eJs/vS9
         yjBkCToLsh91CFMVgvD7u0RscmkpRq/GZatDUyh6/qfFssk54BFXAYmpu1F4bdFQYj2g
         T3XRB6gdRHwrg9+PeOmTFu9DrOAKZthYfvWxYW9VmgXEq26H1UfixZQzbyhyN3cjZVI9
         4B6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZFVuNOhd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w1sor8063156oih.139.2019.09.12.03.49.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2019 03:49:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZFVuNOhd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q5VTwor9a7Dn86swCsiRvDfmvYRINwG/MuN+Q6rb6c0=;
        b=ZFVuNOhdWOMGw4vLRYoYmn6zZW5WNqbVlhCU7CpekwVTc9opa75uXKNsgrtUHSMlF0
         g4LOScCdvxw1aLY+n8mTdea1HQDxJtju92JAxv+U4/uW6yvEvUDstRlaWS+JCmHrGFZA
         j4AXRUBB405apnV406Hi/Cdtal7JJ5DcHc8rgGVwlAeBZko8e3OQX2bb6Nbffa+TMbMl
         RhzrECkr8/NpJGmh+kKvzJfL2zyRKExJDYInuf6IP0Ud/t8whi4mhA2Akje2DCgGfuqH
         jF6EPhFjAOSr3le44xjLaYDHlClER5QHylD8980Acpnyr6ep10TwHfILvLTBggVmBJAj
         1T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q5VTwor9a7Dn86swCsiRvDfmvYRINwG/MuN+Q6rb6c0=;
        b=YQb7goox5R599g7GNmN0GyCo6Nrco4HzMWuCD1kF5NpfR+mMOjfn7sFbGSRZ7aW8kO
         ATnJdYae4GTEJvmPqZdxDE9a4BHwWkJDXANI0iM1POzRLEZhnwQZ9LJa/iV3btaMQZvC
         1veFvnHPjBuSAXNuioQlWzFNyq34T+jUP9Nqgh1ZqFhpYltwTDIyYVHeZAaEPmalZZL2
         4v3lYZs7khQjueBLFwFeXdI6DOWNtdGr67dH21du9BLyIT5dj3IdqzhPAjdCgSZZ6MuE
         bHnA1M8CB4N2ekYSbYnWUm3Ktc6SVX3ICREZkJ6FYSv/iJAroJPo6aolmHB0xvYrZ1kl
         Yg0w==
X-Gm-Message-State: APjAAAVLiE47YddsqUxIpDdnDt/drtCiYWv/YWChIxj+qsWkbrIP65eO
	2bEf0jkfFsh3s+XfaeI7kBVuNRWi/qZGBLnWh+iePLFlAZ32aw==
X-Google-Smtp-Source: APXvYqybicLU/HyCGtPQ+nT6kvw/451OvMd03DBcgSH5JLghhjpvI5LIPGkn/S7A7SktuGPoKPWGE+pyzrEF/rXO5xc=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr8067340oif.98.1568285366213;
 Thu, 12 Sep 2019 03:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-2-peter.maydell@linaro.org> <87sgp1ztll.fsf@linaro.org>
In-Reply-To: <87sgp1ztll.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 11:49:15 +0100
Message-ID: <CAFEAcA_J6i_ui4ZOUxDy5U-O1zCt+1wCDwU6O3T+c7ZzF10drA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 01/13] target/arm/arm-semi: Capture errno in
 softmmu version of set_swi_errno()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nd6oLZtLN4a7

On Thu, 12 Sep 2019 at 11:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The set_swi_errno() function is called to capture the errno
> > from a host system call, so that we can return -1 from the
> > semihosting function and later allow the guest to get a more
> > specific error code with the SYS_ERRNO function. It comes in
> > two versions, one for user-only and one for softmmu. We forgot
> > to capture the errno in the softmmu version; fix the error.
> >
> > (Semihosting calls directed to gdb are unaffected because
> > they go through a different code path that captures the
> > error return from the gdbstub call in arm_semi_cb() or
> > arm_semi_flen_cb().)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > NB that a later commit will put in some cleanup of TaskState
> > that will let us reduce the duplication between the two
> > implementations of this function.
> > ---
> >  target/arm/arm-semi.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> > index 90423a35deb..03e60105c05 100644
> > --- a/target/arm/arm-semi.c
> > +++ b/target/arm/arm-semi.c
> > @@ -114,8 +114,13 @@ static inline uint32_t set_swi_errno(TaskState *ts=
, uint32_t code)
> >      return code;
> >  }
> >  #else
> > +static target_ulong syscall_err;
> > +
>
> I appreciate that this is just moving things around but this will be
> broken for -smp > 1 if two vCPUs make a syscall at the same time. For
> linux-user this information is kept in ts->swi_errno which is
> per-thread. Either we need a __thread version or find somewhere in
> CPUARMState to store it.

The semihosting API has no concept of errno being per-CPU at all.
(It really predates SMP entirely, so nobody was thinking about
that, and in any case it's a debug API, not a serious-work one).
The assumption is that the guest is handling this somehow.

The errno interface is not very useful anyway since it doesn't
actually define any errno values, and it's even worse in our
implementation because we use the host errno values rather
than defining some clean target-specific set of values...

thanks
-- PMM

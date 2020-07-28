Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp638168lfy;
        Tue, 28 Jul 2020 07:16:56 -0700 (PDT)
X-Received: by 2002:a9d:4e6:: with SMTP id 93mr15090691otm.308.1595945816673;
        Tue, 28 Jul 2020 07:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595945816; cv=none;
        d=google.com; s=arc-20160816;
        b=BzxotRDx1LLcOMFKmAyyGHECdgbCC5I2eihtVNmizDCzRDQMessGKkOkRxeZhKF/MJ
         EsTf44yHZdGmrzBmh5/sh+M31W0Fw52l84k/8swVxRzQq+uZfrinh9Yt93rp5GtjKCwx
         9WL5Uz3aN0BvAAUePB7fYBseBnIPZUAEvO4ughq+RvuVIz7P75PaDYQSQY5upSTJQSt1
         9IjWzRdw4iScKvRaJCRMVLEuWIOsl7jC8cpOE9bODoIfpd7SWXXp98g3pzh3OJLY0UOU
         pTJf3yL+7UEYC5qO6LqQc3d62bNgSFeXA6MIySluvn4ZUnlda7WMDWNzUToB30C0ztkF
         qNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rdnN0X/ThvV/+IE7SkFHAJZ+z5tKV4xGikHJFATXOCs=;
        b=Ix73Sd3xKxgiXsPmOZbMbjndlbzFCvmvADzZZRCGHZ/ZszPM9r0PDWFU4T0jP/MlrB
         xfACDK4QtsCKZbF7+r6GMdftqZZMfkEAH1II+vwdoywq1lGaFkg2Qq+Rr+1MVgk5e3Eu
         l9LrztL6LhIU7QrLH8+ncbzZSnX4LbWQafo53uY0fOfuqDl1rV65cxekEDk/6dNZo7n5
         Twf1saYZldI/SY7vk4r5P3uWklrUoUOpjWHMnVw2U+jLZx2s5rKIILL490ioifpynYLm
         D4obH8lMjJFFUwaipr5p4gaaJOXqWT27yXcBt9Koil9cLHVBCX9EOmsSY1KhfauJhfz0
         Rosw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpcwFmQz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s189sor1215930oih.81.2020.07.28.07.16.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Jul 2020 07:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpcwFmQz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rdnN0X/ThvV/+IE7SkFHAJZ+z5tKV4xGikHJFATXOCs=;
        b=cpcwFmQz7KxMstz7oLTWoG1iu8b0+rKoSHzeMYUbxl0TWa4xrq5zgPWmFdASDIA67M
         ctZktKcW4BVKrEk8OSqmjVVK6zrK2QONP4yLD3l0PYXYDkT7i7ER20XPirk4jgrMenrg
         umOXyn+zk9JqrwYaOJV/crB6dPbMNv2N1jm3yGQi7BBtp9HMPXxThEXvCoOIoL1j3x34
         o8SRcqR+Wp7qqWtkMCqNA1NkkN+TdLfTmB1a+36oFvjQTOltGQUIpZeOp3BsMo40BshL
         oYjduV/WlUcvB4kt8UemPZvHzjrPKFMvdTMLPSIOXxUtzM5qSiA/+bpsr3DEjcosjxV6
         GqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rdnN0X/ThvV/+IE7SkFHAJZ+z5tKV4xGikHJFATXOCs=;
        b=GIoycLOiIRgK1NnjgIe2Z7EsARs2QtCdWzbfgasT3ksMPMLSdSWQ+FRqbrKKIKxRnG
         quW9F9eqmaT9h7fyBTSRhgWecAT+0QhLlo2Z70n9xOIXuynlNaYrG2PVhn1yjh90sttd
         DHvyE5KFt+GIcL7IobZCkhAHZQCWlsIcE8wxcsPmmxyR8II4ZvqEMpNmftG1f2CPFEGR
         qvf4b0aR1ay+dUj9qKi+pBzSYLJB3vHmoKWXJnkbBK6bsB95Vu6T5+fU29DjVNrGWPW1
         mgeFULuC+sGTv1O0rea8AaE2Lw76UgeSt8U+DM4fjkK/nbjaP3kg0GN/l/AG1wH7LjDK
         OQ0g==
X-Gm-Message-State: AOAM533s5Di0VCIs/togzLk0aPYPjoW+1Jxz1dZsWMPyv3OxvO6sUMUT
	nzty+1ynK8LR12QBWMfU7vr1TjYubAnT3xFgjyQO714JpN8=
X-Google-Smtp-Source: ABdhPJx5vCUJ8gMSKJL23ElN8AZ9XZIpjANZSA5ybwdbo3vr3t1Z4kP3ilISomYYGTJCqn7A4YYdhNCHE8W08s8b+Lc=
X-Received: by 2002:aca:4a96:: with SMTP id x144mr3615537oia.163.1595945815872;
 Tue, 28 Jul 2020 07:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200728141005.28664-1-alex.bennee@linaro.org> <20200728141005.28664-3-alex.bennee@linaro.org>
In-Reply-To: <20200728141005.28664-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 15:16:44 +0100
Message-ID: <CAFEAcA_MT8U6uUYhNVDc1-AkxPPL22pBevNDSbB2ZwQQ94OPmw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target/arm: only set the nexttick timer if !ISTATUS
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Victor CLEMENT <victor.clement@openwide.fr>, 
	Paolo Bonzini <pbonzini@redhat.com>, Igor R <boost.lists@gmail.com>, 
	Pavel Dovgaluk <pavel.dovgaluk@ispras.ru>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Ov/OhpAnag7q

On Tue, 28 Jul 2020 at 15:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Otherwise we have an unfortunate interaction with -count sleep=3Doff
> which means we fast forward time when we don't need to. The easiest
> way to trigger it was to attach to the gdbstub and place a break point
> at the timers IRQ routine. Once the timer fired setting the next event
> at INT_MAX then qemu_start_warp_timer would skip to the end.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c69a2baf1d3..ec1b84cf0fd 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2683,7 +2683,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeri=
dx)
>          uint64_t count =3D gt_get_countervalue(&cpu->env);
>          /* Note that this must be unsigned 64 bit arithmetic: */
>          int istatus =3D count - offset >=3D gt->cval;
> -        uint64_t nexttick;
> +        uint64_t nexttick =3D 0;
>          int irqstate;
>
>          gt->ctl =3D deposit32(gt->ctl, 2, 1, istatus);
> @@ -2692,21 +2692,30 @@ static void gt_recalc_timer(ARMCPU *cpu, int time=
ridx)
>          qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
>
>          if (istatus) {
> -            /* Next transition is when count rolls back over to zero */
> -            nexttick =3D UINT64_MAX;
> +            /*
> +             * The IRQ status of the timer will persist until:
> +             *   - CVAL is changed or
> +             *   - ENABLE is changed
> +             *
> +             * There is no point re-arming the timer for some far
> +             * flung future - currently it just is.
> +             */
> +            timer_del(cpu->gt_timer[timeridx]);

Why do we delete the timer for this case of "next time we need to
know is massively in the future"...

>          } else {
>              /* Next transition is when we hit cval */
>              nexttick =3D gt->cval + offset;
> -        }
> -        /* Note that the desired next expiry time might be beyond the
> -         * signed-64-bit range of a QEMUTimer -- in this case we just
> -         * set the timer for as far in the future as possible. When the
> -         * timer expires we will reset the timer for any remaining perio=
d.
> -         */
> -        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
> -            timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
> -        } else {
> -            timer_mod(cpu->gt_timer[timeridx], nexttick);
> +
> +            /*
> +             * It is possible the next tick is beyond the
> +             * signed-64-bit range of a QEMUTimer but currently the
> +             * timer system doesn't support a run time of more the 292
> +             * odd years so we set it to INT_MAX in this case.
> +             */
> +            if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
> +                timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);

...but here we handle the similar case by "set a timeout for
INT64_MAX" ?

> +            } else {
> +                timer_mod(cpu->gt_timer[timeridx], nexttick);
> +            }
>          }
>          trace_arm_gt_recalc(timeridx, irqstate, nexttick);
>      } else {
> --

thanks
-- PMM

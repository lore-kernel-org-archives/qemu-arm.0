Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2909682lfo;
        Tue, 15 Mar 2022 07:20:21 -0700 (PDT)
X-Received: by 2002:a25:9e07:0:b0:633:4e64:6dac with SMTP id m7-20020a259e07000000b006334e646dacmr7301657ybq.234.1647354021245;
        Tue, 15 Mar 2022 07:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647354021; cv=none;
        d=google.com; s=arc-20160816;
        b=a0n+u/dNy2Eo9E0AigpwTo4JdcmGBv+thj+T9iU/P9hX32yim7rguo8QfM9HovBHrG
         9up/PiArqTTY1ux3UG3In5cN/aMCBDxFKIcdBHrYdDNxt1Ei/GbpUcfFnzwvpz+8HvfG
         xZ3YHTJMJyEk6ZCMtaE2EycvXaD4av3wkKWMgVv9NTQwz7m15p1P7h6Vj3UKrMLFpswO
         nH7FbftbOzKIOcERbK19zJBcIOWUyXJ3gDODGnJREkupR/gP1V5t+W8s7BofYb3JMfIu
         W6YoxdnV8ALojpuEicAKASAnEJBnn8/fy98MVx6WlKgPVMSoM4/7zH19miyOlJq/148t
         PCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVr8I6Yaf2Ll04R67Hiej1534JqHavBw2eqlkNxSfEY=;
        b=H49klDPnw3QMG0YMiOhOK6Fu4pBv5LA9mSGWlwwyIP7ToW5wFmfT9G4Yc6SlbicdUS
         HDo2Vt6TmEqj/vwQoY0pEpOqR204niGVVNQeZ90eAmDICtP5iBaG4969qxwmR9SybVnw
         T0lTm7JXg/pujNQs8C1+mGnVTwb6N+cwiRlNcdpzrDItIt99EFSWZDoFx8H+7PqLpLqM
         iu8Xcyz/6JjnMG2q469jqjkuvqjUael1yh4KPo/dJEex5XCVuJ0xjsOyWfk/o7Vckf4a
         tbSBQWOeixlohuf+GI9ng/sbMZZZNX4uEHCj/L5maAlMypdekOIFEFskuSH+No5jczSp
         2w3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daty5pFP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a5-20020a056902144500b0062d7b57e856sor6351669ybv.23.2022.03.15.07.20.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Mar 2022 07:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daty5pFP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YVr8I6Yaf2Ll04R67Hiej1534JqHavBw2eqlkNxSfEY=;
        b=daty5pFPeKVLwW66A8PTCvY4KwsCtztYM8vcFPHitTiJsJ9KFPZr+6OA0GCM5QiW+q
         Mrbm4D/u9WZvVaQBH9ImqjGPmnb8kWIqkdOo0wuTrY8sbjCDW95Tvhl3mPHg/xnhcyln
         kCknIsip8UZfH9RDt3ikCyx05ZLDGEcRVPdY19tyZ+2Ce+RLwHcQt90I47cckZE/d5rW
         0/yLVI7H9F4tDTpQp3XA/PG/OLGc+0Eb7xcLSYLyRujHcVmr0oCKqQ4AVmIquJnTLcNj
         bIFWOi3HOZSCy+Xu15OMrMtuW8uooQVKxnfHhiHTu/VUn9meXKpAvtaRIRReWuOBAG/o
         53hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YVr8I6Yaf2Ll04R67Hiej1534JqHavBw2eqlkNxSfEY=;
        b=cQ1Nd7CSmvfpWYljUVvAXRBalwcsYZZrgSVpEOvRyZMTXTt3nkX9j8teA97g7GHNTP
         Yrcz4Tg/SOa0QfIwViMAy23iscg4JvXYgTgV1huIfRh4BP1h4i+WJNGjS14ZvM8ycUfH
         RbTuoFLnlwMdf0pOGbUp2GUE6filr8sKm3xywLgvotBiBFPZbfnivH0BIo27R4heIC5x
         mnHdXUFzHY+tRlNZYwODTHRGWfNz3XMaP7iqElO1X/SGLmgwyHlj0m+RMKe1APiXW4O9
         Wb0YuDTf4Y3lGaZMXXYUIoRSgRZGqxt16w8fbPvG8nWM4hv+wdjFNoNmha5GPXhXKcC8
         sUgA==
X-Gm-Message-State: AOAM530R68yqbOtUw39DLtQe2c1b96pqJtEtE4m8yclw9ByFYDUaFt7E
	Eoz1Drj2+G+tj4D4CKMe7jrRHUB9dVvhUuyuQROi+OEB
X-Google-Smtp-Source: ABdhPJzvjXM2jvcOh5i44u6iVG5gYBklqIZZXOvZ+Y1YRlumZgR4PSK0EsoPh2/d73SVdDCoQ1L5AfoX2ozMRyqRDmA=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr22961499ybp.39.1647354020849; Tue, 15
 Mar 2022 07:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org> <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
 <87a6dr48n2.fsf@linaro.org> <YjCfjmxMnGZYGGv6@redhat.com>
In-Reply-To: <YjCfjmxMnGZYGGv6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 14:20:09 +0000
Message-ID: <CAFEAcA9RbUKCKXFwrXDLbsRFF7dzMG8v47XuNcNzzGqtdc2j3g@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, fam@euphon.net, 
	sw@weilnetz.de, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
	f4bug@amsat.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
	stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com, 
	aurelien@aurel32.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6ls/LVXkeVgN

On Tue, 15 Mar 2022 at 14:16, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Mar 15, 2022 at 01:59:59PM +0000, Alex Benn=C3=A9e wrote:
> >
> > Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:
> >
> > > On 15/3/22 13:12, Alex Benn=C3=A9e wrote:
> > >> Another cleanup patch tripped over the fact we weren't being careful
> > >> in our casting. Fix the casts, allow for a non-const and switch from
> > >> g_realloc to g_renew.
> > >> The whole semihosting argument handling could do with some tests
> > >> though.
> > >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > >> ---
> > >>   semihosting/config.c | 6 +++---
> > >>   1 file changed, 3 insertions(+), 3 deletions(-)
> > >> diff --git a/semihosting/config.c b/semihosting/config.c
> > >> index 137171b717..50d82108e6 100644
> > >> --- a/semihosting/config.c
> > >> +++ b/semihosting/config.c
> > >> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
> > >>       bool enabled;
> > >>       SemihostingTarget target;
> > >>       Chardev *chardev;
> > >> -    const char **argv;
> > >> +    char **argv;
> > >>       int argc;
> > >>       const char *cmdline; /* concatenated argv */
> > >>   } SemihostingConfig;
> > >> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
> > >>       if (strcmp(name, "arg") =3D=3D 0) {
> > >>           s->argc++;
> > >>           /* one extra element as g_strjoinv() expects NULL-terminat=
ed array */
> > >> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void =
*));
> > >> -        s->argv[s->argc - 1] =3D val;
> > >> +        s->argv =3D g_renew(char *, s->argv, s->argc + 1);
> > >> +        s->argv[s->argc - 1] =3D g_strdup(val);
> > >
> > > Why strdup()?
> >
> > The compiler was having issues with adding a const char * into the arra=
y
> > and it was the quickest way to stop it complaining. I'm not sure what
> > guarantees you can make about a const char * after you leave the scope
> > of the function.
>
> No guarantees at all. This method was implicitly relying on the caller
> never free'ing the const arg it passed in. That is indeed the case here,
> because the arg came from a QemuOpts list. It is bad practice to rely
> on such things though, so adding the strdup is sane IMHO.
>
> I would have split the strdup out from the realloc -> renew change
> though, since it is an independent cleanup.

If we ever move the glib minimum-version up to 2.68, we could use
the g_strv_builder_new()/g_strv_builder_add() APIs in glib which
do exactly this job of "build up a NULL-terminated array of strings,
one string at a time".

-- PMM

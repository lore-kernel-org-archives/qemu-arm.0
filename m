Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2739623ejt;
        Mon, 19 Jun 2023 03:51:48 -0700 (PDT)
X-Received: by 2002:a05:6402:1357:b0:51a:40d2:c7b8 with SMTP id y23-20020a056402135700b0051a40d2c7b8mr5266588edw.27.1687171907956;
        Mon, 19 Jun 2023 03:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687171907; cv=none;
        d=google.com; s=arc-20160816;
        b=lFm9NbCwasW8ukJ+aTdbWdFTYpw0R9a/vxQcHBBgsawx6ewmGeO6l3so8rbjAYCKKQ
         pb1My0+ZT5yi0wlvVxgajpmMmgz3PpcygzVkBHSqCexgqTfKAO/tFyIGE6brPgKD23Xf
         R6CpHdO0RQPstj+8epl1shbh8wcF7S99UUvGiasmaot9F0tuych0KSrdAKATvvViJY6p
         d5kbInKPU2tJo0zJGWB78upNwuPpDMPFHrXBto50abfxlhc9MUOdR1B9qgeRBFzfnR74
         eRqb4ABTddewPf6urX4NWuHnhyDSBR4SSNHCFmw5FgHL51v8RxxGcar+MF1FShbxTn0C
         Ehvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NzeOQqm6bMSH4mmgZgIqSWTWkGzqi873UyO1dzFYfJw=;
        b=JXIwE5yec0uherg7vHWq+ECEms65VmiZ4xT0hwNPfqY1o0Gd7S1uAYMdiJBHW0GCzG
         m5PPy6u3ZAxt69XZxurHuET4e0AsrM0nQeH1ABjkl3bjdx4SpbPiFYBAoAdNDkuOsURE
         BmWgC6NxXscC7sh6d5wWI7nBHlntO1GoNpTO6Ifv4VZNQPKtHwqGfLM2FS8GmDTFtuKp
         XEB18RHBfQNtXgrJSKCKa4d/57g5hGIMBzPi+pjyi/pB6RI7W65TqV02f0bJmf3HIpsU
         UJZpvWFk2/JL0XgNIAO9iuNSIN+5POTZgFKRF0uS8G0q8Zm/mT9mKeKQFv4WV7YzRZnD
         nSuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUIn5DYw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v7-20020a509547000000b00510b585c213sor5151776eda.7.2023.06.19.03.51.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Jun 2023 03:51:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUIn5DYw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687171907; x=1689763907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NzeOQqm6bMSH4mmgZgIqSWTWkGzqi873UyO1dzFYfJw=;
        b=zUIn5DYwTse08kTz8WdCdV2etI9/44Gsfauc2G7JwbRdslVziZgCV/TwQSFzT4ruuL
         07OOnys6bkOTkBkR4I7f9iqO4utIknCnKXVss/RNJSL7H0rZGYgOYJ4/e8KLlisCqOLt
         ABcx9CZtvVRuLx2WRzEqT8EYaNPmqHJxhXoAoamHJtyoaHZvqbZ4pn9H2tUBmJQ+VvBF
         et9snbINgP0mMlJnaZFnI+TO8qqJAXOaH4DPeUYdmdH1OKtZj4CJMdLjr/Z78VCQVGfs
         znVWHTRd6+e6aql2KE7cxBO1gFOfV+PgpgYt1gq6As4rxnYPwZ4ig0ywr2DSizIntJvg
         RdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687171907; x=1689763907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzeOQqm6bMSH4mmgZgIqSWTWkGzqi873UyO1dzFYfJw=;
        b=KqwEBYBk+cfpdOHiq6ksggx8yD2l8SVWDP7GFzOfyYqlQIE408SZlW/QC3n8Yj5p/e
         GZ48+qqVMI8MipaOt9sf8Hthy+6ny8RSU0nv/chChSTGpG34sQ4g6CVfK0+qeBrlZxvW
         ITHiZAy5B8XA9nKtPu8jSAxDVygsRpU/vwzGaoMrvFfxMnVJt9vAC/dE03+AL1cDvwWI
         Nqucdu3RL53FqU+LS6BxA4TwDwxtj3jyQJrR/VI8Khul8Ndq1RPd9slg+w1WtblJfR6P
         1CNyvLH2ZvgRpwu+hzybyxIEagbmwfqLNwCHVqet3VO2lBgXnEbR9cCwsbKdxD4/PV5C
         +t1A==
X-Gm-Message-State: AC+VfDyDiUvmE8198M7ZV/wH78gJoM8f1DGkX+0YicPu2Iz52QTnb6b9
	7yL/9hGvp6Hp4bl0o7mj+XYi/JmHqXhKF6icMr1KAZgE
X-Google-Smtp-Source: ACHHUZ6ML9XD4PlGOd+JB8ds9ln8X9H9YMOVLPdzSueI1xR02ukibsfSdas3hoRPQvCt0X/ZyMQvN2TCx+Fgy4xioEQ=
X-Received: by 2002:aa7:db8d:0:b0:514:9929:1b01 with SMTP id
 u13-20020aa7db8d000000b0051499291b01mr5854201edt.8.1687171907432; Mon, 19 Jun
 2023 03:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230609172324.982888-1-aaron@os.amperecomputing.com>
 <20230609172324.982888-2-aaron@os.amperecomputing.com> <a8db353d-b258-c856-d5ce-1236b0893a53@linaro.org>
 <ZIcbF8zShOr1N2Sl@strawberry.localdomain>
In-Reply-To: <ZIcbF8zShOr1N2Sl@strawberry.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 11:51:36 +0100
Message-ID: <CAFEAcA8pjgXXnUcLxcnm-9mcakps4KcXKOvHQxzj7n_CzY2zSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] target/arm: Add ID_AA64ISAR2_EL1
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: UIF/kWOkm3Ui

On Mon, 12 Jun 2023 at 14:18, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> On Jun 09 13:49, Richard Henderson wrote:
> > On 6/9/23 10:23, Aaron Lindsay wrote:
> > > --- a/target/arm/hvf/hvf.c
> > > +++ b/target/arm/hvf/hvf.c
> > > @@ -847,6 +847,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> > >           { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
> > >           { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
> > >           { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> > > +        { HV_SYS_REG_ID_AA64ISAR2_EL1, &host_isar.id_aa64isar2 },
> >
> > Sadly not defined for MacOSX13.1.sdk, and it's an enum so you can't #ifdef it either.
> >
> > You'll need a meson probe for it.
>
> I'm not very familiar with HVF or meson - I am not sure I understand
> what you're suggesting here (and a few attempts to grep around for an
> example didn't turn up anything that looked helpful). Are you suggesting
> some sort of build-time auto-detection, a "dumb" configuration switch
> that a user could use to manually enable this, or something else? And/or
> is there an example you could point me to of what you're thinking?

So the first thing here is: where is HV_SYS_REG_ID_AA64ISAR2_EL1
defined in the first place?
https://developer.apple.com/documentation/hypervisor/hv_sys_reg_t
does not list it.

If this is really the right name for the value, then:

We do our build-time detection of stuff that might or might
not be present using meson's facilities or that kind of
thing. These are all in meson.build. In this case I think
that what you want to use is has_header_symbol(), which
checks for presence of some symbol in a given header. There's
examples in meson.build, you want something like

config_host_data.set('HAVE_HV_SYS_REG_ID_AA64ISAR2_EL1',
                     cc.has_header_symbol('whatever.h',
'HV_SYS_REG_ID_AA64ISAR2_EL1'))

which tells meson "if this header has this symbol then define
this preprocessor value HAVE_...". Then you can #ifdef on that.
(We're inconsistent about whether we use CONFIG_FOO or HAVE_FOO
for this sort of test.)

Or alternatively, since this is macos specific and Apple are
quite careful about API versioning, it may be simpler to use
macos's own version macros to ifdef things so we only try to
use the enum value when building for a macos version that knows
about it. Grepping for 'MAC_OS_VERSION' brings up examples of
that approach.

thanks
-- PMM

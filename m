Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp151979njm;
        Tue, 29 Apr 2025 03:26:07 -0700 (PDT)
X-Received: by 2002:a05:6902:2e11:b0:e72:bd60:9992 with SMTP id 3f1490d57ef6-e73233b550dmr18842221276.25.1745922366854;
        Tue, 29 Apr 2025 03:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745922366; cv=none;
        d=google.com; s=arc-20240605;
        b=lSO6ozZZgP/EQuqcsL+5qNq+4F/ZvQ17rH51umu0rTVQcXmDzFaEBRzDD3qYF46J6w
         3l5HdfOcUTpmxq87u4uZc7iNa3/YAteGn26dH+PKOXE/I/bccreb2GTwWmsaLDkZ65zr
         Dl6SPJMbA/8jEfbZ/tQ7UGbbTBdVIHJtFHWlr+fmUermfKr2wFa57Jd8Z7LteZ/g/hE8
         LfgSvifu9kyE8VFZLxhNcp5L/FbA+6sjV9AmHztJHffEP8sxu9uhj/82Rosik6kFtXEZ
         tUrrS2wlhs5+BadIB5s3TSBbAs4Jq+41NqE49H5oDtkvyUTHAzRc3UA2Bx879KiPpssL
         v4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZFu3+tYtMxIGGm84GUWIPNJD6pNOJ4l8XUwZe3/snfg=;
        fh=4ESvwLleMVbJ/8rF+R+i8J5fuKh5j73fuRLWtNml3Bo=;
        b=geUCnIdb6LSeNLj+9+KVu0+yJFTrsb93IKO4VDtcrs4uOZ2YEHBO3RXfNH0S7Kj/4N
         rejD3JD+Ae/ht4xEXng6iTgpxJZKxEraUORZSz0wnUL1i6BDYMF/1eE1Fk5a5vMrsuLf
         etii1+Pq+TSqWRnhJTccxKRSyUZV16tIUdT2qe6IJd7/Eg5kxCIRn7oXER10YW86m6jj
         3EvYmnEzvSG9u6KalLWPTCgxLu/rlx1PqPKiyxYAaXU/VZBKUVDW5zIfyGnbIWh9oUi2
         lMdEgR0+/uCM0yQTo8m0hO98U0ingMm6evc0D7znalwqCCycHfhnjyAZaLLZ7nAeC134
         C/qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZxXWIXN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e7303e4b30asor5762308276.15.2025.04.29.03.26.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 03:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZxXWIXN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745922366; x=1746527166; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFu3+tYtMxIGGm84GUWIPNJD6pNOJ4l8XUwZe3/snfg=;
        b=YZxXWIXNr5cCnvxHWWpxEv+hiJ83+ucxhU1TCkTYDpU28TsS/7J7mw2zWiRzgWF22F
         mfqQnyYCv8ewGqc0k7IVQ4chiVnU1wOENaDRCsVwT3Gl/4ba9XteRF9CJAYren65cUMU
         VZTvJ9/g8eF25Ow9sSrw9YXNe1Cqgutw5aSyfKZVXqbVPQm/n+e10pUMLPKaS8fej0yM
         iUePtSAUVS6C1RtX8a40S7OP1NnKUhbnS5FiFs/flurHi7r+tdhlZDMf0+FboybHQ0tU
         Wcr77IENpf6yeE1XhCWoZdEO3eCtWJeCM2isIoxt5Ymz5Ha2SSYIPXVtRnywzesWlUcY
         gwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922366; x=1746527166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFu3+tYtMxIGGm84GUWIPNJD6pNOJ4l8XUwZe3/snfg=;
        b=Hr0WUO1a9cdMdOHIu/iIJMBJ7WWECwq/hBiGftscGcP5ulOeakpf2q+9oRA0dM1h2k
         ijHCgUYDBuMj6YWvbM9BiIi5pGTPpmkTr2Ol7/4DACtQlot+AsKQzcECVVOMakzixo4c
         G2+iZvqK2bGNG0L35khQOi9ryrJluy/qBepoSVVOonvgHHyzbkyqB616t+TaODiocan4
         XclEzEWjZfT5wk8UPgMaTnychS+qfG/q1yBtd01trgsLAtAcfXzZp8SgWvPOYwUaoV5j
         kZo2J18TQa1J83CO+Vbk9xC73Ge3g3CypudH7q/9Cn4TsYHarPrtMKAGzZdhqpLXkqpM
         Og7Q==
X-Gm-Message-State: AOJu0Yy7Axn7nmOLRz1OkV/j86BxrDKMgTQjvjCtvzap5qD1u4MK4VAu
	okUp1AeQQKmzaCZhaWY2xL4VkFQpMdaYMPpgXgg0xKlTLO85FP8QQv+er9cC4hwwNnX1tHCYyJ9
	NVUpfFrO4xJYR3CWOQYCe/SjTC6VgEVn7zK0iPXo6
X-Gm-Gg: ASbGncvcOSRxqBtfABrxK4ldA8908agXkKXUYxOIY5deIoEJwYeOFxqHthpHvVUJdC1
	mfieMCsLgv+71rWdHMYUmSpj1B+dE6xbsNP/xO8BkAbdiHuT5Vf8deuAMB/OGtRxk73dn+eHvBy
	IhGsB/5wI2nDPjraIAj/Qmudc=
X-Google-Smtp-Source: AGHT+IG2L16BxXQcB0XI194mSVjvEIOfp0VQJgFWCNuFDfwXsbqs8V6E8d56LDbXusirUj64wa6i/ogyRIpgrBwu7dM=
X-Received: by 2002:a05:6902:114a:b0:e73:3279:9fd0 with SMTP id
 3f1490d57ef6-e733279baa6mr11153123276.9.1745922366504; Tue, 29 Apr 2025
 03:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-7-peter.maydell@linaro.org> <ca432cc8-31a6-4b22-81e7-4c620a9f199f@linaro.org>
In-Reply-To: <ca432cc8-31a6-4b22-81e7-4c620a9f199f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Apr 2025 11:25:55 +0100
X-Gm-Features: ATxdqUEN5hyxAiqqXPxSLzhZ41T7DLEwqGwN1hsr0Z9Pfxv9qN5BxP_kQxyS2tQ
Message-ID: <CAFEAcA-MYHyvgOs7PMj-36d_BJEybNcWzrjCSmK7io+hNJ7n1w@mail.gmail.com>
Subject: Re: [PATCH for-10.1 6/9] target/arm: Present AArch64 gdbstub based on ARM_FEATURE_AARCH64
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kK0yiSu8t1Bl

On Fri, 25 Apr 2025 at 15:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> On 17/3/25 15:28, Peter Maydell wrote:
> > Currently we provide an AArch64 gdbstub for CPUs which are
> > TYPE_AARCH64_CPU, and an AArch32 gdbstub for those which are only
> > TYPE_ARM_CPU.  This mostly does the right thing, except in the
> > corner case of KVM with -cpu host,aarch64=3Doff.  That produces a CPU
> > which is TYPE_AARCH64_CPU but which has ARM_FEATURE_AARCH64 removed
> > and which to the guest is in AArch32 mode.
> >
> > Now we have moved all the handling of AArch64-vs-AArch32 gdbstub
> > behaviour into TYPE_ARM_CPU we can change the condition we use for
> > whether to select the AArch64 gdbstub to look at ARM_FEATURE_AARCH64.
> > This will mean that we now correctly provide an AArch32 gdbstub for
> > aarch64=3Doff CPUs.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/internals.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/arm/internals.h b/target/arm/internals.h
> > index a14c269fa5a..a18d87fa28b 100644
> > --- a/target/arm/internals.h
> > +++ b/target/arm/internals.h
> > @@ -1694,7 +1694,7 @@ void aarch64_add_sme_properties(Object *obj);
> >   /* Return true if the gdbstub is presenting an AArch64 CPU */
> >   static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)
> >   {
> > -    return object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU);
> > +    return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
>
> Unfortunately this doesn't work well: while a Aarch64 CPU is of type
> TYPE_AARCH64_CPU right after being instantiated (not yet QOM realized),
> the features are only finalized during arm_cpu_instance_init():

Thanks for finding this. The problem is that gdb_init_cpu() is
being called as part of the base-class instance init, so the
CPU object isn't fully instantiated yet -- it hasn't even run
the aarch64_max_initfn() function yet. So gdb_init_cpu() ends
up calling CPU-specific methods on a half-instantiated object,
which is why it crashes.

But we do need to move things so they happen after realize,
because up til realize the CPU properties might be changed
(otherwise we give the wrong answer for the aarch64=3Doff case).
Except that part of the CPU subclass realize involves calling
gdb_register_coprocessor(), which needs to happen after we've
set up the core regs for gdb.

I think that moving the call to cpu_exec_realizefn() would
work (this gets called near the start of realize, so before
the subclass realize decides to add more gdb registers).
But I'll have to check whether that would be wrong for
some other architecture, and maybe there's a neater way
to do this.

-- PMM

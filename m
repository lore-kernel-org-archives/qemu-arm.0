Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1461502njb;
        Thu, 9 Jan 2025 03:25:43 -0800 (PST)
X-Received: by 2002:ad4:5d61:0:b0:6d8:916b:1caa with SMTP id 6a1803df08f44-6df9b254201mr107459346d6.27.1736421943545;
        Thu, 09 Jan 2025 03:25:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736421943; cv=none;
        d=google.com; s=arc-20240605;
        b=P9eHBAuqzX0psCobvvJeqMaq08LZ+9eA5mM4bzNXKFh/7TM6yrMjQC+yj74v2RlwUh
         D//PL4mHv7NzRXCOQm+EL2HY74r9a3ZftdzDO4jARZN+oK3oy7QMtTdGaPgqyBDmXxJY
         fyGIgagMHYbcPk+Ifh8bxF9t29ZTtjX6Pkq9wqUcq0VpPaOYHnM9n/+2l1HKnrsD2s/O
         dFG8OLVTInWOsWiZihjH6orIf3hFsaIBVik3X0wi+YaXFu1Ort7ZaR18PJbmeIOl9y1p
         z2XhlMsOooAqXr3+YkCPg/lI5i3ov+ajbclkmuw1DEBUikM6j2dQ2zJpvHxsv+EuUSAM
         YqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XMeD5lDVpb1YJEsVtFO/csxTRuXtZpT83jX0pLiBs2Q=;
        fh=hp+Mhxj3KKmuvzp1vImsIp0jCrs07QPHEnPcXF2ZJQI=;
        b=BPtAaC8Pwwv0bmLNwADc8onmcrJQ/hsNzgnWrWklAbwqWwOwwwUdv7Zs4oYn8aodys
         0R0JFuK1TYaMa4M+mvOjt5SepkGuaapZqPNJIKDKUnnn6anICy7Kr/A4SYugjrmitx4g
         3Bx/xe+uZBsqIr8IkHeLLVK0THQ+QnQNUvs8pZNY1KEqf+Hsneuc1p0FAMP62Us6H2lu
         +9pt8IDqAy9tvvPZ5gYFIr38VmTxlf0cR3nEr+WpbP+hlPp8mi+V9I14YRkXZsYcqi1N
         5R2AdmHqD7ki94T/SIdRiob2wnKFQKNsnQLIIdB0Mw7d4oZxBumLE9QHLRv0Sv/a3wfy
         jxrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P6K66/QF";
       spf=pass (google.com: domain of wielandtdan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=wielandtdan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <wielandtdan@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-6dd180bb059sor367088706d6.2.2025.01.09.03.25.43
        (Google Transport Security);
        Thu, 09 Jan 2025 03:25:43 -0800 (PST)
Received-SPF: pass (google.com: domain of wielandtdan@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P6K66/QF";
       spf=pass (google.com: domain of wielandtdan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=wielandtdan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736421943; x=1737026743; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMeD5lDVpb1YJEsVtFO/csxTRuXtZpT83jX0pLiBs2Q=;
        b=P6K66/QFBY4Le0ftioLgCmdBW4YekqfU3v0HJFAc3uPoAdaOIgdaP+d6KXV74Qw2At
         WsjkJd/0XwTSgp1jeGZw2u75Al6EdCdPsI7nU1JF6vzkJlukC7zBGpL2gPisRetRZU1F
         dAuSrfrVx12isYpHCriOOPSiXnOeKVyrioV82iqy/MO+J4b3sGuyvhPRVhPCby5HFUZo
         Xmx7l3upbEcCVXTPPnlSiy0HmgSizyYjUTNmlMh6NL9XH2/fJPNzjAfcxikiI1RhxcTi
         w/iFhk4V9/AG6nC8wBHN79xKNJze0vWXARjrL2ZyriCquTX5cV4RJNx3yKWIIl6EuK/N
         GdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421943; x=1737026743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMeD5lDVpb1YJEsVtFO/csxTRuXtZpT83jX0pLiBs2Q=;
        b=WTvf7oU/eRYCL0ofRoBumD1JlWgB6xAUztlKvwiHl05Xi05lAXlTCnPoxnVLJeFIbu
         bm9I6Blg2AnF9AvOWSvFw7TbWcWTv99sDbLl5m3m5pGjBSkei4hiavyIqSeHyWKaxsb4
         BLJsjD7HtB5jEKpTMEvnGed8RXJfiXTZIVgxHDB6kvJxpcpqlA3mi6OzB4nL7Pv30zSG
         apqs7XqUhQlsxpWqJhrGFYC8Zu54zF7AxSL74b5iUt5KYJxwNKrE2218AkE+aeaeMAzG
         BG9NB6i2tuGJBVTgOuVM7C1GxJ1YdUvcoDoi0lvBV+zuYzjMiqERViO0Da+snL/ZMQPX
         KyzA==
X-Forwarded-Encrypted: i=1; AJvYcCV4BCffZ87TUym1fkOfvV371sNLyElmPLXIFYtEH9MMzz6eFaNMrQc1/5lq3Ce/agnEJkJHiKquCGUAGGXteKsJs50=@linaro.org, AJvYcCWi7KDT9EGPNEkfz+WvTH/KGrAhuUmrt5Ooy+43zVMXiGs0nCkEaRFiGOQzfYcdtiuCZSrdmoh1dVlIGFsKPw==@linaro.org
X-Gm-Message-State: AOJu0YzBQcrRVNnLzVYhEh3GLyU8dmTFCfJzaXMkILVECcpxV93RmxtG
	nx8LYbo4YUC9T7BIiJ1EJi0x6t0Fyg1QZQ8nqfgRyzquss6zdzhhLxScRG6GGAgSclEIIbZ+eEW
	vUNVx0oGxc1KudUBREITCJ6OdO3YylJAV
X-Gm-Gg: ASbGncuSe0EPPNS2BD6KgmEZ0N6+tmXmyQEuDVnlYEeyKKjCtjiDKw7ulJS15l5dFCJ
	JU8WmT8jOly456JRL1lNp8e8ueZSlr8984oiv
X-Google-Smtp-Source: AGHT+IFpNIl2Y2aL6XrsE6Ed3+ys8rwTyb3MS4IqTeq74L7MF1XnXP2M0Ady6B9UL5z690Zov1/sSED83JdRVlokbp4=
X-Received: by 2002:a05:6214:c25:b0:6df:99e9:39b3 with SMTP id
 6a1803df08f44-6df9b1eebccmr98397376d6.15.1736421942799; Thu, 09 Jan 2025
 03:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20241218181511.3575613-1-alex.bennee@linaro.org>
 <20241218181511.3575613-4-alex.bennee@linaro.org> <718a0ab6-cc07-4721-9560-7745ed1c04a6@linaro.org>
In-Reply-To: <718a0ab6-cc07-4721-9560-7745ed1c04a6@linaro.org>
From: Daniel Wielandt <wielandtdan@gmail.com>
Date: Thu, 9 Jan 2025 05:25:32 -0600
X-Gm-Features: AbW1kvaTPNBtSvRdchYiKenHB3PVhoj18TtmBI3OVwRdTGlOlh8uzqgyezsBjJE
Message-ID: <CA+7p6P+UAHEX_CFy6VNCGWYtCRBPd7mf1v6OMZ3=70d+kxsHgw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: implement SEL2 physical and virtual timers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, qemu-stable@nongnu.org, 
	Andrei Homescu <ahomescu@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@google.com>, 
	=?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000014b339062b443dcb"
X-TUID: i4MZdUAd6ah5

--00000000000014b339062b443dcb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's not the context that lacks its the protocol.. lol. I wish I was good
with words and a genius... oh no wait. It's easier being simple..you
think.u could find the s
B listers. There's gotta b a mpatch

On Thu, Jan 9, 2025, 5:19=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@li=
naro.org>
wrote:

> On 18/12/24 19:15, Alex Benn=C3=A9e wrote:
> > When FEAT_SEL2 was implemented the SEL2 timers where missed. This
> > shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The
> > actual implementation utilises the same logic as the rest of the
> > timers so all we need to do is:
> >
> >    - define the timers and their access functions
> >    - conditionally add the correct system registers
> >    - create a new accessfn as the rules are subtly different to the
> >      existing secure timer
> >
> > Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: qemu-stable@nongnu.org
> > Cc: Andrei Homescu <ahomescu@google.com>
> > Cc: Arve Hj=C3=B8nnev=C3=A5g <arve@google.com>
> > Cc: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > ---
> > v1
> >    - add better comments to GTIMER descriptions
> >    - also define new timers for sbsa-ref
> >    - don't conditionally gate qemu_timer creation on the feature
> >    - take cntvoff_el2 int account for SEC_VEL2 in
> gt_recalc/g_tval_[read|write]
> > v2
> >    - rename IRQ to ARCH_TIMER_S_EL2_VIRT_IRQ
> >    - split machine enablement into separate patches
> >    - return CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases
> > ---
> >   include/hw/arm/bsa.h |   2 +
> >   target/arm/cpu.h     |   2 +
> >   target/arm/gtimer.h  |   4 +-
> >   target/arm/cpu.c     |   4 ++
> >   target/arm/helper.c  | 158 ++++++++++++++++++++++++++++++++++++++++++=
+
> >   5 files changed, 169 insertions(+), 1 deletion(-)
>
>
> > diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h
> > index de016e6da3..f8f7425a5f 100644
> > --- a/target/arm/gtimer.h
> > +++ b/target/arm/gtimer.h
> > @@ -15,7 +15,9 @@ enum {
> >       GTIMER_HYP      =3D 2, /* EL2 physical timer */
> >       GTIMER_SEC      =3D 3, /* EL3 physical timer */
>
> Should we rename as GTIMER_SEC_PEL3 for consistency?
>
> >       GTIMER_HYPVIRT  =3D 4, /* EL2 virtual timer */
>
> Also GTIMER_HYP     -> GTIMER_PEL2,
>       GTIMER_HYPVIRT -> GTIMER_VEL2?
>
> > -#define NUM_GTIMERS   5
> > +    GTIMER_SEC_PEL2 =3D 5, /* Secure EL2 physical timer */
> > +    GTIMER_SEC_VEL2 =3D 6, /* Secure EL2 virtual timer */
> > +#define NUM_GTIMERS   7
> >   };
> >
> >   #endif|
>
>

--00000000000014b339062b443dcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">It&#39;s not the context that lacks its the protocol.. lol. =
I wish I was good with words and a genius... oh no wait. It&#39;s easier be=
ing simple..you think.u could find the s<br>
B listers. There&#39;s gotta b a mpatch</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 9, 2025, 5:19=E2=80=AFAM Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On 18/12/24 19:15, Alex Benn=
=C3=A9e wrote:<br>
&gt; When FEAT_SEL2 was implemented the SEL2 timers where missed. This<br>
&gt; shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The<br>
&gt; actual implementation utilises the same logic as the rest of the<br>
&gt; timers so all we need to do is:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - define the timers and their access functions<br>
&gt;=C2=A0 =C2=A0 - conditionally add the correct system registers<br>
&gt;=C2=A0 =C2=A0 - create a new accessfn as the rules are subtly different=
 to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 existing secure timer<br>
&gt; <br>
&gt; Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;=
<br>
&gt; Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank" rel=3D=
"noreferrer">qemu-stable@nongnu.org</a><br>
&gt; Cc: Andrei Homescu &lt;<a href=3D"mailto:ahomescu@google.com" target=
=3D"_blank" rel=3D"noreferrer">ahomescu@google.com</a>&gt;<br>
&gt; Cc: Arve Hj=C3=B8nnev=C3=A5g &lt;<a href=3D"mailto:arve@google.com" ta=
rget=3D"_blank" rel=3D"noreferrer">arve@google.com</a>&gt;<br>
&gt; Cc: R=C3=A9mi Denis-Courmont &lt;<a href=3D"mailto:remi.denis.courmont=
@huawei.com" target=3D"_blank" rel=3D"noreferrer">remi.denis.courmont@huawe=
i.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; v1<br>
&gt;=C2=A0 =C2=A0 - add better comments to GTIMER descriptions<br>
&gt;=C2=A0 =C2=A0 - also define new timers for sbsa-ref<br>
&gt;=C2=A0 =C2=A0 - don&#39;t conditionally gate qemu_timer creation on the=
 feature<br>
&gt;=C2=A0 =C2=A0 - take cntvoff_el2 int account for SEC_VEL2 in gt_recalc/=
g_tval_[read|write]<br>
&gt; v2<br>
&gt;=C2=A0 =C2=A0 - rename IRQ to ARCH_TIMER_S_EL2_VIRT_IRQ<br>
&gt;=C2=A0 =C2=A0 - split machine enablement into separate patches<br>
&gt;=C2=A0 =C2=A0 - return CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/hw/arm/bsa.h |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0target/arm/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0target/arm/gtimer.h=C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 =C2=A0target/arm/cpu.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 ++<br>
&gt;=C2=A0 =C2=A0target/arm/helper.c=C2=A0 | 158 ++++++++++++++++++++++++++=
+++++++++++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 169 insertions(+), 1 deletion(-)<br>
<br>
<br>
&gt; diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h<br>
&gt; index de016e6da3..f8f7425a5f 100644<br>
&gt; --- a/target/arm/gtimer.h<br>
&gt; +++ b/target/arm/gtimer.h<br>
&gt; @@ -15,7 +15,9 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GTIMER_HYP=C2=A0 =C2=A0 =C2=A0 =3D 2, /* EL2=
 physical timer */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GTIMER_SEC=C2=A0 =C2=A0 =C2=A0 =3D 3, /* EL3=
 physical timer */<br>
<br>
Should we rename as GTIMER_SEC_PEL3 for consistency?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GTIMER_HYPVIRT=C2=A0 =3D 4, /* EL2 virtual t=
imer */<br>
<br>
Also GTIMER_HYP=C2=A0 =C2=A0 =C2=A0-&gt; GTIMER_PEL2,<br>
=C2=A0 =C2=A0 =C2=A0 GTIMER_HYPVIRT -&gt; GTIMER_VEL2?<br>
<br>
&gt; -#define NUM_GTIMERS=C2=A0 =C2=A05<br>
&gt; +=C2=A0 =C2=A0 GTIMER_SEC_PEL2 =3D 5, /* Secure EL2 physical timer */<=
br>
&gt; +=C2=A0 =C2=A0 GTIMER_SEC_VEL2 =3D 6, /* Secure EL2 virtual timer */<b=
r>
&gt; +#define NUM_GTIMERS=C2=A0 =C2=A07<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif|<br>
<br>
</blockquote></div>

--00000000000014b339062b443dcb--

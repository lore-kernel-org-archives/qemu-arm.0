Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1122135lfc;
        Tue, 10 Mar 2020 12:30:12 -0700 (PDT)
X-Received: by 2002:a92:3a1d:: with SMTP id h29mr4145617ila.112.1583868611926;
        Tue, 10 Mar 2020 12:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583868611; cv=none;
        d=google.com; s=arc-20160816;
        b=guRBBUoMtfq6wIZSRtm5oIutrGrwEj5efDwdnheNHwnn6cdVlXSLE4ueY6IPyt5uq6
         3w4WjrImWmu5I1yMx8gRL95SgKIAbJ5wpi16zpLH+nL3BIATzdP/7RaFPeC887tRrgeg
         vUWE+LekcHsnhtRQJ0l6G8SSxfPFBhLsUZ70zHW4IMTIWfIBKSwsoSsP7wmRjJcnLTlf
         hpGl7Po/nACQmzOzW7mMcFXjTQBJRlUP7m+yum0S8PQWkSJGulZFAYPV7heczxsudpTi
         0TX0eWo+Lg7AR8Geb15rwTfRYiP9onr7oPZTGs82X8jFYgDQg+uq6npxuvcKW/VBHROB
         SMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ec4zzvCEIRAZ5xfSFujdt3O/MmVFFCSSaTkJNA0Gesk=;
        b=0T2iV6XC4Fo08Ff0zxiesNl6jis8eZE8Ssa7kQLIY/FvFNjsxNrKeo4zi7ZCU9jTwW
         77tNC0Mx5oeISBC2XISOF7eFeYaFRU31DSwbBfacPu1Bi0NtOQzCR4N4ifaoSdN9KuJb
         Aynm9ifn6IpFqEgRf7yLwyY6EQOQcyCpDJ4jGf9IXT1c8l7UQUXoAcwGKW/DcZWR/oEn
         grS39eaJMOrBUDdiu9rj+Ge6tUvHBDU0CK1G9+6P2bsHuhlmxcugcOUYDF3I7nxmrGxb
         4V9JNAtQ5k75zl/18dn/USU76QoaEGzGr+mvVaxda9+apUqyp0jxQl17RceoswHxO01m
         a22Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JSVooyEe;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q18sor10682729ilg.75.2020.03.10.12.30.11
        (Google Transport Security);
        Tue, 10 Mar 2020 12:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JSVooyEe;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ec4zzvCEIRAZ5xfSFujdt3O/MmVFFCSSaTkJNA0Gesk=;
        b=JSVooyEe2SRDrMNSu6eJ2ilSaVUqiDJJHEPU88wdpKdlsC8RBu3Ku/TKIDJRCH69AY
         rL1HfDg4T+0ffEuw6s27icwmR+46ArMPYyM5zM44aacjqwCf+QZNeSHzgqviWtNN8/rU
         Q7urx5INqAt0aIR6r3GKVaViXS916KjyfQRN413Z+IruFnDjieUZAqEziOwBG1g9neQZ
         0Rb/Mls/rv66pjP1AHa+MlbI1YjbOapgIWqc65VlTWCLHQljxFj7qtaD0kxKa5Y1hDaJ
         MYUyMQIielUOJux43X2KGqbeeZ56WyX2G4rzkNksWkHHDlbs4xTSSpE91NnmozrndbOX
         ibZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ec4zzvCEIRAZ5xfSFujdt3O/MmVFFCSSaTkJNA0Gesk=;
        b=M4mqAc4P577YngKfFzxu6F88C27h2LJLXtpqskiPV0apPXXlc5zuFqGqaiOvx69OAm
         CPZJWRTBxCuZClIlRO8lJFHcjdz+3QkiounNJh9rO2Zc57ICyFdqvPDsyTeSLlAFY2vD
         BAjbvoAh8HbkS3fZsCj1huVlD+0TecMfW6nzVYhJ2yvjMVse06b9FCi2qc9tn3vfmcNr
         PI6x7q3YuGCNcLx8bVEprLJkHHLW4+qQtm897s1CQr+Dr/R/ugk/Hx5VQScNOTrnFxsa
         b4z2WcaMYw3NFFDO+xmUwp37crp58xBYjlzTfp7v50PWgi3OOEPkDyC31VvEm0X5iOM4
         ERzA==
X-Gm-Message-State: ANhLgQ1GxtJQuJakU1JUKwe3gwu+KpO3NydZ/mYr5oEI8dGfpfuo3ei9
	N9btXFCMRvR+/y5+umx5q/xKE4wr5HO8yTrtdbFWHQ==
X-Google-Smtp-Source: ADFU+vtVDIkIb5z7RR8jJzmALdrRQn05cTcgu3CPKp3sK97WzjtLn+6ei218QLPZFovuMtjdfgbw+mAhrJJXYQJMNO8=
X-Received: by 2002:a92:5f45:: with SMTP id t66mr21962193ilb.28.1583868611206;
 Tue, 10 Mar 2020 12:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-7-nieklinnenbank@gmail.com> <87d09t7i8i.fsf@linaro.org>
 <CAPan3Wo6_15zFSHJwf0hVq9CVUSfOBU+frwSLQX21SWrXW03iA@mail.gmail.com> <CAFEAcA_wTrqgAh+NK5jmtqPeU9y6bhouzaXWQyPR_iYU5waOGg@mail.gmail.com>
In-Reply-To: <CAFEAcA_wTrqgAh+NK5jmtqPeU9y6bhouzaXWQyPR_iYU5waOGg@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 10 Mar 2020 20:30:00 +0100
Message-ID: <CAPan3WpVsb0=gpdghsuhmnKc1CTXi8n1A7xfW=NsTpav9RNCLA@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] hw/arm/allwinner: add CPU Configuration module
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f1241905a085253d"
X-TUID: 4ePilKAnn53v

--000000000000f1241905a085253d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2020 at 12:18 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 3 Mar 2020 at 20:15, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> > On Tue, Mar 3, 2020 at 1:09 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
>
> wrote:
> >> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
> >> > +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t
> cpu_id)
> >> > +{
> >> > +    int ret;
> >> > +
> >> > +    trace_allwinner_cpucfg_cpu_reset(cpu_id, s->entry_addr);
> >> > +
> >> > +    ret =3D arm_set_cpu_on(cpu_id, s->entry_addr, 0,
> >> > +                         CPU_EXCEPTION_LEVEL_ON_RESET, false);
> >>
> >> According to the arm_set_cpu_on code:
> >>
> >>     if (!target_aa64 && arm_feature(&target_cpu->env,
> ARM_FEATURE_AARCH64)) {
> >>         /*
> >>          * For now we don't support booting an AArch64 CPU in AArch32
> mode
> >>          * TODO: We should add this support later
> >>          */
> >>         qemu_log_mask(LOG_UNIMP,
> >>                       "[ARM]%s: Starting AArch64 CPU %" PRId64
> >>                       " in AArch32 mode is not supported yet\n",
> >>                       __func__, cpuid);
> >>         return QEMU_ARM_POWERCTL_INVALID_PARAM;
> >>     }
> >>
> >> Do you really want to reboot in aarch32 mode on a reset? If so we shou=
ld
> >> fix the TODO.
> >
> > The Allwinner H3 has four ARM Cortex-A7 cores and are 32-bit, so in the
> > early version I filled the @target_aa64 parameter with false to
> > keep it in 32-bit mode. And for usage in the current Allwinner H3 SoC
> > that is sufficient, but as soon as a potential new SoC implementation
> > with a 64-bit CPU starts to use this module, the hardcoded @target_aa64
> > parameter will become a problem.
>
> > Maybe I should just use some function to check if the current emulated
> > CPU its 32-bit or 64-bit and use that for @target_aa64?
>
> If the intended behaviour is "just power on the CPU into EL3
> in the aarch32/aarch64 state it would naturally have out of reset"
> then you can get the right value to pass to target_aa64 like this:
>
>    ARMCPU *target_cpu =3D ARM_CPU(arm_get_cpu_by_id(cpu_id));
>
>    if (!target_cpu) {
>        /*
>         * handle the case of "guest wrote bogus value to RST_CTRL
>         * field, probably by returning doing nothing
>         */
>    }
>    target_aa64 =3D arm_feature(&target_cpu->env, ARM_FEATURE_AARCH64);
>
>
Thanks for explaining Peter. This solution is working fine. I'm including
it in the v7 respin.

Regards,
Niek


> Or if the required behaviour for a 64-bit CPU is more complicated
> you can just assert or something with a comment that this would need
> updating if we ever modelled a 64-bit Allwinner SoC.
>
> thanks
> -- PMM
>


--=20
Niek Linnenbank

--000000000000f1241905a085253d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2020 at 12:18 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, 3 Mar 2020 at 20:15, Niek Linnenbank &lt;<a href=3D"mailto:ni=
eklinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; =
wrote:<br>
&gt; On Tue, Mar 3, 2020 at 1:09 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:=
alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wr=
ote:<br>
&gt;&gt; Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" ta=
rget=3D"_blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
&gt;&gt; &gt; +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uin=
t8_t cpu_id)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int ret;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 trace_allwinner_cpucfg_cpu_reset(cpu_id, s-&gt=
;entry_addr);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ret =3D arm_set_cpu_on(cpu_id, s-&gt;entry_add=
r, 0,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_EXCEPTION_LEVEL_ON_RESET, false);<br>
&gt;&gt;<br>
&gt;&gt; According to the arm_set_cpu_on code:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0if (!target_aa64 &amp;&amp; arm_feature(&amp;ta=
rget_cpu-&gt;env, ARM_FEATURE_AARCH64)) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For now we don&#39;t support b=
ooting an AArch64 CPU in AArch32 mode<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * TODO: We should add this suppo=
rt later<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;[ARM]%s: Starting AArch64 CPU %&quot; PRId64<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot; in AArch32 mode is not supported yet\n&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, cpuid);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return QEMU_ARM_POWERCTL_INVALID_=
PARAM;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; Do you really want to reboot in aarch32 mode on a reset? If so we =
should<br>
&gt;&gt; fix the TODO.<br>
&gt;<br>
&gt; The Allwinner H3 has four ARM Cortex-A7 cores and are 32-bit, so in th=
e<br>
&gt; early version I filled the @target_aa64 parameter with false to<br>
&gt; keep it in 32-bit mode. And for usage in the current Allwinner H3 SoC<=
br>
&gt; that is sufficient, but as soon as a potential new SoC implementation<=
br>
&gt; with a 64-bit CPU starts to use this module, the hardcoded @target_aa6=
4<br>
&gt; parameter will become a problem.<br>
<br>
&gt; Maybe I should just use some function to check if the current emulated=
<br>
&gt; CPU its 32-bit or 64-bit and use that for @target_aa64?<br>
<br>
If the intended behaviour is &quot;just power on the CPU into EL3<br>
in the aarch32/aarch64 state it would naturally have out of reset&quot;<br>
then you can get the right value to pass to target_aa64 like this:<br>
<br>
=C2=A0 =C2=A0ARMCPU *target_cpu =3D ARM_CPU(arm_get_cpu_by_id(cpu_id));<br>
<br>
=C2=A0 =C2=A0if (!target_cpu) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * handle the case of &quot;guest wrote bogus va=
lue to RST_CTRL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * field, probably by returning doing nothing<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0target_aa64 =3D arm_feature(&amp;target_cpu-&gt;env, ARM_FEATU=
RE_AARCH64);<br>
<br></blockquote><div><br></div><div>Thanks for explaining Peter. This solu=
tion is working fine. I&#39;m including it in the v7 respin.</div><div><br>=
</div><div>Regards,</div><div>Niek<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Or if the required behaviour for a 64-bit CPU is more complicated<br>
you can just assert or something with a comment that this would need<br>
updating if we ever modelled a 64-bit Allwinner SoC.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000f1241905a085253d--

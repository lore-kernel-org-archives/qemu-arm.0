Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp769992lfi;
        Tue, 3 Mar 2020 12:15:28 -0800 (PST)
X-Received: by 2002:a92:5845:: with SMTP id m66mr6558568ilb.69.1583266528331;
        Tue, 03 Mar 2020 12:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583266528; cv=none;
        d=google.com; s=arc-20160816;
        b=bPloZf8VKLbhEZRt6ECFCb+QWAnMPhGTWiwa32he68+To9QfJBka1YPCmA14pPIQ5V
         Ad+n4fAcSIA3YA79y41I/5IcOhI0mQj6bGGKG3qsjmogmm/yOFtcRYZ0LDwQXsFX5UbR
         Ek8yKBgId4UFP7FXzNf8a/GEBLWP8xXFIlC+QX7sU12YSV8h7K0zRG4IfzDIv/EzcLYR
         6XT7S7ukIE6C9Rphg+sXNgbPEHn7nR7lQ5uvD/c0l4lhT/SezFGZYq2MxsWo3Ozm93la
         VPLiHh7rAii/iPWxuabAvmU8EZ28In6Z5ZRgAz75nYdPm005vievTzxjjGE+39GsQnax
         wtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x0/OgHW8syNUTp4RdLAXqlwfKECnZr120+Xj23NB9d0=;
        b=rOBT5dP+rrgZfzyBZYZPtXIrOXgnUFPQoYZP30gxGarpOKOErTmF+RKxDPjca/KScO
         nIhD7p8TyTzL2kwRf1jyIJnbkCz/2XOznh11h5C70BTvPZXDgKgwDR4qItxHD1uFluZ6
         AjgY2dMkBtQutNYKl/f4I3DA551/WYcbVXqVDkVE7vrKTHhlY5UnL2WxHEBD0pLoXYPV
         VeoSIKsZ045E+DrQ/glm4RlQdvX9ZPEKIX2Eq85RAt4/SaqxskBcPRU1JkxdizkgFy9I
         0HkxzVMJ/Bg3ovSmj0hspyMa8EZAbEYjX3N83dkqRDXFX4j28J1Vxhok1I3MB7oDWyA5
         aCrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z5Qe4GyS;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x2sor11134862ilg.101.2020.03.03.12.15.28
        (Google Transport Security);
        Tue, 03 Mar 2020 12:15:28 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z5Qe4GyS;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x0/OgHW8syNUTp4RdLAXqlwfKECnZr120+Xj23NB9d0=;
        b=Z5Qe4GySC3e3GKdFdX4HkvEddV4zfFQYWOe52RBw0NBHwuE3e1VxyhXobCCevQPVQK
         FrkxnWSbHUuIva3Pxy2gKn3b4DL0IyKjdZs8trDKHPwbFLAuhZ7ecC/9tfe+1PlDa75O
         uR5E6Lyk9dq+Z2KwQsXJdC6ePfwW4hHQIa4g04F8snpMovVVcLgvTGsDJ9syMogromDs
         T8p/L8gukbq/ZeNhw2D5GaJRglsGkwi5rQPYbO5FTBz+WGc+hY9hslUcAC7qPRT7w914
         Qor6ocxAcDS5FOzHvgB2UkIMGrNnj4DAPpExNMqDB+Pa2+0jzJ5j2BHnzdCJvTrQIWQH
         ghQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x0/OgHW8syNUTp4RdLAXqlwfKECnZr120+Xj23NB9d0=;
        b=XWwt0rkAj1ngPeylQK+nmM1ZA3L3FzXnpXVAUd0kCy4X3vqGBTyXbObTF/3GjKtALu
         gmVUvtVAG7Cwk1oqzax/u/V0mhz0WcFfpjrto55h5lj6l4OFCdt6O38TM0gTvGTKKBL/
         5afVbVXxnuy1GW27WDOjwnA0Es1yMrgQNa5VV/mftBOS7sGN2hHC8W+ADdxVyHYCLA9Q
         jQWUO8FbyLLuUwBTBRy4uH6PQELrXDgdltHcQcJ0sf9+UBQXDd68yqBfHkocRzT77fit
         vnNsDkTQVLICqIeKQKW+I5VRlmcICKplC5zSCtGGWmzfK1HMbzElM3998S3pkN67rVlf
         EgYg==
X-Gm-Message-State: ANhLgQ0q56UVJ1u8N/M6nYZSCVEYhu2o3hdxJXzqVLfLlQ3JImIOCzn5
	jOmRx0EQd4ajjrcB/IkZarAr2pam7ErbVttr8511csrL
X-Google-Smtp-Source: ADFU+vvKzcMvYYvzsHq8RkySZjmVUoX0tIlOWq1uh8q/Wg0OyCFnpr+TpkHCeDOJrqUwWchnKH82siG8jpOlMDMlWtA=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr6267383ilq.306.1583266527760;
 Tue, 03 Mar 2020 12:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-7-nieklinnenbank@gmail.com> <87d09t7i8i.fsf@linaro.org>
In-Reply-To: <87d09t7i8i.fsf@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 3 Mar 2020 21:15:16 +0100
Message-ID: <CAPan3Wo6_15zFSHJwf0hVq9CVUSfOBU+frwSLQX21SWrXW03iA@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] hw/arm/allwinner: add CPU Configuration module
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f8d7e3059ff8f6b5"
X-TUID: OoTAgdMclghN

--000000000000f8d7e3059ff8f6b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

First thanks for all your reviews, I'll add the tags in the next version of
this series.

On Tue, Mar 3, 2020 at 1:09 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>
> > Various Allwinner System on Chip designs contain multiple processors
> > that can be configured and reset using the generic CPU Configuration
> > module interface. This commit adds support for the Allwinner CPU
> > configuration interface which emulates the following features:
> >
> >  * CPU reset
> >  * CPU status
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> <snip>
> > +
> > +/* CPUCFG constants */
> > +enum {
> > +    CPU_EXCEPTION_LEVEL_ON_RESET =3D 3, /* EL3 */
> > +};
> > +
> > +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_i=
d)
> > +{
> > +    int ret;
> > +
> > +    trace_allwinner_cpucfg_cpu_reset(cpu_id, s->entry_addr);
> > +
> > +    ret =3D arm_set_cpu_on(cpu_id, s->entry_addr, 0,
> > +                         CPU_EXCEPTION_LEVEL_ON_RESET, false);
>
> According to the arm_set_cpu_on code:
>
>     if (!target_aa64 && arm_feature(&target_cpu->env,
> ARM_FEATURE_AARCH64)) {
>         /*
>          * For now we don't support booting an AArch64 CPU in AArch32 mod=
e
>          * TODO: We should add this support later
>          */
>         qemu_log_mask(LOG_UNIMP,
>                       "[ARM]%s: Starting AArch64 CPU %" PRId64
>                       " in AArch32 mode is not supported yet\n",
>                       __func__, cpuid);
>         return QEMU_ARM_POWERCTL_INVALID_PARAM;
>     }
>
> Do you really want to reboot in aarch32 mode on a reset? If so we should
> fix the TODO.
>

Very good remark, I'll try to clarify what I did here. In earlier version
of this series, I made this CPU Configuration Module specific
to the Allwinner H3 SoC, as I thought it was a SoC specific component.
Later I discovered that the CPU Configuration Module is
actually a generic Allwinner component and used in multiple SoCs. Taking
that into account, I renamed it to allwinner-cpucfg.c and
updated the comments/docs. That way it should be re-usable in future SoC
modules.

The Allwinner H3 has four ARM Cortex-A7 cores and are 32-bit, so in the
early version I filled the @target_aa64 parameter with false to
keep it in 32-bit mode. And for usage in the current Allwinner H3 SoC that
is sufficient, but as soon as a potential new SoC implementation
with a 64-bit CPU starts to use this module, the hardcoded @target_aa64
parameter will become a problem.

And the TODO inside the arm_set_cpu_on() function I was not yet aware of as
well, so that will also need to be resolved
indeed once this module is going to be used for a new SoC with a 64-bit CPU=
.

Maybe I should just use some function to check if the current emulated CPU
its 32-bit or 64-bit and use that for @target_aa64?
That way the CPU Configuration Module itself should be ready for 64-bit and
the TODO for arm_set_cpu_on() can be
resolved in a later series for newer SoCs.

Regards,
Niek





>
> --
> Alex Benn=C3=A9e
>


--=20
Niek Linnenbank

--000000000000f8d7e3059ff8f6b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,</div><div><br></div><div>First thanks for al=
l your reviews, I&#39;ll add the tags in the next version of this series.<b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Mar 3, 2020 at 1:09 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:ale=
x.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><br>
Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_=
blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
<br>
&gt; Various Allwinner System on Chip designs contain multiple processors<b=
r>
&gt; that can be configured and reset using the generic CPU Configuration<b=
r>
&gt; module interface. This commit adds support for the Allwinner CPU<br>
&gt; configuration interface which emulates the following features:<br>
&gt;<br>
&gt;=C2=A0 * CPU reset<br>
&gt;=C2=A0 * CPU status<br>
&gt;<br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&lt;snip&gt;<br>
&gt; +<br>
&gt; +/* CPUCFG constants */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 CPU_EXCEPTION_LEVEL_ON_RESET =3D 3, /* EL3 */<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_=
id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_allwinner_cpucfg_cpu_reset(cpu_id, s-&gt;entry_ad=
dr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ret =3D arm_set_cpu_on(cpu_id, s-&gt;entry_addr, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0CPU_EXCEPTION_LEVEL_ON_RESET, false);<br>
<br>
According to the arm_set_cpu_on code:<br>
<br>
=C2=A0 =C2=A0 if (!target_aa64 &amp;&amp; arm_feature(&amp;target_cpu-&gt;e=
nv, ARM_FEATURE_AARCH64)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* For now we don&#39;t support booting an=
 AArch64 CPU in AArch32 mode<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TODO: We should add this support later<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;[ARM]%s: Starting AArch64 CPU %&quot; PRId64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot; in AArch32 mode is not supported yet\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, cpuid);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return QEMU_ARM_POWERCTL_INVALID_PARAM;<br>
=C2=A0 =C2=A0 }<br>
<br>
Do you really want to reboot in aarch32 mode on a reset? If so we should<br=
>
fix the TODO.<br></blockquote><div><br></div><div>Very good remark, I&#39;l=
l try to clarify what I did here. In earlier version of this series, I made=
 this CPU Configuration Module specific</div><div>to the Allwinner H3 SoC, =
as I thought it was a SoC specific component. Later I discovered that the C=
PU Configuration Module is</div><div>actually a generic Allwinner component=
 and used in multiple SoCs. Taking that into account, I renamed it to allwi=
nner-cpucfg.c and</div><div>updated the comments/docs. That way it should b=
e re-usable in future SoC modules.<br></div><div><br></div><div>The Allwinn=
er H3 has four ARM Cortex-A7 cores and are 32-bit, so in the early version =
I filled the @target_aa64 parameter with false to</div><div>keep it in 32-b=
it mode. And for usage in the current Allwinner H3 SoC that is sufficient, =
but as soon as a potential new SoC implementation</div><div>with a 64-bit C=
PU starts to use this module, the hardcoded @target_aa64 parameter will bec=
ome a problem.</div><div><br></div><div><div>And the TODO inside the arm_se=
t_cpu_on() function I was not yet aware of as well, so that will also need =
to be resolved</div><div>indeed once this module is going to be used for a =
new SoC with a 64-bit CPU.</div></div><div><br></div><div>Maybe I should ju=
st use some function to check if the current emulated CPU its 32-bit or 64-=
bit and use that for @target_aa64?</div><div>That way the CPU Configuration=
 Module itself should be ready for 64-bit and the TODO for arm_set_cpu_on()=
 can be</div><div>resolved in a later series for newer SoCs.<br></div><div>=
<br></div><div>Regards,</div><div>Niek<br></div><div><br></div><div><br></d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000f8d7e3059ff8f6b5--

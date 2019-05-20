Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp333685wrg;
        Mon, 20 May 2019 08:53:55 -0700 (PDT)
X-Received: by 2002:a9d:5181:: with SMTP id y1mr128173otg.334.1558367635175;
        Mon, 20 May 2019 08:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558367635; cv=none;
        d=google.com; s=arc-20160816;
        b=l4V5N2r1bulfYO6A/pPTEC+lmiEi455CQSJn3ZsX37yH49gza4wffZBnhV4mC9cofX
         48HrtgGubT5hbpmf5brvXBmp1TmMoN7I9sJZB+zuq/PDy5QKMVIF7JXBs4hE8mumo9NS
         WDfJSHYYI98KG3oeZe9BS7wzOq6iW5ch+Yx2q0700cywMlVvSgTzrHOShOrJ8SWY4dHg
         8vGhvF1dSJeQxrUUEHW0i9N2FuTBUar9DVTcYbk/C8eyskpgQT0oriQi4cmSS6Na4bDc
         sYIGCRMvbM4+EaEuZfYPBl1osE3P5dXTk454oHFvbZZoFudto3sNjgw0V2wSZXrzO0KA
         eGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=Gs0kl/XKWL4VZt8EyiEa3WDXQNOIJkACfh3axcEU2sI=;
        b=Y+cEoHNVrA0IrVH4NznXPRh+njzesypzoDNfVvW+9MhuzRiF1DCpD5g2m8fSXoyuLp
         MfCGd+sNjRhZgM0ND75IacbWFDTA12IlSShtRcXl4NtkolJ/F8X1AMPSASP6T5pygn+A
         fwXzmfU0CKGEmZwJYnG26GsfSJ3aN4cpr3OROP5TJgpU4ycuHLWeeio0S2ZqgnEO/M+5
         Z++hFEiLFU+zFwOedY1cZ7w/1WQRKKnY3uZEBUrq/XeXoF48qMDbpY2hiw8Wuy3BldkT
         t7xBPQwMW3P9aI/iuQyF3LsweBI8cyy0H/DXvgRGzKzne7xzMZl6ng1exrksnitalQuE
         jgVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gi1sQ13i;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q64sor2282844oig.68.2019.05.20.08.53.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 May 2019 08:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gi1sQ13i;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Gs0kl/XKWL4VZt8EyiEa3WDXQNOIJkACfh3axcEU2sI=;
        b=Gi1sQ13ih83yz1q8MEKPuBZtPez423nvF5SJimXwVOeRuoe2tnlY6WJRuCfebMnUnw
         RrtM494IOziML/BTZSdoHF+JGPCR/Vrb3IR5fbLHUELEp0rFUPKuo3GdmgWqlHV1htlk
         qdVPGKQ8GkkwO1gPV3IrEsZdC5WsI/Oylcp3c+VXX8m7drCWLUgBOd2Q9FUTq8HCBJoJ
         OeUKjjlzjCFvUaO3jLz5HrSpjnFTo64C/1c8v+p3vAFjxqm0J3G3vIrXn3DltZOt0w1d
         OncVnX3yxdORyAaiASELg1208SRSCKb3YGB0cCYYXuV7oY7TR/aVjU2cQ3skIzUOTa9v
         Pc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Gs0kl/XKWL4VZt8EyiEa3WDXQNOIJkACfh3axcEU2sI=;
        b=Otx1IOCYy3XsrWNbssS+Gom3KExZjfcrANekkIVRyNiVKVOEA4UCx23G9HKLptR+YB
         G2vQ83yF09RfzyoswugR75Ld/Z2v/wetKndwszjNc2x3Gw1wTX9JHGQFC9AED7sdhv0B
         msjF49PbhosIlI+VooPc3CdFv6grSBrz6E9ADdITv7EicpYEAFSIrQfMkJCnKB6yElxT
         1Yvh/51/A3jB5/ZGSFoMm++Y3DinXPoTQYyw60Ly93vruwutBTalcecQpGZ6TNDycGk+
         9APmwtCJRWy2dstiVcdjDwfWLmjnbIL8eC1Lmi91r9/lcIpLOMGh6Rhf8sghdS+NXVWg
         mWvQ==
X-Gm-Message-State: APjAAAUwjTTxuP70lXgOUCdBiQfdUeWSHPMz0f1RqUPjSOLM+RWBcQbj
	/Jcg51TdI1GWDLcm587y2JT51aDPqr4jijv7c06Q9w==
X-Google-Smtp-Source: APXvYqxEZ4TqKx6u3sJUY3Cshh2C+8F4WjycACiUu7EFfseZdhbBYp3J+xz6xY+u0MBDX0mQbJiKVFiLjE7oUSyh9z8=
X-Received: by 2002:aca:3906:: with SMTP id g6mr16358566oia.106.1558367634670;
 Mon, 20 May 2019 08:53:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:410f:0:0:0:0:0 with HTTP; Mon, 20 May 2019 08:53:54
 -0700 (PDT)
Received: by 2002:a9d:410f:0:0:0:0:0 with HTTP; Mon, 20 May 2019 08:53:54
 -0700 (PDT)
In-Reply-To: <20190514155301.16123-10-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org> <20190514155301.16123-10-alex.bennee@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 20 May 2019 17:53:54 +0200
Message-ID: <CAL1e-=iS33qAdeN0uODh7nak55OVuLBs=ftVqgvobn5mdMOmbQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH 09/11] target/mips: only build mips-semi
 for softmmu
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-devel@nongnu.org, 
	Aleksandar Rikalo <arikalo@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004b47f9058953bd0f"
X-TUID: ScEeLGVFK6uz

--0000000000004b47f9058953bd0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On May 14, 2019 6:04 PM, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote:
>
> The is_uhi gates all semihosting calls and always returns false for
> CONFIG_USER_ONLY builds. There is no reason to build and link
> mips-semi for these builds so lets fix that.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  target/mips/Makefile.objs | 3 ++-
>  target/mips/helper.h      | 2 ++
>  target/mips/translate.c   | 8 ++++++++
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/target/mips/Makefile.objs b/target/mips/Makefile.objs
> index 651f36f5176..3448ad5e193 100644
> --- a/target/mips/Makefile.objs
> +++ b/target/mips/Makefile.objs
> @@ -1,4 +1,5 @@
>  obj-y +=3D translate.o dsp_helper.o op_helper.o lmi_helper.o helper.o cp=
u.o
> -obj-y +=3D gdbstub.o msa_helper.o mips-semi.o
> +obj-y +=3D gdbstub.o msa_helper.o
> +obj-$(CONFIG_SOFTMMU) +=3D mips-semi.o
>  obj-$(CONFIG_SOFTMMU) +=3D machine.o cp0_timer.o
>  obj-$(CONFIG_KVM) +=3D kvm.o
> diff --git a/target/mips/helper.h b/target/mips/helper.h
> index a6d687e3405..90ab03b76e3 100644
> --- a/target/mips/helper.h
> +++ b/target/mips/helper.h
> @@ -2,7 +2,9 @@ DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int=
)
>  DEF_HELPER_2(raise_exception, noreturn, env, i32)
>  DEF_HELPER_1(raise_exception_debug, noreturn, env)
>
> +#ifndef CONFIG_USER_ONLY
>  DEF_HELPER_1(do_semihosting, void, env)
> +#endif
>
>  #ifdef TARGET_MIPS64
>  DEF_HELPER_4(sdl, void, env, tl, tl, int)
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index 3cd5b11b16b..fb905c88b57 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -13726,6 +13726,14 @@ static inline bool is_uhi(int sdbbp_code)
>  #endif
>  }
>
> +#ifdef CONFIG_USER_ONLY
> +/* The above should dead-code away any calls to this..*/
> +static inline void gen_helper_do_semihosting(void *env)
> +{
> +    g_assert_not_reached();
> +}
> +#endif
> +
>  static int decode_mips16_opc (CPUMIPSState *env, DisasContext *ctx)
>  {
>      int rx, ry;
> --
> 2.20.1
>
>

--0000000000004b47f9058953bd0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 14, 2019 6:04 PM, &quot;Alex Benn=C3=A9e&quot; &lt;<a href=3D"mailto=
:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The is_uhi gates all semihosting calls and always returns false for<br=
>
&gt; CONFIG_USER_ONLY builds. There is no reason to build and link<br>
&gt; mips-semi for these builds so lets fix that.<br>
&gt;<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org">alex.bennee@linaro.org</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;</p>
<p dir=3D"ltr">&gt; =C2=A0target/mips/Makefile.objs | 3 ++-<br>
&gt; =C2=A0target/mips/helper.h=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; =C2=A0target/mips/translate.c=C2=A0 =C2=A0| 8 ++++++++<br>
&gt; =C2=A03 files changed, 12 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/target/mips/Makefile.objs b/target/mips/Makefile.objs<br>
&gt; index 651f36f5176..3448ad5e193 100644<br>
&gt; --- a/target/mips/Makefile.objs<br>
&gt; +++ b/target/mips/Makefile.objs<br>
&gt; @@ -1,4 +1,5 @@<br>
&gt; =C2=A0obj-y +=3D translate.o dsp_helper.o op_helper.o lmi_helper.o hel=
per.o cpu.o<br>
&gt; -obj-y +=3D gdbstub.o msa_helper.o mips-semi.o<br>
&gt; +obj-y +=3D gdbstub.o msa_helper.o<br>
&gt; +obj-$(CONFIG_SOFTMMU) +=3D mips-semi.o<br>
&gt; =C2=A0obj-$(CONFIG_SOFTMMU) +=3D machine.o cp0_timer.o<br>
&gt; =C2=A0obj-$(CONFIG_KVM) +=3D kvm.o<br>
&gt; diff --git a/target/mips/helper.h b/target/mips/helper.h<br>
&gt; index a6d687e3405..90ab03b76e3 100644<br>
&gt; --- a/target/mips/helper.h<br>
&gt; +++ b/target/mips/helper.h<br>
&gt; @@ -2,7 +2,9 @@ DEF_HELPER_3(raise_exception_err, noreturn, env, i32, =
int)<br>
&gt; =C2=A0DEF_HELPER_2(raise_exception, noreturn, env, i32)<br>
&gt; =C2=A0DEF_HELPER_1(raise_exception_debug, noreturn, env)<br>
&gt;<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; =C2=A0DEF_HELPER_1(do_semihosting, void, env)<br>
&gt; +#endif<br>
&gt;<br>
&gt; =C2=A0#ifdef TARGET_MIPS64<br>
&gt; =C2=A0DEF_HELPER_4(sdl, void, env, tl, tl, int)<br>
&gt; diff --git a/target/mips/translate.c b/target/mips/translate.c<br>
&gt; index 3cd5b11b16b..fb905c88b57 100644<br>
&gt; --- a/target/mips/translate.c<br>
&gt; +++ b/target/mips/translate.c<br>
&gt; @@ -13726,6 +13726,14 @@ static inline bool is_uhi(int sdbbp_code)<br>
&gt; =C2=A0#endif<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; +#ifdef CONFIG_USER_ONLY<br>
&gt; +/* The above should dead-code away any calls to this..*/<br>
&gt; +static inline void gen_helper_do_semihosting(void *env)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt; =C2=A0static int decode_mips16_opc (CPUMIPSState *env, DisasContext *c=
tx)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0int rx, ry;<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--0000000000004b47f9058953bd0f--

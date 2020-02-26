Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3619006lfg;
        Wed, 26 Feb 2020 14:27:01 -0800 (PST)
X-Received: by 2002:a5d:8790:: with SMTP id f16mr886370ion.246.1582756021621;
        Wed, 26 Feb 2020 14:27:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582756021; cv=none;
        d=google.com; s=arc-20160816;
        b=076nyDJQtAITInDRSflL0Pjnu6H5eWI1i7yQZsq9sntcIHR+KpsHsBX7/4FX8lRXE8
         8ZUskoBGXFfZnwYI8VL2gqFF5F5gikVe/S/YdrDXnlcQMWfVTOQnJz4KZDf5RfscdWd4
         t4kvUD7RxsVZ0lzMZParjeyRIWAneU8BHerIcolX833gSyw9b7zUrKJjaA+lNj5/P6re
         gqRgLULBpAFlGJON+RT2fy6F+nf++/KiM0WZlEy85jgYQ9YTIPeckeilJFXOgWGBWa3K
         8f27feXyN6UolNvmH6Y4H7ybgC3c2hU0Q0muUz4kIqOVqse0H8OaUaxNKAd7EHFKcy4t
         KNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vioaXXMIUSQa4apqLoC4uH//xg93hvNVMXMPYEx0riY=;
        b=Dg3ZKs2Ih8d5FgH2RJATrNBebKwnvCfYXW5Cf6vqDnRDU67xD+Q1Y6/zd08O63ymZJ
         lrooYiOcvuShyl230xBDc7wfXqk2oAOSV14k/w8VViD/k8m8+95vfZXlh0ctYa6+6lxF
         K3y997Q9YDgLYOA+eou+NeM8wQluc7jBwbE1tKNiQX2fNK3q9DqQSc24gKlrf6mqQnS2
         DjF2CgoFF6FSQniUa4jMFc6gV8nTTEc4wr4uocmsz3qTSkTfdhvRhKQ7hojBlTY5uf3N
         hNtHZu/eeNZpW75ziXdyeDWnr5R0I6GcKFZIh5a0kR2DIvomXFDWZ7Wk3wvNGm7Ns9i3
         x9sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESXTkdoX;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f13sor864784ilq.18.2020.02.26.14.27.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:27:01 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESXTkdoX;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vioaXXMIUSQa4apqLoC4uH//xg93hvNVMXMPYEx0riY=;
        b=ESXTkdoXyRjs7Nck4DOfTEoRKwP6T8XuaGkeupNcmzwkDNvItJPV4TZHtdfL97b+pX
         0ZDQDX1i6RtPxTD4foYrC+VKezw1b+q/pVoFpncEJ+sydCUxh+MT94aToOICJcBZtY2M
         Y8fTZjdxgpRbMCbt75e9TxxrhsfOBculVE38VfAxvrJqA3La3ZGx0Aa4OQgGeD9/bvHm
         2NyIyzNXcJ1keUEAxVWNCVbIPHS60ZKqmonGzf9nCVfM4Aq2Z2L0/tJ+iAlmhEWmsqBO
         vQeLmyjzWXSULJ7cu4vG38naA0Ev5qChDWqXnBSgC0JuqdX6w/6SpOvjRubuTV18v1+Z
         +CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vioaXXMIUSQa4apqLoC4uH//xg93hvNVMXMPYEx0riY=;
        b=dSc1Bwa1BI25kAIEtqZkTrlmISG2wcd1olVB7iTdI1eAmsXbnSlKOKbLQbKMZm67qN
         c2Ii+sZeXDep7e1DU3Wr/34+GSse3Pf5BecdjyKTQ2tlEUeY4nFGanblO7XJYM1mFHM0
         RqTgA2BWoknVbNMXWGpwTbTBbgPem+QnTIe8XPJ9ZKatkS4JGyfDRGPFxczJvMXdhVYj
         bIF/7GsdGeMZXrPWXPIgac20p5aUrt6GX3A7ll4wC7EktJc85NAUtDmB4ESLMrpcp4/P
         NCneUKdydJfSfISvs2rbUofnsDQSa4QsTV62WMavkopbjDj36Iql7YpR+PP4TPRW9FdE
         t29Q==
X-Gm-Message-State: APjAAAWVnoirmC9UjDI8uSmAaAATc1Dg7WpirjY2l9WvmTytmgujZqxb
	cZFIPp2PMYpLnzNSrbUzDk7HVoU00bgoQZkR2d7FZg==
X-Google-Smtp-Source: APXvYqwnY8+ikgcQ+hZBOkhmVmuJ9bmfp88mEbcCP8e5xCP0mP8tPPQg4Qkk58mp7+oeDexXsVrClezBpmNUVoVdYPU=
X-Received: by 2002:a92:81d9:: with SMTP id q86mr1107698ilk.67.1582756021020;
 Wed, 26 Feb 2020 14:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20200226181020.19592-1-alex.bennee@linaro.org> <20200226181020.19592-3-alex.bennee@linaro.org>
In-Reply-To: <20200226181020.19592-3-alex.bennee@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 26 Feb 2020 23:26:50 +0100
Message-ID: <CAPan3WrD5kpnyNM_TqKOZP4GG4E0npaEqbJe6KidqJW2toAe6A@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] accel/tcg: remove link between guest ram and TCG
 cache size
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000662ee3059f821a83"
X-TUID: HNOC8d01XRGN

--000000000000662ee3059f821a83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, Feb 26, 2020 at 7:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> Basing the TB cache size on the ram_size was always a little heuristic
> and was broken by a1b18df9a4 which caused ram_size not to be fully
> realised at the time we initialise the TCG translation cache.
>

Now I'm beginning to understand the issue better. So without this patch,
the TCG translation
cache effectively was disabled, causing the slowdown, correct?


>
> The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small
> but follow-up patches will address that.
>
> Fixes: a1b18df9a4
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
>
---
>  accel/tcg/translate-all.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 238b0e575bf..5b66af783b5 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -938,15 +938,7 @@ static inline size_t size_code_gen_buffer(size_t
> tb_size)
>  {
>      /* Size the buffer.  */
>      if (tb_size =3D=3D 0) {
> -#ifdef USE_STATIC_CODE_GEN_BUFFER
>          tb_size =3D DEFAULT_CODE_GEN_BUFFER_SIZE;
>
-#else
> -        /* ??? Needs adjustments.  */
> -        /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
> -           static buffer, we could size this on RESERVED_VA, on the text
> -           segment size of the executable, or continue to use the
> default.  */
> -        tb_size =3D (unsigned long)(ram_size / 4);
>

As you wrote in the commit message, I think we are indeed reducing the
cache size here to 32MiB
versus a larger size without this patch. In the next patch #4 in this
series you are increasing it for 64-bit hosts,
but what about the 32-bit hosts? Or will that be addressed in a later
series?

For now, this fix works and resolves the slowdown, so:

Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek


> -#endif
>      }
>      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
>          tb_size =3D MIN_CODE_GEN_BUFFER_SIZE;
> --
> 2.20.1
>
>

--=20
Niek Linnenbank

--000000000000662ee3059f821a83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 7:10 PM Alex Benn=
=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Basing the TB cache size on the ram_size was always a little heuristic<br>
and was broken by a1b18df9a4 which caused ram_size not to be fully<br>
realised at the time we initialise the TCG translation cache.<br></blockquo=
te><div><br></div><div>Now I&#39;m beginning to understand the issue better=
. So without this patch, the TCG translation</div><div>cache effectively wa=
s disabled, causing the slowdown, correct?<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small<br>
but follow-up patches will address that.<br>
<br>
Fixes: a1b18df9a4<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=
=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
Cc: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" target=3D"_bla=
nk">imammedo@redhat.com</a>&gt; <br></blockquote><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
---<br>
=C2=A0accel/tcg/translate-all.c | 8 --------<br>
=C2=A01 file changed, 8 deletions(-)<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index 238b0e575bf..5b66af783b5 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -938,15 +938,7 @@ static inline size_t size_code_gen_buffer(size_t tb_si=
ze)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* Size the buffer.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (tb_size =3D=3D 0) {<br>
-#ifdef USE_STATIC_CODE_GEN_BUFFER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tb_size =3D DEFAULT_CODE_GEN_BUFFER_SIZE;=
 <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ??? Needs adjustments.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ??? If we relax the requirement that CONFIG=
_USER_ONLY use the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static buffer, we could size this=
 on RESERVED_VA, on the text<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0segment size of the executable, o=
r continue to use the default.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_size =3D (unsigned long)(ram_size / 4);<br>=
</blockquote><div><br></div><div>As you wrote in the commit message, I thin=
k we are indeed reducing the cache size here to 32MiB</div><div>versus a la=
rger size without this patch. In the next patch #4 in this series you are i=
ncreasing it for 64-bit hosts,</div><div>but what about the 32-bit hosts? O=
r will that be addressed in a later series?<br></div><div><br></div><div>Fo=
r now, this fix works and resolves the slowdown, so:</div><div><br></div><d=
iv>Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.co=
m">nieklinnenbank@gmail.com</a>&gt;<br></div><div><br></div><div>Regards,</=
div><div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
-#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (tb_size &lt; MIN_CODE_GEN_BUFFER_SIZE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tb_size =3D MIN_CODE_GEN_BUFFER_SIZE;<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000662ee3059f821a83--

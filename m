Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3504728lfm;
        Tue, 1 Jun 2021 03:54:55 -0700 (PDT)
X-Received: by 2002:a05:6402:1d0c:: with SMTP id dg12mr8128266edb.155.1622544895661;
        Tue, 01 Jun 2021 03:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622544895; cv=none;
        d=google.com; s=arc-20160816;
        b=etG7jqIW6DJH5ZasB7h2z/ccgFvNZZ+ynMaOCCmp52mSAiPzuyFlQEwcU0BrWhxIl3
         psp6a5i0tR2YiO+AP8RGcCDDJzVNI81jCOcERVLEInMgnmt473YbDukF69xgMiESZA2f
         XarSJTv+eLb2aV+cfAALuGZRuZMp71VPY55cLf7sgQkOslXPTnAcL9J0VIH3/n4gExkd
         A17ozbCTOxDX2ClNUdXe37avsM+Elq/Rf/dha8foqzGkN+vtmBhP+N6qGAZoSTIwKzRN
         W/GXj8ep4H52pcu11YXWwrvQjYsrn6sltEW9yTnDXe3uTuOpzRbEZdSFxAstgUemGWw3
         OGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k+K4KYma2ayRi2OWc/DZOjd0Tbo0VDgdc0W30Vd7I3o=;
        b=ohy+Rw3zNoCIaE9qSpUepUYwy4EVNobWDT75y6vtpUVdZ4gR3P9c2ikgmNbbUKyCfy
         c195NfXidw0IJwjMeQIO5UpYyZPaEgsCFcQBnAMqjAWrhndo0QrnwrKLjvHiVsZTB6Bt
         /GEESuVV4sXEvgF3qLb0s669EC4eF9lt4OkUqXoCWeleIgQUzWQ2o9XioTdV8UVAzaLg
         ZOEUWMhDEXG7Yeeg0aX/i0R5P5u4L/YcKb4ZzYFQyg8xUxe+AG0Mk3iLbYt7srxx2gGd
         oTV4F8Oxe+YWZpLPrBkayP/ZdoWQ+HQ0jpAesLH0jNuNZPM/3pgttvdbSizNdxF/4XkR
         ZN1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r3CfU38R;
       spf=pass (google.com: domain of astrauss11@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=astrauss11@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <astrauss11@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kb24sor8748650ejc.0.2021.06.01.03.54.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jun 2021 03:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of astrauss11@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r3CfU38R;
       spf=pass (google.com: domain of astrauss11@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=astrauss11@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k+K4KYma2ayRi2OWc/DZOjd0Tbo0VDgdc0W30Vd7I3o=;
        b=r3CfU38Rt1e6DFJPYDimAgjzZ840mPy8Gg8+9f2Tj5CVIf0W1hUzQm0clIEJmshPRk
         6dKAnHeoi2ZdxIW/Q37eAvs9JGnSYVMjbXvKTArVmrF/Fh9GX7FSlNUSvNrr45jQPoPw
         p2/Bj913uldf+4hH4frueN2utc3tiiXTFnUdWCxFkB7GqhC583M1KoKysLn5sRnztfZt
         NGnywGQwhyC5PEIcJ+SEJEqvIDcLAvwi0nOHY8UAxV2CyoDSZN6w/tx9DUXiCD6Z8Ie8
         P2DZAFczTr2K373WeS1gyucxUQrgRt3dH8VFs1hK1g0aEkqa3OeeFfscNiXZkFKVNAoL
         Yhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+K4KYma2ayRi2OWc/DZOjd0Tbo0VDgdc0W30Vd7I3o=;
        b=YFL149SgIHnw4Bn7fwQfKM3bXYrdFqZpKOxxhv8jzqTBgwpacKii9/nGkw+B5l/Tfi
         WskSV4WvOQZwOWNY1rICAhw6apmbeyrHgNn8x1JXVFsJFSwJpMpKeJL9N+4mHQWTPh4F
         J/88vctGc/HwepwCE880lGBa7GGCYveYRM8VODEhfsZ9J52b+u6jx4xGSHOxCoxTfUv4
         Dy2aZR7/3rgievsXedIQoyLyc6eBnf9kTVqz60JqmqrAGCrTVuAEwtuqYtRrId3pbcSN
         WJCVltghuVEOjTBKKf/1RJwMrZXAOoSW/SOtp8MnN6tSmxoZgZGg4ho5bFB8povBPfoA
         v0AQ==
X-Gm-Message-State: AOAM533DnfS8uL6NsEwbFhoH/DcPhuVn/lqr/GKp4jVYPeQXS7Byu6KX
	0v96HJOW2PTnVXtaMN9bL+a4Y6r+eyBWIJ18BB34/fCKgkBD2njq
X-Google-Smtp-Source: ABdhPJy8tefGQQYAfhTy45qtfFUv4SgT7l8MsFCFshSnC9tKD8ndaH8M0Hqb16B5uWAq8yzWLBRHYD0mbMd1aMLWzfs=
X-Received: by 2002:a17:906:1c49:: with SMTP id l9mr11320196ejg.39.1622544895133;
 Tue, 01 Jun 2021 03:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
In-Reply-To: <20210601090715.22330-1-alex.bennee@linaro.org>
From: Andrew Strauss <astrauss11@gmail.com>
Date: Tue, 1 Jun 2021 06:54:44 -0400
Message-ID: <CAP=E3Jjz3XYLOQS5ATNo_ncVwJ4eqiNhv6X4N1AURdcEZtc22A@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001b58a205c3b22ccf"
X-TUID: V+ACSQvipeNt

--0000000000001b58a205c3b22ccf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Andrew Strauss <astrauss11@gmail.com>
Reviewed-by: Andrew Strauss <astrauss11@gmail.com>

On Tue, Jun 1, 2021 at 5:07 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code has access to the same symbols in run time to make a
> determination of the location of the heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andrew <astrauss11@gmail.com>
> ---
>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 1c29146dcf..041b4f6c04 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1165,12 +1165,10 @@ target_ulong do_common_semihosting(CPUState *cs)
>      case TARGET_SYS_HEAPINFO:
>          {
>              target_ulong retvals[4];
> -            target_ulong limit;
>              int i;
>  #ifdef CONFIG_USER_ONLY
> +            target_ulong limit;
>              TaskState *ts =3D cs->opaque;
> -#else
> -            target_ulong rambase =3D common_semi_rambase(cs);
>  #endif
>
>              GET_ARG(0);
> @@ -1201,12 +1199,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[2] =3D ts->stack_base;
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
> -            limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application.
> */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> -            retvals[3] =3D rambase; /* Stack limit.  */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */
> +            retvals[0] =3D 0; /* Heap Base */
> +            retvals[1] =3D 0; /* Heap Limit */
> +            retvals[2] =3D 0; /* Stack base */
> +            retvals[3] =3D 0; /* Stack limit.  */
>  #endif
>
>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
> --
> 2.20.1
>
>

--0000000000001b58a205c3b22ccf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Tested-by: Andrew Strauss &lt;<a href=3D"mailto:astra=
uss11@gmail.com">astrauss11@gmail.com</a>&gt;</div><div>Reviewed-by: Andrew=
 Strauss &lt;<a href=3D"mailto:astrauss11@gmail.com">astrauss11@gmail.com</=
a>&gt;<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 1, 2021 at 5:07 AM Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">The previous numbe=
rs were a guess at best. While we could extract the<br>
information from a loaded ELF file via -kernel we could still get<br>
tripped up by self decompressing or relocating code. Besides sane<br>
library code has access to the same symbols in run time to make a<br>
determination of the location of the heap.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Andrew &lt;<a href=3D"mailto:astrauss11@gmail.com" target=3D"_blank">as=
trauss11@gmail.com</a>&gt;<br>
---<br>
=C2=A0semihosting/arm-compat-semi.c | 19 ++++++++++---------<br>
=C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c<=
br>
index 1c29146dcf..041b4f6c04 100644<br>
--- a/semihosting/arm-compat-semi.c<br>
+++ b/semihosting/arm-compat-semi.c<br>
@@ -1165,12 +1165,10 @@ target_ulong do_common_semihosting(CPUState *cs)<br=
>
=C2=A0 =C2=A0 =C2=A0case TARGET_SYS_HEAPINFO:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong retvals[4];<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong limit;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0#ifdef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong limit;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TaskState *ts =3D cs-&gt;op=
aque;<br>
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong rambase =3D common_=
semi_rambase(cs);<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_ARG(0);<br>
@@ -1201,12 +1199,15 @@ target_ulong do_common_semihosting(CPUState *cs)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retvals[2] =3D ts-&gt;stack=
_base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retvals[3] =3D 0; /* Stack =
limit.=C2=A0 */<br>
=C2=A0#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D current_machine-&gt;ra=
m_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO: Make this use the limit=
 of the loaded application.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[0] =3D rambase + limit /=
 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[1] =3D rambase + limit;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[2] =3D rambase + limit; =
/* Stack base */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[3] =3D rambase; /* Stack=
 limit.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Reporting 0 indicates we=
 couldn&#39;t calculate the real<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* values which should forc=
e most software to fall back to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* using information it has=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[0] =3D 0; /* Heap Base *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[1] =3D 0; /* Heap Limit =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[2] =3D 0; /* Stack base =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvals[3] =3D 0; /* Stack limit=
.=C2=A0 */<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_=
SIZE(retvals); i++) {<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000001b58a205c3b22ccf--

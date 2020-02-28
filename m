Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1075412lfg;
        Fri, 28 Feb 2020 12:17:12 -0800 (PST)
X-Received: by 2002:a5e:8d0f:: with SMTP id m15mr5027027ioj.2.1582921032210;
        Fri, 28 Feb 2020 12:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582921032; cv=none;
        d=google.com; s=arc-20160816;
        b=UbBGTr/8B1SNX9KfjcyIry3wJ9me3PkMzeI6jdDuDfQWocKyQ+1BuusAmCqZayl49+
         9A/dB5ENj4k96H1Vw4+5Ti0mf/bGz+UiBjqw6atlpy26Kr7m4hi/dTz0TOWlSWgXRB2m
         A4aYgICpwnlnPgxvQKBTYzZXWkQzua6n6HjfvspQEPTOpUE4ekw+YF6XkKPDTB4TvZsh
         swSMiJn/5HolnTiy0KV4i6fxT57Lp9yQ4iDIfTP6epcrubLng1uIXylcIPkC/K4mglhu
         62Btxtqlz8QqUK7uePBzMWr827cV97ng+2trh3UV5UbfWeIGLI3tOHgAbL+x+OM3zGjw
         Ol+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y7oKwH0w5cdz9ggYBkA4FnWloJ8QjaZibTiDdQfWYLs=;
        b=GnnBBRY55dpVE8f8dwGYeOTBFnfmcSEHPedGtbfQ9QAsyq2LrNcMN/XXNxVY3PQwpd
         tHfNS1cxwqHH1RQqQoJreRI/NKOB505QdY/rcpBSDs2Wk5LAZENYGERxm4Cc1p7lDZuz
         IvDhqv22+FOUh65ZOlMs7DkhHkvne4QfQoF/0obDLmg5r5+JnJwyDHqBxrZlFmB3xdkT
         p13MNWj5SatoYn8f+BJ+uNxNb4b8q/ZRt7vtxEaBMMsMlzUYHBy9C6j4N0Ng5CeeZC4k
         mD5j2BD9W4OuhJ4eD7JzGwMCBjY7xQ02ofG/uEXgO8/c0ynvl4kiwC/2vhjRUB3SY1p6
         b7wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ti0LHKvC;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f125sor2846835ilh.10.2020.02.28.12.17.12
        (Google Transport Security);
        Fri, 28 Feb 2020 12:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ti0LHKvC;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y7oKwH0w5cdz9ggYBkA4FnWloJ8QjaZibTiDdQfWYLs=;
        b=Ti0LHKvCdGaLzsCNqiY6LlPjxDNz5KX6HeKMTVtU6uaNacb4nScof4l7JoTB1naZHh
         OgRq5adi+6YzAKB9It03gTH6Z+1J+X3IkrDvPGQQKSqdG2QVaW0Dfj8dU1sS4nHu6p8n
         69K+4la+IZbcNFLex6apXnxY4UOeuMLWi6yXst71qY5t8MWUZdyvY0mmGVHiW1oyDEoy
         Gt3jEXfH9hQQhwGXh7wgzofN2CFFbVEWATXyBEvdNw76SrUF7Q0+sE/SWpkKerkkVypZ
         r3xxVwAw3jPS72zarV4uekWV4eFZvbZvbRJN6Vjjah5MdbnkUnNLnS2x1Xf/FUwNzSTB
         3meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7oKwH0w5cdz9ggYBkA4FnWloJ8QjaZibTiDdQfWYLs=;
        b=lFUQPrYtFBAfYe/09zcfTyIlCCc7sdqp7NUZk3fFGWryykfXxlWfcJ4BMqVf4sS7kF
         7c0YMtZtpTrPvRs+Zq2TrXu0TzquB7aC0VPSe3lCrRXZ4E6rkF9gI9hoteK4E2AS4qR5
         DvBZF4wsU2T8KQOe1CP4vqGSaIo3gYULw1N1e5lrLxuyrpvCZaW0k31dUK/SHGStUtxt
         lrsV2p5WAOXLGU2KVq7eyqSdRambsarHmiF4BmF9ZlwRfJs6+D7WzP3Jzq5Cn5xHNqH8
         KlFqQfk4O09ZTEqKW2BAsdKhNJALF74xbHzvW/nCiNt5RAQyfIxx+fOqyBVQzFEze23v
         uc7w==
X-Gm-Message-State: APjAAAV2BrLrXR4qdVFID1P2C6qaxpOi3dOpP+sveYdNdF8h7NZaZNcM
	Z0eiYUP2rxS1T25UKfZy7HhEvTjet/mIFHtsLHREZw==
X-Google-Smtp-Source: APXvYqxleJ8dP7SA/AsFRqSxdCP/TWf0oYz15g6Q3kVymMHxFmvlDW25DdlFqNbKVFn+0aAwbEpnlVjsVwXDXsxi/EY=
X-Received: by 2002:a92:81d9:: with SMTP id q86mr5663179ilk.67.1582921031645;
 Fri, 28 Feb 2020 12:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20200228192415.19867-1-alex.bennee@linaro.org> <20200228192415.19867-3-alex.bennee@linaro.org>
In-Reply-To: <20200228192415.19867-3-alex.bennee@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 28 Feb 2020 21:17:00 +0100
Message-ID: <CAPan3WrZZ6FtkY+ZNkMwVuTTaXSk9_99dW4=0LwkDqkn0rWUZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] accel/tcg: remove link between guest ram and TCG
 cache size
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cc8008059fa88578"
X-TUID: JkOp2dJaa+Ar

--000000000000cc8008059fa88578
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 8:24 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> Basing the TB cache size on the ram_size was always a little heuristic
> and was broken by a1b18df9a4 which caused ram_size not to be fully
> realised at the time we initialise the TCG translation cache.
>
> The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small
> but follow-up patches will address that.
>
> Fixes: a1b18df9a4
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
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
> -#else
> -        /* ??? Needs adjustments.  */
> -        /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
> -           static buffer, we could size this on RESERVED_VA, on the text
> -           segment size of the executable, or continue to use the
> default.  */
> -        tb_size =3D (unsigned long)(ram_size / 4);
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

--000000000000cc8008059fa88578
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 8:24 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Basing the TB cache size on the ram_size was always a little heuristic=
<br>
and was broken by a1b18df9a4 which caused ram_size not to be fully<br>
realised at the time we initialise the TCG translation cache.<br>
<br>
The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small<br>
but follow-up patches will address that.<br>
<br>
Fixes: a1b18df9a4<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div>Revie=
wed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nie=
klinnenbank@gmail.com</a>&gt;</div><div> <br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Cc: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=
=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
Cc: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" target=3D"_bla=
nk">imammedo@redhat.com</a>&gt;<br>
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
<br>
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ??? Needs adjustments.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ??? If we relax the requirement that CONFIG=
_USER_ONLY use the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static buffer, we could size this=
 on RESERVED_VA, on the text<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0segment size of the executable, o=
r continue to use the default.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_size =3D (unsigned long)(ram_size / 4);<br>
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

--000000000000cc8008059fa88578--

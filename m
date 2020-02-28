Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1076770lfg;
        Fri, 28 Feb 2020 12:18:47 -0800 (PST)
X-Received: by 2002:a92:4d3:: with SMTP id 202mr6106843ile.291.1582921127289;
        Fri, 28 Feb 2020 12:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582921127; cv=none;
        d=google.com; s=arc-20160816;
        b=EpnWimXIoyoCfyN6dIQ9DrDFgghdIFgosD4aNzGp4H7/gyIQfsizIv2b+j6GqzklyA
         hqvPXViIc8aoY0C2xTrGNyGHtYGD+DST97Y9lzPjuwRal+Prh0qemjWHOZC4re/BruKT
         lqgpZTtfHSTz/lPhGBmiOWLUHA0o+arWOxnBAijQ1QJo8KSEsrDPo69A9MF57NgPki6J
         ChIjgrIfgutqbp9yvroNBPH53POb5qWRykFKWhheMu8q9vyahFViLyojnXqVCoF+DUey
         +xEnW7KX7bpNJ0QspNJ9Fcot7XT7oaMpwFvLCqCi4zj2Rx1HHO1DLsXiOAUFQk3gy1+k
         FbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zJo13C/fpyM1Civx33BwXNXgau4DiEh2S1nc11FbHK8=;
        b=e8vMlu8bpT9NyU5jJopts2T6Rs1wUcs4x9rC/bQ6+TWuEBcmq/DCJLUVzRZyeU4HH3
         zBu3/tu5E+VIjbvWpc7siEGlXAd06dsKgj7ULIcgSMZILnQHK9fVxRme+gJUkQ8zgNtr
         muXN3TooSmcwepwB4K3RC105sBJVnJUljizmqrNoxQU72Sp8JUfx1iswqi0w44IPT75F
         R5cX7hVXHjd0UbVwnEnhoLQ2UBUnQO5dZvvqmMnURFR3psG9QR6ECGjY33mqbUqSeY2R
         fLV/eIGhjVJgGF2jZFKxFD8R211Pq6Ae749FqY97mjp0HwR54NFAazoHrN18btEeX5ot
         Drjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=H26V2MZh;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y4sor2929444ioc.80.2020.02.28.12.18.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Feb 2020 12:18:47 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=H26V2MZh;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJo13C/fpyM1Civx33BwXNXgau4DiEh2S1nc11FbHK8=;
        b=H26V2MZhNhTkShWqgwlzdMu6TAX4ctIryZv5akLeJlv6WiSOYR/mefpCiaRKSVMnc3
         OuPkJLI+UFOV0Avhw5URa1Mat68kCGzY+lj56GF7Td/d37v4dbABPceXpOku0CIuuI3J
         6yUCtiOUdUdjbJ+zosYVxLmYf7TX6eM87lw45tJyPHHkZdGhgyRpBSges82xcO7dudf3
         wsdk5WNGFu4/yIEJwNxNbuKUTEtoPEBADFgvsHzcztc8vCbzGhXob6U//2pRZpcyzVhF
         OLISDRg5Ov6ebBwxeuuA5A/6RymwDH6wvmk+LWT3TakpXtKztghU+jtWqf27zQOnFb2j
         cgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJo13C/fpyM1Civx33BwXNXgau4DiEh2S1nc11FbHK8=;
        b=MsZxGd/wyer8i0Peo+M5cjn5gdtCPmOW1o/+EZ7POJX+gSa8G847kTMLy0pOY6EVWC
         KEdH7+9rKioY2CJt0mP97K1XzGec+/3ZfXnrurQzt9BsS5S9uKTn3X6BS1Hfd0liNz9h
         zlBxQlz8xlJ4tn11mXhWuYlatE493xFPuMAT2CExSWx2WkwG0OC8I71pm5cJ+abOgxt3
         z5S+gOVgzd4SDb660I/mJPCmLPILcaAr3fZ+Qe4Wx9wfRmsPSHjbxfdSfC+PFzIOKVwa
         vidoH/4DrddUs2ALQxYJPwZwK24LkqiFwPGLqp+T7L4jMBn8yQj9jEl8oQHXrX7ad4cY
         M/3A==
X-Gm-Message-State: APjAAAVsk3Jd3XcuafCbrtFMwPHPUaO2Ud6dxqaLBwUrsf3oZ6lvHrvM
	7S4wuth8kvBwD8Q75NUDcE+8n6WYle0iQ0TuUAARTw==
X-Google-Smtp-Source: APXvYqzMARJfBKN3xHOPf2nq53amXzS9VpJ6OdOWaC8dUUwprp4vObBYKXcazwQWe1v367DjeoGzuKbA4duwQnnSm2c=
X-Received: by 2002:a05:6602:158e:: with SMTP id e14mr4773586iow.217.1582921120024;
 Fri, 28 Feb 2020 12:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20200228192415.19867-1-alex.bennee@linaro.org> <20200228192415.19867-5-alex.bennee@linaro.org>
In-Reply-To: <20200228192415.19867-5-alex.bennee@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 28 Feb 2020 21:18:29 +0100
Message-ID: <CAPan3WpV=Uh1JYnQojG50jCYNfe8HfMQaZ6ia_0XGxjYhtOJ0w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000110c1b059fa88be5"
X-TUID: Qu80h/6+8oTo

--000000000000110c1b059fa88be5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 8:24 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> While 32mb is certainly usable a full system boot ends up flushing the
> codegen buffer nearly 100 times. Increase the default on 64 bit hosts
> to take advantage of all that spare memory. After this change I can
> boot my tests system without any TB flushes.
>
> As we usually run more CONFIG_USER binaries at a time in typical usage
> we aren't quite as profligate for user-mode code generation usage. We
> also bring the static code gen defies to the same place to keep all
> the reasoning in the comments together.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


>
> ---
> v2
>   - 2gb->1gb for system emulation
>   - split user and system emulation buffer sizes
> ---
>  accel/tcg/translate-all.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 4ce5d1b3931..78914154bfc 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -892,15 +892,6 @@ static void page_lock_pair(PageDesc **ret_p1,
> tb_page_addr_t phys1,
>      }
>  }
>
> -#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS =3D=3D 32
> -/*
> - * For user mode on smaller 32 bit systems we may run into trouble
> - * allocating big chunks of data in the right place. On these systems
> - * we utilise a static code generation buffer directly in the binary.
> - */
> -#define USE_STATIC_CODE_GEN_BUFFER
> -#endif
> -
>  /* Minimum size of the code gen buffer.  This number is randomly chosen,
>     but not so small that we can't have a fair number of TB's live.  */
>  #define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
> @@ -929,7 +920,33 @@ static void page_lock_pair(PageDesc **ret_p1,
> tb_page_addr_t phys1,
>  # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>  #endif
>
> +#if TCG_TARGET_REG_BITS =3D=3D 32
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
> +#ifdef CONFIG_USER_ONLY
> +/*
> + * For user mode on smaller 32 bit systems we may run into trouble
> + * allocating big chunks of data in the right place. On these systems
> + * we utilise a static code generation buffer directly in the binary.
> + */
> +#define USE_STATIC_CODE_GEN_BUFFER
> +#endif
> +#else /* TCG_TARGET_REG_BITS =3D=3D 64 */
> +#ifdef CONFIG_USER_ONLY
> +/*
> + * As user-mode emulation typically means running multiple instances
> + * of the translator don't go too nuts with our default code gen
> + * buffer lest we make things too hard for the OS.
> + */
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (128 * MiB)
> +#else
> +/*
> + * We expect most system emulation to run one or two guests per host.
> + * Users running large scale system emulation may want to tweak their
> + * runtime setup via the tb-size control on the command line.
> + */
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
> +#endif
> +#endif
>
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>    (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
> --
> 2.20.1
>
>

--=20
Niek Linnenbank

--000000000000110c1b059fa88be5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 8:24 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">While 32mb is certainly usable a full system boot ends up flushing the=
<br>
codegen buffer nearly 100 times. Increase the default on 64 bit hosts<br>
to take advantage of all that spare memory. After this change I can<br>
boot my tests system without any TB flushes.<br>
<br>
As we usually run more CONFIG_USER binaries at a time in typical usage<br>
we aren&#39;t quite as profligate for user-mode code generation usage. We<b=
r>
also bring the static code gen defies to the same place to keep all<br>
the reasoning in the comments together.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" =
target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br></blockquote><div>Rev=
iewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">n=
ieklinnenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
---<br>
v2<br>
=C2=A0 - 2gb-&gt;1gb for system emulation<br>
=C2=A0 - split user and system emulation buffer sizes<br>
---<br>
=C2=A0accel/tcg/translate-all.c | 35 ++++++++++++++++++++++++++---------<br=
>
=C2=A01 file changed, 26 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index 4ce5d1b3931..78914154bfc 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -892,15 +892,6 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_=
addr_t phys1,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-#if defined(CONFIG_USER_ONLY) &amp;&amp; TCG_TARGET_REG_BITS =3D=3D 32<br>
-/*<br>
- * For user mode on smaller 32 bit systems we may run into trouble<br>
- * allocating big chunks of data in the right place. On these systems<br>
- * we utilise a static code generation buffer directly in the binary.<br>
- */<br>
-#define USE_STATIC_CODE_GEN_BUFFER<br>
-#endif<br>
-<br>
=C2=A0/* Minimum size of the code gen buffer.=C2=A0 This number is randomly=
 chosen,<br>
=C2=A0 =C2=A0 but not so small that we can&#39;t have a fair number of TB&#=
39;s live.=C2=A0 */<br>
=C2=A0#define MIN_CODE_GEN_BUFFER_SIZE=C2=A0 =C2=A0 =C2=A0(1 * MiB)<br>
@@ -929,7 +920,33 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_=
addr_t phys1,<br>
=C2=A0# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 ((size_t)-1)<br>
=C2=A0#endif<br>
<br>
+#if TCG_TARGET_REG_BITS =3D=3D 32<br>
=C2=A0#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)<br>
+#ifdef CONFIG_USER_ONLY<br>
+/*<br>
+ * For user mode on smaller 32 bit systems we may run into trouble<br>
+ * allocating big chunks of data in the right place. On these systems<br>
+ * we utilise a static code generation buffer directly in the binary.<br>
+ */<br>
+#define USE_STATIC_CODE_GEN_BUFFER<br>
+#endif<br>
+#else /* TCG_TARGET_REG_BITS =3D=3D 64 */<br>
+#ifdef CONFIG_USER_ONLY<br>
+/*<br>
+ * As user-mode emulation typically means running multiple instances<br>
+ * of the translator don&#39;t go too nuts with our default code gen<br>
+ * buffer lest we make things too hard for the OS.<br>
+ */<br>
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (128 * MiB)<br>
+#else<br>
+/*<br>
+ * We expect most system emulation to run one or two guests per host.<br>
+ * Users running large scale system emulation may want to tweak their<br>
+ * runtime setup via the tb-size control on the command line.<br>
+ */<br>
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)<br>
+#endif<br>
+#endif<br>
<br>
=C2=A0#define DEFAULT_CODE_GEN_BUFFER_SIZE \<br>
=C2=A0 =C2=A0(DEFAULT_CODE_GEN_BUFFER_SIZE_1 &lt; MAX_CODE_GEN_BUFFER_SIZE =
\<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000110c1b059fa88be5--

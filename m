Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3635137lfg;
        Wed, 26 Feb 2020 14:45:23 -0800 (PST)
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr1322134ilq.192.1582757122924;
        Wed, 26 Feb 2020 14:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582757122; cv=none;
        d=google.com; s=arc-20160816;
        b=04l8Orsacfug8CsZChFCd2LPT4UvifejdFiVFVxohRyszZjt538CQAVQOgVJZO8Z9L
         p401qJpxTSkz5cjCJy95rjGSlhiTyF3B0h4DZ5kZ1C/Rw7o1yvaY2NJem6z+F7KXHc4u
         HyW4T8ZK5Q5XcarNbDEP7RyNaY7oKCI13h4fNJvaHE5zfOW16of1WcW+KYlYSobCG5Bl
         j0UtcJAb6HsxjPqJbR3aOAqMVV/yjWJ8u6tDV1ZFp1p9RR11nRGNkybycQQ3eDnJewFP
         FNpj/xiJ7wMxUelFgGK9Anh6LDL8QrWLi5jFokBhzS/ykGUvgrQQUQYER+hbVsYDT3zm
         xagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5d1CV6r8BklASQY1Jw4Nc/D3ajahverohW7nU9wCTOk=;
        b=Q0gr+2n8WM6utQ/bTSHTmvZ5NCd7euUYtZuLMzsHHJHwi1ffR4q4zFGaV7kLKQgbKa
         2aW62mKSi3xDXznYMy8EGor9PER7browPOWJSmpLwZeQgH1fM/YQEovXKAvpuxjnx6zU
         qBiEtZB3/qBk1AlxNGcmXwn1AwYSaznMmDfJzZMg/m+081404s0VGE7Khtb9EbsXcUzY
         Ei7be19OOrEMr27VLpHyyxAfte8dGiYH/uhPZ/n/9rcl0nt5wQ8Dflhk/ga9xpl/ElFP
         dv7gZGeaY9L+0+R3+E7mFBCQXvvNyAnHUAoMkkIcVCjWKkuqLidBn5Vdvl6w4xb9r25Y
         rvEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=n91aUiDr;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n8sor861014ioc.64.2020.02.26.14.45.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:45:22 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=n91aUiDr;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5d1CV6r8BklASQY1Jw4Nc/D3ajahverohW7nU9wCTOk=;
        b=n91aUiDrlq6g4XBz8gLfsch1Sdv0yb/AxWVYPvsZfFrAioQumPPxE6SRR1Pdd8hOHV
         SIygIrQ3bM3uuoqr10vKef+XWFrPndPSkdpmeIrX3ZR2QlLmbne+ZtabsH4EZB15WYg7
         WOM0hWGp8AFXdaR0XTBAyh7XZ5QPOQhkotgOpncNaxFjlDXYLBx2fPpm1tZjvFwVJ94+
         p1bAsCuUsSXZxy/6bDhnYkUpges7GeaKZJ7VjMUcygaKC+e6XEnbc1ZOHRPOHrIyashs
         YL3tZIzHw+AXIlNi3ODLlttWCImseRcsLWJVwxMm8QX6VcvecMttxVeEN5GVlFjEBNU6
         daXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5d1CV6r8BklASQY1Jw4Nc/D3ajahverohW7nU9wCTOk=;
        b=jeMRyhKqKOpWGLiai2Km83f42F/OEy24nRAPC1whSQTPl/WWpSQkFoSZ1zZ8wNIltl
         Xp3AobX75SbDbje6lwc51Rkd04TQf+VTzC54dFIxEoWN/qdtrEA9E59JnHhUWgK1IyUV
         GmexikombP/APpC1mee86BaIKu5B2mbCiakUrLLbPZiSeoB3R0CuU43zt6JN9GA/d0mH
         8vP63e/fot33YqlpTEdBqemqXnD8LjAoWnPyywSKfYvN7KYdNPPqzBzl/QO+y6OaR2jq
         QfWp3Z+NcUsoUHKOdIjOSSZNmSO1hq0tg9OIfhrig/OmGvQZqzpbU4DsmMUqTRrGV18o
         ye6g==
X-Gm-Message-State: APjAAAXC+7K1XniINajFMjbA82WZZRcrultZH0DtCwBtkjcTJVBrQGky
	OpfB9j9FUXlLclXAONmLqXJb6ngVtuWQRowkkc5biC2V
X-Google-Smtp-Source: APXvYqys2shB5B44WqTI79gVgZGmWe6rf78IBGLvPcwvI5LpvV5z93EFK5WmZ4RQvmt7Lvt5FcIZkW43Onx3AtBA0yU=
X-Received: by 2002:a05:6602:158e:: with SMTP id e14mr993421iow.217.1582757122279;
 Wed, 26 Feb 2020 14:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20200226181020.19592-1-alex.bennee@linaro.org> <20200226181020.19592-5-alex.bennee@linaro.org>
In-Reply-To: <20200226181020.19592-5-alex.bennee@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 26 Feb 2020 23:45:11 +0100
Message-ID: <CAPan3WqTdC9+Vc3SvUEs+KUW7Ow-MuyJ0PewUH6aPNs44LdJsg@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/alternative; boundary="0000000000000a3d9f059f825cf4"
X-TUID: uwxnf3TOc8Em

--0000000000000a3d9f059f825cf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, Feb 26, 2020 at 7:13 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> While 32mb is certainly usable a full system boot ends up flushing the
> codegen buffer nearly 100 times. Increase the default on 64 bit hosts
> to take advantage of all that spare memory. After this change I can
> boot my tests system without any TB flushes.
>

That great, with this change I'm seeing a performance improvement when
running the avocado tests for cubieboard.
It runs about 4-5 seconds faster. My host is Ubuntu 18.04 on 64-bit.

I don't know much about the internals of TCG nor how it actually uses the
cache,
but it seems logical to me that increasing the cache size would improve
performance.

What I'm wondering is: will this also result in TCG translating larger
chunks in one shot, so potentially
taking more time to do the translation? If so, could it perhaps affect more
latency sensitive code?


>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
>  accel/tcg/translate-all.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 4ce5d1b3931..f7baa512059 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -929,7 +929,11 @@ static void page_lock_pair(PageDesc **ret_p1,
> tb_page_addr_t phys1,
>  # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>  #endif
>
> +#if TCG_TARGET_REG_BITS =3D=3D 32
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
> +#else
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2 * GiB)
> +#endif
>

The qemu process now takes up more virtual memory, about ~2.5GiB in my
test, which can be expected with this change.

Is it very likely that the TCG cache will be filled quickly and completely?
I'm asking because I also use Qemu to do automated testing
where the nodes are 64-bit but each have only 2GiB physical RAM.

Regards,
Niek


>
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>    (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
> --
> 2.20.1
>
>
>

--=20
Niek Linnenbank

--0000000000000a3d9f059f825cf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 7:13 PM Alex Benn=
=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>While 32mb is certainly usable a full system boot ends up flushing the<br>
codegen buffer nearly 100 times. Increase the default on 64 bit hosts<br>
to take advantage of all that spare memory. After this change I can<br>
boot my tests system without any TB flushes.<br></blockquote><div><br></div=
><div>That great, with this change I&#39;m seeing a performance improvement=
 when running the avocado tests for cubieboard.</div><div>It runs about 4-5=
 seconds faster. My host is Ubuntu 18.04 on 64-bit.</div><div><br></div><di=
v>I don&#39;t know much about the internals of TCG nor how it actually uses=
 the cache,</div><div>but it seems logical to me that increasing the cache =
size would improve performance.</div><div><br></div><div>What I&#39;m wonde=
ring is: will this also result in TCG translating larger chunks in one shot=
, so potentially</div><div>taking more time to do the translation? If so, c=
ould it perhaps affect more latency sensitive code?</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br></blockquote><div>Te=
sted-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">ni=
eklinnenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0accel/tcg/translate-all.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index 4ce5d1b3931..f7baa512059 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -929,7 +929,11 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_=
addr_t phys1,<br>
=C2=A0# define MAX_CODE_GEN_BUFFER_SIZE=C2=A0 ((size_t)-1)<br>
=C2=A0#endif<br>
<br>
+#if TCG_TARGET_REG_BITS =3D=3D 32<br>
=C2=A0#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)<br>
+#else<br>
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2 * GiB)<br>
+#endif<br></blockquote><div><br></div><div><div>The qemu process now takes=
 up more virtual memory, about ~2.5GiB in my test, which can be expected wi=
th this change.</div><div><br></div><div>Is it very likely that the TCG cac=
he will be filled quickly and completely? I&#39;m asking because I also use=
 Qemu to do automated testing</div><div>where the nodes are 64-bit but each=
 have only 2GiB physical RAM.</div><div><br></div><div>Regards,</div><div>N=
iek<br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
=C2=A0#define DEFAULT_CODE_GEN_BUFFER_SIZE \<br>
=C2=A0 =C2=A0(DEFAULT_CODE_GEN_BUFFER_SIZE_1 &lt; MAX_CODE_GEN_BUFFER_SIZE =
\<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000000a3d9f059f825cf4--

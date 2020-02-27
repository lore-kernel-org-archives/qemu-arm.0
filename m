Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4830451lfg;
        Thu, 27 Feb 2020 11:20:25 -0800 (PST)
X-Received: by 2002:a05:6638:44a:: with SMTP id r10mr327947jap.36.1582831225744;
        Thu, 27 Feb 2020 11:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582831225; cv=none;
        d=google.com; s=arc-20160816;
        b=J0WI7Zc6EiXDG3LRSZiYkLxS1YjeK85g6XMu9f1tu/0RNL/XDUT5cICPbQVwwYmLv7
         aElrWXZk1mkOuePR5bmJYjpXG3bRymfU1ZytQ/1pTw/9JmFGRnLq91XYxKBHwr0oD7Oj
         whThKla0qbWOj4DjQiKYsZLpzRZB+KgTO2j1DdXfIzkU5Sc6Di6ryyi4cUImWlco0Yce
         6hrphbVy4amKKHzDH5CxZp0WOtaRmCNzYsNliTr0pJdYOp1lQ9Yawnm8BhzXPUxbxxg0
         jdiQJM3riMpudHAIHtQpX791HnYflJXped2/NZGbavVWmTov8Mx1j+3zr80D5T6yyIar
         9v9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uei+Q55y4h9fZrlb1rValsZkG5GHnuVT5+jSW+UWrfc=;
        b=Jfj5M5MFLr8Ctihaa8d5TNbD6Z5x+/CmPBvmcNqtkyxVrIu6KdqLx12sShE7dxhf5Z
         kMT4H6DAjg0izD2bVRsV0qHcA59jh1GP2ZylXoOcCCHWhkmnlllj2RII8CSpNrgHPIi8
         DgxtgaW5VogKMY0i0VGw2xX7UmHHpadyj0TBPMiatNidDag9jCTa1H4Rpn2VM+ut3Mbw
         HoAJfN+530fHNsBbuHsq79M/PT/L9TvkLXzLEwfGlenx/zJvlt9HrEDW/6PV/UwvGOYE
         aDYUcP0VjXDvW2C/pucEuaWth+L02/XeRsrjgrY3Z8voH2LNmB2Nbiqa6K5/G0xSxgJc
         FarA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="q0/vNIM+";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i15sor321327ilj.66.2020.02.27.11.20.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Feb 2020 11:20:25 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="q0/vNIM+";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uei+Q55y4h9fZrlb1rValsZkG5GHnuVT5+jSW+UWrfc=;
        b=q0/vNIM+NuDG8Dm47cjMgM1nhLYoJmc3+2oiEEg1koPXlPK5oCm2zCViSzM9Gr0P1k
         jE6J+Nj67Vcj6lhapHm3Rvufl0vXVgDsQui3CC0GZQraewsC/s4dI+tHhdKwFF8b387z
         K1U73QwqC5iOk/NzOJP+SzAWYocHsg67UIQ1j/sNGi+Hic88/qu7QGPaS4DRYP6U+BWM
         In+SLt2ythR0UfBlcOTKBHYU8yqAa2OBKeOTQpUwNVCCDLRqPFF8eWhrUhk4+t4lotW1
         cnvMkBoFnCBPUqI3DojJjj6DbUroPij4le32VcokG3OClausp/zUscBotqnSgU80yNrO
         59hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uei+Q55y4h9fZrlb1rValsZkG5GHnuVT5+jSW+UWrfc=;
        b=Q1Xg4jW/cpDKKarcGEIl1GPgeOSTRHI1Bnu5hJ2SdU8lhP5Bkz8awc4q2yMrfA07DE
         ipJtSh8dJRdmkJETKZMsYAOFfjZW21l6SG/NOq0rQLW7hhCKPYAHoJySKi/WRlQ6+sKY
         /TVN67AtqbiNUD7d9SCo0vx1LEXO3Z5oj5GICU1nU39MyeGvwEuPDkBFeN8QlW9x69GM
         FjQmopZG8AxeAetsJs/S7MmheAR1FUeXXKCl+gG3Sy+Ls5yTShkQGUwL3mjdliaXzaUd
         +qX+j+n0v3D52Q4SbKuVs81dylNX2QuAagziPduj9RlDjyrnf7ZT/lls3fjbDy/CK1SN
         bpJw==
X-Gm-Message-State: APjAAAW6kyJnSeQUg6CDrFlPORGMW82x72Y+eMGr84n5kaHXny8xLMP2
	GYqwvyWhrD4WitFCpsme0wJr82w396CjNeJmtXPA5Q==
X-Google-Smtp-Source: APXvYqytSBT2k2y7/yCH3uj00NfJaJEw3K8jTLfULXGWWtYSDL895kpXeWTtJCHaJhl4OQR2jnszXJRC/EJrPbFgZYo=
X-Received: by 2002:a92:5f45:: with SMTP id t66mr894726ilb.28.1582831225169;
 Thu, 27 Feb 2020 11:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20200226181020.19592-1-alex.bennee@linaro.org> <20200226181020.19592-4-alex.bennee@linaro.org>
In-Reply-To: <20200226181020.19592-4-alex.bennee@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 27 Feb 2020 20:20:14 +0100
Message-ID: <CAPan3WquVnHMGDur2_eQ57CzhekH-Ct3avjoxcct5xMv7_P+Fw@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32
 bit hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/alternative; boundary="000000000000ea6b7b059f939c98"
X-TUID: eRE5g3kaXVEk

--000000000000ea6b7b059f939c98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 7:12 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> There is no particular reason to use a static codegen buffer on 64 bit
> hosts as we have address space to burn. Allow the common CONFIG_USER
> case to use the mmap'ed buffers like SoftMMU.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 5b66af783b5..4ce5d1b3931 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -892,11 +892,12 @@ static void page_lock_pair(PageDesc **ret_p1,
> tb_page_addr_t phys1,
>      }
>  }
>
> -#if defined(CONFIG_USER_ONLY)
> -/* Currently it is not recommended to allocate big chunks of data in
> -   user mode. It will change when a dedicated libc will be used.  */
> -/* ??? 64-bit hosts ought to have no problem mmaping data outside the
> -   region in which the guest needs to run.  Revisit this.  */
> +#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS =3D=3D 32
> +/*
> + * For user mode on smaller 32 bit systems we may run into trouble
> + * allocating big chunks of data in the right place. On these systems
> + * we utilise a static code generation buffer directly in the binary.
> + */
>  #define USE_STATIC_CODE_GEN_BUFFER
>  #endif
>
> --
> 2.20.1
>
>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

--=20
Niek Linnenbank

--000000000000ea6b7b059f939c98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 7:12 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">There is no particular reason to use a static codegen buffer on 64 bit=
<br>
hosts as we have address space to burn. Allow the common CONFIG_USER<br>
case to use the mmap&#39;ed buffers like SoftMMU.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0accel/tcg/translate-all.c | 11 ++++++-----<br>
=C2=A01 file changed, 6 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index 5b66af783b5..4ce5d1b3931 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -892,11 +892,12 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page=
_addr_t phys1,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-#if defined(CONFIG_USER_ONLY)<br>
-/* Currently it is not recommended to allocate big chunks of data in<br>
-=C2=A0 =C2=A0user mode. It will change when a dedicated libc will be used.=
=C2=A0 */<br>
-/* ??? 64-bit hosts ought to have no problem mmaping data outside the<br>
-=C2=A0 =C2=A0region in which the guest needs to run.=C2=A0 Revisit this.=
=C2=A0 */<br>
+#if defined(CONFIG_USER_ONLY) &amp;&amp; TCG_TARGET_REG_BITS =3D=3D 32<br>
+/*<br>
+ * For user mode on smaller 32 bit systems we may run into trouble<br>
+ * allocating big chunks of data in the right place. On these systems<br>
+ * we utilise a static code generation buffer directly in the binary.<br>
+ */<br>
=C2=A0#define USE_STATIC_CODE_GEN_BUFFER<br>
=C2=A0#endif<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:niekl=
innenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;<br clear=3D"all"><div=
><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><di=
v>Niek Linnenbank<br><br></div></div></div></div></div>

--000000000000ea6b7b059f939c98--

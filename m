Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1310043lfg;
        Thu, 6 May 2021 07:16:45 -0700 (PDT)
X-Received: by 2002:a37:905:: with SMTP id 5mr4199368qkj.183.1620310603477;
        Thu, 06 May 2021 07:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620310603; cv=none;
        d=google.com; s=arc-20160816;
        b=hN/yOGtJnpqf4O7zOQlva2al9w06UHsiKnOTCW6MXN93vpVdFsADR06bnLYCYXTRrH
         4nxRLrSV4B52dGtInhJqNoIX9wkcTOsh0zuVnX7s0/OLMn/zCj3wCTw7Rpr+8oiI29zj
         IVmFMdp5KUHUKBTt8HvKNIzw3+Hgx1Je0VTjtBess/ckpR6dUWfRqFClwDe3OIuiLFUb
         IjS1MvOuPTVHRXZQns1g8ICroNrGoGTklvKLFv/wYsaD14si4JnBb4K9jk6sTX3CIEjJ
         EMEpdOKIrf5aioNaVUs3KIG1AxAeLkLd9GJEtlrfKilP4Xo888qUyNlqaDVFfy8pb0l8
         4BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qrsW51zOkrM7kQuZGu554O6tEF+pmRN3LMKQd/Lw3HE=;
        b=RT1umwgX1SoP3A95jF952b3u/l4N80z3xhytG+tEAL3Ixn9qjWNsA3jYNsxBnOIuce
         lsA4c4Hu3BzuudFm8i+LCLyMEKLXMbMnKh/92UVNG9ArSoOxUmhQDH3Vr5rIP9YmzLUh
         0XUR9oD6RB84oLafNyryuGa67ybhQzTwmU4Jmb7MJXgodilG64PGsRtHrSFygsdCytZ9
         MQ6yuIg9jhSSNvd2GsaqhwoC8TivSdR16Le9Yz2aadN8uyDRq+v0ussPTs+/uDUX7rgX
         WDKjkMt822uKwp4UvB71dnQoBCjO/rF2B910TTNcHFM4n+brJnCANsPUd3jKi5MYKBxW
         9ymQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b="fEiIee/q";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3sor1268059qkn.110.2021.05.06.07.16.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 May 2021 07:16:43 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b="fEiIee/q";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrsW51zOkrM7kQuZGu554O6tEF+pmRN3LMKQd/Lw3HE=;
        b=fEiIee/q5vrcfTZTUqHI0d7Jtl17Qie9uo15vSlH1tPJ5NkQtVB57ZoW7XVDU9PL48
         bqwxjYlz0NHA+K56TExXcnBefFDLdjp1tdKh0h0MWhMiLvnC01DOKQ5hJsUM/6u9mQ8D
         Mq22gCyk3dz1PyPTRTInIWrvZtBavN2ZJx6mL31rr0GHxDFNjqXRGAlVQwDPeVBBUgy2
         La39NX3NPij4ugOC4hW2oJt0Ii5X80NCCXaQ1Uko8oVezTfsdH6MrNdWf4ryFpn4uBEx
         SehfmpURHE0dIO2r54uC4CSxgGtWgTKzC9MtXDzlCH10L1filSqnysouy7FrVZWiEYsC
         BMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrsW51zOkrM7kQuZGu554O6tEF+pmRN3LMKQd/Lw3HE=;
        b=kpsDHG66p8m2OvqVSrnAX9D0+gY28DoSKIqWa+G/tnaFizGsPwZOiON5RGCwJUIHRC
         vf6EDGhzKYC8LyNJMiudoA/w4vAeVjQN3B7Ngdfv7c7LrlZBaAuJX94SzegF02pSZIyP
         0YxaYlSvnISpZLyEgGHOKw3qLlSFj0aTAAsYeJA66PvsBsRXTrkYjKoDpA8ud0ZWAslU
         AB/uzmjpYG2cmOJN6E8s+Qsnu0yrPXzmnxiaa+3qa/HsEGCLaZzeUD+V7XNKL63KamsT
         n7HU0VS7k5G586V9peXM3u4tTUl+wOSP2Vk4rW9yPCEZuF9F9cJJLR87Jfa7CP7QeFG1
         ZNUQ==
X-Gm-Message-State: AOAM533ywRZsSKije1dwCcb3PEWvjmlTij4HgU0FPF0qMIp/ZsGM2Vgd
	Ooi0t3GbhS0RjyTgSMjljdtDErxmDCjV6jBawMClZg==
X-Google-Smtp-Source: ABdhPJwS3c2eBBOuTQUKHgbw78cl1LI3YGWqPNniUgUGgJUaNw5468VEjlK7l+VJaxi27hbQTRuN4j1Z0uej96SXBQQ=
X-Received: by 2002:a05:620a:24c5:: with SMTP id m5mr4177309qkn.195.1620310602750;
 Thu, 06 May 2021 07:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com> <20210506133758.1749233-5-philmd@redhat.com>
In-Reply-To: <20210506133758.1749233-5-philmd@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:16:30 -0600
Message-ID: <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org, 
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000e733e705c1a9f591"
X-TUID: LAd0cNZrPVfa

--000000000000e733e705c1a9f591
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> The ALLOCA(3) man-page mentions its "use is discouraged".
>
> Replace it by a g_new() call.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  bsd-user/syscall.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 4abff796c76..dbee0385ceb 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>      case TARGET_FREEBSD_NR_writev:
>          {
>              int count =3D arg3;
> -            struct iovec *vec;
> +            g_autofree struct iovec *vec =3D g_new(struct iovec, count);
>

Where is this freed? Also, alloca just moves a stack pointer, where malloc
has complex interactions. Are you sure that's a safe change here?

Warner

-            vec =3D alloca(count * sizeof(struct iovec));
>              if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
>                  goto efault;
>              ret =3D get_errno(writev(arg1, vec, count));
> --
> 2.26.3
>
>

--000000000000e733e705c1a9f591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The ALLOCA(3) man-page mentions =
its &quot;use is discouraged&quot;.<br>
<br>
Replace it by a g_new() call.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/syscall.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
index 4abff796c76..dbee0385ceb 100644<br>
--- a/bsd-user/syscall.c<br>
+++ b/bsd-user/syscall.c<br>
@@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi=
_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0case TARGET_FREEBSD_NR_writev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int count =3D arg3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree struct iovec *vec =3D=
 g_new(struct iovec, count);<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Where is this freed? Also, alloca just moves a =
stack pointer, where malloc has complex interactions. Are you sure that&#39=
;s a safe change here?</div><div dir=3D"auto"><br></div><div dir=3D"auto">W=
arner</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vec =3D alloca(count * sizeof(st=
ruct iovec));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lock_iovec(VERIFY_READ,=
 vec, arg2, count, 1) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto efault;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_errno(writev(ar=
g1, vec, count));<br>
-- <br>
2.26.3<br>
<br>
</blockquote></div></div></div>

--000000000000e733e705c1a9f591--

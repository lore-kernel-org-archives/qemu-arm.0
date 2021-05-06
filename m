Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1347203lfg;
        Thu, 6 May 2021 07:56:06 -0700 (PDT)
X-Received: by 2002:a0c:d786:: with SMTP id z6mr4834244qvi.18.1620312966000;
        Thu, 06 May 2021 07:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620312965; cv=none;
        d=google.com; s=arc-20160816;
        b=nrmz0vILRYC1zknUm9tR/yrTRAHDsbRuQ9ftTZaGWew50BOIKVfp9LYpx7cFSB3Pq6
         8F4Vlu5QU05tj3y/IsoLcBsut917lFIFlOEF91GRqqbl/x+a6t+NRrdsa50Qcjq7BR1d
         8c/pBDLu5O4tlfQj+WKgGwVzZ1NsCDoaPQwzCbAude34u4hQTgj49HY0XlWy0FYbWD9/
         piKliUEQM9QLoUJPz2p7bkeaGavsVnhWdBM9CTalWZBgGlCJS6jqKxlaNmCdQXXeOW37
         SQ2Aq852UTL7TX13wvDaQ2Z7DrrqsSJ+sgYokGnVNOA0ZeKS+tTLdNq8QM5+b3Ler7S8
         vVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EV0Y8S1mUkWQ6V7LjcC6oMXN3eTe6R5+o1AdjAac2Lc=;
        b=vGRUFCpmtcQ1f8RJIDH/MrS8fg5oev5xUzT5zIz0Yf3vMV7mUHFMpBpO0XVSRUV5f5
         z/pedepWDDSzDHTHuSMdYyzZZMzXfiAoLJpxZiXqNKyHv76G0A6uImq+StL8us0dfxLU
         i6fN10cqdsS/Xr8873KtsuYIt2c6NKrNFOlpdRJ7SZPd2Qw/xfXWt6kVkilvCgLzCXo+
         1lo6RrSMcjbKiZmDM9IFRbXuFKf+hjwAsl6Ujf8sxgmrSD/qXjudTeenJEq+Od+ddac+
         me3TEM1QT58jUpd7g2y01F4Ogy1MX9INCGOm5gLYAM0rxF0KsxWG2II9NcqYjFClcmYF
         fZlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=hA9rGTm7;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z189sor1233166qkc.154.2021.05.06.07.56.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 May 2021 07:56:05 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=hA9rGTm7;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EV0Y8S1mUkWQ6V7LjcC6oMXN3eTe6R5+o1AdjAac2Lc=;
        b=hA9rGTm754OgexHhLlSqqeGLntCgUy7sCtDh1Kr0gnVITpDwn3s6O706AmkbxJsIPf
         9EG1tOIeYpV3qQ2DC97gy+y36QHkaNPpXFX4I5kfN/EYiqTfh8VhoisYu9oOWOs8dqtG
         JTtkMXHQQBG4h0lfKLp5idPnkL3VtjSR4Wpwc7UTTgo7QYUDaunE52ipEWb4OhCOYPBn
         b903ssyM5f4WA97ulaXPkCOvhbZrE6/w/DWO/LxJVBTAOarLQT9Bhc+RgvWh3tS+Xq+h
         dzhOshwBKyeFIC9FqoisU+BYccbd6qetlv79E+TTOXlCrBgctZ9Hct9lBBgZsvracCYZ
         iDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EV0Y8S1mUkWQ6V7LjcC6oMXN3eTe6R5+o1AdjAac2Lc=;
        b=uZKobKCdHELiz/orR7muk/pTzaBFuy4a7xC60gxg9+kpKM9cHB4Cq+IXgmuBmCDG/I
         ZSaixxLqrOGiY3arJ0yAB1nofW0e8Uah1z2ZsWuEWXo8joeR2WwQ7B859BOXUyFr8P8w
         sZnyB366eQjsTrLAW+QqVZTqObh9/yhM7YqaimGylon15Q2pgadRBIgGS8r+mxu9qGhu
         kuSpHu+r+tifZRx4Jw4QQ4phmBIALKa1/ShkuGfwDJ9rwenaoCjjgWp/imZXOc0cxWox
         gWj5WSI5QwtQCm44IS6OJF4wtNFxGocO/sjBoeD9fZlJ3S0sfSeQTSAVx83OPQr4HEVC
         aq3w==
X-Gm-Message-State: AOAM533E0ia2fxTX8CeP+RQmf3Ay9XmIW6qWofmXLk3mzdOU4BXmqaA0
	1N/rGBKO2XH3GmhjTHQQ5fSs41GYysU9y6RifRHZ9g==
X-Google-Smtp-Source: ABdhPJwvmExSmfaqShxTz5sCbgagBglQkXsFwLqHrFtsT/0JM7KG6Sdwi70g7cyinzqbfzmnc6Nh+T+7SYz7VIOA5n0=
X-Received: by 2002:a05:620a:2081:: with SMTP id e1mr4286903qka.44.1620312965534;
 Thu, 06 May 2021 07:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com> <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com> <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
In-Reply-To: <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:55:54 -0600
Message-ID: <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bc740305c1aa82d6"
X-TUID: t+mg0I6OrkCn

--000000000000bc740305c1aa82d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 8:26 AM Eric Blake <eblake@redhat.com> wrote:

> On 5/6/21 9:16 AM, Warner Losh wrote:
> > On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
> > wrote:
> >
> >> The ALLOCA(3) man-page mentions its "use is discouraged".
> >>
> >> Replace it by a g_new() call.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  bsd-user/syscall.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> >> index 4abff796c76..dbee0385ceb 100644
> >> --- a/bsd-user/syscall.c
> >> +++ b/bsd-user/syscall.c
> >> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num=
,
> >> abi_long arg1,
> >>      case TARGET_FREEBSD_NR_writev:
> >>          {
> >>              int count =3D arg3;
> >> -            struct iovec *vec;
> >> +            g_autofree struct iovec *vec =3D g_new(struct iovec, coun=
t);
> >>
> >
> > Where is this freed? Also, alloca just moves a stack pointer, where
> malloc
> > has complex interactions. Are you sure that's a safe change here?
>
> It's freed any time the g_autofree variable goes out of scope (that's
> what the g_autofree macro is for).  Yes, the change is safe, although
> you are right that switching to malloc is going to be a bit more
> heavyweight than what alloca used.  What's more, it adds safety: if
> count was under user control, a user could pass a value that could cause
> alloca to allocate more than 4k and accidentally mess up stack guard
> pages, while malloc() uses the heap and therefore cannot cause stack bugs=
.
>

I'm not sure I understand that argument, since we're not compiling bsd-user
with the stack-smash-protection stuff enabled, so there's no guard pages
involved. The stack can grow quite large and the unmapped page at
the end of the stack would catch any overflows. Since these allocations
are on the top of the stack, they won't overflow into any other frames
and subsequent calls are made with them already in place.

malloc, on the other hand, involves taking out a number of mutexes
and similar things to obtain the memory, which may not necessarily
be safe in all the contexts system calls can be called from. System
calls are, typically, async safe and can be called from signal handlers.
alloca() is async safe, while malloc() is not. So changing the calls
from alloca to malloc makes calls to system calls in signal handlers
unsafe and potentially introducing buggy behavior as a result.

Warner

--000000000000bc740305c1aa82d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 8:26 AM Eric B=
lake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/6/21 9:=
16 AM, Warner Losh wrote:<br>
&gt; On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<b=
r>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;=
.<br>
&gt;&gt;<br>
&gt;&gt; Replace it by a g_new() call.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 bsd-user/syscall.c | 3 +--<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
&gt;&gt; index 4abff796c76..dbee0385ceb 100644<br>
&gt;&gt; --- a/bsd-user/syscall.c<br>
&gt;&gt; +++ b/bsd-user/syscall.c<br>
&gt;&gt; @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int=
 num,<br>
&gt;&gt; abi_long arg1,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case TARGET_FREEBSD_NR_writev:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int count =3D arg3=
;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree struct iovec=
 *vec =3D g_new(struct iovec, count);<br>
&gt;&gt;<br>
&gt; <br>
&gt; Where is this freed? Also, alloca just moves a stack pointer, where ma=
lloc<br>
&gt; has complex interactions. Are you sure that&#39;s a safe change here?<=
br>
<br>
It&#39;s freed any time the g_autofree variable goes out of scope (that&#39=
;s<br>
what the g_autofree macro is for).=C2=A0 Yes, the change is safe, although<=
br>
you are right that switching to malloc is going to be a bit more<br>
heavyweight than what alloca used.=C2=A0 What&#39;s more, it adds safety: i=
f<br>
count was under user control, a user could pass a value that could cause<br=
>
alloca to allocate more than 4k and accidentally mess up stack guard<br>
pages, while malloc() uses the heap and therefore cannot cause stack bugs.<=
br></blockquote><div><br></div><div>I&#39;m not sure I understand that argu=
ment, since we&#39;re not compiling bsd-user</div><div>with the stack-smash=
-protection stuff enabled,=C2=A0so there&#39;s no guard pages</div><div>inv=
olved. The stack can grow quite large and the unmapped page at</div><div>th=
e end of the stack would catch any overflows. Since these allocations</div>=
<div>are on the top of the stack, they won&#39;t overflow into any other fr=
ames</div><div>and subsequent calls are made with them already in place.</d=
iv><div><br></div><div>malloc, on the other hand, involves taking out a num=
ber of mutexes</div><div>and similar things to obtain the memory, which may=
 not necessarily</div><div>be safe in all the contexts system calls can be =
called from. System</div><div>calls are, typically, async safe and can be c=
alled from signal handlers.</div><div>alloca() is async safe, while malloc(=
) is not. So changing the calls</div><div>from alloca to malloc makes calls=
 to system calls in signal handlers</div><div>unsafe and potentially introd=
ucing buggy behavior as a result.</div><div><br></div><div>Warner</div></di=
v></div>

--000000000000bc740305c1aa82d6--

Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1360506lfg;
        Thu, 6 May 2021 08:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/pvXFlwVPxbCplABFEktN6bw9k7XYKn46iTarEM/tcWbqo0GFc/0jh+W7aWXks+mIpnnf
X-Received: by 2002:a05:6512:1390:: with SMTP id p16mr3312228lfa.597.1620313726747;
        Thu, 06 May 2021 08:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620313726; cv=none;
        d=google.com; s=arc-20160816;
        b=DC7u22fslrIsnZOtUj6GToOFs/sKeW4Zuv5f30fdHPT9vECO5IilgP2izBDW1+d4Jz
         rYpS/zJLs3FOHXbdSHm7y0JyCOcrwqO3xwIyqUj5iP2GARwRTlBMxCYgpunzlSzRtMHG
         EV6tQ1M2OLbeqG5+hGRle/fZAhhKfEp+jYNnHXLJ3anPqeWwQK/24dJ7tlPwOlo0/g7C
         tZuTe28Ag6u5Srg/enqe9HicToAPnNa0t8tN0N9CFVlIFMFp4o39TkiYM8qTqcRhFbq7
         LvjIzm55vG7oEegl5eSVY9JHqnCKqN8bzeEi7vAAReWhujVhuaKFdT8FXswOs82gC/Hn
         eSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7egZ91lm04uZj+IsPG0NVHnVuWyoWKPFXJjtyiUoCkw=;
        b=McvXMI137JkRt8jKII5izg8qOT56sWxobBAl+geAoxF1FXnUi3axNwjx9Ypn6pAAii
         W+iQwi3TiXhSoVLbEznfSKmDQw/4+H+jGPE4jNcYbFDBxQnuc6mjhr2X4WSqYDl9Fe0+
         veAcID3aoZmg7AmnkKk+PDq1hcuxa2QgG2qlUyfS2DEl+5dQUqVQxW8DvtF01RZtjZ6+
         a0NlU22g/oFF1N3jJ4GgWnZW16JdHnbeIsIuS4Ir6zaiB+Tr897NRZaK26IkTNFX2Q5m
         /0Dihf0wCxLxNcL6ZHNlNPHeMstRxtprXsl4G9vZ3FUPINukRFF4dHWqKVZ9GHoDtlP3
         zrVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=diJS2U3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si3460790ljc.336.2021.05.06.08.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 May 2021 08:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=diJS2U3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lefcL-0007KV-A1
	for alex.bennee@linaro.org; Thu, 06 May 2021 11:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefbi-0007I1-Rs
 for qemu-arm@nongnu.org; Thu, 06 May 2021 11:08:06 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:40946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefbe-0002nH-QO
 for qemu-arm@nongnu.org; Thu, 06 May 2021 11:08:06 -0400
Received: by mail-qk1-x72f.google.com with SMTP id q136so5191970qka.7
 for <qemu-arm@nongnu.org>; Thu, 06 May 2021 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7egZ91lm04uZj+IsPG0NVHnVuWyoWKPFXJjtyiUoCkw=;
 b=diJS2U3AJG0Q2IcHHENe9FqrMqQvkwbQnX5kO1LuK7ZQ4PCSTYl54KAXxXZdNIDPif
 uxif6knAaYxHBI6vQcCv46KBLpCciMoy+/QGZfkVy1l/9f0xWgtca8Le3r+cb52ZCx57
 4ErURmr6d6CqGxoTEQ46wnlUMXdj0KBBRkg5JD+RSrUQbXWrv8DrkVHHBNGMfXOVUu2O
 5wftvMADcf/YLBncthMo/XclxJftLmwaChGCxScxyHsqKR6zJcrmvlfoxC5DsldODqSr
 GZUh1i/K9mQBKOVN4W8E7cyLnuXxra06zruH/DKcZtQHFHNPr534S0ANIhyXNa/VQZvj
 suSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7egZ91lm04uZj+IsPG0NVHnVuWyoWKPFXJjtyiUoCkw=;
 b=TCr1i4j6z+Rs80Q4AWTDoWWx6YMU0mg4vg8lGNV6Ubgi3jNOcmWZAd5tKsHGExSN35
 G1/sNS01eG7kz1RVuXUz+tbC+xLqSPeMwqE7p8aalB/YnEX2c/QztWS0fkhE1wVWQvdx
 IKpRBhTBxXvW28DzCbsWaZT3f6Qi1fKwX4i/r767HPw41WIqJxpzXMTlhpTrTz3TZRpr
 zRwuDzuibnCsyWM2aoDeuZtfnADxI5cKPbKYm4XwtySal66SPh1iAtxZNF5+X+cJnS/U
 ppcK+FezRrcKmkZQvmFpQQlWRL93IJgbJ0unGo64oVrGH0Fp0txn9rnknf9Wd4cOXwSS
 UpMQ==
X-Gm-Message-State: AOAM533E9ZSYZVtxYmHAqmTpWDyanyIXAEkB2Bnd7zoaGQ4bPmjYgDsE
 BREnbYHZxWajCsfgX5C2iDzNsvkbGQYMbirSw49PgQ==
X-Received: by 2002:a37:f512:: with SMTP id l18mr4338093qkk.89.1620313680338; 
 Thu, 06 May 2021 08:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <CAFEAcA9VL_h8DdVwWWmOxs=mNWj-DEHQu-U4L6vb_H4cGMZpPA@mail.gmail.com>
 <CANCZdfpXjDECHmZq55zP43g32OVhnfjf9W+ERtPMFeDs2MmvXQ@mail.gmail.com>
 <994028a8-8d62-0355-0343-f721d6f256f6@redhat.com>
In-Reply-To: <994028a8-8d62-0355-0343-f721d6f256f6@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 09:07:49 -0600
Message-ID: <CANCZdfpiEyMJ1VC7JH_q+c00C2XAfw5a0q31MZzBoht_O77G0Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005775d705c1aaad51"
Received-SPF: none client-ip=2607:f8b0:4864:20::72f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
 Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MVUYCjDvfc4f

--0000000000005775d705c1aaad51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 8:57 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> On 5/6/21 4:48 PM, Warner Losh wrote:
> >
> >
> > On Thu, May 6, 2021 at 8:21 AM Peter Maydell <peter.maydell@linaro.org
> > <mailto:peter.maydell@linaro.org>> wrote:
> >
> >     On Thu, 6 May 2021 at 15:17, Warner Losh <imp@bsdimp.com
> >     <mailto:imp@bsdimp.com>> wrote:
> >     >
> >     >
> >     >
> >     > On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9
> >     <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> >     >>
> >     >> The ALLOCA(3) man-page mentions its "use is discouraged".
> >     >>
> >     >> Replace it by a g_new() call.
> >     >>
> >     >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
> >     <mailto:philmd@redhat.com>>
> >     >> ---
> >     >>  bsd-user/syscall.c | 3 +--
> >     >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >     >>
> >     >> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> >     >> index 4abff796c76..dbee0385ceb 100644
> >     >> --- a/bsd-user/syscall.c
> >     >> +++ b/bsd-user/syscall.c
> >     >> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env,
> >     int num, abi_long arg1,
> >     >>      case TARGET_FREEBSD_NR_writev:
> >     >>          {
> >     >>              int count =3D arg3;
> >     >> -            struct iovec *vec;
> >     >> +            g_autofree struct iovec *vec =3D g_new(struct iovec=
,
> >     count);
> >     >
> >     >
> >     > Where is this freed?
> >
> >     g_autofree, so it gets freed when it goes out of scope.
> >
> https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-=
autofree
> >     <
> https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-=
autofree
> >
> >
> >
> > Ah. I'd missed that feature and annotation...  Too many years seeing
> > patches like
> > this in other projects where a feature like this wasn't there to save
> > the day...
> >
> > This means you can ignore my other message as equally misinformed.
>
> This also shows my commit description is poor.
>
> >     > Also, alloca just moves a stack pointer, where malloc has complex
> >     interactions. Are you sure that's a safe change here?
> >
> >     alloca()ing something with size determined by the guest is
> >     definitely not safe :-) malloc as part of "handle this syscall"
> >     is pretty common, at least in linux-user.
> >
> >
> > Well, since this is userland emulation, the normal process boundaries
> > will fix that. allocating from
> > the heap is little different..., so while unsafe, it's the domain of
> > $SOMEONE_ELSE to enforce
> > the safety. linux-user has many similar usages for both malloc and
> > alloca, and it's ok for the
> > same reason.
> >
> > Doing a quick grep on my blitz[*] branch in the bsd-user fork shows tha=
t
> > alloca is used almost
> > exclusively there. There's 24 calls to alloca in the bsd-user code.
> > There's almost no malloc
> > calls (7) in that at all outside the image loader: all but one of them
> > are confined to sysctl
> > emulation with the last one used to keep track of thread state in new
> > threads...
> > linux-user has a similar profile (20 alloca's and 14 mallocs outside th=
e
> > loader),
> > but with more mallocs in other paths than just sysctl (which isn't
> present).
> >
> > I had no plans on migrating to anything else...
>
> I considered excluding user emulation (both Linux/BSD) by enabling
> CFLAGS=3D-Walloca for everything except user-mode, but Meson doesn't
> support adding flags to a specific source set:
> https://github.com/mesonbuild/meson/issues/1367#issuecomment-277929767
>
>   Q: Is it possible to add a flag to a specific file? I have some
>      generated code that's freaking the compiler out and I don't
>      feel like mucking with the generator.
>
>   A: We don't support per-file compiler flags by design. It interacts
>      very poorly with other parts, especially precompiled headers.
>      The real solution is to fix the generator to not produce garbage.
>      Obviously this is often not possible so the solution to that is,
>      as mentioned above, build a static library with the specific
>      compiler args. This has the added benefit that it makes this
>      workaround explicit and visible rather than hiding things in
>      random locations.
>
> Then Paolo suggested to convert all alloca() calls instead.
>

I'm having trouble understanding how the emulated system calls
can still be async safe if that's done. I might be missing something
in the CPU emulation that would clear up the concern, though. How
threads interact with each-other in emulation is an area I'm still
learning.

Warner

P.S. Of course, no matter what you do, the current in-tree
bsd-user dumps core right away, so it's hard to break it worse
than it already is broken :)...

--0000000000005775d705c1aaad51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 8:57 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 5/6/21 4:48 PM, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, May 6, 2021 at 8:21 AM Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blan=
k">peter.maydell@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, 6 May 2021 at 15:17, Warner Losh &lt;<a hre=
f=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-=
Daud=C3=A9<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:philmd@redhat.com" target=3D"=
_blank">philmd@redhat.com</a> &lt;mailto:<a href=3D"mailto:philmd@redhat.co=
m" target=3D"_blank">philmd@redhat.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; The ALLOCA(3) man-page mentions its &quot;=
use is discouraged&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Replace it by a g_new() call.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.c=
om</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:philmd@redhat.com" tar=
get=3D"_blank">philmd@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 bsd-user/syscall.c | 3 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 2 de=
letions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; diff --git a/bsd-user/syscall.c b/bsd-user=
/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; index 4abff796c76..dbee0385ceb 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; --- a/bsd-user/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +++ b/bsd-user/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; @@ -355,9 +355,8 @@ abi_long do_freebsd_sy=
scall(void *cpu_env,<br>
&gt;=C2=A0 =C2=A0 =C2=A0int num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case TARGET_FREEBSD_NR=
_writev:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int count =3D arg3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct iovec *vec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 g_autofree struct iovec *vec =3D g_new(struct iovec,<br>
&gt;=C2=A0 =C2=A0 =C2=A0count);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Where is this freed?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0g_autofree, so it gets freed when it goes out of sc=
ope.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://developer.gnome.org/glib/stable/=
glib-Miscellaneous-Macros.html#g-autofree" rel=3D"noreferrer" target=3D"_bl=
ank">https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html=
#g-autofree</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://developer.gnome.org/glib/sta=
ble/glib-Miscellaneous-Macros.html#g-autofree" rel=3D"noreferrer" target=3D=
"_blank">https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.=
html#g-autofree</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Ah. I&#39;d missed that feature and annotation...=C2=A0 Too many years=
 seeing<br>
&gt; patches like<br>
&gt; this in other projects where a feature like this wasn&#39;t there to s=
ave<br>
&gt; the day...<br>
&gt; <br>
&gt; This means you can ignore my other message as equally misinformed.<br>
<br>
This also shows my commit description is poor.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Also, alloca just moves a stack pointer, where=
 malloc has complex<br>
&gt;=C2=A0 =C2=A0 =C2=A0interactions. Are you sure that&#39;s a safe change=
 here?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0alloca()ing something with size determined by the g=
uest is<br>
&gt;=C2=A0 =C2=A0 =C2=A0definitely not safe :-) malloc as part of &quot;han=
dle this syscall&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0is pretty common, at least in linux-user.<br>
&gt; <br>
&gt; <br>
&gt; Well, since this is userland emulation, the normal process boundaries<=
br>
&gt; will fix that. allocating from<br>
&gt; the heap is little different..., so while unsafe, it&#39;s the domain =
of<br>
&gt; $SOMEONE_ELSE to enforce<br>
&gt; the safety. linux-user has many similar usages for both malloc and<br>
&gt; alloca, and it&#39;s ok for the<br>
&gt; same reason.<br>
&gt; <br>
&gt; Doing a quick grep on my blitz[*] branch in the bsd-user fork shows th=
at<br>
&gt; alloca is used almost<br>
&gt; exclusively there. There&#39;s 24 calls to alloca in the bsd-user code=
.<br>
&gt; There&#39;s almost no malloc<br>
&gt; calls (7) in that at all outside the image loader: all but one of them=
<br>
&gt; are confined to sysctl<br>
&gt; emulation with the last one used to keep track of thread state in new<=
br>
&gt; threads...<br>
&gt; linux-user has a similar profile (20 alloca&#39;s and 14 mallocs outsi=
de the<br>
&gt; loader),<br>
&gt; but with more mallocs in other paths than just sysctl (which isn&#39;t=
 present).<br>
&gt; <br>
&gt; I had no plans on migrating to anything else...<br>
<br>
I considered excluding user emulation (both Linux/BSD) by enabling<br>
CFLAGS=3D-Walloca for everything except user-mode, but Meson doesn&#39;t<br=
>
support adding flags to a specific source set:<br>
<a href=3D"https://github.com/mesonbuild/meson/issues/1367#issuecomment-277=
929767" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/=
meson/issues/1367#issuecomment-277929767</a><br>
<br>
=C2=A0 Q: Is it possible to add a flag to a specific file? I have some<br>
=C2=A0 =C2=A0 =C2=A0generated code that&#39;s freaking the compiler out and=
 I don&#39;t<br>
=C2=A0 =C2=A0 =C2=A0feel like mucking with the generator.<br>
<br>
=C2=A0 A: We don&#39;t support per-file compiler flags by design. It intera=
cts<br>
=C2=A0 =C2=A0 =C2=A0very poorly with other parts, especially precompiled he=
aders.<br>
=C2=A0 =C2=A0 =C2=A0The real solution is to fix the generator to not produc=
e garbage.<br>
=C2=A0 =C2=A0 =C2=A0Obviously this is often not possible so the solution to=
 that is,<br>
=C2=A0 =C2=A0 =C2=A0as mentioned above, build a static library with the spe=
cific<br>
=C2=A0 =C2=A0 =C2=A0compiler args. This has the added benefit that it makes=
 this<br>
=C2=A0 =C2=A0 =C2=A0workaround explicit and visible rather than hiding thin=
gs in<br>
=C2=A0 =C2=A0 =C2=A0random locations.<br>
<br>
Then Paolo suggested to convert all alloca() calls instead.<br></blockquote=
><div><br></div><div>I&#39;m having trouble understanding how the emulated =
system calls</div><div>can still be async safe if that&#39;s done. I might =
be missing something</div><div>in the CPU emulation that would clear up the=
 concern, though. How</div><div>threads interact with each-other in emulati=
on is an area I&#39;m still</div><div>learning.</div><div><br></div><div>Wa=
rner</div><div><br></div><div>P.S. Of course, no matter what you do, the cu=
rrent in-tree</div><div>bsd-user dumps core right away, so it&#39;s hard to=
 break it worse</div><div>than it already is broken :)...</div></div></div>

--0000000000005775d705c1aaad51--

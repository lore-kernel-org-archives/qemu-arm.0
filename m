Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1342037lfg;
        Thu, 6 May 2021 07:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWQ8+c7nhQmJXCP/bhJMV8e6EBeHTxqfesCUvHMODl7b+UrkQiaH/B0rDpgrIVgQ2nEQ3w
X-Received: by 2002:a05:6e02:d50:: with SMTP id h16mr4781768ilj.127.1620312616305;
        Thu, 06 May 2021 07:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620312616; cv=none;
        d=google.com; s=arc-20160816;
        b=AkT0LWOEGx8URyGigAG8dWyeMiVSD/MFToZ24OuImagdjcRdG0Nfp3D3Dw6Jli0QWe
         P8grRUJi61ljKnjiVd9X0wFfiVZ+tU10c0/qYinOJeC3uLiYitV3eTEp+iGak0kH/LMS
         txrSYh0+PZ0isLpnN3z/Rsvp/Nq8A23MgDGJrnE5oL1xM5LAfWKfSjmUK2ojbkUH1YPp
         AUdo3S4WWaNW07MV4OEwzm0W82Z0zTPYq2Tp/WFHK90THFSmJyDXNzsKk0S9wvIhbsm4
         +CqK9k3YWBsYx7BMQV1o7dLuJGvntFUka7EpnBa7pHhycczqYMNxdA+U1V4ZkcJOOQfq
         f3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Gb0I7ISeIJ1QqvZBHcd3YAVMORjuBTVTOovRqj2pUM=;
        b=RWH+4fnFOtp1aqym25QyHTPB2L/Uib4IygjCxNfbh8YOl/5c2HE/hi2lbcyZlzXAoq
         oKOOIIN9k0cR6EEG/NnqB2+jdJp0r4g3aL+IfTZNdMm84RaOAgzwmEpA3q5qASvRrMj7
         wnVrkDoGT5e4Ewnx46dKPFPcz0dJzZpp6p5btBrPDFoKDomvMgDzs1YhJfFzjLzEz2+n
         5wlumbxyShDzScasQNiLVcpCqFSo777YQXmiyar4ABQHxyxiFGrKncLzXY2AzwCoXTjq
         lgIeON4J6wDcWdNLNgRHuZMiz4A7yG9j72rDAYRgvzNgPjFcCxZoni/m/mQ4T8C3b2Uz
         E5EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=QXKAsXRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19si3294549ila.26.2021.05.06.07.50.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 May 2021 07:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=QXKAsXRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lefKR-0007OH-Gv
	for alex.bennee@linaro.org; Thu, 06 May 2021 10:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefJ6-00060I-0o
 for qemu-arm@nongnu.org; Thu, 06 May 2021 10:48:52 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefJ3-000093-JO
 for qemu-arm@nongnu.org; Thu, 06 May 2021 10:48:51 -0400
Received: by mail-qk1-x72a.google.com with SMTP id i67so5144684qkc.4
 for <qemu-arm@nongnu.org>; Thu, 06 May 2021 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Gb0I7ISeIJ1QqvZBHcd3YAVMORjuBTVTOovRqj2pUM=;
 b=QXKAsXRdzB6Z9p0YOiFHSVzJNKe0Z3+WxHCeAtGu+Ki/CSZc+6gKRztKHg1GYPcCUk
 EBIJzueuPrTdG3LH8gPG9a3dpaJl9Tld0lj3OXa9zlWE2cRaSIuZ8N+Iqi79hWpCjCIZ
 uik3l+bZ/25pVklG4hvu6x6XMTbcHCzO2XvGbe+AGacUUYzaYE4HAuJbsAeAgf5EzSmN
 bzetqBfqU4bdr6ScQ73ckMsFAqzTsMDyS+G5g+RoE59xxbB4qYFNcxMt7XYeaHzQWj4a
 ZKZ0nOnrsRa44bFlekEdMXtSBbhjfV8tciIBlem9RlKC+MdrtQmI55qAJPm7jAwTPQRO
 hqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Gb0I7ISeIJ1QqvZBHcd3YAVMORjuBTVTOovRqj2pUM=;
 b=gh1i4Bs/hCMDGLLhEcCXCmr02qH9NmlY7Lc6TNGdtKiYDLiDbDToLqJVyuRv8EEW2I
 0WGJKEpxfjih/lRRJZUDM7BYgq2WKeWdAKmWjceDxoiTTQaeW+nbrdq/LA2Neuw24Ron
 H3CBkEPyIV7mVpf5jVJ7ZsYJ+miioDnPW7pKoWljfSUnmV7pZcGSa2jU3Pg3SKBnJiW7
 MbNDWGY5oQTuNNJ2I25hID3yU0soYPbPtXNvvB2Se60K1YJdmWJ5Ni5I0MUrAkiZsWvC
 u4E9oVvgZqqsjns55n+u2yrA19Xc2k4jF6VVGAwq4BUh0NNBebHxADvaOd3UXMe5PtP2
 2v8w==
X-Gm-Message-State: AOAM5319lt+ecAWl4aRPYMlSPgY7DDPRVZMSOzRyP9cUdbvFuVEs9QhR
 MR+xpP7wGP7PFrgxbySBlCnyu+o0n+gcdriXSUUivQ==
X-Received: by 2002:a37:7685:: with SMTP id r127mr4125026qkc.359.1620312528205; 
 Thu, 06 May 2021 07:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <CAFEAcA9VL_h8DdVwWWmOxs=mNWj-DEHQu-U4L6vb_H4cGMZpPA@mail.gmail.com>
In-Reply-To: <CAFEAcA9VL_h8DdVwWWmOxs=mNWj-DEHQu-U4L6vb_H4cGMZpPA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:48:37 -0600
Message-ID: <CANCZdfpXjDECHmZq55zP43g32OVhnfjf9W+ERtPMFeDs2MmvXQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ab554205c1aa6823"
Received-SPF: none client-ip=2607:f8b0:4864:20::72a;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ennGAxTJyhMk

--000000000000ab554205c1aa6823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 8:21 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 6 May 2021 at 15:17, Warner Losh <imp@bsdimp.com> wrote:
> >
> >
> >
> > On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
> wrote:
> >>
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
> abi_long arg1,
> >>      case TARGET_FREEBSD_NR_writev:
> >>          {
> >>              int count =3D arg3;
> >> -            struct iovec *vec;
> >> +            g_autofree struct iovec *vec =3D g_new(struct iovec, coun=
t);
> >
> >
> > Where is this freed?
>
> g_autofree, so it gets freed when it goes out of scope.
>
> https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-=
autofree


Ah. I'd missed that feature and annotation...  Too many years seeing
patches like
this in other projects where a feature like this wasn't there to save the
day...

This means you can ignore my other message as equally misinformed.


>
> > Also, alloca just moves a stack pointer, where malloc has complex
> interactions. Are you sure that's a safe change here?
>
> alloca()ing something with size determined by the guest is
> definitely not safe :-) malloc as part of "handle this syscall"
> is pretty common, at least in linux-user.
>

Well, since this is userland emulation, the normal process boundaries will
fix that. allocating from
the heap is little different..., so while unsafe, it's the domain of
$SOMEONE_ELSE to enforce
the safety. linux-user has many similar usages for both malloc and alloca,
and it's ok for the
same reason.

Doing a quick grep on my blitz[*] branch in the bsd-user fork shows that
alloca is used almost
exclusively there. There's 24 calls to alloca in the bsd-user code. There's
almost no malloc
calls (7) in that at all outside the image loader: all but one of them are
confined to sysctl
emulation with the last one used to keep track of thread state in new
threads...
linux-user has a similar profile (20 alloca's and 14 mallocs outside the
loader),
but with more mallocs in other paths than just sysctl (which isn't present)=
.

I had no plans on migrating to anything else...

Warner

--000000000000ab554205c1aa6823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 8:21 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, 6 May 2021 at 15:17, Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
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
 num, abi_long arg1,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case TARGET_FREEBSD_NR_writev:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int count =3D arg3=
;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree struct iovec=
 *vec =3D g_new(struct iovec, count);<br>
&gt;<br>
&gt;<br>
&gt; Where is this freed?<br>
<br>
g_autofree, so it gets freed when it goes out of scope.<br>
<a href=3D"https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macro=
s.html#g-autofree" rel=3D"noreferrer" target=3D"_blank">https://developer.g=
nome.org/glib/stable/glib-Miscellaneous-Macros.html#g-autofree</a></blockqu=
ote><div><br></div><div>Ah. I&#39;d missed that feature and annotation...=
=C2=A0 Too many years seeing patches like</div><div>this in other projects =
where a feature like this wasn&#39;t there to save the day...</div><div><br=
></div><div>This means you can ignore my other message as equally misinform=
ed.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
&gt; Also, alloca just moves a stack pointer, where malloc has complex inte=
ractions. Are you sure that&#39;s a safe change here?<br>
<br>
alloca()ing something with size determined by the guest is<br>
definitely not safe :-) malloc as part of &quot;handle this syscall&quot;<b=
r>
is pretty common, at least in linux-user.<br></blockquote><div><br></div><d=
iv>Well, since this is userland emulation, the normal process boundaries wi=
ll fix that. allocating from</div><div>the heap is little different..., so =
while unsafe, it&#39;s the domain of $SOMEONE_ELSE to enforce</div><div>the=
 safety. linux-user has many similar usages for both malloc and alloca, and=
 it&#39;s ok for the</div><div>same reason.</div><div><br></div><div>Doing =
a quick grep on my blitz[*] branch in the bsd-user fork shows that alloca i=
s used almost</div><div>exclusively there. There&#39;s 24 calls to alloca i=
n the bsd-user code. There&#39;s almost no malloc</div><div>calls (7) in th=
at at all outside the image loader: all but one of them are confined to sys=
ctl</div><div>emulation with the last one used to keep track of thread stat=
e in new threads...</div><div>linux-user has a similar profile (20 alloca&#=
39;s and 14 mallocs outside the loader),</div><div>but with more mallocs in=
 other paths than just sysctl (which isn&#39;t present).</div><div><br></di=
v><div>I had no plans on migrating to anything else...</div><div><br></div>=
<div>Warner</div><div><br></div></div></div>

--000000000000ab554205c1aa6823--

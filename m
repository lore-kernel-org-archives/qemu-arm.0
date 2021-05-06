Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1382537lfg;
        Thu, 6 May 2021 08:31:01 -0700 (PDT)
X-Received: by 2002:a37:e40f:: with SMTP id y15mr4837585qkf.314.1620315060932;
        Thu, 06 May 2021 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620315060; cv=none;
        d=google.com; s=arc-20160816;
        b=vsHz5F6FnpiN9idiE+IIWlWBcg9ASNAZBLhr6Qa0bMOwsnTFs7koNmIjS+fQjmpHVu
         FWzxXPQJQehsBLdtRZIuwF28zDhJ3JqVMQM9eOb9qK0v3OJ+yGwqQe3m2r4xr6t1HmKS
         MZv3LP9d7/0ciOJ0Zf1Vc9OZTHWBIuR4QA3xTxxxtZJs55v6Vk97u8sZscmvagOXwo8B
         5EZqz0t9O0bQ6jYekIH0f1zB7MbIAJ3aRY/FERldzuf5bW4UaN5HJOGrdgWpzQvzM0TY
         fUgfZKpqrsVKK5DO0oY4IwFJ/2EB8U27i115McoA+l5D1X+LmYiJIKwoCR4nMSsH/36x
         tzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GX797AFmM3s+1YM157AXWlwSY19WofQ9YjwF95Xr4tU=;
        b=azXviNmp1DfaltRi6hbgI7UBsTzoLl/nbWEzzw76KKZUHeY66NLkYGnDVyYxGpiP0N
         WbbeCrm23Ts8g8WkkSCO+szYCOfXIxOwIwrQcXJnJ5yr1RcE+evylf/au5U2APR7kBcA
         KwnQh7TIydxCqiEV9HZ+tHwaB///ALk4TQMgPH01cyaqWUmXSNPEjGVer7JNGqPbf9wz
         aZV0UFfkzI4B8vtMJhJBfYMKJhmCMnR9yLXZe6c52Ilernla0mtQAKlR5+Wdw4u9TGq2
         sHN/pfmLwpcqUnFwCfS3e4qXBCc2uScEsRfhxzwVH3fSiMI4LMMcspSc21n2KPVMOau0
         m4oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=CYD8O+kD;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q1sor3075547qtl.55.2021.05.06.08.31.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 May 2021 08:31:00 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=CYD8O+kD;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GX797AFmM3s+1YM157AXWlwSY19WofQ9YjwF95Xr4tU=;
        b=CYD8O+kDYoi1MuT0HVVTtkVnhTLccUtQWcVWE5b/VPMSqfYbYFA7Q9bhENH0/r8Vh7
         onWECTEkp2Ye7FzM2qgXlHtSIBYhkdis7IFRqQlDAwNKbk8YhJJak+ETzWVnKmsr664y
         dvcSujQkbywCX+hXwC+ANg2QtP5gsEphyMGi+2WbV7NkDhU1TiY4dWyEvB4Z0fAYddJo
         lYGe1CNXKL20VuuQ4c+6xKbG891agLKkhYHufm2PrzLNnobDjIEJPSlubK7EQCApEK59
         cGFk3ime58iKN3iGZ34XvO8qiTO/eNR33UmUrEvpGcF10Esvf2k4AGIu7+wIssaTQ62Z
         X42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GX797AFmM3s+1YM157AXWlwSY19WofQ9YjwF95Xr4tU=;
        b=Rw5e6UjtC5KWRXSREUgo56EkPtB8NNK23LaK/341tNHd0NzGYTcOjjaVyzy6IqfrSX
         W2f+g+R3MQznCC7CIX9re55kbtssZfhidR5GuIXmQoZ5BvmJNeb721MfA3Vcmvjj8IF8
         DzXpYQi0h0o4DdIGJYulQW09VAGaF9bvvrwXw1ZNCjpb+co65GT9OHatFtgzesNP5heR
         63kmwEnsC/FHcnpxPwvmQBL8/NhZyvCslCh8ZtCR2TaDmZ7TPLw8ClaovX7CsHCii71e
         mrsw7NSV9xGgqhwZtu6wilHGTwubdKVhrQSI8k5Vp7b4r1jOQL+sCpnAA2m2hoy1WtdV
         styw==
X-Gm-Message-State: AOAM531uddr29lJ7pRtAAsQFR2+wy85RFGbDCZWZ/aHLms3s23ZlpOhC
	hD8mqLmAORS5WkuZknKyGTOEgzYwWpl3ygfNmhW1sA==
X-Google-Smtp-Source: ABdhPJxnd60acizdCAGEnv992Wl6dWM0Q7PxYL3N/kxNEqTyV9ameaNZjST9UHZofhl2fnh8KrVLT/IIZmNa/mlIx6k=
X-Received: by 2002:ac8:675a:: with SMTP id n26mr4904690qtp.101.1620315060371;
 Thu, 06 May 2021 08:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com> <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com> <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
 <7a96d45e-2bdc-f699-96f7-3fbf607cb06b@redhat.com>
In-Reply-To: <7a96d45e-2bdc-f699-96f7-3fbf607cb06b@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 09:30:49 -0600
Message-ID: <CANCZdfrcv9ZUcBv7z+z3JPCjy0uzzY07VLmC4dqr5r8ba_QPLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000990e8e05c1aaff8d"
X-TUID: Cq5YozXGn6TL

--000000000000990e8e05c1aaff8d
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 9:12 AM Eric Blake <eblake@redhat.com> wrote:

> On 5/6/21 9:55 AM, Warner Losh wrote:
>
> >>> Where is this freed? Also, alloca just moves a stack pointer, where
> >> malloc
> >>> has complex interactions. Are you sure that's a safe change here?
> >>
> >> It's freed any time the g_autofree variable goes out of scope (that's
> >> what the g_autofree macro is for).  Yes, the change is safe, although
> >> you are right that switching to malloc is going to be a bit more
> >> heavyweight than what alloca used.  What's more, it adds safety: if
> >> count was under user control, a user could pass a value that could cause
> >> alloca to allocate more than 4k and accidentally mess up stack guard
> >> pages, while malloc() uses the heap and therefore cannot cause stack
> bugs.
> >>
> >
> > I'm not sure I understand that argument, since we're not compiling
> bsd-user
> > with the stack-smash-protection stuff enabled, so there's no guard pages
> > involved. The stack can grow quite large and the unmapped page at
> > the end of the stack would catch any overflows. Since these allocations
> > are on the top of the stack, they won't overflow into any other frames
> > and subsequent calls are made with them already in place.
>
> With alloca() on user-controlled size, the user can set up the size to
> be larger than the unmapped guard page, at which point you CANNOT catch
> the stack overflow because the alloca can skip the guard page and wrap
> into other valid memory.  Compiling with stack-smash-protection stuff
> enabled will catch such a bad alloca(); but the issue at hand here is
> not when stack-smash-protection is enabled, but the more common case
> when it is disabled (at which point the only protection you have is the
> guard page, but improper use of alloca() can bypass the guard page).
> Not all alloca() arguments are under user control, but it is easier as a
> matter of policy to blindly avoid alloca() than it is to audit which
> calls have safe sizes and therefore will not risk user control bypassing
> stack guards.
>

I'd forgotten that the gap pages are only a single page and things
may be mapped beyond that. For bsd-user, though, any issues that
this cause will be mitigated by the fact that it's running as the user
that we're emulating, so there's no privilege escalations that couldn't
already be hand-coded w/o bsd-user in the loop.


> >
> > malloc, on the other hand, involves taking out a number of mutexes
> > and similar things to obtain the memory, which may not necessarily
> > be safe in all the contexts system calls can be called from. System
> > calls are, typically, async safe and can be called from signal handlers.
> > alloca() is async safe, while malloc() is not. So changing the calls
> > from alloca to malloc makes calls to system calls in signal handlers
> > unsafe and potentially introducing buggy behavior as a result.
>
> Correct, use of malloc() is not safe within signal handlers. But these
> calls are not within signal handlers - or am _I_ missing something?  Is
> the point of *-user code to emulate syscalls that are reachable from
> code installed in a signal handler, at which point introducing an
> async-unsafe call to malloc in our emulation is indeed putting the
> application at risk of a malloc deadlock?
>

My concern is that the user emulation has some elements that are
based on catching signals and interpreting them to control execution
in the guest code. There's a number of places where signals are queued
instead of run right away as well. I've not had time to dive into the
complex implementation to make sure that we'll not wind up in a situation
where we would be trying to call malloc from a signal handler directly.
I'll try to find an answer to that as well.


> Ultimately, we're trading one maintenance headache (determining which
> alloca() size calls might be under user control) for another
> (determining that malloca() calls are not in a signal context), but the
> latter is far more common such that we can use existing tooling to make
> that conversion safely (both in the fact that the compiler has flags to
> warn about alloca() usage, and in the fact that Coverity is good at
> flagging improper uses of malloc() such as within a function reachable
> from something installed in a signal handler).  But I'm not familiar
> enough with the bsd/linux-user code to know if your point about having
> to use only async-safe functionalities is a valid limitation on our
> emulation.
>

Yea, my faith in Coverity flagging these when there's trips between,
say, arm binary code and user code isn't quite as high as yours.

But for the real answer, I need to contact the original authors of
this part of the code (they are no longer involved day-to-day in
the bsd-user efforts) to see if this scenario is possible or not. If
it's easy to find out that way, we can either know this is safe to
do, or if effort is needed to make it safe. At present, I've seen
enough and chatted enough with others to be concerned that
the change would break proper emulation.

Warner

--000000000000990e8e05c1aaff8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 9:12 AM Eric B=
lake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/6/21 9:=
55 AM, Warner Losh wrote:<br>
<br>
&gt;&gt;&gt; Where is this freed? Also, alloca just moves a stack pointer, =
where<br>
&gt;&gt; malloc<br>
&gt;&gt;&gt; has complex interactions. Are you sure that&#39;s a safe chang=
e here?<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s freed any time the g_autofree variable goes out of scope =
(that&#39;s<br>
&gt;&gt; what the g_autofree macro is for).=C2=A0 Yes, the change is safe, =
although<br>
&gt;&gt; you are right that switching to malloc is going to be a bit more<b=
r>
&gt;&gt; heavyweight than what alloca used.=C2=A0 What&#39;s more, it adds =
safety: if<br>
&gt;&gt; count was under user control, a user could pass a value that could=
 cause<br>
&gt;&gt; alloca to allocate more than 4k and accidentally mess up stack gua=
rd<br>
&gt;&gt; pages, while malloc() uses the heap and therefore cannot cause sta=
ck bugs.<br>
&gt;&gt;<br>
&gt; <br>
&gt; I&#39;m not sure I understand that argument, since we&#39;re not compi=
ling bsd-user<br>
&gt; with the stack-smash-protection stuff enabled, so there&#39;s no guard=
 pages<br>
&gt; involved. The stack can grow quite large and the unmapped page at<br>
&gt; the end of the stack would catch any overflows. Since these allocation=
s<br>
&gt; are on the top of the stack, they won&#39;t overflow into any other fr=
ames<br>
&gt; and subsequent calls are made with them already in place.<br>
<br>
With alloca() on user-controlled size, the user can set up the size to<br>
be larger than the unmapped guard page, at which point you CANNOT catch<br>
the stack overflow because the alloca can skip the guard page and wrap<br>
into other valid memory.=C2=A0 Compiling with stack-smash-protection stuff<=
br>
enabled will catch such a bad alloca(); but the issue at hand here is<br>
not when stack-smash-protection is enabled, but the more common case<br>
when it is disabled (at which point the only protection you have is the<br>
guard page, but improper use of alloca() can bypass the guard page).<br>
Not all alloca() arguments are under user control, but it is easier as a<br=
>
matter of policy to blindly avoid alloca() than it is to audit which<br>
calls have safe sizes and therefore will not risk user control bypassing<br=
>
stack guards.<br></blockquote><div><br></div><div>I&#39;d forgotten that th=
e gap pages are only a single page and things</div><div>may be mapped beyon=
d that. For bsd-user, though, any issues that</div><div>this cause will be =
mitigated by the fact that it&#39;s running as the user</div><div>that we&#=
39;re emulating, so there&#39;s no privilege=C2=A0escalations that couldn&#=
39;t</div><div>already be hand-coded w/o bsd-user in the loop.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; malloc, on the other hand, involves taking out a number of mutexes<br>
&gt; and similar things to obtain the memory, which may not necessarily<br>
&gt; be safe in all the contexts system calls can be called from. System<br=
>
&gt; calls are, typically, async safe and can be called from signal handler=
s.<br>
&gt; alloca() is async safe, while malloc() is not. So changing the calls<b=
r>
&gt; from alloca to malloc makes calls to system calls in signal handlers<b=
r>
&gt; unsafe and potentially introducing buggy behavior as a result.<br>
<br>
Correct, use of malloc() is not safe within signal handlers. But these<br>
calls are not within signal handlers - or am _I_ missing something?=C2=A0 I=
s<br>
the point of *-user code to emulate syscalls that are reachable from<br>
code installed in a signal handler, at which point introducing an<br>
async-unsafe call to malloc in our emulation is indeed putting the<br>
application at risk of a malloc deadlock?<br></blockquote><div><br></div><d=
iv>My concern is that the user emulation has some elements that are</div><d=
iv>based on catching signals and interpreting them to control execution</di=
v><div>in the guest code. There&#39;s a number of places where signals are =
queued</div><div>instead of run right away as well. I&#39;ve not had time t=
o dive into the</div><div>complex implementation to make sure that we&#39;l=
l not wind up in a situation</div><div>where we would be trying to call mal=
loc from a signal handler directly.</div><div>I&#39;ll try to find an answe=
r to that as well.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Ultimately, we&#39;re trading one maintenance headache (determining which<b=
r>
alloca() size calls might be under user control) for another<br>
(determining that malloca() calls are not in a signal context), but the<br>
latter is far more common such that we can use existing tooling to make<br>
that conversion safely (both in the fact that the compiler has flags to<br>
warn about alloca() usage, and in the fact that Coverity is good at<br>
flagging improper uses of malloc() such as within a function reachable<br>
from something installed in a signal handler).=C2=A0 But I&#39;m not famili=
ar<br>
enough with the bsd/linux-user code to know if your point about having<br>
to use only async-safe functionalities is a valid limitation on our<br>
emulation.<br></blockquote><div><br></div><div>Yea, my faith in Coverity fl=
agging these when there&#39;s trips between,</div><div>say, arm binary code=
 and user code isn&#39;t quite as high as yours.</div><div><br></div><div>B=
ut for the real answer, I need to contact the original authors of</div><div=
>this part of the code (they are no longer involved day-to-day in</div><div=
>the bsd-user efforts) to see if this scenario is possible or not. If</div>=
<div>it&#39;s easy to find out that way, we can either know this is safe to=
</div><div>do, or if effort is needed to make it safe. At present, I&#39;ve=
 seen</div><div>enough and chatted enough with others to be concerned that<=
/div><div>the change would break proper emulation.</div><div><br></div><div=
>Warner</div></div></div>

--000000000000990e8e05c1aaff8d--

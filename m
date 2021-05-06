Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1418547lfg;
        Thu, 6 May 2021 09:10:01 -0700 (PDT)
X-Received: by 2002:a05:622a:342:: with SMTP id r2mr5007812qtw.232.1620317401369;
        Thu, 06 May 2021 09:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620317401; cv=none;
        d=google.com; s=arc-20160816;
        b=N2nQ3DHArBdH+tyBAzNm98+B9f4Tl9wTPX1CFXp/omRC3Fq3DMJjGIlCSwrJmhYzYf
         w2AnfiwCO1p8bjRZkrqbR26lkEuw+DJ6wmulnH7Fd3D9tw1b6BQpXxjsq2Xhjp6Jnki/
         0GfP3JH7xSORBiFRIP3XJOCQ0eVDnjk0WAS4dbdkoRQbziw80a+3/jmc1nxa22FKtM/k
         cfWZglttnp/TWCEQw1soJ5kM5s9L32oWertDAtAHL2cRJrmWsgjzTFd4nfj3aOZLqWqo
         WCLWK+Usvz9orwdSnfN51Q2sA6O+Mr+ftW0GfMP/DA8kfMTzQvEErWHewIWxJsj8ObGM
         HMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NCd+sbLxL8J5MsAiRpj4Zr+jMkmIwW9j++dtwqp++EY=;
        b=tHT+Y9g0UFBjGnXEghe6G0qIZikKZpd7c9SCSRZIGOmxCHxcyCe0wNmqnRsJqWNmFU
         4gdrqxSwSPCxK14cR63vooxfyfgbCyNNILaEhy1X5j2ZUXZ1B2wXsoZpsFQeVEYVHAHa
         nsCOIXZxaq219JVryi1ugT/vCQ458JUbivpZvKDRPnCWLNW1AmloauG/lbnITAWA3g8t
         B3368vONFR8V3Oly83/LWF2mTzPQNc72N7K63zM5BGWNPHQVVKldwJptJ/sMZPmERx2Z
         IbLIihEDXKZRo+Uh/NTctqchkx8D823pBU+eGQc9iC06bZDGaeUOpebs5FCQjw+Evt1R
         2Gcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=GL7lAfB6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h10sor3217548qtp.54.2021.05.06.09.10.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 May 2021 09:10:01 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=GL7lAfB6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NCd+sbLxL8J5MsAiRpj4Zr+jMkmIwW9j++dtwqp++EY=;
        b=GL7lAfB6rTGJKOZi9HlViVXtzGEuEDzkk8gvpGQiIVWv4oxTDJUTnGa87tahTjbe29
         nKdOJdY4/MDCRl94V5FiFKUjnLHf2N4yPkxKWQDJMBxVLNoCHtcat9MW6aFEW3k0ry1+
         n0d3ws7vLL6+nPTyEkvOm8w4w31Nnm5zJDx5mHVIwYtkydDu2+ty9h7z6i5MMVpXyenI
         uPidLVUANgi+XahamsOmiR5fftj3QakhRGFuCtpniFFoEjmP+plghcotFKAOo4gp1W8M
         k7kiHePlVet1txhFs1pDrQzDbSbQnuGiRRG3HMwHY+kBQ5cRlHgI+QBNH4xjefeRaL1V
         fH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NCd+sbLxL8J5MsAiRpj4Zr+jMkmIwW9j++dtwqp++EY=;
        b=Ky8DQBuf/0tpUYJDQlLsKXh3Md9Gp5+817LPt341KyUnsk8oociTIO8FxztK+s3bAM
         SEhqAEFR1pwkxOTJZ4X4kVsrilIlNf9i1mWCjL4yjqVhbZcmmyfh5FlrpLcFi+xA/ecO
         7EmqesRXdhJsIZyw+yUfuLnhf1MKhlAIpWqb+r8KU1Y6WWw/vQpRJqRhsM/iVmU9Twi8
         4FcZjFZSxStTYwcEo4bcaLiWOCRagI2IP0U9Vg2ZvGhpWj4VlOLc3be+mHDopB9S9khF
         6kACMTolAA2ZPyeW5ZfxHAGEV3JwuEYeqWLDozxvNa5fPoPapTmxix5+q2v1mmYVSyLb
         dwOw==
X-Gm-Message-State: AOAM530+g+ufAkzEUVBuQFkLP6S7juz62QnJ8QNeH4JXiMOjL83Jp551
	FQLIMpRGlwaDMvSeeBiZC7VCDDDyjZ92K4c89tESIf2Gn6BlWQ==
X-Google-Smtp-Source: ABdhPJzoBpjYcTPGFGY9cqM0Isa4Jivf1NGg2QrqoVRH/0xXGKPAyON7Nw6XJqmInefyOQhvf1tz0B9rJSmKyl610VU=
X-Received: by 2002:ac8:5547:: with SMTP id o7mr4848674qtr.49.1620317400901;
 Thu, 06 May 2021 09:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com> <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com> <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
 <7a96d45e-2bdc-f699-96f7-3fbf607cb06b@redhat.com> <CANCZdfrcv9ZUcBv7z+z3JPCjy0uzzY07VLmC4dqr5r8ba_QPLw@mail.gmail.com>
 <adfc5da4-a615-24d7-0c67-f04d4eaec9a6@redhat.com> <CAFEAcA98KHKcGam1nukspYOQvPNXyq+hfsNbATpNvmDGoODN1A@mail.gmail.com>
In-Reply-To: <CAFEAcA98KHKcGam1nukspYOQvPNXyq+hfsNbATpNvmDGoODN1A@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 10:09:50 -0600
Message-ID: <CANCZdfoKiNAUpsRsWsWz8Yc22fs24+uQXkoN1yqRpbGFkQwFAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Blake <eblake@redhat.com>, kvm-devel <kvm@vger.kernel.org>, 
	Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001abe1705c1ab8b84"
X-TUID: JPaAKF84rsDA

--0000000000001abe1705c1ab8b84
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 10:04 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 6 May 2021 at 16:46, Eric Blake <eblake@redhat.com> wrote:
> >
> > On 5/6/21 10:30 AM, Warner Losh wrote:
> >
> > >
> > > But for the real answer, I need to contact the original authors of
> > > this part of the code (they are no longer involved day-to-day in
> > > the bsd-user efforts) to see if this scenario is possible or not. If
> > > it's easy to find out that way, we can either know this is safe to
> > > do, or if effort is needed to make it safe. At present, I've seen
> > > enough and chatted enough with others to be concerned that
> > > the change would break proper emulation.
> >
> > Do we have a feel for the maximum amount of memory being used by the
> > various alloca() replaced in this series?  If so, can we just
> > stack-allocate an array of bytes of the maximum size needed?
>
> In *-user the allocas are generally of the form "guest passed
> us a random number, allocate that many structs/whatevers". (In this
> specific bsd-user example it's the writev syscall and it's "however
> many struct iovecs the guest passed".) So there is no upper limit.
>
> The right thing to do here is probably to use g_try_malloc() and return
> ENOMEM or whatever on failure. The use of alloca, at least in the
> linux-user code, is purely old lazy coding based on "in practice
> real world guest binaries don't allocate very many of these so
> we can get away with shoving them on the stack".
>

I'll convert the ones in our fork to use that pattern prior to
upstreaming.

Warner

--0000000000001abe1705c1ab8b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 10:04 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 6 May 2021 at 16:46, Eric Blake &lt;<a href=3D"mailto:eblake@=
redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/6/21 10:30 AM, Warner Losh wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; But for the real answer, I need to contact the original authors o=
f<br>
&gt; &gt; this part of the code (they are no longer involved day-to-day in<=
br>
&gt; &gt; the bsd-user efforts) to see if this scenario is possible or not.=
 If<br>
&gt; &gt; it&#39;s easy to find out that way, we can either know this is sa=
fe to<br>
&gt; &gt; do, or if effort is needed to make it safe. At present, I&#39;ve =
seen<br>
&gt; &gt; enough and chatted enough with others to be concerned that<br>
&gt; &gt; the change would break proper emulation.<br>
&gt;<br>
&gt; Do we have a feel for the maximum amount of memory being used by the<b=
r>
&gt; various alloca() replaced in this series?=C2=A0 If so, can we just<br>
&gt; stack-allocate an array of bytes of the maximum size needed?<br>
<br>
In *-user the allocas are generally of the form &quot;guest passed<br>
us a random number, allocate that many structs/whatevers&quot;. (In this<br=
>
specific bsd-user example it&#39;s the writev syscall and it&#39;s &quot;ho=
wever<br>
many struct iovecs the guest passed&quot;.) So there is no upper limit.<br>
<br>
The right thing to do here is probably to use g_try_malloc() and return<br>
ENOMEM or whatever on failure. The use of alloca, at least in the<br>
linux-user code, is purely old lazy coding based on &quot;in practice<br>
real world guest binaries don&#39;t allocate very many of these so<br>
we can get away with shoving them on the stack&quot;.<br></blockquote><div>=
<br></div><div>I&#39;ll convert the ones in our fork to use that pattern pr=
ior to</div><div>upstreaming.</div><div><br></div><div>Warner=C2=A0</div></=
div></div>

--0000000000001abe1705c1ab8b84--

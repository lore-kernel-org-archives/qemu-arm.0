Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1354136lfg;
        Thu, 6 May 2021 08:02:56 -0700 (PDT)
X-Received: by 2002:a05:620a:14b5:: with SMTP id x21mr4506608qkj.298.1620313375822;
        Thu, 06 May 2021 08:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620313375; cv=none;
        d=google.com; s=arc-20160816;
        b=XQch2kA12tORnvT5OHDeKuqHFAyBSBrwhcfczwD07suWFamUVkU/lNMRmH0zlNfbZy
         LIGaCX/Loll/h8hPUa6xtuUvwa3UE25J18i8x94gd1oYdQj8s5c15xXvupX6kSzqoEpg
         b/s397N+h0CTKIc63hSwIkrhXIPDY1XaF2ssRr/AMTL3Mg3e/kAXEjmYJXdD5W1Ut4oa
         8OFBMbzBLEw9AmlmR8fuuTb6EFFMJDgubxT2/LlInRLwR35latujTYS6mN/0M5qRTW+n
         7tUrpaAS+neq7+oITSAlLG90g9CW5ArPOvTRGwxL4V7xFCAOsawQypHbEAuLo/S3yow2
         XNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MabAK/g5cNmzXRETy3iDaApe00pbCdj4KZbN8L2M0u4=;
        b=j/v0Pc0ZZa2NLPsE0AfPHe//NZXECQQtlIDJQ9y1calFMnPxNwsFfQ1PSjr3k/FWVK
         Nd0qYxKW4EAIjuS5dr9pXcBsYRS+ieRSR/eFfw82RvuIlnnPCTGGPWbEZ2ZxAW0mcQdh
         Hd57B90/vbbDz/8DlaD8tlQM+FCASd4rUvIC/T0GF0lM15pZD9twNHeb4lrA27j4h+2e
         tOwpsyPlc5ryPsYe15l5vIYGU6kgL4ngt3RlPIku3oqrxAjbP0paZEcgN91+UnxtkRAY
         PEht3/FO/PtmAwZXGhBiOtl4v8bm4CP3luWrmTn6nYmiZTIO76vdh5M+XBvjtqxOAwYG
         w12Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b="RVBa/ODy";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c81sor1302213qke.192.2021.05.06.08.02.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 May 2021 08:02:55 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b="RVBa/ODy";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MabAK/g5cNmzXRETy3iDaApe00pbCdj4KZbN8L2M0u4=;
        b=RVBa/ODySJagWuX0iXnRDS3Frmi4+iSDYoJU+4VY+lkI2jiGAIr6T7dvUpnlLU8ETU
         DsN2sYMqvUxazR2R5E4RYxUcNM8B4P82Fj2rxLDgu0nbvijiL9MdKe05UAXjw6Wa3mK6
         eEhe/uEZZuNXasK+C7CmQoD/9ji22em2kHfongFTtc5Rg0yASAnagX+Scot1TxaMu2kG
         o4zR6gugu6lBDE58pmAlX3pGTN4w1ZwdP7rKcvm4YPgOSqU5tjGqVyjM57Qhk/9FWxNd
         SLAE0HSCQDN6PT1bWGUPx1vRxE8sFV05IMYcHibhLc55EIiiFvUljIxosOe58KTaHpep
         UpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MabAK/g5cNmzXRETy3iDaApe00pbCdj4KZbN8L2M0u4=;
        b=sp/gRrpJnUnhiGqeY/dZn2dFxDt81WNDvCaylTA9Rr6Xbhekp5J6IXojJuzxKg5TSC
         Bf9tnbZXMsj9BWn4ZORtFf492yJpK6snKZ/Sm6d1mrt1OsNbbInWMJKedDyTF1SWz8k2
         ri8xSe9G9xNgRw0QcOyJWfYHsnN0PYuys712DOyyHzJ5TQBdhh3qNQyag5Xn7EkuilJ5
         eOE+a8ELKaUO21MXaqB09LAAvKiI7yd0jmts7+YhYw7pF8cC71oUJxyi/CZQlRW07J5L
         bq5cdp6DLJ2+5+4U9gjE7JSLa4wNOMnsAaFoo3odCkFwtDNVgU+RhBARP4q02/aVF6sn
         qrFQ==
X-Gm-Message-State: AOAM532IQlYjMMMyh/aLw68vHJBV4JFz5Odd06iDn6T7G7nXHjUAAxKR
	nCqCeO549g8+VPWU04J5yl+Snfa+76Cph2jG6XMubA==
X-Google-Smtp-Source: ABdhPJyq8Xf9IQT/m6wGxmV64FmuX9THavvxcdNC45y4FY5uRbj+gKx3J16lZhCaMT3LmPgxG921QmmdALrcP2uftb4=
X-Received: by 2002:a37:c444:: with SMTP id h4mr2147609qkm.206.1620313375405;
 Thu, 06 May 2021 08:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com> <CANCZdfqiHxQoG+g3bq_KL01yWCHUbF5qxJWN=sD37h7UJFMZ7g@mail.gmail.com>
 <476d8b44-cba3-4bf2-d93c-d35736d316c6@redhat.com>
In-Reply-To: <476d8b44-cba3-4bf2-d93c-d35736d316c6@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 09:02:44 -0600
Message-ID: <CANCZdfpix=43UEXh2ojvtcHEKpNmciCgtjHvDYSkxnOUwqbYuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] misc: Replace alloca() by g_malloc()
To: Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	kvm-devel <kvm@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002a962b05c1aa9b29"
X-TUID: bNfjXQ6RrFRo

--0000000000002a962b05c1aa9b29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 8:28 AM Eric Blake <eblake@redhat.com> wrote:

> On 5/6/21 9:22 AM, Warner Losh wrote:
> > On Thu, May 6, 2021 at 7:39 AM Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com
> >
> > wrote:
> >
> >> The ALLOCA(3) man-page mentions its "use is discouraged".
> >> Replace few calls by equivalent GLib malloc().
> >>
> >
> > Except g_alloc and g_malloc are not at all the same, and you can't drop
> in
> > replace one with the other.
> >
> > g_alloc allocates stack space on the calling frame that's automatically
> > freed when the function returns.
> > g_malloc allocates space from the heap, and calls to it must be matched
> > with calls to g_free().
> >
> > These patches don't do the latter, as far as I can tell, and so introdu=
ce
> > memory leaks unless there's something I've missed.
>
> You missed the g_autofree, whose job is to call g_free() on all points
> in the control flow where the malloc()d memory goes out of scope
> (equivalent in expressive power to alloca()d memory going out of scope).
>  Although the code is arguably a bit slower (as heap manipulations are
> not as cheap as stack manipulations), in the long run that speed penalty
> is worth the safety factor (since stack manipulations under user control
> are inherently unsafe).
>

Yea, I had missed that. Too many years of reviewing patches that
came in for other projects that didn't use that feature. Outside of the
bsd-user context, I'd agree with you that things are safer this way.
But emulating system calls has other considerations, that I've gone
into in another thread.

So please accept my apology for not noticing the g_autofree
in these. It definitely makes what I said here incorrect and
it should be ignored...

Warner

--0000000000002a962b05c1aa9b29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 8:28 AM Eric B=
lake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/6/21 9:=
22 AM, Warner Losh wrote:<br>
&gt; On Thu, May 6, 2021 at 7:39 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<b=
r>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;=
.<br>
&gt;&gt; Replace few calls by equivalent GLib malloc().<br>
&gt;&gt;<br>
&gt; <br>
&gt; Except g_alloc and g_malloc are not at all the same, and you can&#39;t=
 drop in<br>
&gt; replace one with the other.<br>
&gt; <br>
&gt; g_alloc allocates stack space on the calling frame that&#39;s automati=
cally<br>
&gt; freed when the function returns.<br>
&gt; g_malloc allocates space from the heap, and calls to it must be matche=
d<br>
&gt; with calls to g_free().<br>
&gt; <br>
&gt; These patches don&#39;t do the latter, as far as I can tell, and so in=
troduce<br>
&gt; memory leaks unless there&#39;s something I&#39;ve missed.<br>
<br>
You missed the g_autofree, whose job is to call g_free() on all points<br>
in the control flow where the malloc()d memory goes out of scope<br>
(equivalent in expressive power to alloca()d memory going out of scope).<br=
>
=C2=A0Although the code is arguably a bit slower (as heap manipulations are=
<br>
not as cheap as stack manipulations), in the long run that speed penalty<br=
>
is worth the safety factor (since stack manipulations under user control<br=
>
are inherently unsafe).<br></blockquote><div><br></div><div>Yea, I had miss=
ed that. Too many years of reviewing patches that</div><div>came in for oth=
er projects that didn&#39;t use that feature. Outside of the</div><div>bsd-=
user context, I&#39;d agree with you that things are safer this way.</div><=
div>But emulating system calls has other considerations, that I&#39;ve gone=
</div><div>into in another thread.</div><div><br></div><div>So please accep=
t my apology for not noticing the g_autofree</div><div>in these. It definit=
ely=C2=A0makes what I said here incorrect and</div><div>it should be ignore=
d...</div><div><br></div><div>Warner</div></div></div>

--0000000000002a962b05c1aa9b29--

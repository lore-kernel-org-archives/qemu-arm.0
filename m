Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1659562ejb;
        Fri, 17 Feb 2023 08:35:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+t1Yye9sl3ERYqhs+DmwI/17T2rASqVlSuguJ8XaMV3qK+13w8qarBoW3KkZXjDtnLSUjd
X-Received: by 2002:ac8:5711:0:b0:3b9:ec46:bf95 with SMTP id 17-20020ac85711000000b003b9ec46bf95mr2191264qtw.49.1676651758710;
        Fri, 17 Feb 2023 08:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676651758; cv=none;
        d=google.com; s=arc-20160816;
        b=JG/b2X1HraR/SPw2dkmMxpNz40P5vZCquMf9nLBjxQLlwDdonpDnQnc0FIZ672awW/
         5sZcXmoEILiVCME33jAAPi45yhCAvTt3MiPaHhOW5XKV1dLW9rRy3DzXwni0AwTkdII0
         genlGtGkMZTJUxLU4z6GWe5CbP0o+lZFQDMgHLjn5ki6AabfP4o0wnN8zpoo7VVTMvLF
         hjrFnku0Yi2ODk9HyYaqeu1UGDzDrbRxwXEo5w3iCTOJKQqEeJAysQmhPiCtu5VeiyBW
         MmpdHdc5kc4NBEwC/LdTsUgdWlHDTdLBJYM8yWLZkTxlzQMt4MfqDJ4bAxYTYPvwbqFF
         fZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uJbQLb5EaKoLhLqN+hIHDXoiAwO6kPoe91m4bbqfh5o=;
        b=vVrN2OEY2A4h9706Rmvho2/gP8JsjmhSyFshaJ4kcg0mkj5dGdyOCJwjRcGHsoUd0s
         FdSWy2NZDSNiGNd7NoK5Ibq3tOqbDlUZHtnTh97lJ0uHJ56QzujdHevGuFswxYAf4Mf5
         gg+u8H+YSVsb49DTpbkTAQlF+cMLgMM6Eqee5KXnJcRwr4cMbiznKQZo/tfJtquoR6+5
         iDxZBVOQoHKB2/yAs0loE3mHC6tKWMFOkBMIpumOD/4eoESFey/L4o4VjnKzg17isU7r
         MNgtmooEruRnnvVLonG866mgkAdH4Y2lUilo5LZmSActQAJSa78LyONi6DicK1FX9Zjf
         W/4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnIwXHVX;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w19-20020a05620a0e9300b0070668df333esi3522978qkm.98.2023.02.17.08.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 08:35:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnIwXHVX;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676651758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uJbQLb5EaKoLhLqN+hIHDXoiAwO6kPoe91m4bbqfh5o=;
	b=fnIwXHVXxJk+KFR3X4p4ar9efKMwhqQguF4uCaoLRw2Sp4h+aP1ryXBtceVNG8mTU8DceE
	Tl4oOuf8f94NoqQGcb+tmUK/xykL0uZbyftWQOHDb+axNJvc32lY3WQl4yuM/3S73zAMrg
	k9Jato90hw+FRoa/sFU8HlSKr3ImKLo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-ypO66kSDMoej6JhKFPBDfg-1; Fri, 17 Feb 2023 11:35:56 -0500
X-MC-Unique: ypO66kSDMoej6JhKFPBDfg-1
Received: by mail-pf1-f200.google.com with SMTP id a3-20020a056a001d0300b005ac41980708so16042pfx.7
        for <alex.bennee@linaro.org>; Fri, 17 Feb 2023 08:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJbQLb5EaKoLhLqN+hIHDXoiAwO6kPoe91m4bbqfh5o=;
        b=cZsR/F85ufTa1HK3N7YhBR5jQO/KNqrfA2pYyp5QpceYR6+uXxQvJfoVDR6zXTta5w
         nJw91pY4Nf6tkORdLjg4q61EsdFPoYJY6FS2OdZIzeIhZdPkCESAxOXKMXFasyOgxsvE
         UpDqMN0KL3Du2yhgWLkn14YZdkUCLmBZojNXEJ8fHWmXdNU6JcJ+OUzHUD6pClxMFH9a
         3RiZw5UeKQwdvTQ6ZyQ8K79S/TOrbQiIBp9Y462apaE1srieYgG4z9/rMOvGO/ypk0Bj
         DtvAPPpYHjLkUMRiCfrxnazTxfxoqGzjydBcjKU0QuzNEkgeJTK7WX8rThTIHwcbA/UH
         J6mw==
X-Gm-Message-State: AO0yUKXBPKVZfrQJlXsZOl6Ra9Qu9PWunpINRnaR0rUt1tibEe5QyvYw
	MclQYgJFA3OTO9dn0iog+4FLYradCvYxa48d21Wl6JpTRx5E05lbBy4QqRADQQwt8fRf1yiL1YE
	ffHJtW6sO76Don9yFjzLHIXz88BGILWU3
X-Received: by 2002:a17:902:d489:b0:19a:9b8c:279f with SMTP id c9-20020a170902d48900b0019a9b8c279fmr152333plg.26.1676651755840;
        Fri, 17 Feb 2023 08:35:55 -0800 (PST)
X-Received: by 2002:a17:902:d489:b0:19a:9b8c:279f with SMTP id
 c9-20020a170902d48900b0019a9b8c279fmr152326plg.26.1676651755535; Fri, 17 Feb
 2023 08:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org> <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
 <Y+6HjEUG2fpalQWv@redhat.com>
In-Reply-To: <Y+6HjEUG2fpalQWv@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Feb 2023 11:35:44 -0500
Message-ID: <CAFn=p-b8nK8pNWk3WZgVqjUMx27E4ekeypjGpyk2nrRz=UmNJg@mail.gmail.com>
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
	Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Darren Kenny <darren.kenny@oracle.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Yonggang Luo <luoyonggang@gmail.com>, 
	Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Ed Maste <emaste@freebsd.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004d115c05f4e7e8ba"
X-TUID: 7hjrzD1b19jX

--0000000000004d115c05f4e7e8ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023, 2:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:
> > On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g>
> wrote:
> > >
> > > The 22.04 LTS release has been out for almost a year now so its time
> > > to update all the remaining images to the current LTS. We can also
> > > drop some hacks we need for older clang TSAN support.
> >
> > We still support Ubuntu 20.04 until 2024 though, don't we? Is it safe
> > to not test this platform?
> >
> > I've long been uncertain about what our policy actually is for docker
> > tests, if we want to test every platform we support or only some of
> > them; and if it's only some of them, when do we choose the older and
> > when do we choose the newer?
>
> Ideally we would test both the oldest & newest versions of each
> distro we support. Practically though, we're compromised by the
> limited CI resources available.
>

Yes, understood.


> Dropping older Ubuntu images is a reasonable tradeoff, since we
> still have Debian images covered in CI. Debian can be thought
> of as an older version of Ubuntu to some extent, giving coverage
> that will mitigate the risks of dropping 20.04.
>

Okay, I'll take your word for that. I am not personally familiar with how
much those distros diverge; I know Ubuntu is debian-based but that's the
extent of my knowledge as I don't daily-drive either.

So, firstly:

Reviewed-by: John Snow <jsnow@redhat.com>

because I suspect we all have our reasons and I also agree testing newer is
generally of higher value than testing older.

However, would it be possible to keep the older Ubuntu test as a manual
execution that we could invoke at will, only during RC testing phase? If
it's not a lot of work, I could even check that in myself as a follow-up if
it isn't unwanted.

I find that "oldest version of x" is quite useful to me for testing Python
stuff in particular, as that ecosystem moves pretty fast. It'd be mighty
convenient to me in particular to keep an old Ubuntu test around to run
manually as needed.

(Heck, even if it wasn't on CI at all but was just a container I could run
locally, that would still be quite useful.)

Whaddaya think?


> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000004d115c05f4e7e8ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 16, 2023, 2:44 PM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"norefer=
rer">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:<br>
&gt; On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org" rel=3D"noreferrer noreferrer" target=3D"_blank">al=
ex.bennee@linaro.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The 22.04 LTS release has been out for almost a year now so its t=
ime<br>
&gt; &gt; to update all the remaining images to the current LTS. We can als=
o<br>
&gt; &gt; drop some hacks we need for older clang TSAN support.<br>
&gt; <br>
&gt; We still support Ubuntu 20.04 until 2024 though, don&#39;t we? Is it s=
afe<br>
&gt; to not test this platform?<br>
&gt; <br>
&gt; I&#39;ve long been uncertain about what our policy actually is for doc=
ker<br>
&gt; tests, if we want to test every platform we support or only some of<br=
>
&gt; them; and if it&#39;s only some of them, when do we choose the older a=
nd<br>
&gt; when do we choose the newer?<br>
<br>
Ideally we would test both the oldest &amp; newest versions of each<br>
distro we support. Practically though, we&#39;re compromised by the<br>
limited CI resources available.<br></blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Yes, understood.=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Dropping older Ubuntu images is a reasonable tradeoff, since we<br>
still have Debian images covered in CI. Debian can be thought<br>
of as an older version of Ubuntu to some extent, giving coverage<br>
that will mitigate the risks of dropping 20.04.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Okay, I&#39;ll take your wor=
d for that. I am not personally familiar with how much those distros diverg=
e; I know Ubuntu is debian-based but that&#39;s the extent of my knowledge =
as I don&#39;t daily-drive either.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">So, firstly:</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_b=
lank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">because I suspect we all have our reasons and I a=
lso agree testing newer is generally of higher value than testing older.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">However, would it be possi=
ble to keep the older Ubuntu test as a manual execution that we could invok=
e at will, only during RC testing phase? If it&#39;s not a lot of work, I c=
ould even check that in myself as a follow-up if it isn&#39;t unwanted.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I find that &quot;oldest ve=
rsion of x&quot; is quite useful to me for testing Python stuff in particul=
ar, as that ecosystem moves pretty fast. It&#39;d be mighty convenient to m=
e in particular to keep an old Ubuntu test around to run manually as needed=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(Heck, even if it wasn=
&#39;t on CI at all but was just a container I could run locally, that woul=
d still be quite useful.)</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Whaddaya think?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer noreferrer=
" target=3D"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =
=C2=A0 <a href=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">https://www.flickr.com/photos/db=
errange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138=
.berrange.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=
=C2=A0 =C2=A0 <a href=3D"https://www.instagram.com/dberrange" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">https://www.instagram.com/dbe=
rrange</a> :|<br>
<br>
</blockquote></div></div></div>

--0000000000004d115c05f4e7e8ba--

Received: by 2002:a17:906:3a49:b0:7ae:545a:c862 with SMTP id a9csp1290611ejf;
        Fri, 17 Feb 2023 09:20:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+I32+S4R9bao8zb5+86IdGR9I0ezj8s/zFtvBLvnMwsc1NKJeydYCGJZvjlsaFbDjl8zqe
X-Received: by 2002:a25:9cc8:0:b0:860:50db:6144 with SMTP id z8-20020a259cc8000000b0086050db6144mr9394539ybo.0.1676654424877;
        Fri, 17 Feb 2023 09:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676654424; cv=none;
        d=google.com; s=arc-20160816;
        b=XG6RC6P1Hx5W/xMyP10FnDbd/V+Da7yZzhqIU8RXfwhMBjhkn4vUej21oEjiTUgj91
         vygIibkVC+jDCDFZLNWPnDx+nA8vCmH6uXs+Eu5jWFLvHg/KSf/LbOhA8C44CZXS0GJh
         aoKs2LI9eO+8ZTrZUgbvshnZTnG9Ye7pBhNoYodUi2EFzGdeW3dOg5NgwAy1/N+YSgTH
         0cM5Q/tiRId094Xx8b6aOsY4IzNYSNHwL2r3Guh/5vacu1EMqNZ6nuabUnv/GY0TDAIr
         9c995iuX6EQCUivbdll3kU2XvJvVbrqWri+YuzmIHz1+dw+gvq6CJKyEEm0J+W3wAYSf
         qplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rrNBA+lSALqNi/As7CgzIcbUDVGfEvNNfH3TuToQ+pM=;
        b=0OVp6tlGRSHQh0QYsilPcmH4EPwrvRCtIemXkL60e36fbC9cv7+jMNy88LjfXPfTnP
         UohDUGaZ6LP00x8UlneOtXtFBwqI2kFuXZMzNyC7dMBMSEIBAfPpBJT0gE2dnVJUUZSY
         axoIXIBxyUz+bKHeM3pBUYjurBlNYuXTm8mS6wlzwTlVZ34Bbg5Jgfb0xe+L+Nx1K9Hl
         8bhmuzDb905VhbrU7cVFRGMJ2JWq/IsJI7Cihqggr05EBYhbVInfq7Av6fclU8ywip0F
         1VljQ9F2zFf4N1ZReQJhYJ2xnWfWxqlmbCmBtWo1DviGBG3cGlybj9o+PGzZAfaS6Qrr
         QMDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M1YPs9RO;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e12-20020a5b088c000000b0070be41b7538si6089106ybq.24.2023.02.17.09.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 09:20:24 -0800 (PST)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M1YPs9RO;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676654424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rrNBA+lSALqNi/As7CgzIcbUDVGfEvNNfH3TuToQ+pM=;
	b=M1YPs9ROpwIve5OFWo9bfM8ajbbjcy3a38pW9nn6QiKvaBy2w5rfQuUAgwCq1kaQk0Z+3m
	hxnExsPf+XskgwyaSTgK508MlXkqXjEMwXB/ln3BoRFeJ6RlSV/849wjsVDfuP0+aiSjyp
	2gHiTEp6ztTwkNcBNKCQv3bi23ZfCSQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-RixpJorBOOa_-IqDX8Rsig-1; Fri, 17 Feb 2023 12:20:20 -0500
X-MC-Unique: RixpJorBOOa_-IqDX8Rsig-1
Received: by mail-pf1-f198.google.com with SMTP id cm17-20020a056a00339100b005a8ee90fbc6so992403pfb.4
        for <alex.bennee@linaro.org>; Fri, 17 Feb 2023 09:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrNBA+lSALqNi/As7CgzIcbUDVGfEvNNfH3TuToQ+pM=;
        b=8FLKSTB4gnga7Abf2Ui8CJBDmE1Fb/CTUZEqod4NgB9A5gQKxaU49k6T1WXYGQt6S8
         9KBCSlenTyGnpCz7Jz0tTCDAdNwNi1uQacr6mon+uv307HXOhPwShhpUFEu7qI38+1aZ
         MQln3H/FBwe5J46snw/EVeroBYTlINsnbayJcWERn1/BBjEcM1vKuFqckz9N6GNQE6mU
         SPbS9hMQpE/1qTHNNTSkzALb2GJpM2gbGdSuLsMUhh0+Th4AwtpbNtt/HZ4K/zY7pSsb
         qJJnBIbrHibGTgrtAYju0Fg8lHy9YsxaKmbnzRMwLv5NeVMBNx6pbBboy6xl6daNZV7v
         nZ3A==
X-Gm-Message-State: AO0yUKV+39tbd/ews8GZvRqqDW7ABUDkGRvhxsJcLuKdfTUfRORLlBbR
	veC5Ivc7ziHQ6Tt6zVdc/t8cddkjdT1Xd2E97I2YKo2QMb9sThAx6u/GDwr48l7FR5QImxJMCwe
	QWYnozbx3dbYrQNGjVB8w5UxWANqd2s15
X-Received: by 2002:a17:902:d489:b0:19a:9b8c:279f with SMTP id c9-20020a170902d48900b0019a9b8c279fmr172778plg.26.1676654419925;
        Fri, 17 Feb 2023 09:20:19 -0800 (PST)
X-Received: by 2002:a17:902:d489:b0:19a:9b8c:279f with SMTP id
 c9-20020a170902d48900b0019a9b8c279fmr172760plg.26.1676654419639; Fri, 17 Feb
 2023 09:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org> <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
 <Y+6HjEUG2fpalQWv@redhat.com> <CAFn=p-b8nK8pNWk3WZgVqjUMx27E4ekeypjGpyk2nrRz=UmNJg@mail.gmail.com>
 <Y++2AK5cDgCGkpVN@redhat.com>
In-Reply-To: <Y++2AK5cDgCGkpVN@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Feb 2023 12:20:08 -0500
Message-ID: <CAFn=p-ZhChwa-y8JCNRLyyVGZZWvtqFcUpcJB3a3DPgiPLME=Q@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000018209605f4e887ab"
X-TUID: dhidT1TNS3AZ

--00000000000018209605f4e887ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023, 12:14 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Fri, Feb 17, 2023 at 11:35:44AM -0500, John Snow wrote:
> > On Thu, Feb 16, 2023, 2:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> > wrote:
> >
> > > On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:
> > > > On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e <alex.bennee@linar=
o.org>
> > > wrote:
> > > > >
> > > > > The 22.04 LTS release has been out for almost a year now so its
> time
> > > > > to update all the remaining images to the current LTS. We can als=
o
> > > > > drop some hacks we need for older clang TSAN support.
> > > >
> > > > We still support Ubuntu 20.04 until 2024 though, don't we? Is it sa=
fe
> > > > to not test this platform?
> > > >
> > > > I've long been uncertain about what our policy actually is for dock=
er
> > > > tests, if we want to test every platform we support or only some of
> > > > them; and if it's only some of them, when do we choose the older an=
d
> > > > when do we choose the newer?
> > >
> > > Ideally we would test both the oldest & newest versions of each
> > > distro we support. Practically though, we're compromised by the
> > > limited CI resources available.
> > >
> >
> > Yes, understood.
> >
> >
> > > Dropping older Ubuntu images is a reasonable tradeoff, since we
> > > still have Debian images covered in CI. Debian can be thought
> > > of as an older version of Ubuntu to some extent, giving coverage
> > > that will mitigate the risks of dropping 20.04.
> > >
> >
> > Okay, I'll take your word for that. I am not personally familiar with h=
ow
> > much those distros diverge; I know Ubuntu is debian-based but that's th=
e
> > extent of my knowledge as I don't daily-drive either.
> >
> > So, firstly:
> >
> > Reviewed-by: John Snow <jsnow@redhat.com>
> >
> > because I suspect we all have our reasons and I also agree testing newe=
r
> is
> > generally of higher value than testing older.
> >
> > However, would it be possible to keep the older Ubuntu test as a manual
> > execution that we could invoke at will, only during RC testing phase? I=
f
> > it's not a lot of work, I could even check that in myself as a follow-u=
p
> if
> > it isn't unwanted.
> >
> > I find that "oldest version of x" is quite useful to me for testing
> Python
> > stuff in particular, as that ecosystem moves pretty fast. It'd be might=
y
> > convenient to me in particular to keep an old Ubuntu test around to run
> > manually as needed.
> >
> > (Heck, even if it wasn't on CI at all but was just a container I could
> run
> > locally, that would still be quite useful.)
> >
> > Whaddaya think?
>
> It would be pretty trivial to have tests/docker/dockerfiles contain
> Dockerfiles for *every* supported distro version we have, and then
> only build & test a subset in CI. It would merely suggest that we
> change our naming convention so the dockerfiles in that dir include
> the version. Basically adopting the standard libvirt-ci naming
> convention for targets of $OSNAME-$OSVERSION:
>
> $ lcitool targets
> almalinux-8
> almalinux-9
> alpine-315
> alpine-316
> alpine-edge
> centos-stream-8
> centos-stream-9
> debian-10
> debian-11
> debian-sid
> fedora-36
> fedora-37
> fedora-rawhide
> freebsd-12
> freebsd-13
> freebsd-current
> macos-12
> macos-13
>

Wait, what? How does this work??

opensuse-leap-153
> opensuse-leap-154
> opensuse-tumbleweed
> ubuntu-1804
> ubuntu-2004
> ubuntu-2204
>
> Contributors can then use 'make docker-XXXX' to run build tests
> locally on specific distros when they need to test something
> that isn't covered by default in out gating CI
>

OK, I might follow up on this, then. I would find this useful for proving
certain python build system changes are not disruptive.

In contrast to C world, I find modern Pythonisms sneak in with quite an
increased frequency, so having manual testing for the oldest platforms has
some value there, but only every once in a while. Not worth our CI minutes.

Carry on as normal for this series, please and thank you!


>
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

--00000000000018209605f4e887ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 17, 2023, 12:14 PM Daniel P. Berrang=C3=A9=
 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Fri, Feb 17, 2023 at 11:35:4=
4AM -0500, John Snow wrote:<br>
&gt; On Thu, Feb 16, 2023, 2:44 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D"m=
ailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@re=
dhat.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:<br>
&gt; &gt; &gt; On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">ale=
x.bennee@linaro.org</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The 22.04 LTS release has been out for almost a year no=
w so its time<br>
&gt; &gt; &gt; &gt; to update all the remaining images to the current LTS. =
We can also<br>
&gt; &gt; &gt; &gt; drop some hacks we need for older clang TSAN support.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We still support Ubuntu 20.04 until 2024 though, don&#39;t w=
e? Is it safe<br>
&gt; &gt; &gt; to not test this platform?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve long been uncertain about what our policy actually =
is for docker<br>
&gt; &gt; &gt; tests, if we want to test every platform we support or only =
some of<br>
&gt; &gt; &gt; them; and if it&#39;s only some of them, when do we choose t=
he older and<br>
&gt; &gt; &gt; when do we choose the newer?<br>
&gt; &gt;<br>
&gt; &gt; Ideally we would test both the oldest &amp; newest versions of ea=
ch<br>
&gt; &gt; distro we support. Practically though, we&#39;re compromised by t=
he<br>
&gt; &gt; limited CI resources available.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, understood.<br>
&gt; <br>
&gt; <br>
&gt; &gt; Dropping older Ubuntu images is a reasonable tradeoff, since we<b=
r>
&gt; &gt; still have Debian images covered in CI. Debian can be thought<br>
&gt; &gt; of as an older version of Ubuntu to some extent, giving coverage<=
br>
&gt; &gt; that will mitigate the risks of dropping 20.04.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Okay, I&#39;ll take your word for that. I am not personally familiar w=
ith how<br>
&gt; much those distros diverge; I know Ubuntu is debian-based but that&#39=
;s the<br>
&gt; extent of my knowledge as I don&#39;t daily-drive either.<br>
&gt; <br>
&gt; So, firstly:<br>
&gt; <br>
&gt; Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; <br>
&gt; because I suspect we all have our reasons and I also agree testing new=
er is<br>
&gt; generally of higher value than testing older.<br>
&gt; <br>
&gt; However, would it be possible to keep the older Ubuntu test as a manua=
l<br>
&gt; execution that we could invoke at will, only during RC testing phase? =
If<br>
&gt; it&#39;s not a lot of work, I could even check that in myself as a fol=
low-up if<br>
&gt; it isn&#39;t unwanted.<br>
&gt; <br>
&gt; I find that &quot;oldest version of x&quot; is quite useful to me for =
testing Python<br>
&gt; stuff in particular, as that ecosystem moves pretty fast. It&#39;d be =
mighty<br>
&gt; convenient to me in particular to keep an old Ubuntu test around to ru=
n<br>
&gt; manually as needed.<br>
&gt; <br>
&gt; (Heck, even if it wasn&#39;t on CI at all but was just a container I c=
ould run<br>
&gt; locally, that would still be quite useful.)<br>
&gt; <br>
&gt; Whaddaya think?<br>
<br>
It would be pretty trivial to have tests/docker/dockerfiles contain<br>
Dockerfiles for *every* supported distro version we have, and then<br>
only build &amp; test a subset in CI. It would merely suggest that we<br>
change our naming convention so the dockerfiles in that dir include<br>
the version. Basically adopting the standard libvirt-ci naming<br>
convention for targets of $OSNAME-$OSVERSION:<br>
<br>
$ lcitool targets<br>
almalinux-8<br>
almalinux-9<br>
alpine-315<br>
alpine-316<br>
alpine-edge<br>
centos-stream-8<br>
centos-stream-9<br>
debian-10<br>
debian-11<br>
debian-sid<br>
fedora-36<br>
fedora-37<br>
fedora-rawhide<br>
freebsd-12<br>
freebsd-13<br>
freebsd-current<br>
macos-12<br>
macos-13<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Wait, what? How does this work??</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
opensuse-leap-153<br>
opensuse-leap-154<br>
opensuse-tumbleweed<br>
ubuntu-1804<br>
ubuntu-2004<br>
ubuntu-2204<br>
<br>
Contributors can then use &#39;make docker-XXXX&#39; to run build tests<br>
locally on specific distros when they need to test something<br>
that isn&#39;t covered by default in out gating CI<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">OK, I might follow up on =
this, then. I would find this useful for proving certain python build syste=
m changes are not disruptive.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">In contrast to C world, I find modern Pythonisms sneak in with quite =
an increased frequency, so having manual testing for the oldest platforms h=
as some value there, but only every once in a while. Not worth our CI minut=
es.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Carry on as normal f=
or this series, please and thank you!</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--00000000000018209605f4e887ab--

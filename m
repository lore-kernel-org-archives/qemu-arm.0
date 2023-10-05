Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp370062ejc;
        Thu, 5 Oct 2023 07:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYtwhINC0fUcJztTHAUUB94W6QmZvmJ6jAwcTFZw6Zn8ySbF4UE4XNIQtPARHeT9r6jNgK
X-Received: by 2002:ac2:5b1b:0:b0:503:2924:f8dd with SMTP id v27-20020ac25b1b000000b005032924f8ddmr5071180lfn.47.1696517757338;
        Thu, 05 Oct 2023 07:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696517757; cv=none;
        d=google.com; s=arc-20160816;
        b=hMXtVHJCuD3qska86jsyxt+QfX0nwOb/7qEIQykdgSwlc/BP4dex5RqbppqpomlggG
         rgXvd/fZS8V8R0UEnEphzyCV4NMzXUEv4140lLFaUGlyYzf5KLU5sPBf5otC4O6j0wm2
         0IG5mIf3Y4UK82Ycpcbm/TKfuGW1BeP82+1C+NRDa0ucWn6n+X+oTY2prmAbwBH/5lmL
         oGb7qpos6c2DA68j1xAUyz73YKCOvkWRwhGfsiXmux83ewIMUJucGOtHgIZxQZ7+1Ika
         4c7lGQ2XIJMS/EN6+X6dJtHPQDWV+vtE8uloDw2WBUIyGCxJhQ+12/fiBwy1YDz3AaTK
         2bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I7tVEK4XGIGKLjA4tKg/JHPMNI/JuxvWnX5LfX8yFA4=;
        fh=SS5BtqA8Hzu3guajyo4iwBCt0UBQgLUHMmbsp/fv6xI=;
        b=sXkAdy0CffaLicEinpLOzNSK2dwhDtJpi1DRz/NZ0oOCoIcdXBB88MYFsTzbESKERN
         c/Ry1eiVeOQJxnOyq9iwwyZxDP0o1fpGMzw79skaE+8zkSVT+WCYcNckqfscQMEOx+Nj
         eYXyq7Yi2y1RnpJWXn/ZAx6vbeq2ffCpd2XwWhUhgSohsEjDGsiOxx6+4MzuUC86kgCH
         ODtyuhQ/T9ahZTXAe64YBwYccvNTvuFXQaNAADzAhWcHYJtXQbSkF15azZxsgV+Vu4Kc
         no42FimT0tsFVpWvdwRBoTBNdrgOCnQBNutlfylGHHWvPfwmmelVzXC4+O2s3DWJOBae
         U8cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MNz8F9hZ;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f2-20020ac251a2000000b0050571aab60esi1442159lfk.243.2023.10.05.07.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:55:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MNz8F9hZ;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696517756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7tVEK4XGIGKLjA4tKg/JHPMNI/JuxvWnX5LfX8yFA4=;
	b=MNz8F9hZ47r7W+oLDP0+JJHK4wWFi1UZ2IIA5Bst2pxHWVr2JhZqLe3gRoiL1ZuGoZZUMs
	Ce3HwwZ/lvDaBokzvflTosTW+EBHTBGuy6IC9V1RQsd3GLvf+VWCq6WWRTSqO2PW8xUztS
	ps+jGa+mO7QIuOoADefER2ORkC8sYQk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-x7rtwCfxOE2zBlBETILY3w-1; Thu, 05 Oct 2023 10:55:54 -0400
X-MC-Unique: x7rtwCfxOE2zBlBETILY3w-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6931db743a0so1010285b3a.0
        for <alex.bennee@linaro.org>; Thu, 05 Oct 2023 07:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696517753; x=1697122553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7tVEK4XGIGKLjA4tKg/JHPMNI/JuxvWnX5LfX8yFA4=;
        b=WJrzuayVzBC2deOsDiRYCbsiVnlvi5NAnho+z+MuNHhMFiitF3O1kb87rVMtkqKAF8
         p9TYa8Sywebataz1/nmuiG2ZNbUScUjn63sDvQT1XCffO/L9O+aLpQ4zlvp+4V37AcqI
         /OGCPTMbmXRWkHQnXY521SV3mPNh7LJRh4xuj3aEl0oULcRi29B8AAsatV1x/ZBcDuac
         +bvL3wyZgivH6lCX96CW+FDTkRyfg4uYvyHD01Gl+KKWngIvBj1PHxkAfmHRxLfww20F
         xF+SZies0UgMPIui7oG9M6PZTeKIGhIVRPw1rwVEwVf5VibPwqKoZG/xlJtlzujNacnO
         2KMQ==
X-Gm-Message-State: AOJu0YyE8/RYW2DaPf02DVSHiYfmP4MSPaLq2a7+CfkLf/m1bHdoJcCa
	H9AaEtPX6C7KZbhH+teLWph8AH5j4L6XrD5XOXFPsg/S1Y0bUAE/lFCLRPrJiuiI2oC4xAdkdPk
	l6aX3S1yYDyoCH97V3yKRFo2oJuPgNSlq
X-Received: by 2002:aa7:88ce:0:b0:690:b8b1:7b9e with SMTP id k14-20020aa788ce000000b00690b8b17b9emr5155032pff.0.1696517753292;
        Thu, 05 Oct 2023 07:55:53 -0700 (PDT)
X-Received: by 2002:aa7:88ce:0:b0:690:b8b1:7b9e with SMTP id
 k14-20020aa788ce000000b00690b8b17b9emr5155012pff.0.1696517752999; Thu, 05 Oct
 2023 07:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231004194613.2900323-1-jsnow@redhat.com> <20231004194613.2900323-2-jsnow@redhat.com>
 <cnpmerggwpvnybezttkrnxmt7xpscxxlc4rglmzijpm4f3onzt@thdoszxqyint>
In-Reply-To: <cnpmerggwpvnybezttkrnxmt7xpscxxlc4rglmzijpm4f3onzt@thdoszxqyint>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Oct 2023 10:55:41 -0400
Message-ID: <CAFn=p-bYTrvTF55rt3fuwHm3J05REUmV9AqkEd=8nfXVoUJzsQ@mail.gmail.com>
Subject: Re: [PULL 1/9] Python/iotests: Add type hint for nbd module
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Qemu-block <qemu-block@nongnu.org>, 
	Beraldo Leal <bleal@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
	Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, Thomas Huth <thuth@redhat.com>, 
	Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Markus Armbruster <armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000005eaef0606f95218"
X-TUID: vggwW1AqDPiz

--00000000000005eaef0606f95218
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023, 10:05 AM Eric Blake <eblake@redhat.com> wrote:

> On Wed, Oct 04, 2023 at 03:46:05PM -0400, John Snow wrote:
> > The test bails gracefully if this module isn't installed, but linters
> > need a little help understanding that. It's enough to just declare the
> > type in this case.
> >
> > (Fixes pylint complaining about use of an uninitialized variable becaus=
e
> > it isn't wise enough to understand the notrun call is noreturn.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/tests/nbd-multiconn | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Since there's questions about this pull request seeming to be the
> first time this patch has appeared on list, I'll go ahead and review
> it here on the assumption that a v2 pull request is warranted.
>

Sorry... Tried to "sneak" in some real trivial stuff, but didn't mean to
try and pull a fast one. I figured it'd get reviewed and then we'd merge. I
can see this sentiment is not a well expected one =F0=9F=98=93


> >
> > diff --git a/tests/qemu-iotests/tests/nbd-multiconn
> b/tests/qemu-iotests/tests/nbd-multiconn
> > index 478a1eaba27..7e686a786ea 100755
> > --- a/tests/qemu-iotests/tests/nbd-multiconn
> > +++ b/tests/qemu-iotests/tests/nbd-multiconn
> > @@ -20,6 +20,8 @@
> >
> >  import os
> >  from contextlib import contextmanager
> > +from types import ModuleType
> > +
> >  import iotests
> >  from iotests import qemu_img_create, qemu_io
> >
> > @@ -28,7 +30,7 @@ disk =3D os.path.join(iotests.test_dir, 'disk')
> >  size =3D '4M'
> >  nbd_sock =3D os.path.join(iotests.sock_dir, 'nbd_sock')
> >  nbd_uri =3D 'nbd+unix:///{}?socket=3D' + nbd_sock
> > -
> > +nbd: ModuleType
>
> Is it possible to put this closer to the code actually using 'nbd', as
> in this region?
>
> | if __name__ =3D=3D '__main__':
> |     try:
> |         # Easier to use libnbd than to try and set up parallel
> |         # 'qemu-nbd --list' or 'qemu-io' processes, but not all systems
> |         # have libnbd installed.
> |         import nbd  # type: ignore
>
> but then again, open_nbd() right after your current location utilizes
> the variable, so I guess not.  I trust your judgment on silencing the
> linters, so whether or not you move it (if moving is even possible),
>

It might be possible to move things around to be more localized, but this
was the smallest possible diffstat.

It's not really about the type, the declaration also helps pylint not
complain the "potentially" illegal use. (type: ignore isn't sufficient.)

The alternative is, I think, using some try...except around the import up
at the top, and using a HAVE_NBDLIB variable that we use to exit early
instead. I think there's no real benefit to that much churn, and this gets
the job done with less.

It might be possible to teach pylint that notrun is a NORETURN function,
but I didn't explore that avenue.


> Reviewed-by: Eric Blake <eblake@redhat.com>
>

Thanks, and apologies for the fastball.


> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.
> Virtualization:  qemu.org | libguestfs.org
>
>

--00000000000005eaef0606f95218
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Oct 5, 2023, 10:05 AM Eric Blake &lt;<a href=
=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Wed, Oct 04, 2023 at 03:46:05PM -0400, John =
Snow wrote:<br>
&gt; The test bails gracefully if this module isn&#39;t installed, but lint=
ers<br>
&gt; need a little help understanding that. It&#39;s enough to just declare=
 the<br>
&gt; type in this case.<br>
&gt; <br>
&gt; (Fixes pylint complaining about use of an uninitialized variable becau=
se<br>
&gt; it isn&#39;t wise enough to understand the notrun call is noreturn.)<b=
r>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/qemu-iotests/tests/nbd-multiconn | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
Since there&#39;s questions about this pull request seeming to be the<br>
first time this patch has appeared on list, I&#39;ll go ahead and review<br=
>
it here on the assumption that a v2 pull request is warranted.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry... Trie=
d to &quot;sneak&quot; in some real trivial stuff, but didn&#39;t mean to t=
ry and pull a fast one. I figured it&#39;d get reviewed and then we&#39;d m=
erge. I can see this sentiment is not a well expected one =F0=9F=98=93</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotes=
ts/tests/nbd-multiconn<br>
&gt; index 478a1eaba27..7e686a786ea 100755<br>
&gt; --- a/tests/qemu-iotests/tests/nbd-multiconn<br>
&gt; +++ b/tests/qemu-iotests/tests/nbd-multiconn<br>
&gt; @@ -20,6 +20,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 from contextlib import contextmanager<br>
&gt; +from types import ModuleType<br>
&gt; +<br>
&gt;=C2=A0 import iotests<br>
&gt;=C2=A0 from iotests import qemu_img_create, qemu_io<br>
&gt;=C2=A0 <br>
&gt; @@ -28,7 +30,7 @@ disk =3D os.path.join(iotests.test_dir, &#39;disk&#3=
9;)<br>
&gt;=C2=A0 size =3D &#39;4M&#39;<br>
&gt;=C2=A0 nbd_sock =3D os.path.join(iotests.sock_dir, &#39;nbd_sock&#39;)<=
br>
&gt;=C2=A0 nbd_uri =3D &#39;nbd+unix:///{}?socket=3D&#39; + nbd_sock<br>
&gt; -<br>
&gt; +nbd: ModuleType<br>
<br>
Is it possible to put this closer to the code actually using &#39;nbd&#39;,=
 as<br>
in this region?<br>
<br>
| if __name__ =3D=3D &#39;__main__&#39;:<br>
|=C2=A0 =C2=A0 =C2=A0try:<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Easier to use libnbd than to try and s=
et up parallel<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# &#39;qemu-nbd --list&#39; or &#39;qemu=
-io&#39; processes, but not all systems<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# have libnbd installed.<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import nbd=C2=A0 # type: ignore<br>
<br>
but then again, open_nbd() right after your current location utilizes<br>
the variable, so I guess not.=C2=A0 I trust your judgment on silencing the<=
br>
linters, so whether or not you move it (if moving is even possible),<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It migh=
t be possible to move things around to be more localized, but this was the =
smallest possible diffstat.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">It&#39;s not really about the type, the declaration also helps pylint n=
ot complain the &quot;potentially&quot; illegal use. (type: ignore isn&#39;=
t sufficient.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">The alter=
native is, I think, using some try...except around the import up at the top=
, and using a HAVE_NBDLIB variable that we use to exit early instead. I thi=
nk there&#39;s no real benefit to that much churn, and this gets the job do=
ne with less.</div><div dir=3D"auto"><br></div><div dir=3D"auto">It might b=
e possible to teach pylint that notrun is a NORETURN function, but I didn&#=
39;t explore that avenue.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">eblake@redhat.com</a>&gt;<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks, and apologies f=
or the fastball.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libguestfs.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libguestfs.org</a><br>
<br>
</blockquote></div></div></div>

--00000000000005eaef0606f95218--

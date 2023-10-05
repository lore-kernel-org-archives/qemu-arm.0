Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp372080ejc;
        Thu, 5 Oct 2023 07:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFpUSRx9Mgk01VsYhK1fMh9CsN2HUBlotmGaXcVT9rSxwDdjnz65SKA/9aAepJ5gjuRgjt
X-Received: by 2002:ac8:7fcd:0:b0:40e:daf8:bed3 with SMTP id b13-20020ac87fcd000000b0040edaf8bed3mr6062194qtk.3.1696517978846;
        Thu, 05 Oct 2023 07:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696517978; cv=none;
        d=google.com; s=arc-20160816;
        b=bpFm3qcUIRwjZ3dDcJzoePTrsF/RZH8ylmARdEUq5QsqSJM6jGKMhA3VuMlCdYueiH
         1T1X+f+YSWbnKhtp6s3yGQK/Ojp5uOesMieUJ0quEZ68Uv0re6wzhOzTQuNWzxKoBmqT
         YqYs2yp/dIz9ffdbEWdVHpTY72QPA68e4svLpRU0FRLiE0H7ZJsfaj95F5OMN4t+z9kd
         36mPVa4PJmlWcDyulceZCASx2HO1kZi6e6dj6m5VgxnEGEtRocOLxks+xgWrRkY/3xuu
         Vd2ABpO+mtcp8tp5A51J1SO6II4gwuebh1mP4TJ+jWvFP2rHwTAOlOFtio+/ET3fJmD+
         Oltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YcKj9U7YI0xDriXE/1H6YzU/nCPF39Nq45iBb4rGlbI=;
        fh=kfhwpYKIAZ/dwZeDAPh0Gf5MPIIg/576clW2VYnslNM=;
        b=GbCFJMLikDNLe1p6E8h2xk37kcw7l7ZlF/pcdUbQG5hMqnEIYnIMHdXosay7TJZFZK
         jN/dk2hG+kczItSl2y31RIu2T4YNiLL6RJ6PvVXlz/ZzFdJHUbCzAtac9lt74X+Znb00
         iDG2gORZRDVYWiQ1uoeam+TQ187G/D3tUkAaT4MNcEjV6l5379YUhdrz32rcMF9cputz
         rbp8d3xCCYxhhq1ZCTHKL1w3Gd1gejFs01DQQ5ltduECZBwcXzzB5g30xmWriushKnKk
         C63m7nhfu4rVn/YP/lTk0K1EZE4LA8aGX9xln/Rnf/tJha4i/chMGh7VhC4asPIBVqw5
         C3/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcCPquew;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o9-20020ac87c49000000b004108a7e5ef6si1021750qtv.126.2023.10.05.07.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcCPquew;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696517978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YcKj9U7YI0xDriXE/1H6YzU/nCPF39Nq45iBb4rGlbI=;
	b=EcCPquewWSjwGIFi25l1sD9pG9hwfOzg+GJAcsOrbzpubnn9WINTKCAM3DCYlVxIP0tt46
	873aapy84FNKILW1JusSmgdVHYz7WSdI2XHVkLXjNcL/jILHp3F9xrmNJiJOqakkiqw3Eb
	OcYlXRnOKwOW+kgPOtzJJ/AgxPM6qwA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-9JqsJVf9OFe1GzfQWx5_vw-1; Thu, 05 Oct 2023 10:59:32 -0400
X-MC-Unique: 9JqsJVf9OFe1GzfQWx5_vw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-27903b68503so941257a91.0
        for <alex.bennee@linaro.org>; Thu, 05 Oct 2023 07:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696517971; x=1697122771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcKj9U7YI0xDriXE/1H6YzU/nCPF39Nq45iBb4rGlbI=;
        b=Akvi+WUhGanQD+JG+/DVuDeS2QKgiKiFi66jRckEfIcORBgDz/AzNmrU5n3mjo9IhK
         H2dWRHE7yyLPVfAWd5V732/9jtx6hhddH74gCYyvmT9XGKGFmuYBotbO2au3tegpKQzw
         gxXvbdEIzkquRuwvdmXwsaKrmopBDgXxGSo6rpQl8Z6FpjKlXh2MlgSZ5SDpQUie+EPc
         uWRVGcQ4mI08R+ZAthFcBcIh06qrYTPIsca10kRyzZ0sWwkdXFDxJZKOdnoulWH6tGT7
         lazlZ/WPwghikViY/UCNLvy87s3yfyYLuVitk8FkAXdZkqhLLbhQcD7BQH1x07kEsJUh
         PQ5Q==
X-Gm-Message-State: AOJu0YzhHbn89lb6jqPXeKE8yAzEUMf/nzm8maapaWkWzVp4dwiQELon
	CActfy6S6ssb0u8rOLMigDJ3olA215YENkxm+XDTpzbimrc4Q6D9g+UZbw0+NgltjRwzOzbcVhl
	n8O+kF/5O2eFK3zsLeFdCsUPoZ//CvidR
X-Received: by 2002:a17:90b:19d0:b0:268:4c01:eb56 with SMTP id nm16-20020a17090b19d000b002684c01eb56mr5091637pjb.2.1696517970830;
        Thu, 05 Oct 2023 07:59:30 -0700 (PDT)
X-Received: by 2002:a17:90b:19d0:b0:268:4c01:eb56 with SMTP id
 nm16-20020a17090b19d000b002684c01eb56mr5091624pjb.2.1696517970544; Thu, 05
 Oct 2023 07:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231004194613.2900323-1-jsnow@redhat.com> <3984cd72-931b-fa9b-e7ac-3d60487ac442@linaro.org>
 <CAJSP0QUYd58Q03Ugm2ULh=aiA8jUni2XM0aZAvxE1CoYbaW5cQ@mail.gmail.com>
In-Reply-To: <CAJSP0QUYd58Q03Ugm2ULh=aiA8jUni2XM0aZAvxE1CoYbaW5cQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Oct 2023 10:59:18 -0400
Message-ID: <CAFn=p-Z9L54hV5Wx9N7ZGufRzvLrSAna4xnXxDO1VbA-MvVMvQ@mail.gmail.com>
Subject: Re: [PULL 0/9] Python patches
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Qemu-block <qemu-block@nongnu.org>, 
	Beraldo Leal <bleal@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
	Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, Thomas Huth <thuth@redhat.com>, 
	Eric Blake <eblake@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster <armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fd61660606f95ea1"
X-TUID: shixplWcqB49

--000000000000fd61660606f95ea1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023, 9:00 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Thu, 5 Oct 2023 at 00:49, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg>
> wrote:
> >
> > Hi John,
> >
> > On 4/10/23 21:46, John Snow wrote:
> > > The following changes since commit
> da1034094d375afe9e3d8ec8980550ea0f06f7e0:
> > >
> > >    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into
> staging (2023-10-03 07:43:44 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> > >
> > > for you to fetch changes up to
> 4d7a663cbe8343e884b88e44bd88d37dd0a470e5:
> > >
> > >    Python: test Python 3.12 (2023-10-04 15:19:00 -0400)
> > >
> > > ----------------------------------------------------------------
> > > Python pullreq
> > >
> > > Buffering improvements for qemu machine, minor changes to support the
> > > newly released Python 3.12
> > >
> > > ----------------------------------------------------------------
> > >
> > > John Snow (9):
> > >    Python/iotests: Add type hint for nbd module
> > >    python/machine: move socket setup out of _base_args property
> > >    python/machine: close sock_pair in cleanup path
> > >    python/console_socket: accept existing FD in initializer
> > >    python/machine: use socketpair() for console connections
> > >    python/machine: use socketpair() for qtest connection
> > >    python/machine: remove unused sock_dir argument
> > >    python/qmp: remove Server.wait_closed() call for Python 3.12
> > >    Python: test Python 3.12
> >
> > Is that a pull request or a patch series to be reviewed?
>
> Strange, some of the patches have Reviewed-by tags but others do not.
> I could not find a "Add type hint for nbd module" patch on the mailing
> list before this pull request, so I guess it hasn't been reviewed.
>
> I'll hold off from merging this series for now.
>
> John: Please make sure all patches have been on the mailing list for
> review before sending a pull request.
>
> Stefan
>

Okey Dokey.

--js

--000000000000fd61660606f95ea1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Oct 5, 2023, 9:00 AM Stefan Hajnoczi &lt;<a hr=
ef=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Thu, 5 Oct 2023 at 00:49, Philippe Mathi=
eu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" re=
l=3D"noreferrer">philmd@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi John,<br>
&gt;<br>
&gt; On 4/10/23 21:46, John Snow wrote:<br>
&gt; &gt; The following changes since commit da1034094d375afe9e3d8ec8980550=
ea0f06f7e0:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 Merge tag &#39;for-upstream&#39; of <a href=3D"https=
://gitlab.com/bonzini/qemu" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://gitlab.com/bonzini/qemu</a> into staging (2023-10-03 07:43:44 -040=
0)<br>
&gt; &gt;<br>
&gt; &gt; are available in the Git repository at:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/jsnow/qemu.git" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu.git=
</a> tags/python-pull-request<br>
&gt; &gt;<br>
&gt; &gt; for you to fetch changes up to 4d7a663cbe8343e884b88e44bd88d37dd0=
a470e5:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 Python: test Python 3.12 (2023-10-04 15:19:00 -0400)=
<br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt; &gt; Python pullreq<br>
&gt; &gt;<br>
&gt; &gt; Buffering improvements for qemu machine, minor changes to support=
 the<br>
&gt; &gt; newly released Python 3.12<br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt; &gt;<br>
&gt; &gt; John Snow (9):<br>
&gt; &gt;=C2=A0 =C2=A0 Python/iotests: Add type hint for nbd module<br>
&gt; &gt;=C2=A0 =C2=A0 python/machine: move socket setup out of _base_args =
property<br>
&gt; &gt;=C2=A0 =C2=A0 python/machine: close sock_pair in cleanup path<br>
&gt; &gt;=C2=A0 =C2=A0 python/console_socket: accept existing FD in initial=
izer<br>
&gt; &gt;=C2=A0 =C2=A0 python/machine: use socketpair() for console connect=
ions<br>
&gt; &gt;=C2=A0 =C2=A0 python/machine: use socketpair() for qtest connectio=
n<br>
&gt; &gt;=C2=A0 =C2=A0 python/machine: remove unused sock_dir argument<br>
&gt; &gt;=C2=A0 =C2=A0 python/qmp: remove Server.wait_closed() call for Pyt=
hon 3.12<br>
&gt; &gt;=C2=A0 =C2=A0 Python: test Python 3.12<br>
&gt;<br>
&gt; Is that a pull request or a patch series to be reviewed?<br>
<br>
Strange, some of the patches have Reviewed-by tags but others do not.<br>
I could not find a &quot;Add type hint for nbd module&quot; patch on the ma=
iling<br>
list before this pull request, so I guess it hasn&#39;t been reviewed.<br>
<br>
I&#39;ll hold off from merging this series for now.<br>
<br>
John: Please make sure all patches have been on the mailing list for<br>
review before sending a pull request.<br>
<br>
Stefan<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Okey Dokey.</div><div dir=3D"auto"><br></div><div dir=3D"auto">--js</=
div></div>

--000000000000fd61660606f95ea1--

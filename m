Received: by 10.28.71.27 with SMTP id u27csp3993545wma;
        Tue, 23 Jan 2018 04:32:11 -0800 (PST)
X-Google-Smtp-Source: AH8x224YnysF5WW7LO/rguQ03HN2nuOUKj0m6gIgZTMSSIzGgtptE+fFz1+vPPAIZXEmEfR1pEIX
X-Received: by 10.129.207.11 with SMTP id u11mr2190702ywi.126.1516710731421;
        Tue, 23 Jan 2018 04:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516710731; cv=none;
        d=google.com; s=arc-20160816;
        b=sP7nr/sMaePU8Kyb64AgS6X0sWRwGRsbDe0keAH0qoMz8VFwxsrXvmLjcdeEoEKN5k
         jx9xCnT32KnwYcGzpoRTnSsouqpCGnL2p9ZUz+KkIf0kybJj2mQZF3h0zVrxogKe6LLt
         f8j1jl4CJd0+ieO8JKdKoQeIBmRkjlSbA4t1HIhHMQciZQwyShE7JUYAh/WB6RpqBalZ
         znALfV3R8frpfygTf6UK/z3vAnfPM/ldYu1oNMr4SETS9c5XoR2I0FK7N7H8IhwYRIqi
         fdhHSRxQ22Vo/1qzUy7DLCgGvKUGRMqemmDQNz3XQdnVBOrT/wbE0tNTVVYCPNAQoN0D
         ZqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+Y+LNS6IaCePq1bCG2NbBURU9mbfoH3QMrajcVRMWC0=;
        b=BGRU207jEN0c5ZTpgAm2+bT+zNLaoaP7u5mGUKImX8qtd4m2mu9ZX+EEOvV20Ei4gF
         Eqm6lI866DqQIr2EJJY0A/VWr/m/mzLdIZrEzxhwKUVukA4p+SU35qgd38guvl4U3tdO
         d7ca6Nk214XZFWIpoJigyTcZSnoxavt7OkMzfF6nrrq0bEE5Rbps880keMfnpMrrvZ0t
         YlFXAi9tLax4DD/y97xbnrfVNQBKhylVRirHRbs3rZovbWzUhGZCPbqSILR/9uorivA4
         OWThAf3Q+f9mVeo1P0HXHO/atxSCjOcr+eteDsA4A8cVYYreqhQerNuJX6oiweZa54zR
         DmmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D0r2iarX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2si1141099ybj.738.2018.01.23.04.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 04:32:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D0r2iarX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edxkI-0006Qb-Rm
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 07:32:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1edxkA-0006QI-Ts
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 07:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1edxkA-00018k-1t
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 07:32:02 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:39953)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1edxk9-00018J-QJ; Tue, 23 Jan 2018 07:32:01 -0500
Received: by mail-pg0-x242.google.com with SMTP id g16so180788pgn.7;
	Tue, 23 Jan 2018 04:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Y+LNS6IaCePq1bCG2NbBURU9mbfoH3QMrajcVRMWC0=;
	b=D0r2iarXq4iYZ2VPaiOCgqtwbN38jGI4OasRF4f5j8g/nyOkcqUiK5dXMu+HHbRvfX
	8fqKETpwum49dkSpR7j71UZtusfFrPYCw5po2QjylIrbiuY2FdEzz2dr7RUhONsLPnHN
	KQu8unXMGuWmAkhInRH+R0HNgjGz/7DCPl2zyi4FRsUEW0xNfgJz330ZcXjKbnHQv45M
	Z+RvvS0FB1o0yklHdv4uFK3w0y22kAJlZwE0zj5Tesxgfk4oDkJMh65ztY/aweeklCLT
	axDoJHYaZDlINmNQ5lf45Wdm7/j39YvxErz/MdA4OM28Hip1b8QoBNaYdVc/V3sQBnOB
	uTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Y+LNS6IaCePq1bCG2NbBURU9mbfoH3QMrajcVRMWC0=;
	b=XKmZUDkoBYRD0868vzyvz2UvnBA/h1KvPQDPdPKHOG+9om/3qXYlwrwgUIshI9LKTB
	ha6CAd38ewpyLOn+txT9VFxR45H23Jo41hi6i4ImRIktx6nYC19i38/fqPUfUPbnRXrz
	QSE0AJg2k7eK9YQSidcqneu+VkmlxrCWuPEAXO82h2EyqTIKKyXuAM132yNmCKW7Zk1v
	GCHQrgG+/kISxsr809Vc7u5d8rm59v5z7Py03y6tZmPjYSbO7RNQuiG/ppmdADB3S8Hq
	71WP4jpdjBD0tuqOK2/uPbYaUbRt5wWXrD4fxH10GryWaLCRO1LWM4SKOSvf2l7EoIWD
	tiVA==
X-Gm-Message-State: AKwxytcqbCM7BKR/D21Dppri5Vx4ehSPZ7W078jjbNIWy2ntjLvwONwR
	dC0Ih/6Iy/31lBOXNEtRwmgdHZqSXi9hyjMel0M=
X-Received: by 2002:a17:902:854a:: with SMTP id
	d10-v6mr5515261plo.314.1516710720649; 
	Tue, 23 Jan 2018 04:32:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.163.101 with HTTP; Tue, 23 Jan 2018 04:32:00 -0800 (PST)
In-Reply-To: <CAFEAcA-uedKpcQGXb1UY_orGpD65Xra3aBpUpwb2RxFo3hB4Kw@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
	<CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
	<alpine.BSF.2.21.1801221224400.67089@zero.eik.bme.hu>
	<CADYoBw3qjq_CJpp3dQvpHvAgfx-FjhPvPgZ4xTpSBt4LEGiiOw@mail.gmail.com>
	<CAFEAcA-uedKpcQGXb1UY_orGpD65Xra3aBpUpwb2RxFo3hB4Kw@mail.gmail.com>
From: bzt bzt <bztemail@gmail.com>
Date: Tue, 23 Jan 2018 13:32:00 +0100
Message-ID: <CADYoBw0wKW-Z1qk+SKK+bMjX3Gm205xXN0YaqVyWhK=BuEVFUQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bb3e09056370bb30"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	BALATON Zoltan <balaton@eik.bme.hu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gVGrtnCumv16

--000000000000bb3e09056370bb30
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 23, 2018 at 12:22 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 23 January 2018 at 11:13, bzt bzt <bztemail@gmail.com> wrote:
> > There's a huge misunderstanding here. I have a working qemu for about
> half a
> > year now, and I don't need it merged. It's not my goal to submit a patch
> to
> > qemu in any way, I just did that because I had modified an Open Source
> > software and wanted to share it with the community. If you don't merge my
> > patch, I don't care. Other users will.
>
> Unfortunately we legally can't merge your patch (even if somebody
> else is willing to do the work of cleaning it up) because you
> haven't provided a signed-off-by line...
>

You have to came up with a better excuse for your incompetence.

Date: Sun, 22 Oct 2017 14:59:20 +0200
Subject: [PATCH] BCM2837 and machine raspi3

Signed-off-by: bzt <bztemail@gmail.com>

And no, I don't feel bad at all about not letting you take advantage on my
programming skills. Now you're on your own, when users starts to demand
raspi3 support in qemu don't expect me to help.

Have a nice day,
bzt


>
> thanks
> -- PMM
>

--000000000000bb3e09056370bb30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jan 23, 2018 at 12:22 PM, Peter Maydell <span dir=3D"ltr">&lt;<=
a target=3D"_blank" href=3D"mailto:peter.maydell@linaro.org">peter.maydell@=
linaro.org</a>&gt;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gm=
ail_quote"><span class=3D"gmail-">On 23 January 2018 at 11:13, bzt bzt &lt;=
<a href=3D"mailto:bztemail@gmail.com">bztemail@gmail.com</a>&gt; wrote:<br>
&gt; There&#39;s a huge misunderstanding here. I have a working qemu for ab=
out half a<br>
&gt; year now, and I don&#39;t need it merged. It&#39;s not my goal to subm=
it a patch to<br>
&gt; qemu in any way, I just did that because I had modified an Open Source=
<br>
&gt; software and wanted to share it with the community. If you don&#39;t m=
erge my<br>
&gt; patch, I don&#39;t care. Other users will.<br>
<br>
</span>Unfortunately we legally can&#39;t merge your patch (even if somebod=
y<br>
else is willing to do the work of cleaning it up) because you<br>
haven&#39;t provided a signed-off-by line...<br></blockquote><div><br></div=
><div>You have to came up with a better excuse for your incompetence.<br><b=
r><div><span style=3D"font-family:monospace,monospace">Date: Sun, 22 Oct 20=
17 14:59:20 +0200</span></div><div><span style=3D"font-family:monospace,mon=
ospace">Subject: [PATCH] BCM2837 and machine raspi3</span></div><div><span =
style=3D"font-family:monospace,monospace"><br></span></div><div><span style=
=3D"font-family:monospace,monospace">Signed-off-by: bzt &lt;<a target=3D"_b=
lank" href=3D"mailto:bztemail@gmail.com">bztemail@gmail.com</a>&gt;<br></sp=
an><br></div><div>And no, I don&#39;t feel bad at all about not letting you=
 take advantage on my programming skills. Now you&#39;re on your own, when =
users starts to demand raspi3 support in qemu don&#39;t expect me to help.<=
br><br>Have a nice day,<br></div><div>bzt<br></div>=C2=A0</div><blockquote =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex" class=3D"gmail_quote">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--000000000000bb3e09056370bb30--

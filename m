Received: by 10.223.159.82 with SMTP id f18csp3867868wrg;
        Tue, 28 Nov 2017 23:53:14 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZedcyjZ5NRcwjFAGDXF/xrn/4YdTDIZOVEWReh84y0V63ipD9ogNUJdO04n+VCWOIX1X4H
X-Received: by 10.37.163.166 with SMTP id e35mr1288256ybi.240.1511941994319;
        Tue, 28 Nov 2017 23:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511941994; cv=none;
        d=google.com; s=arc-20160816;
        b=0xBvUQE7ucz8Ik7pD4HnZQCtDNkikVCErSmF8f9Th0nVgzHiEnr8MeDQQ9Son0F0OY
         27O4cFPg7Z1nfN+6XM1nqP7v64Jbv3JQ8TfT6RMtrhflaF/PkPr74HNpjLpzEU0ZW2OR
         IO+hmDSpIOyOtf3vZui2cqU6+gMtZOaWMcJDAeFzNO9I4gYsCNTGXvk0fH4/1Z+Ok9r5
         LycMX4mCTagP9n5gKHo8Dgx50u/cSeMhJC9NQJjNxwhlE7wi/FX3rXTl91bXY0VQUR3L
         OIgiU9m7Kd65sfL7IqjqlpcrzncNiy4l3YxEhfYpfVJVe17v3cbDiZDTPT++0Ngk6FW3
         2seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rpu+fS6Tcn/VzQCCZgeB5rdhOadnxvGoHaicBmICLuU=;
        b=Y81zR/jZ/MlosLAVEtmWmxEMlln5QNt6RqfG3Aebx46TsK3BqEX8LOdSZoEZbekEMN
         hX6rjUYQm2IeA1YiLszuIzjzymWAnrRIOnUAZDG5pcQrtpccrilciBOBD1pZ/VovzLlh
         UZwioQ6HwNr6d2zHv0ZiTzaENZonvr2M3PIf9HMi4oeWrfMm5JPw6bye2FVLihISYOq6
         MPQuZWTuKxgJ/ikRmJ2pCzRYxM1RrwNmrV7drjN2rEWQVa6sx1zV33E7Zs2zDVZkhPy8
         UIdF9KIloQsEfPXCWKg4uR1xo/YyACkMdjQgVtLYq3GqcazOBSr+bhqLLldta5P6lIru
         QyBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rPJdwjdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10si224541ywc.542.2017.11.28.23.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 23:53:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rPJdwjdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJxBB-0006tN-PL
	for alex.bennee@linaro.org; Wed, 29 Nov 2017 02:53:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eJxB0-0006rU-8h
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 02:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1eJxAz-0004UU-8C
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 02:53:02 -0500
Received: from mail-pg0-x230.google.com ([2607:f8b0:400e:c05::230]:34205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1eJxAw-0004SI-BW; Wed, 29 Nov 2017 02:52:58 -0500
Received: by mail-pg0-x230.google.com with SMTP id j4so1159465pgp.1;
	Tue, 28 Nov 2017 23:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rpu+fS6Tcn/VzQCCZgeB5rdhOadnxvGoHaicBmICLuU=;
	b=rPJdwjdS/+CSL2Dees3z/hvaMAWjybQANB1HgLyjQh2iQFxtrLAM+ggQRxauPcTCU6
	zmWqrEUwDjP49SpdZ1t0uEw3itSPEamG7qUYqJxPI3jBFk/fyH9zpr7LAlHQIE7isYXA
	8eXRH+sjgSp125uIx43hxZglwyxPjQuHxSVV4XCRCeivdDphgM0FTu+jyl5jc/sML4WS
	7i5BDbUMzXuDd25RZF1khpItW5enGbGyxLGUz1MO4YlIGfBh41p5sPMy/cu/69T2IscI
	P/xMV5XDWggX2mR6jWY3TmEmmdBrxLbSTXn1Xke/AglBnoTMygWetYWUHYd8lvZBk1Ya
	RAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rpu+fS6Tcn/VzQCCZgeB5rdhOadnxvGoHaicBmICLuU=;
	b=Amfs3OM+CnpI2lc4fuv9ZMl2Ynz/eZ9y/ipGQ5gtfsc5QbuQvbZ7TMYvKm7UzjA0dO
	MnwuKNGQqDp+f79+uFl3/09vpURUpATyq1jPGO9anvGQ5vY0sm0xyYlDP0yZ9Y7sr79J
	RQqj9vK7AD6FLfp0rP2TNuHOBVOMHyqdoTcwFwFbg903X6hOBGtYFN/AXF/K/hKblUxd
	W8F9TQrfriCEmCbk9BaekiPHdzUgRdh0rMmi2HYRVko8Y6gAWIByG6EYgzNgx1dItDQJ
	4IKvssCS2HlYnbi7S9O0tgzypip5TUYlPi/dc9wQUumkOHPhHyI3X2d5lfmiFw+KO4yq
	QuqA==
X-Gm-Message-State: AJaThX5fF5kSjUr1PSG1t/8Ye4nO0QwB8FsgoScd6YBqtcsppqLh96Iy
	VDXPFXMVV2jLm88NwVKBfg1UZylMMUpNOXSIdw8=
X-Received: by 10.98.242.9 with SMTP id m9mr2086454pfh.168.1511941977040; Tue,
	28 Nov 2017 23:52:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.204 with HTTP; Tue, 28 Nov 2017 23:52:54 -0800 (PST)
In-Reply-To: <MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
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
From: bzt bzt <bztemail@gmail.com>
Date: Wed, 29 Nov 2017 08:52:54 +0100
Message-ID: <CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: multipart/alternative; boundary="f403043e3330766b83055f1a6ca0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::230
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 975olSy8cYfX

--f403043e3330766b83055f1a6ca0
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 28, 2017 at 6:54 PM, Andrew Baumann <
Andrew.Baumann@microsoft.com> wrote:

> > From: bzt bzt [mailto:bztemail@gmail.com]
> > Sent: Tuesday, 28 November 2017 03:27
>
> > Yes, I agree. I've provided a parameterised version on Oct 24, which
> does not
> > have a separate bcm2837 implementation. Is that patch ok?
>
> That patch was moving in the right direction, but I think there were two
> problems with it. First, the right way to pass a parameter is via a
> property field (as Peter explained). Second, IMO the parameter should be
> the CPU model string to instantiate and not the Pi version number.
>

Thanks!


>
> > Or should I wait
> > for Alistair's patch (https://lists.gnu.org/
> archive/html/qemu-devel/2017-
> > 10/msg04153.html)?
>
> Alistair's patch doesn't actually help you as far as I can see, since it
> doesn't change what CPU bcm2836 instantiates. I think it just means that if
> the user specifies a different CPU type they get an error rather than being
> silently ignored.
>

It does add the CPU model string, which can and should be used in bcm2836
to decide which CPU to instatiate (regardless the method of passing that
parameter). If I add yet another CPU model string, the two patch will be in
conflict containing redundant information. Also I'm sure would raspi3 use
different cpus, we should always instantiate the one the user specified.
Although here is only one possible CPU model, still that seems to be the
correct behavior. Don't get me wrong, I don't criticize, I just want to
find the best solution. Setting the CPU model only once for each version
seems right. I was thinking: if there's going to be a user specified CPU
model string anyway, why not use that one?

bzt


>
> Andrew
>

--f403043e3330766b83055f1a6ca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 28, 2017 at 6:54 PM, Andrew Baumann <span dir=3D"ltr">&lt;<=
a href=3D"mailto:Andrew.Baumann@microsoft.com" target=3D"_blank">Andrew.Bau=
mann@microsoft.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">&gt; From: bzt bzt [mailto:<a href=3D"mailto:bztemail@gmai=
l.com">bztemail@gmail.com</a>]<br>
</span>&gt; Sent: Tuesday, 28 November 2017 03:27<br>
<span class=3D""><br>
&gt; Yes, I agree. I&#39;ve provided a parameterised version on Oct 24, whi=
ch does not<br>
&gt; have a separate bcm2837 implementation. Is that patch ok?<br>
<br>
</span>That patch was moving in the right direction, but I think there were=
 two problems with it. First, the right way to pass a parameter is via a pr=
operty field (as Peter explained). Second, IMO the parameter should be the =
CPU model string to instantiate and not the Pi version number.<br></blockqu=
ote><div><br></div><div>Thanks!<br>=C2=A0<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<span class=3D""><br>
&gt; Or should I wait<br>
&gt; for Alistair&#39;s patch (<a href=3D"https://lists.gnu.org/archive/htm=
l/qemu-devel/2017-" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.=
org/<wbr>archive/html/qemu-devel/2017-</a><br>
&gt; 10/msg04153.html)?<br>
<br>
</span>Alistair&#39;s patch doesn&#39;t actually help you as far as I can s=
ee, since it doesn&#39;t change what CPU bcm2836 instantiates. I think it j=
ust means that if the user specifies a different CPU type they get an error=
 rather than being silently ignored.<br></blockquote><div><br></div><div>It=
 does add the CPU model string, which can and should be used in bcm2836 to =
decide which CPU to instatiate (regardless the method of passing that param=
eter). If I add yet another CPU model string, the two patch will be in conf=
lict containing redundant information. Also I&#39;m sure would raspi3 use d=
ifferent cpus, we should always instantiate the one the user specified. Alt=
hough here is only one possible CPU model, still that seems to be the corre=
ct behavior. Don&#39;t get me wrong, I don&#39;t criticize, I just want to =
find the best solution. Setting the CPU model only once for each version se=
ems right. I was thinking: if there&#39;s going to be a user specified CPU =
model string anyway, why not use that one?<br><br></div><div>bzt<br>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrew<br>
</font></span></blockquote></div><br></div></div>

--f403043e3330766b83055f1a6ca0--

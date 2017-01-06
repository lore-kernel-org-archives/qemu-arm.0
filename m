Received: by 10.25.205.13 with SMTP id d13csp10333667lfg;
        Fri, 6 Jan 2017 06:52:23 -0800 (PST)
X-Received: by 10.55.192.137 with SMTP id v9mr72923289qkv.305.1483714342977;
        Fri, 06 Jan 2017 06:52:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s68si40366061qkc.171.2017.01.06.06.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 06:52:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPVsS-0003bt-FQ
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 09:52:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cPVsO-0003XZ-Es
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 09:52:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cPVsN-0005Qb-F4
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 09:52:16 -0500
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:34145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1cPVsN-0005QR-9c
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 09:52:15 -0500
Received: by mail-ua0-x230.google.com with SMTP id 34so368209810uac.1
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DjNXNFL2fCXtz5MoBkBNeB8jzmaMoUmvxxPJWBHLj2I=;
	b=0wkquqnRpiVbljsZFCuI9IBegRO+/LhkJWbWOS05yFdgjMxKO3DYzbjn4ZJN2QeaXQ
	trPbfUVDdzn1kmLslYnCpysSa5k4+UwAbuJLNidG6FqSbR667ZYt8IdQzMM54d0EN0U9
	Qp8q2/fSOHNXC6HLOoPM0ZRZpS/m1eenHNH3gxpZtyJEfh7BUteQ0/7ti0KHO1Hr+Tt+
	Raehh2VhwfPKeZthBhy5o/tD0PNYeQCaKBAPJUOlyeD5bgBaO9QrkMks86gHDgnRUc/Z
	TeX1dudXIscyWUIXKaN+Qm8D7eI2D36ugwvYIcn3U/lUi4z89f9BO5AUIFRfgegKK5qW
	LbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DjNXNFL2fCXtz5MoBkBNeB8jzmaMoUmvxxPJWBHLj2I=;
	b=qHTuYpZvEMEeSGmK3QhO7qh+CJtGL8O3dNyTx6CFDYYmIfGOmExasQ5h5WuG+WYSKQ
	MwbXOqdy3dEuN23U6tOwvhsW8UcsbWwcHTX6DQrfLBGvAIkSRey3BWIDM+ahk9p+ouMr
	zYQSIQzrBdvFs1y7jcUdIWNKma/2A/FGAVEXeHhEo1NYkqGn/IttelSGWr4qu9+2VwyZ
	MWGBiLs2bWwjsQRpGhQzSmzu39mhghG3qBFZB49kJOPOPS8/ayy3SenrxNJnpr8r89fN
	30uohfGiApLVqVAJnqX8mjEUZ4k0a79KOUNPC9nB92dlrSlhA5mRu2oMu9ZSIjadd0Ly
	/BHA==
X-Gm-Message-State: AIkVDXJvpG2hvptOM97OFUG48mcfERlj3HaPd6sILQv1viMJbS2AQGQWERN+lQHLwl3YaVKu32FkD0wOvaEV1w==
X-Received: by 10.176.84.156 with SMTP id p28mr46532200uaa.76.1483714334313;
	Fri, 06 Jan 2017 06:52:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.125.71 with HTTP; Fri, 6 Jan 2017 06:52:13 -0800 (PST)
In-Reply-To: <CAF++6AO9P+VHj2mDwa0-13XSigzjfuQdhEHy1HX2e=tGu-28NA@mail.gmail.com>
References: <CAF++6AO9P+VHj2mDwa0-13XSigzjfuQdhEHy1HX2e=tGu-28NA@mail.gmail.com>
From: James Hanley <jhanley@dgtlrift.com>
Date: Fri, 6 Jan 2017 09:52:13 -0500
Message-ID: <CAF++6AMbT02x+tZ6kHwaguc3b=XPP4Dj0ywWETT4QxrGUQVw-Q@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary=94eb2c1b0c3ed86f5905456e29dc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] ATSAM4sd16c MCU chip NVIC issue
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d4mt3vEi7i7l

--94eb2c1b0c3ed86f5905456e29dc
Content-Type: text/plain; charset=UTF-8

I see now that there an RFC for multi-core support and a patch for
refactoring armv7m_nvic - should I wait for those to be integrated? When
will that be included into the mainline?

On Thu, Jan 5, 2017 at 4:18 PM, James Hanley <jhanley@dgtlrift.com> wrote:

> I'm trying to create a Atmel ATSAM4sd16c chip support (part of the ATSAM4
> family) but I'm running into an issue with the NVIC code.  I modeled it
> after the STMicro implementation and created a Machine based around one of
> our boards, but I am running into an issue where although the call to
> armv7m_init() seems to set up the NVIC correctly and map it to 0xe000e000
> and jump into the nvic_readl(), but never jumps to the vector in the
> firmware (kernel).
>
> Is there any documentation (other then code tracing) for how the interface
> for armv7m_nvic.c should be used?
>
> Thanks much,
> -Jim
>

--94eb2c1b0c3ed86f5905456e29dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see now that there an RFC for multi-core support and a p=
atch for refactoring armv7m_nvic - should I wait for those to be integrated=
? When will that be included into the mainline?</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Thu, Jan 5, 2017 at 4:18 PM, James H=
anley <span dir=3D"ltr">&lt;<a href=3D"mailto:jhanley@dgtlrift.com" target=
=3D"_blank">jhanley@dgtlrift.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">I&#39;m trying to create a Atmel ATSAM4sd16c=
 chip support (part of the ATSAM4 family) but I&#39;m running into an issue=
 with the NVIC code.=C2=A0 I modeled it after the STMicro implementation an=
d created a Machine based around one of our boards, but I am running into a=
n issue where although the call to armv7m_init() seems to set up the NVIC c=
orrectly and map it to 0xe000e000 and jump into the nvic_readl(), but never=
 jumps to the vector in the firmware (kernel). =C2=A0=C2=A0<div><br></div><=
div>Is there any documentation (other then code tracing) for how the interf=
ace for armv7m_nvic.c should be used?</div><div><br></div><div>Thanks much,=
</div><div>-Jim</div></div>
</blockquote></div><br></div>

--94eb2c1b0c3ed86f5905456e29dc--

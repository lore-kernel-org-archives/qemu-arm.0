Received: by 10.25.205.13 with SMTP id d13csp10715142lfg;
        Sat, 7 Jan 2017 04:11:32 -0800 (PST)
X-Received: by 10.200.54.137 with SMTP id a9mr16680154qtc.185.1483791092369;
        Sat, 07 Jan 2017 04:11:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a5si44239568qka.116.2017.01.07.04.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Jan 2017 04:11:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPpqL-00033E-LT
	for alex.bennee@linaro.org; Sat, 07 Jan 2017 07:11:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cPpqD-000334-4m
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 07:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cPpqA-0007Gq-15
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 07:11:21 -0500
Received: from mail-yw0-x22e.google.com ([2607:f8b0:4002:c05::22e]:35150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1cPpq9-0007Gc-S8
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 07:11:17 -0500
Received: by mail-yw0-x22e.google.com with SMTP id v81so289117927ywb.2
	for <qemu-arm@nongnu.org>; Sat, 07 Jan 2017 04:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=from:content-transfer-encoding:mime-version:date:subject:message-id
	:references:in-reply-to:to;
	bh=uO+Nm5UcAPjbNYC8spYePJ0TVyMCTIY5+RghsuP6qro=;
	b=nlUAJ3Yu6PzYd9i0ps0OpTavNRkn64gRur7tN5/uXZvODDAADW1AipBVWluIyCXC5M
	keT50UyqM2cLORwRK3/KCep8uCIxzdUFbJDdHZsBBK6STOe7my3RI5lO/h9OBCWsDWMU
	7GKimXcT6oSFsMb2StmsdO/VIFf3/vCb++6GwuqI8Z8T+Zi5rr+A9w5ibEt7N8bqT05j
	rEcdJC6/sHSjvzS3OP3qegnLd88YnPGf1HSzyxDmoq6W8/jXQkBSQcZAvx1F20Cb1t9h
	dF0x4luqS/4IvonlYzQ8YZoyO9phg17x5Ngt1+v9wuyhi7dCuX39rjsTLcZcY8C0o1Ti
	LdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version:date
	:subject:message-id:references:in-reply-to:to;
	bh=uO+Nm5UcAPjbNYC8spYePJ0TVyMCTIY5+RghsuP6qro=;
	b=j5oMd7os3EvK7SB+b3a+DiqfktUW02tb1IOLneXmZC5u5ZYx8cXe8mZqh25YIpRz5v
	ZvoXn9BZvHGEr7SD9yMkmeJIN4Bq6Yqgmvn7kgtkkPQd87wPrxpjn/WpIWIotCGi2ZGB
	De42FqmMD8PVJ+OKjc1tMdgNXaIgbIpnIhi9W5tlRwNwV+8BJQxfaahi7/ybktt6Dyko
	BnNBtu57gzm09NrBWr9EJXjFuVBJFuTOGLUJLAoHwVQ1200ybFnLXWln4XOJt5GqtKr7
	FGvdarffVZs/JmAgfeoJ+0zrLp1RR7SmB8mucuGsGJcXpDvCL+Y89TB/IgQRtszRujf6
	CyvQ==
X-Gm-Message-State: AIkVDXKzzU/YILIbxMBRM0dam65zEKZWumOAHmXIuUlttGwLgHkumCvBwBVT1AIGJ+Q2LA==
X-Received: by 10.129.75.147 with SMTP id y141mr7553503ywa.86.1483791074627;
	Sat, 07 Jan 2017 04:11:14 -0800 (PST)
Received: from [192.168.0.26] (c-24-30-11-35.hsd1.ga.comcast.net.
	[24.30.11.35]) by smtp.gmail.com with ESMTPSA id
	c126sm34656531ywf.45.2017.01.07.04.11.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jan 2017 04:11:13 -0800 (PST)
From: James Hanley <jhanley@dgtlrift.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-17C9267D-A34C-49C4-80F4-AE156F729772
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (1.0)
Date: Sat, 7 Jan 2017 07:11:13 -0500
Message-Id: <61B406A8-CB0A-4E6E-850D-9FC89C377469@dgtlrift.com>
References: <CAF++6AO9P+VHj2mDwa0-13XSigzjfuQdhEHy1HX2e=tGu-28NA@mail.gmail.com>
	<CAF++6AMbT02x+tZ6kHwaguc3b=XPP4Dj0ywWETT4QxrGUQVw-Q@mail.gmail.com>
In-Reply-To: <CAF++6AMbT02x+tZ6kHwaguc3b=XPP4Dj0ywWETT4QxrGUQVw-Q@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss@nongnu.org
X-Mailer: iPhone Mail (14C92)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::22e
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
X-TUID: p50em1nAfFJE


--Apple-Mail-17C9267D-A34C-49C4-80F4-AE156F729772
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I realize now that I posted this thread to the wrong list.

-Jim

> On Jan 6, 2017, at 9:52 AM, James Hanley <jhanley@dgtlrift.com> wrote:
>=20
> I see now that there an RFC for multi-core support and a patch for refacto=
ring armv7m_nvic - should I wait for those to be integrated? When will that b=
e included into the mainline?
>=20
>> On Thu, Jan 5, 2017 at 4:18 PM, James Hanley <jhanley@dgtlrift.com> wrote=
:
>> I'm trying to create a Atmel ATSAM4sd16c chip support (part of the ATSAM4=
 family) but I'm running into an issue with the NVIC code.  I modeled it aft=
er the STMicro implementation and created a Machine based around one of our b=
oards, but I am running into an issue where although the call to armv7m_init=
() seems to set up the NVIC correctly and map it to 0xe000e000 and jump into=
 the nvic_readl(), but never jumps to the vector in the firmware (kernel).  =
=20
>>=20
>> Is there any documentation (other then code tracing) for how the interfac=
e for armv7m_nvic.c should be used?
>>=20
>> Thanks much,
>> -Jim
>=20

--Apple-Mail-17C9267D-A34C-49C4-80F4-AE156F729772
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>I realize now that I posted this threa=
d to the wrong list.<br><br>-Jim</div><div><br>On Jan 6, 2017, at 9:52 AM, J=
ames Hanley &lt;<a href=3D"mailto:jhanley@dgtlrift.com">jhanley@dgtlrift.com=
</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div><div dir=3D"ltr"=
>I see now that there an RFC for multi-core support and a patch for refactor=
ing armv7m_nvic - should I wait for those to be integrated? When will that b=
e included into the mainline?</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Thu, Jan 5, 2017 at 4:18 PM, James Hanley <span dir=3D"l=
tr">&lt;<a href=3D"mailto:jhanley@dgtlrift.com" target=3D"_blank">jhanley@dg=
tlrift.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr">I'm trying to create a Atmel ATSAM4sd16c chip support (part of the ATSA=
M4 family) but I'm running into an issue with the NVIC code.&nbsp; I modeled=
 it after the STMicro implementation and created a Machine based around one o=
f our boards, but I am running into an issue where although the call to armv=
7m_init() seems to set up the NVIC correctly and map it to 0xe000e000 and ju=
mp into the nvic_readl(), but never jumps to the vector in the firmware (ker=
nel). &nbsp;&nbsp;<div><br></div><div>Is there any documentation (other then=
 code tracing) for how the interface for armv7m_nvic.c should be used?</div>=
<div><br></div><div>Thanks much,</div><div>-Jim</div></div>
</blockquote></div><br></div>
</div></blockquote></body></html>=

--Apple-Mail-17C9267D-A34C-49C4-80F4-AE156F729772--

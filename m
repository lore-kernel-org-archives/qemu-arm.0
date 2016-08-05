Received: by 10.25.21.156 with SMTP id 28csp1726510lfv;
        Fri, 5 Aug 2016 03:12:05 -0700 (PDT)
X-Received: by 10.233.237.75 with SMTP id c72mr11392220qkg.170.1470391925290;
        Fri, 05 Aug 2016 03:12:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w18si11130476qtw.37.2016.08.05.03.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 03:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVc6m-0007fR-KL
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 06:12:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVc4Y-0005JZ-HT
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVc4W-0004ph-6I
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:09:45 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVc4W-0004pV-19
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:09:44 -0400
Received: by mail-vk0-x22d.google.com with SMTP id n129so187577100vke.3
	for <qemu-arm@nongnu.org>; Fri, 05 Aug 2016 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XU2KMC6V4+PJgQTm/hgGGlkoiZJevvNqFxnkSvy5wWw=;
	b=OK31SIi9EthtQdCfxeod77N4LvGDCe2VZYfgda2nEEXnusHA0D5D9L3+RDCqP2b5qn
	t2doGsyLQZEd7T1Q5cbGs+CAz7vBPMQ2l28+CUeSzbQ8xk1bngJAYll1Bqs3aVVPMQB3
	MYRYvKAiszT6i2p3CZwJsNYkiGfyzABVnb+WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XU2KMC6V4+PJgQTm/hgGGlkoiZJevvNqFxnkSvy5wWw=;
	b=daOPbK6T4d+cPAZL0GcPKpVN0B8kezdGrzM+oTpb32azNk6rFKyrydFyQdgIM+KSoC
	cFKeqpp/UWKDw5EiYYjF0yFr4Z+HTCX8ymMhoDtpS4WJyLZWPKVQotJXePtZukWpNVhk
	RaLN3kiR0gQ1VCFVGiWtC9uEkbuBz9ejS59GIpep/DOmXKB1xS77IwH0suP+HXmOa1Lo
	elfVt3ShmO2Rm6QHFWSrYq5RgPWp9bV5Q7fNtFYpvJNRORyiYzTalha3ywAMfC8aL4Wt
	xXq24tbHIQx86wrdhwpT+HaxpKHjx6POg4+XDIiJNq9GTbaiYpcx1ZW27fnry7/06ocD
	XLvw==
X-Gm-Message-State: AEkoouuyhzltje+kBAp5imR2Pu/A99HXLEYg6R9zvUROXZw70p4XQGfaOPo81XMzkxl/O+tvJqbbqRcU2tpgQjSI
X-Received: by 10.31.238.206 with SMTP id m197mr38686891vkh.64.1470391783700; 
	Fri, 05 Aug 2016 03:09:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.41.34 with HTTP; Fri, 5 Aug 2016 03:09:43 -0700 (PDT)
In-Reply-To: <CAFEAcA9_+casyz4-nVSMMC-M-B44eYEx4f_b0fy_RodYdRNpfg@mail.gmail.com>
References: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
	<CAFEAcA9_+casyz4-nVSMMC-M-B44eYEx4f_b0fy_RodYdRNpfg@mail.gmail.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Fri, 5 Aug 2016 18:09:43 +0800
Message-ID: <CAN76PtRHM0jAhZeg7h+Dy0siyhmkWnxfS3A7w4hpmUE37fY1Cg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=94eb2c121f92f2cdc605395043a4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [Help]: Does qemu-system-aarch64 support virtio-9p?
 I got a problem when remap host file to guest in AArch64.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uzA1SaakoxcF

--94eb2c121f92f2cdc605395043a4
Content-Type: text/plain; charset=UTF-8

Hi Peter,
    Thanks~
     I will try newest version of Qemu 2.7.0 to see how it well

On 5 August 2016 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:

> On 5 August 2016 at 03:23, Kevin Zhao <kevin.zhao@linaro.org> wrote:
> > Hi All,
> >      I have a problem may about Qemu and kindly need your help. Does
> > qemu-system-aarch64 support virtio-9p ?
>
> virtio-9p isn't guest architecture specific so in theory it
> should. However I've never tried it.
>
> >      The Qemu version is QEMU emulator version 2.5.0 (Debian
> > 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the same
> > problem in Debian jessie.
>
> It may be worth trying a more recent QEMU, like the 2.7.0rc1
> release candidate we just put out.
>
> thanks
> -- PMM
>

--94eb2c121f92f2cdc605395043a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div>=C2=A0 =C2=A0 Thanks~</div><div>=C2=A0 =C2=
=A0 =C2=A0I will try newest version of Qemu 2.7.0 to see how it well</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 August =
2016 at 16:13, Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.=
maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 5 August 20=
16 at 03:23, Kevin Zhao &lt;<a href=3D"mailto:kevin.zhao@linaro.org">kevin.=
zhao@linaro.org</a>&gt; wrote:<br>
&gt; Hi All,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I have a problem may about Qemu and kindly need yo=
ur help. Does<br>
&gt; qemu-system-aarch64 support virtio-9p ?<br>
<br>
</span>virtio-9p isn&#39;t guest architecture specific so in theory it<br>
should. However I&#39;ve never tried it.<br>
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 =C2=A0 The Qemu version is QEMU emulator version 2.5.0 (D=
ebian<br>
&gt; 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the s=
ame<br>
&gt; problem in Debian jessie.<br>
<br>
</span>It may be worth trying a more recent QEMU, like the 2.7.0rc1<br>
release candidate we just put out.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--94eb2c121f92f2cdc605395043a4--

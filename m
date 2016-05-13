Received: by 10.25.208.137 with SMTP id h131csp232830lfg;
        Fri, 13 May 2016 08:34:57 -0700 (PDT)
X-Received: by 10.141.46.71 with SMTP id x68mr17290412qhe.70.1463153697017;
        Fri, 13 May 2016 08:34:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si12386019qkb.84.2016.05.13.08.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 08:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1F7A-0000PZ-HD
	for alex.bennee@linaro.org; Fri, 13 May 2016 11:34:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1F77-0000Ma-VU
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:34:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1F75-0000rS-P3
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:34:52 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1F75-0000r6-66
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:34:51 -0400
Received: by mail-vk0-x234.google.com with SMTP id s184so141436238vkb.3
	for <qemu-arm@nongnu.org>; Fri, 13 May 2016 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fVqn/3nEk9Qvg6wq3xmM+10r6Kt8ij4cyK/ujVYpyOk=;
	b=LkQCf1AuTI9aQJqYQY7t+GB/w/7FdTpeDYa3tla1VaP36+sG/WGdush4L6kwAx00eL
	QcVSBN7ILZY54akfEt4LbszF+grZm0P4PwPQcIq7rBQkMUcxvLkqFJ/BXNSnTtmGO0J6
	VeDhc5Y6bhphLf4byYE126sbC5mZP7OdTVlrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fVqn/3nEk9Qvg6wq3xmM+10r6Kt8ij4cyK/ujVYpyOk=;
	b=jrN74XT6AhZBJWRnQc2Dc4Pt5se83UDK/z53/5HHLaZvBT/B0eaHMcsz8GOD0EaD0h
	5vntJWGctzHUEJYmmkxYk1EXcDpylA61LDr1n0fCM5rYCGV5UB3DlMwxiOsp/+lvLBqK
	qtMObBmudZaZljyvW0rT55HJxIuPBM/5XppjNVIIxUfrxjxzD8jZBW1UPK4TnHgMcusM
	hruzZRjwCtHOdhui6tiyfFG4XXKXm4gbyZ56Pb/CaWtNsX2BbVM0eonmmhRX54rTa7iR
	viYBnmK5ta811vRiK6dz3F6jby7y0GixJyhiku/8ntikk7ZXW18P1CzWXFjm8V+ntcf5
	q3dA==
X-Gm-Message-State: AOPr4FX5FETSKfUw52urwUxkenzNLgOLAcfDwLAztDFQToUjHK4t7Eq/WzWbVl25IDGjQdNJbvwuFvO3zEmfK0Is
X-Received: by 10.159.54.232 with SMTP id p95mr7127173uap.107.1463153690520;
	Fri, 13 May 2016 08:34:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 13 May 2016 08:34:30 -0700 (PDT)
In-Reply-To: <1a238e2a.3db8.154a2a51724.Coremail.zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
	<CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
	<56FC81E0.1000203@163.com>
	<CAFEAcA_xGVpHW8ki0qqGMN8OtpbiZYtAsCJoxQG9z8FPXZBVqQ@mail.gmail.com>
	<E44DBEC6-F0C6-4B70-A753-24D62179283D@163.com>
	<1a238e2a.3db8.154a2a51724.Coremail.zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2016 16:34:30 +0100
Message-ID: <CAFEAcA9eaF8xecycuKyO==-Hx8Ht5yoNeQ9R5e-cNTYazQ-CXQ@mail.gmail.com>
To: =?UTF-8?B?6LW15bCP5by6?= <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH 0/9] some QOM'ify work under hw/arm
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
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T4ulSswg3oHC

On 12 May 2016 at 02:46, =E8=B5=B5=E5=B0=8F=E5=BC=BA <zxq_yx_007@163.com> w=
rote:
>
> =E5=9C=A8 2016-03-31 16:15:17=EF=BC=8C"xiaoqiang zhao" <zxq_yx_007@163.co=
m> =E5=86=99=E9=81=93=EF=BC=9A
>>
>>
>>> =E5=9C=A8 2016=E5=B9=B43=E6=9C=8831=E6=97=A5=EF=BC=8C16:05=EF=BC=8CPete=
r Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>
>>>> On 31 March 2016 at 02:48, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>>>>
>>>>> =E5=9C=A8 2016=E5=B9=B403=E6=9C=8816=E6=97=A5 20:00, Peter Maydell =
=E5=86=99=E9=81=93:
>>>>>
>>>>>> On 16 March 2016 at 11:31, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>>>>>
>>>>>> A general note -- since these aren't bug fixes and we're in soft
>>>>>> freeze now, I don't think we should put them in until 2.6 is out.
>>>>>> I'll review the patches in a second, though.
>>>>>
>>>>> Well, the patches all look good -- ping me after 2.6 is out to
>>>>> apply them to target-arm.next then.
>>>>>
>>>>> Where I've noted possible further cleanups, that's intended as
>>>>> an "if you like writing cleanup patches" thing -- you don't need
>>>>> to try to do them as part of this patch series.
>>>
>>>> ping !
>>>
>>> I suggested you ping me after 2.6 is out, which won't be til the
>>> end of April or thereabouts.
>>>
>>> thanks
>>> -- PMM
>>
>>Ok=EF=BC=812.6rc misleads me=EF=BC=81
>
> ping ;-)

These are now all in master; thanks.

-- PMM

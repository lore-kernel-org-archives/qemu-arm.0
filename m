Received: by 10.223.197.9 with SMTP id q9csp3705361wrf;
        Tue, 10 Oct 2017 08:55:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCY3tIHSb+qEqZQDd51Yoer1TAohCLIAwjFq5gSZyHZ0hqcXqWJPY5kZgn6ZRaF9YKcvP4f
X-Received: by 10.200.63.245 with SMTP id v50mr9076268qtk.323.1507650906273;
        Tue, 10 Oct 2017 08:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507650906; cv=none;
        d=google.com; s=arc-20160816;
        b=WOArcODGikn9WwRmhkSUJqFz07AGcYqJ0YMuI/ZQq0SnmpiDOVSCUy9lnOp014MLd6
         jjI6guO8xgWbOFZzcApFSIzWnqL4Lty3Igtn/teRzAzQ8yC0YLOAIzlsgRx/kobWdKEI
         p/7miXP/Yb9Vpy+IdkbUaxOpxjhIHIGB9IIZSCECMb0AqTJzg1zSgKdN2Cstiar8HKzy
         gp6N1zJNQ33NIWFIIkBq2EYRJUkq1FE6AeII1n+TgsRS94eJnIjmzYaxR/U9pz63TnrU
         pVVDpl51yqAFbbj61PsaKTcW6/Q8xoV1WK8mD1XeSmpiwQVzq3PwcszMAzKyoyKzZ3s4
         8BZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=ZuIGHoJK2WSGm/EJpnvutjQRBi5QJyeiSDEnno8wNVc=;
        b=IZxURmr/FsuInpzcoCcOepfaRiUQNZloyI47RE50dIa2TWyH6InM5apUMnjjyGTNNG
         Bb+u1aOJNYkcvny4w6ySQ2vJchx5E/qn5Aol45yFTPcR6jJksPTJZxIoOYZ2gVWrKGpw
         2McqTobTVvAkqsb7yfgVmgcu5Nb/G3bvaX6FUwBqASao749FjhNz4yWDDQWwXwCcGgB+
         qUDPF0Gd1KjTqiTXXYUJPID2WtVVe/+gNxPyAbwCyNFeXFIIwGcvLCXL8iE/y/v3HM5I
         khXRDfmgtHgWM/2TP6SZadybe2Wdy/3o3ZEUj+veKmHbnZKkOTms5bKFNu1ONklwhDqS
         7Ovw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15si2054501qkl.17.2017.10.10.08.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 08:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ws3-0001bM-KZ
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 11:55:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1wrm-0001Zu-NJ
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1wrg-0000f2-RQ
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:54:46 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:46857)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e1wrg-0000e7-L8
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:54:40 -0400
Received: from player728.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id CB1755A202
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 17:54:38 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice3n7.emea.ibm.com
	[195.212.29.177]) (Authenticated sender: postmaster@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id C1C6F540091;
	Tue, 10 Oct 2017 17:54:30 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
	<f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
	<CAFEAcA-kJ-qEoo-2ZWaH0XPv-cJA4O3wZAW=FwmM5nUU4-mVBg@mail.gmail.com>
	<900ffff3-3667-7e17-bf38-7c6a520ed838@kaod.org>
	<CAFEAcA-tZG-mVMk-kfxZz3oKOSBr9QDpwJWc_CSvqc7An8NNbg@mail.gmail.com>
	<cf00417c-86a6-cf7c-eea7-b1b46d9b2cc1@kaod.org>
	<CAFEAcA9mMCAPdgTPtEtEBMa1go0XNDCgZHmUR4bRYpTJibK9_A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <10c8381c-904f-681a-28c1-1f069ba29219@kaod.org>
Date: Tue, 10 Oct 2017 17:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9mMCAPdgTPtEtEBMa1go0XNDCgZHmUR4bRYpTJibK9_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17094819764193496004
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtddtgdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.39.61
Subject: Re: [Qemu-arm] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1KshErEiCeL6

On 10/10/2017 05:45 PM, Peter Maydell wrote:
> On 10 October 2017 at 16:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> On 10/10/2017 03:24 PM, Peter Maydell wrote:
>>> On 10 October 2017 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>>>> On 10/10/2017 11:54 AM, Peter Maydell wrote:
>>>>> The goal is to model hardware correctly. Hardware gives
>>>>> aborts if you touch a physical address with no device there,
>>>>> and so QEMU's model should do the same. If you have guest
>>>>> code that touches a physical address and blows up because
>>>>> of an abort (but doesn't when run on h/w) then either:
>>>>>  * it is trying to probe a device that exists in real h/w:
>>>>>    you need to provide a stub implementation in QEMU
>>>>>  * the SoC's bus fabric really doesn't pass aborts back
>>>>>    to the CPU; I think this is unlikely, but you can model
>>>>>    it at the SoC level with a suitable default memory region
>>>>
>>>> well, that is case it seems.
>>>
>>> If it is, then we should model the SoC that way, ie find
>>> out from the hardware docs what part of the bus fabric
>>> ignores decode errors and use memory regions with the
>>> right default behaviour to cover the relevant address
>>> ranges.
>>
>> The addresses generating memory fault errors are all in
>> the region where the BMC SPI Flash Memory is mapped :
>> [ 20000000-2FFFFFFF ]
>=20
> If there's an actual flash device there then this sounds
> like my first case above, where we just need to stub out
> that range of addresses until we get round to really
> implementing the flash device.

but it is implemented ! and the region available.

C.


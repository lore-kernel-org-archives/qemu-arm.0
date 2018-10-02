Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5213614wrt;
        Tue, 2 Oct 2018 08:49:44 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62e46vHqltBO1zFPGnYxbnyk6eVb0GSJSJj/ortn/tq9e5UZGLuFVxSFpwRXdux8R4g/UUc
X-Received: by 2002:ac8:3442:: with SMTP id v2-v6mr13070729qtb.231.1538495384576;
        Tue, 02 Oct 2018 08:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538495384; cv=none;
        d=google.com; s=arc-20160816;
        b=F/1g07kQ+UfNUctL/fYrGmA1QdbwCR1BPw0z979/Q3kHXMZ+aBFjsqtAyNzF0783hC
         ZZX/YI37D4+m4EzWLMk8+bzKZ4cpBWzcPWwD7wKj4NzCya58nJQBb/ULX0Up1dHlp1Ke
         DOb3oCyvfe7jXITzKlbffH8f/aD6aK/d0NTiA5kFCYJTraFUyz3duQSs4gJd50qIajea
         VMSZP5gQcZwORuxrhAFEeYvMVUL/ULPBi5pHy0HkTlqH7swzzfruAhKfN/NdUolfMDH4
         LgxoBvo3PzWLQusdGnpj+IZiCwhW9BtmN/Zae0EpPiK4GaXAtQaBC62GTRJRIPgOt9d4
         Qc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=diGFEEHG/Pap5wqMYLfhQioYDFAxgt70drmZ5sa76LQ=;
        b=Zpy4hKurCQofIElsgY7oLGq7UAolf4r3m3XCODeGAzfgJng39CzFpm3blNCiCq+8Vw
         hGW1CzRmwqqTcnpfbWKPaVPSG1WF9kX2723GqMps73TwHvOW2kkWvcC8j+78n9NudBAL
         Gb1+KW/ij6AZeg7iZvbyO2hTinRhfwYjchuw8b/qDJHqXhTSI37QZNRMD+HDZXMQB8kb
         fzhLkBCs8ACWYMtsmLiDg2zOvFLsnQu0AcCaqOQ/1H5iixnUnG9NvkJmFkbvItbyCSP0
         TOzTo1H4zPHz5o2d6sERLtFQoC0QQR8AH6dsT/+9FkNbTapn4M6pMZ+Y5nuOOt48fYEH
         JnUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si5702533qtj.82.2018.10.02.08.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:49:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Mvg-00045O-3G
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:49:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7MvK-00040H-LZ
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7MvB-00079y-99
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:18 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:46417)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g7MvB-00079J-1j
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:13 -0400
Received: from player697.ha.ovh.net (unknown [10.109.159.136])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 74C0315CF96
	for <qemu-arm@nongnu.org>; Tue,  2 Oct 2018 17:49:10 +0200 (CEST)
Received: from zorba.kaod.org (unknown [145.131.95.179])
	(Authenticated sender: postmaster@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id 25E5B4800C1;
	Tue,  2 Oct 2018 17:49:01 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
	<539cfb28-e4bc-f7d4-6ed9-881bc0cab8bc@kaod.org>
	<CAFEAcA-X7QdyjU9_aM9RAm-GZZWezyx-toEdT5vf-1P=XkdX-Q@mail.gmail.com>
Message-ID: <1ea83c48-2150-7fc4-3423-3c43e100a848@kaod.org>
Date: Tue, 2 Oct 2018 17:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-X7QdyjU9_aM9RAm-GZZWezyx-toEdT5vf-1P=XkdX-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10625680371869322180
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrtddtgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.48.182
Subject: Re: [Qemu-arm] [PATCH v2 00/11] aspeed: misc fixes and enhancements
 (SMC)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rB0gW1FipjfS

On 10/2/18 12:57 PM, Peter Maydell wrote:
> On 25 September 2018 at 15:10, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> On 9/25/18 2:20 PM, Peter Maydell wrote:
>>> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>>> Hello,
>>>>
>>>> This series adds a couple of cleanups and two main features to the
>>>> SMC controller of the Aspeed machines :
>>>>
>>>>  - a 'execute-in-place' property to boot directly from a memory regi=
on
>>>>    alias of the FMC flash module using MMIO execution. This is not
>>>>    activated by default because boot time needs to be improved on
>>>>    recent firmwares. It also breaks migration compatibility.
>>>>
>>>>  - support for DMA to access the flash modules. Our primary need is
>>>>    the checksum calculation which is used to evaluate the best clock
>>>>    settings for reads.
>>>
>>> I've picked out the easy parts of this series and added
>>> them to target-arm.next:
>>>
>>>>   aspeed/timer: fix compile breakage with clang 3.4.2
>>>>   hw/arm/aspeed: change the FMC flash model of the AST2500 evb
>>>>   hw/arm/aspeed: Add an Aspeed machine class
>>>>   aspeed/smc: fix some alignment issues
>>>
>>> and left the rest for the moment (I've still got this series
>>> on my to-review list).
>>
>> I will wait for your comments on the DMA part before resending.
>=20
> I've now commented on that patch. I think I'm done with review on
> this version, unless there's something specific you want more
> input on ?

No, a part from the chicken & egg problem on the RAM memory region
may be if you have some idea.  I will dig in before re-sending anyhow.

Thanks,

C.=20



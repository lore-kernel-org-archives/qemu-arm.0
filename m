Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp553239lfp;
        Fri, 7 Feb 2020 05:06:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNaYRGbCgWTZ8XYy73iU6uEDQM5Q21GP1FXFd9lZzr7gM1a4lnfvNb7GkcZbYHoqeUez4o
X-Received: by 2002:ad4:46c3:: with SMTP id g3mr6408263qvw.60.1581080762817;
        Fri, 07 Feb 2020 05:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581080762; cv=none;
        d=google.com; s=arc-20160816;
        b=LNHpwEidKwOuDTz1GdXlBUsK64Eq0SOylyzI9X73/9pP47Pj9LwfrlTc5ed4ndxVL0
         LK3Gqy24ICGm61YgS6lZraI/VRiJxxqH+JfSq9XXsJ3YwPx4/PZCOsEqWWo7d1kJbltc
         nyOU6QlaqnnQsuVjqN1fmlg8f9UblsHJ7XS2HW5NeVLHAU9H7zr/7W4vXj1nXsFxmNnN
         cgLum3ggAl5iimQt/RcskF0sjR4+rSUJWejIQwodh7tY95PLuFVUo6uhhWCqZ0qkimIa
         OKde15NMiFvJ6GpzJT4ar0et0g+W+v261XAsWGod00zqBuz0QTAWFf7zcP18aa/lpZWv
         SGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=PganHxbysq80Wg1989Q/nN5QIL/HNTgBZaifP+46oT8=;
        b=GSRpkNaQpxfpqe65burXmlYF/hcTt+y5tak1uX6xcssbl/nMKB56FMaSXwiD5VBz6J
         UXTR5VCLDtyKxhGn0BHO8S570pLFcBcs7DoMAoVW340qg5GNCDiDJekBnro7ZGRwYwuw
         WrtkZXWANFKw9vaggxulUsanDoABAX+VWD/5J9qjhGgLVWuSKjXFAYnqpll3oyOMwS+/
         O64ph16n7LRrJu1x4KM7mktwdf1zXyR5kNVvDT/knKeEMBCfBibEXIokJELFTXdVtwS0
         V5n1KYIBd3dSGADrPdx4MabPxQlXFKc1+2rW2JoCuTHhzSpU3VVoGU/aHMaPLXH/zC93
         u8Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si1279907qkg.271.2020.02.07.05.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 05:06:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j03Kb-0008BO-Uv
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 08:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1j03KP-0007ya-7F
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:05:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1j03KN-0007nC-Rr
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:05:48 -0500
Received: from 18.mo6.mail-out.ovh.net ([46.105.73.110]:57387)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1j03KN-0007iS-LS
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:05:47 -0500
Received: from player688.ha.ovh.net (unknown [10.108.35.240])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id D92AC1FD73A
 for <qemu-arm@nongnu.org>; Fri,  7 Feb 2020 14:05:38 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 465CAF0846DA;
 Fri,  7 Feb 2020 13:05:32 +0000 (UTC)
Subject: Re: [PATCH] hw/arm: ast2400/ast2500: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>
References: <20200206183437.3979-1-linux@roeck-us.net>
 <e9f490fe-34d3-6830-832c-155f6fa63482@kaod.org>
 <1605922b-2aa0-dd8e-720a-031e74bc9872@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78e3367c-765b-cfa8-b730-b8b237dd0c81@kaod.org>
Date: Fri, 7 Feb 2020 14:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1605922b-2aa0-dd8e-720a-031e74bc9872@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 6963127976708770624
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheehgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehkvghrnhgvlhhtvghsthhsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieekkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.73.110
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WX/U2zZDuaJQ

On 2/7/20 1:58 PM, Guenter Roeck wrote:
> On 2/7/20 12:16 AM, C=C3=A9dric Le Goater wrote:
>> On 2/6/20 7:34 PM, Guenter Roeck wrote:
>>> Initialize EHCI controllers on AST2400 and AST2500 using the existing
>>> TYPE_PLATFORM_EHCI. After this change, booting ast2500-evb into Linux
>>> successfully instantiates a USB interface.
>>>
>>> ehci-platform 1e6a3000.usb: EHCI Host Controller
>>> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus numb=
er 1
>>> ehci-platform 1e6a3000.usb: irq 21, io mem 0x1e6a3000
>>> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
>>> usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bc=
dDevice=3D 5.05
>>> usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D=
1
>>> usb usb1: Product: EHCI Host Controller
>>
>> Cool. Have you tried to plug any devices ?
>>
>=20
> Yes, booting from USB drive works just fine. I already added it to my
> test suite at kerneltests.org.
>=20
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>>
>> This looks good. Could you add the AST2600 also ?
>>
>=20
> I thought about that, but how would I test it ? None of the ast2600
> systems in the Linux kernel enables it. The devicetree include file for
> ast2600 doesn't even have an entry for it. I could cook something up,
> but that would not reflect real hardware.

This is true. I suppose we could activate EHCI on the ast2600 evb.=20

Anyhow, let's move on.=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

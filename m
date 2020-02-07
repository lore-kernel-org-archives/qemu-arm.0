Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp642317lfp;
        Fri, 7 Feb 2020 06:31:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5uM05mLZGp8FIcowbWDdgsgSuUiqtK3oMZHDGWedWUbdsIMNUZkV9JEM5OlOZPmG4Y8EY
X-Received: by 2002:a05:620a:13ca:: with SMTP id g10mr6379989qkl.313.1581085896280;
        Fri, 07 Feb 2020 06:31:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581085896; cv=none;
        d=google.com; s=arc-20160816;
        b=MTgirWhbIDkC2euJgEl6/+EAUYSLptPBaKTYVdYSkzvl98BQvx/kx73MoAGGkg2rhu
         vW9ve0U3btPDg1KzyJFTHu6kvRG2lrBiLfAoetUqKNh08H/LG/qlpUfbyZ2BiAjZEE1H
         u5UgmgJcSdOa430+dt3Yg1U04Z9OP81t67pTrL3X0OWMR7yC9/hmO5xbyT4P+tU3jzG0
         fU3tnCR7+jUOAtMEyNtjieQnpLFdf2A7y24rkqZ0gEU/NZyPab+9P777KVwVVv8kPTDr
         kSWXLXLkvUBwvbcd1U46NFP9zyA9xw4msFlSmhql/E75ZZeKueW95DfkKigLSs8U/87I
         WLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=IovgtA238ERKNqoRoODXoAHsRlXAonbLaJ/8rq58plk=;
        b=KIHiWIwgrWPi5yuVrN2qOrfyD4pWL3ARNcK9G64RYEMIhouZFcZkAL7HZFDe0xtmlR
         5AJtvSJOS8FBYQEmsKgI+UeP0lEBal3Q3iA5YBxmrqY5N5Z+vkQbxPtJHGVWOjhazMH1
         fX8RJFyq/eOYbZbnaW7ZgXKWnZyBdoaxKCGfDdOU+AWiQDdvXPZlZbS5R1Lw8N3LKVtR
         YbqJfHh2Bg+B7qRWmiJNey/u+tjcJxsqQP5V3gmyQ7Y++h+wAbTaYvA9T7on621EV5cO
         MYvM6u1MtY9VnZAZEaj8tnEE2j05El+lRQzqEu7ofnN8clV9Cx/jDUFRhQ1xLtQnMlZk
         Bi+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si1317201qki.77.2020.02.07.06.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 06:31:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j04fP-0004BM-NO
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 09:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1j04ee-00047c-Jq
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:30:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1j04ed-00006b-1U
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:30:48 -0500
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:59354)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1j04ec-0008Vu-RZ
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:30:46 -0500
Received: from player789.ha.ovh.net (unknown [10.110.103.168])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 9DA9D1223F2
 for <qemu-devel@nongnu.org>; Fri,  7 Feb 2020 15:30:44 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 81C40F282A61;
 Fri,  7 Feb 2020 14:30:35 +0000 (UTC)
Subject: Re: [PATCH] hw/arm: ast2400/ast2500: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
References: <20200206183437.3979-1-linux@roeck-us.net>
 <e9f490fe-34d3-6830-832c-155f6fa63482@kaod.org>
 <1605922b-2aa0-dd8e-720a-031e74bc9872@roeck-us.net>
 <CACPK8XdADQwGnsX=YR0n_zm_WMv532bAmR3O-CfyJ23ytT9bpA@mail.gmail.com>
 <ebcfceea-2f70-7e88-0996-b072ec81f59e@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c4d751a8-1f7e-4adf-c883-c69112185626@kaod.org>
Date: Fri, 7 Feb 2020 15:30:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ebcfceea-2f70-7e88-0996-b072ec81f59e@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 8400339208267205440
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheehgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehkvghrnhgvlhhtvghsthhsrdhorhhgpdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.172
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0SbgyBuAO0NI

On 2/7/20 3:21 PM, Guenter Roeck wrote:
> On 2/7/20 5:09 AM, Joel Stanley wrote:
>> On Fri, 7 Feb 2020 at 12:58, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 2/7/20 12:16 AM, C=C3=A9dric Le Goater wrote:
>>>> On 2/6/20 7:34 PM, Guenter Roeck wrote:
>>>>> Initialize EHCI controllers on AST2400 and AST2500 using the existi=
ng
>>>>> TYPE_PLATFORM_EHCI. After this change, booting ast2500-evb into Lin=
ux
>>>>> successfully instantiates a USB interface.
>>>>>
>>>>> ehci-platform 1e6a3000.usb: EHCI Host Controller
>>>>> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus nu=
mber 1
>>>>> ehci-platform 1e6a3000.usb: irq 21, io mem 0x1e6a3000
>>>>> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
>>>>> usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, =
bcdDevice=3D 5.05
>>>>> usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumbe=
r=3D1
>>>>> usb usb1: Product: EHCI Host Controller
>>>>
>>>> Cool. Have you tried to plug any devices ?
>>>>
>>>
>>> Yes, booting from USB drive works just fine. I already added it to my
>>> test suite at kerneltests.org.
>>
>> Nice!
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>
>>>> This looks good. Could you add the AST2600 also ?
>>>>
>>>
>>> I thought about that, but how would I test it ? None of the ast2600
>>> systems in the Linux kernel enables it. The devicetree include file f=
or
>>> ast2600 doesn't even have an entry for it. I could cook something up,
>>> but that would not reflect real hardware.
>>
>> FYI, there are patches on the linux-aspeed list to enable USB:
>>
>> =C2=A0 https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D=
156260
>>
>> They have not yet been merged into the kernel, but I will merge the
>> device tree changes once -rc1 is out.
>>
>=20
> Excellent. With the above series, and after enabling ehci1 for ast2600-=
evb
> and adding the necessary code to qemu, I get
>=20
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> ehci-platform: EHCI generic platform driver
> ehci-platform 1e6a3000.usb: EHCI Host Controller
> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number=
 1
> ehci-platform 1e6a3000.usb: irq 25, io mem 0x1e6a3000
> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> usb usb1: Manufacturer: Linux 5.5.0-09825-ga0802f2d0ef5-dirty ehci_hcd
>=20
> and I can mount a USB drive. Is that good enough for a follow-up patch,
> or should I wait until the code finds its way into the Linux kernel ?

I don't think we need to wait for Linux to be ready to add support in QEM=
U.

Thanks,
C.=20
=20

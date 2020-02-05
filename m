Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp362235lfp;
        Wed, 5 Feb 2020 09:19:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEpkSitRaL47tIXHDZNnAXCBHO25Kzs8ZR1dHyF5yLdeNsFBXW2CAD5CbeUpEMpJzApNhk
X-Received: by 2002:a37:e505:: with SMTP id e5mr31224477qkg.324.1580923185703;
        Wed, 05 Feb 2020 09:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580923185; cv=none;
        d=google.com; s=arc-20160816;
        b=WgtCT3KVJiasz1kjUmoPi/vQMXqOK56Y/IY3iDmOSCujnDHnVGTuI8bYR936sr/+QV
         2PH8r0X6c4Nu2sOOO67jL67IzDx8XCR/CzQX/iTkw3ZC7EJsE3L0DYnnpKi2JdnheHkI
         XNS7UVSz9o0DL+Gvz1bO8Kj7cPTLNWEzuIWrjUMLW1jC2ZtGaFVFjzUEDZ4NT4gtBKmW
         Kh76dfqUpf4x0LwbyoaqYCAa7IRBlYJfqDJn0dTX8uv5ipgRQ+AjJSOalROwlM9dy452
         v1aH3MP7ZZjOoeGfOtLhTvKlNZcpEYFVZKVaEX7VOXCPjmrLAFO3s6k7zPnDieIq+CgM
         OT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=FVf94VGyWUo1qqdPyysU/4nnEdix1xBkbxsK1Q80U/o=;
        b=v9OMM3I6ODEBuCdLJIDgrq1mNCQg8vjUf3/qXP2MPGh9FV4ru1n5HUFZfqTSM+Idse
         ghIeasUomx0pa8xEuS9G6aygMPI/WHXeHyPz44YjNew4XakaZs2sLbjHr/NwaRhxdu3s
         L8T4vnbyuTSSSqfx9v57xoJ3R4DepkCfDn/8TwKX4SDn4+ZT4ZpTXZ4BY92mToJFc8nc
         fO5+bzBMivPGJiz7ImsUwiAnYJqm8gbdh5aYx9zpyDwgrX87n6EAnXua+rMWjh2HMlRp
         cN1ga6xPjskUq5RpC/5NQhDo9UrLdsMaC8h8jPGQ83IteqOxvmSj2iIb3krTe5y0pTHw
         RbRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si233993qvm.45.2020.02.05.09.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 09:19:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izOL3-0002G7-4A
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 12:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izOCb-0005V8-BX
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:11:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izOCZ-0006e6-J7
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:11:01 -0500
Received: from 12.mo5.mail-out.ovh.net ([46.105.39.65]:36358)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izOCZ-0006Ts-7P
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:10:59 -0500
Received: from player760.ha.ovh.net (unknown [10.110.103.226])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 05BB826B575
 for <qemu-devel@nongnu.org>; Wed,  5 Feb 2020 18:10:56 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 2F66AF0CAE0D;
 Wed,  5 Feb 2020 17:10:45 +0000 (UTC)
Subject: Re: [PATCH 1/3] m25p80: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <615518c7-f4c8-7c08-9096-bcf5f583eeb1@kaod.org>
 <20200205163520.GE25403@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a4ee58d2-0642-b4f4-2756-84d9f08b08a9@kaod.org>
Date: Wed, 5 Feb 2020 18:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205163520.GE25403@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17807232929370049504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrhedugdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.65
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MQeefbhHnGOq

On 2/5/20 5:35 PM, Guenter Roeck wrote:
> On Wed, Feb 05, 2020 at 11:05:04AM +0100, C=C3=A9dric Le Goater wrote:
>> On 2/3/20 7:09 PM, Guenter Roeck wrote:
>>> While at it, add some trace messages to help debug problems
>>> seen when running the latest Linux kernel.
>>
>> In case you resend, It would be nice to printout a flash id in the tra=
cing
>> else I have a patch for it on top of yours. It helped me track a squas=
hfs
>> corruption on the Aspeed witherspoon-bmc machine which we were after s=
ince
>> 2017 or so. It seems to be a kernel bug.
>>
>=20
> I'll send a new version to split patch 2. Not sure I understand what yo=
u mean
> with the above. If you send me your patch I'll be happy to merge it int=
o mine,
> otherwise we can just keep it as follow-ip patch.

Here is the idea :=20

  https://github.com/legoater/qemu/commit/a07727e9cfc8447ea18249ff68a561f=
7e8883584

You can merge and maybe extend to all traces.


In the issue we had, two CS could be selected at the same time=20
and the SPI transfers were getting mixed. Printing out which
CS is doing what is interesting for debug.=20

Thanks,
C.

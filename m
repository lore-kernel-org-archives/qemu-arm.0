Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp544902wrt;
        Fri, 5 Oct 2018 08:39:06 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60efF657OaMeQtO1lNpYF42gSIR7CP+V4bC9j2kUqxvyi4UXBNN3jIChH/OiC6lozPcowAP
X-Received: by 2002:ac8:540d:: with SMTP id b13-v6mr9642113qtq.242.1538753946532;
        Fri, 05 Oct 2018 08:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538753946; cv=none;
        d=google.com; s=arc-20160816;
        b=tLCc4wbNBeZjSrWk5X0yvvrxJwD2e5mRk/YJNcsaLAB72QBzoJssd59xPk8AGshmD7
         mrmnQoAqMTSIX6IkcBOvUcvneh6bgeM3yKRSmeFqH1oMTc1j4HvQ/Ma/RM5WeJ7POXKv
         entyZtdbMKWYQp+3oVxF4qD9g/l3wL76NXmWMWbV1+oTpstMe6qQHNoUrVAm6h5Lg1DN
         n3mhwA3wRG3uxHjU+b5fa3rTXw81KcH1IwmHk8jGnmTEhVNJslv3vCZqxI1znuZqx1AM
         LXyGOzMeLgE3mbFG3ZJF4JdARaaPyLB+RNTWz/LTm/xgKfe2BVSHGW4tcmgAwV+Pt3Lb
         Z+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=6i+ZLBd1tuS9LCNPmDSLneLtcH4z343uQhOlDfmYYWo=;
        b=D/o9SgDCfJKUwIqZbEFgN5W+uAfG3diL9wsQghKuj+YmhS8AFr+j/LCLHkUdf/KXJn
         fRGRXZNLvnt/wLVmmZYPzqQFw2TpbbsN9cjH7l+91u21stIq5zMHMXjdnhJSWpuJjr5r
         Gd7U4sAXXJIlbqHFpR9kPKxPEEjDrVYJA2qC3Y8hT8yR9WG1IdV7c0tbj817i2SEUUIM
         R8xXZAL/hc6KAHunbg48rJr/9teYqClWziHU4CU4QYwgQLNWUQfowKYF8wrROGDv2xE7
         EMrzDqmo7xNe344PAnixlk0UADPcVbMq8DseccoBECPlDY0U5sAd1eUqhNjnYgs6wdnu
         DUNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x200-v6si5690361qka.98.2018.10.05.08.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 08:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8SC2-0001JY-1v
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 11:39:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g8SBi-0000u8-SL
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 11:38:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g8S3N-0003HJ-0c
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 11:30:14 -0400
Received: from 5.mo68.mail-out.ovh.net ([46.105.62.179]:58374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g8S3M-0003GT-Ph
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 11:30:08 -0400
Received: from player693.ha.ovh.net (unknown [10.109.143.223])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 92675FEDF5
	for <qemu-arm@nongnu.org>; Fri,  5 Oct 2018 17:30:06 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 7E72E44008C;
	Fri,  5 Oct 2018 17:29:57 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-9-clg@kaod.org>
	<CAFEAcA8W0ixkfje4NSx-+kdw4rNh44JgNTu2OhDD_p91nHK7hw@mail.gmail.com>
	<f18e92fa-7b49-04b6-0adb-4f1a84668168@kaod.org>
	<CAFEAcA_injuKY7=fLvG7sj2p7Ffzx5tNQ4f3RxjsNk8Hy-rYMA@mail.gmail.com>
Message-ID: <e677b210-0879-2127-2ea6-e76f21313a3d@kaod.org>
Date: Fri, 5 Oct 2018 17:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_injuKY7=fLvG7sj2p7Ffzx5tNQ4f3RxjsNk8Hy-rYMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9475010666754575300
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrtdeigdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.62.179
Subject: Re: [Qemu-arm] [PATCH v2 08/11] aspeed/smc: add support for DMAs
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
X-TUID: URg3GFcUBij+

On 10/2/18 6:12 PM, Peter Maydell wrote:
> On 2 October 2018 at 16:48, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 10/2/18 12:56 PM, Peter Maydell wrote:
>>> Rather than having the DMA device directly grab the system_memory
>>> MR like this, it's better to have the device have a MemoryRegion
>>> property, which the SoC sets with whatever the DMA device should
>>> be able to see.
>>
>> ok. I see, but it seems I have a chicken & egg problem.
>>
>> The MemoryRegion I would liked to grab is the bmc->ram one in aspeed.c
>> but it is initialized after the SoC is. I don't know how to lazy bind
>> this region in the Aspeed SMC model using the Aspeed SoC model as a
>> proxy to pass the region property through a link or/and alias.
>>
>> If I could find a way, the model would be much cleaner.
>=20
> Usually what you want to pass is not the RAM region directly but
> some container object (which contains the RAM region among
> other things). This is often a container that you're passing
> to the SoC anyway so it can put its devices in it.
>=20
> (The direct answer to your chicken-and-egg problem is that you
> can create a container before creating the SoC, pass that to
> the SoC, then create the RAM afterwards and put it in the
> container after. But that feels a bit like a workaround for
> a less than ideal structure, somehow.)

couldn't we just initialize the RAM under the SoC ? We don't need
it at the machine level AFAICT, nor does the raspi model I think.

What is the rational behind putting the RAM region in a state=20
structure at the machine level ?=20

Thanks,

C.

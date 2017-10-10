Received: by 10.223.197.9 with SMTP id q9csp3552177wrf;
        Tue, 10 Oct 2017 06:21:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDO78UO2t1DRtSF9OSzjaALlhWZfKGPx9ftJdt964gp3PBR6medM1xmhQEVSf+Cyra/QEkf
X-Received: by 10.55.108.135 with SMTP id h129mr3906000qkc.111.1507641698528;
        Tue, 10 Oct 2017 06:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507641698; cv=none;
        d=google.com; s=arc-20160816;
        b=dUnVboiXPhPFWkXu2t1MrpXoj59sd3LWlamJxbfVWaQKM3VijQfWfgI8AMwTk8JDOJ
         HOEvy3zO/W/rhkuaIt2B0YnfwZ8J7rm3xvMRXpWsDQTGz+9hik59BNbCvakPm3hbsxJh
         mavM+mh4dRa9PtLfpiCkwp8moXBgLUVAru4TLb2MvpQnoieqb5boPXEaaNvt+kUGwPk/
         6hh4tbJRiv7MiVCbM15rrTfqWYHMbiNbUmq6Ku0F50FbtIw2M6z+gX+rdazdLizVLNuB
         QRRH3nLNEplars9t3mTRa4OAh65/OAr+7hw6pL91lAVjXjlTo93YpeJiMdusyy/VCrxW
         MbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=uBv3GndVOJKDqj6pEBpoEkjGfsGROSmhhn6D6Vvq/TI=;
        b=eSH7QqChn27FhE1WAb1S4hBU66zET9H6o30zCNCVEb6smPRIeY1b62jx5tmV10GHod
         3cxxe00gOnAXB/tLMGyPUpJGjWQJDAs1ll0nOMshiFtmzwDKa2EaW1tfZ85dNrZeGf3M
         Xqk2G39HcBmABxb+NUdOH3vqyo2yUKczudfbx2lAS6q6xh7UNaNspmsJxwqnZ2obpOiG
         J5EIRViMs7hoVIcRRQIL1ppCZVQSsG1E0ko8wLlr/o90j6x9gbUJsUGNZ7eqaWdFFc56
         x1+d7xxtBPKQiGmRr3aWZPXJlD5NOeJfiAbjSaWDAGmHdV9jyNGRVW2wUWuV81TmgFtH
         2ziw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b76si8616130qka.347.2017.10.10.06.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 06:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1uTY-0001po-6O
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 09:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1uTG-0001nn-Th
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:21:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1uTA-00035O-RN
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:21:18 -0400
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:44029)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e1uTA-00033l-KO
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:21:12 -0400
Received: from player728.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 9052D5A401
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 15:21:09 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice3n7.emea.ibm.com
	[195.212.29.177]) (Authenticated sender: postmaster@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id D64805400A1;
	Tue, 10 Oct 2017 15:21:02 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
	<f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
	<CAFEAcA-kJ-qEoo-2ZWaH0XPv-cJA4O3wZAW=FwmM5nUU4-mVBg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <900ffff3-3667-7e17-bf38-7c6a520ed838@kaod.org>
Date: Tue, 10 Oct 2017 15:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-kJ-qEoo-2ZWaH0XPv-cJA4O3wZAW=FwmM5nUU4-mVBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 14502998177632586692
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtddtgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.76.150
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
X-TUID: Jp3PsFbAm0Lz

On 10/10/2017 11:54 AM, Peter Maydell wrote:
> On 10 October 2017 at 10:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> On 10/06/2017 05:10 PM, Peter Maydell wrote:
>>>> +    mc->ignore_memory_transaction_failures =3D true;
>>>
>>> Please don't set this flag for new board models, it is only
>>> for our legacy existing ones. Instead implement any devices
>>> that you need for guest code to boot (stub them out with
>>> create_unimplemented_device() if you like).
>>
>> I have dug into this a little more and it seems that it is
>> required for the Aspeed bootloader (a modified u-boot) which
>> uses static variables in early init phases. So legacy firmwares
>> won't work in QEMU but will on real HW.
>>
>> It's fine with me but what is the goal of the approach ? Force
>> SoC providers into fixing their FW when they use QEMU ?
>=20
> The goal is to model hardware correctly. Hardware gives
> aborts if you touch a physical address with no device there,
> and so QEMU's model should do the same. If you have guest
> code that touches a physical address and blows up because
> of an abort (but doesn't when run on h/w) then either:
>  * it is trying to probe a device that exists in real h/w:
>    you need to provide a stub implementation in QEMU
>  * the SoC's bus fabric really doesn't pass aborts back
>    to the CPU; I think this is unlikely, but you can model
>    it at the SoC level with a suitable default memory region

well, that is case it seems.=20

Anyhow, I found the required fixes in u-boot, so I will go with=20
ignore_memory_transaction_failures=3Dfalse with this new machine.

Thanks,

C.=20
=20
> The purpose of the flag is purely for existing board models,
> where it is impossible to enable the correct (abort)
> behaviour without possibly breaking guest code images that
> work for people using released QEMU code. On a new board
> model we don't have that problem and we can get it right
> from the start. If we don't get it right from the start
> then we will never have a chance to fix it in future.
>=20
> Our mismodelling of this (not turning accesses to invalid
> addresses into CPU aborts) meant that in the past it was
> possible to be lazy when implementing a board model and
> just not model half the hardware at all. Now it isn't,
> but I don't think that adding a set of calls to
> create_unimplemented_device() is a significant imposition.
>=20
> thanks
> -- PMM
>=20


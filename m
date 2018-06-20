Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp785968wrq;
        Wed, 20 Jun 2018 06:44:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIMTeS/WBtrCMqslB1PlGIuDIbnAIMeXsP0+7sWQGe3Wt160Y5XmEfyXZkX/o6kY7iPP4dT
X-Received: by 2002:ae9:e8c2:: with SMTP id a185-v6mr17926973qkg.223.1529502278597;
        Wed, 20 Jun 2018 06:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529502278; cv=none;
        d=google.com; s=arc-20160816;
        b=hDXxm3EaVDLuNxlkQ4eFVox1caRLQfTobmNTzFzhrf2jxrDstnxgNbcnByF45SbyNn
         ZNxTydAO3PrvtfldaBCX86L+JvKluL4LpbbSKsuickhYEDI46QNfdfk9bQ3xPuFaI/t8
         4lP25dIkX/R0O5ZIeqMBkO6fbVoya747b4XdkkB3HWcZCsk9/qFA5ssYPTpqpdqM+oGG
         DLAUybIZWfLZv79D/LX7u5dY5GLZjRrkvpxuqABlmJWbhJTziQj4WsziPT4eQD+VT3Bp
         JWYynbtvipTSxbfyHFyIBSVVq+0VV1vMYka5IyqpksyKFhCW3G30+bzQ4nMwow9psZxo
         Cu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=lT7IXe2wilRTRFMTnPGz4JQDz6uTkRJ/JuJ1ZNA9fEU=;
        b=PcTY5yltYivusJO1YXbxrxKbMM8LfU6sANVwQgsQA5xWqrV42BnmmNfsuwuSjfegMW
         ppQDkSC2fQoYEghnbEhkxT3+NmoxGvrCmhOdbRrBXZEEFEFV4J0/a8GtIZRAasoVQk2N
         UC01+nCmXm3GbPImCGknKIVcwkevXcGVa/NXwhWfzQJKaLOgy4za4AMM7BwXmyzsb2CB
         oqvJBU8/YqHSIVrpkkGwAT9v5SdeVeaftSr2T9MUHRM0E/Whw2ZrpZzltCQ6hKK2FfaP
         MCgVRAdS6xdzOr96F2qnRtJONZat0NEjSilRpFjWV33yRJmMYMmrx8fmgiRquRdD4bEc
         7rmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x76-v6si2309925qkb.248.2018.06.20.06.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVdPa-0003h3-4F
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:44:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fVdPF-0003g8-Mm
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fVdPC-0003XW-LL
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:44:17 -0400
Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239]:55142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fVdPC-0003Wu-Es
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:44:14 -0400
Received: from player693.ha.ovh.net (unknown [10.109.108.4])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 8A0411C363B
	for <qemu-devel@nongnu.org>; Wed, 20 Jun 2018 15:44:12 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 6C5EB44009E;
	Wed, 20 Jun 2018 15:43:59 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180612065716.10587-1-clg@kaod.org>
	<CAFEAcA9KJVw0fuuXY_Ya_F6ELrp-MmgTit4oHU_e0xM+VTdnWA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <63e6fc9d-3c14-b5b6-4434-bf226a241ab4@kaod.org>
Date: Wed, 20 Jun 2018 15:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KJVw0fuuXY_Ya_F6ELrp-MmgTit4oHU_e0xM+VTdnWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 6497568363155327955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtddvgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 91.121.55.239
Subject: Re: [Qemu-devel] [PATCH 0/3] aspeed/smc: small fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c27NUyZ7JVRR

On 06/20/2018 03:40 PM, Peter Maydell wrote:
> On 12 June 2018 at 07:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> Here is a short series of cleanups and fixes for issues in the Aspeed
>> SMC controller model discovered when experimenting with the MMIO exec
>> feature and also from tests under a QEMU PowerNV machine.
>>
>> Indeed, the OPAL/skiboot firmware accesses the Aspeed SoC address
>> space using the iLPC->AHB bridge of the SuperIO controller and drives
>> the SPI controller to access the PNOR.
>=20
> Is there anybody familiar with the aspeed SoC who'd like to
> review? The patches don't look particularly wrong, but I'm
> not really in a position to be able to review...

Adding Andrew and Joel as I should have.

Thanks,

C.


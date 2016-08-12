Received: by 10.25.21.156 with SMTP id 28csp232784lfv;
        Fri, 12 Aug 2016 09:12:19 -0700 (PDT)
X-Received: by 10.55.141.193 with SMTP id p184mr19299049qkd.94.1471018339650;
        Fri, 12 Aug 2016 09:12:19 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h82si3718568qke.74.2016.08.12.09.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 09:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYF4F-0002Q6-27
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 12:12:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bYE9o-00076I-43
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bYE9j-000611-Os
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:13:59 -0400
Received: from mo6.mail-out.ovh.net ([178.32.228.6]:51366)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bYE9j-00060e-GZ
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 11:13:55 -0400
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 58864FF8AAF
	for <qemu-devel@nongnu.org>; Fri, 12 Aug 2016 10:38:51 +0200 (CEST)
Received: from [192.168.1.11] (ARennes-257-1-62-53.w81-53.abo.wanadoo.fr
	[81.53.141.53]) (Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id EEC66DAD;
	Fri, 12 Aug 2016 10:38:46 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<CAFEAcA_sa3eJx5WtZzkxYKsKkrT3OmyhXH46U+a7VaJJBdODwQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a51aea17-b72b-bdef-0b41-ddbfbf8f2626@kaod.org>
Date: Fri, 12 Aug 2016 10:38:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_sa3eJx5WtZzkxYKsKkrT3OmyhXH46U+a7VaJJBdODwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 10023605396064799659
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddruddtgddtgeculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.6
Subject: Re: [Qemu-devel] [PATCH v3 00/10] arm: add ast2500 support
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tb1kAe95AYin

On 08/11/2016 12:47 PM, Peter Maydell wrote:
> On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>     On the AST2500, I am still having a little issue under uboot which
>>     sets the vbar doing :
>>
>>         mcr     p15, 0, r0, c12, c0, 0  /* Set VBAR */
>>
>>     and this is trapped as an undefined instruction by qemu.
>>
>>     Looking at hw/arm/helper.c, the VBAR register seems to be defined
>>     only for feature ARM_FEATURE_V7 (v7_cp_reginfo). The AST2500 SoC
>>     uses a arm1176 which defines ARM_FEATURE_EL3 which gives us a
>>     VBAR_EL3.  According to th specs, the arm1176jzf-s has a Vector
>>     Base Address Register. So am I missing something in the board
>>     definition or is uboot being too optimistic on the cpu features ?
>>     This is confusing for me, some direction would be welcomed :)
>=20
> This looks like a bug in helper.c -- we originally added the VBAR
> definition as a bit of a hack since it's only supposed to exist
> in CPUs with the security extensions and at the time we didn't
> implement those at all. It should definitely exist in the 1176
> too, so we should move the definition around somewhere so it does.
> (The 1176 is the only non-v7 CPU with security extensions support,
> which is why it got missed I suspect.)

OK. I will give it a try in a standalone patch. Is there a scenario=20
I could use to catch possible regression on other cpus ? =20

Thanks,

C.

> thanks
> -- PMM
>=20


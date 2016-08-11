Received: by 10.25.21.156 with SMTP id 28csp51879lfv;
        Thu, 11 Aug 2016 03:31:30 -0700 (PDT)
X-Received: by 10.55.135.194 with SMTP id j185mr9941322qkd.56.1470911490164;
        Thu, 11 Aug 2016 03:31:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l103si1154608qkh.246.2016.08.11.03.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnGr-0007JY-FQ
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:31:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bXnCt-0002PK-Lw
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:27:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bXnCq-0008E8-HR
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:27:23 -0400
Received: from 3.mo6.mail-out.ovh.net ([178.33.253.26]:34995)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bXnCq-0008DY-Ai
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:27:20 -0400
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 01C2CFFAA32
	for <qemu-arm@nongnu.org>; Thu, 11 Aug 2016 12:27:17 +0200 (CEST)
Received: from [192.168.1.11] (ARennes-257-1-62-53.w81-53.abo.wanadoo.fr
	[81.53.141.53]) (Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id D84E86A0;
	Thu, 11 Aug 2016 12:27:13 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-2-git-send-email-clg@kaod.org>
	<CAFEAcA9oQF-kCB4-pYkQn7euwnwyjVo=Oxnv2DbFYssA4_BtZA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c52b7571-152d-c1cc-9094-067484231a8a@kaod.org>
Date: Thu, 11 Aug 2016 12:27:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9oQF-kCB4-pYkQn7euwnwyjVo=Oxnv2DbFYssA4_BtZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 5982187682171947947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrtdejgddvjeculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.253.26
Subject: Re: [Qemu-arm] [PATCH v3 01/10] ast2400: rename the Aspeed SoC
 files to aspeed_soc
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GFTf3uydFEf5

On 08/11/2016 12:22 PM, Peter Maydell wrote:
> On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Let's prepare for new Aspeed SoCs and rename the ast2400 file to a
>> more generic one. There are no changes in the code apart from the
>> header file include.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/Makefile.objs        |   2 +-
>>  hw/arm/aspeed_soc.c         | 229 +++++++++++++++++++++++++++++++++++=
+++++++++
>>  hw/arm/ast2400.c            | 229 -----------------------------------=
---------
>>  hw/arm/palmetto-bmc.c       |   2 +-
>>  include/hw/arm/aspeed_soc.h |  44 +++++++++
>>  include/hw/arm/ast2400.h    |  44 ---------
>>  6 files changed, 275 insertions(+), 275 deletions(-)
>>  create mode 100644 hw/arm/aspeed_soc.c
>>  delete mode 100644 hw/arm/ast2400.c
>>  create mode 100644 include/hw/arm/aspeed_soc.h
>>  delete mode 100644 include/hw/arm/ast2400.h
>=20
> If you give git format-patch the -M option then it will
> enable rename detection, which will then produce a patch
> that just says the file was renamed, rather than giving
> it as a "+229 lines, -229 lines" enormous diff.

ok. This would be much better.

Thanks,

C.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> thanks
> -- PMM
>=20


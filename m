Received: by 10.25.21.156 with SMTP id 28csp584632lfv;
        Wed, 3 Aug 2016 00:04:53 -0700 (PDT)
X-Received: by 10.200.47.39 with SMTP id j36mr107144614qta.10.1470207893269;
        Wed, 03 Aug 2016 00:04:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s70si1372559qki.330.2016.08.03.00.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 00:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUqEW-0000WQ-P7
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 03:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUqD7-0007si-Qy
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 03:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUqD3-00057Q-LC
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 03:03:24 -0400
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:37369)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUqD3-00057E-FL
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 03:03:21 -0400
Received: from player696.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id E1EE4FFA12D
	for <qemu-devel@nongnu.org>; Wed,  3 Aug 2016 09:03:18 +0200 (CEST)
Received: from localhost.localdomain (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player696.ha.ovh.net (Postfix) with ESMTPSA id 036783C006E;
	Wed,  3 Aug 2016 09:03:08 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-11-git-send-email-clg@kaod.org>
	<1470183785.4428.45.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <315707e3-1058-59d9-e9cf-ad7501eafe7b@kaod.org>
Date: Wed, 3 Aug 2016 09:03:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470183785.4428.45.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 10895896349947562928
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeelgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.56.78
Subject: Re: [Qemu-devel] [PATCH v3 10/10] palmetto-bmc: remove extra
 no_sdcard assignement
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IEXjRZyIJCK+

On 08/03/2016 02:23 AM, Andrew Jeffery wrote:
> On Tue, 2016-08-02 at 19:15 +0200, C=C3=A9dric Le Goater wrote:
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>


Thanks for the overall review Andrew,

C.=20


>> ---
>>  hw/arm/aspeed.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index e71500c64bd3..6d7b70df70da 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -145,7 +145,6 @@ static void palmetto_bmc_class_init(ObjectClass *o=
c, void *data)
>>      mc->no_sdcard =3D 1;
>>      mc->no_floppy =3D 1;
>>      mc->no_cdrom =3D 1;
>> -    mc->no_sdcard =3D 1;
>>      mc->no_parallel =3D 1;
>>  }
>> =20


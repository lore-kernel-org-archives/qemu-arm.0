Received: by 10.25.21.96 with SMTP id l93csp944765lfi;
        Wed, 6 Jul 2016 09:32:04 -0700 (PDT)
X-Received: by 10.237.47.228 with SMTP id m91mr35035138qtd.35.1467822724766;
        Wed, 06 Jul 2016 09:32:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h10si2855979qte.29.2016.07.06.09.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jul 2016 09:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKpk4-0002Jq-5B
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 12:32:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bKpia-0001Uy-8g
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 12:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bKpiU-0003W0-V9
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 12:30:31 -0400
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:38773)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bKpiU-0003Vm-Oo
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 12:30:26 -0400
Received: from player774.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 9046BFFA5B6
	for <qemu-devel@nongnu.org>; Wed,  6 Jul 2016 18:30:24 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player774.ha.ovh.net (Postfix) with ESMTPSA id E882A4007D;
	Wed,  6 Jul 2016 18:30:18 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<daf14775-cbd6-3f5d-a384-e50b1dc7830b@kaod.org>
Message-ID: <f9b1192b-27ef-ae8f-947d-0a5151fbe26d@kaod.org>
Date: Wed, 6 Jul 2016 18:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <daf14775-cbd6-3f5d-a384-e50b1dc7830b@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3611886902628027307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvdeigdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.174.144
Subject: Re: [Qemu-devel] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0I49/RZ0SGGd

On 07/04/2016 08:12 PM, C=C3=A9dric Le Goater wrote:
> On 07/04/2016 07:57 PM, mar.krzeminski wrote:
>>
>>
>> W dniu 04.07.2016 o 14:18, C=C3=A9dric Le Goater pisze:
>>> Some SPI controllers, such as the Aspeed AST2400, have a mode in whic=
h
>>> accesses to the flash content are no different than doing MMIOs. The
>>> controller generates all the necessary commands to load (or store)
>>> data in memory.
>>>
>>> To emulate such a behavior, we need to have access to the underlying
>>> storage of the flash object. The purpose of the routine is to set the
>>> storage of a preinitialized SPI flash object, which can then be used
>>> by the object itself but also by a SPI controller to handled the
>>> MMIOs.
>> Hi,
>>
>> I am not sure if this approach is correct. I can not find any datashee=
t
>> to this SPI controller, but as you mentioned in first paragraph, contr=
oller
>> generates all commands (probably ones are somehow configurable).
>=20
> yes. see this patch :
>=20
> 	http://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg08229.html
>=20
> 	/* CEx Control Register */
> 	#define R_CTRL0           (0x10 / 4)
> 	#define   CTRL_CMD_SHIFT           16
> 	#define   CTRL_CMD_MASK            0xff
>=20
>=20
>> In this series you hack this behaviour and you do direct access to fil=
e.
>=20
> It is true it is not very respectful of the m25p80 interface.
>=20
>> IMHO you should emulate sending such commands in SPI controller
>> model.
>=20
> I will give it a try. I don't think the alternative is a complex=20
> change anyhow.

So yes, that would work out pretty well. But there is another need=20
that does not show up in the series (I am not splitting the patches=20
correctly I guess) We would like to boot directly from a flash image.=20
For this purpose, the pflash_cfi object uses a memory region of type=20
rom and uses the storage behind the region.

m25p80_set_rom_storage() is probably not the right API to share the=20
storage. I am looking for a way to handle this without changing too
much m25p80, which does not have a mem region currently. Suggestions=20
welcomed ! :)=20

Thanks,

C.=20


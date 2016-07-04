Received: by 10.25.21.96 with SMTP id l93csp1528057lfi;
        Mon, 4 Jul 2016 06:43:49 -0700 (PDT)
X-Received: by 10.55.192.143 with SMTP id v15mr15352423qkv.23.1467639828988;
        Mon, 04 Jul 2016 06:43:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e63si2044356qkf.23.2016.07.04.06.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 06:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK4A8-0006HV-95
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 09:43:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK48D-0005AG-RJ
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 09:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK489-0003Ma-0D
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 09:41:48 -0400
Received: from 19.mo3.mail-out.ovh.net ([178.32.98.231]:45128)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK488-0003LM-L3
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 09:41:44 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 96FD2FFBFF4
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 15:41:39 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id C9A2648006D;
	Mon,  4 Jul 2016 15:41:32 +0200 (CEST)
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-3-git-send-email-clg@kaod.org>
	<AM4PR0701MB2130DB6B6A3116443D7A1B7CFE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2cf9416b-25d6-c628-1a39-fd5faa345e5e@kaod.org>
Date: Mon, 4 Jul 2016 15:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB2130DB6B6A3116443D7A1B7CFE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 7463309010981128972
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.98.231
Subject: Re: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"mar.krzeminski@gmail.com" <mar.krzeminski@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +055MokNh8wP

On 07/04/2016 02:57 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>=20
>=20
>> -----Original Message-----
>> From: Qemu-devel [mailto:qemu-devel-
>> bounces+marcin.krzeminski=3Dnokia.com@nongnu.org] On Behalf Of C=C3=A9=
dric Le
>> Goater
>> Sent: Monday, July 04, 2016 2:19 PM
>> To: Peter Maydell <peter.maydell@linaro.org>; Peter Crosthwaite
>> <crosthwaite.peter@gmail.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; mar.krzeminski@gmail.com; C=C3=A9dric Le Goater
>> <clg@kaod.org>
>> Subject: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
>>
>> The Macronix chip mx25l25635f used on some OpenPower boxes is very
>> similar to the mx25l25635e. They share the same JEDEC identifier but t=
he
>> WRSR instruction requires 2 bytes in the mx25l25635f case.
>>
>> To prevent some warnings on guests, let's introduce a new chip identif=
ying
>> JEDEC 0xc22019 as a MX25L25635F chip.
>>
> Hello,
>=20
> Adding fake JEDEC id is not good idea at all, we should somehow handle =
this in the code.

It is not a fake JEDEC id. It is a real one from the datasheet :)

mx25l25635f and mx25l25635e share the same 0xc22019 JEDEC.=20

>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/block/m25p80.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c index
>> d9b27939dde6..aa964280beab 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -199,6 +199,7 @@ static const FlashPartInfo known_devices[] =3D {
>>      { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>      { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
>> +    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
>>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | =
ER_32K) },
>>      { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | =
ER_32K) },
>> @@ -991,6 +992,9 @@ static void decode_new_cmd(Flash *s, uint32_t
>> value)
>>              s->pos =3D 0;
>>              s->len =3D 0;
>>              s->state =3D STATE_COLLECTING_DATA;
>> +            if (!strcmp(s->pi->part_name, "mx25l25635f")) {
>> +                s->needed_bytes =3D 2;
>> +            }
>>          }
>>          break;
> Is it based on current master?

You are right. The patch has bit rotted, it still applies on qemu's HEAD
but at the wrong place :/ But, I don't think it is needed anymore, see=20
below.

> In my last series (and current master) this case should be handled by t=
his code:
>             case MAN_MACRONIX:
>                 s->needed_bytes =3D 2;
>                 s->state =3D STATE_COLLECTING_VAR_LEN_DATA;
>                 break;
> I do not know what quest you are using, but linux mainline (at least 4.=
4.0) is=20
> sending only one byte, in WRSR so this will not work.

It is not Linux, it is a user space tool :

	https://github.com/open-power/skiboot/blob/master/hw/ast-bmc/ast-sf-ctrl=
.c#L465

> Could you rebase to master and check if it will boot without your this =
change?

So the current code is fine for the mx25l25635f, which takes 2 bytes=20
for the WRSR. But, now, how would the m25p80 object behave with the=20
mx25l25635e ? Only one byte will be written.

Should we deprecate mx25l25635e ? It is not used in qemu.

Thanks,

C.=20

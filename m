Received: by 10.25.21.96 with SMTP id l93csp1585348lfi;
        Mon, 4 Jul 2016 08:49:09 -0700 (PDT)
X-Received: by 10.55.40.200 with SMTP id o69mr17085135qko.101.1467647349521;
        Mon, 04 Jul 2016 08:49:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p10si2342314qkh.313.2016.07.04.08.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 08:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK67Q-0003cr-WB
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 11:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK67I-0003SQ-1l
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 11:49:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK67D-0004v1-Pa
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 11:48:59 -0400
Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]:33071)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK67D-0004uh-F9
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 11:48:55 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id BE271FFBEC1
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 17:48:53 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 925DC4800A3;
	Mon,  4 Jul 2016 17:48:46 +0200 (CEST)
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-3-git-send-email-clg@kaod.org>
	<AM4PR0701MB2130DB6B6A3116443D7A1B7CFE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
	<2cf9416b-25d6-c628-1a39-fd5faa345e5e@kaod.org>
	<AM4PR0701MB213096F960474E3A0B462209FE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <37bf2fe0-4c2c-87d1-142b-e7bd6efd4746@kaod.org>
Date: Mon, 4 Jul 2016 17:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB213096F960474E3A0B462209FE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-2
X-Ovh-Tracer-Id: 9612088979803310860
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.33.202
Subject: Re: [Qemu-arm] Odp.: [Qemu-devel] [PATCH 2/7] m25p80: add
 mx25l25635f chip
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"mar.krzeminski@gmail.com" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7t9LQ4aZdEJP

On 07/04/2016 05:23 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>=20
>=20
> W dniu 04.07.2016 o 15:41, C=E9dric Le Goater pisze:
>> On 07/04/2016 02:57 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Qemu-devel [mailto:qemu-devel-
>>>> bounces+marcin.krzeminski=3Dnokia.com@nongnu.org] On Behalf Of C=E9d=
ric Le
>>>> Goater
>>>> Sent: Monday, July 04, 2016 2:19 PM
>>>> To: Peter Maydell <peter.maydell@linaro.org>; Peter Crosthwaite
>>>> <crosthwaite.peter@gmail.com>
>>>> Cc: Andrew Jeffery <andrew@aj.id.au>; qemu-arm@nongnu.org; qemu-
>>>> devel@nongnu.org; mar.krzeminski@gmail.com; C=E9dric Le Goater
>>>> <clg@kaod.org>
>>>> Subject: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
>>>>
>>>> The Macronix chip mx25l25635f used on some OpenPower boxes is very
>>>> similar to the mx25l25635e. They share the same JEDEC identifier but=
 the
>>>> WRSR instruction requires 2 bytes in the mx25l25635f case.
>>>>
>>>> To prevent some warnings on guests, let's introduce a new chip ident=
ifying
>>>> JEDEC 0xc22019 as a MX25L25635F chip.
>>>>
>>> Hello,
>>>
>>> Adding fake JEDEC id is not good idea at all, we should somehow handl=
e this in the code.
>>
>> It is not a fake JEDEC id. It is a real one from the datasheet :)
>>
>> mx25l25635f and mx25l25635e share the same 0xc22019 JEDEC.=20
> Sorry, I misunderstand and haven't check in data-sheet :)

np.


>>>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>>>> ---
>>>>  hw/block/m25p80.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c index
>>>> d9b27939dde6..aa964280beab 100644
>>>> --- a/hw/block/m25p80.c
>>>> +++ b/hw/block/m25p80.c
>>>> @@ -199,6 +199,7 @@ static const FlashPartInfo known_devices[] =3D {
>>>>      { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>>>>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>>>      { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
>>>> +    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
>>>>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>>>>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K =
| ER_32K) },
>>>>      { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K =
| ER_32K) },
>>>> @@ -991,6 +992,9 @@ static void decode_new_cmd(Flash *s, uint32_t
>>>> value)
>>>>              s->pos =3D 0;
>>>>              s->len =3D 0;
>>>>              s->state =3D STATE_COLLECTING_DATA;
>>>> +            if (!strcmp(s->pi->part_name, "mx25l25635f")) {
>>>> +                s->needed_bytes =3D 2;
>>>> +            }
>>>>          }
>>>>          break;
>>> Is it based on current master?
>>
>> You are right. The patch has bit rotted, it still applies on qemu's HE=
AD
>> but at the wrong place :/ But, I don't think it is needed anymore, see=
=20
>> below.
>>
>>> In my last series (and current master) this case should be handled by=
 this code:
>>>             case MAN_MACRONIX:
>>>                 s->needed_bytes =3D 2;
>>>                 s->state =3D STATE_COLLECTING_VAR_LEN_DATA;
>>>                 break;
>>> I do not know what quest you are using, but linux mainline (at least =
4.4.0) is=20
>>> sending only one byte, in WRSR so this will not work.
>>
>> It is not Linux, it is a user space tool :
>>
>> 	https://github.com/open-power/skiboot/blob/master/hw/ast-bmc/ast-sf-c=
trl.c#L465
> I meant spi-nor framework in Linux, if you are using different tool it =
is different story,
> but should work for both (if real hw works for both...).

Yes. =20

Linux still does not know about the mx25l25635f and it is behaving=20
fine using the mx25l25635e definition. We should send a patch for=20
it I guess. I have the HW, I will look into that when I have some=20
time.

>>> Could you rebase to master and check if it will boot without your thi=
s change?
>>
>> So the current code is fine for the mx25l25635f, which takes 2 bytes=20
>> for the WRSR. But, now, how would the m25p80 object behave with the=20
>> mx25l25635e ? Only one byte will be written.
>
> It should behave properly (as in my case spi-nor framework in Linux wri=
tes only
> one byte for Macronix in WSRS). COLLECTING_VAR_LEN_DATA state apply cha=
nges
> (call complete_collecting_data) when CS go high. If it takes one byte i=
nstead of two,
> one byte will be written to SR.

ah yes, this is true. so we are fine on that side.

>> Should we deprecate mx25l25635e ? It is not used in qemu.
>
> That is good question, I do not see any flash with same JEDEC in the co=
de, so
> this one could be the first if you leave both of them.
> You mentioned about warnings when you configure Qemu to use mx25l25635e=
,
> instead of mx25l25635f, in my it should not matter, what are those warn=
ings?

Before your patchset, we could get these:

        qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value)=
;

you have solved that.=20

So I guess we could just add :=20

 +    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },

but as we don't have any errors without them, I will just drop=20
those oneliner patches.=20

Thanks,

C.

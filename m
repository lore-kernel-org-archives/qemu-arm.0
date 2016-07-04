Received: by 10.25.21.96 with SMTP id l93csp44644lfi;
        Mon, 4 Jul 2016 18:38:35 -0700 (PDT)
X-Received: by 10.237.35.152 with SMTP id j24mr22729205qtc.96.1467682715067;
        Mon, 04 Jul 2016 18:38:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k10si781383qtc.22.2016.07.04.18.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 18:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:51374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKFJq-0005Rd-Ev
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 21:38:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bKFJl-0005P6-PT
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 21:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bKFJh-0001Oa-Ct
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 21:38:28 -0400
Received: from mail-ve1eur01on0109.outbound.protection.outlook.com
	([104.47.1.109]:39424
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>)
	id 1bKFJg-0001OJ-UW; Mon, 04 Jul 2016 21:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zYs7+dB4qdn7EA1Ho22Uzmpl27A3iwuMqTEm4Ud9niU=;
	b=CrKeLU3P2GpcCM6cTMuK78gfoSwk8qA2gSQyHyXlGipqVQu5PsutSRQbB33MuWGCasMEblUKLzjPW9QCiLZxSu2kALFRwUtet6oSeqh19MOhp6irdx9PE+IdWonqXteFWHAXJMmPu+q227aE14hPEGchh1/uJnUPe+3xfdAPjfU=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2132.eurprd07.prod.outlook.com (10.167.132.141) with
	Microsoft
	SMTP Server (TLS) id 15.1.534.14; Mon, 4 Jul 2016 16:03:08 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0528.022; Mon, 4 Jul 2016 16:03:08 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: =?iso-8859-2?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Thread-Topic: Odp.: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
Thread-Index: AQHR1e6c9tCcxjdIJk6LyVPiRPgd/KAIN91AgAAPzICAABxrj4AAByGAgAAD0zQ=
Date: Mon, 4 Jul 2016 16:03:08 +0000
Message-ID: <AM4PR0701MB21309D00FD9A06BFA997A1D9FE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-3-git-send-email-clg@kaod.org>
	<AM4PR0701MB2130DB6B6A3116443D7A1B7CFE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
	<2cf9416b-25d6-c628-1a39-fd5faa345e5e@kaod.org>
	<AM4PR0701MB213096F960474E3A0B462209FE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>,
	<37bf2fe0-4c2c-87d1-142b-e7bd6efd4746@kaod.org>
In-Reply-To: <37bf2fe0-4c2c-87d1-142b-e7bd6efd4746@kaod.org>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [132.245.55.181]
x-ms-office365-filtering-correlation-id: a8fc47de-e2a5-4251-2d97-08d3a424b115
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2132;
	6:UcGp0JF4O4/0yo7Fh+CYXBRCEA9AsONmdAiG26iZfa9/au5qdQDtVWSJ+9OxplhGy3tzZAxkga4Va3wFI1/CxFOEs/VG/J+dwtDHdDvYH1NQnuMG7WGaMTZRszHye4lTkKoUTJKPqEMQKUo2GTNKMVAR9bd88yYVY9O2YO1GQASEQoIyHnRxUCl5ef7CiMhENu8eOKP6kZRmJbFRMNuoKq2DPqfivRH4EVWzalZwl7wAGlmufIuie2qg9s1hREzPulfg1YHkxL1AcSWFUB4tvOuZ5YdQbhZA8PVdVAOfVE8=;
	5:kdKZF/RwyDAdNTo00J5S6586EuS0jCjBqyvvZVV5Pzo+z93wQWB0bHaF3i1uBV0GBf9Rmww3iz52r+2BdLYkzFT0y3ac/18IUFxRGNL6nQoa7fJUmuzlbZPXzyjf0p3c7Y/oqcXaSftHzsFOoD8i1Q==;
	24:cO2j3WkDlzqYjLqfm1X2UWuKFd8qqzXYUD63u9G70DYg6TuruEVsW4ROXDhH/05pIRbdpqsDv2LHIc+9AwT7Uj62vP+yod8d+qCJ9LGfg0k=;
	7:FhGh4Q2lj60dgeMSCKtUSwEhyS+R/O//lzPvR3v5LJlq5qkgovmMqHSX+ECQ63NyaVMlXzwgOssdPiR/U3rRuTYBaggL7PpD+WzswOcOwPf8fWt11i01JIOWL7HO2XtYdJWhzZyIQ21RSL2RE3IXK+HQnq9uVTYD8J40B4JMeI7upQdLSeCikrB3Rwrlpq71iZizEHBXfB8SkB9674j0SLHNOtdtE7+KYDpt/PolkPhb1N2A1DRklVH92DVaN5d1
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR0701MB2132;
x-microsoft-antispam-prvs: <AM4PR0701MB21324861C7C3515536809B35FE380@AM4PR0701MB2132.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:AM4PR0701MB2132; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2132; 
x-forefront-prvs: 0993689CD1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(199003)(377454003)(24454002)(13464003)(189002)(586003)(105586002)(106356001)(106116001)(93886004)(97736004)(122556002)(11100500001)(10400500002)(3280700002)(3846002)(5002640100001)(50986999)(102836003)(229853001)(8936002)(6116002)(92566002)(3660700001)(9686002)(54356999)(19580405001)(87936001)(76576001)(7846002)(81166006)(81156014)(305945005)(15975445007)(76176999)(86362001)(77096005)(2950100001)(189998001)(19580395003)(2900100001)(2906002)(33656002)(101416001)(68736007)(5001770100001)(8676002)(7696003)(4326007)(7736002)(66066001)(5003600100003)(74316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2132;
	H:AM4PR0701MB2130.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2016 16:03:08.4243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2132
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.109
Subject: [Qemu-arm] Odp.: Odp.: [Qemu-devel] [PATCH 2/7] m25p80: add
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
X-TUID: L9C5pvAGjXeD



W dniu 04.07.2016 o 17:48, C=E9dric Le Goater pisze:
> On 07/04/2016 05:23 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>>
>>
>> W dniu 04.07.2016 o 15:41, C=E9dric Le Goater pisze:
>>> On 07/04/2016 02:57 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Qemu-devel [mailto:qemu-devel-
>>>>> bounces+marcin.krzeminski=3Dnokia.com@nongnu.org] On Behalf Of C=E9dr=
ic Le
>>>>> Goater
>>>>> Sent: Monday, July 04, 2016 2:19 PM
>>>>> To: Peter Maydell <peter.maydell@linaro.org>; Peter Crosthwaite
>>>>> <crosthwaite.peter@gmail.com>
>>>>> Cc: Andrew Jeffery <andrew@aj.id.au>; qemu-arm@nongnu.org; qemu-
>>>>> devel@nongnu.org; mar.krzeminski@gmail.com; C=E9dric Le Goater
>>>>> <clg@kaod.org>
>>>>> Subject: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
>>>>>
>>>>> The Macronix chip mx25l25635f used on some OpenPower boxes is very
>>>>> similar to the mx25l25635e. They share the same JEDEC identifier but =
the
>>>>> WRSR instruction requires 2 bytes in the mx25l25635f case.
>>>>>
>>>>> To prevent some warnings on guests, let's introduce a new chip identi=
fying
>>>>> JEDEC 0xc22019 as a MX25L25635F chip.
>>>>>
>>>> Hello,
>>>>
>>>> Adding fake JEDEC id is not good idea at all, we should somehow handle=
 this in the code.
>>>
>>> It is not a fake JEDEC id. It is a real one from the datasheet :)
>>>
>>> mx25l25635f and mx25l25635e share the same 0xc22019 JEDEC.=20
>> Sorry, I misunderstand and haven't check in data-sheet :)
>
> np.
>
>
>>>>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>>>>> ---
>>>>>  hw/block/m25p80.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c index
>>>>> d9b27939dde6..aa964280beab 100644
>>>>> --- a/hw/block/m25p80.c
>>>>> +++ b/hw/block/m25p80.c
>>>>> @@ -199,6 +199,7 @@ static const FlashPartInfo known_devices[] =3D {
>>>>>      { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>>>>>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>>>>      { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
>>>>> +    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
>>>>>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>>>>>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K |=
 ER_32K) },
>>>>>      { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K |=
 ER_32K) },
>>>>> @@ -991,6 +992,9 @@ static void decode_new_cmd(Flash *s, uint32_t
>>>>> value)
>>>>>              s->pos =3D 0;
>>>>>              s->len =3D 0;
>>>>>              s->state =3D STATE_COLLECTING_DATA;
>>>>> +            if (!strcmp(s->pi->part_name, "mx25l25635f")) {
>>>>> +                s->needed_bytes =3D 2;
>>>>> +            }
>>>>>          }
>>>>>          break;
>>>> Is it based on current master?
>>>
>>> You are right. The patch has bit rotted, it still applies on qemu's HEA=
D
>>> but at the wrong place :/ But, I don't think it is needed anymore, see=
=20
>>> below.
>>>
>>>> In my last series (and current master) this case should be handled by =
this code:
>>>>             case MAN_MACRONIX:
>>>>                 s->needed_bytes =3D 2;
>>>>                 s->state =3D STATE_COLLECTING_VAR_LEN_DATA;
>>>>                 break;
>>>> I do not know what quest you are using, but linux mainline (at least 4=
.4.0) is=20
>>>> sending only one byte, in WRSR so this will not work.
>>>
>>> It is not Linux, it is a user space tool :
>>>
>>> 	https://github.com/open-power/skiboot/blob/master/hw/ast-bmc/ast-sf-ct=
rl.c#L465
>> I meant spi-nor framework in Linux, if you are using different tool it i=
s different story,
>> but should work for both (if real hw works for both...).
>
> Yes. =20
>
> Linux still does not know about the mx25l25635f and it is behaving=20
> fine using the mx25l25635e definition. We should send a patch for=20
> it I guess. I have the HW, I will look into that when I have some=20
> time.
Linux detects flash type by JEDEC code, so if the JEDEC is the same
it will be hard to patch this. They are working on detection by JEDEC216,
and then probably it will be possible to properly identify the flash.
>
>>>> Could you rebase to master and check if it will boot without your this=
 change?
>>>
>>> So the current code is fine for the mx25l25635f, which takes 2 bytes=20
>>> for the WRSR. But, now, how would the m25p80 object behave with the=20
>>> mx25l25635e ? Only one byte will be written.
>>
>> It should behave properly (as in my case spi-nor framework in Linux writ=
es only
>> one byte for Macronix in WSRS). COLLECTING_VAR_LEN_DATA state apply chan=
ges
>> (call complete_collecting_data) when CS go high. If it takes one byte in=
stead of two,
>> one byte will be written to SR.
>
> ah yes, this is true. so we are fine on that side.
>
>>> Should we deprecate mx25l25635e ? It is not used in qemu.
>>
>> That is good question, I do not see any flash with same JEDEC in the cod=
e, so
>> this one could be the first if you leave both of them.
>> You mentioned about warnings when you configure Qemu to use mx25l25635e,
>> instead of mx25l25635f, in my it should not matter, what are those warni=
ngs?
>
> Before your patchset, we could get these:
>
>         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value)=
;
>
> you have solved that.=20
>
> So I guess we could just add :=20
>
>  +    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
>
> but as we don't have any errors without them, I will just drop=20
> those oneliner patches.=20
I think you should add this line, since this model is supported.

Thanks,
Marcin
>
>
> Thanks,
>
> C.
>


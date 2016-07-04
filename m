Received: by 10.25.21.96 with SMTP id l93csp1656804lfi;
        Mon, 4 Jul 2016 11:57:40 -0700 (PDT)
X-Received: by 10.200.51.76 with SMTP id u12mr20898303qta.55.1467658660256;
        Mon, 04 Jul 2016 11:57:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si2920065qtc.5.2016.07.04.11.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 11:57:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:49929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK93r-00060v-Lr
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 14:57:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bK92x-0005jh-Dm
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 14:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bK92u-0008TP-Te
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 14:56:42 -0400
Received: from mail-db5eur01on0137.outbound.protection.outlook.com
	([104.47.2.137]:7843
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>)
	id 1bK92o-0008Sr-Fg; Mon, 04 Jul 2016 14:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rCGSk63ZWgpn3Kx4Bz92SoYjuO+aLtMF8+EdvzJxv4I=;
	b=l2N/xam67WRG2E0xUqu0EfoUho7hU/JsrZX1VKG5b7U5yD9zp80IsxzsnRP8MI9Fe26foLj/9Rh5m+7pGCYGUeglzLJBMQmBQnqmQ1hNIOujIcKzcStDB61yYpweadAMJsq2zQFGMXIS5IjU9/JeEYVTOK3Umg2/lEwheVyiClY=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) with
	Microsoft
	SMTP Server (TLS) id 15.1.528.16; Mon, 4 Jul 2016 15:23:34 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0528.022; Mon, 4 Jul 2016 15:23:34 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: =?iso-8859-2?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
Thread-Index: AQHR1e6c9tCcxjdIJk6LyVPiRPgd/KAIN91AgAAPzICAABxrjw==
Date: Mon, 4 Jul 2016 15:23:34 +0000
Message-ID: <AM4PR0701MB213096F960474E3A0B462209FE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-3-git-send-email-clg@kaod.org>
	<AM4PR0701MB2130DB6B6A3116443D7A1B7CFE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>,
	<2cf9416b-25d6-c628-1a39-fd5faa345e5e@kaod.org>
In-Reply-To: <2cf9416b-25d6-c628-1a39-fd5faa345e5e@kaod.org>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [132.245.55.181]
x-ms-office365-filtering-correlation-id: 8e9bb6b8-bf10-41a2-c9f1-08d3a41f29d0
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2130;
	6:5P4f384iHHskifC+vKwDvBcVUgaf1naF6cfl7VWXGuI+b43SwGkqlR+mPi0VRZwHZXv4pdAL2EAfF7V4b3s49aa8H9behc5PubcODoToErCnox0HIR3XweTaFo240AWKu5Qw39XtcdgKwhNKRL+pZZygfCv73IAFgYK+H850134u7gexLxNX2U276xC3fttQrxGBblHj/kELyC9GZjFb5e9cqXp8QNuxD7sgUVO/ewrxZ/UNrRKXUwzX4XQRrQQyRQTt3B8Vcl58PAewc//qeXyoy4VrBJ/t0sjvq8fw0fA=;
	5:zFgziSEcEi9P+luPsx7Gzzu9U1ktyOLuclw3485aCtkA6Z6RMVKuDJ9YEBV25Diy8wTU8Fr6r3QVHS01mLlYcEuE0JWXMlLqXwNqWuITE7mjcl3Ky1wzYRKBci47d4FSn5oB76dZl55O7U9CvHDIVQ==;
	24:OpwCtInj/aNSRGd2VjNax3UveNRJ0potmj7GcjPA2teGcMuJyL4phf4iYwcrBnN+I+CzztK5cpZuIatI8EEyjJZba8yqH04d8c2djAE3B0U=;
	7:JCtTiTytu2MjGTEY7wu897HN9q4tADz7VZo1nxi483nJ/He9KJL1z36OL60U+sI24Zatna2gapBN6I0p1/BbPZbAXfER6Z7Vu4QckrHH/BU5mQCNDV866szQAELpR5kTqheh/8HkKD+YUHHaWhuZGZ+vZZorD7fw4g0spfuLdP0hPuwuF+vTHofmxBzr2r5X6vl79S/Wdk029S/wIn8zxU7f9mUC547w++GuyOoRPcfir39mW00JH7d8p37q2tGQ
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR0701MB2130;
x-microsoft-antispam-prvs: <AM4PR0701MB213040FE22D87238F9605C94FE380@AM4PR0701MB2130.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:AM4PR0701MB2130; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2130; 
x-forefront-prvs: 0993689CD1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(24454002)(199003)(13464003)(377454003)(189002)(101416001)(87936001)(54356999)(33656002)(86362001)(76176999)(305945005)(5003600100003)(7696003)(7846002)(7736002)(3280700002)(66066001)(50986999)(122556002)(19580405001)(3660700001)(11100500001)(19580395003)(5002640100001)(9686002)(10400500002)(2900100001)(8936002)(2950100001)(68736007)(74316002)(92566002)(93886004)(81166006)(8676002)(3846002)(81156014)(586003)(6116002)(102836003)(2906002)(76576001)(106116001)(106356001)(229853001)(15975445007)(5001770100001)(97736004)(77096005)(4326007)(105586002)(189998001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2130;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2016 15:23:34.0611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2130
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.137
Subject: [Qemu-devel] Odp.:  [PATCH 2/7] m25p80: add mx25l25635f chip
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
X-TUID: o6y3F7M72LHm



W dniu 04.07.2016 o 15:41, C=E9dric Le Goater pisze:
> On 07/04/2016 02:57 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>>
>>
>>> -----Original Message-----
>>> From: Qemu-devel [mailto:qemu-devel-
>>> bounces+marcin.krzeminski=3Dnokia.com@nongnu.org] On Behalf Of C=E9dric=
 Le
>>> Goater
>>> Sent: Monday, July 04, 2016 2:19 PM
>>> To: Peter Maydell <peter.maydell@linaro.org>; Peter Crosthwaite
>>> <crosthwaite.peter@gmail.com>
>>> Cc: Andrew Jeffery <andrew@aj.id.au>; qemu-arm@nongnu.org; qemu-
>>> devel@nongnu.org; mar.krzeminski@gmail.com; C=E9dric Le Goater
>>> <clg@kaod.org>
>>> Subject: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
>>>
>>> The Macronix chip mx25l25635f used on some OpenPower boxes is very
>>> similar to the mx25l25635e. They share the same JEDEC identifier but th=
e
>>> WRSR instruction requires 2 bytes in the mx25l25635f case.
>>>
>>> To prevent some warnings on guests, let's introduce a new chip identify=
ing
>>> JEDEC 0xc22019 as a MX25L25635F chip.
>>>
>> Hello,
>>
>> Adding fake JEDEC id is not good idea at all, we should somehow handle t=
his in the code.
>
> It is not a fake JEDEC id. It is a real one from the datasheet :)
>
> mx25l25635f and mx25l25635e share the same 0xc22019 JEDEC.=20
Sorry, I misunderstand and haven't check in data-sheet :)
>
>
>>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/block/m25p80.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c index
>>> d9b27939dde6..aa964280beab 100644
>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -199,6 +199,7 @@ static const FlashPartInfo known_devices[] =3D {
>>>      { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>>>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>>      { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
>>> +    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
>>>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>>>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | E=
R_32K) },
>>>      { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | E=
R_32K) },
>>> @@ -991,6 +992,9 @@ static void decode_new_cmd(Flash *s, uint32_t
>>> value)
>>>              s->pos =3D 0;
>>>              s->len =3D 0;
>>>              s->state =3D STATE_COLLECTING_DATA;
>>> +            if (!strcmp(s->pi->part_name, "mx25l25635f")) {
>>> +                s->needed_bytes =3D 2;
>>> +            }
>>>          }
>>>          break;
>> Is it based on current master?
>
> You are right. The patch has bit rotted, it still applies on qemu's HEAD
> but at the wrong place :/ But, I don't think it is needed anymore, see=20
> below.
>
>> In my last series (and current master) this case should be handled by th=
is code:
>>             case MAN_MACRONIX:
>>                 s->needed_bytes =3D 2;
>>                 s->state =3D STATE_COLLECTING_VAR_LEN_DATA;
>>                 break;
>> I do not know what quest you are using, but linux mainline (at least 4.4=
.0) is=20
>> sending only one byte, in WRSR so this will not work.
>
> It is not Linux, it is a user space tool :
>
> 	https://github.com/open-power/skiboot/blob/master/hw/ast-bmc/ast-sf-ctrl=
.c#L465
I meant spi-nor framework in Linux, if you are using different tool it is d=
ifferent story,
but should work for both (if real hw works for both...).
>
>
>> Could you rebase to master and check if it will boot without your this c=
hange?
>
> So the current code is fine for the mx25l25635f, which takes 2 bytes=20
> for the WRSR. But, now, how would the m25p80 object behave with the=20
> mx25l25635e ? Only one byte will be written.
It should behave properly (as in my case spi-nor framework in Linux writes =
only
one byte for Macronix in WSRS). COLLECTING_VAR_LEN_DATA state apply changes
(call complete_collecting_data) when CS go high. If it takes one byte inste=
ad of two,
one byte will be written to SR.
>
>
> Should we deprecate mx25l25635e ? It is not used in qemu.
That is good question, I do not see any flash with same JEDEC in the code, =
so
this one could be the first if you leave both of them.
You mentioned about warnings when you configure Qemu to use mx25l25635e,
instead of mx25l25635f, in my it should not matter, what are those warnings=
?

Regards,
Marcin
>
>
> Thanks,
>
> C.=20
>


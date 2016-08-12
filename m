Received: by 10.25.21.156 with SMTP id 28csp196514lfv;
        Fri, 12 Aug 2016 07:50:46 -0700 (PDT)
X-Received: by 10.200.46.216 with SMTP id i24mr18011105qta.79.1471013442562;
        Fri, 12 Aug 2016 07:50:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d132si3481505qke.186.2016.08.12.07.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 07:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYDnF-00038e-WD
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 10:50:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bYDNf-0007M9-3m
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bYDNH-000599-Vv
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:24:13 -0400
Received: from 6.mo6.mail-out.ovh.net ([87.98.177.69]:44728)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bYDNH-00057A-NV
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:23:51 -0400
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id A2ACFFFA8A1
	for <qemu-devel@nongnu.org>; Fri, 12 Aug 2016 10:28:10 +0200 (CEST)
Received: from [192.168.1.11] (ARennes-257-1-62-53.w81-53.abo.wanadoo.fr
	[81.53.141.53]) (Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id BE0548B1;
	Fri, 12 Aug 2016 10:28:03 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-7-git-send-email-clg@kaod.org>
	<CAFEAcA_V6k5mZGQfL2WMqZmzXyHuPm0ovdt7hr2xuBZWdaRtYw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3cf9ddc6-ce37-53d5-8f22-a589128e83db@kaod.org>
Date: Fri, 12 Aug 2016 10:28:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_V6k5mZGQfL2WMqZmzXyHuPm0ovdt7hr2xuBZWdaRtYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 9842898464713444267
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddruddtgddtfeculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.177.69
Subject: Re: [Qemu-devel] [PATCH v3 06/10] palmetto-bmc: add board specific
 configuration
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
X-TUID: NKkaDxhDQZau

On 08/11/2016 12:27 PM, Peter Maydell wrote:
> On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> aspeed_board_init() now uses a board identifier to customize some valu=
es
>> specific to the board.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>
>>  Changes since v2:
>>
>>  - removed silicon-rev and cpu-model. This is now in the SoC.
>>
>>  Changes since v1:
>>
>>  - changed aspeed_init() prototype to use a 'const AspeedBoardConfig *=
'
>>  - fixed white space issues
>>
>>  hw/arm/aspeed.c | 22 ++++++++++++++++++----
>>  1 file changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ad0a062b5624..4226b8dcd95c 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -30,6 +30,19 @@ typedef struct AspeedBoardState {
>>      MemoryRegion ram;
>>  } AspeedBoardState;
>>
>> +typedef struct AspeedBoardConfig {
>> +    const char *soc_name;
>> +    uint32_t hw_strap1;
>> +} AspeedBoardConfig;
>> +
>> +enum {
>> +    PALMETTO_BMC
>=20
> Since you need to respin this set anyway, I shall pick a nit:
> a trailing comma here would be preferable because then you
> don't need to change the line when you add the next entry
> to the enum.

yes. This is a good pratice. I will fix that in the next version.

Thanks for the review,

C.

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> thanks
> -- PMM
>=20


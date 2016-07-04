Received: by 10.25.21.96 with SMTP id l93csp1525986lfi;
        Mon, 4 Jul 2016 06:38:35 -0700 (PDT)
X-Received: by 10.55.98.205 with SMTP id w196mr16218587qkb.65.1467639515318;
        Mon, 04 Jul 2016 06:38:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si2020421qki.232.2016.07.04.06.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 06:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK454-0001vq-LA
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 09:38:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK33I-0007tP-Pq
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK33F-0006fV-L7
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:32:40 -0400
Received: from 11.mo3.mail-out.ovh.net ([87.98.184.158]:53599)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK33F-0006fA-EO
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:32:37 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 32698FFBF52
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 14:32:35 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 3ABEF480084;
	Mon,  4 Jul 2016 14:32:27 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<5778025A.9020608@gmail.com>
	<8ace1056-de8d-cfbb-9e63-e0e26df71952@kaod.org>
	<CAFEAcA8Mrxj8y=MiHv0RpqNijAGrSS71wpT2JYU6k0okAqM=nw@mail.gmail.com>
	<b7a505f6-459f-377d-9e88-c42ba1b2897c@kaod.org>
	<CAFEAcA-26vuv+7uXBfzzccydOjeg1eG=YVCqnXEfcLuDW=fdBQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0dd5a737-68a9-f5eb-4ac3-30bfff55e546@kaod.org>
Date: Mon, 4 Jul 2016 14:32:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-26vuv+7uXBfzzccydOjeg1eG=YVCqnXEfcLuDW=fdBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 6296876707435023280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.184.158
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 9/9] tests: add a m25p80 test
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"mar.krzeminski" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdD+rxstWMoh

On 07/04/2016 02:11 PM, Peter Maydell wrote:
> On 4 July 2016 at 13:01, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 07/04/2016 01:14 PM, Peter Maydell wrote:
>>> What is the test actually supposed to be doing?
>>> writel() says "write this 32 bit value as if the (guest) CPU
>>> wrote it to memory with a 32-bit write instruction".
>>
>> The test (and the guest) is writing and reading data on the memory
>> region used by the SPI controller. This 'data' is then passed on
>> to the SPI flash module objects which expects BE order when there
>> are flash storage addresses are in the flow.
>>
>> So I think the test needs to use mem{write,read} and not write*.
>> The result looks correct in the code. I will send a patchset
>> right after starting with this patch.
>=20
> If you were writing this test in a bit of native ARM code
> running in the guest, how would you write it?
> memread/memwrite are only the correct answer if you'd write
> the native arm code as something like
> memcpy(SPI_REGISTER, buf, len), which is not generally the
> way you talk to devices.

The SMC/SPI controller are driven by mmios and the flash module=20
in a very similar way. The modules are mapped at some address,=20
0x2000000 for the BMC, 0x3000000 for the host firmware. Writing=20
to the mapped address triggers SPI transfers, you need to put the=20
slave in user mode for that, by setting the appropriate registers=20
in the controller. When not in that mode, you are in command mode,=20
and in this case you access directly the contents of the flash.

Thanks,

C.=20


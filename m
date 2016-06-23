Received: by 10.25.21.96 with SMTP id l93csp676182lfi;
        Thu, 23 Jun 2016 12:09:55 -0700 (PDT)
X-Received: by 10.200.42.200 with SMTP id c8mr208528qta.8.1466708995017;
        Thu, 23 Jun 2016 12:09:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k62si1589478qkf.1.2016.06.23.12.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 12:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGA0g-0002G0-Hh
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 15:09:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGA0X-0002C0-Ub
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:09:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGA0L-0001bW-GA
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:09:44 -0400
Received: from 12.mo1.mail-out.ovh.net ([87.98.162.229]:42408)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bGA0L-0001b0-9e
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:09:33 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 30E21FF9C3C
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 21:09:32 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 8941E2C006F;
	Thu, 23 Jun 2016 21:09:25 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-6-git-send-email-clg@kaod.org>
	<CAFEAcA832Wa0wjSvSrAkmy5K3-jjLXgFtCs3RkK499V5W1vVNg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4798b3f1-078c-22c3-26f9-925e2b93a0ef@kaod.org>
Date: Thu, 23 Jun 2016 21:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA832Wa0wjSvSrAkmy5K3-jjLXgFtCs3RkK499V5W1vVNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3741365393888414635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.162.229
Subject: Re: [Qemu-arm] [PATCH v3 5/5] tests: add a m25p80 test
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
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HQ55fUHwRzHL

On 06/23/2016 08:52 PM, Peter Maydell wrote:
> On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> This test uses the palmetto platform and the AST2400 SPI controller to
>> test the m25p80 flash module device model. The flash model is defined
>> by the platform (n25q256a) and it would be nice to find way to control
>> it, using a property probably.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Are you in a position to check this test passes on both a
> bigendian and little endian host? I have no specific reason
> to think it will fail, but it seems worth checking.
> (If not, it'll get tested when I do a merge eventually.)

I can do bigendian on a p7/ppc64 host. I will check that when=20
I have addressed all your comments.

Thanks for the review.

C.


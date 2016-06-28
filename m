Received: by 10.25.21.96 with SMTP id l93csp1516558lfi;
        Tue, 28 Jun 2016 01:42:41 -0700 (PDT)
X-Received: by 10.200.53.39 with SMTP id y36mr2529897qtb.92.1467103361843;
        Tue, 28 Jun 2016 01:42:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a61si21641591qtd.56.2016.06.28.01.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 01:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHobR-0006vA-2h
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 04:42:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHoZL-0003U3-Os
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHoZI-00071h-Ap
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:40:31 -0400
Received: from 11.mo3.mail-out.ovh.net ([87.98.184.158]:52333)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHoZI-00071P-4L
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:40:28 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 21040FF93BF
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 10:40:27 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 2B64D4C007F;
	Tue, 28 Jun 2016 10:40:19 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
	<bed58244-e877-aeda-d7c6-76d01540beb3@redhat.com>
	<6276f949-6031-07fe-91f2-7037f0438302@kaod.org>
	<CAFEAcA-UkVQu49yTFx0PNbfB74=7iqAnV=a4BhSTGmXq-5BTog@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ea6a1789-9c82-e3d7-6c82-0f26817bbb34@kaod.org>
Date: Tue, 28 Jun 2016 10:40:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-UkVQu49yTFx0PNbfB74=7iqAnV=a4BhSTGmXq-5BTog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 4033536418385726384
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.184.158
Subject: Re: [Qemu-arm] [PATCH v4 5/5] tests: add a m25p80 test
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +NiRG9vaKhT1

On 06/28/2016 10:34 AM, Peter Maydell wrote:
> On 28 June 2016 at 09:32, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 06/28/2016 10:01 AM, Paolo Bonzini wrote:
>>>
>>>
>>> On 27/06/2016 18:43, C=C3=A9dric Le Goater wrote:
>>>>  check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)
>>>> +check-qtest-arm-y =3D tests/m25p80-test$(EXESUF)
>>>
>>> This should be a "+=3D".
>>
>> OK. I will fix the above line also then :
>>
>>         check-qtest-arm-y =3D tests/tmp105-test$(EXESUF)
>>         check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)
>=20
> That's fixed in master.

OK. The patchset needs a rebase now that Marcin's patches are in.

Thanks,

C.=20


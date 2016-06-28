Received: by 10.25.21.96 with SMTP id l93csp1513697lfi;
        Tue, 28 Jun 2016 01:33:36 -0700 (PDT)
X-Received: by 10.200.38.61 with SMTP id u58mr2488563qtu.83.1467102816101;
        Tue, 28 Jun 2016 01:33:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si3136779qtc.5.2016.06.28.01.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 01:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHoSd-0004Jc-HR
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 04:33:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHoRm-0003zt-LO
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 04:32:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHoRi-0004ih-Kq
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 04:32:42 -0400
Received: from 4.mo3.mail-out.ovh.net ([178.33.46.10]:50621)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHoRi-0004iQ-Fb
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 04:32:38 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 66E59FF8672
	for <qemu-devel@nongnu.org>; Tue, 28 Jun 2016 10:32:37 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 8BD364C008D;
	Tue, 28 Jun 2016 10:32:29 +0200 (CEST)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
	<bed58244-e877-aeda-d7c6-76d01540beb3@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6276f949-6031-07fe-91f2-7037f0438302@kaod.org>
Date: Tue, 28 Jun 2016 10:32:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <bed58244-e877-aeda-d7c6-76d01540beb3@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3901243178927033264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.46.10
Subject: Re: [Qemu-devel] [PATCH v4 5/5] tests: add a m25p80 test
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L6HcnDQplvso

On 06/28/2016 10:01 AM, Paolo Bonzini wrote:
>=20
>=20
> On 27/06/2016 18:43, C=C3=A9dric Le Goater wrote:
>>  check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)
>> +check-qtest-arm-y =3D tests/m25p80-test$(EXESUF)
>=20
> This should be a "+=3D".

OK. I will fix the above line also then :

	check-qtest-arm-y =3D tests/tmp105-test$(EXESUF)
	check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)

Thanks,

C.

>=20
> Paolo
>=20
>>  gcov-files-arm-y +=3D hw/misc/tmp105.c
>>  check-qtest-arm-y +=3D tests/virtio-blk-test$(EXESUF)


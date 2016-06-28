Received: by 10.25.21.96 with SMTP id l93csp1512568lfi;
        Tue, 28 Jun 2016 01:30:24 -0700 (PDT)
X-Received: by 10.233.232.81 with SMTP id a78mr2250806qkg.25.1467102624108;
        Tue, 28 Jun 2016 01:30:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b71si2882984qkj.116.2016.06.28.01.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 01:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHoPX-0001Bq-HS
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 04:30:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHoPT-0000zH-Q1
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHoPO-0004EM-A3
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:30:19 -0400
Received: from 12.mo3.mail-out.ovh.net ([188.165.41.191]:37037)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHoPO-0004E2-3k
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:30:14 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id ADB2DFF9336
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 10:30:08 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id B23B94C0091;
	Tue, 28 Jun 2016 10:30:00 +0200 (CEST)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
	<cfcd090c-bf43-4bfd-a8dd-c871e483c21b@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9049c0dc-b47e-a421-d71e-3f956de61bd6@kaod.org>
Date: Tue, 28 Jun 2016 10:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <cfcd090c-bf43-4bfd-a8dd-c871e483c21b@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3859584880773401520
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.41.191
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jrbFTsyCGThf

On 06/28/2016 10:03 AM, Paolo Bonzini wrote:
>=20
>=20
> On 27/06/2016 18:43, C=C3=A9dric Le Goater wrote:
>> +    args =3D g_strdup_printf("-M 256 -machine palmetto-bmc "
>=20
> Also you want "-m 256".  This is not failing because the "256" machine
> type is overwritten by "palmetto-bmc".

I should have seen these earlier ...

Thanks,

C.=20

> Paolo
>=20
>> +                           "-drive file=3D%s,format=3Draw,if=3Dmtd",
>> +                           tmp_path);
>> +    qtest_start(args);
>> +


Received: by 10.25.21.96 with SMTP id l93csp406771lfi;
        Fri, 1 Jul 2016 10:33:18 -0700 (PDT)
X-Received: by 10.55.73.148 with SMTP id w142mr20752900qka.77.1467394398314;
        Fri, 01 Jul 2016 10:33:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7si2920938qki.326.2016.07.01.10.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 10:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ2JZ-0003ni-LK
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 13:33:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bJ2HB-0001T3-4z
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bJ2H6-0004DL-3O
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:30:48 -0400
Received: from 8.mo53.mail-out.ovh.net ([87.98.185.57]:33800)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bJ2H5-0004Cs-Te
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:30:44 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id E167AFF880A
	for <qemu-devel@nongnu.org>; Fri,  1 Jul 2016 19:30:42 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id AE87C620072;
	Fri,  1 Jul 2016 19:30:34 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<CAFEAcA9Z_6bPMwCumhwQqqwyy-B_vKXyLPBfJeK8uY03Xx3G+A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <39c0c830-dd0b-301f-78fc-6de176772a7c@kaod.org>
Date: Fri, 1 Jul 2016 19:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Z_6bPMwCumhwQqqwyy-B_vKXyLPBfJeK8uY03Xx3G+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 12160281944434576281
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudelgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.185.57
Subject: Re: [Qemu-devel] [PATCH v5 9/9] tests: add a m25p80 test
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tXPKQcmeLKi+

On 07/01/2016 07:18 PM, Peter Maydell wrote:
> On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> This test uses the palmetto platform and the AST2400 SPI controller to
>> test the m25p80 flash module device model. The flash model is defined
>> by the platform (n25q256a) and it would be nice to find way to control
>> it, using a property probably.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>
>=20
> This test fails on ppc64be:
>=20
> TEST: tests/m25p80-test... (pid=3D65123)
>   /arm/m25p80/read_jedec:                                              =
OK
>   /arm/m25p80/erase_sector:                                            =
OK
>   /arm/m25p80/erase_all:                                               =
**
> ERROR:/home/pm215/qemu/tests/m25p80-test.c:162:test_erase_all:
> assertion failed (page[i] =3D=3D 0x0):
> (0xffffffff =3D=3D 0x00000000)
> FAIL
> GTester: last random seed: R02S54b2016fda21b092e18d7a23a2db86ba
> (pid=3D65128)
>   /arm/m25p80/write_page:                                              =
**
> ERROR:/home/pm215/qemu/tests/m25p80-test.c:200:test_write_page:
> assertion failed (page[i] =3D=3D my_page_addr + i * 4): (0x00000000 =3D=
=3D
> 0x01400000)
> FAIL
> GTester: last random seed: R02S8708910d6b72f700bc41e9340a516239
> (pid=3D65133)
> FAIL: tests/m25p80-test

yes ... I am not sure how to fix this :/=20

I started with a patch using qtest_big_endian() and I found that=20
this one was fixing the problem :=20

	https://lists.gnu.org/archive/html/qemu-devel/2016-06/msg07876.html

but it feels wrong. The interesting part is that the guest fully=20
boots on a ppc64be. We need an endian shaman for this. Greg ?=20

Thanks,

C.

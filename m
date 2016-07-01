Received: by 10.25.21.96 with SMTP id l93csp492933lfi;
        Fri, 1 Jul 2016 14:47:50 -0700 (PDT)
X-Received: by 10.200.41.14 with SMTP id y14mr787252qty.11.1467409670768;
        Fri, 01 Jul 2016 14:47:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si2912510qtv.138.2016.07.01.14.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 14:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ6Hu-0005F0-9t
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 17:47:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1bJ6Gx-0004y4-9f
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 17:46:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1bJ6Gt-0006Vn-AZ
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 17:46:51 -0400
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:55089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1bJ6Gt-0006VA-54
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 17:46:47 -0400
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 723E51008D0F
	for <qemu-devel@nongnu.org>; Fri,  1 Jul 2016 23:46:44 +0200 (CEST)
Received: from bahia.lan (unknown [91.224.149.27])
	(Authenticated sender: groug@kaod.org)
	by player789.ha.ovh.net (Postfix) with ESMTPSA id 3D84526006B;
	Fri,  1 Jul 2016 23:46:35 +0200 (CEST)
Date: Fri, 1 Jul 2016 23:46:33 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20160701234633.7e073c2f@bahia.lan>
In-Reply-To: <39c0c830-dd0b-301f-78fc-6de176772a7c@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<CAFEAcA9Z_6bPMwCumhwQqqwyy-B_vKXyLPBfJeK8uY03Xx3G+A@mail.gmail.com>
	<39c0c830-dd0b-301f-78fc-6de176772a7c@kaod.org>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 16484300539710970251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudelgdduheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.56.233
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kxmp5+i6r4wi

On Fri, 1 Jul 2016 19:30:30 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 07/01/2016 07:18 PM, Peter Maydell wrote:
> > On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote: =
=20
> >> This test uses the palmetto platform and the AST2400 SPI controller to
> >> test the m25p80 flash module device model. The flash model is defined
> >> by the platform (n25q256a) and it would be nice to find way to control
> >> it, using a property probably.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >> =20
> >=20
> > This test fails on ppc64be:
> >=20
> > TEST: tests/m25p80-test... (pid=3D65123)
> >   /arm/m25p80/read_jedec:                                              =
OK
> >   /arm/m25p80/erase_sector:                                            =
OK
> >   /arm/m25p80/erase_all:                                               =
**
> > ERROR:/home/pm215/qemu/tests/m25p80-test.c:162:test_erase_all:
> > assertion failed (page[i] =3D=3D 0x0):
> > (0xffffffff =3D=3D 0x00000000)
> > FAIL
> > GTester: last random seed: R02S54b2016fda21b092e18d7a23a2db86ba
> > (pid=3D65128)
> >   /arm/m25p80/write_page:                                              =
**
> > ERROR:/home/pm215/qemu/tests/m25p80-test.c:200:test_write_page:
> > assertion failed (page[i] =3D=3D my_page_addr + i * 4): (0x00000000 =3D=
=3D
> > 0x01400000)
> > FAIL
> > GTester: last random seed: R02S8708910d6b72f700bc41e9340a516239
> > (pid=3D65133)
> > FAIL: tests/m25p80-test =20
>=20
> yes ... I am not sure how to fix this :/=20
>=20
> I started with a patch using qtest_big_endian() and I found that=20
> this one was fixing the problem :=20
>=20
> 	https://lists.gnu.org/archive/html/qemu-devel/2016-06/msg07876.html
>=20
> but it feels wrong. The interesting part is that the guest fully=20
> boots on a ppc64be. We need an endian shaman for this. Greg ?=20
>=20

Heh ! Looking at the Cc list I guess you have chances to find the
shaman you're looking for :)

Anyway, doing bswap32() systematically like in the patch mentioned above
looks weird indeed.

> Thanks,
>=20
> C.


Received: by 10.25.21.96 with SMTP id l93csp1586848lfi;
        Tue, 28 Jun 2016 04:43:58 -0700 (PDT)
X-Received: by 10.55.111.66 with SMTP id k63mr1061264qkc.22.1467114238148;
        Tue, 28 Jun 2016 04:43:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si75778qke.315.2016.06.28.04.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 04:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHrQr-0002zZ-IZ
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 07:43:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bHrQn-0002wW-5i
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 07:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bHrQi-00085o-4t
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 07:43:52 -0400
Received: from mx6-phx2.redhat.com ([209.132.183.39]:48234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bHrQh-00085d-S8; Tue, 28 Jun 2016 07:43:48 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx6-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5SBhcdT058578;
	Tue, 28 Jun 2016 07:43:38 -0400
Date: Tue, 28 Jun 2016 07:43:37 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Message-ID: <1065775744.2615831.1467114217903.JavaMail.zimbra@redhat.com>
In-Reply-To: <ea6a1789-9c82-e3d7-6c82-0f26817bbb34@kaod.org>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
	<bed58244-e877-aeda-d7c6-76d01540beb3@redhat.com>
	<6276f949-6031-07fe-91f2-7037f0438302@kaod.org>
	<CAFEAcA-UkVQu49yTFx0PNbfB74=7iqAnV=a4BhSTGmXq-5BTog@mail.gmail.com>
	<ea6a1789-9c82-e3d7-6c82-0f26817bbb34@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: tests: add a m25p80 test
Thread-Index: f1p8Vau35spP8/0cwLgoPYAQSPOMJA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.39
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lvT/1JlFVPZf



----- Original Message -----
> From: "C=C3=A9dric Le Goater" <clg@kaod.org>
> To: "Peter Maydell" <peter.maydell@linaro.org>
> Cc: "Paolo Bonzini" <pbonzini@redhat.com>, "Peter Crosthwaite" <crosthwai=
te.peter@gmail.com>, "Kevin Wolf"
> <kwolf@redhat.com>, "Andrew Jeffery" <andrew@aj.id.au>, "QEMU Developers"=
 <qemu-devel@nongnu.org>, "Markus
> Armbruster" <armbru@redhat.com>, "qemu-arm" <qemu-arm@nongnu.org>
> Sent: Tuesday, June 28, 2016 10:40:15 AM
> Subject: Re: [PATCH v4 5/5] tests: add a m25p80 test
>=20
> On 06/28/2016 10:34 AM, Peter Maydell wrote:
> > On 28 June 2016 at 09:32, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >> On 06/28/2016 10:01 AM, Paolo Bonzini wrote:
> >>>
> >>>
> >>> On 27/06/2016 18:43, C=C3=A9dric Le Goater wrote:
> >>>>  check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)
> >>>> +check-qtest-arm-y =3D tests/m25p80-test$(EXESUF)
> >>>
> >>> This should be a "+=3D".
> >>
> >> OK. I will fix the above line also then :
> >>
> >>         check-qtest-arm-y =3D tests/tmp105-test$(EXESUF)
> >>         check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)
> >=20
> > That's fixed in master.
>=20
> OK. The patchset needs a rebase now that Marcin's patches are in.

Please include my patches too, since otherwise the test is broken.

Thanks,

Paolo

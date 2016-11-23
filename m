Received: by 10.25.150.194 with SMTP id y185csp2468832lfd;
        Wed, 23 Nov 2016 01:43:20 -0800 (PST)
X-Received: by 10.200.54.209 with SMTP id b17mr1558343qtc.183.1479894200548;
        Wed, 23 Nov 2016 01:43:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si18924879qkc.200.2016.11.23.01.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 01:43:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9U5I-0002ft-04
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 04:43:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c9U5E-0002eh-4b
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 04:43:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c9U5D-0006sB-3C
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 04:43:16 -0500
Received: from mx4-phx2.redhat.com ([209.132.183.25]:36726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1c9U58-0006pc-99; Wed, 23 Nov 2016 04:43:10 -0500
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id uAN9h2H5002346;
	Wed, 23 Nov 2016 04:43:02 -0500
Date: Wed, 23 Nov 2016 04:43:01 -0500 (EST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Message-ID: <1761115996.1384447.1479894181425.JavaMail.zimbra@redhat.com>
In-Reply-To: <1479856790.11116.111.camel@au1.ibm.com>
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
	<debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
	<3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
	<1479853887.11116.95.camel@au1.ibm.com>
	<6d4e34f8-4b0b-85f2-93d6-6f0b3e2e7fb3@redhat.com>
	<1479856790.11116.111.camel@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF49 (Linux)/8.0.6_GA_5922)
Thread-Topic: qtest: Support named interrupts
Thread-Index: jlrnGKINWs2QO7SUFCmUXnYu4iaQJw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 209.132.183.25
Subject: Re: [Qemu-arm] [PATCH 2/4] qtest: Support named interrupts
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HKhFKjBmSiX7



----- Original Message -----
> From: "Alastair D'Silva" <alastair@au1.ibm.com>
> To: "Paolo Bonzini" <pbonzini@redhat.com>, "C=C3=A9dric Le Goater" <clg@k=
aod.org>, qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>, "A=
ndrew Jeffery" <andrew@aj.id.au>, "Joel
> Stanley" <joel@jms.id.au>
> Sent: Wednesday, November 23, 2016 12:19:50 AM
> Subject: Re: [PATCH 2/4] qtest: Support named interrupts
>=20
> On Tue, 2016-11-22 at 23:39 +0100, Paolo Bonzini wrote:
> > On 22/11/2016 23:31, Alastair D'Silva wrote:
> > > >=20
> > > > This seems wrong.=C2=A0=C2=A0The IRQ should not be modifiable by th=
e
> > > > test.
> > >=20
> > > Thanks Paolo, could you please advise as to why that is?
>=20
> Could you answer this please? I would like to understand why.

Well, I didn't know yet until I knew what the GPIO line was for. :)

But in general, the idea is that the qtest acts as the CPU.  The test
cases can control the passing of time precisely, and they can _observe_
additional events (such as interrupts or GPIO lines) but they don't inject
anything that the CPU cannot inject.  The reason is to make the tests
more like small programs.  It does mean that you are limited by the
connections of the board.

> > > The situation I am addressing is that I device under test that
> > > changes
> > > behaviour when a GPIO line is raised. Is there another way I should
> > > be
> > > raising that line from within qtest?
> >=20
> > What causes the GPIO line to be raised in the normal emulated case?
>
> It would be wired to a GPIO line from the host microcontroller, under
> software control.

Note I said the normal emulated case, not the real hardware case.
Is there a GPIO controller that is not yet part of the ASpeed models?

If the emulated ASpeed board cannot yet work with FOut, I would just
leave it out of the testcases.

Paolo

> In this test case, the device is connected to a "borrowed" board via
> the command line:
> =C2=A0 =C2=A0 snprintf(args, sizeof(args), "-display none -machine imx25-=
pdk "
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"=
-device rx8900,bus=3Di2c.0,address=3D0x%x,id=3D%s",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0R=
X8900_ADDR, RX8900_TEST_ID);
>=20
> I couldn't see a way to wire in the the GPIO to the host via the
> command line, but even if there was, manipulating it would require
> manipulating the host CPU, which would broaden the scope of the test.

> At the moment, the test has no dependency on/interaction with the host
> CPU, it's just using it to provide an I2C bus.

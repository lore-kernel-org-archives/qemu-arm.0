Received: by 10.25.150.194 with SMTP id y185csp2283005lfd;
        Tue, 22 Nov 2016 15:20:12 -0800 (PST)
X-Received: by 10.55.81.65 with SMTP id f62mr158250qkb.278.1479856811998;
        Tue, 22 Nov 2016 15:20:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si17755375qkb.172.2016.11.22.15.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 15:20:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9KME-0004Fp-OO
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 18:20:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c9KMA-0004Dr-9y
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 18:20:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c9KM7-0004DS-5O
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 18:20:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1c9KM6-0004Cr-S8
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 18:20:03 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAMNJMYW046587
	for <qemu-arm@nongnu.org>; Tue, 22 Nov 2016 18:20:01 -0500
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
	by mx0a-001b2d01.pphosted.com with ESMTP id 26vu41uj6c-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Tue, 22 Nov 2016 18:20:00 -0500
Received: from localhost
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 23 Nov 2016 09:19:58 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 23 Nov 2016 09:19:57 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 780412BB0055;
	Wed, 23 Nov 2016 10:19:56 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAMNJukt55115970; Wed, 23 Nov 2016 10:19:56 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAMNJtWT004010; Wed, 23 Nov 2016 10:19:56 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAMNJpXp003970; Wed, 23 Nov 2016 10:19:54 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5E023A023E;
	Wed, 23 Nov 2016 10:19:50 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
	<clg@kaod.org>, qemu-arm@nongnu.org
Date: Wed, 23 Nov 2016 10:19:50 +1100
In-Reply-To: <6d4e34f8-4b0b-85f2-93d6-6f0b3e2e7fb3@redhat.com>
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
	<debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
	<3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
	<1479853887.11116.95.camel@au1.ibm.com>
	<6d4e34f8-4b0b-85f2-93d6-6f0b3e2e7fb3@redhat.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112223-0040-0000-0000-000002CA8BFE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112223-0041-0000-0000-00000BBE0050
Message-Id: <1479856790.11116.111.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611220393
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id uAMNJMYW046587
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BzdRGYse8khY

On Tue, 2016-11-22 at 23:39 +0100, Paolo Bonzini wrote:

> On 22/11/2016 23:31, Alastair D'Silva wrote:
> >=20
> > >=20
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (irq =
=3D=3D NULL) {
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0qtest_send_prefix(chr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0qtest_send(chr, "FAIL Unknown IRQ\n");
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0return;
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_set=
_irq(irq, level);
> > > >=20
> > > > This seems wrong.=C2=A0=C2=A0The IRQ should not be modifiable by =
the
> > > > test.
> > > >=20
> > > > Paolo
> > > >=20
> > Thanks Paolo, could you please advise as to why that is?

Could you answer this please? I would like to understand why.

> > The situation I am addressing is that I device under test that
> > changes
> > behaviour when a GPIO line is raised. Is there another way I should
> > be
> > raising that line from within qtest?
>=20
> What causes the GPIO line to be raised in the normal emulated case?
>=20
>=C2=A0

It would be wired to a GPIO line from the host microcontroller, under
software control.

In this test case, the device is connected to a "borrowed" board via
the command line:
=C2=A0 =C2=A0 snprintf(args, sizeof(args), "-display none -machine imx25-=
pdk "
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"=
-device rx8900,bus=3Di2c.0,address=3D0x%x,id=3D%s",
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0R=
X8900_ADDR, RX8900_TEST_ID);

I couldn't see a way to wire in the the GPIO to the host via the
command line, but even if there was, manipulating it would require
manipulating the host CPU, which would broaden the scope of the test.
At the moment, the test has no dependency on/interaction with the host
CPU, it's just using it to provide an I2C bus.


--=C2=A0
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819


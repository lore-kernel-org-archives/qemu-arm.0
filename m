Received: by 10.25.27.66 with SMTP id b63csp213981lfb;
        Fri, 10 Jun 2016 03:28:57 -0700 (PDT)
X-Received: by 10.55.160.211 with SMTP id j202mr1087978qke.0.1465554537712;
        Fri, 10 Jun 2016 03:28:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 124si5025645qkk.34.2016.06.10.03.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 03:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBJgP-0000eX-3B
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 06:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bBJRU-0004oI-91
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 06:13:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bBJRR-0001m5-Uh
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 06:13:31 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:26741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1bBJRL-0001iM-Qe; Fri, 10 Jun 2016 06:13:23 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id B3F2DCC88CE11;
	Fri, 10 Jun 2016 11:13:17 +0100 (IST)
Received: from BADAG03.ba.imgtec.org (10.20.40.115) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 10 Jun 2016 11:13:20 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	badag03.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Fri, 10 Jun 2016 03:13:15 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Maciej Rozycki <Maciej.Rozycki@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>
Thread-Topic: [PATCH v6 8/9] target-mips: Add nan2008 flavor of
	<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
Thread-Index: AQHRr31qJcKJ1Be/GkeXGAxp8y1NmZ/eeN6AgAQm0sc=
Date: Fri, 10 Jun 2016 10:13:14 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85916B85AC@BADAG02.ba.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>,
	<alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-devel] [PATCH v6 8/9] target-mips: Add nan2008 flavor of
 <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CKjoc4oJSPMy

I referred to SoftFloat library in QEMU code, and the case "Operand is smal=
ler than INT_MIN" is different between SoftFloat and Mips-B, while the case=
 "Operand is a NaN" is different between SoftFloat and Mips-A.

Aleksandar
________________________________________
From: Maciej Rozycki
Sent: Tuesday, June 07, 2016 4:39 AM
To: Aleksandar Markovic
Cc: qemu-devel@nongnu.org; peter.maydell@linaro.org; proljc@gmail.com; kbas=
tian@mail.uni-paderborn.de; mark.cave-ayland@ilande.co.uk; agraf@suse.de; b=
lauwirbel@gmail.com; jcmvbkbc@gmail.com; Aleksandar Markovic; qemu-arm@nong=
nu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbonzini@redhat.com; Miodrag =
Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu.cn; Leon Alrae; afaerber@=
suse.de; Aurelien Jarno; rth@twiddle.net
Subject: Re: [PATCH v6 8/9] target-mips: Add nan2008 flavor of <CEIL|CVT|FL=
OOR|ROUND|TRUNC>.<L|W>.<S|D>

On Mon, 16 May 2016, Aleksandar Markovic wrote:

> Here one can distinguish three cases:
>
> CASE MIPS-A: (FCR31.NAN2008 =3D=3D 1)
>
>    1. Operand is a NaN, result should be 0;
>    2. Operand is larger than INT_MAX, result should be INT_MAX;
>    2. Operand is smaller than INT_MIN, result should be INT_MIN.
>
> CASE MIPS-B: (FCR31.NAN2008 =3D=3D 0)
>
>    1. Operand is a NaN, result should be INT_MAX;
>    2. Operand is larger than INT_MAX, result should be INT_MAX;
>    2. Operand is smaller than INT_MIN, result should be INT_MAX.
>
> CASE SOFTFLOAT:
>
>    1. Operand is a NaN, result is INT_MAX;
>    2. Operand is larger than INT_MAX, result is INT_MAX;
>    2. Operand is smaller than INT_MIN, result is INT_MIN.
>
> It is interesting that neither MIPS-A nor MIPS-B desired behaviors
> are in this sense identical to correspondent SoftFloat behavior.

 A bug in SoftFloat probably -- it has only been fixed quite recently to
handle all MIPS architecture's peculiarites correctly and this case must
have been missed then, making data produced not necessarily identical
between the legacy-NaN hard-float and the soft-float ABIs, even though
intent has been for it to be.

 FAOD, you refer to SoftFloat in the most recent version of GCC, do you?

  Maciej=

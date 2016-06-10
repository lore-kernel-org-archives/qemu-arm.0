Received: by 10.25.85.209 with SMTP id j200csp85814lfb;
        Fri, 10 Jun 2016 10:04:30 -0700 (PDT)
X-Received: by 10.55.164.20 with SMTP id n20mr2854650qke.73.1465578270246;
        Fri, 10 Jun 2016 10:04:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a185si6792063qha.39.2016.06.10.10.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPrB-00074b-OV
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:04:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bBPnY-00058s-Oe
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:00:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bBPnU-0007zY-UP
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:00:43 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:18990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1bBPnU-0007zU-Oz; Fri, 10 Jun 2016 13:00:40 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id C354CF5EFA95E;
	Fri, 10 Jun 2016 18:00:34 +0100 (IST)
Received: from BADAG03.ba.imgtec.org (10.20.40.115) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 10 Jun 2016 18:00:38 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	badag03.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Fri, 10 Jun 2016 10:00:34 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Maciej Rozycki <Maciej.Rozycki@imgtec.com>
Thread-Topic: [PATCH v6 8/9] target-mips: Add nan2008 flavor of
	<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
Thread-Index: AQHRr31qJcKJ1Be/GkeXGAxp8y1NmZ/eeN6AgAQm0seAAH4tAP//9DCb
Date: Fri, 10 Jun 2016 17:00:33 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85916B87C8@BADAG02.ba.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>,
	<alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B85AC@BADAG02.ba.imgtec.org>,
	<alpine.DEB.2.00.1606101132270.10382@tp.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.00.1606101132270.10382@tp.orcam.me.uk>
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
Subject: Re: [Qemu-arm] [PATCH v6 8/9] target-mips: Add nan2008 flavor of
 <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"agraf@suse.de" <agraf@suse.de>,
	Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ftv5Tv8UZQX7

The changes that make QEMU behavior the same as hardware behavior (in relat=
ion to CEIL, CVT, FLOOR, ROUND, TRUNC Mips instructions) are already contai=
ned in this patch.

I just mentioned Mips-A / Mips-B / SoftFloat differences as an explanation/=
observation related to the change in this patch.

Aleksandar
________________________________________
From: Maciej Rozycki
Sent: Friday, June 10, 2016 3:35 AM
To: Aleksandar Markovic
Cc: Aleksandar Markovic; qemu-devel@nongnu.org; peter.maydell@linaro.org; p=
roljc@gmail.com; kbastian@mail.uni-paderborn.de; mark.cave-ayland@ilande.co=
.uk; agraf@suse.de; blauwirbel@gmail.com; jcmvbkbc@gmail.com; qemu-arm@nong=
nu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbonzini@redhat.com; Miodrag =
Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu.cn; Leon Alrae; afaerber@=
suse.de; Aurelien Jarno; rth@twiddle.net
Subject: RE: [PATCH v6 8/9] target-mips: Add nan2008 flavor of <CEIL|CVT|FL=
OOR|ROUND|TRUNC>.<L|W>.<S|D>

On Fri, 10 Jun 2016, Aleksandar Markovic wrote:

> I referred to SoftFloat library in QEMU code, and the case "Operand is
> smaller than INT_MIN" is different between SoftFloat and Mips-B, while
> the case "Operand is a NaN" is different between SoftFloat and Mips-A.

 Ah, but then you just can and indeed need to fix it to match hardware.
I had it done properly with the original patches I believe.

  Maciej=

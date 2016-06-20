Received: by 10.25.21.96 with SMTP id l93csp1373390lfi;
        Mon, 20 Jun 2016 03:20:55 -0700 (PDT)
X-Received: by 10.55.43.130 with SMTP id r2mr19454314qkr.150.1466418054465;
        Mon, 20 Jun 2016 03:20:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j30si47124311qta.63.2016.06.20.03.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 03:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bEwK5-0004Sd-Un
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 06:20:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bEwK3-0004SN-DK
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 06:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1bEwJy-00025m-1f
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 06:20:50 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:28349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1bEwJx-00024i-RI; Mon, 20 Jun 2016 06:20:45 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 0E97A9B051852;
	Mon, 20 Jun 2016 11:20:37 +0100 (IST)
Received: from BADAG03.ba.imgtec.org (10.20.40.115) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 20 Jun 2016 11:20:39 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	badag03.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Mon, 20 Jun 2016 03:20:34 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Maciej Rozycki <Maciej.Rozycki@imgtec.com>, Leon Alrae
	<Leon.Alrae@imgtec.com>
Thread-Topic: [PATCH v6 8/9] target-mips: Add nan2008 flavor of
	<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
Thread-Index: AQHRr31qJcKJ1Be/GkeXGAxp8y1NmZ/eeN6AgAQm0seAAH4tAP//9DCbgACtEACABeZUgIAAFGiAgAigYwI=
Date: Mon, 20 Jun 2016 10:20:33 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85916C0A4C@BADAG02.ba.imgtec.org>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
	<alpine.DEB.2.00.1606071221480.9917@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B85AC@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606101132270.10382@tp.orcam.me.uk>
	<EF5FA6C3467F85449672C3E735957B85916B87C8@BADAG02.ba.imgtec.org>
	<alpine.DEB.2.00.1606102045400.10382@tp.orcam.me.uk>
	<20160614141753.GD13260@hhmipssw201.hh.imgtec.org>,
	<alpine.DEB.2.00.1606141629380.7182@tp.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.00.1606141629380.7182@tp.orcam.me.uk>
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
	"afaerber@suse.de" <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+A3WkrZnaGC

This patch is about NaN-2008 flavor of Mips instructions CEIL, CVT, FLOOR, =
ROUND, TRUNC only (its title is "Add nan2008 flavor...").=0A=
=0A=
Legacy-NaN flavors of the same Mips instructions already operate correctly,=
 and there is nothing to be fixed.=0A=
=0A=
The commit message is not description of another bug, it explains the conte=
xt of the change, and the content of added code segments.=0A=
=0A=
________________________________________=0A=
From: Maciej Rozycki=0A=
Sent: Tuesday, June 14, 2016 8:30 AM=0A=
To: Leon Alrae=0A=
Cc: Aleksandar Markovic; Aleksandar Markovic; qemu-devel@nongnu.org; peter.=
maydell@linaro.org; proljc@gmail.com; kbastian@mail.uni-paderborn.de; mark.=
cave-ayland@ilande.co.uk; agraf@suse.de; blauwirbel@gmail.com; jcmvbkbc@gma=
il.com; qemu-arm@nongnu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbonzini=
@redhat.com; Miodrag Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu.cn; =
afaerber@suse.de; Aurelien Jarno; rth@twiddle.net=0A=
Subject: Re: [PATCH v6 8/9] target-mips: Add nan2008 flavor of <CEIL|CVT|FL=
OOR|ROUND|TRUNC>.<L|W>.<S|D>=0A=
=0A=
On Tue, 14 Jun 2016, Leon Alrae wrote:=0A=
=0A=
> > 1. A bug fix for SoftFloat legacy-NaN (original) MIPS support, which ha=
s=0A=
> >    been there probably since forever (i.e. since the MIPS target was ad=
ded=0A=
> >    to QEMU).=0A=
>=0A=
> I've just done another round of review and as far as I can tell these=0A=
> patches don't modify the legacy-NaN MIPS behaviour. I believe Aleksandar=
=0A=
> was referring to new functionality (i.e. 2008 NaN) only.=0A=
=0A=
 Well, if there's a bug, then it needs to be fixed rather than documented.=
=0A=
=0A=
  Maciej=0A=

Received: by 10.25.208.194 with SMTP id h185csp1033789lfg;
        Mon, 25 Apr 2016 10:10:53 -0700 (PDT)
X-Received: by 10.55.160.215 with SMTP id j206mr19350154qke.108.1461604253335;
        Mon, 25 Apr 2016 10:10:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w186si11268902qhe.26.2016.04.25.10.10.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 10:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auk28-0006Qh-Pp
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 13:10:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1auk1z-0006Fs-Fj
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 13:10:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1auk1s-00039m-7c
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 13:10:43 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:23649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1auk1s-00036s-0u; Mon, 25 Apr 2016 13:10:36 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id E29CB7E7B7249;
	Mon, 25 Apr 2016 18:10:27 +0100 (IST)
Received: from BADAG03.ba.imgtec.org (10.20.40.115) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Mon, 25 Apr 2016 18:10:31 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	badag03.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Mon, 25 Apr 2016 10:10:28 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Maciej Rozycki <Maciej.Rozycki@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>
Thread-Topic: [PATCH v5 5/9] target-mips: Activate IEEE 274-2008 signaling
	NaN bit meaning
Thread-Index: AQHRmYvr3ro7T86mXkmmXeiwbqbZuJ+bOXmA//+8rx0=
Date: Mon, 25 Apr 2016 17:10:27 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859169D080@BADAG02.ba.imgtec.org>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-6-git-send-email-aleksandar.markovic@rt-rk.com>,
	<alpine.DEB.2.00.1604241428540.21846@tp.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.00.1604241428540.21846@tp.orcam.me.uk>
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
Subject: Re: [Qemu-arm] [PATCH v5 5/9] target-mips: Activate IEEE 274-2008
 signaling NaN bit meaning
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
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /fJYBxbzFdCd

No, nothing is lost. The plan is to add this functionality at a later time.
________________________________________
From: Maciej Rozycki
Sent: Monday, April 25, 2016 7:06 AM
To: Aleksandar Markovic
Cc: qemu-devel@nongnu.org; peter.maydell@linaro.org; proljc@gmail.com; kbas=
tian@mail.uni-paderborn.de; mark.cave-ayland@ilande.co.uk; agraf@suse.de; b=
lauwirbel@gmail.com; jcmvbkbc@gmail.com; Aleksandar Markovic; qemu-arm@nong=
nu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbonzini@redhat.com; Miodrag =
Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu.cn; Leon Alrae; afaerber@=
suse.de; Aurelien Jarno; rth@twiddle.net
Subject: Re: [PATCH v5 5/9] target-mips: Activate IEEE 274-2008 signaling N=
aN bit meaning

On Mon, 18 Apr 2016, Aleksandar Markovic wrote:

> Functions mips_cpu_reset() and msa_reset() are updated so that flag
> snan_bit_is_one is properly set for any Mips FPU/MSA configuration.
> For main FPUs, CPUs with FCR31's FCR31_NAN2008 bit set will invoke
> set_snan_bit_is_one(0). For MSA, as it is IEEE 274-2008 compliant
> from it inception, set_snan_bit_is_one(0) will always be invoked.

 I have skimmed over the series -- have you lost MIPSr3 support (writable
FCSR ABS2008 and NAN2008 bits) in porting?

  Maciej

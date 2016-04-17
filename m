Received: by 10.25.208.194 with SMTP id h185csp979756lfg;
        Sun, 17 Apr 2016 11:22:03 -0700 (PDT)
X-Received: by 10.55.78.131 with SMTP id c125mr38611402qkb.71.1460917323471;
        Sun, 17 Apr 2016 11:22:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si38677818qhy.20.2016.04.17.11.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Apr 2016 11:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1arrKc-0004pd-Vp
	for alex.bennee@linaro.org; Sun, 17 Apr 2016 14:22:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1arrKZ-0004mv-MX
	for qemu-arm@nongnu.org; Sun, 17 Apr 2016 14:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1arrKV-0005fV-IB
	for qemu-arm@nongnu.org; Sun, 17 Apr 2016 14:21:59 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:22242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1arrKV-0005en-BY; Sun, 17 Apr 2016 14:21:55 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 7E79149F72F7D;
	Sun, 17 Apr 2016 19:21:41 +0100 (IST)
Received: from BAMAIL02.ba.imgtec.org (10.20.40.28) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Sun, 17 Apr 2016 19:21:45 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	bamail02.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Sun, 17 Apr 2016 11:21:41 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Leon Alrae <Leon.Alrae@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v4 1/9] softfloat: Implement run-time-configurable
	meaning of signaling NaN bit
Thread-Index: AQHRlLsD7sE3dk5nvEKtZ9tYdGK2y5+KEUSAgACoN9WAAJlHgP//mAXBgAOVLiU=
Date: Sun, 17 Apr 2016 18:21:40 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B8591694192@BADAG02.ba.imgtec.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<570FB7C7.7090404@imgtec.com>
	<EF5FA6C3467F85449672C3E735957B8591692ECC@BADAG02.ba.imgtec.org>,
	<5710C577.8080309@imgtec.com>,
	<EF5FA6C3467F85449672C3E735957B8591692F41@BADAG02.ba.imgtec.org>
In-Reply-To: <EF5FA6C3467F85449672C3E735957B8591692F41@BADAG02.ba.imgtec.org>
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
Subject: Re: [Qemu-arm] [PATCH v4 1/9] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
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
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7a4LckBR3S2i

Hi, Leon,

I cannot say thank you enough for all your valuable feedback.

Just wanted to give you a heads up that in the next version of this patch s=
eries (planned for tomorrow (Monday) or the day after tomorrow), I am going=
 to integrate all your suggestions from this thread, including name "status=
" instead of "fst", and also following segment in cpu.h:

/* op_helper.c */
uint32_t float_class_s(uint32_t arg, float_status *fst);
uint64_t float_class_d(uint64_t arg, float_status *fst);

(unless you tell me not to do so)

Also, I think there will be some improvements in the patch related to <CEIL=
|CVT|FLOOR|...>, that are currently being analysed and tested here.

Sincerely,
Aleksandar
________________________________________
From: Aleksandar Markovic
Sent: Friday, April 15, 2016 4:38 AM
To: Leon Alrae; Aleksandar Markovic; qemu-devel@nongnu.org
Cc: proljc@gmail.com; kbastian@mail.uni-paderborn.de; mark.cave-ayland@ilan=
de.co.uk; agraf@suse.de; blauwirbel@gmail.com; jcmvbkbc@gmail.com; qemu-arm=
@nongnu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbonzini@redhat.com; Mio=
drag Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu.cn; afaerber@suse.de=
; aurelien@aurel32.net; rth@twiddle.net; Maciej Rozycki
Subject: RE: [PATCH v4 1/9] softfloat: Implement run-time-configurable mean=
ing of signaling NaN bit

Hi, Leon,

There is one more subtle point here. The question is: Where to put declarat=
ions of two new functions? This is a new case in the organization of mips-s=
pecific source code files. File helpers.h does not seem to be a good place,=
 cpu.h - maybe, but still looks clumsy to me.

IMHO, my solution from earlier versions of this patch series, in spite of c=
ontaining code duplication, is superior in the sense of keeping current mip=
s-specific source code file relations intact, respecting autonomy of msa_he=
lpers.c, and is the best overall.

Yours,
Aleksandar

________________________________________
From: Leon Alrae
Sent: Friday, April 15, 2016 3:41 AM
To: Aleksandar Markovic; Aleksandar Markovic; qemu-devel@nongnu.org
Cc: proljc@gmail.com; kbastian@mail.uni-paderborn.de; mark.cave-ayland@ilan=
de.co.uk; agraf@suse.de; blauwirbel@gmail.com; jcmvbkbc@gmail.com; qemu-arm=
@nongnu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbonzini@redhat.com; Mio=
drag Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu.cn; afaerber@suse.de=
; aurelien@aurel32.net; rth@twiddle.net; Maciej Rozycki
Subject: Re: [PATCH v4 1/9] softfloat: Implement run-time-configurable mean=
ing of signaling NaN bit

On 15/04/16 09:48, Aleksandar Markovic wrote:
> Agreed. This looks much better, and is simpler and faster. Though, it loo=
ks to me that "fst" should be called "status" instead (just not to break co=
nsistency throughout SoftFloat library and in other places of assigning nam=
e "status" to the last argument of any function if its type is float_status=
*). If you agree, I am going to replace name "fst" with name "status" in th=
e code that you provided, otherwise as-is.

Yes, "status" will be fine.

Leon=

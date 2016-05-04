Received: by 10.25.208.137 with SMTP id h131csp100546lfg;
        Wed, 4 May 2016 04:29:37 -0700 (PDT)
X-Received: by 10.28.47.206 with SMTP id v197mr8913028wmv.87.1462361377661;
        Wed, 04 May 2016 04:29:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id rw19si4291059wjb.184.2016.05.04.04.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 04:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axuzY-0007WT-Ha
	for alex.bennee@linaro.org; Wed, 04 May 2016 07:29:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1axuzQ-0007LX-Im
	for qemu-arm@nongnu.org; Wed, 04 May 2016 07:29:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1axuzE-0002Fn-CL
	for qemu-arm@nongnu.org; Wed, 04 May 2016 07:29:07 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:42268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1axuzE-00029E-5r; Wed, 04 May 2016 07:29:00 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id AB0DAE07F5EBE;
	Wed,  4 May 2016 12:28:27 +0100 (IST)
Received: from BADAG04.ba.imgtec.org (10.20.40.112) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 4 May 2016 12:28:30 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG04.ba.imgtec.org ([fe80::b930:4082:95b0:e446%15]) with mapi id
	14.03.0266.001; Wed, 4 May 2016 04:28:20 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Leon Alrae <Leon.Alrae@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>
Thread-Topic: [PATCH v5 7/9] target-mips: Add nan2008 flavor of
	<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
Thread-Index: AQHRmYvss6kqxyQ4FEGR0OIoAsR62p+hmIEAgAcfwgg=
Date: Wed, 4 May 2016 11:28:20 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859169F47D@BADAG02.ba.imgtec.org>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-8-git-send-email-aleksandar.markovic@rt-rk.com>,
	<57237C84.8040907@imgtec.com>
In-Reply-To: <57237C84.8040907@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 7/9] target-mips: Add nan2008 flavor of
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
	"agraf@suse.de" <agraf@suse.de>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /On9NAJHo7t+


> > @@ -8919,7 +8920,11 @@ static void gen_farith (DisasContext *ctx, enum =
fopcode op1,
> >              TCGv_i64 fp64 =3D tcg_temp_new_i64();
> >
> >              gen_load_fpr32(ctx, fp32, fs);
> > -            gen_helper_float_roundl_s(fp64, cpu_env, fp32);
> > +            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {

> Why testing the version of the architecture? This will generate wrong
> helper for P5600 which is R5 and IEEE 754-2008 compliant.

The code reflects the documentation.

I just want to bring to your attention following two versions of the paragr=
aph detailing return value of ROUND.L.S for some special cases - one versio=
n from R6 documention, and the other from R5 documentation:

R6: ("MIPS=AE Architecture For Programmers Volume II-A: The MIPS64=AE Instr=
uction Set Reference Manual", Revision 6.04, page 393)

"When the source value is Infinity, NaN, or rounds to an integer outside th=
e range -2 63 to 2 63 -1, the result cannot be
represented correctly and an IEEE Invalid Operation condition exists. The I=
nvalid Operation flag is set in the FCSR.
If the Invalid Operation Enable bit is set in the FCSR, no result is writte=
n to fd and an Invalid Operation exception is
taken immediately. Otherwise, a default result is written to fd. On cores w=
ith FCSR[NAN2008]=3D0, the default result is
2^63=961. On cores with FCSR[NAN2008]=3D1, the default result is:
  =95 0 when the input value is NaN
  =95 2^63 =961 when the input value is +infinity or rounds to a number lar=
ger than 2^63 =961
  =95 -2^63 =961 when the input value is =96infinity or rounds to a number =
smaller than -2^63 =961"

R5: ("MIPS=AE Architecture For Programmers Volume II-A: The MIPS64=AE Instr=
uction Set Reference Manual", Revision 5.04, page 314)

"When the source value is Infinity, NaN, or rounds to an integer outside th=
e range -2 63 to 2 63 -1, the result cannot be
represented correctly and an IEEE Invalid Operation condition exists. In th=
is case the Invalid Operation flag is set in
the FCSR. If the Invalid Operation Enable bit is set in the FCSR, no result=
 is written to fd and an Invalid Operation
exception is taken immediately. Otherwise, the default result, 2 63 =96 1, =
is written to fd."

It looks to me that the documentation for P5600 does not specify any except=
ion or diversion from architecture document in this area.

Please let me know what exception for P5600 I am missing from the documenta=
tion.

Thanks,
Aleksandar=

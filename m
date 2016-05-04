Received: by 10.25.208.137 with SMTP id h131csp184604lfg;
        Wed, 4 May 2016 07:09:28 -0700 (PDT)
X-Received: by 10.28.9.135 with SMTP id 129mr29428021wmj.31.1462370968053;
        Wed, 04 May 2016 07:09:28 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4si5074915wjw.190.2016.05.04.07.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxUE-0004dz-Ii
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:09:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1axxTU-0003bw-So
	for qemu-devel@nongnu.org; Wed, 04 May 2016 10:08:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1axxTI-0004qq-Vt
	for qemu-devel@nongnu.org; Wed, 04 May 2016 10:08:19 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:34552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1axxSz-0004TH-J2; Wed, 04 May 2016 10:07:53 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 6FE398CB2BFF9;
	Wed,  4 May 2016 15:07:15 +0100 (IST)
Received: from [10.20.78.125] (10.20.78.125) by hhmail02.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.266.1; Wed, 4 May 2016
	15:07:17 +0100
Date: Wed, 4 May 2016 15:07:02 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
In-Reply-To: <EF5FA6C3467F85449672C3E735957B859169F47D@BADAG02.ba.imgtec.org>
Message-ID: <alpine.DEB.2.00.1605041443160.6794@tp.orcam.me.uk>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-8-git-send-email-aleksandar.markovic@rt-rk.com>,
	<57237C84.8040907@imgtec.com>
	<EF5FA6C3467F85449672C3E735957B859169F47D@BADAG02.ba.imgtec.org>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
X-Originating-IP: [10.20.78.125]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-devel] [PATCH v5 7/9] target-mips: Add nan2008 flavor of
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"agraf@suse.de" <agraf@suse.de>,
	Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QMIfJ5sseqZp

On Wed, 4 May 2016, Aleksandar Markovic wrote:

> > > @@ -8919,7 +8920,11 @@ static void gen_farith (DisasContext *ctx, e=
num fopcode op1,
> > >              TCGv_i64 fp64 =3D tcg_temp_new_i64();
> > >
> > >              gen_load_fpr32(ctx, fp32, fs);
> > > -            gen_helper_float_roundl_s(fp64, cpu_env, fp32);
> > > +            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)=
) {
>=20
> > Why testing the version of the architecture? This will generate wrong
> > helper for P5600 which is R5 and IEEE 754-2008 compliant.
>=20
> The code reflects the documentation.
>=20
> I just want to bring to your attention following two versions of the pa=
ragraph detailing return value of ROUND.L.S for some special cases - one =
version from R6 documention, and the other from R5 documentation:
>=20
> R6: ("MIPS=AE Architecture For Programmers Volume II-A: The MIPS64=AE I=
nstruction Set Reference Manual", Revision 6.04, page 393)
>=20
> "When the source value is Infinity, NaN, or rounds to an integer outsid=
e the range -2 63 to 2 63 -1, the result cannot be
> represented correctly and an IEEE Invalid Operation condition exists. T=
he Invalid Operation flag is set in the FCSR.
> If the Invalid Operation Enable bit is set in the FCSR, no result is wr=
itten to fd and an Invalid Operation exception is
> taken immediately. Otherwise, a default result is written to fd. On cor=
es with FCSR[NAN2008]=3D0, the default result is
> 2^63=961. On cores with FCSR[NAN2008]=3D1, the default result is:
>   =95 0 when the input value is NaN
>   =95 2^63 =961 when the input value is +infinity or rounds to a number=
 larger than 2^63 =961
>   =95 -2^63 =961 when the input value is =96infinity or rounds to a num=
ber smaller than -2^63 =961"

 This is clearly wrong given that FCSR[NAN2008] is hardwired to 1 in R6;=20
see Table 6.8 in MIPS64 vol. I rev. 6.01.  Please note that individual=20
instruction descriptions should not be used as a (primary) reference,=20
especially in the case of documentation discrepancies -- refer to Table=20
6.3 in vol. I for architectural definitions.

> R5: ("MIPS=AE Architecture For Programmers Volume II-A: The MIPS64=AE I=
nstruction Set Reference Manual", Revision 5.04, page 314)
>=20
> "When the source value is Infinity, NaN, or rounds to an integer outsid=
e the range -2 63 to 2 63 -1, the result cannot be
> represented correctly and an IEEE Invalid Operation condition exists. I=
n this case the Invalid Operation flag is set in
> the FCSR. If the Invalid Operation Enable bit is set in the FCSR, no re=
sult is written to fd and an Invalid Operation
> exception is taken immediately. Otherwise, the default result, 2 63 =96=
 1, is written to fd."

 This is likewise wrong, and refer to Table 5.7 and 5.3 respectively in=20
MIPS64 vol. I rev. 5.04.

 In any case FCSR[NAN2008] is the only condition to be referred.

  Maciej

Received: by 10.25.208.211 with SMTP id h202csp699519lfg;
        Sun, 3 Apr 2016 07:26:06 -0700 (PDT)
X-Received: by 10.140.23.18 with SMTP id 18mr18370396qgo.91.1459693566148;
        Sun, 03 Apr 2016 07:26:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c52si19087128qgc.5.2016.04.03.07.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Apr 2016 07:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1amiyb-0006Q2-Js
	for alex.bennee@linaro.org; Sun, 03 Apr 2016 10:26:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1amiyZ-0006Pv-Bl
	for qemu-arm@nongnu.org; Sun, 03 Apr 2016 10:26:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1amiyV-0002Gb-Qi
	for qemu-arm@nongnu.org; Sun, 03 Apr 2016 10:26:03 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:49890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1amiyV-0002GU-K3; Sun, 03 Apr 2016 10:25:59 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Websense Email Security Gateway with ESMTPS id 85F8DB11660E8;
	Sun,  3 Apr 2016 15:25:52 +0100 (IST)
Received: from BADAG01.ba.imgtec.org (10.20.40.113) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Sun, 3 Apr 2016 15:25:55 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG01.ba.imgtec.org ([fe80::8c38:df2b:fd93:33d3%14]) with mapi id
	14.03.0266.001; Sun, 3 Apr 2016 07:25:51 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Leon Alrae <Leon.Alrae@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 1/2] softfloat: Enable
	run-time-configurable meaning of signaling NaN bit
Thread-Index: AQHRjElBu+6IZC4KAkGtt5VE/8JBCp94TMAY
Date: Sun, 3 Apr 2016 14:25:50 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859168F4EA@BADAG02.ba.imgtec.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>,
	<56FEC5D1.8020908@imgtec.com>
In-Reply-To: <56FEC5D1.8020908@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"ehabkost@redhat.com" <ehabkost@redhat.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"rth@twiddle.net" <rth@twiddle.net>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>, Petar
	Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, Miodrag
	Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"proljc@gmail.com" <proljc@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5oRzQ0GzO2G7

I truly appreciate your guidance and bringing this matter to my attention.=
=0A=
=0A=
It just seems to me that, in similar case, 16-bit default NaN value should =
be 0x7E00. This value is needed for MSA operations. ("MIPS Architecture for=
 Programmers Volume IV-j: The MIPS32=AE SIMD Architecture Module", Revision=
 1.12, (february 3, 2016), page 52, table 3.7 "Default NaN Encodings")=0A=
=0A=
I plan to include all three corrections in the next version of this patch s=
et. Please, let me know if you think that I should not.=0A=
=0A=
Yours,=0A=
Aleksandar=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From: qemu-devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org [qemu-=
devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org] on behalf of Leo=
n Alrae=0A=
Sent: Friday, April 01, 2016 12:02 PM=0A=
To: Aleksandar Markovic; qemu-devel@nongnu.org=0A=
Cc: peter.maydell@linaro.org; ehabkost@redhat.com; proljc@gmail.com; mark.c=
ave-ayland@ilande.co.uk; agraf@suse.de; kbastian@mail.uni-paderborn.de; Pet=
ar Jovanovic; blauwirbel@gmail.com; jcmvbkbc@gmail.com; Miodrag Dinic; qemu=
-arm@nongnu.org; qemu-ppc@nongnu.org; edgar.iglesias@gmail.com; pbonzini@re=
dhat.com; gxt@mprc.pku.edu.cn; afaerber@suse.de; aurelien@aurel32.net; rth@=
twiddle.net=0A=
Subject: Re: [Qemu-devel] [PATCH 1/2] softfloat: Enable run-time-configurab=
le meaning of signaling NaN bit=0A=
=0A=
On 25/03/16 12:50, Aleksandar Markovic wrote:=0A=
>  /*----------------------------------------------------------------------=
------=0A=
>  | The pattern for a default generated single-precision NaN.=0A=
>  *-----------------------------------------------------------------------=
-----*/=0A=
> +float32 float32_default_nan(float_status *status) {=0A=
>  #if defined(TARGET_SPARC)=0A=
> -const float32 float32_default_nan =3D const_float32(0x7FFFFFFF);=0A=
> +    return const_float32(0x7FFFFFFF);=0A=
>  #elif defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_ALPHA=
) || \=0A=
>        defined(TARGET_XTENSA) || defined(TARGET_S390X) || defined(TARGET_=
TRICORE)=0A=
> -const float32 float32_default_nan =3D const_float32(0x7FC00000);=0A=
> -#elif SNAN_BIT_IS_ONE=0A=
> -const float32 float32_default_nan =3D const_float32(0x7FBFFFFF);=0A=
> +    return const_float32(0x7FC00000);=0A=
>  #else=0A=
> -const float32 float32_default_nan =3D const_float32(0xFFC00000);=0A=
> +    if (status->snan_bit_is_one)=0A=
> +        return const_float32(0x7FBFFFFF);=0A=
> +    else=0A=
> +        return const_float32(0xFFC00000);=0A=
=0A=
Here for MIPS (when FCR31.NAN2008 is set) we should generate 0x7FC00000=0A=
for single-precision. Reference:=0A=
"MIPS Architecture For Programmers, Volume I-A: Introduction to the=0A=
MIPS64 Architecture", Imagination Technologies LTD., Document Number:=0A=
MD00083, Revision 6.01, August 20, 2014, Table 6.3 "Value Supplied When=0A=
a New Quiet NaN Is Created", p. 84=0A=
=0A=
Also, for double-precision we should generate 0x7FF8000000000000.=0A=
=0A=
Thanks,=0A=
Leon=0A=
=0A=

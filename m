Received: by 10.25.208.211 with SMTP id h202csp2806932lfg;
        Wed, 30 Mar 2016 12:28:49 -0700 (PDT)
X-Received: by 10.140.28.135 with SMTP id 7mr12191817qgz.72.1459366129116;
        Wed, 30 Mar 2016 12:28:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si5125388qge.40.2016.03.30.12.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 12:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alLnL-0001mg-IK
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 15:28:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1alLnI-0001mX-Kj
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 15:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1alLnE-0002EI-KE
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 15:28:44 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:40464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1alLnE-0002Dv-Dj; Wed, 30 Mar 2016 15:28:40 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Websense Email Security Gateway with ESMTPS id 42F346F1B06C5;
	Wed, 30 Mar 2016 20:28:34 +0100 (IST)
Received: from BADAG01.ba.imgtec.org (10.20.40.113) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 30 Mar 2016 20:28:37 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG01.ba.imgtec.org ([fe80::8c38:df2b:fd93:33d3%14]) with mapi id
	14.03.0266.001; Wed, 30 Mar 2016 12:28:34 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Richard Henderson <rth@twiddle.net>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 2/2] target-mips: Implement IEEE 754-2008
	functionality for R6 and MSA instructions
Thread-Index: AQHRiTvTzBGilZDISEuL18EoVZP4UJ9yYJJf
Date: Wed, 30 Mar 2016 19:28:33 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859168E22F@BADAG02.ba.imgtec.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>,
	<56F9A6F5.2050504@twiddle.net>
In-Reply-To: <56F9A6F5.2050504@twiddle.net>
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"ehabkost@redhat.com" <ehabkost@redhat.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>, Petar
	Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, Miodrag
	Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, Leon
	Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"proljc@gmail.com" <proljc@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] target-mips: Implement IEEE
 754-2008 functionality for R6 and MSA instructions
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
X-TUID: a1s79Zrt4yfH

I really appreciate your guidance and help. I will respond shortly with a p=
roposal that will address all issues that you brought up. Thanks again for =
your support and time.

Aleksandar
________________________________________
From: qemu-devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org [qemu-=
devel-bounces+aleksandar.markovic=3Dimgtec.com@nongnu.org] on behalf of Ric=
hard Henderson [rth@twiddle.net]
Sent: Monday, March 28, 2016 2:49 PM
To: Aleksandar Markovic; qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org; ehabkost@redhat.com; kbastian@mail.uni-paderb=
orn.de; mark.cave-ayland@ilande.co.uk; agraf@suse.de; Petar Jovanovic; blau=
wirbel@gmail.com; jcmvbkbc@gmail.com; Miodrag Dinic; qemu-arm@nongnu.org; q=
emu-ppc@nongnu.org; edgar.iglesias@gmail.com; pbonzini@redhat.com; gxt@mprc=
.pku.edu.cn; Leon Alrae; afaerber@suse.de; aurelien@aurel32.net; proljc@gma=
il.com
Subject: Re: [Qemu-devel] [PATCH 2/2] target-mips: Implement IEEE 754-2008 =
functionality for R6 and MSA instructions

On 03/25/2016 05:50 AM, Aleksandar Markovic wrote:
> @@ -2621,9 +2621,23 @@ uint64_t helper_float_cvtl_d(CPUMIPSState *env, ui=
nt64_t fdt0)
>       uint64_t dt2;
>
>       dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
> -    if (get_float_exception_flags(&env->active_fpu.fp_status)
> -        & (float_flag_invalid | float_flag_overflow)) {
> -        dt2 =3D FP_TO_INT64_OVERFLOW;
> +    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
> +        if (get_float_exception_flags(&env->active_fpu.fp_status)
> +                & (float_flag_invalid | float_flag_overflow)) {
> +            if (float64_is_any_nan(fdt0)) {
> +                dt2 =3D 0;
> +            } else {
> +                if (float64_is_neg(fdt0))
> +                    dt2 =3D INT64_MIN;
> +                else
> +                    dt2 =3D INT64_MAX;
> +            }
> +        }
> +    } else {
> +        if (get_float_exception_flags(&env->active_fpu.fp_status)
> +                & (float_flag_invalid | float_flag_overflow)) {
> +            dt2 =3D FP_TO_INT64_OVERFLOW;
> +        }

Better to swap the tests here, so that you test the exception flags first (=
and
once).  That is the exceptional condition, the one that will be true least
often.  After that, FCR31_NAN2008 will be tested only when needed.

But also, this pattern is replicated so many times you'd do well to pull th=
is
sequence out to helper functions (one for s, one for d).

> +uint64_t helper_float_abs_d(CPUMIPSState *env, uint64_t fdt0)
> +{
> +    uint64_t fdt1;
> +
> +    if (env->active_fpu.fcr31 & (1 << FCR31_ABS2008)) {
> +        fdt1 =3D float64_abs(fdt0);
> +    } else {
> +        if (float64_is_neg(fdt0)) {
> +            fdt1 =3D float64_sub(0, fdt0, &env->active_fpu.fp_status);
> +        } else {
> +            fdt1 =3D float64_add(0, fdt0, &env->active_fpu.fp_status);
> +        }
> +        update_fcr31(env, GETPC());

Here you're better off using two separate helper functions, and chose the
correct one during translation.  Indeed, since the 2008 version is a simple
bit-flip, you needn't actually have a helper; just expand the sequence inli=
ne.


r~


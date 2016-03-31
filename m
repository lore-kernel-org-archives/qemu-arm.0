Received: by 10.25.208.211 with SMTP id h202csp110891lfg;
        Thu, 31 Mar 2016 04:55:39 -0700 (PDT)
X-Received: by 10.55.203.18 with SMTP id d18mr16056409qkj.25.1459425339639;
        Thu, 31 Mar 2016 04:55:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 110si7456379qgy.36.2016.03.31.04.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 04:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1albCN-0002GC-7p
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 07:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1albCJ-0002G0-8V
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 07:55:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1albCF-0004vR-Fz
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 07:55:35 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:63667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1albCF-0004vD-3w; Thu, 31 Mar 2016 07:55:31 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email Security Gateway with ESMTPS id 84FE0CBC92CD6;
	Thu, 31 Mar 2016 12:55:26 +0100 (IST)
Received: from BADAG01.ba.imgtec.org (10.20.40.113) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Thu, 31 Mar 2016 12:55:28 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG01.ba.imgtec.org ([fe80::8c38:df2b:fd93:33d3%14]) with mapi id
	14.03.0266.001; Thu, 31 Mar 2016 04:55:24 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Richard Henderson <rth@twiddle.net>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 2/2] target-mips: Implement IEEE 754-2008
	functionality for R6 and MSA instructions
Thread-Index: AQHRiTvTzBGilZDISEuL18EoVZP4UJ9zYRp1
Date: Thu, 31 Mar 2016 11:55:23 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859168E429@BADAG02.ba.imgtec.org>
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
X-TUID: BdmkY4S9OX7I

Hi, Richard, what would you think about this approach:

Functionality of <ABS|NEG>.<S|D> and <CVT|FLOOR|CEIL|TRUNC|ROUND>.<L|W>.<S|=
D>
instructions is dependent on flags ABS2008 and NAN2008 in FCR31. There are
MIPS architectures (for example mips32r5) that allow implementations
with different values of these flags. So, in order to detect the desired
behavior in translate-time, insn_flags field can't be used - and, therefore=
,
it makes sense to add two new members to the MIPS's DisasContext:

typedef struct DisasContext {
    . . .
    bool nan2008;
    bool abs2008;
} DisasContext;

Their initialization could be in gen_intermediate_code_internal():

    ctx.nan2008 =3D (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
    ctx.abs2008 =3D (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;

Now, ABS.D (and all <ABS|NEG>.<S|D>) handling might look like this:

    case OPC_ABS_D:
        check_cp1_registers(ctx, fs | fd);
        {
            TCGv_i64 fp0 =3D tcg_temp_new_i64();

            gen_load_fpr64(ctx, fp0, fs);
            if (ctx->abs2008) {
                tcg_gen_andi_i64(fp0, fp0, 0x7fffffffffffffffULL);
            } else {
                gen_helper_float_abs_d(fp0, fp0);
            }
            gen_store_fpr64(ctx, fp0, fd);
            tcg_temp_free_i64(fp0);
        }
        opn =3D "abs.d";
        break;

Here, 2008-style ABS.D is implemented inline, without a helper, and
gen_helper_float_abs_d() is an old pre-2008 helper that would be intact
(the same as it is currently) with this change.

On the other hand, CVT.L.D (and all <CVT|FLOOR|CEIL|TRUNC|ROUND>.<L|W>.<S|D=
>)
handling would take this form:

    case OPC_CVT_L_D:
        check_cp1_64bitmode(ctx);
        {
            TCGv_i64 fp0 =3D tcg_temp_new_i64();

            gen_load_fpr64(ctx, fp0, fs);
            if (ctx->nan2008) {
                gen_helper_float_cvt_2008_l_d(fp0, cpu_env, fp0);
            } else {
                gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
            }
            gen_store_fpr64(ctx, fp0, fd);
            tcg_temp_free_i64(fp0);
        }
        opn =3D "cvt.l.d";
        break;

Function helper_float_cvt_2008_l_d() is a new, only-2008-style helper for
CVT.L.D and would look like this:

uint64_t helper_float_cvt_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
{
    uint64_t dt2;

    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
    if (get_float_exception_flags(&env->active_fpu.fp_status)
            & (float_flag_invalid | float_flag_overflow)) {
        dt2 =3D DBL_TO_INT64_OVERFLOW(fdt0)
    }
    update_fcr31(env, GETPC());
    return dt2;
}

(macro DBL_TO_INT64_OVERFLOW(x) would be defined this way:

#define DBL_TO_INT64_OVERFLOW(x)                                           =
  \
    float64_is_any_nan(x) ? 0 : (float64_is_neg(x) ? INT64_MIN : INT64_MAX)=
;

to avoid awkward repeating "if" statements in multiple headers)

gen_helper_float_cvt_l_d() and all old style helpers for instructions
<CVT|FLOOR|CEIL|TRUNC|ROUND>.<L|W>.<S|D> would remain the same.

Please let me know about your opinion. I greatly appreciate your kind
consideration of this matter. I am looking forward to hearing from you.

Yours,
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

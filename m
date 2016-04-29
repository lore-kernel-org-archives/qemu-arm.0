Received: by 10.25.208.137 with SMTP id h131csp925357lfg;
        Fri, 29 Apr 2016 08:25:03 -0700 (PDT)
X-Received: by 10.55.22.162 with SMTP id 34mr4359584qkw.147.1461943502932;
        Fri, 29 Apr 2016 08:25:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j124si7712691qkf.34.2016.04.29.08.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Apr 2016 08:25:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1awAHe-0006h7-9j
	for alex.bennee@linaro.org; Fri, 29 Apr 2016 11:24:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1awAHW-0006SR-5U
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 11:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1awAHK-0002cN-HJ
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 11:24:32 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:34115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1awAHK-0002Xd-B6; Fri, 29 Apr 2016 11:24:26 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id EC48EAA2A2676;
	Fri, 29 Apr 2016 16:23:58 +0100 (IST)
Received: from [192.168.161.74] (192.168.161.74) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 29 Apr 2016 16:24:02 +0100
Message-ID: <57237C84.8040907@imgtec.com>
Date: Fri, 29 Apr 2016 16:23:48 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-8-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-8-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.161.74]
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SjrOcqqw3fmc

On 18/04/16 17:03, Aleksandar Markovic wrote:
> @@ -3049,6 +3050,330 @@ uint32_t helper_float_floorw_s(CPUMIPSState *env, uint32_t fst0)
>      return wt2;
>  }
>  
> +uint64_t helper_float_cvt_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
> +{
> +    uint64_t dt2;
> +
> +    dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
> +    if (get_float_exception_flags(&env->active_fpu.fp_status)
> +            & (float_flag_invalid) {

unnecessary parentheses

> @@ -8919,7 +8920,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
>              TCGv_i64 fp64 = tcg_temp_new_i64();
>  
>              gen_load_fpr32(ctx, fp32, fs);
> -            gen_helper_float_roundl_s(fp64, cpu_env, fp32);
> +            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {

Why testing the version of the architecture? This will generate wrong
helper for P5600 which is R5 and IEEE 754-2008 compliant.

Leon

> +                gen_helper_float_round_2008_l_s(fp64, cpu_env, fp32);
> +            } else {
> +                gen_helper_float_round_l_s(fp64, cpu_env, fp32);
> +            }
>              tcg_temp_free_i32(fp32);
>              gen_store_fpr64(ctx, fp64, fd);
>              tcg_temp_free_i64(fp64);

Received: by 10.25.208.137 with SMTP id h131csp875090lfg;
        Fri, 29 Apr 2016 06:51:07 -0700 (PDT)
X-Received: by 10.55.42.145 with SMTP id q17mr20340336qkq.159.1461937867361;
        Fri, 29 Apr 2016 06:51:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si7456395qkh.211.2016.04.29.06.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Apr 2016 06:51:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aw8ok-0000Np-SB
	for alex.bennee@linaro.org; Fri, 29 Apr 2016 09:50:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aw8oa-0000AF-Sg
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 09:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aw8oO-0000d1-Qf
	for qemu-arm@nongnu.org; Fri, 29 Apr 2016 09:50:35 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:59887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aw8oO-0000Si-Kz; Fri, 29 Apr 2016 09:50:28 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 5F32D2FF63F05;
	Fri, 29 Apr 2016 14:49:56 +0100 (IST)
Received: from [192.168.161.74] (192.168.161.74) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 29 Apr 2016 14:49:59 +0100
Message-ID: <5723666E.10107@imgtec.com>
Date: Fri, 29 Apr 2016 14:49:34 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460995422-14373-2-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.161.74]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 1/9] softfloat: Implement
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
X-TUID: If3VjXp09Nbo

On 18/04/16 17:03, Aleksandar Markovic wrote:
> -#if SNAN_BIT_IS_ONE
> -    return ((uint32_t)(a << 1) >= 0xff800000);
> -#else
> -    return ( ( ( a>>22 ) & 0x1FF ) == 0x1FE ) && ( a & 0x003FFFFF );
> -#endif
> +    if (status->snan_bit_is_one) {
> +        return ((uint32_t)(a << 1) >= 0xFF800000);
> +    } else {
> +        return (((a >> 22) & 0x1FF) == 0x1FE) && (a & 0x003FFFFF);

Thanks for fixing the style of lines you modified, ...

> -    z.sign = float32_val(a)>>31;
> +    z.sign = float32_val(a) >> 31;
>      z.low = 0;
> -    z.high = ( (uint64_t) float32_val(a) )<<41;
> +    z.high = ((uint64_t)float32_val(a)) << 41;

... here however I think we usually don't correct the style if the line
wouldn't be touched otherwise. But obviously this is up to FPU Maintainers.

> @@ -2940,7 +2952,8 @@ void helper_msa_fclass_df(CPUMIPSState *env, uint32_t df,
>          c = update_msacsr(env, CLEAR_FS_UNDERFLOW, 0);                      \
>                                                                              \
>          if (get_enabled_exceptions(env, c)) {                               \
> -            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
> +            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \

You can use the existing local pointer "status". Similarly in other MSA
macros.

> +                       >> 6) << 6) | c;                                     \


> @@ -4670,7 +4670,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                          TCGv r_const;
>  
>                          gen_address_mask(dc, cpu_addr);
> -                        tcg_gen_qemu_ld8u(cpu_val, cpu_addr, dc->mem_idx);
> +                        tcg_gen_qemu_ld8s(cpu_val, cpu_addr, dc->mem_idx);

This change appeared here by mistake, isn't it?

Thanks,
Leon

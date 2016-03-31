Received: by 10.25.208.211 with SMTP id h202csp254760lfg;
        Thu, 31 Mar 2016 09:30:54 -0700 (PDT)
X-Received: by 10.140.177.87 with SMTP id x84mr18598015qhx.39.1459441854239;
        Thu, 31 Mar 2016 09:30:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x139si1624679qhx.129.2016.03.31.09.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 09:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alfUj-0004zC-KB
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 12:30:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1alfUc-0004ww-Ab
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 12:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1alfUY-0006Yw-75
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 12:30:46 -0400
Received: from mail-qg0-x242.google.com ([2607:f8b0:400d:c04::242]:33660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1alfUR-0006Xh-CF; Thu, 31 Mar 2016 12:30:35 -0400
Received: by mail-qg0-x242.google.com with SMTP id y89so8205755qge.0;
	Thu, 31 Mar 2016 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=rcRaGYsUtHKs2YsWuhfGKXk0I+eR22RUPIuL4vX5DTY=;
	b=cgzPbDEjmP5sf+weAfqjDd0Ov4sRDkOtF5zqu9OcoDO5piqfnMykva2kaSPh4AKJOl
	ymc9xLXRlw5j+qdEgzL/rpmqS97jiUoNZzvU1h9NZciStUhIg81N6nyt6EmM4/9Si7VP
	9Ia+T6p/8/OvmGSeOMNJuqZO2lLgfbDyh2SGUo0IpbgEgmpTfpIP/PctMMyJOdExb+JJ
	Pg08ZCvwjrXQST99DfcW8PsfBMhGARDnIiwGhvd6LWNnMeiZ2Yf6xeDE4t3mcCBC6PPp
	CzBWk1dJVO2lRrIHwAIYwQKxsp/vLjvA4849/WzpZZj2ALD9zjNhpvVAtCdH/C8xFgTk
	7zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=rcRaGYsUtHKs2YsWuhfGKXk0I+eR22RUPIuL4vX5DTY=;
	b=F8BBW6+fC47Fcu6aZixZT6LNvkIAiy89JqfH6ySR2ICT0pnLboRpLXs9yF5a6TFib2
	Kh27LhLoa8Pzulz102WyvyTfzqHAl60OE7Tdj8YY6CMTO1TY6idqBPOdoYmRVQbw5jk5
	gdHywJ84vRZ+Wbw+rdFONcZ1s3VQxm5C57dqMRbhj7CnSkvFNRKLMO/O+nqSmvc7osRz
	ch+Acv79FKT5z8uvw2wRa08nLDYXGa8LTgU5qVMqIjIyYcdAI/jUuCHtU3WkiRN9LaHU
	NcLEYCEJGMikCyCy9FJ5EpLe5FPoQC1k1Rm9b1GpOsr9LuHIQBh51oqMgN2HI2bjGj3R
	iqkA==
X-Gm-Message-State: AD7BkJIUughFq4HB2Z4xs8Q7ZuS1SHjOTl4oG7r68hCC3u7W/ARNlStsxkIkO7jUI6oAIg==
X-Received: by 10.140.141.6 with SMTP id 6mr18518583qhn.82.1459441834726;
	Thu, 31 Mar 2016 09:30:34 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	l33sm4241436qge.11.2016.03.31.09.30.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2016 09:30:33 -0700 (PDT)
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>
	<56F9A6F5.2050504@twiddle.net>
	<EF5FA6C3467F85449672C3E735957B859168E429@BADAG02.ba.imgtec.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56FD50A6.6060303@twiddle.net>
Date: Thu, 31 Mar 2016 09:30:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <EF5FA6C3467F85449672C3E735957B859168E429@BADAG02.ba.imgtec.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::242
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"ehabkost@redhat.com" <ehabkost@redhat.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
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
X-TUID: WMjrdnGPUXL5

On 03/31/2016 04:55 AM, Aleksandar Markovic wrote:
> Hi, Richard, what would you think about this approach:
> 
> Functionality of <ABS|NEG>.<S|D> and <CVT|FLOOR|CEIL|TRUNC|ROUND>.<L|W>.<S|D>
> instructions is dependent on flags ABS2008 and NAN2008 in FCR31. There are
> MIPS architectures (for example mips32r5) that allow implementations
> with different values of these flags. So, in order to detect the desired
> behavior in translate-time, insn_flags field can't be used - and, therefore,
> it makes sense to add two new members to the MIPS's DisasContext:
> 
> typedef struct DisasContext {
>     . . .
>     bool nan2008;
>     bool abs2008;
> } DisasContext;
> 
> Their initialization could be in gen_intermediate_code_internal():
> 
>     ctx.nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
>     ctx.abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
> 
> Now, ABS.D (and all <ABS|NEG>.<S|D>) handling might look like this:
> 
>     case OPC_ABS_D:
>         check_cp1_registers(ctx, fs | fd);
>         {
>             TCGv_i64 fp0 = tcg_temp_new_i64();
> 
>             gen_load_fpr64(ctx, fp0, fs);
>             if (ctx->abs2008) {
>                 tcg_gen_andi_i64(fp0, fp0, 0x7fffffffffffffffULL);
>             } else {
>                 gen_helper_float_abs_d(fp0, fp0);
>             }
>             gen_store_fpr64(ctx, fp0, fd);
>             tcg_temp_free_i64(fp0);
>         }
>         opn = "abs.d";
>         break;
> 
> Here, 2008-style ABS.D is implemented inline, without a helper, and
> gen_helper_float_abs_d() is an old pre-2008 helper that would be intact
> (the same as it is currently) with this change.

Yes, that's exactly what I had in mind.

> On the other hand, CVT.L.D (and all <CVT|FLOOR|CEIL|TRUNC|ROUND>.<L|W>.<S|D>)
> handling would take this form:
> 
>     case OPC_CVT_L_D:
>         check_cp1_64bitmode(ctx);
>         {
>             TCGv_i64 fp0 = tcg_temp_new_i64();
> 
>             gen_load_fpr64(ctx, fp0, fs);
>             if (ctx->nan2008) {
>                 gen_helper_float_cvt_2008_l_d(fp0, cpu_env, fp0);
>             } else {
>                 gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
>             }
>             gen_store_fpr64(ctx, fp0, fd);
>             tcg_temp_free_i64(fp0);
>         }
>         opn = "cvt.l.d";
>         break;
> 
> Function helper_float_cvt_2008_l_d() is a new, only-2008-style helper for
> CVT.L.D and would look like this:
> 
> uint64_t helper_float_cvt_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
> {
>     uint64_t dt2;
> 
>     dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
>     if (get_float_exception_flags(&env->active_fpu.fp_status)
>             & (float_flag_invalid | float_flag_overflow)) {
>         dt2 = DBL_TO_INT64_OVERFLOW(fdt0)
>     }
>     update_fcr31(env, GETPC());
>     return dt2;
> }

That looks fine as well.



r~

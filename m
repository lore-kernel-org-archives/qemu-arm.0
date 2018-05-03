Received: by 10.28.4.212 with SMTP id 203csp1937764wme;
        Thu, 3 May 2018 07:00:32 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrAeTvTmo5vh/uLvpL9j4xTcGaYBHJaazEj9ZJNAEUuMSOtCyoplMFQylEA6HdInLyXPNX6
X-Received: by 2002:aed:24c2:: with SMTP id u2-v6mr19110020qtc.235.1525356032257;
        Thu, 03 May 2018 07:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525356032; cv=none;
        d=google.com; s=arc-20160816;
        b=TrhfpNZDxeHQ/v+s9kAzk85rNZUoDXxNfE+Kb+5Jxf1Dy/bD9eY53/ar59X8iPrsg5
         B7yuCeSM+pY2pYdiR8No6GT26Ky2amK2Mix+F0mj4DTosqnBnd3zkDDCRm+vbFG+wiy/
         oeApBAP4W0fZozjfKXfK7692ay6qVt1WznuPpnwjcm2PPcGRvuxBQlPbcKCyOzgCJcR5
         Hx1uw+sLo2F717e3AAmRFh9CW+wfFQXpO2G8Yyi2zlTsDb2Poa0+NBh8p9DIyePLQkqW
         BjlJjBOeyQkRELL7moYIU6yKU1XGRM8xnQdAeAp/bOuNMTyAwsxcvwdHhy5WaxMzUfJ1
         072A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=k9zyRvGFVfdccVyviFOQwVagB8Xrhbr2xpwtHMGFsMU=;
        b=ri1N1srVD47Mpb0COB3Udgpbcc5mFfQYKv+IBCWTmE/4Ar9pyHIt5szAvF1SYC+7l7
         BIS2NWHzpCu9PoPw4rbtaJeURZdR0nGRrz/rdtngwJATky1RFldxIiSC7aEe8bJFQV3O
         W4hzkB1WRJ/dPsNIkWT94pAUZj5ZwWbBWwcRPFkBOq+pZqJQbrPlTvRUs9JAensJLuBp
         78cWAGp2K64zJqIcdp4/SG1MMGXxiTFUz7Sr4J6h2YKEAOsstR90pXxFpbvUk43+FFrK
         z7zyowgX5yNyuwJLKpccTM9fF1GT/SHql/IocSOQUwhXbnvet69VzDX8yh689sooT/aS
         1Exw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSIccNZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z48-v6si6013089qvg.97.2018.05.03.07.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 07:00:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSIccNZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEEmd-0002R5-N0
	for alex.bennee@linaro.org; Thu, 03 May 2018 10:00:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEEmO-0002LE-6v
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEEmJ-0007UM-V3
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:00:16 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEEmJ-0007T2-Nn
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:00:11 -0400
Received: by mail-ot0-x241.google.com with SMTP id l13-v6so20715202otk.9
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k9zyRvGFVfdccVyviFOQwVagB8Xrhbr2xpwtHMGFsMU=;
	b=SSIccNZUOYGC1Y4yQt1kixHr16Betp+tofZMUf4t7XG2axt3Tv4+K0kqPM+/ufZ5ZW
	miA7quKd0xX5pOo5ocUa8Ek7LlppSvNoFjFTiA+Juw8ocUV3MefGhJVmD0d25txw0KD7
	Wx71MSN4CYL23AUmw8yQFVNxW1Qujjptt8C4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k9zyRvGFVfdccVyviFOQwVagB8Xrhbr2xpwtHMGFsMU=;
	b=rJhSHjt0aqYeIAM83bXr/GzSoVUT9FOliINcXIzyulWGC+WFdEBMIfzclbVpMEtuHo
	zwcKD0aQnWMisAOm2ZksrCHtrU4bhDyZdKfE7Mfgv8Au8c80hjUPTHIc1AjmAhO0P0Xo
	TWgeBVcigvrhlAp39CjbF9CNVmDicP19IoTjGRoKzOw/dua9x0HEPooZnj9d912U4vhB
	ig6+f4hyawkGSFLUINw0Yinx8Ar6h1+fORzRQw9mnQKUJqc3ke7FTzOHmU3tgQJnNmmw
	hwhTy7NVXUhTYqZqp7pA/mdn0vYmD0VF+OWdIO7K9K81amDw4xLlg6D+j7aYlutL6LPK
	2kfw==
X-Gm-Message-State: ALQs6tDn2vVfR88MTm7iShmyqLdK1LDan8HzaSICIoggn7P9i6FWui4w
	aNGu0WPsnD1uiZljCqMvieBzgcZO/wWbG15kVHHzbg==
X-Received: by 2002:a9d:2013:: with SMTP id
	n19-v6mr15772957ota.258.1525356010489; 
	Thu, 03 May 2018 07:00:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 06:59:49 -0700 (PDT)
In-Reply-To: <20180427002651.28356-7-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 14:59:49 +0100
Message-ID: <CAFEAcA_trFkyHOofragLEKpsNP67t4-3ZbSyCAgU2nYG75Zg5A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/9] target/arm: Introduce
 ARM_FEATURE_V8_ATOMICS and initial decode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dtY6xmhRZz/B

On 27 April 2018 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The insns in the ARMv8.1-Atomics are added to the existing
> load/store exclusive and load/store reg opcode spaces.
> Rearrange the top-level decoders for these to accomodate.
> The Atomics insns themselves still generate Unallocated.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> +    case 0x4: /* LDXR */
> +    case 0x5: /* LDAXR */
> +        if (rn == 31) {
> +            gen_check_sp_alignment(s);
>          }
> -    } else {
> -        TCGv_i64 tcg_rt = cpu_reg(s, rt);
> -        bool iss_sf = disas_ldst_compute_iss_sf(size, false, 0);
> +        tcg_addr = read_cpu_reg_sp(s, rn, 1);
> +        s->is_ldex = true;
> +        gen_load_exclusive(s, rt, rt2, tcg_addr, size, false);
> +        if (is_lasr) {
> +            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> +        }
> +        return;
>
> +    case 0x9: /* STLR */
>          /* Generate ISS for non-exclusive accesses including LASR.  */
> -        if (is_store) {
> +        if (rn == 31) {
> +            gen_check_sp_alignment(s);
> +        }
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +        tcg_addr = read_cpu_reg_sp(s, rn, 1);
> +        do_gpr_st(s, cpu_reg(s, rt), tcg_addr, size, true, rt,
> +                  disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
> +        return;
> +
> +    case 0xd: /* LDARB */

should be /* LDAR */ to match lack of size suffixes on other
comments in the switch ?

> +        /* Generate ISS for non-exclusive accesses including LASR.  */
> +        if (rn == 31) {
> +            gen_check_sp_alignment(s);
> +        }
> +        tcg_addr = read_cpu_reg_sp(s, rn, 1);
> +        do_gpr_ld(s, cpu_reg(s, rt), tcg_addr, size, false, false, true, rt,
> +                  disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> +        return;
> +
> +    case 0x2: case 0x3: /* CASP / STXP */
> +        if (size & 2) { /* STXP / STLXP */
> +            if (rn == 31) {
> +                gen_check_sp_alignment(s);
> +            }
>              if (is_lasr) {
>                  tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>              }
> -            do_gpr_st(s, tcg_rt, tcg_addr, size,
> -                      true, rt, iss_sf, is_lasr);
> -        } else {
> -            do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false,
> -                      true, rt, iss_sf, is_lasr);
> +            tcg_addr = read_cpu_reg_sp(s, rn, 1);
> +            gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, true);
> +            return;
> +        }
> +        /* CASP / CASPL */
> +        break;
> +
> +    case 0x6: case 0x7: /* CASP / LDXP */
> +        if (size & 2) { /* LDXP / LDAXP */
> +            if (rn == 31) {
> +                gen_check_sp_alignment(s);
> +            }
> +            tcg_addr = read_cpu_reg_sp(s, rn, 1);
> +            s->is_ldex = true;
> +            gen_load_exclusive(s, rt, rt2, tcg_addr, size, true);
>              if (is_lasr) {
>                  tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
>              }
> +            return;
>          }
> +        /* CASPA / CASPAL */
> +        break;
> +
> +    case 0xa: /* CAS */
> +    case 0xb: /* CASL */
> +    case 0xe: /* CASA */
> +    case 0xf: /* CASAL */
> +        break;
>      }
> +    unallocated_encoding(s);
>  }
>
>  /*
> @@ -2715,6 +2751,55 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
>      }
>  }
>
> +/* Atomic memory operations
> + *
> + *  31  30      27  26    24    22  21   16   15    12    10    5     0
> + * +------+-------+---+-----+-----+---+----+----+-----+-----+----+-----+
> + * | size | 1 1 1 | V | 0 0 | A R | 1 | Rs | o3 | opc | 0 0 | Rn |  Rt |
> + * +------+-------+---+-----+-----+--------+----+-----+-----+----+-----+
> + *
> + * Rt: the result register
> + * Rn: base address or SP
> + * Rs: the source register for the operation
> + * V: vector flag (always 0 as of v8.3)
> + * A: acquire flag
> + * R: release flag
> + */
> +static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
> +                              int size, int rt, bool is_vector)
> +{
> +    int rs = extract32(insn, 16, 5);
> +    int rn = extract32(insn, 5, 5);
> +    int o3_opc = extract32(insn, 12, 4);
> +    int feature = ARM_FEATURE_V8_ATOMICS;
> +
> +    if (is_vector) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +    switch (o3_opc) {
> +    case 000: /* LDADD */
> +    case 001: /* LDCLR */
> +    case 002: /* LDEOR */
> +    case 003: /* LDSET */
> +    case 004: /* LDSMAX */
> +    case 005: /* LDSMIN */
> +    case 006: /* LDUMAX */
> +    case 007: /* LDUMIN */
> +    case 010: /* SWP */

I can see why you've used octal constants here, but I think they're
probably going to be more confusing than helpful since they're
so rare in our codebase.

What about LDAPRB, LDAPRH, LDAPR (which are o3_opc == 0b1100) ?

> +    default:
> +        unallocated_encoding(s);
> +        return;
> +    }
> +    if (!arm_dc_feature(s, feature)) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    (void)rs;
> +    (void)rn;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

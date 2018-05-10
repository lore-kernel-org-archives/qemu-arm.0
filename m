Received: by 10.28.4.212 with SMTP id 203csp1218397wme;
        Thu, 10 May 2018 09:22:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZphLGt3u4c2Pu/d8yJBAFO4io8YStDlhlRP7sw7XYo80rPmvhDOgBByUz+wLaXUiGKCYkfC
X-Received: by 2002:a37:1f06:: with SMTP id f6-v6mr1805271qkf.147.1525969357874;
        Thu, 10 May 2018 09:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525969357; cv=none;
        d=google.com; s=arc-20160816;
        b=h91snEFGrfwVmqClIvlrXceglw4cV/jdC/Jb5bujVzPxp0sNKhZBuXn52UeR3qotf+
         1MeJxlFFBD34yw1gtaTzRvxfrgGsCb6h+xs1A1znpSOMLVcptWvm+a9VO2yp44PQuxo0
         3nn+zg9E+NmgPl/anPaye4k+KEbM+F+0zOJGKH30FpByU/xxxiYk1B5kT2kxvgx3tEmy
         L2nalht2i/zlBDHecGfF4lBwFS6wO5/S0IDWi+mNGDWXFEAFS3836I5NVlQa2+LP2ne/
         lE9uDGHkWtvanRUuPEuqXW2qf9hucZcqu0IpdFSXJ8kGkhDiG87rs0wUY3HVTJBVCMBR
         hrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RkKsaBWlmAL0sIlVjsFlmH6LLJnjeVRpNvPsx9Hy/L8=;
        b=aXayFXoRpWxvfyvK8nYxomj6LeLCLLHwnOZ9LW224vwk3nYTn+BLS7KfKgT5ipRYKR
         2MnLCF6TwOu0HwiF+4/8TNJN3eTTq6BnDGOKq8jbGJw3q61rHG6FjYErC3Wg9Bonm+id
         U8DipNC67G0D/pwLSQck6MfX5w7EX7N7wJ12GLGio7cQQ7Kjk5AL/DgnsLGQxOPdiwHL
         epo1RcgX2HnCaE4V7psaygnFU0B+XtITKG7NI9GQkzpm09r//Idh2AkfAD1QNRZQJH+s
         jfLZC2uPZWfUnCOPJhSyjwH2s2eKDMRLxOomfn/IzqgKKJbFfvllZuYZ1zGD3I0tmVoi
         0scA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DK51GyTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h3-v6si1022041qke.361.2018.05.10.09.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 09:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DK51GyTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGoKz-00076R-CD
	for alex.bennee@linaro.org; Thu, 10 May 2018 12:22:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGoKi-00074y-8K
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGoKh-0006qM-DH
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:22:20 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fGoKh-0006p1-8s
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:22:19 -0400
Received: by mail-oi0-x241.google.com with SMTP id t27-v6so2256864oij.9
	for <qemu-arm@nongnu.org>; Thu, 10 May 2018 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RkKsaBWlmAL0sIlVjsFlmH6LLJnjeVRpNvPsx9Hy/L8=;
	b=DK51GyTDR3nUqm/UpPDIiN1qLvGnKlX+WIllCEyUu0TExDtORMSXlbe4kHg1HNM0Da
	TevBtUmPmoi3Q0A2s6e/87GcMuCy6B2uMi3CaeHKtOzZXkrMf+XDhTKINXEPdlvS51Zy
	ab/T5npx82LQbIDAu/dxWwBo73fY2avNf+Sc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RkKsaBWlmAL0sIlVjsFlmH6LLJnjeVRpNvPsx9Hy/L8=;
	b=d6cmCeimcXy/9mZAyJp9Gl9qoIH43PBY0o5JAEaDOq0sAW93lcL0d6YmPEBFdFdxhp
	dascgWvvt1naELEd53/DQZfaRoELtg29yfP08LS/WRfisFZuzZC0JnXb/lxjt2lHDq9/
	BvIVtIgyEeScOr+KKIlq3VF28hVX7Z2YXsCIl/1fpVTay4ZBwW5vyqIadgXnPHFbTzjR
	ESYS6ExzS2HFLI8MDtVVZbiGH1JAge00TMfCKgh347LlQ06VujtJrtA8P0Oh3EPjHH+Q
	bgeMHk9GxE/8g+ozG209v+Hz5rrFof7AhyEdw4do1iu3WvtKcxANLKKy7Cd+iZ6jgOg1
	gFsg==
X-Gm-Message-State: ALKqPwfpdDkPAjS5oF8iaaNdWI6eXYxRTbyoPM9B0fU02WXbZgnj4u6z
	4YIAA3HhZsy5v99hyT9MTahSE1NsGo7x+2O2e1K9tQ==
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr1257647oig.102.1525969338529; 
	Thu, 10 May 2018 09:22:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 09:21:58
	-0700 (PDT)
In-Reply-To: <20180502221552.3873-6-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
	<20180502221552.3873-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 17:21:58 +0100
Message-ID: <CAFEAcA-HtS=Pm=L_zEsBqqFfCorQOuXpjNWxO9bBb+dkt7ihqg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 05/14] target/arm: Implement FMOV
 (general) for fp16
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3hTym1pWLXC

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wrote:
> Adding the fp16 moves to/from general registers.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c64c3ed99d..247a4f0cce 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -5463,6 +5463,15 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
>              tcg_gen_st_i64(tcg_rn, cpu_env, fp_reg_hi_offset(s, rd));
>              clear_vec_high(s, true, rd);
>              break;
> +        case 3:
> +            /* 16 bit */
> +            tmp = tcg_temp_new_i64();
> +            tcg_gen_ext16u_i64(tmp, tcg_rn);
> +            write_fp_dreg(s, rd, tmp);
> +            tcg_temp_free_i64(tmp);
> +            break;
> +        default:
> +            g_assert_not_reached();
>          }
>      } else {
>          TCGv_i64 tcg_rd = cpu_reg(s, rd);
> @@ -5480,6 +5489,12 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
>              /* 64 bits from top half */
>              tcg_gen_ld_i64(tcg_rd, cpu_env, fp_reg_hi_offset(s, rn));
>              break;
> +        case 3:
> +            /* 16 bit */
> +            tcg_gen_ld16u_i64(tcg_rd, cpu_env, fp_reg_offset(s, rn, MO_16));
> +            break;
> +        default:
> +            g_assert_not_reached();
>          }
>      }
>  }
> @@ -5519,10 +5534,15 @@ static void disas_fp_int_conv(DisasContext *s, uint32_t insn)
>          case 0xa: /* 64 bit */
>          case 0xd: /* 64 bit to top half of quad */
>              break;
> +        case 0x6: /* 16-bit */
> +            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
> +                break;
> +            }
> +            /* fallthru */

This is a switch on (sf << 3 | type << 1 | rmode), so this catches
the halfprec <-> 32 bit cases, but it misses the halfprec <-> 64 bit
ops, which have sf == 1. So I think you need a 'case 0xe' as well.

>          default:
>              /* all other sf/type/rmode combinations are invalid */
>              unallocated_encoding(s);
> -            break;
> +            return;

This is a distinct bugfix, I think (though the only effect would
be generation of unnecessary dead code after the undef).

>          }
>
>          if (!fp_access_check(s)) {
> --
> 2.14.3

thanks
-- PMM

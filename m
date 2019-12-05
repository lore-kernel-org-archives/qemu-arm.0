Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2351058lff;
        Thu, 5 Dec 2019 09:22:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQRyj9YQvEZSvHW0OMnyHTRC8NW0Uuu0kpFvW7h98e6SdX+yv3I+WTbFa9EcJsv8/b42nM
X-Received: by 2002:a05:6830:1c81:: with SMTP id v1mr7703444otf.83.1575566533107;
        Thu, 05 Dec 2019 09:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575566533; cv=none;
        d=google.com; s=arc-20160816;
        b=SZI0qGIzLIqzxXe6W5TNwFJG6eM1pN/UgGzAOybXxgYGCk3KGDHWIrlFgMPAM4J7Fo
         piyWoJGdOYp2H61PhUFuFQl7FIIUrUdjrTwqIqYvNMLnXOxgY88HLaddmQfHOJtl2yyK
         P8NG4wDVk0kavUZsgFrJLR257OSv5DbdYDcbiwlEbBoQ5fLQAccjvunLoe6AkXkWwsEg
         S23OHZyaAwKmjTcsm6vUh7KkwAlbObGpmKBxv/kDiLtBzMfM+FhtTFgOwnAPPfxPsZ2P
         YiCDK+Ik04KMoJOh6dIfEePmCftzSjB2oemllyhtc9x/J/Wudz/fVTVvhSwTb6gJsYtp
         32/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oR1ydjx5BXUU7AR1HyJMQzYmJztax2heM3c2x5vgaww=;
        b=qqWA5R9QQcYJ/LI+K0ucxyGnGE4I6vZygyiWP6v3DVlQ2lo/+kjhOLgpAyPTN/QnxC
         hyvfne4jH5vkQ40cgzuqh1HI20dTld8dVUt+1egi0rzHy9cS8sUM9CUgCGqnqsmqaixT
         tu0+d5pbO2iP/3eTc/9WgKhJZKmxdVnUZUgJ6i0MSateeZtRoJZ25Y+KscW14Ish0Ivu
         R/GwrBbtWOxOe+1iKhcMCTLaQWzQnsuV69j2w/xR/LbRBwKrFoN8RJmQ9qPmBva/Ottu
         X4IU60/6IDliLIs1bQWZhWphdb8ZDa43rXTR1Id4/7zEuzPHfBRZdaprI5Fky3iBFR4s
         6meg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UkYx/TLR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si5380199oto.36.2019.12.05.09.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 09:22:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UkYx/TLR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icupQ-0003NF-1O
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 12:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icujZ-0006gK-6d
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:16:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icujX-0002DD-PK
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:16:08 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:32924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icujX-00028f-Db
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:16:07 -0500
Received: by mail-oi1-x242.google.com with SMTP id v140so3476850oie.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 09:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oR1ydjx5BXUU7AR1HyJMQzYmJztax2heM3c2x5vgaww=;
 b=UkYx/TLRcr9fFREWaRf1PE35hgBubIZ/mtpRBoQxNXQ27b1ry3OaekuUg+GDUgQphg
 j/coNEFyyg8cgbTwDSBh+eeMWEG/dAyZg6tywR0204EAAloUAaQ2U66V2RKzzrlmgDee
 clAWTPZRq/SvYGfvWoWfMPpA24FtCPuPPCBHgL8XeFIzgWJx8Ap8KgtXRMm23x4aV72u
 A2dpS0SWFbRIIwEbGcue0359J8maiYZGG46dH5bm/2ERfhX391UHO+C50b2en7PBq2O+
 1bxqrFfhmP39Rd7ZePjdk9QNrw0zojdauVbc7rFTb4JvPcptjCbz2rJAHBVPMWsJwmqT
 SlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oR1ydjx5BXUU7AR1HyJMQzYmJztax2heM3c2x5vgaww=;
 b=H7x/Q8/Xi1O0qokI5xs20Ffpk0/88Mm/+foeLo3A4aYZeHcm7SYZvOQkK7l5X50iuU
 yk2FsXjVJGbGtqc1ifXgt3wWCcaOObdqqL40oAPQsa6LaniUeml4jFzxhJ11SnGLUP8d
 xsQjXfesGww/T+qfJY5IvldXws9IEHDfYsBBOBOnDhKSiYys6oY6pWscIvGnz1zygNvv
 y7XEHaYEDsUN9OjmamPpHwFpw0KdfMp9dtFkY4GBzbGZ+ab7cwNOcgj1M7+ETKa5SyKe
 myBf/H/VpT6W7qokc7q3vQ6kPac6q2uyO+ecQ6YvO2ik+jb1e5UfzXqrKEyH6cPCewsq
 WJNw==
X-Gm-Message-State: APjAAAXIReQWtx9M25tpDZFp1gWZeZbIjczHfJS/1Vhe5mXyHz8HJ3y4
 MaEfMbln5LQYpHLy4I/SsTvmw01PK7kkC+JXa0mh3A==
X-Received: by 2002:aca:3182:: with SMTP id x124mr8320862oix.170.1575566166437; 
 Thu, 05 Dec 2019 09:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-13-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 17:15:55 +0000
Message-ID: <CAFEAcA88=mVYgG_Pu7HJOToCpNz9GYDRW2iG3tx0QYO7C-gFeQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/22] target/arm: Implement the STGP instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1f5ukAg8HwEb

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Handle atomicity, require pre-cleaned address.
> ---
>  target/arm/translate-a64.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c17b36ebb2..4ecb0a2fb7 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2657,7 +2657,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
>   * +-----+-------+---+---+-------+---+-------+-------+------+------+
>   *
>   * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
> - *      LDPSW                    01
> + *      LDPSW/STGP               01
>   *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
>   *   V: 0 -> GPR, 1 -> Vector
>   * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
> @@ -2682,6 +2682,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
>      bool is_signed = false;
>      bool postindex = false;
>      bool wback = false;
> +    bool set_tag = false;
>
>      TCGv_i64 clean_addr, dirty_addr;
>
> @@ -2694,6 +2695,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
>
>      if (is_vector) {
>          size = 2 + opc;
> +    } else if (opc == 1 && !is_load) {
> +        /* STGP */
> +        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
> +            unallocated_encoding(s);
> +            return;
> +        }
> +        size = 3;
> +        set_tag = true;
>      } else {
>          size = 2 + extract32(opc, 1, 1);
>          is_signed = extract32(opc, 0, 1);
> @@ -2746,6 +2755,15 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
>      }
>      clean_addr = clean_data_tbi(s, dirty_addr, wback || rn != 31);

Don't we need to adjust the 'check' argument to clean_data_tbi()
here? The pseudocode says STGP doesn't do tag-checking.

>
> +    if (set_tag) {
> +        TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
> +        if (tb_cflags(s->base.tb) & CF_PARALLEL) {
> +            gen_helper_stg_parallel(cpu_env, clean_addr, tcg_rn);
> +        } else {
> +            gen_helper_stg(cpu_env, clean_addr, tcg_rn);
> +        }
> +    }
> +
>      if (is_vector) {
>          if (is_load) {
>              do_fp_ld(s, rt, clean_addr, size);
> --
> 2.17.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

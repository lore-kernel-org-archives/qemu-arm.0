Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1564935ejb;
        Fri, 2 Jun 2023 20:36:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6iCmECImZ61x0pP//nEBJX9616v04hcGVa8olVbseJjl7Ivg89LYWJbkGOSc3ya6jND64R
X-Received: by 2002:ae9:e80a:0:b0:75b:23a1:468 with SMTP id a10-20020ae9e80a000000b0075b23a10468mr14001718qkg.46.1685763417992;
        Fri, 02 Jun 2023 20:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685763417; cv=none;
        d=google.com; s=arc-20160816;
        b=YxDDWB0fxe4BnoQdd3cizwq6Akr23cnxeDPnu7Y1bYmTmnuF+7p2ISM+EyNMdJXu3d
         yGCE9/FNgrPl+XTDHoaF5jkcPwPHrWpnmEojoD2PW9UNMl20F3T1WcsvFgL0/tW8B5Jn
         NWGZ0tWHhvem5idogR09cMES8RD7LisvIOEgG6MmN9RfZ7loepmwgdhGpzyfeoP8u8e2
         NYzUVbjr+iF3SvIDDJJ8pIoUxFpOZUaozqTEtQkSrpjRSR6tmMLdQa+fIf4jcUj4OAZQ
         Q0uunpuPUJEavEkSmTWBbuTInroJaCc2by+SKKrQUuEokNZK6hkmxtLWGiq8nJuDD716
         Zpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mDsfvf1+p0GoT0FUE1p6K4Sj2425cLlNDFN+q1Wg/PI=;
        b=wsjqJKsKuq2edL7N84Au07EdyPvOa3oX5E1qD8soWJEpSbUWfB1dstsWJ/8CztBXwb
         qyZKOBTqnsi1WZYsQ8mCL073cqq/36pRnC8by7RWK+bQ8LUpwPue0zNh9A9yx0Vez3cq
         AfStinYNrSBle/O4h3X3cABqgSCtkzITpTou1PwfmweeAv+r2lqCq4dErjZzbft1+fi+
         fuNa26sqXAOXuQqlx9VX2fW+c8G6tgXoE6MZ6KpHP7PHanceuAS8jf3HhWltbOInF8q6
         W8qzLHgUxTNQe26p1Gdw1BDggfT9Q4iC7eHH3nW8AWLFwLtTWC1bO3PNefwu4sfKi32A
         DIfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LwynO/YB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05620a166700b0074ad690df62si1637365qko.669.2023.06.02.20.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 20:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LwynO/YB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5I3u-0002O3-CZ; Fri, 02 Jun 2023 23:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5I3s-0002N4-9e
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 23:36:16 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5I3q-0006d9-Dd
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 23:36:16 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d18d772bdso3229330b3a.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 20:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685763373; x=1688355373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mDsfvf1+p0GoT0FUE1p6K4Sj2425cLlNDFN+q1Wg/PI=;
 b=LwynO/YBL05ke2QwBtnzClH6Cdza5ZR+xkGZcdrIJgqSAT3PFczQcB0F+XVSCOu34D
 hKcrUQmR+n+1fc7C8gu91qyFHNyAfa6e3gFQ8o4yJ++t9V9u3oDgwTR4vkj4gQxwMJ8I
 Zfcy7dK2RcEX7tUiHqFnZbgORdvJb6p5bXj+R2d80rQyL1VQHM94s99MUbPPAQWoVhZM
 Tei8lYW/VfHPe6nvFL8BV14RSrAUHm51hF+UkttsTUrOHHO5un2wolyfoRFiZqJoY2GC
 TjMtEv1YMGgv2OFWpPfPbUjhsLTQ0vE8z+l0AC9+hzfJPIBcThsSMbrOvCYWtCv/pEYh
 lY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685763373; x=1688355373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mDsfvf1+p0GoT0FUE1p6K4Sj2425cLlNDFN+q1Wg/PI=;
 b=fCowgpaipiG4uc58qRiiHTuvKx0nhEr9GYZ7/nAkltKFWXfRkZAQyBMEZ8Hiqq/5kZ
 LVis9P7tQnWprQ6x6IiKZXPWhK3SSraaxZy3Zs1Qj8Fe6NH6ekGrqqM8PlDrTYs4wBJf
 iuFrUTJwLI2GLlKIVr0cHuxM2Ct/Bgm14hidquYSWKtNOSo+GAzN6xhs8TvvUApjcDaF
 2a6RwHE17RzrkmrzBjpTJQL2Z4Df3wOAlf1+TNnwehSYJkwMsxqDic0iI5/CPKzoPYkv
 vc5JxfC6rPOSBJkhdLtgS89LfaueTSBxWYKz+ebAffMM2OkEN4R20/MHjRlHzsdQSdfz
 j6FA==
X-Gm-Message-State: AC+VfDzdLz5VHY5z4tcb/XtCXBdT4cQC6h63tS5SWWGn/y0LBbjal/Ow
 kuK5hz093LUhSmrpbaEl6ki9msd/poeNW6Tv6Hc=
X-Received: by 2002:a05:6a21:2d8d:b0:10c:9e35:857a with SMTP id
 ty13-20020a056a212d8d00b0010c9e35857amr568914pzb.49.1685763372664; 
 Fri, 02 Jun 2023 20:36:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a62b616000000b00642c5ef6050sm1631899pff.173.2023.06.02.20.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 20:36:12 -0700 (PDT)
Message-ID: <2efebc48-1180-6220-cda7-ec9503a2e416@linaro.org>
Date: Fri, 2 Jun 2023 20:36:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Fix return value from LDSMIN/LDSMAX 8/16 bit
 atomics
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230602142219.1999756-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602142219.1999756-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BdBHoA2EFDPu

On 6/2/23 07:22, Peter Maydell wrote:
> The atomic memory operations are supposed to return the old memory
> data value in the destination register.  This value is not
> sign-extended, even if the operation is the signed minimum or
> maximum.  (In the pseudocode for the instructions the returned data
> value is passed to ZeroExtend() to create the value in the register.)
> 
> We got this wrong because we were doing a 32-to-64 zero extend on the
> result for 8 and 16 bit data values, rather than the correct amount
> of zero extension.
> 
> Fix the bug by using ext8u and ext16u for the MO_8 and MO_16 data
> sizes rather than ext32u.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 741a6087399..075553e15f5 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -3401,8 +3401,22 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
>        */
>       fn(tcg_rt, clean_addr, tcg_rs, get_mem_index(s), mop);
>   
> -    if ((mop & MO_SIGN) && size != MO_64) {
> -        tcg_gen_ext32u_i64(tcg_rt, tcg_rt);
> +    if (mop & MO_SIGN) {
> +        switch (size) {
> +        case MO_8:
> +            tcg_gen_ext8u_i64(tcg_rt, tcg_rt);
> +            break;
> +        case MO_16:
> +            tcg_gen_ext16u_i64(tcg_rt, tcg_rt);
> +            break;
> +        case MO_32:
> +            tcg_gen_ext32u_i64(tcg_rt, tcg_rt);
> +            break;
> +        case MO_64:
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }

This reminds me that we have a function in tcg to handle this switch, but it isn't 
exposed.  I keep meaning to do that...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp555766ejc;
        Wed, 12 Apr 2023 13:01:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350YbngrUnjqyE9AXioNm9QKoRjq8t/0NUorLI+LZfsj3zRAyO0padTF124nCm0ZUs/UXIoFa
X-Received: by 2002:ac8:5b87:0:b0:3bf:d0d2:142d with SMTP id a7-20020ac85b87000000b003bfd0d2142dmr767730qta.24.1681329712772;
        Wed, 12 Apr 2023 13:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681329712; cv=none;
        d=google.com; s=arc-20160816;
        b=yIneVTTPYGnyjP9a27e5HBmPYjSKj4seBeFhKKaVBOhoz638XiZIaoCYIWd+cGrGFP
         TW/ABiBglZZEPGx4A4Xnkzv0PhiORHyA+OCcISY5hcRSKyx6bB2RrHdVa2thbbZKhnvL
         weEDClHwAqqyG3Y5TeJjz393DY4vjOTTqxgyz2lBu9zOIVqkEIMJJ0K6Xo19AdKgbQNL
         pi9bM/pa0uU2TQLZgyhazh0uMBsdczX/EHLbm8p7sHwqZk9AnGCibqell3xF4vy/D4eW
         Bd5zG4wUtCg8um+err6SDZ9PuEjozhHfbMcwXEAL6n3N1BfEjzD7EUhjoCfM1oDtQLY0
         y1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oYUlqp7DOOYFgt3XSfQbMs2OwrXSW0diZtzXYFuRk1s=;
        b=R69DmALN11j6eGyE/02QN2SVGcVQeP/tNpYMsHEvVsPddEW5qLJX3Qhd2B88T2ezvs
         NoEu6hn6bBPTc3WqeHOAMIqHVvDsRBHfe7YbUYwjY57J8knqYWJTo95M/pZCwaXurjWI
         LR2VQYHHuxTPLFX8k4TEqTu3qoLlp2LXQEY8gOBjOZf65m12yzStvRwGuHlN7Kawrbpn
         qsh3D/M2NwTbEPEFJBbG6FVMF3eQ6sgX2Ijq/1OewjZAP7c1KyoamDqlS3Xsqc51gvH0
         3JxfP6nag2hTF4n56LsztgDWcmFZDVwB3kyzDeFI/CmNCz7gVt1YuxSnR9ebYl/P4SL/
         NQug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=KAGHKbI1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24-20020a05620a269800b0074a3b8b12f5si11284074qkp.350.2023.04.12.13.01.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Apr 2023 13:01:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=KAGHKbI1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmgeX-00023Y-4o; Wed, 12 Apr 2023 16:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgeV-00022C-LB
 for qemu-arm@nongnu.org; Wed, 12 Apr 2023 16:01:11 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgeQ-00023E-TX
 for qemu-arm@nongnu.org; Wed, 12 Apr 2023 16:01:11 -0400
Received: by mail-oi1-x232.google.com with SMTP id w13so29154755oik.2
 for <qemu-arm@nongnu.org>; Wed, 12 Apr 2023 13:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681329665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oYUlqp7DOOYFgt3XSfQbMs2OwrXSW0diZtzXYFuRk1s=;
 b=KAGHKbI1BQyhne+wBINTaJ7l+X/uTJolmxDA31Th56hWYZuJk78aEy9j/6+gLEnhZ4
 brvQ1oLml4cJ2H3rR4IRd5hbyHU7sysBbCsVCziUsZh1Zgeid+CbujWRBtvOJNbA9ZXj
 GV2F+W2jdHzXlsnobuNoypUlRMPHXSE9Tp3JVr2R4XKKMFoN/XzXKrz3jSENtnIkZYyS
 Iw0hT+qHotQM6M+0BRe7ZIE+qkN1zDO4EFf2QEmUrpRgTL4qBJ6XukVzUiKVAH/H5dTB
 dgYiJSndZFLHSuxyMWAEbtgL6fmNyyeuacvITL8E7IZwdKrwm0m6s8lfDYGz/Tst5zgF
 jqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681329665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oYUlqp7DOOYFgt3XSfQbMs2OwrXSW0diZtzXYFuRk1s=;
 b=JPOJGqKh2TAm3V7gh9rIa9zfPLo4OGIQ19ilTkN23hiYkWxXA+/NJpBrTaNY9FB1ct
 4/rxg0Q9R7ukEdx1gob6BJ3F9rI7a07wAtpt9qe4wp/aWcBqpK9TIO/46bn+5WFswV7u
 n6pLxfIy556IGOtQYMWh1jbHqDaYwQt3AJ4bFwkJ4WAWWg0y32Px7u/9QJGoXWyI8gBw
 YF1X9rPGYVgQIWc3qOMXlYnbDp5YJwbo3+ih0BnoB/pGrmzTqdNApX5i7r4vyuWAGkFZ
 BdB54OGPPN7LXdwuC6q6OPAVJpJCA7VbuXr43Ad96s4upYIwTvdoj6EiC3eRn5v8NVoI
 TR/g==
X-Gm-Message-State: AAQBX9eGZd5PCFngsgToGa8BHXllINB6z219rKjgBUTHLuJ7MrRdtTPz
 eHQb5Hkmmgt1TvUGrbCxRB1nyA==
X-Received: by 2002:a05:6808:23cb:b0:386:eedc:a5cd with SMTP id
 bq11-20020a05680823cb00b00386eedca5cdmr10800132oib.43.1681329664920; 
 Wed, 12 Apr 2023 13:01:04 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 w130-20020aca6288000000b0038bb2f60064sm4595976oib.30.2023.04.12.13.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:01:04 -0700 (PDT)
Message-ID: <34ba8e89-87f0-8e80-d1c5-c30b0850291e@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:01:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 12/54] tcg/riscv: Conditionalize tcg_out_exts_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-13-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230411010512.5375-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 6v2rA0rxbmfT



On 4/10/23 22:04, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept sign-extended in registers,
> via "w" instructions, we need not extend if the register matches.

Perhaps "we don't need to extend if ..." ?

> This is already relied upon by comparisons.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



>   tcg/riscv/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 7bd3b421ad..2b9aab29ec 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -604,7 +604,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
>   
>   static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
>   {
> -    tcg_out_ext32s(s, ret, arg);
> +    if (ret != arg) {
> +        tcg_out_ext32s(s, ret, arg);
> +    }
>   }
>   
>   static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,

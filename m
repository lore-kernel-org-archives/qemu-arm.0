Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB98CFB5173
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 23:01:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9swK-0005pl-1G; Mon, 06 Apr 2026 19:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9swH-0005pL-F9
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 19:01:02 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9swF-0004sr-OM
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 19:01:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35d9749c26dso3201002a91.2
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 16:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775516458; x=1776121258; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xedcCmJTozTvaRldYlEnFDrygLSzor9ly/SOX1q4MHU=;
 b=Qm+QFPi47o7DsfNpAtKPcqpZBJCNwmrj96QAV29Fx5eigWWv9yYrqYkxGyzBgqAu1O
 3d+cdZaqjsf6dYrIWiiaY/4UUpfcqmvHLNclGdkGq5sHlbpua3Gntb3NeNkiS2155w8G
 kNBKCiR4WscV3ZNwQsmdNAVts3pMUZsybpt0yhe1xIWa1vLr1miQegEqK/CPqqRrB1iK
 eD+w5DwpZOZMdRUcqcz+ojn1ZWARssMvPpRG9vSSKarGJVauwsBmj0l9QCpKJ1VlnjCn
 xzyzeBK3B8+pNm2GO+F9pwTl4fYV0pPTH6smgaU7xZVQq4uR1hF9Idlnd7n2UcmbGIlY
 i1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775516458; x=1776121258;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xedcCmJTozTvaRldYlEnFDrygLSzor9ly/SOX1q4MHU=;
 b=krC9a0X46iYK3IWUMOHt6k1Lq9/cugggJunyabfViDCSWfe1+qNIKwrGOddzLgMy52
 bMNHkC4DDkWuYvO1kRpYk6hM/jsOlX7TZ+pvXOXIFv+LA/IrxxxA0MrtZupgbqFOGi7u
 xBPZVcE54tAUBOS/lL5ulYsH/L4Z5+KwVMRJLt7LrypquZ7ZXvi2oCDYrefDIMqcQCA2
 c2t4YUhgWmrh65G0YsuBr2j0KkZ4tL+uQ1jxyrMG35lB5XlbKktLaG9NVL8G3IPCd2r1
 Gh3F4emUnzsLUFJ5oOVudvf7BU+MPGxn+5vBEfqTwAWSsZw8U+T24Ff57t/R4v+TCANO
 ZtdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyzPjWwDY+LJF9gFKdf3mDjHe/HSDFmWY3l9En9uGayCwfd2NQ/5VY3ofHEAxKkzsQE14OPaj1/w==@nongnu.org
X-Gm-Message-State: AOJu0YwAwj0KA1k9MgsdQLEFBM9OX5X3qIDmBeLLZCR0YWQ3mvJrT4oV
 C7gMLK+NJOSIl37A02JulV0Hpivu5p5qGSrrBvWiXowpO8j0zZCtxdfS105+Jjw9EvU=
X-Gm-Gg: AeBDievfluqnqOT3Z0w3nwytI5nmym/uajLVOJcgOdBan4dNffMOYkj3b23Q0gygwGy
 g1OhM6M2ZsVPX7e1DvAM4wudXLKqkTa2aeb6b322l2cfvay5/zLLyPgJlVia75jmjC94A3Y/+wd
 p9ZkfW/nEkTgOHNEsWkmW/CkUa+mv4odieuCo9BiqEYMEW7fZnwPHTXVO3DhJJhD/BT8IF1AfRZ
 MYl4JuOj1Pbd37D/sj2BgfR82PKxxyaKeeBXeZZYRcTNd4BWJcaGroXsnezap4ScLT0c/5TT0/n
 h53g8RNRkl+QFy/0k4qdS3X0i1Ks/PboioCpO/GGGJSVwMRkes93Cv+2JhnnR09LAkfsD99S7mr
 BaxXndR1Yc5f9Vqxmd3rHvUIjHufIjiaXavnSSPnB/2O0wzDKj1WYbHKCAjfn6nFREUZHnMOAM+
 GNeVkqDhHuSCYBIU5qdMrUYwDf5nSZOtOoR4cN57YA/BpODMBCjDUSbJXVMVTFjfuVpziwyg==
X-Received: by 2002:a17:90b:1d08:b0:35b:e770:2341 with SMTP id
 98e67ed59e1d1-35de6811cfdmr13723836a91.9.1775516457962; 
 Mon, 06 Apr 2026 16:00:57 -0700 (PDT)
Received: from [192.168.1.168] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe9709b8sm18873704a91.16.2026.04.06.16.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 16:00:57 -0700 (PDT)
Message-ID: <46f488c8-1eff-40c0-a72e-231c81576812@linaro.org>
Date: Mon, 6 Apr 2026 16:00:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/20] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-18-pierrick.bouvier@linaro.org>
 <c73bee03-82f8-4529-9db1-7857a049f59d@linaro.org>
 <626fdf02-7114-47ad-997a-a7c64a83f9de@linaro.org>
 <7b15c854-64f7-4996-a831-d03480a40776@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <7b15c854-64f7-4996-a831-d03480a40776@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/6/26 3:44 PM, Richard Henderson wrote:
> On 4/7/26 08:27, Pierrick Bouvier wrote:
>> I noticed you added a similar comment on v0, but I was not able to understand what you
>> were expecting.
>> Could you please send a snippet of which change you would prefer instead of current patch?
> 
> Delete bswap_code.
> 
> In arm_disas_set_info:
> 
>        info->endian = BFD_ENDIAN_LITTLE;
> -    if (bswap_code(sctlr_b)) {
> -        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
> -    }
>        info->flags &= ~INSN_ARM_BE32;
> -#ifndef CONFIG_USER_ONLY
>       if (sctlr_b) {
>           info->endian = BFD_ENDIAN_BIG;
>           info->flags |= INSN_ARM_BE32;
>       }
> -#endif
> 
> In arm_ldl_code:
> 
> -    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
> +    return translator_ldl_end(env, s, addr, sctlr_b ? MO_BE : MO_LE);
> 
> In arm_lduw_code:
> 
>    {
> +    MemOp end = MO_LE;
> +
> -#ifndef CONFIG_USER_ONLY
> -    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
> -       within each word.  Undo that now.  */
>        if (sctlr_b) {
> +        /* In BE32 mode, adjacent Thumb instructions are swapped. */
>            addr ^= 2;
> +        end = MO_BE;
>        }
> -#endif
> -    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
> +    return translator_lduw_end(env, s, addr, end);
>    }
>

There is still one usage for bswap_code in linux-user/arm/cpu_loop.c 
which I'm not sure what to do with.

> 
> r~



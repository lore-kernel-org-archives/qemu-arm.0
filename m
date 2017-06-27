Received: by 10.25.227.6 with SMTP id a6csp1313039lfh;
        Mon, 26 Jun 2017 20:47:14 -0700 (PDT)
X-Received: by 10.55.73.215 with SMTP id w206mr4160132qka.232.1498535233962;
        Mon, 26 Jun 2017 20:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498535233; cv=none;
        d=google.com; s=arc-20160816;
        b=d59Di4fE3RYali6wbn33zqH/EhcwRURmGaipKINOGZUFCGRkc0t9RE9tC47724xY7v
         HXMraeIwM6DZvh/BiBU1dKQVwHZzPheBp/vqpUIkppshVnIHZAnWZfRvhaNK3xzz35mx
         nyvmWK10V0P5yUWN+EZFyXH8gvFTTImGdF/Ivcvov2RQ4x0NnCIc+wvOyeUfP4mcS2SE
         vIXU3fBm9gj4yd+MOFJ1TxSKy0slTDxfOu/sPVOijKScGypmJHIW0+lVxxYh4p4AFkxb
         h39kgV8v5ta0x/NcnPTs/vSF1JHUo8YuIMcK/SZX29hFctD39Fgvzqle1X1nbLZi6sqX
         GDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=CwGtS9xjuFKRy+/x/3IWni4DFVpJMeE/tZfQDRb+ldk=;
        b=Y1SpHlUbhNAbGf3Q2O3oKMP2VRMkP6PUxfJMhDfBOgdxA30e3InQd/I6cXDzt0+nz2
         hUgG3ipvpRf9HDfwrtN3Kb1vCZ5oll4P7xYJuviSDQIT/GO5wmN+UF4SsjetZ84F6vbj
         fy4jRxaRkMl5dXaviifpFipd9Df3Qs7BJJqeClWBU+w97+CFfdmwevaO6+1bLGRCa/3K
         O0Mngc9Csh7gsqEGh/lo6FR9hguimJg1gpztqgsmbMJpmYRBlJAIakKE/yHYol3mSNx8
         kNfh/Sj6TwbwzzvNsfGlXOFpQIIEW00UP2Q4OPr0YY7IKbdDUm5htlVfpTVqtmQGUmQy
         Kh4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=hxYG1Et0;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id h68si1695962qkf.50.2017.06.26.20.47.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 20:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=hxYG1Et0;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id p21so2556750qke.0;
        Mon, 26 Jun 2017 20:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CwGtS9xjuFKRy+/x/3IWni4DFVpJMeE/tZfQDRb+ldk=;
        b=hxYG1Et0p2E98UDN9LLu4gdfGQ6HPr3P6LnKXq+78g8Gv4nYaNuVSVDnuYAKhxCu5G
         La8R3EC1xEL/yzHMwhUmGEtfg15skxkj9yIeifSTUiPcNEB7CtLq79TTisz3Cv6YMgKH
         ZFgzlvEUGvofAnvMs6Cw2Ql5eXzst5Xov0ij2thRjcvwyCGXovpLv+YQo/xoM+DgfzDt
         d5fPTMv5gAWpZqrICVSgrV15l1zcBIS+LmWoR/PAZOfUHQf0f9X3UqvcqtTitaC8EJyT
         zf+0O8Cl9P5Ou7PODfD7LKK89vzOVxfA1SfCrVv0r/VlnDqqi/jn5z8r7nhIA+qe9x2Y
         RvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CwGtS9xjuFKRy+/x/3IWni4DFVpJMeE/tZfQDRb+ldk=;
        b=e+czf61FeNAJd7OD1XCvtOhtNPBj/H4vrF74jEk7f0KGwi+7uObRkHe+To4GBcOkpB
         utUVyx2hhirQ8PwCvym2vw0quxy5dnRlKsOc8+SLJDbexyydH7CE48EMvywsIZ21dQgH
         jzW9xlF5W1Ue0ucKKPJHO2a9KY3+hjTlq6fTbzMlegq/aXJsCCKMed9/XSjQI7FdhR14
         l18Q6mIil3kltFlHm0e9TIsF1kv3u/gZBlN0tqIAqq6rH4rCd/sJSL15i36sVOXgSjhW
         RR9FPaQTSfBMI7DAsZu7zPhS6e754Pev3IltKfalKP2Wxv/mHO9xTaaw5yOze/SsR0fD
         wslg==
X-Gm-Message-State: AKS2vOxxTWkxtYoms343Pe+XirzoS7wQufAYMyJJQu5KJ4htPtVxYkKR
	xA5kh7K1gpJDpBSI5AQ=
X-Received: by 10.55.132.135 with SMTP id g129mr3730028qkd.36.1498535233400;
        Mon, 26 Jun 2017 20:47:13 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id c26sm1604249qte.63.2017.06.26.20.47.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 20:47:12 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v9 26/26] target: [tcg, arm] Port to generic
 translation framework
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
 <149838651980.6497.760840816251179741.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a87f52f9-8afc-a4ee-5f65-682dcbc2f08a@twiddle.net>
Date: Mon, 26 Jun 2017 20:47:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149838651980.6497.760840816251179741.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: X7quSqDM/Go7

On 06/25/2017 03:28 AM, Lluís Vilanova wrote:
> +static TranslatorOps aarch64_translator_ops = {
> +    .init_disas_context = aarch64_trblock_init_disas_context,
> +    .insn_start = aarch64_trblock_insn_start,
> +    .breakpoint_check = aarch64_trblock_breakpoint_check,
> +    .disas_insn = aarch64_trblock_disas_insn,
> +    .tb_stop = aarch64_trblock_tb_stop,
> +    .disas_flags = aarch64_trblock_disas_flags,
> +};

const.

> +void gen_intermediate_code_a64(DisasContextBase *db, CPUState *cpu,
>                                  TranslationBlock *tb)
>   {
> +    translate_block(&aarch64_translator_ops, db, cpu, &cpu_env, tb);
>   }
...
>   /* generate intermediate code for basic block 'tb'.  */
>   void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
>   {
>       DisasContext dc1, *dc = &dc1;
>       DisasContextBase *db = &dc->base;
>   
>       /* generate intermediate code */
>   
> @@ -12202,97 +12214,11 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
>        * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
>        */
>       if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
> +        gen_intermediate_code_a64(db, cpu, tb);
>           return;
> +    } else {
> +        translate_block(&arm_translator_ops, db, cpu, &cpu_env, tb);
>       }

There's really no point in keeping gen_intermediate_code_a64 is there.

This is better written as

   translate_block((ARM_TBFLAG_AARCH64_STATE(tb->flags)
                    ? &aarch64_translator_ops
                    : &arm_translator_ops),
                   &dc->base, cpu, tb);


r~

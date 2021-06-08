Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3993458lfa;
        Mon, 7 Jun 2021 18:42:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIgKldOxRTv4WxmkVY9Cx/vJZai+MnoC0uksB4svwmyZxeBmqOSFptVQJLkXNnS1Xg/kkV
X-Received: by 2002:a05:6214:207:: with SMTP id i7mr21451023qvt.10.1623116568849;
        Mon, 07 Jun 2021 18:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623116568; cv=none;
        d=google.com; s=arc-20160816;
        b=EqiuxCfRhzScAFevcG8u1ccNzBygqGHi6FGTUvMgLIk42I0yrViMUcvqvnR1I9+0Ee
         CpuW44AELlMDHrlilIFpNnGMWjSd48PXRUkjZYzGsw6ZplhE1B5QoJ7Oay+7q2dmhCIV
         wx91WzOh6xDT/CC2v3vLXHIk1ZarfGUQhBXTTVdfuc4mmIJv7HcKvHsvKMhUP0h7O9sf
         0lkrHyIfa8zTQYm3IVRKTfY+psf7wfV6el3N1RQlntph+lpRfGAV+r883isPxy6moptF
         YMLJgQPPMgQeqsSDkue04O4Xrh1qRdQ9vYONjOPeibEXmoCqhua5ts8FLyODdebBEQVg
         ZZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r4d80LJidM/GpuQqXW5SxWFt8l1wAPDeqaoJ5rAjvTg=;
        b=LDePKuqLdjQmAYbm4u1H3P7JAKbMClIn9ckjMgdqYcG+M8F+1RcNd01lugr9m0xXuq
         tWzUrtetSgoKjfO7R2HqH8W0wYawLLuVyTEPBptEcCF49MntXEYAg6I9nCWcfHcTZrVl
         htLeZVDdobI1UGl+fQObSlryfaeKSiSUZOvzHUplvEs4HTqXta5jrj2DD2spR//jU/l5
         dOpPkzRfHUZr6RIc5jnC5BjBkq/F2HjrzsfPMZ5E/PsXw+stsEsy0SFaVdedYXnkQwYq
         8A9f8lUMWhBZal5iNSBzVq2/o3TecebcfM1Xm2m6QSIGszkqTKGD8ZjjppNMjdaOy7Fm
         qY2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l8aNy4wM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si7389419qte.340.2021.06.07.18.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 18:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l8aNy4wM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqQlU-00012E-3w
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 21:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqQlF-00010C-Sl
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 21:42:33 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqQlD-0006DZ-Vd
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 21:42:33 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e20so3321105pgg.0
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r4d80LJidM/GpuQqXW5SxWFt8l1wAPDeqaoJ5rAjvTg=;
 b=l8aNy4wMBag/mnoZZIVnMk2yvweBzMzZC9Htk0XJuUAyAAozBr4/+0fgPWsQDsv0al
 bXflksPrYizuOt7XbevulvNnkxT7/9FUJXmAVZRAGH620JlWg2eNbDrLK1PZvDV7KIt4
 jy/PxXnn7OlLjHc9kCSDBfOPwZ+WG9pxh7FGlAEZUMKtXSShhxfiZ5Fvofxd4aHbcPLA
 CygqEr0BjxOYsn5CtxNkOKRR4dFMwmGR47tHNlOIW3+XmAsOaIO3w3+hlwKApceuLdIv
 ZklSCY0z6EpKB/Dz1g2G6GpUMaI8lKw+QyX+JBznTOFg0WEIylVI5X5t48DxE6Uv2N3H
 c3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4d80LJidM/GpuQqXW5SxWFt8l1wAPDeqaoJ5rAjvTg=;
 b=bWx/vstZ3o8if8Y7+pBCyz+48QVRNozpb/nVA9xWpnwvCthbdn4mJDRCm/S1cuXKRC
 e/OZrUXhkkzXwIU5kWCjE0shuKeE57oYG3qPIBb5z4RSlwNY5xSa9GeP2uKUd5M5ppYr
 /PUzno2qK27xZ133PLKqLKTKALgOh9ej7CucYeRdYg6+Xp5RsYPIHHiUAqcJMQ2dOICO
 vS64BMcbyr2qCshsFUqqga6ToTPK8anrnqthVSaIV26F5UeD2KEkw0lmMrOIfO8/t768
 wMBHufvZrpBvJS0TU3DEQvWyNEAIDdh7h0QEF4eA9hvQii1/+DQki6600rwgzYin+Qim
 Tgjg==
X-Gm-Message-State: AOAM530zP74SwqZ7tx3mO3tuAy5JT6tmRFDI69a35C5PvPFgR7vS0MFl
 17JlR89F63Hl70oAE8Nndf7Evw==
X-Received: by 2002:a63:798e:: with SMTP id
 u136mr20931096pgc.264.1623116549430; 
 Mon, 07 Jun 2021 18:42:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d22sm9798398pgb.15.2021.06.07.18.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 18:42:29 -0700 (PDT)
Subject: Re: [PATCH 07/55] target/arm: Implement MVE WLSTP insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e832785-40ec-99cf-5915-179924fc50f9@linaro.org>
Date: Mon, 7 Jun 2021 18:42:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RBgyAp+eThVR

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
> +    {
> +      # This is WLSTP
> +      WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
> +      LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
> +    }

I guess it doesn't matter, but I'd swap these two, as LE is the more specific 
encoding.

> @@ -8148,10 +8152,40 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
>            */
>           return false;
>       }
> +    if (a->size != 4) {
> +        /* WLSTP */
> +        if (!dc_isar_feature(aa32_mve, s)) {
> +            return false;
> +        }
> +        /*
> +         * We need to check that the FPU is enabled here, but mustn't
> +         * call vfp_access_check() to do that because we don't want to
> +         * do the lazy state preservation in the "loop count is zero" case.
> +         * Do the check-and-raise-exception by hand.
> +         */
> +        if (s->fp_excp_el) {
> +            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
> +                               syn_uncategorized(), s->fp_excp_el);
> +        }

Surely return true here...

> +    if (a->size != 4) {
> +        /*
> +         * WLSTP: set FPSCR.LTPSIZE. This requires that we do the
> +         * lazy state preservation, new FP context creation, etc,
> +         * that vfp_access_check() does. We know that the actual
> +         * access check will succeed (ie it won't generate code that
> +         * throws an exception) because we did that check by hand earlier.
> +         */
> +        bool ok = vfp_access_check(s);
> +        assert(ok);

... otherwise this assert will trigger.


r~
r~

Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2019310ejb;
        Mon, 12 Jun 2023 06:29:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/eSA7TV0UcC5eGDq37g7FDsNt1Ae/9aql9zubS7UPR1cUHxwrR/ZgDSqUqmmCCvVoDWMt
X-Received: by 2002:a05:6214:2b0a:b0:62b:5081:46bf with SMTP id jx10-20020a0562142b0a00b0062b508146bfmr11755258qvb.27.1686576547514;
        Mon, 12 Jun 2023 06:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686576547; cv=none;
        d=google.com; s=arc-20160816;
        b=lHqZq7YwjoM5amGLofsa4SbUdv3vAIPGoIU8AOfHweXv2BQhgyNv1ju4FNjJigxYrm
         nhNJdOP0DUvmOMUwwfc2sF+AbHTHGGSjG7Qi4HGS9Cdo/b0XUlbzGE14MpQrVtTNskBA
         q6P4ONnMpGQgdS7yLTRBA+PnFgRBNl8/1uFu8kvkOj4i4EppcKj7O8OiBvaDC0NL94eD
         rFXrPIsVRUkHNEx0LnvowMtammwIP4fq72h0+UJFixiv9M9WTXsOxCmoV2YpMCaDXDVs
         vtn9Ldg3ymm/SfQZwEmvRHj6yqJjZm4ZGzhq7DhxDa4yP1SL6wgQLgEAxj1B/3eyoMvj
         JOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GdnOZcCxB1YvBxpz/8V+MqZ4LsB/Ng+UOkEClp1iNgA=;
        b=qg1wJoXHDxyT6If14WsFzJ0y5EtcrCa4IeqZYR4LNu1YrC5SEO/0xNcOyOw7lqViUO
         AhQh4nz3Cl+kDje6K2FGknM5Ch2w9LQYAt+/cXCWuqHdk5bj2YISaSEvYIMZ0nbU7r+I
         tu3K4y+R2H6POh0/vpS6pqPhqLOuIQD8TxyOT+RpM9DOwCZqbjzmQMxsQZTY1TLLE3LM
         WgJOZ7Xmgl9pmTFazBlrUc+EtPQ6xWYLGQsWLl0piPMJ7M88rxlczdoZRj9BGfywFIL+
         WBmSvWirrqtXhZ49ph3s4UJwWrGFKbqX7NCf2/qqJfWl1A9L4XFSCbmuOECqXFlvAkfl
         vtkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=E23jdBls;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020ae9f512000000b00758a2facc50si5895911qkg.354.2023.06.12.06.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 06:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=E23jdBls;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q8hb8-0000NM-Gy; Mon, 12 Jun 2023 09:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hb2-0000F0-53; Mon, 12 Jun 2023 09:28:40 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hb0-0003hU-Il; Mon, 12 Jun 2023 09:28:35 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1a6820804abso885237fac.2; 
 Mon, 12 Jun 2023 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576512; x=1689168512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GdnOZcCxB1YvBxpz/8V+MqZ4LsB/Ng+UOkEClp1iNgA=;
 b=E23jdBlsUEz+01KDl5akFCpLHUC40dpg/0KwD/Plaf2QUlQvEO62hS9A0CxFGmaHeS
 xNCH/gdb8uc96yQVBY05wv/G48hCbTg4XV0CMLoosBdM6UdhO7AKUaLfrHijkpDNi89q
 XKHJa2zep5pQ4osulZeKEk0lGA546BlGRi+zQMoED3XkIWdhtNRAvDgjE8oXgEk7kLz6
 IAtGmNtWaCIohhQXiO+fNR2H+13aaDfTCtrca8ovom6WI3WUOodfj55pvvRI5Cm3qHfZ
 +Loclcx0tvDeLUn06W5UE4f2njj34X2Nnh6kSB1qEEVcmht006BeoygfF0jIQ9wzEMqP
 JYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576512; x=1689168512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GdnOZcCxB1YvBxpz/8V+MqZ4LsB/Ng+UOkEClp1iNgA=;
 b=EpjkClrK2KvJymfkGsZi9TXAF0j9opTRq6R5vT06IJpJIW7eCUGDwwUQWiO7jorDPH
 diPexb49RAWMxiuA5yfLcL/4TIAsan1uGQJ7Uxuuz+mCvUNgxqL9lCdszq2wIde58KMB
 V3H3GuOAd1C2WYxSXFWiYDsaSQzvUUm+bVAPVTMg2GQNxUmPq6IVGbFSGUbOn3qB7AkM
 Y79xpeAd0jrQ5ZYP+Ye025cXdHJY1dEfK4K9Zkuw1rJcZ+/jlfOw9qPRazLNKf8Zq0NQ
 fvaTLz7xhRjVa0RKMJKf4sm/ZhDX+HWUcqvutvnilZTL4Bk5Up9xxsschyiwkyYwAgUj
 VNEA==
X-Gm-Message-State: AC+VfDwEqhOr2V4HgjEdcgM1PUq5Q62T0WIn7gn/fmbgw8v6Zyq0/AI7
 V14CairE/uKrmhZg7YUBfrHIdGf/8NY=
X-Received: by 2002:a05:6870:d342:b0:1a2:fd06:9f93 with SMTP id
 h2-20020a056870d34200b001a2fd069f93mr5176396oag.7.1686576511953; 
 Mon, 12 Jun 2023 06:28:31 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a056870530f00b0019ed19a8659sm5861686oan.8.2023.06.12.06.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:28:31 -0700 (PDT)
Message-ID: <cead91a0-632a-f7b9-f2d7-bf922f68d604@gmail.com>
Date: Mon, 12 Jun 2023 10:28:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 25/38] target/ppc: Use aesenc_SB_SR_MC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-26-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1D22Uov5dNwx



On 6/8/23 23:23, Richard Henderson wrote:
> This implements the VCIPHER instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/int_helper.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 15f07fca2b..1e477924b7 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
>   
>   void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {
> -    ppc_avr_t result;
> -    int i;
> +    AESState *ad = (AESState *)r;
> +    AESState *st = (AESState *)a;
> +    AESState *rk = (AESState *)b;
>   
> -    VECTOR_FOR_INORDER_I(i, u32) {
> -        result.VsrW(i) = b->VsrW(i) ^
> -            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
> -             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
> -             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
> -             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
> -    }
> -    *r = result;
> +    aesenc_SB_SR_MC_AK(ad, st, rk, true);
>   }
>   
>   void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)

Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1211898ejc;
        Wed, 27 Dec 2023 15:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/HqmQObtcE5/0PqwrPlaRiHhJ2/+dnGiVsEyPCjpT1PghwqbhGKZnrSKPWYTiWIJ7RA08
X-Received: by 2002:a05:620a:2943:b0:781:13b7:e8c0 with SMTP id n3-20020a05620a294300b0078113b7e8c0mr14236013qkp.86.1703718421858;
        Wed, 27 Dec 2023 15:07:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703718421; cv=none;
        d=google.com; s=arc-20160816;
        b=0iVJRrC0r1iQLnDZ/EhFbSrtJHFhBCrYO+24BdsR0tg9cEG7CsRXFkICZ6dB7vgHdM
         X2ffIs4Ecmm7upvRwQcYVYMFAQskGQRTrZbHsxtXtQy9TRSRMyGvMMeIGpuUlMUWyUr/
         aB4UXVeIUpgmqU57FrrPRx2BV6/MMJ1VnqXgdgiMKaTcnUOqmgYNGCTy3CZ4IMUOPeyt
         FcxLY9RgCcuJqVqGDjxJsu+hCRF1wgQm9GLRJ8R5wNQCWNkYf4fZLnPF195Bj30ItcC5
         CPGM2qe75lsbozZxFLJlkhFeDhixqSMqBVZ3XkYFDYSW+pYc4ea/5F0lbIvRBGD0Qhbn
         xZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rvPajHIy8l1g3X2buf75zd7Xou3Ys9df3H+HTh42yEQ=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=vEBGDYuzMSE+/wWRI5sMEgHO9wRbv9ty25ekz890qHEy+U8vdOzDjS3LeTkl8h1X6d
         4uou/9WGPdblRqaHNYkz26Hqoz14dnw12DEyUTUlpEWWXAMqPtffEAEHC8oma0KfhN0u
         jFpBgX42RdGHM7E9WkL6wqsoa817g2zU3Em96m1RJ//mmNetpwYOJTQBEP9W7f5cYdH2
         +zF+ZJmmH2r5ZC9BrMnFpapxtoj6Vj4NFySVEpQidevkuSzV23btghdDeV3728osNDvU
         /xC6F/sCJTrLpNLw6BfI0CSYzSoKdciU4Or0M/1O6TciIGC3S+f1HDHsbMTgWBfKXlfO
         MtBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fKUU520v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020ac87f42000000b0042578643a91si16122281qtk.123.2023.12.27.15.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 15:07:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fKUU520v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcz6-0007W3-O7; Wed, 27 Dec 2023 18:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcyy-0007Q6-UI
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:06:37 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcyx-0007Iu-HF
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:06:36 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-20389f2780fso4672762fac.2
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 15:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703718393; x=1704323193; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rvPajHIy8l1g3X2buf75zd7Xou3Ys9df3H+HTh42yEQ=;
 b=fKUU520v4NtPZWq5pfe94qwJs6fld1+/Df0rmHfPSvkuWdLTJmVdXNwqylZvb3qUaR
 VkrvtISBm3Piz+tdyAcHf32Pc0MgYpafoHdi9mKQaM8d5xrU55/M1dEmclJ8jvMB42g7
 /wTK6fu+o2uXDvpwKn+GLrCpxa4o9DnhR+lDCpP19DuT1zVWUx/1AiiDUNSTRqwgwoQr
 a4Zlq313yGbax29TGb00NERVlt+ijRSiSW4+KDk+qQx0XO1xJA8Uz4/8l8VJdWY5Lr+d
 QIkPT8u3yC/bg/Lz1Y/6icYqvjWxsXUh5F699kyiT05SZfzuSv5ff+yR85qjh7TCsi3+
 UWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703718393; x=1704323193;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rvPajHIy8l1g3X2buf75zd7Xou3Ys9df3H+HTh42yEQ=;
 b=XuXqy5GdkzjHtRdIUdt+V/3azTrZEOonWJLj7KITeEmBk/l7vy+zgzs4fQHdITXiry
 xHf6ZQuBOCSA1kxHPvqeyhEc+w11odo12PTwvqUNRUe0Ju3Mjt14oLBVsEbSDLVjneZM
 ciFVo/jghZuo6m4CWzc2GciZQqVcqPsF3F6FGURQ9pc2KfNpRG9gO9RfUV9ZlBp97RJ/
 D4wzZnvc54FiKMyRMLXm2XbaZAPgXRiYHGLRZO5moWoQbv/1ZqR10vhRsmx6t0gefV4x
 nV7QiAuVVO23x3rWbh9X9gcJhNra8UjeBC3WF3iTi3b524m7uO/if3E9KGvMf56ZkxnX
 UTmw==
X-Gm-Message-State: AOJu0Yz5oXAT46F/BNF7R2Di5NEkdntx3iTRpx61UBZ4W+psmcGrrup1
 LRjMKQsuZU+lo06BceqKOgIQ/gm04pc9t2BTVse1MCTFZVHyZw==
X-Received: by 2002:a05:6870:3514:b0:1ea:2e2c:e9e7 with SMTP id
 k20-20020a056870351400b001ea2e2ce9e7mr11519898oah.59.1703718393281; 
 Wed, 27 Dec 2023 15:06:33 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 c13-20020aa781cd000000b006d9fd64fdcasm1975921pfn.37.2023.12.27.15.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 15:06:32 -0800 (PST)
Message-ID: <cd9c4cc1-be3b-49d4-a049-c8157a9cae03@linaro.org>
Date: Thu, 28 Dec 2023 10:06:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/35] target/arm: Handle FEAT_NV2 changes to when
 SPSR_EL1.M reports EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3kAXQ+KNPxdT

On 12/18/23 22:32, Peter Maydell wrote:
> With FEAT_NV2, the condition for when SPSR_EL1.M should report that
> an exception was taken from EL2 changes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 45444360f95..38e16c2f8a5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11405,10 +11405,18 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>           aarch64_save_sp(env, arm_current_el(env));
>           env->elr_el[new_el] = env->pc;
>   
> -        if (cur_el == 1 && new_el == 1 &&
> -            ((arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1)) == HCR_NV)) {
> -            /* I_ZJRNN: report EL2 in the SPSR by setting M[3:2] to 0b10 */
> -            old_mode = deposit32(old_mode, 2, 2, 2);
> +        if (cur_el == 1 && new_el == 1) {
> +            uint64_t hcr = arm_hcr_el2_eff(env);
> +            if ((hcr & (HCR_NV | HCR_NV1 | HCR_NV2)) == HCR_NV ||
> +                (hcr & (HCR_NV | HCR_NV2)) == (HCR_NV | HCR_NV2)) {

Maybe clearer as

	if ((hcr & HCR_NV) && ((hcr & HCR_NV2) || !(hcr & HCR_NV1)))

?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +                /*
> +                 * FEAT_NV, FEAT_NV2 may need to report EL2 in the SPSR
> +                 * by setting M[3:2] to 0b10.
> +                 * If NV2 is disabled, change SPSR when NV,NV1 == 1,0 (I_ZJRNN)
> +                 * If NV2 is enabled, change SPSR when NV is 1 (I_DBTLM)
> +                 */
> +                old_mode = deposit32(old_mode, 2, 2, 2);
> +            }
>           }
>       } else {
>           old_mode = cpsr_read_for_spsr_elx(env);


Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp51432dyc;
        Wed, 2 Jul 2025 11:15:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWre0DDL0VUst6BqIyBbeAhdDPxfbaHj90w7FwuF6caYYAz6GvslGqkkADD9WSqTpZUvH1B22RPHPDXJg==@linaro.org
X-Google-Smtp-Source: AGHT+IGd0xS4VaUZb3bVgLc0/43ZHCldWHbxwpUEDH/hl79vNkVqUdcR88XUpRlYNAyKArS09fTO
X-Received: by 2002:a05:620a:24cb:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d5c47352f5mr572531385a.50.1751480151272;
        Wed, 02 Jul 2025 11:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751480151; cv=none;
        d=google.com; s=arc-20240605;
        b=KmVxl1Ev3XpN8EK8v75iIoKTwJHu9Z7ZSTdqRBCw4ejClG/Tu2gU4l4X2/HJ4liG0m
         u9VjvVy0CZWGNqawPbTtehHbV8xwC5CDgJkXYW/PcSAKaQqvFBZDqvK8WMMQq8IaPdYG
         +BDjkQ8/Gh8u+rmYIIBkAQVWQnWfl3x7u0Gcl6TcYf2/5Lh3XrEXN/pp5RDmetuhs358
         zTmDs3u8O/HJmOU/SYnauMVdXdkN62wziQbw0iBGY0dh4lt6gTmeXmPlDGb6P+j/2TZV
         ec3ANGDRb0ulBpUsJ+ZfKmGqj0IeFunRrX6+fTvZcg+GZHMYP/ZHJ6NRo4aQEr/GsvlJ
         w9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AxQhK9pKqs9jAdyZ3RE1U011mfYv3GPygX6VrXFjJDI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=doLFmBaOqC02T/AiWZDmZf3Gwue9V3JLg7rVV9kKN361uix2ZVB9TLHmf7JknjYXkY
         raLPpOlnZl2+dg2CnpIYMpt7DmJBADRXkLTjJ8fbbMuclJwC20MDAIBmM+MXhGFdKHz9
         Rluifg7LZ7EGa/Xy8XgKlKbYuyfj/kjSKLV5MhshPTrhuvOUtAXvNcVE7gYamhFdzVaT
         zjC8Wf6JsQznaVJlrHj6nApsmKNP8lbeH1DghNf9cOjoV2xHsmrklC81svuksSInBUKP
         wKkmT18m4u5YomZZODjamsQSPgYyJSciVs9Ig6yeXOVTPnYN46OI4QQR43+rCseF65ig
         h23w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYcPKTzj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-884d1d59978si3398045241.79.2025.07.02.11.15.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 11:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYcPKTzj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uX1zR-0006Eh-EY; Wed, 02 Jul 2025 14:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uX1zJ-0006B5-MU
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 14:15:19 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uX1zD-0002Wg-UM
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 14:15:17 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-611f48c6e30so1111510eaf.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751480110; x=1752084910; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AxQhK9pKqs9jAdyZ3RE1U011mfYv3GPygX6VrXFjJDI=;
 b=nYcPKTzj7w+3beAzr1tc+x03jezXJSPu/74/r7WjmfplfYvgCuD9b6UP21h3f2zPCe
 V/X63QYszGmdtSqXNMvlw9GDRM5R/8KzUXiRNFqSDJ+8kgZrt2zijHKLey1sBJb1Md+1
 OlQZ7U+7bzXGeoAnqjF5XRCvNp9LCiSLjWeq5oB1BkSPZc6REwdy8bQ3ZndVGeeCNWTJ
 C4tjEb3P30JCC65Iw+w5OYJAf0H7BW7TMWp3OHTTuFT3e0JcUEYwOKQ1IDxJJjvA0i/s
 m2tYJo0Gv0nUzGPDskBRs5cAsTjBFeEV7iiETwUJP/bA+lv4VAyRaL+inuhsmBqNGItU
 9CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751480110; x=1752084910;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AxQhK9pKqs9jAdyZ3RE1U011mfYv3GPygX6VrXFjJDI=;
 b=YookK4NTZJe4wVuFfXwkgTSw/sxqyOE/tsN66dmCn05LAE7v3DxFU7bnME3jliKl1y
 8fpHJl+iu5uFqkgQNN6Xxs55ngtd8AZBLu2+LnjAbHap7ZdZc3kqlizh5P6jvOevOz0/
 nrboOSJ6cZ04BySQBS8pfc4ddUcUOUwDFdd3IaHD1dDSjF5D8gGHHK4bm3MkoqSQISXw
 aLK4/9PWKgnCUIVvQzzOlr3IgkHkqsx+E2Ha6VAWulQdEpTyb1QVvahpk+QrpkJ/pMHN
 54dlRVliG+clbSLzbDvpn55QSrAS7tZJwYVnXmj/CHVezQGGnfyHrMDU5281vlCIyKBV
 BubQ==
X-Gm-Message-State: AOJu0YzzIVo90u31wjd6IJjS1G165IWh8eZ43sZ8cE1LI3+2+E/k8EEP
 nUYYcHSEsCkXUDalY4bFlLhHtNfxAYCVzWl01sdToQZZuLYQPA1Lc3WB5pTOTgXq1xcjgUDvC3s
 vvDgBIjw=
X-Gm-Gg: ASbGncuH5Av0Hz9gx6iUXdUb+nvDpEP7pA35ChOBi7YAoGDfabU+ETgIm0yn4HQs6uY
 FIGJ9HFvTmaKxglM7hk/Hvi9JVZn7BVK+rW+pIjxFa/Ym8XA8TkYViitp9hf4nPxOdtWR2Au7Ht
 zp2ysSUjkO4LLR2VNa5S15oCpge8ozpVeqo358PaXSoJwaHb4gTG77ZAR96P5EgNf6YHSQlz2au
 zjstzFnOZf8Ck1SbTAgKsLLmP/vGZSspB0u2PJnRtZDXEaTg/xt9HWxwYgvoBfEI0IpweBCnwtx
 SIwBwzT00KDweQ9WfOey2ShV1JhwIYkVRbKNW6gaWx0yMtCQm5apn+NKUjeLd7mxGS6Yp7quWzz
 Gy0auZY+bqhNh5JA=
X-Received: by 2002:a05:6820:198d:b0:611:e30a:fa1c with SMTP id
 006d021491bc7-61200f7034bmr2463789eaf.1.1751480110083; 
 Wed, 02 Jul 2025 11:15:10 -0700 (PDT)
Received: from [10.225.72.227] ([187.210.107.189])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-611b85c84afsm1777352eaf.40.2025.07.02.11.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 11:15:09 -0700 (PDT)
Message-ID: <78bb2fc1-bdd5-43b1-83a8-b4e3a37d1825@linaro.org>
Date: Wed, 2 Jul 2025 12:15:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] target/arm: Disable FEAT_F64MM if maximum SVE
 vector size too small
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-7-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250702122213.758588-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hLC5fBueUA9G

On 7/2/25 06:22, Richard Henderson wrote:
> All F64MM instructions operate on a 256-bit vector.
> If only 128-bit vectors is supported by the cpu,
> then the cpu cannot enable F64MM.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu64.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Ho hum.  The idregs reorg landed overnight.  I will update my branch, but will not re-post 
right away.


r~

> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 200da1c489..c5c289eadf 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -237,6 +237,12 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>       /* From now on sve_max_vq is the actual maximum supported length. */
>       cpu->sve_max_vq = max_vq;
>       cpu->sve_vq.map = vq_map;
> +
> +    /* FEAT_F64MM requires the existence of a 256-bit vector size. */
> +    if (max_vq < 2) {
> +        cpu->isar.id_aa64zfr0 = FIELD_DP64(cpu->isar.id_aa64zfr0,
> +                                           ID_AA64ZFR0, F64MM, 0);
> +    }
>   }
>   
>   /*


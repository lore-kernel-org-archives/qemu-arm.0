Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1205807ejc;
        Wed, 27 Dec 2023 14:50:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMVWyms1k+amQjUK054uZqhOGaZq0CG4OEvUYnt97DXjfbIjGyUMbQpOSFXlf8s0xpfJzr
X-Received: by 2002:a9d:7d9a:0:b0:6dc:409:e7d6 with SMTP id j26-20020a9d7d9a000000b006dc0409e7d6mr1313244otn.30.1703717459227;
        Wed, 27 Dec 2023 14:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703717459; cv=none;
        d=google.com; s=arc-20160816;
        b=iZ3+3rHxgXrDXwyM2ErL7FlyPyioQ1FeT50ArT3HsRC7CLu1OYWqK/1xdE7hsSl618
         9I9KEinjkVrRhlwn/MF0OCanm4Y8p0MRfxIU6fj4AocZLe+cXqGWWQRfMcc9MwJv1tZZ
         b8l0vB4kbyil945Uz7GA3pZXiZQjPHN+HJfzspHabQfpgJgvRO1/Vj656oosiFOEenFv
         6DJz141aqr78WiZ4YNgJKePRShY4rBH350T/35HL9MP/+XbUKL2p8yKfWVbDsmPHfI30
         BPdYjYHSQyirGHVdQVndtivLxKRjzeaXnUjJ9+a7hGiqf6axOUoh8a/yEfE/7TNvOuPo
         qphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=fEL79n9ZmuWhwsfPl6PWa+JiwghQnUA1nQdTsB2o+ao=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=DaiVyObvgfxSOJjFr+emihqW3i1SHBvBl/vgpgpkpng4Rt5a76furPNNGrNjs/mpCs
         utGqq1oj1OINW+YqPfCHC17/c4fuDHJM+Agsl5evMGALDkY/v10t50ksE2UINaRVHy/J
         Vw1OXRj81vR/oWb7Gqal73dbdje8SJ5F0EM8FMFu6xR2gXDUO0PpQw8IoDGoI8DhliKO
         bdnro3PESGsVhMIodVcfRogSrBGSacMyjPCiYUnTxIgIJw2LXqS7tn7EARzB6Zb3g2wc
         uegHaxJe5dWrhDkmUKA5nggnY/1yhzad2MPm05h04JOU8s1vp32wGg/Ty+9okwa77Rkr
         0pPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGmeI+ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a05622a190800b004278594181csi15708291qtc.149.2023.12.27.14.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGmeI+ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcjW-00018R-3L; Wed, 27 Dec 2023 17:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcjS-00017z-G7
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:50:34 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcjP-0001VC-Un
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:50:33 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5cdfed46372so2828875a12.3
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703717430; x=1704322230; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fEL79n9ZmuWhwsfPl6PWa+JiwghQnUA1nQdTsB2o+ao=;
 b=pGmeI+ZQhJeGRyIlIiXJFnW+FaUp9brAyh3pV2Aou0CenYBDhzMjdWTNGWe41A4wAM
 zPN7nOv5ZqnH1ZOqNIW2D51+D5DiHftRQhdW8of1WuoZh7HH/WWhmVntquRCxNe7dz0A
 4GoCSCaJEvBH8FMeXL1hHqnSa9XDoYjRLtvhoc2lBVtXbQv/25WSqXFT4Udr+t0VmFOm
 EghZ4YkGC21aYOTeEFdoFTP5L55vAv/gyM6EvoXJI+Wmu4XNcZWrxIfJP12XF923wawC
 R8mEHvc7Q5IqyTeDBlG3bVc91XFsBj8P+C8EbhcpYvad8nTZVpUbZws0mnx+GDf4UExQ
 k1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703717430; x=1704322230;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fEL79n9ZmuWhwsfPl6PWa+JiwghQnUA1nQdTsB2o+ao=;
 b=q1cE+f/oMUJTQ5j0Jk/6cubCkEjNNqqnye2umPtgLyOJAOMCaj/L3bVb+k2sM+2E2k
 GXHXmVQiItm1J0FkuJIS1UkfTrfd9QtJZZ/YDknsiZ7arXwdxbBklguMvBGIYyxmC0Rp
 9H/cKdXKaDwwzbMXcehx5++w1KRwtSqS0vkINiR0EjWtdvkOn5um8PILIBQDF642gbX5
 mYBmwcuCQTdniBpaPoHbUK/I7ulRHnZsR2vlHpXNUduCfja0JN3qj2hElLZvn6/hi090
 L0fe2rrGcGSzCJ9PpfhWv1ZNy6Qq1HQAOJtpsmDxBKF0iLSxyKTt9JqJMjzxFWkBRXwR
 Xv9Q==
X-Gm-Message-State: AOJu0Yx5vzxBQxmGE7NCtFOVnF8WON65ojFobr7t/0/iW+NDX5OAkkwd
 w/V69VaGhhguuZWhefyX17nHTEATdxtL1w==
X-Received: by 2002:a05:6a20:72a4:b0:196:38bf:a238 with SMTP id
 o36-20020a056a2072a400b0019638bfa238mr1135890pzk.51.1703717430491; 
 Wed, 27 Dec 2023 14:50:30 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa784cb000000b006d9667206bdsm6801175pfn.90.2023.12.27.14.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:50:30 -0800 (PST)
Message-ID: <34263e7c-1419-4680-89ef-dd4fd28c1a88@linaro.org>
Date: Thu, 28 Dec 2023 09:50:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/35] target/arm: Always use arm_pan_enabled() when
 checking if PAN is enabled
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: ccsNznA5dKPd

On 12/18/23 22:32, Peter Maydell wrote:
> Currently the code in target/arm/helper.c mostly checks the PAN bits
> in env->pstate or env->uncached_cpsr directly when it wants to know
> if PAN is enabled, because in most callsites we know whether we are
> in AArch64 or AArch32. We do have an arm_pan_enabled() function, but
> we only use it in a few places where the code might run in either an
> AArch32 or AArch64 context.
> 
> For FEAT_NV, when HCR_EL2.{NV,NV1} is {1,1} PAN is always disabled
> even when the PSTATE.PAN bit is set, the "is PAN enabled" test
> becomes more complicated. Make all places that check for PAN use
> arm_pan_enabled(), so we have a place to put the FEAT_NV test.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3270fb11049..4b0e46cfaae 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -263,6 +263,15 @@ void init_cpreg_list(ARMCPU *cpu)
>       g_list_free(keys);
>   }
>   
> +static bool arm_pan_enabled(CPUARMState *env)
> +{
> +    if (is_a64(env)) {
> +        return env->pstate & PSTATE_PAN;
> +    } else {
> +        return env->uncached_cpsr & CPSR_PAN;
> +    }
> +}

Worth splitting out helpers aa{32,64}_pan_enabled to avoid the is_a64 check when context 
dictates?

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

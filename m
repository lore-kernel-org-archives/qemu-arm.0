Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1601938ejb;
        Thu, 7 Dec 2023 05:19:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKDxllCYGcnnjm63u0RTE6bcdLq1GUPreOZ4sOD2Z1aQPA0DKEtehRGEfZJvCg/ri8iJcT
X-Received: by 2002:ac8:59d2:0:b0:41e:3e18:e09c with SMTP id f18-20020ac859d2000000b0041e3e18e09cmr3109996qtf.67.1701955171480;
        Thu, 07 Dec 2023 05:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701955171; cv=none;
        d=google.com; s=arc-20160816;
        b=X/4zlcdod8JFEA2BbmHyoQ1QQVoKQ3DpT17ssWJyNcCkqf7xcx1adtvHJbuxch4reH
         zqXlFCPr/G+X2K7KhZIQo4il5FToFmQ18A1IxoB0Ppz0TRm9eEuFIoJm7bNr4uWJxwlH
         BEwdlx31moJhALSnjhBLoyEEvVxxjaltPtTvtEg0NSqeh5IcIvupn39BmRUs3D0s4+t2
         fB0aNjhNU51wNAEtMTu1JbR+5jFFsfYuGoaiHvGhVuWMVsCeoN7hLhb3RL7mOxHex1Um
         6P69R/fW3Tne6tN2DX65ouXf17JRAeiu6CrzVQiDkj4W+UVkBiB9TZKxlOMwa2RO+X0k
         FfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jPWOtTbC9oR51+1Yhc537X/W8/M6ju4cczQ+/UnMd8Y=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=RhCYjpMhCdS4P+RIGsRMs9x9fVVXqgGNM44E5mh3OZl0UiKgHtCgqwJOCKFz3ZNoTU
         HGu9SRtUx4XoPmVe/eoPonM8zLyVPYoowjpa6l+jEE6RJed5Rhqr7OTcgLBkdSONXWco
         S0hQ3Qh8w75T5/5c9s2Vfyomvq+W4a+DN9GhkYiILPoSgVvSjkfFE36PwiOuTLAxXWJx
         iv5F5PtOXdjY8g2zSSqGF/fkXJFlWkLT6Y/YcE2XN+nglV4BXPbiGAKGL3rEhcq6pA0w
         yk7/mbEC31HCQ1CGUtnDeGnaxlkJsJIAiCGB98vPfMDKpIrJCU7LhU4bw1++aEwug8ek
         18yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YoQYYlVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ir4-20020a05622a6dc400b004258262fde2si1233961qtb.119.2023.12.07.05.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 05:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YoQYYlVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBEHi-0000lt-6n; Thu, 07 Dec 2023 08:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBEHg-0000lA-8I
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 08:19:20 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBEHe-000820-Lo
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 08:19:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso9724855e9.1
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 05:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701955155; x=1702559955; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jPWOtTbC9oR51+1Yhc537X/W8/M6ju4cczQ+/UnMd8Y=;
 b=YoQYYlVbO/MOqetLVVXqR2o/Bbbzbpmxxql7q4FmVpmHDmoz01RLHGJhrefTQHHNQg
 kj4qMb/UsUFGSTB19fgFQ4Mgw1DBGJDq8XvQKf78amkrkny5OOIX4vXqpPDlQ2q0od41
 zjRgyxZZ5pYvvQKFzVev8PFuvjVOkQxatHJB9Zi2uxuOuqgift4y8qnGx0RZhWlpmY1w
 kr9RphKofboKTh604bR8E7/Cyb/HSAlKhiZXORd6BIzbLi99LZoub3KB5ryghf/dYmqn
 yHmSlkbBjX8I4t9zgblV4diqvbCb6rXboIoGuMrRRmhqDweA7ehRsnxvs6tlbu3cF2va
 shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701955155; x=1702559955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jPWOtTbC9oR51+1Yhc537X/W8/M6ju4cczQ+/UnMd8Y=;
 b=ny3ibsXJ+c7uj3Ryt3c28jYaWVbupJSNgHoyACye4uNMolJ+BDbR0nwYCsa0JBYmO4
 1k5+EfCk3quHki9NZ2Jc1Bup0N0vd2lG8rVHJgun+J/+M3Er4KUS+PujrRtWr0hL6vaD
 ARu84RNGl5R3Gq9G5OnLRig6FzEnT6L4HU/pxIhMNGQOOEERZamx0O+5gwtX0IWOSNvo
 yVLNR8Cnxmeoyyrz5aL8bGmKWBrFnyEuZsIc/stCtva6N10lCAzjRET2vIeoDkVkzbRa
 w/CM+CFvflRGzS2KtWL3EzP2A+t6RNQlOFfv1E3kgUHaf5DUZ4bBo3i2uZ7N1T3ddQmZ
 mXSA==
X-Gm-Message-State: AOJu0YwMgI3XfsSkBkMFGJXPI8eZ8JggT/bWkqbiYdJCnSv5QgYfTh/P
 E5FGkGww8VYsz/Hmp/YD4ntCDw==
X-Received: by 2002:a05:600c:3647:b0:40b:5e21:d35b with SMTP id
 y7-20020a05600c364700b0040b5e21d35bmr1684216wmq.100.1701955155314; 
 Thu, 07 Dec 2023 05:19:15 -0800 (PST)
Received: from [192.168.69.100] ([176.187.202.111])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b0040b4b66110csm1891309wmo.22.2023.12.07.05.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 05:19:14 -0800 (PST)
Message-ID: <461b2494-cc2e-4d0e-bcc0-8dcf93389eb4@linaro.org>
Date: Thu, 7 Dec 2023 14:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Restrict ARM_FEATURE_PMU to system emulation
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20231207111048.50568-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231207111048.50568-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: N/Fp3fXH3DUy

On 7/12/23 12:10, Philippe Mathieu-Daudé wrote:
> ARM Performance Monitor Unit is not reachable from user
> emulation, restrict it to system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 51f57fd5b4..60cf747fd6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1410,6 +1410,7 @@ static Property arm_cpu_pmsav7_dregion_property =
>                                              pmsav7_dregion,
>                                              qdev_prop_uint32, uint32_t);
>   
> +#ifndef CONFIG_USER_ONLY
>   static bool arm_get_pmu(Object *obj, Error **errp)
>   {
>       ARMCPU *cpu = ARM_CPU(obj);
> @@ -1432,6 +1433,7 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
>       }
>       cpu->has_pmu = value;
>   }
> +#endif
>   
>   unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
>   {
> @@ -1592,12 +1594,12 @@ void arm_cpu_post_init(Object *obj)
>       if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
>           qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property);
>       }
> -#endif
>   
>       if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>           cpu->has_pmu = true;
>           object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
>       }
> +#endif

I think this patch is incomplete: should the PMU registers in
v7_cp_reginfo[] be restricted to TCG?

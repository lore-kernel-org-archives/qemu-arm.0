Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp700276eja;
        Thu, 29 Feb 2024 14:43:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX89yB5MyZEi7U4eb2abEtCHpKe4/7bR1jFDpjZDIT3TksXC3NFGR0CVwaCqOS/KBwBr2n+rqRL8pLKPfLjyut+1ru0Z3av
X-Google-Smtp-Source: AGHT+IHEPouKvOcsH3fk6jg/+cd3neooalEWrs0FdrmQ/PAnFMCUfzB+86QzvqI8oAdyspoPjyz5
X-Received: by 2002:a05:620a:3712:b0:787:f8fe:6608 with SMTP id de18-20020a05620a371200b00787f8fe6608mr4116751qkb.49.1709246603039;
        Thu, 29 Feb 2024 14:43:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709246603; cv=none;
        d=google.com; s=arc-20160816;
        b=pbZwQpSNgajW4/aMbD1vitYyRxhQb+vhQQliiVNIgcYqesCPjSIFpWtn29SrvEd/zS
         q78pAZQYR10CbYHeQNaj465gOiJEFmIP5NCIdD1LQ3jdaUIZnoDMFizV+eQLCmsW4PBF
         xuYvlW+RQzWvcoppZVNmQUHdrfHuOtzDXyw33s2Gyta+r753Ml64CzRs4joM67sv3aIL
         G4FLtkFoHlhEYKLPS2Oj/BZN4/xU79xMZ+O6EA26bQLwb9TTWGhSSUlTL6xrc/x92kJF
         jLEyNeJ+GL+NgxZMZXv49U1rGIHQl5UJGkhczr8betZJn9T2h81QsuPtaU3CPwCKO8+c
         9XrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3ETVhg8Ne398brIPeThJ2esYVmViUwVa64/zKryTlTc=;
        fh=TivXzWYTy9CTzqm+pKybDkMr7hmC4W543fDiomuligg=;
        b=R4sC0AkBmK7abB4sAOB+bjDYWP4a/LwVVCebZwhj0301BTX9h0BJ+PZzIqLN0fRsiC
         Sd8gSYlSN6PC6FXK2WYfQ1g3HpkzlY8msmFHH/zVtO5zDmDWuFTnEs9KFvTdy/9QJ1gX
         Z4zG1BZ1iCA+9VvQCL9qj7+lZnGH82ROwJeDCImGYPn4RWLrSIxMQL0RfCkjMnO/esZ0
         R/edrK3Tk4Cb0ywUmRAORfgZhJvicjzv990etgNLKufZlxf7uoWkEH2ydzO3meEFlLiY
         SwkrY+peL90bEhNoIgvKA9ntjJO04USKK1Z0X3zpzDVSTfr7mCfQdeFu1uzSFZhFX8Ku
         VBDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeWBAUd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9-20020a05620a22a900b00787c780438asi2279241qkh.91.2024.02.29.14.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 14:43:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeWBAUd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfp7Q-0003an-WF; Thu, 29 Feb 2024 17:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfp7D-0003Z7-Sr
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 17:43:01 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfp7B-00023s-MT
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 17:42:59 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d94b222a3aso16139275ad.2
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 14:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709246573; x=1709851373; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ETVhg8Ne398brIPeThJ2esYVmViUwVa64/zKryTlTc=;
 b=XeWBAUd9dWA1TfKZEdK3QG4VFHteVOePRWh+lVbxpauKbrB/TFnoC4gpT15C3QBUGW
 SLpJ1vUfLNsEtO6vdQry9Fm4fkKXv3EVz7Y/Szk/PpIBMnbK95oNHTGfFdaIx9++Ovfe
 /g4FOSE4D4aDY+7NStr0n0p/AWgJSXuR6YwGBVpP72sUR1Ats7oRuU5Ze/bFago2Pl20
 sO+w7opvR0tvnYTlKZSuHsmKPLGGrAykDzJUAB34UWUY8kH18Z2uonfp9g7HqWfmYhIy
 94oI1KNcsl3Xl8bKdrFZRwE42JJiO7fjDPgaDFYOHfT1fZgV6BBH021BzK483Mvqx5v+
 FYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709246573; x=1709851373;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ETVhg8Ne398brIPeThJ2esYVmViUwVa64/zKryTlTc=;
 b=D91O3R0xZRZ+Z6DFgyu6buvlToLw/Y/vteIDbAFLq0Bwg88ngH9WEmABQ1nqdME1a6
 1C/Ps9ma1Bk2yOV3dEGbR8OPi3hA+emsxnefyfRWmZKgnTU3FCQK0TaZbG2T2F9FZ05D
 R2XcPzl/grtMe21I0c8K89As7yZrkv8dRDy/jTR0V13oesiY1kN6K4NiJlprQNCdUALM
 nTW59U9eRGW2/X4gOjvLxPG1ldah/5MPKRHvDgwbjwKVg/jNuPJrtm/rwPyLLoQ0rNZq
 pvQGoLJDpnGue5JFPomPuYNjl673HlFbAq/32r5VgOaBxkSEvosZ/cE7gn3XR4VN23pO
 2Vcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyCZW+r9ZP3saMExfr6w5C7fE8STB77hpqg2Fs0J2McyLa/+YRY3c9MqvUvo43zKKUgNfgx1IkGb4ULm4Wn6w9yngJ
X-Gm-Message-State: AOJu0Yyz4OB1iLrG3MefQ0SWGZ/HdrkHysClNJukfr8PRwwhSLdlTVFz
 PsCQzu0GdDs/FOIl2ORR9/udDm1CuZXlAp8sFadke2FwSEYbz7RpNZ1HkuqFYPU=
X-Received: by 2002:a17:903:1104:b0:1db:a55b:617e with SMTP id
 n4-20020a170903110400b001dba55b617emr4558721plh.39.1709246573516; 
 Thu, 29 Feb 2024 14:42:53 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 k23-20020a170902ba9700b001da105d6a83sm2016463pls.224.2024.02.29.14.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 14:42:53 -0800 (PST)
Message-ID: <fce60803-ac84-4b8c-af04-65c382ae1fec@linaro.org>
Date: Thu, 29 Feb 2024 12:42:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 06/22] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-7-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: DxMemwa7UuHu

On 2/29/24 03:10, Jinjie Ruan via wrote:
> @@ -900,6 +945,31 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
>       }
>   }
>   
> +void arm_cpu_update_vnmi(ARMCPU *cpu)
> +{
> +    /*
> +     * Update the interrupt level for VNMI, which is the logical OR of
> +     * the HCRX_EL2.VINMI or HCRX_EL2.VFNMI bit and the input line level from
> +     * the GIC.
> +     */
> +    CPUARMState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +
> +    bool new_state = ((env->cp15.hcr_el2 & HCR_VI) &&
> +                      (env->cp15.hcrx_el2 & HCRX_VINMI)) ||
> +                     ((env->cp15.hcr_el2 & HCR_VF) &&
> +                      (env->cp15.hcrx_el2 & HCRX_VFNMI)) ||

Need to use arm_hcr_el2_eff and arm_hcrx_el2_eff.  I see this is an existing error from 
the other functions too.

> +        (env->irq_line_state & CPU_INTERRUPT_VNMI);
> +
> +    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VNMI) != 0)) {
> +        if (new_state) {
> +            cpu_interrupt(cs, CPU_INTERRUPT_VNMI);
> +        } else {
> +            cpu_reset_interrupt(cs, CPU_INTERRUPT_VNMI);
> +        }
> +    }
> +}

This is incomplete, as you need additional changes within the other two functions to not 
raise IRQ when VINMI is set, etc.


r~

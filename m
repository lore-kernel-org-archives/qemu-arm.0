Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2175935ejb;
        Wed, 21 Feb 2024 13:23:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsIndDm7YlmxMNIE2flJKFkPskF56TW3n0MVQ/I8hEmce55mE8ZEcA6/j2JdPjIUthmAFEc4/WYoy2Zkr8h1aKmE/x6UeO
X-Google-Smtp-Source: AGHT+IGStRnVXW+eEWztSPe17uUedUWii1RVzUfDRc7DD5tuyDoRJ6VuzGcpxP0FXr4cfsrTcc5w
X-Received: by 2002:a05:6808:14d4:b0:3c1:5df1:577d with SMTP id f20-20020a05680814d400b003c15df1577dmr11008823oiw.7.1708550627839;
        Wed, 21 Feb 2024 13:23:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550627; cv=none;
        d=google.com; s=arc-20160816;
        b=DTVgrsqRxKiQFU9/gFDPMUFrXP3aANTewmEtUQjS8n/PL1crIhNp64f8J+R3NE5RmH
         cNBuaOIChQTXhlBW70Q8DTIhHUS1vHCd3rPDW6gzC84O+1RHJLPOJf/Ee0GxncALNZ8v
         ClGJmu3OEL+nz6qRG4hfvAUXuYTLvVqfzWew3Fw+aWQChIn+5yy7G61N4CVIaImAx+2X
         B0CRqr5AzTKUROerXA7903a5ubDo9luaIGCAaZlWbTdATuSNGLQkXHJg2phQ6ArSyxXA
         UOIHHty/FUfcygt1jdUnwErG+ygZOhF9ybOmHZfHsTBqj3bO5e5lpNX47CXjzHwqTnMM
         rAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hA9wk4DDRs8mMwqVKgtTFnwG6tFmZJmKv/wHSsyAkpA=;
        fh=kdDjj2272yf7ADt+wsbBtDQ51rScM/WCioZypQFtmO0=;
        b=0WCzQEWbmioWMJvwqXAsXZ7FUE/HYqJpHnKF2vtwTP3GTJh6dUqOoZBagnoMkjRkKR
         O2PKaQGnzYktNv71asb7DSZkEpnSwIm79rYjua45LFmPpF4Xqs+opF/USkFv8L5PXMFh
         eBk91IqguJJMqxOXH09dusc7NtiPpS2W04mRMcZ9jB3XHdO3RapO41bH4Db0KUibbv4R
         TB/1CGpKJyswbhz2PWLRftWCwwuR0VNdLKuEGcD56tNTUt4yCgMb/sq3s7m1TLpkfISj
         77w5WqG6Vx8Vc8q+PXFNvxfGPPmKPUkalJtclefDpPq975OQTh2YtYuRm2d0RotC5Ic1
         GVWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9GgTTKn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd24-20020a05622a269800b0042c38359742si10839035qtb.271.2024.02.21.13.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:23:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9GgTTKn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcu3t-0003NJ-Rv; Wed, 21 Feb 2024 16:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcu3r-0002zU-LE
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 16:23:27 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcu3p-0002ZP-Ks
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 16:23:27 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d94b222a3aso10440245ad.2
 for <qemu-devel@nongnu.org>; Wed, 21 Feb 2024 13:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550604; x=1709155404; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hA9wk4DDRs8mMwqVKgtTFnwG6tFmZJmKv/wHSsyAkpA=;
 b=R9GgTTKnxC1KVq+Uy3kZMCHdJS7RTRlkmfKvXeFHrFAVkWDUht0XbQLy3DOUyVbDKe
 +za6LOSewGMy9NQ47trEHNiUdTo04KC/8OYLaG35KSlNt8w3blP7MLC0+ZN1h9EwKQpi
 qLYhC2NknctCRU5rms1bIPPaItLhS/Hql1sUcQKzBDKjHUsqF5k8BQmnDmq5ZsI8GT3C
 YcW+WV4WjQ019s3Sfxp9rxYYDCkBBF9B0JFDj1YSiX9W11Ll7JVrqcwwySYRkNQ3+AON
 D0yO96kJEQVNT83MLX2zEeppqs2/IJtyQsMnZ8RxBh/0Z/de8AI/WSQxtrPPfHaCg4zw
 9fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550604; x=1709155404;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hA9wk4DDRs8mMwqVKgtTFnwG6tFmZJmKv/wHSsyAkpA=;
 b=Iyj1GuXj+p+mpKIK/uusZEK/4bWAd7UoPwUbUupK6lmxsnDhmU9aaxiXAYmtrjK1FY
 tiudG+vxvS0cBe3lBVVIiolE9FJwee2bgYr/00ZoT34eDjpRlTSL87MKn6p2hm7OrQ19
 ZaKWkyw6BDtIo/tx6udrdWZmSiOJcs1+VcLEP71udezq4eNaQImf6t/WeNVx+P21TqTs
 MiCZoGIpsiOp5QEggkmOoGigeurUfxg9tXQudLkZe1T3Uoytfqep82aKEtVa6JAceFy0
 SedKAjmrCfFxDJ9cj6VtBcSxdfjfP7Fo3sD/6AqPJgsefUO4/CNWaxeqIOvI/UIPJ2VK
 6Xyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgxYWDiZppUED4nZLhs9KAQiNXQma/gCXE90yjsCRO7m8NnPsqoeE5QS93nnCM43RkvlfmMfIhl4Kqy9kpzX23S1Y6xwA=
X-Gm-Message-State: AOJu0YxYqXIl0lwBfflXYfI03SOZhwT1SoY09TFlF6Q5bxAZhid7RWQF
 mG/qgspeDl8IkH+nznwLJDfADHz76JCwuAJxhYF+2zj38u1absBjmL2fVtAuvIk=
X-Received: by 2002:a17:90a:6581:b0:299:2d54:52af with SMTP id
 k1-20020a17090a658100b002992d5452afmr16100531pjj.18.1708550603963; 
 Wed, 21 Feb 2024 13:23:23 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 pt5-20020a17090b3d0500b002994f848bc9sm2342212pjb.43.2024.02.21.13.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:23:23 -0800 (PST)
Message-ID: <2e1ad5a4-b706-44a9-b686-6ddeb41722e2@linaro.org>
Date: Wed, 21 Feb 2024 11:23:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/22] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-7-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 0P+LNLLPm6nn

On 2/21/24 03:08, Jinjie Ruan via wrote:
> This only implements the external delivery method via the GICv3.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/cpu-qom.h |  3 ++-
>   target/arm/cpu.c     | 39 ++++++++++++++++++++++++++++++++++-----
>   target/arm/cpu.h     |  2 ++
>   target/arm/helper.c  |  1 +
>   4 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 8e032691db..66d555a605 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -36,11 +36,12 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
>   #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>   #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>   
> -/* Meanings of the ARMCPU object's four inbound GPIO lines */
> +/* Meanings of the ARMCPU object's five inbound GPIO lines */
>   #define ARM_CPU_IRQ 0
>   #define ARM_CPU_FIQ 1
>   #define ARM_CPU_VIRQ 2
>   #define ARM_CPU_VFIQ 3
> +#define ARM_CPU_NMI 4

You need a 6th GPIO for vNMI.


r~

Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp801880ejf;
        Fri, 23 Feb 2024 12:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVpGLGnUa7GUAibfQi5wwhOHFKlFOi9nhcNr5pz6Suc/MN9f/nb3YX8naqY2D4+438IMFQqYc0pFWhgtjyDBu/9Stb6KtOr
X-Google-Smtp-Source: AGHT+IEdrGvPhb0R8xxQ0fizkNj1ayaU9K2mDlWJMD5JVQmgWeymQaH8F6ZVCZEWIBonc0AK2daR
X-Received: by 2002:ac8:5b84:0:b0:42e:5ae3:2cbd with SMTP id a4-20020ac85b84000000b0042e5ae32cbdmr282593qta.59.1708720469089;
        Fri, 23 Feb 2024 12:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708720469; cv=none;
        d=google.com; s=arc-20160816;
        b=cnExtoVCdA3W32TQPRKFsrvJtZqc8TWGJ2eeddq/VosBy1fCFL5dNzRUgaEFiZWCwL
         4owsY+40nB0rVimtBPqIc03PEOnHYtv0ZMa/PwKTbify8Z8HpBazkZW4hdQsIldHhzSP
         HlbEkDZvO3ERG3Q4wSmbIRYgWSWPIsr/24tgjjY1VF78YaWY55OvoupyQbUN9evszWRK
         xkg4MNGmMSHvhqFp08H2U/YLJDRmWHvGKBUrhRM3gAVKwFu34YlNeO8VYNiB/sml37r4
         l9dIe1gAl/KpYxB/eqosQpY4Op7Vlppjbwqx2kyKB6atDQLPOxQbqk17l2cBctTkvCGA
         6Lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=BSKus13F2QZ/NOGwIn/uNhTJoGgg1VTqL9wjKKBLFMw=;
        fh=cjGSsAsKwIlVnU9jZRV0xQnqFwgXqV7NC3qHkHMy5ys=;
        b=C/t61W8l9MUprvXXDHCR7sAJgiS7Hso1vFCPpk1c9UXL18digP+kciD/5OgjPNw3E0
         mn+f8WVp+BLevw8twTqR64I8fTu4jHaygrgnedBXbvQvwhbg1685Yeaqnj5+3EJCCcL+
         Wy8prsYtrk0a74uV5p4QJFbxY7epI9urLPAIKOcTnIhir7y9jLweLUfuR39G8gQh4f9x
         pZIdC1eXITw+he3bsBRCOLpSQCkLU+KHRFDYFnahWZWdv5CGsdyQGTUGj9P0rwHoTny5
         Bp7xhvf2U7bJ4E4zHaSkVg+5sPE95RcJ66gaM4wyB/NG5KFlBTCzHSuxVY3auvnetfVe
         u1gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDynX55o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05622a005000b0042dfd040b70si15679648qtw.110.2024.02.23.12.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 12:34:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDynX55o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdcFI-000083-Pt; Fri, 23 Feb 2024 15:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbnm-0002rd-36
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 15:05:47 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbne-0003KC-Va
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 15:05:45 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5ce9555d42eso1020101a12.2
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708718735; x=1709323535; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BSKus13F2QZ/NOGwIn/uNhTJoGgg1VTqL9wjKKBLFMw=;
 b=iDynX55om2oKaMSOunDExk+uwe/NtFJP+gVraFjq3am4SI1W3kebBZlJGqIOVXZr3z
 dcA+1MhhslR4f79VN4BjWEImfxs1LYQ6dE2A9s/9t+n4PNY0CYfl43waIoYFEtGtMoh/
 pQmZLK5GAMXp13UUGg/WZ512bh2tMEztDhz1pM0FJbmF66mIdTAHkdhN63+arF42xGAo
 WThVIBPmoMsuhVziIhkpwYpb1cs306YYGk0k8b2dYEVT2W4ANxcCwPXjlKSAZpJrXAzz
 J14sNJ9LSKradg7V49b5goeSCwrlPL1eJymSSAdwoSHAUGoSrSEUDiHMaPoMkZ7ZCqUr
 vRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708718735; x=1709323535;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BSKus13F2QZ/NOGwIn/uNhTJoGgg1VTqL9wjKKBLFMw=;
 b=Te+SYqKBflQW4wz6jRsOTU+rPeup/o8WuhUb8t0M0yoSUFTtJLUqlXR5L87Wc/Yd0y
 YvgkI3caUG+cv9jp3YHvoN/b5AxOtZfXqPmF8uklBHjCxclnWqkaVpUPx+PzW+uXXZ8y
 5KBh0Qo8Wy1NTqKYBQPI1yChCGa4MG6AHt94dmEXh05QlQb/i63XsHnN9YDcVR/quoxq
 7h4E9os5AdiSTadUF7KT8QEuQr+F1R1/uBQCeMaqBfa/NXGsEG3w8e1nAHMWV2MTbvkk
 MsY32PvOiwias8v2iYa/QuZjPAsbSGzk0leAESOohCXLJeHPBFXnsfylBE/bL+F/eSV8
 6O3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDxhlCBglKYOl7EY7QAxBuMAardz/uC8SWkt3yR/8oPavgzAw+pFObhVoQm8v/1mqG+205uJlRTw8Z9uLgJqqdW9RB
X-Gm-Message-State: AOJu0YzoC1OGvoIcVU0HCBRRzTamJNFX/bB5ztmFmsjtwOCwmG1Ql7Yl
 HDuQW8xezAfnuf1hxncmHBNdScTlyv+iDgyX5cWREb52lc50FR2mEBBvXIhVV1M=
X-Received: by 2002:a17:90b:48c6:b0:299:592a:7d19 with SMTP id
 li6-20020a17090b48c600b00299592a7d19mr873040pjb.3.1708718735210; 
 Fri, 23 Feb 2024 12:05:35 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 lj10-20020a17090b344a00b00298ca46547fsm1885987pjb.36.2024.02.23.12.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 12:05:34 -0800 (PST)
Message-ID: <b92a47ca-bb2d-40d5-8356-e554327a76e5@linaro.org>
Date: Fri, 23 Feb 2024 10:05:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 08/21] target/arm: Handle IS/FS in ISR_EL1 for NMI
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-9-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: esoSmKTZ8458

On 2/23/24 00:32, Jinjie Ruan via wrote:
> Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI, both
> CPSR_I and ISR_IS must be set.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> --
> v3:
> - CPU_INTERRUPT_NMI do not set FIQ, so remove it.
> - With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.
> ---
>   target/arm/cpu.h    | 2 ++
>   target/arm/helper.c | 5 +++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b23be7fc24..ae9a75d717 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1476,6 +1476,8 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
>   #define CPSR_N (1U << 31)
>   #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
>   #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
> +#define ISR_FS (1U << 9)
> +#define ISR_IS (1U << 10)
>   
>   #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
>   #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2f54413b01..eb97ce0356 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2022,6 +2022,11 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>           if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
>               ret |= CPSR_I;
>           }
> +
> +        if (cs->interrupt_request & CPU_INTERRUPT_NMI) {
> +            ret |= ISR_IS;
> +            ret |= CPSR_I;
> +        }
>       }

Need to handle CPU_INTERRUPT_VNMI (which can be raised from the GIC).

Need to handle HCRX_EL2.VFNMI with CPU_INTERRUPT_VFIQ (which cannot be raised from the 
GIC, so we can determine VFIQ superpriority based solely on the cpu state).


r~

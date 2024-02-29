Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp711997eja;
        Thu, 29 Feb 2024 15:09:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfIsDj+PocXtUYKr6p7qL7bh9KZhydxzoQlNCMKZXSXN14+BRSNqKUBqZyrBxEeS8nGYT1w7+fq4xT/gu5LcfsTibUtF0K
X-Google-Smtp-Source: AGHT+IElQ45ktdb8HfPVQaaiVrdqyJjty0UPpDdrSzo4twxgvBpYSsrqSb8Y0roNdiWruTfrVPGr
X-Received: by 2002:ac8:7f8d:0:b0:42e:7e8e:8d06 with SMTP id z13-20020ac87f8d000000b0042e7e8e8d06mr3719254qtj.54.1709248173565;
        Thu, 29 Feb 2024 15:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709248173; cv=none;
        d=google.com; s=arc-20160816;
        b=BwC4ZpsL1L95HxyXOw1u4GxnQdFV2uChzUkKlE2+MKyDIBr4/oUhp/o6zsojJJOPZe
         OmRzTFnVycHzp6j+k7SBYpl2G/MIJmsr55fmWj2EFjHo3YfNCwxruXNuPNrnzICev/uR
         e0UWVmi82bmWMyPObAqOuhBVH3t/jA799bHrqWf8OR9/gbINivGmZBL9srtK2KTEb/N2
         sbNBqExF8Ym7jZBXVg66QH8Ffu+0NijGGBrWqE6/dBXLEB2ZMyHg9yRqZyi5TFsWfwkF
         6w0Zfvr7WKtPKpB0dgjO3b0aUkcKRfaUxp5eiaCuG6N/+VklCd1u64ArqO/a9nGySr39
         2qxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=q4Zks7rS4NPMc826tI+OvfXrAECpt++NHSHMSdDgNRw=;
        fh=XwsQoPKazNfdqhKkgvYjrzEg0u0LZRFRaotGV+f3jjQ=;
        b=rijYFSP3hLdPOY+zKZLAgsKhLFeW1F82XlBsaJBZUhQYahwZeOn1OG2IeF5Okv14y9
         18TzHAoHeeMhKh0ZgI8HkX9g8X2D84CSI6ZjSPDllG88Ad0VXgB2cR+Qc2I/DaEgPOFV
         pP4sMfN8OrT+6GJE1PaJcLrwg8rSU52R7Cm0o1LUyFRzfCCq7wax91nj9rELpHvfuczO
         Q75kfCh8wAXUQXPW0TQVGmUy3p2eAlzwjWdROn17uvO/J3NiLQkGCfbxxKktb5PNPoS/
         GLDamx1Phapii0ykggK8O6kWur/HtEto/IbWdpfLPuuiPOWI7eUcEBcMriOk8w39kKPF
         OapA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y+7GPmFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ye12-20020a05620a3b8c00b0078783ae917dsi2401759qkn.762.2024.02.29.15.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 15:09:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y+7GPmFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfpWo-0008Le-G4; Thu, 29 Feb 2024 18:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpWl-0008Kg-Mz
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:09:23 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpWj-0007cR-Qo
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:09:23 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6e445b4f80bso750008a34.0
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 15:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709248160; x=1709852960; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q4Zks7rS4NPMc826tI+OvfXrAECpt++NHSHMSdDgNRw=;
 b=Y+7GPmFGZ9xcChpa88y53Ps4dFrQmII74hAf3F8UXJvZdEHjqf+UnpsVcNGDdbRjkI
 kzebRqdkEWzJtglV3C85dmkYFNlRTTEjzvTJf6meEHLp00iJ2wb0fv1C7+t1AgguBhRy
 zugD0V0u+VsylMdeD1vsrZzt2R5VQ2kKRQ5q4R+EyRIOH5T+LPo7t8NpHinaNmKP/cX8
 dkon5S90Z2hIJ3MeyxT4E7Ad/H8914djJH+TVVQbWO1MynWO/Rc8/pU89fgHic1uSZKA
 /zgyU5VqbmdwtFBiKAuvjYXNr/sY5DolGNU6vZnA7cSp5nCsN9szLBqzkPv+/qaxeeif
 7YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709248160; x=1709852960;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q4Zks7rS4NPMc826tI+OvfXrAECpt++NHSHMSdDgNRw=;
 b=ssHtJd/r4ZQyATATfU0yLfqhUVqnGcI4NsPJxz/A8cxc6uGFxPzsZVnYX+TviiXvcJ
 1KEV+tgWPasTalMaH/ltZPOQ1CVMjPYRiSxH426AOwHw6/HK4O/bWXqdCtBR+FM7pv5+
 ueMY82CDSUhccHiPZ0cKiSs6md1CrxcamuHMtB4Z3DGv1c53ydcwSdGzeEaBPoHLcDYH
 dza7lKYvGS/DkonfpflqCrPkHkupq6AFJ07RUM2dxzgpX0RGGYBPiT2EbWfdwXNi8F+t
 0EXo1tOZ1JPmET9uLRlh7S3tALss9LsTiwUTNGLnHQYusSm0BSlal2323zqla9c6pPi8
 xAvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXuW1mBp3HfUt837oFJL7Hon0QEXyD94LyejL5XA6KEsMR2AzRFrUiG8ori46OuiYTKfsdo0Q0t/QvO1l4q4/O3N1w
X-Gm-Message-State: AOJu0YzOSYx8GSJ9IY7hyt/37qPTxPc0Fsbr4pklfcMcUVnMN82e79zX
 uTtH6xumor9eTvsrx51RTsNnXJlV/6VZvXFKn8vsUjJvHU6VpLBN0bMGitxerJg=
X-Received: by 2002:a05:6870:9585:b0:21f:dc71:c3f4 with SMTP id
 k5-20020a056870958500b0021fdc71c3f4mr4074275oao.43.1709248160555; 
 Thu, 29 Feb 2024 15:09:20 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 du6-20020a056a002b4600b006e5933a0da9sm1733399pfb.165.2024.02.29.15.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 15:09:20 -0800 (PST)
Message-ID: <e7fd1fba-ee1d-4b78-b743-128fa8217ed8@linaro.org>
Date: Thu, 29 Feb 2024 13:09:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 12/22] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-13-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-13-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
X-TUID: tExCctJxOxYr

On 2/29/24 03:10, Jinjie Ruan via wrote:
> According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
> with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
> behave like IRQ. However, VNMI can be IRQ or FIQ, FIQ can only come from
> hcrx_el2.HCRX_VFNMI bit, IRQ can be raised from the GIC or come from the
> hcrx_el2.HCRX_VINMI bit.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v4:
> - Also handle VNMI in arm_cpu_do_interrupt_aarch64().
> v3:
> - Remove the FIQ NMI handle.
> ---
>   target/arm/helper.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b796dbdf21..bd34b3506a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11459,12 +11459,21 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>           break;
>       case EXCP_IRQ:
>       case EXCP_VIRQ:
> +    case EXCP_NMI:
>           addr += 0x80;
>           break;
>       case EXCP_FIQ:
>       case EXCP_VFIQ:
>           addr += 0x100;
>           break;
> +    case EXCP_VNMI:
> +        if (env->irq_line_state & CPU_INTERRUPT_VNMI ||
> +            env->cp15.hcrx_el2 & HCRX_VINMI) {
> +            addr += 0x80;
> +        } else if (env->cp15.hcrx_el2 & HCRX_VFNMI) {
> +            addr += 0x100;
> +        }
> +        break;

By not combining VFNMI with CPU_INTERRUPT_VNMI, you don't need this complication.
Just

      case EXCP_IRQ:
      case EXCP_VIRQ:
+    case EXCP_NMI:


r~

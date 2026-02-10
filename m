Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE1FEA8107
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 12:20:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpmg6-0002vs-TL; Tue, 10 Feb 2026 07:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpmfX-0002Hb-Uy
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 07:16:42 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpmfU-0000XI-VD
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 07:16:39 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c06cb8004e8so2258086a12.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 04:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770725792; x=1771330592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rmdejh5m+b7G0X7nw7oeKKLpU/m4Eh0ZpMrSHBHCNRU=;
 b=GemTEUxp05+X6KrNuD+2ErOP/wa8tU3Wb9f0/nB86VTRC/Dlm1AtSrMPBr0Qf4f2qD
 oxMMazGzZkL1Zu9Hd39Mdk3MZcs7m55bbqQyFObVjkIhaVGqtt/CPteqytYkVoen6Ima
 DqGjWE3OuuquDboAoYHJ3xI1SR6sAEb27VMZ/kM/F25m6IWLspUsOAUw2579fEq5kpVk
 WP9B+mr3AtyK05V0/5FN+hi+TXG6I1YQ/uOkaP3Jp6OB7zhltE7LSXt84XiJ0ulE1xzf
 reKOg/Kig0vRq5O843rYPGLJ+TCt64QXyN3HJqvDSSxmHdSWJXpjE326zH/X1FaLwE5u
 3jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770725792; x=1771330592;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rmdejh5m+b7G0X7nw7oeKKLpU/m4Eh0ZpMrSHBHCNRU=;
 b=WpRFv2G3Bs5dGKXQG2pkuY8oyYoL8pIHWc6m3NLVihe13iAHepdL8OwJVBirbSSbzu
 R0NVSEg+eZPHrX/h7+lihp0S2uw8eem5wXTbH1dayK7CezqnSO3W5dKjNUFyBNnzchjq
 ou9gskNVDJG2ifUtmQKerreurrZsgDwCb8KzRo2UZngrDtfcrHI9Vnt/FGjLqOoX5LzQ
 DOqLF1arplApCVZoSr2KifuIKvEFe3rid4apvhGUrkZ+YIDwDwNrXxjoX8Ddn6q3xuDq
 HgrAJvIgpMgA8RvXF54dABEkWI346E8ZWSedDbWpihtJGvuY/gxnFYTSmT5UdwRDGe7J
 l9lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR8PNGwTbsTn2j+d+UXfPb/72darviKCIA0h5zTAwgY93tAPgFTcwxvEtaftvP7KVWp7QqH/H6Vw==@nongnu.org
X-Gm-Message-State: AOJu0YxORf5o3n8gL4aX+HNZsHI9DVMNtxRdHNTDKEAsu1CHdS28D5BI
 FzDlZLf4zF1D3qBY02KiZe9hwmEzpuWHCJ4hZXpEHY6tUBJT3NtSf2MjjcnXjtrkh9w=
X-Gm-Gg: AZuq6aIt5e48XU4YK6JwqN330yZOwfnScuU9ikW+VewwgOfytdrdwUGvWPm9leWRpUP
 9mPnOjVxOugYMLWmXirkDDrO0fcEFonfNUYD6J0r7ucZXAoD9/+g+fCH6j1FZhotrBL1HM9PVG2
 OAi3U08ZLBxKA5hvnPj43xHJhG4wrI44qFlgQ59C3d85hjqRECnDt6XdPgxPeqVPQRaLBdFEQVr
 0gTVSVKy79VxWTt1246NxrgmtuXsc2VAp7ZN5GnWMwqNJgJplvHYO7VRwIDv6vw7Txdp2mOrEiZ
 jgJk60mHM3muFJx01Npqi6epK7KcZrMXklUozHtotO6T6KfNZ6A9mPL+kncgJbKNtb4waz5H+Fu
 n7MBo75ZXT+wa2x3knue3KcVo0PUPhfInv4QuPPkcC7AGAuvcuphjzWLGCiPP5nrkY8/ChWgfox
 gKuvFZUOMBTa3pfuWGojoGzJ0eMTsMlDSP0P3cyecS9G5gQOE0AATUIgXzbcPvR0BARqej9Taj4
 IOXZnCTQmyxOHsNINyiXA==
X-Received: by 2002:a17:902:dacd:b0:2a0:b467:a7cf with SMTP id
 d9443c01a7336-2ab100b9a8dmr24128775ad.0.1770725792283; 
 Tue, 10 Feb 2026 04:16:32 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:2d9:8d52:afad:d0d6?
 ([2001:8003:e109:dd00:2d9:8d52:afad:d0d6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a951a63686sm131177735ad.14.2026.02.10.04.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 04:16:31 -0800 (PST)
Message-ID: <6cf4aa8f-5f1b-4145-88d3-da5abfa978ab@linaro.org>
Date: Tue, 10 Feb 2026 22:16:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/arm: implement FEAT_E2H0
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20260205210231.888199-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260205210231.888199-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/6/26 07:02, Alex Bennée wrote:
> @@ -3817,10 +3821,15 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
>       /* Clear RES0 bits.  */
>       value &= valid_mask;
>   
> -    /* RW is RAO/WI if EL1 is AArch64 only */
> -    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
> -        !cpu_isar_feature(aa64_aa32_el1, cpu)) {
> -        value |= HCR_RW;
> +    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> +        /* RW is RAO/WI if EL1 is AArch64 only */
> +        if (!cpu_isar_feature(aa64_aa32_el1, cpu)) {
> +            value |= HCR_RW;
> +        }
> +        /* Strictly E2H is RES1 unless FEAT_E2H0 relaxes the requirement */
> +        if (!cpu_isar_feature(aa64_e2h0, cpu)) {
> +            value |= HCR_E2H;
> +        }
>       }

Reset value of hcr_el2 should have E2H set too.
I think you want something like cpacr_reset().


r~



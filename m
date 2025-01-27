Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2282348njk;
        Mon, 27 Jan 2025 00:03:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWyIOCy4BGgqS2cqxmMVlxvAywp1nvh+oT2lRfmq9IJxV/Wx49rdod6q4Vh1W1+0/AAe1yxSuu3t9gLIA==@linaro.org
X-Google-Smtp-Source: AGHT+IGCon8ASagWjdpXGHRHeuwrnm/TSSVqLvS67rB6TVJfsarD5MS3Jm6EGxCXSClgdR4gV0Id
X-Received: by 2002:a05:620a:3901:b0:7b8:5511:f72d with SMTP id af79cd13be357-7be9af4265amr2184620285a.17.1737965035582;
        Mon, 27 Jan 2025 00:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737965035; cv=none;
        d=google.com; s=arc-20240605;
        b=Za3s1hmX7g9+yVy+r8pKwO6q0gNfkTDQspQEPlnQcjc3lgWfy0+KFhzXMJIQ/jr9z8
         m70qVRlJgPdnqBcs8fxN3wHVcAVSwraeBKuWFXM72tqyKg6i5f2Jmp2nK1AFsrqh3LDu
         x+3fNIEvaqDLndzmudyh8eHS6qEjM6/p634UJwJIfzS4Yx7C1zQxhHw/fhfA7bWOLibV
         RH7YNeGPFtSnKUGfXEzFpR+hZ54NSUy16GZSjOI8AKe7x3KC83QYt34x6LMqK7wz/Tng
         U7pZHIvNHQaA4fyDYIFHUSjYlGuBptOuGYxT3YT7szHDo4fhGgfV35W9N2WI5jhSEWOh
         4lHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oqH/2UccqE/MOQ+NxFoUmk0QRPM+fE/Q8MNlZykw8c0=;
        fh=CCbQAfJ6n5Vw1mA/vkf6oD7rANLKj7dRNqaki28eJjE=;
        b=UF+OQ6uTc5u/JUCeZ/Y+5XmBE68u6Y8zHuEhOopBf8FzvZwqmQ0eE7656Fn11K8phX
         YJgrbnzLP3SYU6ASI+AlLoaNQNIuD6l7NNnWtMuEfxlnOYP/Zgk1DNljoneVRhPnv1uG
         +B9svsNA7KRzZYHXlLlQlSsWcuMzLthbnS9+BaH+fHojrOa2tXDrNLac6j7qFiiZJiTt
         PATN7zLOUDQlzIQk5fMvQb6WjZ3Q2DNCZe+U6yx13+IrzaX4d0zp32N9j8S9E44zBrtC
         vmoWG9eZAkR+jp/jzGf9SQZAQfqWDdt6EdCFRPBiLK4NmU/PXvVdeHziVEOiq0pIlvwi
         BFPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bry5ZfXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2ac52si898548285a.632.2025.01.27.00.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 00:03:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bry5ZfXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcK5h-00067F-B8; Mon, 27 Jan 2025 03:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcK5b-00066m-3J
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 03:03:23 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcK5Z-0002At-B6
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 03:03:22 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so2897349f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 00:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737964999; x=1738569799; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oqH/2UccqE/MOQ+NxFoUmk0QRPM+fE/Q8MNlZykw8c0=;
 b=Bry5ZfXhHlU9AAcMNIJbaL/xLy/GH1VTiHTFpewZJWl1S+GNRx3miSbEMIaAEp29Pd
 4Fembd61Cdz9ubeEoR/nRWDjC4OJuh36pwSgNtfTHk1ndjfICXdgh9yQUQnNEYw/e7CZ
 HUI/HQz29SAqB9azJnjEWgefbLlRm0h6X2pwzdKUb33QJHsZ5P4xlVPNO8gigBkpTeGM
 LOLCCOliuhy+Z8LgrdYiTYA29Sx10avJacTKlMgrI9vxTr380ga0eetjS3AfjCbK1LEj
 /LeOy+9kZReX24+nZzaYJj8bpA2SN24LvJFV8AgB3LHxiEe0KuuXOWTGO1aQjXnVKRRu
 Po3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737964999; x=1738569799;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqH/2UccqE/MOQ+NxFoUmk0QRPM+fE/Q8MNlZykw8c0=;
 b=feSxoBQLTFdr7LBGiPdQ0BWWZvokHskAkInXoijLCFDvH2u+aGnfIsixFPCadUrN1q
 iDu1kvAHUa9v51sARwL4EXkSqeBCwG/R/v8HQ5vrB/zL25kk68hJAGjD3Snj5rcS7zHK
 IbhCY0zJTarOuv1jU/OqbVfid+/6oublKwt1MzH+nLARVPs1XcS0duZbNSgIfK4Q4ZVo
 4QxckTLPnrqTzurvoVMWxuF9OP7vcoRKbuW8L97fIRNVBv37f+gFEeOIlvwZBu2AQb1d
 MvUQinLTTYNWAuKDMwXB++JSelV9eN7Xoy2hQlGEzrrZiSPV40u7lU5frhxk/QuMFqXX
 Z7Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSPypKhuHtTcAFnFW4RXri+7EUjv7WhynOaOFbeTjebdjvcjKpXe/UEUkfrIYtv32yxUA7/dgsOA==@nongnu.org
X-Gm-Message-State: AOJu0YyeOzSIRl1BcR6yjHp5z0feGERxyaW0FLJjrmYoAewP7svbhTbx
 T1ASuAjoKjE7tp6cVquZI2k7cq4KVlLcWGFlaE7hUPXLFr7HQCWhf+NkWO37R6E=
X-Gm-Gg: ASbGncuW79N2Vy98XuL4sIu2MapSgB2syoJeJLsSnrGchjNm9UmsfJOwc2GXsvluXCT
 BC3q7/nJQMAO81x+8XkS+IYQ2VvMM6ZB4YGEchzlujjsfac1swJo5y7aQmtbKa+fFL4rw9C0bX7
 Qmv5DE50d6BqI9zCuzsbqojFMpajBJJ7t2m3/vHyUVCX9wt8PqntrwYAUUZyqnw2ofS1lyMr2cU
 udaToSURN9XwZmHDzJTBmR+P/YCsSbloEFQZrLAfDCKOt9HcmwUmHzplF6tVnWXwfhdbJGVnR5D
 wgQ2sdRBG6A7/Lruk+WoUbT+sWTpqBL0pUI7EDwDqggoGJQ+
X-Received: by 2002:a05:6000:4008:b0:38a:624b:e37b with SMTP id
 ffacd0b85a97d-38bf57b642dmr33221955f8f.53.1737964999214; 
 Mon, 27 Jan 2025 00:03:19 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bad92sm10295436f8f.61.2025.01.27.00.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 00:03:18 -0800 (PST)
Message-ID: <67dbc202-7b6d-4bf4-8d18-2ba78f39a287@linaro.org>
Date: Mon, 27 Jan 2025 09:03:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/cpu: revises cortex-r5
To: Yanfeng Liu <yfliu2008@qq.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 alistair.francis@wdc.com, Yanfeng Liu <p-liuyanfeng9@xiaomi.com>
References: <tencent_033217F7900714A999352724A7790C3F0007@qq.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <tencent_033217F7900714A999352724A7790C3F0007@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: Jsai7GzFaAZU

Hi,

On 26/1/25 12:43, Yanfeng Liu wrote:
> From: Yanfeng Liu <p-liuyanfeng9@xiaomi.com>
> 
> This enables generic timer feature for Cortex-R5 so that to support guests
> like NuttX RTOS.

QEMU aims to model CPU faithful to hardware, than the R5
doesn't has generic timer.

Maybe you want to use the Cortex-R52 instead? I see NuttX supports it:
https://nuttx.apache.org/docs/latest/platforms/arm/fvp-v8r-aarch32/boards/fvp-armv8r-aarch32/index.html

If it works for you, could you add a test for NuttX on Cortex-R52?
See for example tests/functional/test_avr_mega2560.py

Thanks!

Regards,

Phil.

> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
> ---
>   target/arm/tcg/cpu32.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 2ad2182525..5d68d515b4 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -590,9 +590,10 @@ static void cortex_r5_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V7MP);
>       set_feature(&cpu->env, ARM_FEATURE_PMSA);
>       set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>       cpu->midr = 0x411fc153; /* r1p3 */
>       cpu->isar.id_pfr0 = 0x0131;
> -    cpu->isar.id_pfr1 = 0x001;
> +    cpu->isar.id_pfr1 = 0x10001;
>       cpu->isar.id_dfr0 = 0x010400;
>       cpu->id_afr0 = 0x0;
>       cpu->isar.id_mmfr0 = 0x0210030;


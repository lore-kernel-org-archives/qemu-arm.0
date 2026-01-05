Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA4C2A072
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 06:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vce2R-0002ik-IA; Mon, 05 Jan 2026 01:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vce2M-0002i7-OJ
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 01:25:56 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vce2G-000707-Nh
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 01:25:52 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-34c213f7690so10838800a91.2
 for <qemu-arm@nongnu.org>; Sun, 04 Jan 2026 22:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767594347; x=1768199147; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+jbDHBAgGymjbmjV0kCzVLxXci80MxgTcwZZUJVNz5Q=;
 b=KYNswlklKYqIrC25yDUEjqu+pV9klOt0E4TGRj+0M4sT9IzlbWDhatUdyM+MUbJa+/
 GgFg0nktIWQN59sYNets+lzo6be1yRYygSannbtN9FlOfIYin9vO76m6kvE/HpNS5wS6
 eHSaIpYj/BIDbt48rFhH3yIswreD8PZM5SsRujsXjU5aW7Mk1A+do4EnkGboXqViKMJ1
 GJhMoz58zGKvWc8irQDpYd4h8w+6JuuMdtaqowhJ7rIWyyln4brMT4gzomEB57d9MBVi
 f5ncavdjvnht5Qr9rl3qybX1wE1/bxz0wdKZEfRPLUh8xJmRvxEule6SFPDFpfsqR6L2
 oJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767594347; x=1768199147;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+jbDHBAgGymjbmjV0kCzVLxXci80MxgTcwZZUJVNz5Q=;
 b=O8ysaO+BI7Gd0BDyPklTAk44ct74B9pMUcemNwK6eutTxQd6yyqUEyj6wStznWK9Mw
 zxs76aUNLQu2YDHKCsyV8llUp6C8sgqBqI/9CPCwl8QQGUhP7108YlmDVk2tl5HR7aRj
 giMjxufZOygjls1gwy45gaTmkWiR1bu3/uA/kxisFvx0kqDFDpH1eizf0TU3M+Qj4ad6
 IfPVoaakuej6S3eQvuN3pBnznhPuv0SbkpFhjtdIr/DeBZgb1lqRhRf3PfpvzUHjFZYq
 8gukfsJc3myLOTepipYgO2LH07IiW7a/xBx7Fyqj+9YwOcNu7qY6OEA5/hgnNAAsID1h
 a1Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyx5HT/OZPEw9txTxI4ItZM2UlYYlZPPx+Lj8lB5TO6HkfbDyyn1kCAH0y/qq0AG+Cg4tnFFi7QQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy6jPr6azjoVqUxKQc8WiiSAmMpk3asfyOu0U8Vp++Ad60PANRz
 2XzSkWFaiZI2Bi+UZlP2KG/LJX+kxh5oG7EF7MAIPdA6TNfALT/2YO7VxuptOYBcdqHk++SS+Uw
 J9zGjxMo=
X-Gm-Gg: AY/fxX5PMOkOJSht+H5kFW2i52GXPlr0NzOyr1ZaNdh5nxHDWNjkkTxP5YJmtzPPyAD
 +svYeJzUVO0k0EPOvpLYg1AbTNoqZs6fb5BczRIjCc9h05nmZhcWDyDAaOYA6iMdfYz20+yz/Se
 B3zMUez1K4B6fPUeOgD+ZLux/PDhLgRUk7Qvpq/vXyR9a1oq6y/g0xdCdldW8Z+Nz/RBTc5TvOC
 6s83o8M0VmrArtXWbtzMgOZ/5E1g2RnXswJrqw67Lp3WHDLDDlitRZw85oH7adoeqW5o4gXPzrm
 sHD0EYSz9MxtQ6OkXnNGdagogx2jCnm/i8r1akaTP9USLRegyHDutKDdALhnVmBGH4M+47TxtQl
 KNtv7JRYZsoKIwXu45bNGFgepWLwMAut0oTp9/Wz/UX9eckaa0H0bSkC4JFaaHc2T4zcEhXHsrV
 sY7MoDo30Df2Duw73cT2WXni4sJMHOzg==
X-Google-Smtp-Source: AGHT+IEwplOoD7lxh4cD1vSn4qsUjOo5mOvJWnu1g/PIfZT1R81WFjoo8lq09ZsSjLz5/Y9baV+jEg==
X-Received: by 2002:a17:90b:2e0c:b0:343:edb0:1012 with SMTP id
 98e67ed59e1d1-34e921ac620mr37361230a91.21.1767594346649; 
 Sun, 04 Jan 2026 22:25:46 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f45cad3c0sm2948353a91.3.2026.01.04.22.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jan 2026 22:25:46 -0800 (PST)
Message-ID: <d5ec2589-a831-4f4b-86e5-a4ca1ce443dc@linaro.org>
Date: Mon, 5 Jan 2026 17:25:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] target/i386: Add a _MAX sentinel to X86ASIdx enum
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20251223222649.187935-1-gustavo.romero@linaro.org>
 <20251223222649.187935-3-gustavo.romero@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251223222649.187935-3-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 12/24/25 09:26, Gustavo Romero wrote:
> Add a sentinel to the X86ASIdx enum so it can be used when the total
> number of address spaces is required.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   target/i386/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index cee1f692a1..ba0c4fa548 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2600,6 +2600,8 @@ void cpu_sync_avx_hflag(CPUX86State *env);
>   typedef enum X86ASIdx {
>       X86ASIdx_MEM = 0,
>       X86ASIdx_SMM = 1,
> +    X86ASIdx_MAX = X86ASIdx_SMM
> +#define X86ASIdx_COUNT (X86ASIdx_MAX + 1)
>   } X86ASIdx;
>   
>   #ifndef CONFIG_USER_ONLY

But... it's _COUNT that matters, and that doesn't seem to get a mention.
I don't see the point in adding _MAX.


r~


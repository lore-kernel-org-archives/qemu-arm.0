Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4444185njb;
        Wed, 11 Dec 2024 16:02:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8ZQLaT4hd/+0lYwVGvmwYQ/PSQhcY3EigCSHyfnHORBAfET3Wyu+Iy4KU4kOFkAIhWS+6NYfMgCuq7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHJAbqlXdkpywyIro/F3k93xmWE57j2pushSKh6owIaUr2RqwVV/1H/EM8RE4ys13sWbAkp
X-Received: by 2002:a05:6214:d81:b0:6d8:8a9a:8d9c with SMTP id 6a1803df08f44-6dae39338ebmr22994046d6.27.1733961772696;
        Wed, 11 Dec 2024 16:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733961772; cv=none;
        d=google.com; s=arc-20240605;
        b=C9krc0ypVfNLFWV1nkJadWgYufobm2GQDv5k37rCvMY9N3jqGJTV6MKlsfJGF9bMs9
         Q9gCaAw3qJVs/PPynQI770aSamxqjvgUK8Z3NFZfIJHsACFbI9LHGIKMDT9jx0EcitmB
         4nVc0g8T3664gpanMxQwXqxTPV/Vtlwefiz0utMNhAJHDz8PCpQfdHJXWYbRhe/b3c8x
         x1bcI0t2gbqJVQkJXcGdEakdpT34Aobm6w35ogh5+FtrRIZrvM32TH4qmnn3uO/KMwqg
         lsYsMl7XNha6Rtbn0JoHbefLRuAd+6J2YnMKsBqN55XNhdLX7iisoT5yPfenHo3kKXfo
         f02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oK0zIqbAdfEqP60qOwghnIWmq/AYF4LMXG9DAGlRvLY=;
        fh=PTyRjpw2KgXe5QOlcrM49MMbKiPt6A+VJoqIeqzyJYA=;
        b=VcAYNCd2V5MDk4aor90s8/jZwCS5ZPDBW6hnfl8RpJwN6hgxq/S4/mYyOAQHgnj+cv
         jv+wcJuRJ69YMtvUB5Y0lE6esbkLoN4pgp/zDCD/Awi+nwgcgXIzPfo3psWVVzQooVQK
         pMfnfKAbwukr0PuLAaMp7KE50QSSXCaOGO5yZYmTRicXFPg7iiN3ibBbhuzn+FPScloB
         HC/yrz7STVmadxUBMFt4Bnhy+dtIESMXCHPe/Xnf07W+x7QWbPy3c6LuKQSdgqL14+QP
         5HxWZRuejDlRNCUWUQlXXC3afVfbOapf2NNYi5HBdGebMEtbtLftun3a0ZLv7IrWRiTM
         rMZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BREMci6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d92f06bd80si57636676d6.384.2024.12.11.16.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 16:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BREMci6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLWen-00041C-5I; Wed, 11 Dec 2024 19:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWem-00040g-9w
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:02:16 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWei-00034N-WA
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:02:16 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-71e02eda71dso44218a34.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 16:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733961732; x=1734566532; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oK0zIqbAdfEqP60qOwghnIWmq/AYF4LMXG9DAGlRvLY=;
 b=BREMci6R4C6Z7sgkGh1F4GMfjm7m86t3MP+HA+xzff0FZwVrQ0GVsmzmUN1rds+GPY
 OypSmRFvCHd9zvSiKpGHSX1t5qK9/OrgueCiWWFHvyfohCmWAP35+mMdbcSbdqdBa4xD
 +YmhSzZp2HLWDf1MoNY72HMYsUqwkXCwDNLtQ2qFbIe3NJ2kkIzVFsfU9IzE8Jxhs2vM
 1Gevlge6F293ypaaaUlAdGCjlnTWxDL1WM3ItjS3sG4CGQZxl3u+UYB/7XxY0eY7uXmm
 p8FGd551LJsXC2EGky96nn4ueAHUct4GHWgjdj7zcYLkv2+CbObsMF4IF/4OPUjt9shI
 Mqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733961732; x=1734566532;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oK0zIqbAdfEqP60qOwghnIWmq/AYF4LMXG9DAGlRvLY=;
 b=Q5uqHQagSKYNFk5YbK7PsD+Cc/mwnqcRoJnU8Df+7KtAPDk0uNWNk+N9m25tLHj00Y
 uv4JcnVuMoS5FIqjTSXvpyyPItDp8MVo2XwX8+kHi8dge/8DDzWrS6fRau5QpWinF5/t
 HMX7MOJWbRbf7+qN5JyPZD3RzpW0zotNJYqZVwnWJcQ3OLiEJxtK79q1UBCXXz6W9zNO
 08vCuUV27dhxIxjszzgy1vTUTajYzy3QEC0V5XLVFYkNMy2KzkAZBxYTmhUN4crB85TV
 5M8J/m6T7GU9FjDKqiDLILgGTBhnngIcGX7jL4+e695wlcwB4+0NlJ4z7H4FbMIqWR1h
 xzGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV183KjrtaBvLbUPCwIG6iBHDyZ+M6uMSQg5h+adb59Agj9VM4vpd/gfHG3FvqPZZtKHQMDn4qJ7A==@nongnu.org
X-Gm-Message-State: AOJu0Yx/f8nhjpV7dt0QMpRSWarqEH7qh9ltA4zEUHagLp6EZ9Ednee6
 YHcKC1ZNaqhtBAs9S1luC2oD/kh4FtF6Ijv+99E+n7yD0WxvWm/EzXM//3afD9E=
X-Gm-Gg: ASbGnctLcGS9y6Adv17ARivCymrxwZWXpaefIPTe4jBzwc/mJ+yMFyP6IzbQfDNtqcb
 NfNzCKZLpaqi5vjm4bs4VUrcRK79qOJdsCh6FfYBArPqny7hHfIG4l21/HmY1obaejSDhNwoQ0k
 79IK8xJo+7Low4npQF0W0YsBo7gfWnwpC7CEM9Y7Y30938xAjMd2Mo8J0vsYFA9D/Y5Gqzde8RI
 3Sfn03PimUFjzNQHr3PbnG3NmFuB9TNVTAZUl40UscUcHyn5PBVxRL7dW2dO5Bn7HQnhzo2Rzso
 fxD/swIr/itgH1SFRn1T03beIDc2qf0l
X-Received: by 2002:a05:6830:264b:b0:71d:f9f1:7f3a with SMTP id
 46e09a7af769-71e29c47dd6mr977981a34.24.1733961731873; 
 Wed, 11 Dec 2024 16:02:11 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e155ec9efsm777274a34.70.2024.12.11.16.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 16:02:11 -0800 (PST)
Message-ID: <0b64e23e-84ac-4f2e-a91e-6366e3de0b9c@linaro.org>
Date: Wed, 11 Dec 2024 18:02:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] hw/sh4/r2d: Include missing 'exec/tswap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211230357.97036-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5PClN87K+iPm

On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
> r2d.c indirectly get "exec/tswap.h" declarations via
> "exec/cpu-all.h". Include it directly to be able to
> remove the former from the latter, otherwise we get:
> 
>    hw/sh4/r2d.c:357:35: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      357 |         boot_params.loader_type = tswap32(1);
>          |                                   ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/sh4/r2d.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

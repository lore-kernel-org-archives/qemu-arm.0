Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp186428ejt;
        Tue, 20 Jun 2023 03:38:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XFDmYdz0CPCcgIlF6AKV+Rb8qs/3N+x6JFjwvK4mu77yCQZV7slKYcokyzzY1ZywWPh9B
X-Received: by 2002:a05:6214:230d:b0:631:fb35:27e1 with SMTP id gc13-20020a056214230d00b00631fb3527e1mr1836304qvb.4.1687257533497;
        Tue, 20 Jun 2023 03:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687257533; cv=none;
        d=google.com; s=arc-20160816;
        b=DMdRIRq87K0oQkx4qqXuuVWMTa7MDu7JwSM+ijYGtLayubpqQ+kfVmyL5bkTqindxv
         CaEZGnko7SKnkg9gcGT33C13fCiwX2DlMEFf9PX0dLfHvkFh1GgjrYYSRXO5b+uUEa2o
         17U0OX5rwCmpA8qjGgUXvIKvAVTbZF/7jOm5SWDFa6WS+UvbfBxOTreo3h1ADvZSfDNN
         RoFkqUI0YG0WZHUdEK3hfSFKPX+7X8XZC2jStF8JqAdBwIeq/mIcJwl30msrif1Y5rji
         6R3TWNVrTYqFkqIlpK5otaGw1ArVKON+LiqU05LEmaA5+PndJndpirfE4/KLjpZxEDgd
         IwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mTFreq68Pm/7uDYcBwKfnJwgB74XQlqT9nPRxFB/EbI=;
        b=GR17Y9TbCJEm50A4os1wvCQXgkSBMU6IDX4rWCASnnJfDF+Y1KkZkvNBpZU48q53DC
         DpsYFANwxrt3Ah8lpkZ0GiNftTGsrZsZS+aOzCDKY9bnt4dLYPjsXWKRYru3GyBEetck
         J0O/rp4ipZPe2Vu0d9BhOyNcuYiz4B3QLUoA7ooYj6Xjt8PDcCAl6a3P0i+m2gbC7dJS
         Ynv3BVVnbCD46XsYulqQqzd7A5NfP1HDBJX5dMnRdl+DAyyCaL51UMr616MFrC94o14C
         PG63R3Zj0WPsupLVbBTyznkCBoMmwD0nDlNhAwewGT7zTBULOakpPo36G9M+BF/THozc
         DfEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fcnb06Vo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a0562140c2200b0062ded861543si664125qvd.616.2023.06.20.03.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fcnb06Vo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYl7-0003Wu-Vx; Tue, 20 Jun 2023 06:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYl6-0003WN-KA
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:38:48 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYl5-0004Ez-1V
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:38:48 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso722205066b.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257525; x=1689849525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mTFreq68Pm/7uDYcBwKfnJwgB74XQlqT9nPRxFB/EbI=;
 b=Fcnb06VoFOHBlCLMLFFNP2lp5sBvUlcp0KXUYGbp73a+QUcyinXudtJafv5LHy7n3X
 5KOJ3qdLH0O+zsxsucSVT1u1pHVuVyx7/ShwTBYH3S+Z1w5RH1oFF94+Kexop92qmU22
 /suc9CqRIAAtYoElwpUbGv9bxoAP75H6Nzk+DU3peJHrzVhV229M18j+dbasCD5Ygvqt
 X+sqmCR/4yFL0OSabr9809LAAQ/xxPtg+zBW/oXfoPUTza9xfPY4TVAyRGjToQlxCPUX
 PCFaHBxTfSDrRQSbAzs1mfsLsMeza7ymXGXAPJ9DWoFMZqcBEPWTN38umFQZ/2lD2cVr
 wPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257525; x=1689849525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mTFreq68Pm/7uDYcBwKfnJwgB74XQlqT9nPRxFB/EbI=;
 b=Ps1zA2XzvWM3Gd9GpCC2JGC/cheFVb04y1BjRCuB4yU+EbDhHbQ8URA7YW40HhVRcL
 nzIV6psia03ZKWSBBOPsRyibKrCZo3HnGhneq7D+OUDIMd3QnfM4EkZFRNMqlohzlljh
 UmDDuyH8WbnmNN9dX4KurqPCErgdYpu+O1ST1ASK5B8t4mWhgHZJRd/G0ox4AojC9s+Z
 KRpXj6V2NWbfbPeBdlIqhi2JxaU3pIfTwAZ8DAfJbN/J5EQIBpQJ7OOmL07PKiAQREiH
 pfkl7Tb17dTlWmi72koFp46HDrICNXmMGCpsJsSQ2IVQFMQfqx0Ir3rRaK4GNo9pDheo
 ikLg==
X-Gm-Message-State: AC+VfDwSBFnwVIWELZDmWwmDMfju9TBcfvZhumyXR74CvxPMZx+u4gVD
 ffhW6zIJzj1JOrKw19MThQwsPQ==
X-Received: by 2002:a17:907:2d28:b0:96a:3e39:f567 with SMTP id
 gs40-20020a1709072d2800b0096a3e39f567mr13712768ejc.47.1687257525352; 
 Tue, 20 Jun 2023 03:38:45 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170906168800b0098884f86e41sm1117816ejd.123.2023.06.20.03.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:38:44 -0700 (PDT)
Message-ID: <02f54fc1-0ceb-d905-85b6-81892345778f@linaro.org>
Date: Tue, 20 Jun 2023 12:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 22/34] target/arm/tcg: Reduce 'helper-crypto.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: /Jy33OTHmNKS

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> +++ b/target/arm/tcg/crypto_helper.c
> @@ -12,12 +12,17 @@
>   #include "qemu/osdep.h"
>   
>   #include "cpu.h"
> -#include "exec/helper-proto.h"
>   #include "tcg/tcg-gvec-desc.h"
>   #include "crypto/aes.h"
>   #include "crypto/sm4.h"
>   #include "vec_internal.h"
>   
> +#define HELPER_H "tcg/helper-crypto.h.inc"
> +#include "exec/helper-proto.h.inc"
> +#include "exec/helper-gen.h.inc"
> +#include "exec/helper-info.c.inc"
> +#undef  HELPER_H
> +

foo_helper.c does not require helper-gen.h.inc.

Usually we put helper-info.c.inc into one of the translate*.c files; probably 
translate-neon.c in this case.


r~

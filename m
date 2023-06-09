Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp631153ejb;
        Fri, 9 Jun 2023 13:37:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VIJqUqHN9NX3f8BIwzEqfBh5QH7VKCaE6K0ibq3XovdqgQYsnwLqvqio/WVEu9ST+56N6
X-Received: by 2002:a05:620a:43a8:b0:75b:23a1:432 with SMTP id a40-20020a05620a43a800b0075b23a10432mr2445854qkp.72.1686343079448;
        Fri, 09 Jun 2023 13:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686343079; cv=none;
        d=google.com; s=arc-20160816;
        b=aJ/Aeunz8+DW/tTvfFWQxfN4+cML4u5uZ5KKOv3tNMx/JSsPO7L4PGTn7dgdOOFrLG
         yw9xxgX68sWX87q9Pw+mcEE8V3MDlVQEsXqkniSWxAKD42clsy3yAj2ILDrTup0QyiQf
         bRg/DNibyf14Jmmu2e6IVW9GFDM5Af2xvqW6mHFAh6Br8OTVlqLsfYs995BQ70ps9vm+
         umykyZkLp37tN9nMB1lrvVEbkq41qLhCb5kj6n0691tA0hyGIfxQreBYqdXPaC9BFRog
         xxRHi2HlaziIT+2Chy6gnMgOx4GOrvHsMtGtYYbH/eLCdOmAKub8wFR6jJeKEUb2I4GX
         m5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YNPeX8XdOeVklglpjzvWIN7BvHsArbNso3VbGrb9+xo=;
        b=NLB2EwcVvOmOA/60UnhyQ7vsALtWyk4IAgi2RP1EpMDrR2qJMZZPPdYaqhlbUlrbsz
         sW2jTGWx5a0Jvgaimn24N5a/kIBvSEIk0sr3aCYZlDFONklpWhkr6+VIVvdFa2V0IWY2
         1Rvgp4kfrIT73FaWR/6Fro126b3uXtYVa+qEweGIg0m3ouix7jHI46xbsWQup8oKjILY
         vaxJYVBxFXhfegXt4b2U43hRHgM8etWLzWVZkHjsXTUtLlB70+Kq+fucg86SPGbCe0th
         h8YZ+pByypeScEUhkSilfLd2F4ZrvSoptA7TLm+kd0Xx3RECpgCz9MU3B+brjTt4kEaD
         de2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6AzOmVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05620a004d00b0075b22d47335si2612928qkt.70.2023.06.09.13.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 13:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6AzOmVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7irU-0003dN-IT; Fri, 09 Jun 2023 16:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7irT-0003ch-23
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 16:37:31 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7irP-0004P6-IG
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 16:37:28 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b075e13a5eso11385115ad.3
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686343045; x=1688935045;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YNPeX8XdOeVklglpjzvWIN7BvHsArbNso3VbGrb9+xo=;
 b=p6AzOmVLNoYvi5F+CDphEkCy3qbWTUXHjKjGQvVstgzmeagO+bgZgvR9j5D6cYoaI0
 vTuq0dkp3zETTN0za5Z1DiV0sq9ePDMsf+QYMMtz5R/ca3bUBELUWBR7N4YqmrRr+voW
 IbCkc6bzTbUrrN5Nle89VeBUog4Hno26o8wl7wW8g5B/uFuF7DOAeKHLQpIkGkTRIn2r
 yqYXdV/TCxJJUMaVF+7G6Oa51zCduziM3ez6RQroLnJgy5EeG+UAz9TGRwSuaMs/Tnk9
 FbMU19Gv+WopZ4pGCAElDknTv7kLAiePlbCvWhFJFyTxiMRb1gbdLbs5p4aIiRror7Jp
 SoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686343045; x=1688935045;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YNPeX8XdOeVklglpjzvWIN7BvHsArbNso3VbGrb9+xo=;
 b=Du2CSJAgslh+iqzVSe3yTkGjI6/pF3aqxLjPV76MsEd7WxpXeEKZx71c8AhyYD+XwQ
 lzr+J7yZC53IR6Cl922Fvw+r6LR34mDektcvid8Up9F3EYVG2UKlUQil+kpYQjCFNr9v
 qtyxMAQ/ybsPpsoQnF74kiBVgC3FXv1j+xUumQ+6seLVR0jwGKWu8rEWBGSlCv2Lbpw8
 mmwX+CoyCnA8JlLFju54bZi2g0myrRRsYspRh2sPW49dEhNtV/KyvuosXGTKJv0oPSJQ
 bJrgalA/ecWBKNm3fZdjC1DFQnsCuWPgv3DCcHDfrKWpUaoPViqcQ+xmd/jhuwpLNrMa
 ZMMQ==
X-Gm-Message-State: AC+VfDwQpPVhzfXP3aue1ZQsz9K4u9zwKUbL+QAmM15gqj2TGGgmsG1o
 gsx9vwUufWp9JunYCAy+uEW1WA==
X-Received: by 2002:a17:903:2351:b0:1ae:5fb0:4256 with SMTP id
 c17-20020a170903235100b001ae5fb04256mr3058106plh.57.1686343045525; 
 Fri, 09 Jun 2023 13:37:25 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001a6cd1e4205sm3647141plw.279.2023.06.09.13.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 13:37:25 -0700 (PDT)
Message-ID: <4954843f-41f9-d78e-d93d-328185f976e3@linaro.org>
Date: Fri, 9 Jun 2023 13:37:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 21/22] target/arm/tcg: Remove inclusions of
 'exec/helper-[proto/gen].h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-22-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: BgrXZLdK2x4N

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
> index 8fb44a8b7f..5621728271 100644
> --- a/target/arm/tcg/vec_helper.c
> +++ b/target/arm/tcg/vec_helper.c
> @@ -19,12 +19,16 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "exec/helper-proto.h"
>   #include "tcg/tcg-gvec-desc.h"
>   #include "fpu/softfloat.h"
>   #include "qemu/int128.h"
>   #include "vec_internal.h"
>   
> +#define HELPER_H "tcg/helper.h.inc"
> +#include "exec/helper-proto.h.inc"
> +#include "exec/helper-gen.h.inc"
> +#undef  HELPER_H

I am surprised that helper.h.inc would be required here and in most of the other 
foo_helper.c, where helper-foo.h.inc has already been used.


r~

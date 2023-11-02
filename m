Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp126531eja;
        Wed, 1 Nov 2023 20:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1Zl0O9o/an60rVlxWwqvE+gjzhNzNwWLKqudMK6kNGKGLKwLrIshyRlllxA2/PNt1i87t
X-Received: by 2002:a0c:e746:0:b0:670:b327:c86f with SMTP id g6-20020a0ce746000000b00670b327c86fmr6000648qvn.17.1698896601082;
        Wed, 01 Nov 2023 20:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698896601; cv=none;
        d=google.com; s=arc-20160816;
        b=tJ7qy7nt2th315vvTDVdAuz742rEIr17T7+ny5pAVGBRkQW2kfa3YStjw2NnQcyV4D
         K+wySTMtdVEMcKr0VYqLVjrhl7+ZHkxLZbKc6OQQakSqkTitwNIcXhSBH0VZzyrvzIVj
         +WfqkoQSBCHy+2mfbDxXu7LrX3XNeZLfQfQfbTKG+eSCGc0wvj7EAnN5+rY4Va2ymJTN
         bneZaO/eABbAOxf7UUJ68dydMNfDk/posrhT+F6uiBZ8ZkJYZKBROokIJZiJL6EHVeFf
         g9cvsZM9fnbLJU95AnT6VF1+C/a7X/SVqLhcIJTOnOV8SS6JCALwGlhxTDy7UwY/qNxu
         doug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=L2U52MuhHqjmxkX8pr3Akl7k/7D4q2HxdZ7dRpz+KnE=;
        fh=vnd25H/Ke+7YaFzjpnMIhV1td4ceLAPtKNu/30RxYYA=;
        b=hhOep2NJ2f2VYxPfzGuP6HiV4nuDlVRpsv/alxsPAswDHktGymOQ8MMCjYMYQB5XRO
         hctBD48qFp90XluUkSC9TupRxhWrxx9duzfSfWyifKw8Z9TGasuLWZLZKI9pgpVk9nLW
         pFGxpWrtx9YIWhrX7EexCth1sQ7rqzsyHNBCKKf7AIa3+9jlWXGFdRVPH7G1Lb1el5gx
         1zePuGeuhJtbfcO7yCYM2rFvDE3ld4sPEsDBx/wDye+1OfMHvgeqUo4k7WJMd0cNWlvk
         1Nxd0aSbhYeRGyhBGKdeflyFO4VcnbFwQuy6/LpyFQgqpCo+K7ioFiLzKvhFTeJ0b8Yu
         I8wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QDec45n4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cs3-20020ad44c43000000b00658561d243csi3753520qvb.16.2023.11.01.20.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 20:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QDec45n4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyObs-00039t-DO; Wed, 01 Nov 2023 23:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyObq-00038F-CG
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:43:06 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyObo-0002Es-Nz
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:43:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2802b744e52so1371760a91.0
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 20:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698896582; x=1699501382; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L2U52MuhHqjmxkX8pr3Akl7k/7D4q2HxdZ7dRpz+KnE=;
 b=QDec45n4p78Qf99+m2c2w0Ty9axnR/IXJQawI5rdsVbYcqba7Xr0MWOrbwkmGG1bTt
 sZeTvqjBZdp7MjYZToGW71wiWv276l9yucqYtmp70EPh/HZPUYpOrOaJi5dfQvfH5jf1
 eDIuJGuJ3p7pwmI9Jz1Po1TRlPPhSyb5bLH5DXBJh4FNUpNT+adykqooF8gzEePU1IB3
 iv/7x583f/PZk+c8jw2rxmIITn/fDq4Ii1dza+Hrvfz4F0D8wry+vsmBiz8Muk/5xDhu
 9PQkIJBrFJiTQIGn0DfReAwlmFSLLY45jGnJ3nDd/gGMHK9ecDK2BKiSt5HJK5kSPxFI
 hB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698896582; x=1699501382;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L2U52MuhHqjmxkX8pr3Akl7k/7D4q2HxdZ7dRpz+KnE=;
 b=FV6gxWHdItj8wyoSuc+X1fLJBmVjDOaWTBG+jttRWd4JaLvLtVlwhug96ZAxEucBcO
 GOC7EMf1Fl7Dg2Iy7GoD6mg0xjOrhZCxJ2uxeDD6iteNMEdUjKKIl2tVdjyoPqGFChJi
 +aruLyjYJZJvFWqU5o9L1Hyk1j8XOMGi5deNTYzUaRNSWsZqo/N3f3mpjqLKEF70CD34
 vHL8iIS0QgW/mY1C+NewTgdzR5fJnBVd56Iazoaf3mVyKkSyM8+M92dl3yLdm/YZgo5X
 pdI8ugTC6okCZgZew+1BE+R5NX7qW6xWC9mosQBbTVAWtDKbjLKbBUt3mqWDfKUoB3l9
 t0Yw==
X-Gm-Message-State: AOJu0YwwyjKj6insJkpZoJLvJL2horc/olZPpVBhuldufZ87qIa4WbPm
 kl8ETQmgabc+mwe7FbkiqlojTg==
X-Received: by 2002:a17:90b:180d:b0:280:963d:9cb with SMTP id
 lw13-20020a17090b180d00b00280963d09cbmr6497405pjb.23.1698896582101; 
 Wed, 01 Nov 2023 20:43:02 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 nr1-20020a17090b240100b00276cb03a0e9sm1476984pjb.46.2023.11.01.20.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 20:43:01 -0700 (PDT)
Message-ID: <1a744365-19e4-4ab0-bab5-11dd19bb126f@linaro.org>
Date: Wed, 1 Nov 2023 20:43:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/33] target/alpha: Tidy up alpha_cpu_class_by_name()
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-2-gshan@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: rMNiGnJk7/e3

On 11/1/23 17:24, Gavin Shan wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> For target/alpha, the default CPU model name is "ev67". The default
> CPU model is used when no matching CPU model is found. The conditions
> to fall back to the default CPU model can be combined so that the code
> looks a bit simplified.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/alpha/cpu.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 51b7d8d1bf..c7ae4d6a41 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    if (oc != NULL && object_class_is_abstract(oc)) {
> -        oc = NULL;
> -    }
>   
>       /* TODO: remove match everything nonsense */
> -    /* Default to ev67; no reason not to emulate insns by default. */
> -    if (!oc) {
> +    if (!oc || object_class_is_abstract(oc)) {
> +        /* Default to ev67, no reason not to emulate insns by default */
>           oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>       }
>   

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I assume this TODO gets cleaned up later?


r~

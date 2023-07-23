Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1368935ejb;
        Sun, 23 Jul 2023 09:01:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFTKEcNrMTUo+mFOP8Q6JJMr9r90y8XLNb6SBbXHAES0qXsY8apIhif+8P4knZ4gscTe1rr
X-Received: by 2002:a05:620a:244c:b0:76a:f005:5190 with SMTP id h12-20020a05620a244c00b0076af0055190mr4362137qkn.49.1690128098089;
        Sun, 23 Jul 2023 09:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690128098; cv=none;
        d=google.com; s=arc-20160816;
        b=yVT0xZFSvL3KkOEgRs7A5yu79m/7VhU6Rwj79LgoqLVm9YESHrQ3ejRN3kCzK8b8YA
         MD28K2Ds/LpAfPfdqYL5TPq9XEJfWnXZw4+rYm24Mt4ZMrqJS94AcvDhze8vOnBSTYlP
         3tCDVcWMSg0rEYppL7RLW3Lq3wkbAdrsw0LJu9Dk93knunujFOyzlkf6eFSD3youBfRS
         SLHXnfGK4b2wE+I0aMaKYQVPCw6Xti+dIcwoctE+1EaPzHyaNEeBHLBHbfY1YX1g3kBT
         beJGConI88TQUH0GeEraGxw8wfSl5yLS9oI5ywvMbckQ0BzQE9FLECf96zVU3HWOBCa0
         qVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=LktNimRU9OwO6Zs5tm9aqCj3B/sEkQe0Lm4USeY7rUU=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=yr/jzQRbZsi1A9/qxkns3pAwb0O31IISsdVB28SGWsai3Lma+aPu4famCtIHaePRl2
         a8TgbYrwlk3HwcOhOAuCNQmrC/6jyVj/90IsbLYuc98k3MVv9mPfUCpfXoK21bCz6nUS
         l/cFG1ytrDX2Mfg9E0QxrXoYjql2Vp8HIdt3b6XyqBRtiF4Ig/Y5p1c/lvNj76zFF0bv
         u4UuBx9tdZJp+Z9/H4xnMtSDPeGzg7mE4QjixgN9CssFJ8Aaxb8qURlpzajC8g0KoB/n
         5XLqK5pv9dpQwdng+/3cBBmK+4BAjXoYHm4PxZt4FDFLAu+4TCrPzf+TXdcZ/N0YA/yC
         CJDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbALk+uW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05620a430400b00767d572d659si4223557qko.456.2023.07.23.09.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 09:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbALk+uW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNbVc-0003o4-Lq; Sun, 23 Jul 2023 12:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbVb-0003nh-Ge
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 12:00:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbVZ-0002j7-VF
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 12:00:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso2837236f8f.0
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690128032; x=1690732832;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LktNimRU9OwO6Zs5tm9aqCj3B/sEkQe0Lm4USeY7rUU=;
 b=lbALk+uWq9hjF6z62BCeAyIhshISXUkUAxvwFthM4CmjuLzrMhAeqdXPvSfPXEjqj8
 XdsMkb+z9KR5BVpnyv8vUykwoP4Jc1OEa4CD91u/HU+PpROb1DuzUA0gPtbds+U0cqru
 IosMzRQ4oV/GHiPpggBB5hXTVeVpdzgQF4pH/ZQc1N6n0p/vFAXlscgd1DInfniqsFTv
 PnDHbmHnaHyM+xrw08ZySQbpTlSAW/79vVgZLrhWD0PpJGZ4ecos8OudqttAYokRe5sw
 Zx2MCotsbJ94xsty0SCFJvgav3zdpGcY3OQ+EBkLOQozE5ZkRlvZa702xDfBFaLIjXSP
 fmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690128032; x=1690732832;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LktNimRU9OwO6Zs5tm9aqCj3B/sEkQe0Lm4USeY7rUU=;
 b=S0fIc4SKA2ku8ffezlRajdze9imcl7U7lIB4BvkYlqhbNFKV9aV8gxGaSXGxyFme/J
 RND6oA12ZxTmIq017S+d/G0ns0nhhBZQ/NdjnZHOJEp1VjEYMBa9HadG6C088cUVS36+
 FWdt/ptY3Bm+hLlZpg+XxnAPxJhOL1PCrxrDL3215Ya35ZuB+JkwpnEOR7oM1+hqAt0c
 FJ+Wnteu4JeW5Aj7kKrrTfxcyslRz7WiWyDg9EKFBLy07Mv9/1Av0p20UHM9Yp4LZDEx
 5E9urd8C7SCQhWUewarK5KwdlMX/0jRKbsM+QFaeqcxfOP7x/joOdf5tjaDpQyKOtn1o
 U+oA==
X-Gm-Message-State: ABy/qLYK8LghzQGL+R6y0mmApljFEQMqY1CJgpP4Xc2ON9ZY794o5d64
 8g0ybimP3KOh1dbJ+W0jMgw6Ow==
X-Received: by 2002:a5d:460a:0:b0:313:df09:acfb with SMTP id
 t10-20020a5d460a000000b00313df09acfbmr6364699wrq.11.1690128032441; 
 Sun, 23 Jul 2023 09:00:32 -0700 (PDT)
Received: from [172.20.2.224]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 o5-20020adfcf05000000b003172510d19dsm10094909wrj.73.2023.07.23.09.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 09:00:31 -0700 (PDT)
Message-ID: <58f041c7-8240-3fda-d099-a29cc3b20639@linaro.org>
Date: Sun, 23 Jul 2023 17:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/14] target/arm/ptw: Report stage 2 fault level for
 stage 2 faults on stage 1 ptw
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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
X-TUID: u/u9P4Gk9tVp

On 7/14/23 16:46, Peter Maydell wrote:
> When we report faults due to stage 2 faults during a stage 1
> page table walk, the 'level' parameter should be the level
> of the walk in stage 2 that faulted, not the level of the
> walk in stage 1. Correct the reporting of these faults.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

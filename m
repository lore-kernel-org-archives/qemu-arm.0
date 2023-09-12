Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2241104ejx;
        Tue, 12 Sep 2023 11:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSK2KR0d8H4xf1RS0K9AHHZdM7tkK+8P6Po+IeXlEW+jko4Sl3RWu26+Yd9Xw/nDUD9jc0
X-Received: by 2002:a1f:e141:0:b0:495:dcd2:d12a with SMTP id y62-20020a1fe141000000b00495dcd2d12amr424860vkg.9.1694543620184;
        Tue, 12 Sep 2023 11:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694543620; cv=none;
        d=google.com; s=arc-20160816;
        b=LMotMv9MEqUwMJuHBslrwCnPMLn1Bvf56g2nQYjEQc7ecGzvH1cCmBhRFKlc+YuZGY
         drBw59RkRmVdD3ZKyLXlgktVdJBT/fLZDXC1pOTjZzg4XPpPrmLmAISuPbBAZImDV0zL
         mFRJsZs8NfokzjkzjpTHlfpuZCWwHhq4shCB7BbNWTuFxjRfnBC0Bi9m9RE+c0GiALQH
         aPrEO7m2Rlcg2P7FBrSfcIjO70JE/UxcXY72TyxpZOTXe9yf3Yi/4jc27iUk4FvEFca/
         aaRRXozFZ0uR0Ojpi2z9AdnVhe69HnwY4Emtwr3IZZB7aCewjZ76Yep+AT5cpj5971DR
         4xQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Yvv5pAPF0Q8GYqhUkDSkOKeTg44fnBBhzsIBvY4GnEE=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=so/XKHE8RyYkAQVAy+j1vqN+npw/xdytk9I9L2UUx9flvSexMRje3id6zUWBbr1LEy
         ggK150O6LJJe686HnXeZjQXAkvY8o0lmB3oJX3AiUhynlDZbiIGHdDhYssMz6SRYxozK
         nDRnx4SoJjlWX5BE+OoyAdDWUFFPYDsVh7mWbEDKM1h7Cy5YxamJVs777vJy6eayhrr0
         VK/PBuwlv6Lpk9li/yo/sG8/caEC6QUQ82ek34vqK8MDaS7QHq1KZtxpvSv3H3KFxY8x
         kiGGwXB2Pff0CNmcK56qP+Eai7y2kAMiRJgInroju3uZ2QqhHtqlEMpzu27O8GUP3aLX
         sO1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSomGGYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a05622a01c700b004121016f3bdsi6869184qtw.216.2023.09.12.11.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 11:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSomGGYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qg8CJ-00075h-7Z; Tue, 12 Sep 2023 14:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qg8CH-00075C-1E
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 14:33:13 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qg8CE-0008W0-Tw
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 14:33:12 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso4574315fac.2
 for <qemu-arm@nongnu.org>; Tue, 12 Sep 2023 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694543589; x=1695148389; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yvv5pAPF0Q8GYqhUkDSkOKeTg44fnBBhzsIBvY4GnEE=;
 b=dSomGGYK0s80f4hKkJzuPcxsl7N2mPOTm8QdIIHUIrhp0VjpcxtcElktVHAH1N9f0s
 obptY/E/f6aW21xdlLRDzMyLzzfXVvR2HjOpHA6QtrnrVvIkA5xiw9WCK+uHPxccxycY
 K0A1asihRQKe4M/rORXtAWpakbkpllNnI0YkCDeYWGhMiqE5B59NFByUL/vsWm9wiYC+
 Dfo8t23SA5IvlOHM7aWhQw6r8jOA5zyZjbA65hwBq/BYyRvtaRnzIlpxu79BloMU4W/p
 Ay6JJhsdIjz/5ZbGF51Mz9auIfSOdHO5AqdfnX1uQQ51SRkYa8mNosTVT9d2rCp9UmUL
 pEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694543589; x=1695148389;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yvv5pAPF0Q8GYqhUkDSkOKeTg44fnBBhzsIBvY4GnEE=;
 b=ZH9pQny6d3u5B611g2ATRIS9H7erNSYOwO2zeKsRnDsJLmpfNrjhj92iokeUtUcfUk
 Hz1x5vh5de+pdlOVwSBCmuKC9z0ZFRt7yw6K3MDVUnL+5l0PQ52Y6m7V4UBZ2Zr5Vx+G
 RKqcT9bH38JBEiiT6z647db/pEsI1o1IV6sod2BoxQxAAkMQ63MkbeFRN2LCfehMMFrg
 egxV0bbiU5XOExIThBP7I2czsMVeSXBJeb4wKYuXpS3sIyHOXLPlP0bjR9r9+W7uEl/2
 Nneh9bR1gUrk5pZR/po49ETgJmRzaj0UwT3qEBQy6OhkEVSFY96uzv+Hjuary9bQQl0c
 TmXQ==
X-Gm-Message-State: AOJu0Yy2WDagZzxpub8aeowJ6Z0tfPzXcagYBEdDo26EdwnLlphjX5WD
 E1CSlBD1ddaCAlRiryncYvFw+Q==
X-Received: by 2002:a05:6870:b61f:b0:1d5:426c:4c13 with SMTP id
 cm31-20020a056870b61f00b001d5426c4c13mr409493oab.14.1694543589483; 
 Tue, 12 Sep 2023 11:33:09 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a654145000000b00565e2ad12e5sm6542198pgp.91.2023.09.12.11.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 11:33:08 -0700 (PDT)
Message-ID: <e810b42c-83f7-1ea2-a106-25004f550e42@linaro.org>
Date: Tue, 12 Sep 2023 11:33:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 11/12] target/arm: Implement the CPY* instructions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230912140434.1333369-1-peter.maydell@linaro.org>
 <20230912140434.1333369-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230912140434.1333369-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: qjjlGzG/3Tmd

On 9/12/23 07:04, Peter Maydell wrote:
> The FEAT_MOPS CPY* instructions implement memory copies. These
> come in both "always forwards" (memcpy-style) and "overlap OK"
> (memmove-style) flavours.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v2: - separate helpers for the 'forwards' and 'move' variants
>      - fix cpyfp saturation limit
>      - cpyfm/cpyfp are always forwards, not based on Xn sign
> ---
>   target/arm/tcg/helper-a64.h    |   7 +
>   target/arm/tcg/a64.decode      |  14 +
>   target/arm/tcg/helper-a64.c    | 454 +++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate-a64.c |  60 +++++
>   4 files changed, 535 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

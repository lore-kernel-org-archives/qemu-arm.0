Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3863538dye;
        Wed, 2 Jul 2025 07:47:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUn8CKeT0iclpiRG5bTHUGj/zGvl73kVLPuhchA1nrzHM0RSgAyShjJub42hYcb7t+i3Gbh9fkOqsQ6gg==@linaro.org
X-Google-Smtp-Source: AGHT+IG99gyncuYbXv7r/ObFMi8IGajqc0l5TvnAXxXdv7n16aRlayr3IuV1SCrqPKStR9E4IYFk
X-Received: by 2002:a05:6214:76b:b0:6f8:d223:3c32 with SMTP id 6a1803df08f44-702b1a6b1c5mr54610636d6.10.1751467653083;
        Wed, 02 Jul 2025 07:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751467653; cv=none;
        d=google.com; s=arc-20240605;
        b=Jg6SDxyYPXEadtWm0ANAeC+yLZ5dH7dc2RHgQY7BhmAQTl805JfNjqHi5dlhkq8KPv
         PPsOqmisAYaeC9qyy6PDpT6+y2X2QWjzScS+z7cy5Qw28h/X2SG+CxIfSHm0OgVlJ+L2
         qeg/jBEuTKtLpL49fKD4WFIDjOwFKUJKzUwuy5vvQwMMeJSr2tTVeTvcL9R+WqMjJEHK
         L0bjZ6D3+DenWvgCkPCein45xbDj9XjXo++QWcXkw+RYBPQMIrd6bOsCnBx0SUYFuyKd
         7DkIV/iIQSFzJaTY5cgmk9wM/wG1eyFEuQM6nVzbz95LxHmr194fMcy5trS/C3eBvEeV
         FUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wE2NJhZzfHMjWPw6J95V0JJh24YtdRDgF779MCj/UlA=;
        fh=k1IFeTxJQUU5nA1U7HidAvR8Pl8+jz7akMNwKEo21QE=;
        b=QRc9B/+AXYfERTQ9EJDav7nrjIxfppgKNHBfc0xux8ovAVSSm8WycJuTD0nk6aMRbZ
         kvY7Zr3Wz1gxmQYFCplCes1kiZSkaNzvfln7vcfA8YVg2HKD/51WAh1wycGF5YWiN0s1
         YC5MptI2+SzniSLsUmD6yr9xECcPggs4hu/sAMo71rUTEa01LlX6lAKu5vb6RBukBwB9
         jnZVEoYOawYFmSbUbIGMtfyeao9VcEepz6ZiZYW0P8eUHycM82JmFqhRVfNBP1vrL2wY
         LCBxY4GcLhVBbbkQYa1KX9AnT6f/ZbvF7v8zgQamwdf05nFWtv7E1mmyoZd0dXqPI11v
         B/8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G1z3/evP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44327e1d1si1262999085a.488.2025.07.02.07.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G1z3/evP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWykA-0004Eh-1E; Wed, 02 Jul 2025 10:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyjz-0004AM-7Y
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:47:19 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyjp-0007r2-Pf
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:47:15 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6113e68da82so2732634eaf.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751467623; x=1752072423; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wE2NJhZzfHMjWPw6J95V0JJh24YtdRDgF779MCj/UlA=;
 b=G1z3/evPLZ5RsAS7dwnry6Fb3q1Lk/oqdXaAWeAGIqerMllEdSVSZaJgPUxAeJDRFi
 LdQKz3WtnypErMpX4K9TXWKceZRaGwoycEYCiNyOosh22KnbSO3iGtrlFPDfOvlfT5ha
 0sqwzBqXfi6IfF7hMqKU5os9hZy8m12BTgzRbh4BbOuOQm9m0VV4Pl+9RIRfD8yXK2IO
 dlE8gwBCNB8tnJ/fk5gARt13g8IEdGh9UA34+VbARYyqJt5OuBikXgM7wNEHM73NStTb
 uZwBPuFd78qFqbSGweMsDAxcaefO1lJ5ql7YP3nOkGwE5naCXvb93hSxCLhyfeS6YRyP
 rqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467623; x=1752072423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wE2NJhZzfHMjWPw6J95V0JJh24YtdRDgF779MCj/UlA=;
 b=suDzqi3kTYWXjQdwjRw7J7Y7/q+P8rMs/wek94BAtsO6pkTHHtOgGp+q9ekQq5NGh0
 Dl8zrlHDtSKmDiIOpqB9SoB5CZRlBlsaXPeX9Dd4ArH2X9jTDqPQoiSYrioJ8BdeXyH+
 FgKcDKv/Ns/KcZt+ElGLVBs4LMNOHPXVibdO4K9I+Ck28GsJwWog+P+t1F5ZIkyFNDTU
 PC3uu6ExiCw+jQLKGUqlDq6Ncptfo8xQVfsF/I1SBCbyxc9GeUApzSb9vV9PSIFA5E6Q
 JXPFHsLKBUg11H/Y2VGH7rMo+rJNtidEr6V2zkPBsWtrdyb8uQcPn0Pa1bORtU0VVDPW
 eLgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGKUIGtfjdMJAdcSEEHiNqbsLFSVJ5CLR2tBYzNKvH54Gd8L+eisLT6mBfBTpfN6KpYwWTK511rw==@nongnu.org
X-Gm-Message-State: AOJu0YzuEN5vwl7Y+y8IukZBCtAstonRj9B/EmqQGT5r48Vlsd6ZFCob
 mZMWwcn4Q0U2CL6jQFHZ8CxKmXgstLBHjEVXQP4EwAdy/etUsiV9NzNHD7m/dN+9xO8=
X-Gm-Gg: ASbGncvDI+blteMw+cDq6c1Bt0iVW2JTBlMLx2T0bNjipCK076VV9PE0xWGZjFeIZ/Y
 xjLTcj8aGDrXXz6iK0wu4zdypwaThn3F36qmc32szzsWkAocGNhahczoOgcXd/mtMcUHmnwOTlY
 xDI9zXpTvDHHWsjqxlDrj+uVt+65CRoKmQ4MIFohJl8A6MEYqqtL7SXZaraDTIwRNRAURsh+Tv1
 7bhoztGjOSUesr3ck7MG9+b6srarP3k4DfWJPCsnJHJAvOY4xNl6k7k/keNA9dKLdE3ElvQUlf1
 42jk8LpcwyQJdx5p/ha+wiU8OQDiqbHSZeAA5y0aSDaQzjFV6KCB3Ts9A6yW96P6oohs4VQRLL9
 Z
X-Received: by 2002:a05:6808:1b85:b0:408:fbed:c3a5 with SMTP id
 5614622812f47-40b8881836fmr2033959b6e.20.1751467623504; 
 Wed, 02 Jul 2025 07:47:03 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b32420a6bsm2569065b6e.40.2025.07.02.07.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:47:03 -0700 (PDT)
Message-ID: <25204232-47f4-430f-9e33-f564e76a9a31@linaro.org>
Date: Wed, 2 Jul 2025 08:47:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] target/arm: Fix VSTR_SG helper store alignment
 checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-8-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-8-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yJYPUcX3ABGl

On 7/2/25 05:19, William Kosasih wrote:
> This patch adds alignment checks in the store operations in the VSTR_SG
> instructions.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/mve_helper.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp533182ejb;
        Sat, 2 Sep 2023 17:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmGZ43bsG/AyTaQAuyI3GNxmGlJAm5N0l1un4MWy8j9kKtvBLt/pXPub8UoPWmP40de5u
X-Received: by 2002:a05:622a:ca:b0:403:297a:14ad with SMTP id p10-20020a05622a00ca00b00403297a14admr8365486qtw.38.1693702293676;
        Sat, 02 Sep 2023 17:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693702293; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbWt4nnFuK4f1i4/upIY8WnOkzCTFyJHhi+l4EimSAfSIPhM6sA3/4pPm34f+POgby
         mr+GGIg7ROG6frDIO7X+gqDnO4lk/aawKuT9yms/KWAAk54Het+jiGoXeL2059er1YtK
         5P76IkmmGqLjxRfZBvBidAiVwDNKkG4JRHea3wYUnP0OUsb1O0kTo4lHu4W7nWnsbCdi
         Ssc8sgt+GgK3FIbr66Jv68PCsySo4c7C3r/xWv9bott6CdMMxMkYV8w8DSv9pBPT6yUW
         YtvcHVSJ3LMB20/wmAD+pWoivA5c1mTf00eV0LBE17hgB4pVSCevD7+AjK8IkUgLKrUp
         hWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bTFmXBBzplCEJU3kIhLsj/2Gs3egDkrSa0QUkm8kK14=;
        fh=6pofUkduMu12ECZ6VJyG1KTTnppAGc36hfhAdSMMFoA=;
        b=DtGO5KKVk6J9Uye+2lLvUmvE6ywGg/G1PnSETCIyT5i3vW0n8eKuhsTYjMiyoIuFBH
         oZFUMPhCBC7+gu5jpVzC/PT3/NCgNgHpbYDwhGyTPxFowMYkwqN7gla1FvJ8WuPlEh/f
         ocYyTNX3Nc2f6hZ3a3GyNYvNJAooGsg5lEwWRZXjk0WpQttPqgLE7iW6fjYujhVfad/8
         Nl2XLlnh6IzAZ5sVllP7cDBN0BnY9bR1FwYqtMGe9mcqZKzdpbrXTQyGtWGPJliMJ7U4
         DrGO0+3ksZ6KJceftD5N82u046GuAbXgOQO+/UYBnRsWMW6k+aPNcj0w4zknnb7ZWNN3
         5CLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AI4vk0wr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020a05622a178800b00403a9dc696fsi4444842qtk.159.2023.09.02.17.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Sep 2023 17:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AI4vk0wr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qcbJk-0004Mu-BI; Sat, 02 Sep 2023 20:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qcbJf-0004Lh-4c
 for qemu-arm@nongnu.org; Sat, 02 Sep 2023 20:50:15 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qcbJb-0003Me-AO
 for qemu-arm@nongnu.org; Sat, 02 Sep 2023 20:50:14 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a8614fe8c4so226798b6e.1
 for <qemu-arm@nongnu.org>; Sat, 02 Sep 2023 17:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693702208; x=1694307008; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bTFmXBBzplCEJU3kIhLsj/2Gs3egDkrSa0QUkm8kK14=;
 b=AI4vk0wrFiXKlDmemPyrRcKlbaHHzyDjx40xhqvo+Kwhwv3PhmY4ROqxT9RxTGfhBM
 T/Q0Uwr59sabhWA7GftxP4lDFi2Iuh+5N5TPBS2Fn9ggwnoGHhTwjS/u9rvpMRIzewaZ
 7uHYzabmzrDPtUxNvXPGYTQq4H6t9MyeepMZzDiMkthIXOe6XxClNDqQuttnt3o81uBo
 gcNumvbELXVnOos/5d6NL1ivWXs0JK2gaH/Jg7m+fiFvdo9kp8TnQwmxp+cIG8U3C52a
 Q9Mjv1Cj8JJensK5gLOb2bqV0qwkVnIxNr2lQo1DtiPLbWTxSOF6asYbLG8P0JudbBpI
 b6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693702208; x=1694307008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bTFmXBBzplCEJU3kIhLsj/2Gs3egDkrSa0QUkm8kK14=;
 b=SrqX+T21XPANICq8/kyy6lIZm/2a9mB8VhKWV4ZjX0hVVFF7xnk2rznsoOTDDeDc7F
 Z6A5f+EAplxwYonMWbrKbZpdMnvselSsn0Khytyn4amQ+NjZ1+JreM1RcgrL+TRCLguP
 5TOVexWRAPYRSJlPqC2BTENQHZSdYXrn0qbl49ut/N5jbgLZYPBrxmGOWaOgYFEoJlNy
 Vn4dtqoMKMhUwldlkOZDGxjUdf454yHz0jU0hoOHXZQ+K+FqZWGxdT8ZOKm8z8GZf9e8
 lHgqH3mNA+JWKlEPW5Oq7xFN6Ack+2PpkQBznyXz7QXzjgggGQcu38R90AyEdG3eEnh6
 C89w==
X-Gm-Message-State: AOJu0YzKVnFfZniFqBfOyJzqbAwWtpPAlQHVFHLDh4KzV+AlNnXA6lpO
 ChSTNAtv+MUbzXhRG1xjm/eOIA==
X-Received: by 2002:a54:418c:0:b0:3a1:e85f:33c3 with SMTP id
 12-20020a54418c000000b003a1e85f33c3mr6857484oiy.50.1693702207955; 
 Sat, 02 Sep 2023 17:50:07 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 gw18-20020a17090b0a5200b00268dac826d4sm5075131pjb.0.2023.09.02.17.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Sep 2023 17:50:07 -0700 (PDT)
Message-ID: <b4b598c3-293e-d1fd-bd2d-662a669f73a3@linaro.org>
Date: Sat, 2 Sep 2023 17:50:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 03/16] tcg: pass vece to tcg_target_const_match()
To: Jiajie Chen <c@jia.je>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, git@xen0n.name,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 "open list:AArch64 TCG target" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>
References: <20230902050415.1832700-1-c@jia.je>
 <20230902050415.1832700-4-c@jia.je>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230902050415.1832700-4-c@jia.je>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
X-TUID: 97YOlWy2XCS1

On 9/1/23 22:02, Jiajie Chen wrote:
> Pass vece to tcg_target_const_match() to allow correct interpretation of
> const args of vector ops.
> 
> Signed-off-by: Jiajie Chen<c@jia.je>
> ---
>   tcg/aarch64/tcg-target.c.inc     | 2 +-
>   tcg/arm/tcg-target.c.inc         | 2 +-
>   tcg/i386/tcg-target.c.inc        | 2 +-
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   tcg/mips/tcg-target.c.inc        | 2 +-
>   tcg/ppc/tcg-target.c.inc         | 2 +-
>   tcg/riscv/tcg-target.c.inc       | 2 +-
>   tcg/s390x/tcg-target.c.inc       | 2 +-
>   tcg/sparc64/tcg-target.c.inc     | 2 +-
>   tcg/tcg.c                        | 4 ++--
>   tcg/tci/tcg-target.c.inc         | 2 +-
>   11 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

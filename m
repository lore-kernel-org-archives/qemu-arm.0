Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2484526lfc;
        Sat, 17 Jul 2021 13:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbfbcHjuG+QN8FxBGAZQ0JHLwKmd4PQm2BxNSHwnbgttvBAWe06z1O9UtUpWCer8uz+A2u
X-Received: by 2002:a05:6e02:78c:: with SMTP id q12mr11460961ils.243.1626555070084;
        Sat, 17 Jul 2021 13:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626555070; cv=none;
        d=google.com; s=arc-20160816;
        b=aCDVvn4zCq7DtF1n6XmVIy7pWqanBwC0aR+Q7UzV6bEDU/B3boI1o9T+we/c7YUGFU
         EWkb48GgLp0P+em3zBqNum7QPh5dTZwwgXRIN2v0OMG3dzgpo6sMhCshQCtPEkGJSZeK
         3g66x3/UimSi8sYkYetOAwIzPqZLuy24DYbDgHKrACZhVBq//ppVDICoSUE60DzAkOO6
         8FxQXGvAYEDOs3Heem6wW0uulTzcnmKVAQWEk8aJDGT08sjbOdRkTcQPDLAOstvGchNe
         l7LTpzrP5+4EJn+kz1pjhPPRb5GFvtxsqoUmPaETCKUOBn/zgu9FoPlsuxBVNRRGhT7c
         C8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lrqWd3oSURLVeTHkukXUjh2mk8NfVzvS6HiZojwEMA8=;
        b=K5b+Ia2197xlL2vYTTNWUaj/CJ+94FuOmwLEE90xJ1DLXG8qid1keMQOu7ra9aF2Da
         W1bUqMpJSpocFPn2CJuyzchJRwRvjsIZMO+xEiKkhy4XuEu8xsYJVTtM5T10StYi7cs+
         bHh0rLX4WAebybX9AsvFAPuBJDVNJlqiI2Wp0R6H4ex8RfW/MJ3cKVQMsgb4Y+sMWjjh
         JFfMKZECVM5xAvAc42WYjnMp+tvb/wYxOh0d7srkVH01aaBWIUHuPFLRyIhFBx8KW1v2
         hehBHlZ3Kp+lFGC2yWsVRW76uNctq9OXbutaGmvkco1mwl11Vfw5sSM2gwad7G+1qUhv
         vcwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wetGUf33;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si14727160ilm.61.2021.07.17.13.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Jul 2021 13:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wetGUf33;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4rHB-0003BM-EG
	for alex.bennee@linaro.org; Sat, 17 Jul 2021 16:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rGw-000387-Ds
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 16:50:54 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rGt-0001aG-7m
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 16:50:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id u3so7404907plf.5
 for <qemu-arm@nongnu.org>; Sat, 17 Jul 2021 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lrqWd3oSURLVeTHkukXUjh2mk8NfVzvS6HiZojwEMA8=;
 b=wetGUf33VHAw6y/p6P6iB9P8M+2BaZkKYSsiA3dVWm7qJE9/hCqo7FBwzOz2w28yKY
 al0/k9UGQxdpL7dK+xXHANwuRWzgoLrYOBv0HOlHG7/YxCBQWCinDNozJ2zY510bSB94
 XQeJ591Ym4z+aNd8npm2tCr6Jb/G3wQiH4TEcE5taApVT/GIdstW82Q45j2HfPbbLD2u
 pYESYNIulWvWMI8NiuKvzQFzFLZYaR5F061lJyREXK3WY2uau8/zv7cWlV//axyAfMWo
 NnzUUupf/lX8wIoeaBaFJ+MWTeZQm5PC6pNgi8+LxihWmqcOXnU5s6DqZD3csPOaCLoK
 2YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lrqWd3oSURLVeTHkukXUjh2mk8NfVzvS6HiZojwEMA8=;
 b=BH+9u4HlqjieFxhqqm0/CHyK5hb54eY113/1OY/Z4cNEbEtenyQ6DJGRD/0Rl4vT1H
 RGb9KGqDV2NJwq/C9KM4Gvw/1Ai7BVclkluajljZLjSOy4eyUfC3YecBcf7s6vsJoWhF
 n26BimS2DMk4BQ4S7ZZIkLd0zTmh9rrD5wWVYa5t0QWrmjZDtYYeEBOTplow8WBfdITr
 lCctL6Eet0e5oy2HosiRzw6V35z8+tddQJsAUFscMkc3QqORuoBKYYW7EXDkOAFtD5ky
 FxNtXI6+isFLxPcnKgjlkzU+tiY6jLS8SNL/aXgdLTwqwwHJ5HwOro+owo+6/hrA/1Vr
 j5XA==
X-Gm-Message-State: AOAM532mxHDAuoCg8vSnLIgnAPu+Ta4YdNSjAG4cQtSmHW3P2Q8QYoo0
 8sB3jQcnG/DbkUT4sr+g7UxZiT7pW2wRJg==
X-Received: by 2002:a17:902:b60e:b029:129:4665:1106 with SMTP id
 b14-20020a170902b60eb029012946651106mr12939815pls.25.1626555049406; 
 Sat, 17 Jul 2021 13:50:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q17sm16946646pgd.39.2021.07.17.13.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 13:50:49 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/34] target/arm: Implement MVE VABAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
Date: Sat, 17 Jul 2021 13:50:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOyzz3kEtcgg

On 7/13/21 6:37 AM, Peter Maydell wrote:
> +#define DO_VABAV(OP, ESIZE, TYPE)                               \
> +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, \
> +                                    void *vm, uint32_t ra)      \
> +    {                                                           \
> +        uint16_t mask = mve_element_mask(env);                  \
> +        unsigned e;                                             \
> +        TYPE *m = vm, *n = vn;                                  \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> +            if (mask & 1) {                                     \
> +                int64_t n0 = n[H##ESIZE(e)];                    \
> +                int64_t m0 = m[H##ESIZE(e)];                    \
> +                uint32_t r = n0 >= m0 ? (n0 - m0) : (m0 - n0);  \

Any particular reason you're not using TYPE for n0 and m0?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

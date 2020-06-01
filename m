Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3543202lfc;
        Mon, 1 Jun 2020 16:32:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMkofW4bmtHOHosJTwZvPPrzt7kkNCCfqyIruNUjdj0kgBrgxa36SSRuZkHJ3z7aAh/ge+
X-Received: by 2002:a5b:14f:: with SMTP id c15mr35856394ybp.469.1591054379327;
        Mon, 01 Jun 2020 16:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054379; cv=none;
        d=google.com; s=arc-20160816;
        b=EjKr0vgP55vtIsvv9sgPEdJAYOW9ktpGLHgoCLkr7ox90QUz51t6WCWqUn7P+Vdq7/
         Asc1xngs0DYD9EbOkEVJiEqAlJmJbnyS+rEudQK6BKZOAwiZI89q2GuOEcT5ezMDB19G
         3nmeMXFg96B0QgAV7R0yngw6DsI42LIwWjvgEwZf22ZcN5A8SFt5OeizNAUt9jl2T8XC
         xb5DV/so0vcQ3JcQ8RpIN1kwgUQQZnT4oW8VlHWO0uCIvOHKQg5pGt/05dPS0QK0iyoW
         BkAaj49xl0UY5XVdbV4V2FZCqh0BeHymAKJoVEhB5MfEQvChyVOrGWPYkkSbU4E7rnaM
         SdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3NwXwaOS4bsl4n64jesA4Ntvw9Lu2J0ZgAaVflE9IRY=;
        b=vtE9e8reJfhSNNMyqro4/u1c70I9yP0XLnsZIfJQYFsAUpH4ALUC243EQkok5idV75
         F7N0F2jNM3KQUXnJHUvU+GFZqOILpbwC4F4xgw0nF1TN1hC7eRHTNhdS/3Gcuonkjjb8
         +r9FsqqyYXEwBLiEH78BJ3GaZ8r3jTmaOkB1awjYZBXnqLqN1+FzCP/pf1HRgQy27JJR
         1ZasijWrejX4BGTAYRTcGRdzNFtIb7iw8Ydkgfb+9cq4C/sbW/zqC+xZXdA89eO21xiO
         KFAFXqV/oz44y4kRHu7qYtIsKsW8BEySGcgHB5FwqJaGe73V7rdRoBh8HcW9fw2k0mhR
         meVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5oP0kW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si584219ybd.79.2020.06.01.16.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5oP0kW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jftvO-0006Ly-N4
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftvA-0006Ip-EF
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:32:44 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftv9-0002Zb-Ab
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:32:43 -0400
Received: by mail-pg1-x542.google.com with SMTP id 185so4188853pgb.10
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3NwXwaOS4bsl4n64jesA4Ntvw9Lu2J0ZgAaVflE9IRY=;
 b=d5oP0kW20S4B7cQ8gpULDFqaqsY6aVZGA8+82sIrRAoVUG9y4GgYqlVck3yPM6lhn7
 tj2q2kJP42IqwceX5xUT5/kSSGVKPeFpCiPm7AUjOJdTL4+i9d+Bttkaquea0m7t4+rb
 9bKMMlJwKR/jfQRKjHVizb/pJQX7VkrI0aGnwI7Gt5mGQHuS1L9Ct9/UnGmrhOiF+dGP
 wwdbEVkim5DZWLw7Yr1vq77KmKd/TIRp2JF9KSYcSM3x0qvqQZ/t1GySPGT56pUHxM8r
 aw2qNVcpAj6oQo0Y28GzhXnpXWhItpw6hLjwug4B72tlV9agIZKGXdBzW0kebxS0kwJB
 Do+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3NwXwaOS4bsl4n64jesA4Ntvw9Lu2J0ZgAaVflE9IRY=;
 b=n/3W2OGUl+4pwxBQ3nPkSaAzqXGzYorhLPavoY0axEM3fPbt/qxgNj726a4bCofht/
 GOdeIbYYEZuAV+e6S45eox8lbmie9HPIJElvMrcMqwUi84E1F09VsHcxHFEO1DSB+ws+
 EdJEiQrdI1SPcPzqJ/nWbNEDeqMX3Osz3s6QPjNjzQEDuxx1PPzSq6w25Fwd5t8VdIK7
 tjrIh7oZPv/aseobrtUKG0NLWcOZ3bASn5P2kHCiLU9StnV8lspB/IFQtiEb4Cp7PVS+
 agLqiaGcajRewysTmqDKM8JJoRoOAUJbpAQk6ErYRArZd3kChWt+9C/HFwmMAMfZmNM1
 kThQ==
X-Gm-Message-State: AOAM531NtBlvCgCm77UoheYpQ/FckwRqEJCW1LlcUC9b8eSCn1RuFlK9
 DUX6YDOAlTHtVvT4OAv5isjprQ==
X-Received: by 2002:a63:7519:: with SMTP id q25mr20874424pgc.224.1591054361018; 
 Mon, 01 Jun 2020 16:32:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 191sm424256pfy.161.2020.06.01.16.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:32:40 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] target/arm: Convert Neon
 one-register-and-immediate insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200522145520.6778-1-peter.maydell@linaro.org>
 <20200522145520.6778-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb20b110-d91f-21f7-8726-d254a828b0df@linaro.org>
Date: Mon, 1 Jun 2020 16:32:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522145520.6778-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: X76DUAD2q8I1

On 5/22/20 7:55 AM, Peter Maydell wrote:
> Convert the insns in the one-register-and-immediate group to decodetree.
> 
> In the new decode, our asimd_imm_const() function returns a 64-bit value
> rather than a 32-bit one, which means we don't need to treat cmode=14 op=1
> as a special case in the decoder (it is the only encoding where the two
> halves of the 64-bit value are different).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  22 ++++++
>  target/arm/translate-neon.inc.c | 118 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 101 +--------------------------
>  3 files changed, 142 insertions(+), 99 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

because this is a faithful transliteration of the existing code, but...

> +    switch (cmode) {
> +    case 0: case 1:
> +        /* no-op */
> +        break;
> +    case 2: case 3:
> +        imm <<= 8;
> +        break;
> +    case 4: case 5:
> +        imm <<= 16;
> +        break;
> +    case 6: case 7:
> +        imm <<= 24;
> +        break;
> +    case 8: case 9:
> +        imm |= imm << 16;
> +        break;
> +    case 10: case 11:
> +        imm = (imm << 8) | (imm << 24);
> +        break;

It might be clearer to use dup_const for each case, which would more closely
match the pseudocode.  E.g. here,

    return dup_const(MO_16, imm << 8);

> +        imm |= (imm << 8) | (imm << 16) | (imm << 24);

    return dup_const(MO_8, imm);

Something to remember for a follow-up.

r~

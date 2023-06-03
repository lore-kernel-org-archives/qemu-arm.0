Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1614387ejb;
        Fri, 2 Jun 2023 23:10:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wV+JIKnUxogPT3Su4GZkSZ/Z7fOORhj3FIKW8GZkwQIsRCThMtHU9M3MASCAeYuc+FztO
X-Received: by 2002:a05:6214:4105:b0:625:8575:d298 with SMTP id kc5-20020a056214410500b006258575d298mr551149qvb.14.1685772611988;
        Fri, 02 Jun 2023 23:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685772611; cv=none;
        d=google.com; s=arc-20160816;
        b=PKgrz1VVH/bzUclwl5c07doZbeZgKEErse9ZnuNtBkk0zQDPLYtzGF5wUcKl6o+P79
         xbiSqwE5QR1chr5YzNdnqSqz8WknnyNQEuJJO4zNiAFxA6Lv7Gnphj4ShuTJXHBKEvex
         ElRpDW/D0qbHPXpfGwQT3FIhDGh5mr+K1qYuqvuChjkyOHkR8kX53QD1LVgE5NokmHXJ
         37wBA3RFpUvivRL7Gla2oZgsqFs76Ac7fQSfWcSu7fPixV7cBVd3tq16o0eeohRbuBw3
         fuInZ/fo7JI2A4yH7PS32J7DDmskCMyi2KK2KBXKEpEO32S3nmWGIdR5kfn8oBkNiqc/
         8+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/BVnUD4/xN8HMF9BgOMr9cFZMOeJV+sr1gI7zpdYz7U=;
        b=XOXGk02iT03XGKWvG1Ayw/9GZm9s+4v4JIoX2lwuwg/Tx8M3im3i7foFEyJoqAm0yT
         jWkiO4ZRaYQmjtN60K7y3+T6GURlikfwQC5Zv5+OCZrxQaoqHY4XE7arDwN8XnoeN6fp
         /ciMK2OazkPoAdshhVYf5JaLGMc+BTTEuodzih57cCI10VLioQI8WmtNnfcV805aWR9x
         jINjAnHD0j8YD8JQUMbGK02ALJtJfxlL9vKLPqzLa4dZk9mPqGDXLp2YeeJpYOBYJYNm
         31sK21HCol8h+ZWSdGTpg9bLSCOktSNJ/IGkc9Ghtgj+Z5CD7RHMxXk9lTfnDgOKzF2H
         DTnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgyLmhZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv12-20020a056214240c00b006261c92791bsi1966869qvb.316.2023.06.02.23.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 23:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgyLmhZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5KSa-00028f-3H; Sat, 03 Jun 2023 02:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KST-00025y-Qi
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 02:09:49 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KSS-0006ES-1b
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 02:09:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b011cffef2so27755715ad.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 23:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685772586; x=1688364586;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/BVnUD4/xN8HMF9BgOMr9cFZMOeJV+sr1gI7zpdYz7U=;
 b=XgyLmhZaGkZwURE1s53X0ydbTQyQFp28RIJKITsuo28cBGU3aJmgvTZoW2gvJ+hbil
 vE012mf9KPyt4I1zGMcqv/qChVnZAp+Kzi3St/KL7QJU/7l141oQ4PafAeliHL3+E7yL
 hhajZEa67+jEx5yS99L150cOs7hdAcfAIFbmb0DQilNMtAQ8xsoU8gQ4XRH3cRf4naNM
 U8mMH5UQv/27NaBkoaaRVIiHNZzgjZQ3LGScQmXCYuSmlWaY+0NQFWJQcU0rrqW92lUv
 64mRf33O43yQbQYmImkauwakMSCkmLwL88OyvtMhtI/p6u2pgf//2stSycnmX3B/DOXt
 ReUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685772586; x=1688364586;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/BVnUD4/xN8HMF9BgOMr9cFZMOeJV+sr1gI7zpdYz7U=;
 b=LfDB8ghyDV/xJgmTwJtxZHKKqxZ7MrfH8dzT5KtR7L5BiQSjQwgawlxCM0Io6EPcGr
 tWgaiXr62x+q+xxuZD1c8HlkhQLzeT8McEcEE2F06lVk75JlhgBxkIoQekn/AszTObnH
 Gkyydt+c4CqVeo3WxSHbROoxxS4LCxMKki9/eN45IKH+LrqahUqqrXQHw9ZF9HvwSkxL
 yELV9kCERw3jXTwSQ/TS/RfY6SC7J3NQgWkgJ79IuEN4TaY3cjA3lSuLuTkAIhI0duVN
 5a/KST8a0L1htL4PLwQ/6cRnJnLIogI2gy7ykmpJPp8pchVHVDQ2+4F9ag5xzONineKx
 ESHw==
X-Gm-Message-State: AC+VfDzD3EXGq33T4J/dZtGg9QTPaaYeTFRe3/N6l4snFmKP8gO6gxGt
 Ata04IHZ4onI3KvBi4TPPgLyyA==
X-Received: by 2002:a17:903:22c9:b0:1ac:4a41:d38d with SMTP id
 y9-20020a17090322c900b001ac4a41d38dmr2244726plg.51.1685772586545; 
 Fri, 02 Jun 2023 23:09:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902c74500b001ac55a5e5eesm2375372plq.121.2023.06.02.23.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 23:09:46 -0700 (PDT)
Message-ID: <f887f9c5-a870-e5c9-c859-77ddbdcee76b@linaro.org>
Date: Fri, 2 Jun 2023 23:09:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/20] target/arm: Convert exception generation
 instructions to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: KKYHSxK5QxPg

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the exception generation instructions SVC, HVC, SMC, BRK and
> HLT to decodetree.
> 
> The old decoder decoded the halting-debug insnns DCPS1, DCPS2 and
> DCPS3 just in order to then make them UNDEF; as with DRPS, we don't
> bother to decode them, but document the patterns in a64.decode.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  15 +++
>   target/arm/tcg/translate-a64.c | 173 ++++++++++++---------------------
>   2 files changed, 79 insertions(+), 109 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1195914ejc;
        Wed, 27 Dec 2023 14:19:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6ukYmRc/hZqXU4nIApjNOXaGv6xpNewnzdbkwuVSAy96kft5gegLagK0Urt5RBl3lLyWR
X-Received: by 2002:a05:620a:4510:b0:781:5fbf:eeb4 with SMTP id t16-20020a05620a451000b007815fbfeeb4mr1667183qkp.37.1703715579587;
        Wed, 27 Dec 2023 14:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703715579; cv=none;
        d=google.com; s=arc-20160816;
        b=izOrU0ePQQSpjLKvdviZ+At8zZgnhhj9SoCJDcjswQ7PqidteG8pwwUcWUAGxtFxRO
         la4Nnb779im8Fi2iLELx+x5eqjDvYCVOfOsSihrXs3q3A3s22xVui1G+KlTc+gwMCboc
         Rt56j5WvX+kcOs4I6723ZWNh5rmXglSaoMq7OCGrCzwifGfmvW0Nsr1fX9ns4Xd63mIO
         Ldj5ww0kUKDkFrgT1XcSO0JJEqhUIfT2yRm42cIecPPJxsqkzJ16R5GLKG+9herEmmoz
         Rle4qVrD13zt2eALrDfWHWGVtuB3ql6M6zE/sCcHKK4H7wE72FfK0rK3drldk75jKc57
         WQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ubOJege1Z61R1R1/YN94sPs6PJRX9iqv30pYobkbYBg=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=GTYnA39U2u05+DFg6E8Y4+2ux3oqEgO9bGJbBwPB69NDsmVkm0F7AOi5Ua0ayrY/BP
         JqAoYV4R97f0+cTsyT88cTJQhb9FJK8zQPwEfVnJ9QpUN+owhijYipvDDlY+ZxEuw+FM
         6ZXeCWPex9vm+ZRx5zvAA8X+bnJvTHjWJLH2jSZCmIkW6gBPUoNiqVFWs74XVshOLph4
         6mCTUzHKiLsG0ZRjMzPyFRCOOD0LL0Wq9joWkMt0iBzjKrwFMFHn6czprXdNYxelGq7U
         dWC+LFTpewX1nmZUT+R+KaPFXQFdANFFMGjH2TcU0hh2/LCvF6esqvNmvxofeGLcSvQ+
         j+tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGRxqc4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05620a0c8600b00781124edfc1si14786704qki.39.2023.12.27.14.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:19:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGRxqc4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcF5-0006xm-2F; Wed, 27 Dec 2023 17:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcF2-0006xQ-VL
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:19:09 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcF1-0007Rz-CC
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:19:08 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9b267007fso846024b3a.3
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703715546; x=1704320346; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ubOJege1Z61R1R1/YN94sPs6PJRX9iqv30pYobkbYBg=;
 b=aGRxqc4Ma8joSmzrgmdUD2Jw3wALInlaLwk5IuSlvpfHIR+g32aj+8oLLi28oqJomw
 qkE2gZjSWVnPzGl6Bqv5cprFxQfb6M9X8cu016KxShG7dYRkPPFCZwscBCOQR5zYPOjC
 r9CFfXDL1HfQnk/u5unEcgsQ89bkfFM3aeALf3bp2BHlbw+4hSSCc4wFsGnFiD67uK8S
 lVX1v0y2jlh137jjcqI3nHvUO3CdTCGOGdxFPZjj2g3sjd+ofCmON9Y5/+njXzuLjq1F
 KQRBLQ+N8SI8OZdTG5SE6ARpkZWEF1q+Z4GFbQAaV0uAUXoukIafTudevAT1FJjsYfof
 djIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703715546; x=1704320346;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ubOJege1Z61R1R1/YN94sPs6PJRX9iqv30pYobkbYBg=;
 b=kGbPQOnmTvLrr2WtWsc+QOqmrcCmi5XWDpWqM+ktXvj8BB2ywCB9/meP0l/8QTZTLq
 s1PFK7oD8S9Ennv+PwoUitD5RhjF6LD8S9BXXp/Zs3kJXSFAXmFSP805P6EdYYBVG4zB
 Q6/xexJGULUEpZad1zYZqvVtCsF2WCWYOxyhNZzWVvN6dpzMxRas5x/3xovl9e62GVjI
 SUuPNyIfyl14aVicwfy/e2mEBf6yS+d85ZiWC6zRFrwyofECTIqsL2Qt2pFHgsl566RR
 P0MdfaaB5IFZHqzZ7vMmMvSbzGHxrsEYadLYmTWDWJXwhDDx5aroXo28PJOrCOP4PRd+
 6xzA==
X-Gm-Message-State: AOJu0Yy6CfT2L5dGvWcSZEeRRymL2/a7ZHWsJXweoVtZa3LFYtZ/PS01
 iAmHVui4UcQ0RoRnADSilFtuF4ppKG7UOw1fkR344nVvb4TOtQ==
X-Received: by 2002:a05:6a00:d0:b0:6d9:aa6d:e3d3 with SMTP id
 e16-20020a056a0000d000b006d9aa6de3d3mr2666937pfj.66.1703715545903; 
 Wed, 27 Dec 2023 14:19:05 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 c13-20020aa781cd000000b006d9fd64fdcasm1938353pfn.37.2023.12.27.14.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:19:05 -0800 (PST)
Message-ID: <3ef462b3-e54b-4f85-8c38-ef72e30e3a60@linaro.org>
Date: Thu, 28 Dec 2023 09:18:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/35] target/arm: Always honour HCR_EL2.TSC when
 HCR_EL2.NV is set
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: TnntdfmOlR/z

On 12/18/23 22:32, Peter Maydell wrote:
> The HCR_EL2.TSC trap for trapping EL1 execution of SMC instructions
> has a behaviour change for FEAT_NV when EL3 is not implemented:
> 
>   * in older architecture versions TSC was required to have no
>     effect (i.e. the SMC insn UNDEFs)
>   * with FEAT_NV, when HCR_EL2.NV == 1 the trap must apply
>     (i.e. SMC traps to EL2, as it already does in all cases when
>     EL3 is implemented)
>   * in newer architecture versions, the behaviour either without
>     FEAT_NV or with FEAT_NV and HCR_EL2.NV == 0 is relaxed to
>     an IMPDEF choice between UNDEF and trap-to-EL2 (i.e. it is
>     permitted to always honour HCR_EL2.TSC) for AArch64 only
> 
> Add the condition to honour the trap bit when HCR_EL2.NV == 1.  We
> leave the HCR_EL2.NV == 0 case with the existing (UNDEF) behaviour,
> as our IMPDEF choice (both because it avoids a behaviour change
> for older CPU models and because we'd have to distinguish AArch32
> from AArch64 if we opted to trap to EL2).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/op_helper.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3858153dye;
        Wed, 2 Jul 2025 07:38:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDGV60Aj5H6aoLgI3AO3gqp74hpkPnJLbn0nl1D/F7huiGpvG6XmTaQ9XpN3Icbi9uH+/lUbw7DKef3w==@linaro.org
X-Google-Smtp-Source: AGHT+IHcE5Jb4YTgRnIvTpsH9f2PBs1/7eaDppTZCKfU4Tp6I/Tjg3DnIal1xOn0F8tDDA5YdGyP
X-Received: by 2002:a05:6102:6c4:b0:4e9:968b:4416 with SMTP id ada2fe7eead31-4f16143e424mr1726818137.24.1751467127871;
        Wed, 02 Jul 2025 07:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751467127; cv=none;
        d=google.com; s=arc-20240605;
        b=caqWCpl2rBA8QZoz2iHfBflZTb6MzYdumuYgDfifqLceePFCbBrttcDh4fUuWNBSGY
         FLbOADX9PS4C4PWMWvolgRnbVLtr7/hlYNAePfGzfjjaVGDj4IHLj5OsvcJWBcR8R2EL
         VLPrIeNEaxFhNWxx4RGeQ4AUo1CJn9YtKGYJSM4jKsF+7UwBp7Q3ybJY/7PS4weWtczt
         aIVJUTgkOzPIwKRQNUDKBx9oNp/wvhXl5rkovIrXYLhQkbnfljsTSPayeVgvI3HWCpWO
         TrU2+M1Oy8v4SDdFeNODQToJZEAWHKxqu02wF/W9lnD6zHD+tWoi+Af5flGMp0II2jNS
         D2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lLsDdrK/c3twitjLNwxwexjP9Lc4HpJcodYK/GHxapg=;
        fh=N0AHcHS0Fy5H8XXHVoq4jXOZM9CO82+WRv8RvBYsD2A=;
        b=JouCHPAxSbIPVSJTDF0y9okVNkpftvu2rFB8EBl7Su1QUnIR2QZHTmZxIFGWBiQpjo
         qu+MjqEFkSU6III3ur594va8kHMkcGJRhh/0bllczv8MWj84TYG4JmcDj+07PH92Rsb/
         C02dLc18lBfbgrGZ299sesemKJmZcWGiQZFhOv6NCoVOkRs6nEJHPRDjic5JFzIZzG5Y
         MDcfC+mwXGcmGibnNWuxyidvwTlok5wUuTKSCO84Bu7Fy8OLNmSZ9IxkNkSAvJGPP//K
         PecZGK7fOLowfu7spL+qu2//iMpU788bYMD8CaslbVxs/v8LVW9j9nJR1qbySGlMGtJY
         HRcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbMsZK5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4cc1704asi3052341137.554.2025.07.02.07.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbMsZK5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWyba-0006OM-Px; Wed, 02 Jul 2025 10:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWybY-0006NN-6m
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:38:33 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWybU-0005Yg-U6
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:38:30 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ebb468cbb4so3976528fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751467107; x=1752071907; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lLsDdrK/c3twitjLNwxwexjP9Lc4HpJcodYK/GHxapg=;
 b=zbMsZK5G6rnOocN5nnNZeev4OjAFwcR/UUrEZ6DMyqrRskwqNXUYsGMC116sTneG+9
 9Cs5wDISp5gr3ZRIiOSPLgdPl5mfAkrbRm1enNzRMUmkN9qKfgx+nj+35sp+haFZaVjl
 vIgXh22BIoeveRz7/2Q+WNHuMlHOUZDtW6dRCnMGhrdnf48va4DNbGSSyqVtyz50Fdym
 j82Nq+W1YFQus1M1QgM53jNmemW4kSJIc7+AB140xPleSqpHHAgg1A9Kd/ohaBSlPHNk
 PmJ2MrnXtSyvFsmyVpBQI+99kExuVBossAVI6gVfoNYGe7UGTvAkWLK4cIdYYuXtA+pc
 4MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467107; x=1752071907;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lLsDdrK/c3twitjLNwxwexjP9Lc4HpJcodYK/GHxapg=;
 b=KA5hKn33MpMqX471E02l53bh15awxQe1pQ2q7pUk8M/ghroJxd/jckWl54cjg6g144
 6NWCFbADQ9+wlNuoJxjxcAakZG5gxdJFVlQj8GB8+S8QdVRH7dWJPMA9bzQKXdZ5COqd
 hFBCrV2gk5vflQuc0CYIGLrSA6Fg6JSPDb7JTE/SjyHH9DtSNIoxJ0FgsE5TU/2hcv80
 86K8LfKz0U2V9HIospeeDPZrwVkM+r+MFGShD8gI0RsU4CsjWSZV07M0YaRBBjzheHFE
 RthTGX6tGm4Kbkyvwqt0ysn4b3KJPEJpJwJ34sqTMYR3oEVCgTHVauDe4p3DU7cHWl5k
 GSkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7YP9sQjjtPw4FTGOxZoJwNWNt7lH4F5lV57UswBj3nJ5BtjEIwV74mE0RJ+yvOGtvkjg3yL2u8Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz25R9vS84CvAaz1xFiA9k3XSWOnBzmWWHILuhQb6hQabE367L/
 yLGi15fgXcGkZo1MWozCEegLk5aG4HhVRO1eW+6K9FfgmilRIUG9onviwk6XyNYFxEE=
X-Gm-Gg: ASbGncvvd/6gXzz+9GVuhHAqI3HJe4o+cAv+eNjIEoih9gR0/NF9R4E+vaXES9qYasX
 1BKPzOQH3sbXi/PRjvrLdE8jQZ8no+lh1Z8a9P89P2+A2Z7u2oDZoEG/pw5/ywHwrVNP5VJJhz2
 73cbx5c1/VbRy/2I5cQB3sVyDMaVuAEZIEaoo8vjwv604pgtRV86VXcAUIGtCXGD8LmiTAi8g49
 0DDvZVuEt5lfALBUkwoX6es8g0Dp8xCCVuGNgJkPf75uDL7eAvH/l8Ikmw0VOyzjQ3s2FF7CflM
 I8MtxqEMM6PhmAf7Pu1oe65PlWRVYh6gTwUadX3CerDErYBtkTQPjsneihg+ik7Gl4MzZlO11Fd
 i
X-Received: by 2002:a05:6870:b201:b0:2f3:e087:6b08 with SMTP id
 586e51a60fabf-2f5a8b9022bmr2305059fac.24.1751467107135; 
 Wed, 02 Jul 2025 07:38:27 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3910882fac.32.2025.07.02.07.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:38:26 -0700 (PDT)
Message-ID: <7e14ce0e-fb61-48cc-9d41-618ea69a2ce8@linaro.org>
Date: Wed, 2 Jul 2025 08:38:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] target/arm: Fix function_return helper load
 alignment checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-4-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-4-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 3QcxLUm96ap5

On 7/2/25 05:19, William Kosasih wrote:
> This patch adds alignment checks in the load operations (when unstacking the
> return pc and psr) in the FunctionReturn pseudocode.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/m_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index f342d93489..28307b5615 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -1946,7 +1946,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
>            * do them as secure, so work out what MMU index that is.
>            */
>           mmu_idx = arm_v7m_mmu_idx_for_secstate(env, true);
> -        oi = make_memop_idx(MO_LEUL, arm_to_core_mmu_idx(mmu_idx));
> +        oi = make_memop_idx(MO_LEUL | MO_ALIGN, arm_to_core_mmu_idx(mmu_idx));
>           newpc = cpu_ldl_mmu(env, frameptr, oi, 0);
>           newpsr = cpu_ldl_mmu(env, frameptr + 4, oi, 0);
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

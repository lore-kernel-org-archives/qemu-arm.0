Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2426571ejm;
        Tue, 18 Apr 2023 04:02:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350bj/oISdjoR5L0kgSgs2CZDxsUIPt8jdi3uA1QPdO3kI4JKUW0vDbAyDKjka9guCaLvgLFU
X-Received: by 2002:a05:6902:1004:b0:b25:3a5e:6b2e with SMTP id w4-20020a056902100400b00b253a5e6b2emr18362907ybt.58.1681815749464;
        Tue, 18 Apr 2023 04:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681815749; cv=none;
        d=google.com; s=arc-20160816;
        b=Vs5Toebg+WJ91ty5noh/lVdKWEjfZFj+gEcfuOkGPlyEu+wdSN1etdvuXSHIXr8lbJ
         YZf610zjLYhlAg70Nrddd5vqKHnVhiHAnSMgYQyCTD2o+039IN+NNsUAK9bQHEhkmk1Y
         0wUQT2VGP9u3h+oqrCG1Uk3/xx8fGJioplBr/XUeT135h92veYmM2ay6nT/nVddVfzr0
         168EiCGhLD7Q+eTb9Z9QE3oCz9gHQSY9TCXH3s0HguVW1p0DRBRzUY8fVecLJSHcWjet
         cAoP+EwqtGj/F7/+HFARmhO8b2rfZ4GEedi5xzQjcCp16c9Rxc0IuhEhQ7znlxKhxBDz
         3zTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=a2ezIgF7ksNqAWL/aBEaTHLMSzS6GAqNKwd1/w3H0RE=;
        b=HINSHiUXZh13+bQImV+h5ZLoYuOOYnn5J++xwInaPVo6BOWY9oerh6i7BW/a7M77c8
         7vB3EHp9/bBmP+74XUa3872sdDfOFSSO1T/opSHJd1B1nUqVCGTj+jgL0YIILucYyWzu
         OurdC423G1Tzk/yEDjhNzMu3Rqtbmis+y3H1A4NIpxSuHXopHbhTWkVPRwwqYmw5KUKo
         1iYcja5G/p8VVrmily1nq46LAtk8OEu9dX3SYB5VTkYFtT/pu63ZDaRrfwH6Qqi8s4iV
         XEGTHhJCxrZ9VuTSZK2OpkUBJIvExZhLr7lxk8yX8hzQ99/6Pjy/MeOPpc2TpNNFGTCo
         ZQGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta62o3fe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a29cd00b006fca83b669dsi7540979qkp.61.2023.04.18.04.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 04:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta62o3fe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1poj6F-0000aw-OB; Tue, 18 Apr 2023 07:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj6C-0000Zk-NC
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 07:02:13 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj5y-0002fM-O5
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 07:02:12 -0400
Received: by mail-lj1-x233.google.com with SMTP id b9so1343639ljf.13
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681815715; x=1684407715;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a2ezIgF7ksNqAWL/aBEaTHLMSzS6GAqNKwd1/w3H0RE=;
 b=Ta62o3feXsbTyM1MTt3vEsDz7/rnK6tgSphbvwQQHUAkIYKWTg8ddDxJqtNJm/WSJf
 dVOxBPgAmILC/q4RczOIUbsbjB9nLkRRyzYReipF/6soPeHjImw/I2c/SyIa4kY3xwSF
 /1O32aR4Bc27xrj4QXkOvBTTNanvG6nK/UhShKa/XNGOvWPApvhGHmZ4GPSuz9KdqgIP
 AqedeITpA/Hqz4r3Se/Mzl+VbyZDPgnYA21BSfeH4NITzwhuldF4z+y+fy2v+bOohLJj
 32gSX4Qn9bTJIvT1Bumpn1UsKgZvuGN4pwEuzT8MACakaQDcS+AghkOg6ORD5K09GIdS
 RB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815715; x=1684407715;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a2ezIgF7ksNqAWL/aBEaTHLMSzS6GAqNKwd1/w3H0RE=;
 b=k4354Z42/7CYLDfwz30u1BlQbk2IzZXX4e/wdLAhnhH7iDdQjP4AESndiz3f/XIPl0
 fvJvN8FNYBoo1CLdmc98bKB5ImW2bjdHI+ZvWw1LRO92h7WujkOWZYU7RtUFwdBKx8pX
 TVLB1xFAsuU6HLbaCM9+scBRK/BeGldM0pWN2It3AnIsmxvIyJyHO4THNwfvRoNUUuxD
 lmiJgnTg1uGTNJgPYCRba2v+zJ37eGPagS60XbFraCn9fMbY07z1iw2zH2rmm1e0ZD9B
 jaHfbVyxGOUpKlQ55BEULNVePLOHInjTjPHoTvIX6X3Gb2p0S4AYte7EFh9DaO5ybGsH
 nZ2A==
X-Gm-Message-State: AAQBX9frFUPtE1yWSIjqzz50Ams1fD9xt85FD6BYBsvUlQdkA1y4pKzn
 ETz5DzqWaqCUatYlXD0sPaHQVg==
X-Received: by 2002:a2e:8ec9:0:b0:2a8:a65a:7313 with SMTP id
 e9-20020a2e8ec9000000b002a8a65a7313mr619831ljl.31.1681815714956; 
 Tue, 18 Apr 2023 04:01:54 -0700 (PDT)
Received: from [192.168.58.227] ([91.209.212.60])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a2e7014000000b002a8bb52d994sm1352190ljc.25.2023.04.18.04.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 04:01:54 -0700 (PDT)
Message-ID: <836a4c35-9e1d-c067-cb2f-76ea93ccd53a@linaro.org>
Date: Tue, 18 Apr 2023 13:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] target/arm: Set ptw->out_secure correctly for stage 2
 translations
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230414160413.549801-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: nFuvM8ep2Mu0

On 4/14/23 18:04, Peter Maydell wrote:
> +        /* Check if page table walk is to secure or non-secure PA space. */
> +        ptw->out_secure = (is_secure
> +                           && !(pte_secure
> +                                ? env->cp15.vstcr_el2 & VSTCR_SW
> +                                : env->cp15.vtcr_el2 & VTCR_NSW));
> +    } else {
> +        /* Regime is physical */
> +        ptw->out_secure = pte_secure;

Is that last comment really correct?  I think it could still be stage1 of 2.
That said, the actual code looks correct.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

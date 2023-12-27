Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1204830ejc;
        Wed, 27 Dec 2023 14:47:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJIJYh1n/J6mgZFKC0AwdkrEKg7TXDgICa+RffsjIBAAFYXOt7wWnoa1qnL/+s5FqZDK0p
X-Received: by 2002:a05:620a:46a3:b0:781:2525:b3ee with SMTP id bq35-20020a05620a46a300b007812525b3eemr14424792qkb.81.1703717249414;
        Wed, 27 Dec 2023 14:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703717249; cv=none;
        d=google.com; s=arc-20160816;
        b=o20ex5du8x9gp6/ctXdQcm2wScTxneAjXdAWpGnuqlIvh2kuMGiA19anloC5x4aBY7
         Wi7OiAK4E1qPYAb86EnE57ubm+NzmAiRQgusJeyIfzcmQ7TjMqV6FabZJsq+AEUwZU3y
         tTplgI4jzYw3iWcF2FWv7E9hzig+/qoVD62wiaUebs3Glxaj2BK5pCeiEH+AWJGDa4id
         nEsVXJkZNIvRLgjoHR2Iaw5vSiiUZKCPp3qZAXA8zzRCXub+soVVQwyHyADdxstXFIMw
         MVegtHsFYYAgJXvqCgef3mK/5qmmyCex0YXwWRIAEl4P3Cd1rYhXF9bHdu/3qGR237tY
         Dk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=M3kwXjdHwE4b0VwbllgC01gzA1q3vEdMrg+7BPXSS8Q=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=nnQV4Xw0fSR9VWdNaIbd+81euixnFNMwBL+LKJiCeV3lTEtLHk2x2bOr4onS6Z9AuT
         9ti5aXp551nm6jIKsDZImss43aXhCUwO2ohF1Fs5vYgcRxAMN0vagSNgT+IUbtEQhlFs
         ZnvVfwpHvMqTOh7NC9a2O4mWVh1VtoyQxOCm7lTYUKvIGYATSjo/kNL6FpcrShn/cgFk
         hmE8f/5q/zDmAc4xrDEhwd7X/uqldkDJ1R1Wh5c3R24cwUXOck6Xl949/Tv7BUYbRHon
         qwLXQI+blrFjToi/GBVINOf5YUoxxJBNi8dLc2ExgxR4g6DqNSxnJNYiLGBcp1MPfo2E
         hySg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zZDnK47L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05620a024b00b0077d7db54d82si15085076qkn.427.2023.12.27.14.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:47:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zZDnK47L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcgK-0000AG-Mv; Wed, 27 Dec 2023 17:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcgJ-00009x-I4
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:47:19 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcgH-00085o-9o
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:47:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6d9bbf71bc8so736924b3a.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703717235; x=1704322035; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M3kwXjdHwE4b0VwbllgC01gzA1q3vEdMrg+7BPXSS8Q=;
 b=zZDnK47LPtY0KVMXD0RdBWvs3xRTVYE7v2xdlyG0TxpYLAxzYssMcYcf2DG4spREDb
 oFACksF4cbTWMf1uY0nZLMXFi8nvlOHEdtHCcDwV06zg6nnVa3TbO7o7kCwNB+ftplPm
 TisKVtcKB02AhdBcILXefHuHO/4zJoqKK1IedAVyqxw8iabhR9ASa+aXqKM9rhCqrLvT
 0ueg8uby8H9GDjUIhziYuHQHvpFyxxtE6akYcxv7G0ITIi81HGGQ2sVm0Us4kBndVh+u
 wS+4VI43BcHALc8BjgQdomBrokzjy0xZpASHi853TPwWD/8O7BcX6VSpT8bmz0+ICuGw
 CCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703717235; x=1704322035;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3kwXjdHwE4b0VwbllgC01gzA1q3vEdMrg+7BPXSS8Q=;
 b=vQ6LyljpzWGHAQ/AZ5hRUdAlojthceiWd8/Dir58IwgPHfJ/BzVWl8vCXUDgxf5pnB
 mMtR3GfxomY4TVYUvJ4W3UeHABvzL5UB4P9fOWBKxmKsio/8IJFGQ649OJFujJ4YwtYa
 Ksv9d5xT4THyQ8srqFpE7v9GhlEkvuQqzt4b6ifuv/bfm4Zos2Ychuev1JFsVCm8H6pG
 wSpc1RWMPxTTlu4svvra+4MfnBAWrBYaAgGcQTflBh6JRuou2O4GCoupF2opg5dqjAlD
 F0NrQWRZD9n+e9ux45otaSsWrz8hEYeibFcDE3at5LglzIgp8VRuHLNfVrdpp5xM0HoN
 Tf0w==
X-Gm-Message-State: AOJu0YzVD3izgzZsVNdz0WqHAn7ukhKlJEmSPvnFCfyugKWsVsYEaG8k
 GM97ciHlfAPQeKpjlC9J4CUWB7N4//0/FA==
X-Received: by 2002:a05:6a20:3517:b0:191:9d84:104c with SMTP id
 d23-20020a056a20351700b001919d84104cmr4164143pze.36.1703717235628; 
 Wed, 27 Dec 2023 14:47:15 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a170902ed4100b001cfcd2fb7b0sm10344027plb.285.2023.12.27.14.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:47:15 -0800 (PST)
Message-ID: <7e91f6d1-51e3-4530-ae83-54aa028538c1@linaro.org>
Date: Thu, 28 Dec 2023 09:47:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/35] target/arm: Trap registers when HCR_EL2.{NV, NV1}
 == {1, 1}
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: EYmBjAxBbyWk

On 12/18/23 22:32, Peter Maydell wrote:
> When HCR_EL2.{NV,NV1} is {1,1} we must trap five extra registers to
> EL2: VBAR_EL1, ELR_EL1, SPSR_EL1, SCXTNUM_EL1 and TFSR_EL1.
> Implement these traps.
> 
> This trap does not apply when FEAT_NV2 is implemented and enabled;
> include the check that HCR_EL2.NV2 is 0 here, to save us having
> to come back and add it later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have mostly implemented FEAT_NV2 after FEAT_NV, but in
> this particular case it seemed cleaner to include the NV2
> bit check from the start.
> ---
>   target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 40 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -7807,6 +7820,16 @@ static CPAccessResult access_mte(CPUARMState *env, const ARMCPRegInfo *ri,
>       }
>       return CP_ACCESS_OK;
>   }
> +static CPAccessResult access_tfsr_el1(CPUARMState *env, const ARMCPRegInfo *ri,

Spacing.


r~

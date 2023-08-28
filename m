Received: by 2002:a05:7022:658f:b0:69:9a19:fb41 with SMTP id bd15csp1736121dlb;
        Mon, 28 Aug 2023 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLdpR6pji4Z39d8ufCNBOrg3lzBFnFI8Wp++czgiD0kTP6fSaYsTHTpvnogmqJAOtFc6Wk
X-Received: by 2002:ac8:5c02:0:b0:40f:d368:66c0 with SMTP id i2-20020ac85c02000000b0040fd36866c0mr33738021qti.0.1693259186712;
        Mon, 28 Aug 2023 14:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693259186; cv=none;
        d=google.com; s=arc-20160816;
        b=Sy3ZOYnDVJm4ZowxvX7g7iQtwDHPG1C0TVX6yVJQ/wNcrfg0CFzAoBUkeqHPjApIG2
         x41R9uKtvRE5U8+X+v2uJz/S1QI9q0vw3fn/2we3h20w1R2YjwvkGcV4pXOSjeUcPygn
         x/u4dILBl/+9FPu9r/JtHeeIOJokidLte8DMCVGTg6H/+iqRSI5/FcKrrMBAjIWkbOh0
         lFEegBZDOOYFyD1zfUIC0uGiXwqC10OIgGsCs9+wIQ3xbLAF6ecAss5cHNBHICJxxUBZ
         jPXdrPxi02oe9yjPVZMHe7P5rcyE/SoEyeHM7iG5KE4MzzBAA0HQhkbMrQPW4UJPo4qF
         df8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vev8ZAjyKG+2HXZWteSDR8WlT5SuJbNgd1ngCsTRYD4=;
        fh=pRIqGhWxk7ftaJ+M8zsARGOMvhjPktmrX0FNV2kooGA=;
        b=kwteZKweV90X+ATE2GUlsQOJlZuKzc+IHMHGjU/uXhLPFI7LGD+Yr2rYk3R58GnRVm
         2ZxZzdBwnQKfhqR0uHX+V1uc4LaJrITajYnsFQkM/mKpMBRjwoMHsRP3siGC9H50Mfwa
         6ixPYf9eBva7X+gVeFN7/1gnVtbr1uqYnNe+jEB5o5AZ2KRKPpyNqXpEtzCG6zoqJNlQ
         v4FJGGsSJkzTA8F+KpVfgVs+TbuRsf3qlpRzLX530cmkgPX5mF2oRM+YZ+XBj439ga5c
         vhMSIlGEXuJwdIFXppDyoUXMhjfb845GdEwYZYmYwbO4Q323Ka2IJBh9aiZoFpILzJqY
         Qk1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JqpWN9UY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a05622a040d00b003fde5babbf5si5416006qtx.14.2023.08.28.14.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 14:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JqpWN9UY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qak40-0003XB-17; Mon, 28 Aug 2023 17:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak3y-0003W2-Rb
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 17:46:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak3u-0007tc-L8
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 17:46:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-400e8ca7e38so32002405e9.3
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693259175; x=1693863975;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vev8ZAjyKG+2HXZWteSDR8WlT5SuJbNgd1ngCsTRYD4=;
 b=JqpWN9UYQhAJC9Uv5H57jhUDuxWGes70PgiRegZR6b0Ys5c28Xx99HoXNU44Gipxm0
 YnPG2Jx/8suFA3w+pX4qVOFQ1/0veqPdz+GCylALT6DqPJ/M8sxBup+n37rrLhKUUW2A
 bdBq9mNmuveuWQs5J3e6C537cOhxIZ/pS/uu7bwZYYwuVyGUV0ptdE9S0E4Pii+ZzTJF
 W/fTq6Gz0O3Wuq7BFjYWDWlJR+9f8ACS3DxIJoVVqfADif9z8u06TveU03L8TwF9Qfod
 fo9lwRe1erYCczy8JobZvtEm4Hq52gEZiKaaOlC8mgw+UaP95ks7imIVuI6f2BUfYs/L
 43rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693259175; x=1693863975;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vev8ZAjyKG+2HXZWteSDR8WlT5SuJbNgd1ngCsTRYD4=;
 b=XRd7M7JXT/8v/xCMOQOfCnBwyHntt7prITfgfX6zD+KbD0CBwvfNwn/QUCp6MFsd1O
 TZfJKHsEYEV0GhRF8Nmi1E8K4vVrgHma7MiU2pzbRoJLKV7DxtPYGkBSMftWl/WnukOP
 PiB1DJs0wQOjxQmjIVmN5/tdIV7WVEtXwr7RUL6qekXdjEafJW0HCOow7pUykc6M/GjJ
 MbJDxjJTN4uBnzfj4aVu9rKZTuA3RC0Gh4tOXEutB7oplKa1AxWwC7YFfCeKosuYr+78
 kc7qHQ195rk3RYW8qUDdDMJbYCxxdpgYTZ14nvkrwjoHwHri554HJKobc5cUW76RAL+o
 n36w==
X-Gm-Message-State: AOJu0Yxq24fciogNfxVm07J9EcG68EqjKRcnVyHqK0qMIoNJjJRirOKf
 9odvFccMpf3sk19DizllEdA8zw==
X-Received: by 2002:a1c:771a:0:b0:401:bdf9:c336 with SMTP id
 t26-20020a1c771a000000b00401bdf9c336mr6073273wmi.27.1693259175733; 
 Mon, 28 Aug 2023 14:46:15 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c379500b003ff3b964a9asm15207410wmr.39.2023.08.28.14.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 14:46:15 -0700 (PDT)
Message-ID: <f2116163-bf23-0ab1-fd05-5489d6c579ed@linaro.org>
Date: Mon, 28 Aug 2023 23:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 7/8] target/helper: Remove unnecessary 'qemu/main-loop.h'
 header
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-8-philmd@linaro.org>
 <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
 <ac9fafb6-a751-1503-a5c8-f71c9909a6e2@linaro.org>
In-Reply-To: <ac9fafb6-a751-1503-a5c8-f71c9909a6e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: XcgwAX4O0t2v

On 28/8/23 23:45, Philippe Mathieu-Daudé wrote:
> On 28/8/23 20:40, Richard Henderson wrote:
>> On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
>>> "qemu/main-loop.h" declares functions related to QEMU's
>>> main loop mutex, which these files don't access. Remove
>>> the unused "qemu/main-loop.h" header.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   target/riscv/pmu.h                   | 2 --
>>>   target/xtensa/mmu_helper.c           | 2 --
>>>   target/xtensa/op_helper.c            | 2 --
>>
>> At least these 3 files do two things.
> 
> I can compile these files adding '#error' in "qemu/main-loop.h".

Doh now I got it, I also remove "exec/cpu_ldst.h". Probably
a failed rebase, sorry...


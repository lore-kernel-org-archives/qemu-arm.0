Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1380372lfg;
        Sat, 15 May 2021 09:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUtWFX5zzet3T/otYM4MtrX6wa85B9q11bUX34f7qXq99Bjq/vxaPcElkCHtyl3L/s/XYD
X-Received: by 2002:ab0:2b01:: with SMTP id e1mr47666814uar.85.1621095410697;
        Sat, 15 May 2021 09:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621095410; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUGbhOtwxFgscdIESWh0wpumyASHt6/gvsN6mwX6HrmvNn94hcsos/gUffZnetmiBD
         t6Unc4GObDrmrILkEUV8f/WDKcJ0E86jFXYPUHEUbDZPitS9Y2dsApQjiJlZemBrZk7O
         7pFY47twiWXLxB6w1gDnmazyxliElHjHeCCgm7rf1/Rcs2fa5qLZ3b9+fZSBHzcV9SB7
         EbErHl6dRrWSj5LaR5jPMbAbKh2ZgtkcmhC+kWVaxq0zUUpkcwfoTis9ze0OfWrPUauF
         8BVeJY+lWZX56TuzJ0K+IMeJoRtIHsqbxXI5YmLKZxY+KWqMFLWrbRh22x4P6tj0fJ38
         uaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=70v79L9nH49yNdd9ahFj7djnVgJ382qZ9CjA+s2HK2E=;
        b=U9M3KAW282JYtimLnT/czWkR9wKnj8xW4BNoOc8YHuigfR9JBV2V1c232A6ZDJTYyy
         0fQpJKi7FNHrkHGDg/lrhdGFMDHfOI3IUpn/YOHmm312sQ07FBYvnCCdvAGl3p7zxaO6
         SWipb3GqgU/RYElDYcUJgHvtBC3PMwz/lCdccXEmp9L5tLhk0BPziVdf5a7nMoU/Nq2X
         orZprE1mXtKBl9gV42MZHWyUVCsQzQRivOy96Gvgpl9VfdiuxW+a/GkDPKjtE7gSXJXT
         chDXalqRi7uM9q/8j90G/W6+Zn0k+2JD16h+bExeR1wZeRzshGL3F+gwJMo6ShMZk7rF
         5clg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWhDmzPO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si4573428vsq.368.2021.05.15.09.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 09:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWhDmzPO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhwyA-0004LL-33
	for alex.bennee@linaro.org; Sat, 15 May 2021 12:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhwwS-00037X-Kv
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:15:04 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhwwQ-0001cC-Up
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:15:04 -0400
Received: by mail-qt1-x829.google.com with SMTP id c10so1850343qtx.10
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=70v79L9nH49yNdd9ahFj7djnVgJ382qZ9CjA+s2HK2E=;
 b=aWhDmzPOduzyzNBiwKa5KZfA3tqrk78Oz+49GFhx170xekCcCYFHqw1w7++TABLIaG
 tAHke5KL5PEHPFOdjDqXvHxwChe5Wefm+JcXWkaUGe55seQUjQ1adpz+kVuootnao9ed
 TmSsx1Ddb6HHF/amH20zvFeYz/H5MZcPiBSxIk9o+y4NhORLWlL/vfnWHUyPCwgUAHZJ
 R2LFkdtRGjDWX62F8OUHqUFQM789gw+AP8Bd5ItacTYEI2IYohgteZ/wS/0KU7xD2BA3
 A25hDGaLtPhyi/lVRNihccSL/YW5HF9+YjjO8/g/fevPlk8/qP0NsTj4S+miV1ikcDCd
 oVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=70v79L9nH49yNdd9ahFj7djnVgJ382qZ9CjA+s2HK2E=;
 b=XgCMsWh+Pl40jFJ1aZNT+c7e2hVpl2AvhMlwq20lW+0RPux0HG6k/OzLm2I4UsVjVl
 1r4AG/kTRxTwb9fs0HEcrmiI2SEv541E/jHwPHctVmb9zSbCeEetIygfvIQKwjpq7eiG
 /5f2Mu9IOAItMrfuAr6jwgMqJwYDve97TeRRVrqQ5eBy8raWseqS8EBYAopZ84ym6LNe
 ALHve6xaC7K/edIfTymYFrhjH4F5uFtQ06YXSnldJWiNFHKVKktHDGPwqyC0aJ2bOcrv
 ASBbovNEcfeaZAlV/WVtcbiN8xBwlaIvb4GsniTCFmS8PXO+WIPwQ1rdN0SiZrtzi+A2
 Nqng==
X-Gm-Message-State: AOAM532W91D8mYTC9tW+LrTMZYj2t2UIYfPS89ww1k6uKfasS9pCNwGU
 IbTgXLWWZLAmSvwdq2AMiGpd2Q==
X-Received: by 2002:ac8:7ee8:: with SMTP id r8mr47530703qtc.56.1621095301457; 
 Sat, 15 May 2021 09:15:01 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id c20sm7015920qtm.52.2021.05.15.09.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 09:15:00 -0700 (PDT)
Subject: Re: [PATCH v6 68/82] target/arm: Implement SVE2 FLOGB
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-69-richard.henderson@linaro.org>
 <CAFEAcA-T_LwSMZJbPszdS3CobzNAjJWY1gptsgZQT6bhxLKkaA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e4417b1-3a2b-809d-530c-65e8ba05591d@linaro.org>
Date: Sat, 15 May 2021 11:14:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-T_LwSMZJbPszdS3CobzNAjJWY1gptsgZQT6bhxLKkaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: arfI4j53Hs7K

On 5/13/21 9:18 AM, Peter Maydell wrote:
>> +static int64_t do_float64_logb_as_int(float64 a, float_status *s)
>> +{
>> +    if (float64_is_normal(a)) {
>> +        return extract64(a, 52, 11) - 1023;
>> +    } else if (float64_is_infinity(a)) {
>> +        return INT64_MAX;
>> +    } else if (float64_is_any_nan(a) || float64_is_zero(a)) {
>> +        float_raise(float_flag_invalid, s);
>> +        return INT64_MIN;
>> +    } else {
>> +        /* denormal (see above) */
>> +        return -1023 + 12 - clz64(extract64(a, 0, 52));
>> +    }
>> +}
> 
> These don't look like they're handling denormal inputs quite right:
>   * should raise the input-denormal exception
>   * should flush-to-zero if that is enabled

Yep, thanks.


r~

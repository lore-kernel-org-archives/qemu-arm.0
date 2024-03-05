Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp369776ejc;
        Tue, 5 Mar 2024 07:51:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWb/8N/FffrtUBekHv5UstMJFnMGqntCxvO8tR9N4FEJjbz3ytBGfS4uTVYiXRNFZa4aLx8eL9SfAvbaCad1iTwZKOC3LpV
X-Google-Smtp-Source: AGHT+IGNmPSLoat9VtXSxaWalI3dvO4kNtunw5XhIbTTvXIjZmWozNCH5L5d/ArJSH7rvvAqLYsy
X-Received: by 2002:a5d:4d82:0:b0:33d:f60c:53e2 with SMTP id b2-20020a5d4d82000000b0033df60c53e2mr2518205wru.11.1709653915075;
        Tue, 05 Mar 2024 07:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709653915; cv=none;
        d=google.com; s=arc-20160816;
        b=cr/6/Sk1Hv1KoLtyglijrLQggc43IOud97+9IdThS29P+UPvR3M6u7kPU+SKgdb4rn
         91QsRjxiincHzjwcBnf8WLdXbfKlA3n6Vk3jpb8HgWmz0gYvA+rpnUVy6Xlt7kifWvWS
         jsXs0ZGFxDxsr0UvoAlFvwdTuRg+YOESr9rRDmCycTGmxQjNNGX1b6IOVss+q/BDJJx8
         Ktr6FMS2HHcRHUtu1bwlh7q91bS54ImsvNuheqGgLsPdFneGVNYfM15wioS9Don8m4TE
         Eqa7H7k3T9qTRmVavy//N7B0YgiKcOioDwpxlOYFjP83bPoXBV5R33ceNXmME4yPLiQG
         HR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HUlAyjbs1PTV+vCUlXu3i4GjbGicSto1B6ION0v3BZo=;
        fh=A9BxiProUlLARpaaPAeU4a830ELPi7ZrwJik74qtJkw=;
        b=1IBUo0Nl3EPnzcekLKxrBCStfqaRExquWYqKIBWRlz3ULOXMINN4dnI9Xfy1dhBNKC
         03JQ1omlsAKectmGubarZ3BYziRQV+MMFMQzgKXQ9rsBmmZXPMctaBXuIgSTKf8pUnRZ
         Dw4ErZmPLrGpj3AuyAmfvoEbUx6cUDcSQJPDXVpDBMcrEJOS5wslJREMSXjd4S47n/zV
         C3gzb6gU699pD2Xvo2JNHTw5pIfQKVi2R7sa71tzPMA0esLhCFaCLJ0TRq26PhM90Hbq
         qyiFAA7fECFu/RH3/BIG44V8byPVN+VSo+5absoEPC2HH8nmlDJPwqRHd2DkCSWbWJoI
         i4Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdRvQu7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020adff08f000000b0033e082abbbasi6474640wro.2.2024.03.05.07.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:51:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdRvQu7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhX4x-0000yX-EG; Tue, 05 Mar 2024 10:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhX4r-0000nx-6L
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:51:37 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhX4p-0007Pc-5Y
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:51:36 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6e4e9cdb604so799148a34.2
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 07:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709653893; x=1710258693; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HUlAyjbs1PTV+vCUlXu3i4GjbGicSto1B6ION0v3BZo=;
 b=MdRvQu7A1r7hxgexbsyF2P5uw7UfJAmTWY20y3sLbtAsM5F0V0yCSOjCInFD7oxnwq
 01dJ5d6tc9zQqy37jFegL0MKkJ3qpU6EYFLC5nArAmS+teMR7dp7mg0m0ZoNMP6eZSFO
 ZnIwv5jyVl2Y5H+eJ7O3a+6MdM0OIfo+CQfbbqfFSQccM9Atq88YcHeZw2PRuyiL3152
 rxcndPJQwydvmu4aReHmwMsky+92aK68q2tiBtJaI19FC7rAcFyOa+ZZw1oKlDaxGKB1
 R7gEB77NvpcQqQpOLYIQAwe/Eezz06MhACqUQNQQCOzAKrwMAG5bJiQvcFClf1OW3muR
 jN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709653893; x=1710258693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HUlAyjbs1PTV+vCUlXu3i4GjbGicSto1B6ION0v3BZo=;
 b=e8Azaqz8MeZP5IApCq01yahzR+as3psgLcOx/Yn57sksSQCwCB+/hNygiqUTJGX8P+
 cF4kt4Dcvwt2/NDJn9llfclh4GXsvuAiV4/aOCV8ipMPmFqAqTb5I65LfWO6nI0l9ZwH
 vY30eKFpQIMMzJ6xEjjrHn9AJuLLHCTzTnNRMYNZW8mWspGciv/fIIjwx8lhbkf3ivAN
 52CY7jHivGDLcylp72RbZ/Mke6JUs4PbW32VkIi8zMKLXyAn7d7IqZsrcs4UaqSqU/8s
 PwnSx9HTdk2a5xMW0VmNCdhe6awV4SVuzqDhowIAcKLDxDJNBHCJQJEfEkgdgMG5MfSE
 LOcw==
X-Gm-Message-State: AOJu0Yy6pOyYuMXH9d9x9yOytEiKab2mAcfwFdlbv+dbfxPVEEp1qUgO
 RXS+Yy9pR1Y+WNiAqyi/KMSmr4FSCwhr9KPMNfYthPBUnE5ui7ZOrcKIa6oY5YE=
X-Received: by 2002:a05:6830:1002:b0:6e4:f67f:9d46 with SMTP id
 a2-20020a056830100200b006e4f67f9d46mr2167797otp.31.1709653893146; 
 Tue, 05 Mar 2024 07:51:33 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 b22-20020a63cf56000000b005dc884e9f5bsm9470022pgj.38.2024.03.05.07.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 07:51:32 -0800 (PST)
Message-ID: <cdd286d6-2986-4c2c-8785-dc311b71e4fd@linaro.org>
Date: Tue, 5 Mar 2024 05:51:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Fix 32-bit SMOPA
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20240305023116.234256-1-richard.henderson@linaro.org>
 <fa8f1d52-f88d-4107-abfa-fa10ebef511c@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <fa8f1d52-f88d-4107-abfa-fa10ebef511c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
X-TUID: CCGmsdutZL3N

On 3/4/24 23:19, Philippe Mathieu-Daudé wrote:
>> +        uint32_t *za_row = &za[H4(tile_vslice_index(row))];
>> +        uint32_t n = zn[H4(row)];
>> +
>> +        for (col = 0; col < oprsz; ++col) {
>> +            uint8_t pb = pm[H1(col >> 1)] >> ((col & 1) * 4);
>> +            uint32_t *a = &za_row[col];
> 
> Shouldn't this be:
> 
>                uint32_t *a = &za_row[H4(col)];
> 
> to work on big endian hosts?

Oof.  Yes, the H4 adjustment belongs here, not on za_row above.


r~

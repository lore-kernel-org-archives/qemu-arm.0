Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3168842ejb;
        Tue, 21 Feb 2023 03:38:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/RL3sqKfgWQKavYNG4+b5frbJjCN4eaH7RDOsefcPXwpSPQhp1uUU1RDG5Moy0kSj9OnmQ
X-Received: by 2002:a05:622a:255:b0:3bf:a5c4:eddb with SMTP id c21-20020a05622a025500b003bfa5c4eddbmr792025qtx.50.1676979539251;
        Tue, 21 Feb 2023 03:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676979539; cv=none;
        d=google.com; s=arc-20160816;
        b=s9HutfsowEsCx1nv4zAPV/6lRDkkEgVehhRjjiwsLC4O9kSC5F+xXyFPjHrWtdPeAk
         uES+AfjBV8TgJ9Ayu5lg6zqFy4id+9ULmzia1tk8BhmQ76P1nGo2wl3r8G81/BWjAOUm
         cSxfKUV7VA2OYEnfa5speW+tJY9p5ZtSLPtI/7V6Ynh5dvCAtZaOYvZSagsxKmzfx1aj
         Brg5xFM6jR/8TtgBloNiEKVHfPZfaH3j4Dz65PV57HrU2FFAydba5dHLuI/UYqdNfMfB
         T6PYT2MNlZcoisoCIJKWbj+ZGZrjK/g+RBq475OFwXXNZdzjltF//O7cUMtugLbtw57e
         HniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GwascBkMHH3kGWQhH+ps8nqxtQscUT5IKDX2knEM3bE=;
        b=ONfHUOFfS54uLbzYEMf/ayH0mKQCMnpVcHhJtQiSLF4dSqoDGC143zmfOHv1BBEaTq
         Qzfot4WgiGd2duUQlBmmZjF2fRzHqNoRB27rebcw1EG7Sp0sP6k/Xc+wuQWD+Ta30ZrC
         WAWN7bKF6DOSNg7Mhj8k4L5/tV1o0tAEvTDrd675Il0zM5L0q5EoPOYVecdas/eiKEod
         /Wiw+ZxX/xh+CLFmxCQ+c2Kg6I1LvMGJHxk33V5k8rCUTEgJoreR3cke6LX0t4jM4fz3
         KaeCu2LM+EI2ZxnoiFa+BKJ8GCIWNKpXtAtxAXysp+9CU35EXHA2ejKKFym43L1Aleio
         epMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XjHJQdLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020ac85c81000000b003bd1a4f96b4si10502056qta.277.2023.02.21.03.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 03:38:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XjHJQdLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUQyy-0008V8-DJ; Tue, 21 Feb 2023 06:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQyv-0008SW-Gb
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 06:38:50 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQyu-0007hP-03
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 06:38:49 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so2883986wmq.0
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 03:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GwascBkMHH3kGWQhH+ps8nqxtQscUT5IKDX2knEM3bE=;
 b=XjHJQdLIkKxVPF9SN70eUtP/qu6pgps3tY15NC3P0dS80MUfej99K6GHRSyb+8/lm0
 2lBl5zRFozudIbqo5jF7jBObYYtjZTK4Y2QrApWIR0PifFw1Zc/OC84WEAa5XAMXT1KF
 e/kpZxvKnkvR8qFrkwsTd2/4DORV7+0jeiN+EW+t3jh7HVRTxZXbGUz3eW0fIn7M0tSI
 PoMAwRt7N+d9DhjvYbB9dvHGX3fbAKBn/Aihte2SX+h3Kb0n2NBjlZ0MVr0fsRTrBNqv
 CUuS6zeh47kkCCanS8a+aPt2SOEkI7F8B8JHqjLDWqP6rPdOdZfxCvUutlXiML4nOtw5
 Ntew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwascBkMHH3kGWQhH+ps8nqxtQscUT5IKDX2knEM3bE=;
 b=uFwDHswI2TvPe8QlvOZxRiIpXMD3Oz5BQl/V0wH8MmxPE8r7+hexajh9kxEWmYKAb+
 e7NVkty89d4qYUQXLfm7Qa0tMdwbq9X+8XdXBqR+bU7bGxUqPKY6ReqES9wyudBzM65B
 EWh6KvxZpSK+deVfTMWsXWL3fDY2+QAr7WN9cxMmQOgfF9ABRHSrOk7l6LYG/PJz/xgz
 jeGXyuqwkLnllbBfAxrYGwqWMyhkzoMmXA5KlBlF21uHP/8pRZqAPKWBwONOLYtKBkHa
 fOTPDOoT4qUKfcyQKxzW3I9fXzqDoi6VdvXbTU7/2z5770joop661hwNysO9/yveUZfm
 BQQw==
X-Gm-Message-State: AO0yUKWHK9WPDq9g07vPrVtYfU2Bmdr5xQ36qV0n6Mv583SASePwqTt1
 aQbvulwSY7rmAwomUa/dlF1VHg==
X-Received: by 2002:a05:600c:907:b0:3dc:573c:6601 with SMTP id
 m7-20020a05600c090700b003dc573c6601mr3256996wmp.36.1676979526110; 
 Tue, 21 Feb 2023 03:38:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r5-20020a1c2b05000000b003ddf2865aeasm4544557wmr.41.2023.02.21.03.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:38:45 -0800 (PST)
Message-ID: <0caee59e-2459-3cc8-1b31-39c54a2a59ed@linaro.org>
Date: Tue, 21 Feb 2023 12:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
 <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
 <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
 <14c3e3e0-1b1c-5b32-1bb9-8269e9facb7a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <14c3e3e0-1b1c-5b32-1bb9-8269e9facb7a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wDlrTaV7TAyt

On 21/2/23 11:50, Richard Henderson wrote:
> On 2/21/23 00:42, Philippe Mathieu-Daudé wrote:
>> On 21/2/23 11:01, Richard Henderson wrote:
>>> On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
>>>> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
>>>> they could be shared.
>>>
>>> They are not.  ARM has Secure EL0, or secure user mode.
>>
>> Oh, I misunderstood this field with user-emulation then (I tried
>> commenting it and my TCG/HVF build succeeded).
>>
> 
> target/arm/ptw.c:2853:    result->f.attrs.user = regime_is_user(env, 
> mmu_idx);
> 
> So... it shouldn't have built?

Eh correct... I guess I wasn't sitting in a directory with ARM target
selected when I tried that 🤦

../../hw/misc/armv7m_ras.c:19:15: error: no member named 'user' in 
'struct MemTxAttrs'
     if (attrs.user) {
         ~~~~~ ^



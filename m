Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9937CAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 01:00:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyK3e-0001dA-Ae; Mon, 15 Sep 2025 21:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyK3Z-0001V7-Fv
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 21:00:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyK3X-0006YY-Ll
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 21:00:29 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-24b13313b1bso33121405ad.2
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 18:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757984425; x=1758589225; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VORNWWIAd7pPP67I1ECz1kK2tfhafOoMG6VBf3ICpI=;
 b=cqGSLfO1R2+THBmJnsH5vOciS3RSI4KWOxNySDvhEX+vjNVIH0cWSt3Tg7qxYduzRj
 mCNmouHN+ID3KIa/xsDUf5aVQmPkvJrZmr3Uymd7XCkEI6FG/LywUkwmR3jNxafKUvqu
 aOGeHJ3A60vUMgRQqIKGIMztDsfNi5KlSIOJXybdGSdDvIzL203N0R9d5keFJcdc2R9C
 u803KNLiRBaj86oUJdUZkhKMB908qxSN9tjGXyzXt5gw3TYdXnbN38/uNNopCX3x6flw
 xvYENZ8RvOBESJO02XpUhy7boh0diTUu0nEoE99YMqlYL63dIJRWXjMK9j/VDyhGFwSo
 q4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757984425; x=1758589225;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4VORNWWIAd7pPP67I1ECz1kK2tfhafOoMG6VBf3ICpI=;
 b=YuSngT+/v3Kc8ZKdcbMSSfDRBopx1Qm8Qbx2DG9Am77AXwzGNyv/23gMOIn5tv9EWo
 ArFfiyswEnNyxAzDQMhFCfM6W8h5MCoEYFesdwiCMGIcFXDOYWYsM5OjDhvDLmDYNrVD
 WN0zLn/FA7VLomqwCqKM++kXjUJCjMxtX4mVFblcGhErR+4+ogQaL8cTcotkE/l78ko9
 5uJI6QhkhiXIUqv7SSZ5q+EE6M437OgLZzG2dX+6R/VYiCVV4xFb9/QBUIO/ysl8Qyfj
 mLXScOUVS+3VcLPj9WbdaXLF4ZfkSajhVnQ7hSFzmFCLnd57N15nuSpDoitZ2LY05RyZ
 +rCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnnsNEGg4/ybUI4skgUrMtLRtsxQjUC3Ua0k7k7V4I9eSd3jUINxayo9vvjDa6/1oImjmvZ5nyJA==@nongnu.org
X-Gm-Message-State: AOJu0Yw4bMeCyusXxZutuuYubcoRls127v5MtWiSfnj0KayupvNa121o
 si4EjSs6KJMDuGR7a33CVo95eVwygnlW6ad/9bj7i2kkZJIynmHAl0H5WldQwzonQ6M2UwHrkiD
 AISSn
X-Gm-Gg: ASbGncuDhJK3o6YlDcC7JSDFMUUY3Cd98HzswKYBWJ18C/HLAL2PP2cGCS2T8scpqHC
 4vXHUmXHVs6kIRovwiA0LMQXLx3IT2Zr7QgAafEpcm09pwsamkuIdfg/I7WdMg/JDHPbm+ZM5s5
 KQHCOqnSixI/rUyl7/yYHRnP8xYSJf9aaUIXT91iLf1UWkZxGgMLF4jfdiRv+eUQpkMLLStDy7n
 XDhwHQJvO6yCkCP8aNMC32V+urDrNoNIpvS4My0P+UXwFzZkMmABA5rJq9ZCWlQv09dWIJzDQkC
 UFce/+4fYaicY8hL+vWELtvYGFN2HbX3XRZ/0EfUz5K2bNg2lETyoDFK4MlIuiY/rjeSUYSYuTX
 gYlkPpJuns9PJcI9goEjmR4HheF4+H4Vp8v7+
X-Google-Smtp-Source: AGHT+IFRcreltfXmPk6Fe8waennf3Ep67ETE6Ctbbjylwf6R9MgVOl/jO5RhLCOc4Bxz6mx1BCY0qg==
X-Received: by 2002:a17:903:1b4c:b0:24c:965a:f94d with SMTP id
 d9443c01a7336-25d26a595d2mr184714495ad.46.1757984425065; 
 Mon, 15 Sep 2025 18:00:25 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-260cf673181sm85284995ad.99.2025.09.15.18.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 18:00:24 -0700 (PDT)
Message-ID: <961b4cc0-4705-41c9-a575-2fba28d7a938@linaro.org>
Date: Mon, 15 Sep 2025 18:00:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 55/84] target/arm: Emit HSTR trap exception out of line
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
 <20250830054128.448363-56-richard.henderson@linaro.org>
 <CAFEAcA_1QRqHm-CsNn1SsvxiHybRDRob3fvn8U38uZorYtf0Ag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_1QRqHm-CsNn1SsvxiHybRDRob3fvn8U38uZorYtf0Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/9/25 06:33, Peter Maydell wrote:
>> -            TCGv_i32 t;
>> -            DisasLabel over = gen_disas_label(s);
>> +            TCGLabel *fail = delay_exception_el(s, EXCP_UDEF, syndrome, 2);
>> +            TCGv_i32 t =
>> +                load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
>>
>> -            t = load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
> 
> I almost certainly originally wrote this line with the declaration
> of t and its initialization split to avoid this awkward linebreak
> that you get if you put them together...

With -ftrivial-auto-var-init, it's always better not to split declaration from init.


r~


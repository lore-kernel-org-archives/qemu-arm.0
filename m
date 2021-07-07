Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2664246lfk;
        Tue, 6 Jul 2021 18:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWb4GvBtpeCf45ez5cboyk2JzNzQxRs3pZkBR5siYs4ty/Ep/IacgULLDhQmO5ew0QbXJr
X-Received: by 2002:a1f:9950:: with SMTP id b77mr16418444vke.25.1625621564151;
        Tue, 06 Jul 2021 18:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625621564; cv=none;
        d=google.com; s=arc-20160816;
        b=aLpWl+5KkDxIBrLeGC9DtsIaG6MKtRJXqFVHBRGef7vpD8t/hZJKhOuR5r7gzH2QBT
         FYELBzMBwPPQSZG9zLDb6RpJW19yKeuWF7NNztFgZix6FJXmVmZlmxyuHg0Uqv35HP8S
         abQXP7fnjMONjbGZHEjf1RWJX9hDNiaz1HFOqteTjFQ5Rrg1y7xJdbEeC7hAJU7VwsL2
         1TPmVdSE2z+vqQqaZLWrXMcplDjPDtdEOwlmTBVj9KQ/oRhItm74T9MN0KXk2FH10Xuf
         S56GjcDLgGC7rgRaC4+/NdUQriGunWs6eKQB7qKHVIp45fVMUClgcj0cxg18k9nY3H/E
         QoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=u7d+KAYJVXhVrk/gv6RbfxWKxmyD6YWl0WBVW1b7SHY=;
        b=YncANMAXopOWR0ztwl0FrYbFDRKgUTKHNj520UkYJnen41ptOeUbbTZ+lJ/yTCTre4
         TH45CmE9z66MWON5A0OKHnt5z9quHfWaxbFnjaz9NOwQ87zS0RvTAiOK4U7r6hIDV0kR
         TYp+5qs3iiREWRPHsg7jzdQ3N+5PHvrG25r2aesOaHCioD4nHS1i9KjvKBcAAP0XbtV9
         Rjg+fOcABVPzul04hCqibYZeqLQPLm4Z9nogMA7uz0Ix0gfbCKijTgO0IPESEa09iaXr
         Aews0cVZKnXfM3TnpImJwFK3q5xLv/ZpU07Fknd8UwX1IaEasDefhYv0KKnuyebE7OR2
         T50Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YRxcxcYs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si14247913uad.138.2021.07.06.18.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YRxcxcYs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wQd-00037e-Fe
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wP7-000104-Cp
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:31:09 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wP3-00064l-R5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:31:09 -0400
Received: by mail-pl1-x631.google.com with SMTP id u19so170843plc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u7d+KAYJVXhVrk/gv6RbfxWKxmyD6YWl0WBVW1b7SHY=;
 b=YRxcxcYslbThkiDVgzHycVXP/j3ImHwUqHo9CEj5XsxISfQZi6zt4Fn0z1wQKA0hD0
 s2jo2WXxalEGx5G8QXI4HrjHTWFr0npxoiJ5N17V6G484vSsPT7OgxxFcSeg6OSmRdIy
 BSHO/acS2iPa5/OF4NymJMoJvWvijxmqbn2FjMDAUNfmp+qz0VRJ6j7/cYGlJr+O2cIQ
 wnDmt5ferQvIar0AQ3VAnwPQI5G8gu7IRyogTXs3E0A+TGGZwvO47Q67lM4qGpEr3UE6
 qF1+CAh7Y/EKJKn1S3I4NtjSoqfQjqKObdGLADygX7Vp8BdxqyL8P9sx+vf89jz0ba/7
 Pccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u7d+KAYJVXhVrk/gv6RbfxWKxmyD6YWl0WBVW1b7SHY=;
 b=cxICMtagwasvAXskG6oOF2UeRlDpPbQJfx2qhHdFxJaLJRUqUzKo1BUX72GIO4OQsq
 NUBJAkpiBr3RMjULq2odP2jTTRtgp2E3Mo52kpvFmqx8YbHP9ouLwrRT6TUjrLtAqZ/x
 qSXnkxgR2D/nekuNGe+OJQhBdnTFkz9a/+Rr6D3gnWkpL8WtWG7Lcq7WbX9HTecuIWqR
 0SqwnQ4p8VTl5Ah7cXNEeZoUBjdAGbkrC+E0ATa4plDhQifbiUS5CaYrQAQYW/LhRSgX
 DgjGedoB10aE5B0a0MxHZaY0ujKZwZDYp4Bp8BjmPz6Mpp9mLTaDva32Xp6gxresJLer
 hWRQ==
X-Gm-Message-State: AOAM532jxEyBhfqSaEq2QKxIr4ILKGW/xRnC9OVK9Qa38bxasPDETV4s
 J0nCDlX2p6w7IpaCIHPpRSacWw==
X-Received: by 2002:a17:902:7d8c:b029:105:2b81:3915 with SMTP id
 a12-20020a1709027d8cb02901052b813915mr19297879plm.71.1625621464469; 
 Tue, 06 Jul 2021 18:31:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e24sm18026129pfn.127.2021.07.06.18.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:31:04 -0700 (PDT)
Subject: Re: [PATCH 07/11] hw/gpio/pl061: Make pullup/pulldown of outputs
 configurable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1330996f-b0ca-aec2-1c39-53ad7202c894@linaro.org>
Date: Tue, 6 Jul 2021 18:31:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BjJF8vRnVO6b

On 7/2/21 3:40 AM, Peter Maydell wrote:
> The PL061 GPIO does not itself include pullup or pulldown resistors
> to set the value of a GPIO line treated as an output when it is
> configured as an input (ie when the PL061 itself is not driving it).
> In real hardware it is up to the board to add suitable pullups or
> pulldowns.  Currently our implementation hardwires this to "outputs
> pulled high", which is correct for some boards (eg the realview ones:
> see figure 3-29 in the "RealView Platform Baseboard for ARM926EJ-S
> User Guide" DUI0224I), but wrong for others.
> 
> In particular, the wiring in the 'virt' board and the gpio-pwr device
> assumes that wires should be pulled low, because otherwise the
> pull-to-high will trigger a shutdown or reset action.  (The only
> reason this doesn't happen immediately on startup is due to another
> bug in the PL061, where we don't assert the GPIOs to the correct
> value on reset, but will do so as soon as the guest touches a
> register and pl061_update() gets called.)
> 
> Add properties to the pl061 so the board can configure whether it
> wants GPIO lines to have pullup, pulldown, or neither.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c | 51 +++++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 47 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

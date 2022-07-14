Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp885563lfp;
        Thu, 14 Jul 2022 16:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twbBjcEbRMaKU/562IgiHg53FhLCGM000z77Rmg40yafrPbckzJ2NltP19oJvPgKV/GHnV
X-Received: by 2002:a37:be84:0:b0:6b5:c2a3:cf8a with SMTP id o126-20020a37be84000000b006b5c2a3cf8amr3587512qkf.447.1657840707050;
        Thu, 14 Jul 2022 16:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657840707; cv=none;
        d=google.com; s=arc-20160816;
        b=xLwncpZU8A/KbN7aDy3Cz8o0ammMm8pzuPBfYiAG01ukj6llsV+H3pJZdKcZmP1rC0
         2JbGvN/2mj5lrTy1Fa+yGXNpD1J+9Ls5rWxB2uCeycXgbz+Tbd5p3tji1RQeHxUPvDzY
         7qatTDANwFrut8pvKYKtr1mqa9oGk/6JBLMlw6hAqT8VQajTsE/nVrxYb12mEbEct57Q
         vpD1iYiak1XeIbIvf5F0ZeOqCDAue6M705OEZABsTGpAqox0gOFor63sVXck6nyGZ2HL
         U4tlg6Pcz6HzXk5ZWQw3DgDRY0EqdfCQKi6xJP4C4ynMF1H0z26phl/fN0OLDD9Cj9ak
         qFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1OUSiWWsXRgDs0vH3JIAKa+MmMDxu2DXxYSPaWhhAR8=;
        b=VZavJj9Dxfy13F6IRXIT9yyP/qOc7q4vqHa7usU9FmFLQcgqq0y7yHIKAOi7rQyhNv
         EbhK01vvRBfuLJP0Zv4/IjmD+ZzCQzJMTdQohuxrUfftNv6WeT78cWRUeS3gMiFvmQgL
         zl+JDVjbhqpwHbviUwktChJHWlVV3oZAkWbMH86jnhLbFc5hJ7qGT8LNxjBnb8hHI+f0
         sohuekfOJrUhPmvSxzOw4rJsWrqbV8aX4TcVUyW2JLs3BXbJE5tU0ajN7yNAaY27F8rT
         vcFnj7Y5QRHCtS16o+VfTPxkbwXEWW1W0L//hqq3mjNpfs60jslCmz0gdc1IZacHOshS
         7ngg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MND0zs3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib11-20020a0562141c8b00b0047314fff0absi1928307qvb.342.2022.07.14.16.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 16:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MND0zs3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC86E-0002h4-Ip
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 19:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC861-0002gK-Jz
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:18:13 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC85z-0006SJ-3t
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:18:12 -0400
Received: by mail-io1-xd2f.google.com with SMTP id n138so1439302iod.4
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 16:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1OUSiWWsXRgDs0vH3JIAKa+MmMDxu2DXxYSPaWhhAR8=;
 b=MND0zs3KiQAX408pS6OBiy3R8JKu95kR+Xr1E9CKQmQxghxao+6tbMXd1GPy4zygbQ
 D+UdLqbSqUCkCSAbxTPEjVeQArj8++H2kbevD19gSRikVbneBwvGyolcQlajNyftZNXm
 ztBosvoGl6Gkuv5lRfcXO+UWbdTOi0TgrCPTysTTsYDoUykx0Bmu5ew/F5GZy1AomArZ
 6Lt/CG8tXWoDFuPnR7sEDpCm6F1XE+ORPGjqaa8XSjM7d8HTkppQUCLO6LeygTe3JsKz
 XEZ4VjozmsdsGJSpwLgqjrrnlq1AQ15YFdpoVRS/ksqxYAFm4K2r5qD2cYYwnSDkDo5g
 augA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1OUSiWWsXRgDs0vH3JIAKa+MmMDxu2DXxYSPaWhhAR8=;
 b=oY79IsPSY9Qpoq3z3LfdWUnGf+HEv71JhWVg+lqGgnsWZXGgnnosCmjP3UuxgMok16
 Xag8F+pU28ixjMWOYscdA4sTsWSV2zi79mYptg33AxKr48Sw/RePf1qUW6NlP/IkUysE
 kcXQY1Lj9KqgzROEXVM9rfNQ3GdbGTARZrYSiYNPpuTYwlI6FVDEamMwP5r8LhTYm7/V
 yyJh7fyIproyxjExHfwfqPSNkTwb0P8oUO9h0pSJCMe65+3dHUNzxsou9l+j3nVnDCsG
 JpJMLRLGu7gQX7LTcPY/M2v+9LGfAOnHIWX1WAF6J+gVhNs2UNrLx5L8SP+6BvT/qXkl
 t8jA==
X-Gm-Message-State: AJIora/mtC8wg4qqQhvjzxo0vj6nwye88YcROWoHNC2JbwzwBa38oFj1
 /RZIp+kRGRWdtiB3Yj9tsMk1ig==
X-Received: by 2002:a05:6638:16cb:b0:33f:8871:1b5c with SMTP id
 g11-20020a05663816cb00b0033f88711b5cmr5403629jat.11.1657840689979; 
 Thu, 14 Jul 2022 16:18:09 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d80c2000000b0066952cfe3e2sm1334117ior.39.2022.07.14.16.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:18:09 -0700 (PDT)
Message-ID: <c92cc8a2-ea12-3fa6-f086-7aebbb02507e@linaro.org>
Date: Fri, 15 Jul 2022 04:48:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/7] target/arm: Calculate mask/base_mask in
 get_level1_table_address()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qVdVHAg52T6+

On 7/14/22 18:52, Peter Maydell wrote:
> In get_level1_table_address(), instead of using precalculated values
> of mask and base_mask from the TCR struct, calculate them directly
> (in the same way we currently do in vmsa_ttbcr_raw_write() to
> populate the TCR struct fields).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

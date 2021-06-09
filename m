Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5666614lfa;
        Wed, 9 Jun 2021 12:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcifkdPBNTMEOf0j1cHgEjyx8n5JfgGoTCqgzAy6lNHgHlXBNV7oROk5lT2qyeUpD3eZcJ
X-Received: by 2002:a17:906:394e:: with SMTP id g14mr1254537eje.3.1623265904786;
        Wed, 09 Jun 2021 12:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623265904; cv=none;
        d=google.com; s=arc-20160816;
        b=VNj0cWjg/QxXXUevsYop+i6/k72xGdiXdOm1sA1vVjftseZEXu7RS0g8x0b+Q/NFWl
         ovXiBzhDfcENf8KD1zSehSxtGUaoVfCxLwN77u5eFvoiwx5JUX9BULI6y69JtxxaMAx1
         vTHq4H3XbuSMRb8uiw6dza7Oiq0bGkJAM8A/vvA+ULD39UCdO9jooBgu9x+Io6QnhBKo
         JCDVDH3qqIx52wUBTdbQU8pW/Lu+Se6JHxGMuFekgEtwDRTb8878MoZdXA2erZOh8gWI
         b/QmhuQ3oEt6FQfhFzbTkvV3GlnbpGmb2nBYiNM+SaJDfIyKAhvr1mZfcgdta85L3QtM
         j0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B0w2h9rZ9tl7dSL9uHNLhqOokh/6SIDQ9lK0h0k0dco=;
        b=hmRvzWVsneBUpo/3MLsu1i/JnUsK4Rz2OkdhSMrE9STnqM4YwHufR6y4ahYujJrvWE
         HxoiV43DNDXHhnNF2hhvn0sSRsI9uh0dClqjWxxXFH4cWPR1PiSLR2Tb1tss9p7x2FLu
         E8Yl5otBPJYzLHRZJeg/W0/HKiPOmaIbhSETlo2E2W9Br3Jr+n9q+kuzFRBFHCBnHZ2y
         fBzM6BSbQjj54t40oiJKfOnvuiqQbeq99rTlWPZzS3JAs3eeAWBBf5r8AVzjYWUwduRa
         qrCijMEVq27cYUmH6BCK7ic3Qv47SAa5B/+hoSv5x8QO/qF/3JQrKBmj4TGjrVgV99kJ
         MO6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EYfZ8tcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21si454448eds.89.2021.06.09.12.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 12:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EYfZ8tcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr3c7-00070U-UC
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 15:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3by-0006zI-Dp
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:11:34 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3bw-0000PG-NO
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:11:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id u126so15247542pfu.13
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=B0w2h9rZ9tl7dSL9uHNLhqOokh/6SIDQ9lK0h0k0dco=;
 b=EYfZ8tcTDBbrlnde1BYc6uf5+LqottSydnpvF/ryGWThTBoqComCs6ZWvD1uYuuq+H
 jXfVJsvxZ5Jf2Z07aUYIFwys65gQUy3zATTmBtjzX3VJSRNPf2m7ohe6NrlsJSxa4keb
 qc9ZLWtQ+NQCE0JWj3jyrJsVnECy5SgKwxB5eBfjmRvaIfS/9c090FnhLZ0l25Z41Yqs
 j2zHo5WzAmmWQvVvlUhHy6fi8POScA3NtZYALviJngszMWX42dKsdp0zZ+YC3ryV5J7C
 JEMyaV/8yFckdF1fRuKZxR0uivoHjzpCk5njpMXk8mcTxRZIg3E/y5PyYmK8JGZZA04i
 ATTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B0w2h9rZ9tl7dSL9uHNLhqOokh/6SIDQ9lK0h0k0dco=;
 b=Pz6dMVkJTmjkMhLrKnTdzJ9/3SsbOcmpp/pCE7i+mxFn5LsRGU0+xyV1MNq2u+PLIi
 ULjr4rvl/L5o0jmJQ7pof6e41ZRSEK1NUB4Ccy5wJfjMEG2TqeRgugSDMGPdXSWJ9lut
 S45WGkXeB3wyafHUwrXL2+DqaqOOET6Xq9sa6rGmEsmHtIXRpthwCu10GBDuVhJ7q/+b
 QCVadHgESAX+bAHK3AOVOKlzDpI6nGwdfYYkvZWxcLvRnG+sQYoDn+Cm+wNlZMvoXZ5d
 VXwP9vJlkalN4VzNKsFzf8JpU2QSnk8sYU/2XI3Vl3wnvHX42LsqYNv35K7WqeaNee6L
 5XnQ==
X-Gm-Message-State: AOAM531kXGLZTL94WGEOaXSAAmNdp96Jo3+bjCxvr72W0I4s66rcaSte
 VJ7O8qRwS5CMuKLj9JgChurBZQ==
X-Received: by 2002:a62:3242:0:b029:2d5:5913:7fd with SMTP id
 y63-20020a6232420000b02902d5591307fdmr1302126pfy.30.1623265891029; 
 Wed, 09 Jun 2021 12:11:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d92sm388731pjk.38.2021.06.09.12.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:11:30 -0700 (PDT)
Subject: Re: [PATCH 40/55] target/arm: Implement MVE VQDMULL scalar
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bef2848a-53d9-d66a-4911-e9b77a4c4d0c@linaro.org>
Date: Wed, 9 Jun 2021 12:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: BCvFn8nnMF8w

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VQDMULL scalar insn. This multiplies the top or
> bottom half of each element by the scalar, doubles and saturates
> to a double-width result.
> 
> Note that this encoding overlaps with VQADD and VQSUB; it uses
> what in VQADD and VQSUB would be the 'size=0b11' encoding.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 +++
>   target/arm/mve.decode      | 23 +++++++++++---
>   target/arm/mve_helper.c    | 65 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 30 ++++++++++++++++++
>   4 files changed, 119 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6153540lfc;
        Wed, 21 Jul 2021 15:07:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlw+u/L79LtWCMuQS0ZSvlPUTa3p4BdiEf7ZfHLpWqX7lJPjhPiCoLpr2IQviWfl8IiFz0
X-Received: by 2002:ab0:906:: with SMTP id w6mr40728048uag.37.1626905248195;
        Wed, 21 Jul 2021 15:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626905248; cv=none;
        d=google.com; s=arc-20160816;
        b=hRMH2aXEbS3FU0Z2i1ZImzIlb8N6qchknYwmjNzCOpkd8qZVh0gFN4LckSg+dR9HfN
         Gu+Tidov+g/A5Rqo9GuIDpZbW3z+/kYHrh14cfXLGPyDnWWkZutkZu1T8Fmb4LGo2+Pd
         Ce5zjLDVrDZVwo7FJL1p73SVzDvrrmESpbKlVMIQdWBV9LlPTSZCZClJRLP9/D8tyYnu
         M3UxD2i5iMY3LvDv47iWaO8ySSSxCqNzGpRzktswHP1rm0bK2MaW+IOUmI6Bv7tXR5of
         ZEEDLhZhFNLhjwC++3SxpVlnP4nxbiO+uQXZW/+ZVbRncWouPZQORJKs6OJuS3yVUyIx
         KFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qdrR1F51yFw1flfN77ehLdgQ41HU5l8ZA1pNUBWG9bc=;
        b=QCHeO4I6w0elVFvxuhpDtVUDTbqw91RM9+3hRYBR+ZzCY1wjynZ3Lulxz+UOH8Ania
         AgM+pFf4mNwkO83rRomMj5Nyk8ZdtVMZ/0E5qjqBHt+C1Ch7WSK7wHmFy4fjKwNOip4V
         5Z2urvljo7TCQ7Ta+WEfzto+ZeymRE1MMyWdNLgeVDPA7LLeqWkqLT8u5djc8/Pgh+BD
         r78EDVD4GVeupISfog3oMgw36cHOk4zEuPKV+UjCkxh8bAPt/8iRE+MRbPfwX08o8cDD
         BLMQp7zuYV/iKAmxykKc+C0ickOD3Q1ayl+V3CYXO0/hFExlc9Dl+UY0kd4oFZC3J+Wj
         r69w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quxUh9Tf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26si18320239vsj.322.2021.07.21.15.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quxUh9Tf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6KND-0001PF-Go
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KMz-0001OO-PD
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:07:13 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KMw-0000Rd-35
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:07:13 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so1384099pjb.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qdrR1F51yFw1flfN77ehLdgQ41HU5l8ZA1pNUBWG9bc=;
 b=quxUh9TfXjw5NtDb34q/yzHbtLZjRaBCcziAerg/ZXTH0lrJ+UwlImkOMebxdd8oxn
 2Xt3s4t0dfvXFx9h7dCbzpTGuRy7ej1pn19iOL2B83vBojzqWtLMypDoi41m+/hMXjrm
 hoeiF6W5Je53n5rngqJtUgmZmawYNte5AF6K9EmO5xVyDIYaOvwO8JLLqId9kby+ye1G
 Tkece8ty8wlNo63GXinPP2XySTeqtjVZ39reZnlaiO+HEoH8tKg+BmFJJxjTic+B6PGt
 +4EVr/2Un7CzDEXvXTkryAmjTzcfGr2I1Gsx6WnGnIyioHSX6MakU12/f0JqT1hqzi3m
 Nx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qdrR1F51yFw1flfN77ehLdgQ41HU5l8ZA1pNUBWG9bc=;
 b=W0aPmluJbvZ9MoDlaXzvhF+U0NWlmiAcgG6hwrTeRWzlJoyPBWXtkgYLj6Sc8hSO1w
 qf80KavymCengEYb/QMMdjAPvKgHLjwQS65llf2OuEckyeJnDKcvpBqMxa+/WiAmdBw3
 qXKcJ/eDxRiNmK5xNJ9XXNEUXF5JTo2nkTFdjX5rIzQAPi9IOp5mExqw5Yxu3BWTmLfd
 f5tSPfk3WTy5lzG4z+V+4aoEwiIpssU/v3USC/b4QGbGGhDq+OEZiJkyD/Qy1Nke3V+v
 wtBw5kK57wR7EX5MPrCauG0ST0ybqN1jnMTEidW/J4+qoyfx+4fRpDhKEKPlLl9+wkVp
 OOzw==
X-Gm-Message-State: AOAM532OVR3lMIJCsBcU/2EHPyB9h5c6MPkj9UNUgG055DpJ36t6a6Kx
 NVHnnjZDUVbIg8YQnCGmGMvN+Q==
X-Received: by 2002:a17:90a:7441:: with SMTP id
 o1mr36564159pjk.96.1626905228531; 
 Wed, 21 Jul 2021 15:07:08 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 10sm26509437pjc.41.2021.07.21.15.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:07:08 -0700 (PDT)
Subject: Re: [PATCH for-6.2 26/34] target/arm: Implement MVE saturating
 doubling multiply accumulates
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bcbdb1d-279f-73eb-80c7-052e14d51f93@linaro.org>
Date: Wed, 21 Jul 2021 12:07:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 30B+3dLkQFUX

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE saturating doubling multiply accumulate insns
> VQDMLAH, VQRDMLAH, VQDMLASH and VQRDMLASH.  These perform a multiply,
> double, add the accumulator shifted by the element size, possibly
> round, saturate to twice the element size, then take the high half of
> the result.  The *MLAH insns do vector * scalar + vector, and the
> *MLASH insns do vector * vector + scalar.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 +++++++
>   target/arm/mve.decode      |  5 ++
>   target/arm/mve_helper.c    | 95 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 ++
>   4 files changed, 120 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

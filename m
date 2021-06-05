Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1605361lfa;
        Fri, 4 Jun 2021 17:32:15 -0700 (PDT)
X-Received: by 2002:a17:902:b683:b029:ee:f0e3:7a50 with SMTP id c3-20020a170902b683b02900eef0e37a50mr6848258pls.7.1622853135024;
        Fri, 04 Jun 2021 17:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622853135; cv=none;
        d=google.com; s=arc-20160816;
        b=z5rrfa9IYaU9GcIcMEQE4/gCZFStw6JpkXsISkGq2sIQVDWo8vweqmDRvR6VrSur99
         t3Dkkh9+Sy+ZGPNq/flTjyS5tr4jX/0Z8aANDqqrwcIRmxxFsJNm3GGY0iJI8P3u9a6H
         D2c5w3Pn8ZrX4ohXcFYp5Fmz6H1E0R7V5akq5wDNm9mQggDkVTRnA5cXuR1StM/MfU2G
         2l71xEStFsmI5SaPn0izOuU+tLL3+Ei9FX5H+yml42NZjYmIPcZU4ccS2z1cGrCqsPcG
         sV97YBDK8XNiqoIYzj13kjdGadWmCxzSvDzmHBJCzKaeuqgf0vNKNfiXi7mRyI4R4vw7
         FHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VDgsh/3/PMvBK0vmoYe4s+I9cv2xo3ibZxTXRwS4UJc=;
        b=o+bYLlgZBl0pcGJFpb16cdtkzL555r3J5htVKxaGyNANQFYYv/NMr7vOO9ux9wbwv3
         /Rh9hZX9+4PMKkMMAebAUw569QWaYWTTAHb2WgBHic3Rjg8HWrzv+dedDCdUZWrNZKJT
         1Fw7ce7PnBvMbLM5UYtbEm9G7aSvYBP+BqAaJxie8ZkHUjMO9WYP2g1u1y8yn7bqRkFa
         dCNjlKXNg1XyMfs+pdKzjtL8HG3ljtwtx1NfYUmU0RT4kE75HaqY44WQ3tDg6rlQmlg4
         Cqd1V+mHBMXWWx+T1w4BF0DSWKpglpjNenIlF+1ZE3JT4YXaEGwH2ba1cqMjOuFWxpEL
         CfYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xjx/ZjQ3";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e7sor4471349plj.41.2021.06.04.17.32.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 17:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xjx/ZjQ3";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VDgsh/3/PMvBK0vmoYe4s+I9cv2xo3ibZxTXRwS4UJc=;
        b=xjx/ZjQ3kzOoj9K3PTwC6YPtpsOrYO1vhWxwyz2ldsvGJVWHlr5ovSJEelUtR7JW8w
         +bcUQadrcYA6SDgtH7YsGspbLkvTSvH+HnVQTYyMrq4O+es98bDPYRlUvH2j4xygeWfm
         ZiUP4FUqrMkIoXVf1vnIsA3WE8FYm6Dt9ECzQnGPfIYlScX4srWX/GI1ZtrPjKXLoo8U
         WHSA8WyZB6drU830a6aMwcTx2T1voBQzbsqOhxqqfL6Q2ElZ/O6Tbp+0Zg0ONq7Oi0aG
         6XSm/hecwBSWQ7Hx6Lu/9qO2XejFUo/EizzRrdTy8PbVkWs4tqy94H00RUYG+XkuiCL8
         Z0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VDgsh/3/PMvBK0vmoYe4s+I9cv2xo3ibZxTXRwS4UJc=;
        b=TMQEDTUXZ9KWR86s0ZH6bhOzNGmZDeJpUbVWBQXvPK2UHLcrEUHgoi19wHdIYVCf0A
         aCD06XvPG7fQrH3hfnBjpS0HtM8CQQHgVEUl8Wl4ir4P+iBfAf7uHdUtDyw+ajWJVxdW
         0A7gpm1w6xe8QzaO8orsntZPsQUXXsUCpqUjUSNQqtcv4xpsSzfLXAJd4oRNBtKbSQOn
         yYsc/CcX+lCBS+5f8VCsKSRNQDEiqJYRXWVMpMi3e7/RNzvMqOjjjA0wgtRqOAgQihLc
         uDfKjFF6Oy/NNXzxI8hXe0IU1dhWUueAUg7d8PqrH4r23da+StS+XGpnEuoDvRNH0mWI
         Rrzw==
X-Gm-Message-State: AOAM532GX/BSpNf2FYR2G/ZekSoSmAFFigiU6d8MNoElEqxma3ka6LHn
	1CQ36us/jSMx3GB/ktuiDSUGr4LA
X-Google-Smtp-Source: ABdhPJyQpTXyrUl5Jnh5a0m4X3MsrEygAvNyeoq2iPkFr1GHwOOxxCkckHR3vL8ipugxLLf+TY8hcA==
X-Received: by 2002:a17:902:9307:b029:fd:9d27:ea2c with SMTP id bc7-20020a1709029307b02900fd9d27ea2cmr6880984plb.1.1622853134457;
        Fri, 04 Jun 2021 17:32:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id r25sm2767747pfh.18.2021.06.04.17.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 17:32:14 -0700 (PDT)
Subject: Re: [PATCH v16 46/99] target/arm: fix comments style of
 fp_exception_el before moving it
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-47-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b0f638e-055d-1c1b-e54e-43f4b43dbeda@linaro.org>
Date: Fri, 4 Jun 2021 17:32:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-47-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 14ZH/WE12waD

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/helper.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

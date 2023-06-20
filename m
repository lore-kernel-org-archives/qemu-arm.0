Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp278935ejt;
        Tue, 20 Jun 2023 06:49:05 -0700 (PDT)
X-Received: by 2002:a17:907:3f87:b0:984:bd75:6a3 with SMTP id hr7-20020a1709073f8700b00984bd7506a3mr10331432ejc.58.1687268945237;
        Tue, 20 Jun 2023 06:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687268945; cv=none;
        d=google.com; s=arc-20160816;
        b=w1E52LVtaqJmT39200rcLsTg8Iook3ft39juZMIkSIEOLCnfcFKj5qyKSLLhquDELP
         gykHEpLuwvIPHckm/P0O1oUPy2T5FjrhKUL7tgJbg1SmEZKdk2frHVolZ9vo3+2tsa04
         uM0dDeROI6vacViV6kBWmzQcga/g8vnBjIbtw/WnjM4jCLeEuMRHp3k2/ZaPmA4aebhY
         cyfKgCJ/l9OrcQqDyg8IN+gJSvOYP/pbhNLcIRHI8sF4GtyvsIHXMk1MclftQ3ZfNPaZ
         CpGiMFRbT2jVexsJjvDODUVaxulFMmXZDUpGUvkn1J13++FmAGxpFGx2G8Y8j5cWuPFz
         fIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=l9B1kbqvGKKBlTNv1dLqyYrMZXESaFeswbBEfhWYLe4=;
        b=dk5F/SqoxmBe7NFZJ/vlKxlRX0nHY848mtL09So+jF0CTdFcXzaZZQyEZ3TTEsdy7m
         uJ4v1tUI6Gxd7cVvdr1KxZHQCWXo7XGgeLdNQn8ENiVKYzPTOIVox55XgkySYMOermDN
         9/cz1X5WMwheOVTQza9Ug3rGTinfcXXBOrZVv/cO6RSHsXmbkJByeiyQVUCJwda82V1L
         iGwJEVrjAB1uoHW1aW1TNaK9QV3SeSU2qnbabM7tbhz3SAluLLpGBbGFRilvLqLaw5RY
         y1fXzjxxyWK9ArM/CcoBPyZX50mDtHe6PkqVRL39duz2MUupq6t8gOuKFWSXbDZMhlpL
         QWww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOGiNHMV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g7-20020a170906538700b009823ea4b4fbsor768016ejo.8.2023.06.20.06.49.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Jun 2023 06:49:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOGiNHMV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687268944; x=1689860944;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9B1kbqvGKKBlTNv1dLqyYrMZXESaFeswbBEfhWYLe4=;
        b=cOGiNHMV1BXRskSGR6Km/Ys7YrqqrYpW/hEVAIhIZ6StlsFJSA6oUb7+0Z7YXn4T5D
         zxojC2Y1EP2M+fMGkllbz98xd01uT7wFdOFFHfn7hBcQQo+LF170y+dlaDjQ7lKUlvTP
         YEMBcFHb5Jwv4rxz1yQeKDLHMD7WXLDNNPHR1XuXZfX/LrGvwWXJiXg5rajMj/r/NZyq
         jRY0rSOotBzSfR3llSaVSl3BX2TKdCUC28DoVwHt7MgG+7XyHUnpUZMM/ptbIMSEqRLx
         dpaYqrVT9qp3Du/syQ69e32we8QBIutjM3kDXCwnz7SMSiuCtb80vvJOsaMA65Pk4qEE
         x8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687268944; x=1689860944;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9B1kbqvGKKBlTNv1dLqyYrMZXESaFeswbBEfhWYLe4=;
        b=DXVBB22eCh13EQohzuNaY/NLyEEqeHqh3vEZHsrO5bay7YhsLS5IZnxVSkAU6MEXMa
         Jvqg2r7Uqm/5hr9LZa5lTk+oshrzRTRFvlYR65O0sd9a8yMuMjvsgEwU1huEBrl5sX/+
         sRel0gFpobqETXW5iPhKcshMBREbuuMgLW2tigd+LD77vA/Z9RI9h/mJFDHxXT65zVeu
         gj5wRpiNoXN33igmrjobQalVRLgLFUpBrsBsHbfArn4DWMLNr/s67WSEAsj2s0JMvBBG
         DwCsgTAEF4kUHv62mAe+wC2yGrmHZ+l4DlmT8OMYTUh+TpTiQpI1/IN0HYb7bRK/+l6T
         t5dQ==
X-Gm-Message-State: AC+VfDyC752SngBtnDAhg+xd2dSUhQ/hwrbQ3M4zhciXV9fYSaIOIBiW
	lF60b4cC7zEajk0C0Ugpw7kE++u7ojkxwrwr1hfGhHu4beE=
X-Google-Smtp-Source: ACHHUZ535sXypMsvdbW8sfX4QDQctuyITtNCJ3Uz3Ogn83OqHdBkqEJ8P3HMsqdDhfAomjwc9om8Yw==
X-Received: by 2002:a17:907:805:b0:989:450:e57d with SMTP id wv5-20020a170907080500b009890450e57dmr2291735ejb.73.1687268944387;
        Tue, 20 Jun 2023 06:49:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.69.129] ([176.176.183.29])
        by smtp.gmail.com with ESMTPSA id c13-20020a170906340d00b0096a27dbb5b2sm1404762ejb.209.2023.06.20.06.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 06:49:04 -0700 (PDT)
Message-ID: <650c6208-5827-2574-499f-0d450b277964@linaro.org>
Date: Tue, 20 Jun 2023 15:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Fix sve prediate store, 8 <= VQ <= 15
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230620134659.817559-1-richard.henderson@linaro.org>
In-Reply-To: <20230620134659.817559-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6ResbaQ4qRr2

On 6/20/23 15:46, Richard Henderson wrote:
> Brown bag time: store instead of load results in uninitialized temp.
> 
> Reported-by: Mark Rutland<mark.rutland@arm.com>
> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
> Tested-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-sve.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1704


r~

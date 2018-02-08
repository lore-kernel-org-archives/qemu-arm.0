Received: by 10.28.71.27 with SMTP id u27csp2538426wma;
        Thu, 8 Feb 2018 12:59:53 -0800 (PST)
X-Received: by 10.107.46.145 with SMTP id u17mr663960iou.269.1518123593511;
        Thu, 08 Feb 2018 12:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518123593; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYGi37YEp8w+Oh10oynQHAaSbjTKDe0Ito/IfpUC4WaZirAtUfUnPz02lYCoxOCRyh
         TKG2O9Nm/tuHti849+eqJf5geBXMtpZ/1Yq4XXev/UwQrtdfFAFPBcz5BL9Xq+39dDFa
         Rs0VMSq7uTBfRiUXTmjSfepDOzO0TAFyNO7vCpq2jAn6b1ki124ZZrqv3qfGHDyVtW8U
         8BaxY+xj8P3sDI3RykIJv9UNCNLqWCLTIViPpWm+CI0ynd7PJgn1z/dKUNxBGYalrbQB
         6/HLvljT9oZsT6QaqXwrDzwnIDJEQaHvJhN9eN43Jc8OBIpajSnRN3O0+Qk1jVDTcWCU
         +Cww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=s3kVftuzELxk2nKOx/4EoJ6ZjaXmNG1Nu4Rd2n+xZak=;
        b=knpJveOiGGcLIKgEQAcupUIJiBOAWNeksLSy4u5h5wFRHQ4nvTXcHzCfW+vaPziQwr
         ped9rF6uwgYuaQM4rfUfnDAR1drMP7V702DyLeeZZF+eBU/f5S+2oeuFUoyBYWYq9ASy
         jtDTxH1myy/f4sAmofXQz44dJhwYLRg/cLSfddGPRsNeq7w6Kb3kzpDUuTXF0WNu5lUY
         WpPDR6arfdqQ1UN9t7qpUgkx92EzfOFxPd5BpR3bBjsgeBLK15ToSNo2sI05Gy6wVNYE
         K1d6eB6YAuyh/++5ttU0qO3Cy4zruBX1IxfzSrsVqaL3xcXRrV+ZWK4A81ElotcvzOdm
         Ptaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JNHvzHpp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e89sor481595iod.120.2018.02.08.12.59.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JNHvzHpp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s3kVftuzELxk2nKOx/4EoJ6ZjaXmNG1Nu4Rd2n+xZak=;
        b=JNHvzHppa5d1YrBl2uWhqzayNbtAuv4OpK0y7QtO0CnCoO2pkBCGuec2vCA96SXcyc
         zmninKIuMElUSFEL/zV3vIBLP5LpYi4CtXecc+LXQxi9+tZRC0M5VlTYEWHf720VOvYv
         2MC0fAv/VDXfVjTI0f3HEUmnf79UJitNrYuDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s3kVftuzELxk2nKOx/4EoJ6ZjaXmNG1Nu4Rd2n+xZak=;
        b=tmbIXk0Eg/A4NMd8aVyq3kONJeWbMdQDMw0JbKnSxLfz02rLCQmIDHhoPanESjgQDa
         PrAoRFUwfAVTV9MKsdvBk8+eTpPbFa5f5AL0ri6rWgLQ6fJiRv+/apt55R5Ba3300MXM
         2p3vJC0/1jAODNsT6eUiaikGVXG1sNsPGhA3LNLmcd+iD6fU9uco/RvJbKdcFqUtUTfE
         BH++HxIgSZmbjY5cIunYDfPiQkjiPi4F0fzXR2EDyg5rrHfDzr0C8CZ4rNwVgurm1cWC
         Ki/3CxupU5ktilx0v+//qJZORrTzTE8ls5wcqk4QcNcl84sc32fJ4Y/1afPXzaD+C5/W
         MrIg==
X-Gm-Message-State: APf1xPAQoleABOFeO3Phk2QtdUDQJJWuXn1uirjnlt3ZT07lFD2Lotke
	doVZEOlDhPZtQT5MNMq45FaYWzb1
X-Google-Smtp-Source: AH8x227ndJcNlpmkytQv0pidsCW+cLU88Isr+Odmx9w7elpHvgzHYmv6Oq/SgkgyiMRCHJSrVhFYsg==
X-Received: by 10.107.17.211 with SMTP id 80mr480919ior.11.1518123593093;
        Thu, 08 Feb 2018 12:59:53 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id s99sm600354ioe.63.2018.02.08.12.59.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:59:52 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 13/32] arm/translate-a64: add FP16
 FR[ECP/SQRT]S to simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bfbbc7e6-48cb-9ff5-aa27-8226527ad4db@linaro.org>
Date: Thu, 8 Feb 2018 12:59:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9DsNrbOsXACT

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper-a64.c    | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/helper-a64.h    |  2 ++
>  target/arm/translate-a64.c |  6 ++++++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index bdfcac111f..6358b42472 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -192,6 +192,10 @@ uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, void *fpstp)
>   * versions, these do a fully fused multiply-add or
>   * multiply-add-and-halve.
>   */
> +#define float16_two make_float16(0x4000)
> +#define float16_three make_float16(0x4200)
> +#define float16_one_point_five make_float16(0x3e00)
> +
>  #define float32_two make_float32(0x40000000)
>  #define float32_three make_float32(0x40400000)
>  #define float32_one_point_five make_float32(0x3fc00000)

I think we should move these somewhere else, some header
where we don't have to keep re-defining them in various
files within target/arm.

I know, for instance, that I need floatN_two in translate-sve.c.

Just putting them in softfloat.h is probably best.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

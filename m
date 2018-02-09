Received: by 10.28.71.27 with SMTP id u27csp1216941wma;
        Fri, 9 Feb 2018 09:55:01 -0800 (PST)
X-Received: by 2002:a17:902:7848:: with SMTP id e8-v6mr3343543pln.386.1518198901442;
        Fri, 09 Feb 2018 09:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518198901; cv=none;
        d=google.com; s=arc-20160816;
        b=tcDZrFuFBZBJy2wZ2vvAFLrvDzdTYqonWE1TQfx3LJASyO4RfAAeQMvrLtS3jCWf+v
         D3zPVdzg87wUz7hb92hpE6YRBQVBIO3YDGjpqLwfcroJWEsp8Uq2mcI7RfHPE2cmTjFY
         Uose4RMJpzwCqsUxQw8zM7GVqTN0tW2xUzIVupPMzSuGVecBUf8w6YfCZSZ5Kik25NLk
         midZ1CjIcVwMQVG9C0hxXPeP18DGgrGTwSttGl6zCO3xePolOkXfnMbovzKHMoWKW7ws
         tZei3EYp95er+I5RCWl3H3zUcESh8ns0gNentygixYa60vlW5OqUvcE2xLMJoGxu0qE5
         X92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Sd/r36rY19zAQz1lV4nWlUtO25AzGvEAtQPizgWEQoU=;
        b=BVBge1NGgV6wV1Q4JVNpi3AUfn0hQzqtD5jLbMCIHJeAc/i4LI96UZhzpOrgKx7rgt
         +mMKnRqLCiqXE4hC/bF3uUq7sUCysM6NkCC0tOjKxHx5dh+FCi+KqI/lHQ+0u169Qt1H
         UazXY4wx4WzCZiYQAgvQJ2zyrO8l7ZzPezVRSGhsIgcFfFu1I8cK9xapMFXiQCeAslTr
         d/yAKVHP9YdJpWSYrYz5oqRIei7dRnz/8G5aM/LWsFlWGfrPXYz/fLLA0Dt7/tn6ZaeO
         6mqmUnobJDazuC4f3IVCIfMYgDoHx7d1VkHDxNq3VHYYbB2MADtuvfY6vvfiFUV5jjUr
         QqhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hoest6KS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j17sor622909pgv.201.2018.02.09.09.55.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 09:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hoest6KS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sd/r36rY19zAQz1lV4nWlUtO25AzGvEAtQPizgWEQoU=;
        b=Hoest6KS0DlvRnMNHP2AxYwZELFFavZYEQu5KFYBXByXB9DCseoaO4cP8lEupo3p/0
         BLumyTf/Sue5X1wUXzKLfVfIFVVCgHnpiBnZh5bULTnl/4Ef0hGud/K16o7AbeKlmgGs
         uznv+UFl8HDbilh0yI8bSprPjgspv2ysXT2gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sd/r36rY19zAQz1lV4nWlUtO25AzGvEAtQPizgWEQoU=;
        b=IwTm3c8oNh3xD7rn3QRi+ebmZSK6h2iaiDytw3y5nkiZ6jlqixXZ//ISvaXC/upULl
         npGBsL7OWeQtspSqr/RTI6oI1GhgAHaygxAsyjaBlTO5cR0PZHuN2jHQyj980ont6909
         5eLBmtej3F6XifvWrbwblgQXD+sAeGRtvpSM8W8g5bAHdvi6wZPj6w4ICSX0LGoADDcy
         hSQke4fkDlewXVqeKo+m2UwudSENnsX1Pka2SBrQcEZYlS+7kHovHq6Y6J1fGQMlLHnu
         BhxjTZ7QapAyU4TVHZvr3OYsbIHNFvE/vEkwkFP7Ip//VT1hReuZUZRMll2MSzf08nGv
         snKg==
X-Gm-Message-State: APf1xPCNIn32vha9CJ6Xx/iTPeUPl9PVp5gHyq7P5ZnnbO6kXlAToxbW
	QB6i4ssyI18YQMKVDP0ajTSZeywn3bMeRw==
X-Google-Smtp-Source: AH8x226dZgtv60HushNDw82xDwXQMmZaga2sIpxyk7CKhbScQV0Uv08lspB9wvSKE9PFo4mEUSSNdA==
X-Received: by 10.99.67.130 with SMTP id q124mr3040774pga.281.1518198900984;
        Fri, 09 Feb 2018 09:55:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id 72sm7888685pfp.42.2018.02.09.09.54.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 09:55:00 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 23/32] arm/helper.c: re-factor recpe and
 add recepe_f16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5093f9e-23b3-3d04-7a5b-038619d89d63@linaro.org>
Date: Fri, 9 Feb 2018 09:54:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zqdW+UhqJ8ax

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> +float16 HELPER(recpe_f16)(float16 input, void *fpstp)
> +{
> +    float_status *fpst = fpstp;
> +    float16 f16 = float16_squash_input_denormal(input, fpst);
> +    uint32_t f16_val = float16_val(f16);
> +    uint32_t f16_sign = float16_is_neg(f16);
> +    int f16_exp = extract32(f16_val, 10, 5);
> +    uint32_t f16_frac = extract32(f16_val, 0, 10);
> +    uint64_t f64_frac;
> +
> +    if (float16_is_any_nan(f16)) {
> +        float16 nan = f16;
> +        if (float16_is_signaling_nan(f16, fpst)) {
> +            float_raise(float_flag_invalid, fpst);
> +            nan = float16_maybe_silence_nan(f16, fpst);
> +        }
> +        if (fpst->default_nan_mode) {
> +            nan =  float16_default_nan(fpst);
> +        }
> +        return nan;
> +    } else if (float16_is_infinity(f16)) {
> +        return float16_set_sign(float16_zero, float16_is_neg(f16));
> +    } else if (float16_is_zero(f16)) {
> +        float_raise(float_flag_divbyzero, fpst);
> +        return float16_set_sign(float16_infinity, float16_is_neg(f16));
> +    } else if (float16_abs(f16) < (1 << 8)) {
> +        /* Abs(value) < 2.0^-14 */

The pseudocode I'm looking at says 2.0^-16.  But I think the code is right --
this is checking for two zero bits at the top of a denormal, so that is
2.0^(-14-2).


> +        float_raise(float_flag_overflow | float_flag_inexact, fpst);
> +        if (round_to_inf(fpst, f16_sign)) {
> +            return float16_set_sign(float16_infinity, f16_sign);
> +        } else {
> +            return float16_set_sign(float16_maxnorm, f16_sign);
> +        }
> +        /* FP16 has it's own flag FZ16 flag which is in a separate fpst*/
> +    } else if (f16_exp >= 14 && fpst->flush_to_zero) {

(1) The comment is confusing.
    (a) It's placement within the previous IF is not helpful,
    (b) Why mention the separate fpst, begging the question of
        where it is?  We're using it, of course, so...

(2) The exponent is still biased, so this isn't 2.0^14 you're testing.

>      } else if (f32_exp >= 253 && fpst->flush_to_zero) {

E.g. the single-precision version tests (2^)126 + (bias)127.


r~

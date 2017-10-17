Received: by 10.223.197.9 with SMTP id q9csp4122848wrf;
        Mon, 16 Oct 2017 19:17:27 -0700 (PDT)
X-Received: by 10.84.235.75 with SMTP id g11mr10611288plt.155.1508206647676;
        Mon, 16 Oct 2017 19:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508206647; cv=none;
        d=google.com; s=arc-20160816;
        b=ZO/DMu4Qr8rsH7vu4F/pRex54u/bLu/EOD06RO9rcUzUsOrnKCGXKszAZamGgFBllk
         WbYFszY1A25e3LHtPp55gK6xI17yZibM65u4dycaTWr1FKzhyMKPX7OOxjigzmAfkSc1
         C2fvgv/2Jnom7yequQqQMHhDhuaCuogG7YXdnDy6gHXo10M6xUGlLLx2oNMD2qIlYGYh
         rYO+CiWWgwvhoTLdPnhPPsX3RnXFDb0bvUr4dqMhfNIbDj1+V/dC6RLBJjHycs2xs7PX
         9nkwYE3Mf6q8wQjH7Q2U/jIHBJv7emMFxYHA7sCpJrdkmdP1MiXfailhUBHRsORAI4KD
         MNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=vPY4Dzo9WbS31hbWGcX9XAvyAqCayJJ/hYOpzWYX1lo=;
        b=cy1xbIyZ2cQBxmiWlvwA4dghULzFJRMHXNP37nGZ6xOHynJnGOJljuFLrawnNeZar9
         1t44t54AFGUJRnJ7Nzani3A1pBajyoBiRDdhV01SeJEIgmFipQeAWILtsq8gcVfK63RB
         M+iQruNsuumtCz2hClqLCTUJ7fK+rh1d5yOuvPzS1f/LgMsuohefeq09+qW1ZEgAcBDj
         iABTXy7QhQ+rIBzb5FmtAAjBOAwXvx4ndbffKRAncucVuzxZSnuVa/briljVKn9U4MX6
         rhTEH+cyo/t7VKhF+ZMx8aWFaTj0oa0Hf/q/kF0vEUn2clJ8OIxsh2TxDfbCTY/vOgZ5
         K1xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alfT1DG2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 75sor2040006pfx.7.2017.10.16.19.17.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 19:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alfT1DG2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vPY4Dzo9WbS31hbWGcX9XAvyAqCayJJ/hYOpzWYX1lo=;
        b=alfT1DG25wvYLQwYmPRV2zALriukPSju7bvyK2xeYZ1ZLe1y+4DspDe7L5pHQQG2SA
         xMaAXPt5faalf6LlfGXZlzh9F2e2NMPS8f3oxRi2NzVmxjSV850oQrKKWwwptI/BKKpv
         BGQmU9L80PfmmsqmRL03aULjNfZP67n5D0pCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vPY4Dzo9WbS31hbWGcX9XAvyAqCayJJ/hYOpzWYX1lo=;
        b=W6dzdJsL5ZqTbfR1znRbBEKl4jxY7L7HixfT/VQPxWFcj0gfbBn4Im7cTadRCzdQoH
         F+fObIT1itmA7/q7A6LE002UtXLVjfRRg2xVUXePL6An8KCvD7ZDBjcsEfAM3+rcMSlR
         lOd4rdcsy0vm6N/9x/zy8lSn+9SyZKYUBEi8omcKRAqNJR2JCRqZ3XQO7KkN0ILztoPe
         q9W8Hw1bxjyw0KUnVyiPOBfCU6mGbz1m7LVZmEvv0v41s7olG8jrmTLcsCqgodKbqCNT
         vJAQqIqFDeMkq6kKQMlApiuFHkHh03U2oVhGi0vUIHYiuvk7xVo3n6xJjAV6+fdFe//I
         2Lwg==
X-Gm-Message-State: AMCzsaUbuRSuqJhW9V+n/5l/2shO8aGBifBuMrBK+9p1GGl9wtdWcCbC
	9nIsFFFpfCy4fSzhw/aFOBeZatgi
X-Google-Smtp-Source: AOwi7QAbF1uFjkAlyWcJGOdx6QomVsdHOTpJxhTelu5fjX1a2a4RdfMlnYzfwE8D9axgMZX+VrQsdw==
X-Received: by 10.98.14.195 with SMTP id 64mr10344785pfo.197.1508206647053;
        Mon, 16 Oct 2017 19:17:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id g16sm14747741pgn.43.2017.10.16.19.17.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 19:17:26 -0700 (PDT)
Subject: Re: [RFC PATCH 23/30] softfloat: add float16_rem and float16_muladd
 (!CHECK)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ea7a069-0a84-d5fa-e75a-82e429ab9705@linaro.org>
Date: Mon, 16 Oct 2017 19:17:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jgWrMiY0w4tS

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> +float16 float16_rem(float16 a, float16 b, float_status *status)
> +{
> +    flag aSign, zSign;
> +    int aExp, bExp, expDiff;
> +    uint32_t aSig, bSig;
> +    uint32_t q;
> +    uint64_t aSig64, bSig64, q64;
> +    uint32_t alternateASig;
> +    int32_t sigMean;
> +    a = float16_squash_input_denormal(a, status);
> +    b = float16_squash_input_denormal(b, status);
> +
> +    aSig = extractFloat32Frac( a );
> +    aExp = extractFloat32Exp( a );
> +    aSign = extractFloat32Sign( a );
> +    bSig = extractFloat32Frac( b );
> +    bExp = extractFloat32Exp( b );
> +    if ( aExp == 0xFF ) {
> +        if ( aSig || ( ( bExp == 0xFF ) && bSig ) ) {
> +            return propagateFloat32NaN(a, b, status);
> +        }
> +        float_raise(float_flag_invalid, status);
> +        return float16_default_nan(status);
> +    }
> +    if ( bExp == 0xFF ) {
> +        if (bSig) {
> +            return propagateFloat32NaN(a, b, status);
> +        }
> +        return a;
> +    }

s/0xff/0x1f/.

> +    if ( bExp == 0 ) {
> +        if ( bSig == 0 ) {
> +            float_raise(float_flag_invalid, status);
> +            return float16_default_nan(status);
> +        }
> +        normalizeFloat32Subnormal( bSig, &bExp, &bSig );
> +    }
> +    if ( aExp == 0 ) {
> +        if ( aSig == 0 ) return a;
> +        normalizeFloat32Subnormal( aSig, &aExp, &aSig );
> +    }
> +    expDiff = aExp - bExp;
> +    aSig |= 0x00800000;
> +    bSig |= 0x00800000;

These implicit bits are set for float32.

> +    if ( expDiff < 32 ) {
> +        aSig <<= 8;
> +        bSig <<= 8;

This algorithm isn't going to work unless the fractions are normalized to
0b1xxx_xxxx_xxx0_0000, just like for float32.  Indeed, I think you should
actually share code.

> +    return normalizeRoundAndPackFloat32(aSign ^ zSign, bExp, aSig, status);

... but you really will have to pack into the correct format.

> +    if (((aExp == 0xff) && aSig) ||
> +        ((bExp == 0xff) && bSig) ||
> +        ((cExp == 0xff) && cSig)) {

0x1f, lots more times.

> +    /* Calculate the actual result a * b + c */
> +
> +    /* Multiply first; this is easy. */
> +    /* NB: we subtract 0x7e where float16_mul() subtracts 0x7f
> +     * because we want the true exponent, not the "one-less-than"
> +     * flavour that roundAndPackFloat16() takes.
> +     */
> +    pExp = aExp + bExp - 0x7e;
> +    aSig = (aSig | 0x00800000) << 7;
> +    bSig = (bSig | 0x00800000) << 8;

All of these constants are for float32, not float16.


r~

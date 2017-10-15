Received: by 10.223.197.9 with SMTP id q9csp2769176wrf;
        Sun, 15 Oct 2017 11:02:48 -0700 (PDT)
X-Received: by 10.99.116.18 with SMTP id p18mr6327382pgc.269.1508090568772;
        Sun, 15 Oct 2017 11:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508090568; cv=none;
        d=google.com; s=arc-20160816;
        b=pwp/wzSYWXvMvKm1PDiTOMCQ7qqkTLJYMV98ox4mxad8ryDQgMBJNhmh3swcdsYKqH
         zriShl/FbyFeI2wCbnTVeNFZbn7t9wAYEQOu7F9qtTQSqOK7dRdUMawZ1oct6vqNAOPj
         D53G7lsiG0Xntni3dLjTfZExQuApQaWzqJ54dZHeHdMkelJ7mG8harcgiQiueGJs/b5x
         L8STl6e202yIsskWNSHcR95HfTbfWWOElx3gd5RgEA2PVR7ONYkYpXVqvHtnEeus5keO
         JWmmk220/cq+F3nQ8qZy5D3nFY6tg5WU47kjsy9rVv62Zox5bhoi0oChWKzGcpqbcVKT
         6N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=9ySNBD8AgHzDN+jpdKp+6Jeyip89cI3xL3saKWGYMFM=;
        b=EteeF6zJNbvRIvPm2VbiRXACESU0jxlCGsipTxs+i73oYLYU8u3Riz+oaYJpSL+CYR
         n9b0XyhZKbJcn1bxycdlw5ZEwIFUFQRdsUMjoikQW/lbe3uL2Qq387P+tJe125eKaJ+a
         mYWz5nXBvjhs/2xyKMUaVWSQeJ6DxHIPIXXvhhyvs+5pYOBq8PfOz15MzdkziHMKmjxz
         Epd3HOna+tETgDvOigmCF5iVuTa/BesCXG6XOJbb1el8YhBpzVI3KOpUv4uH5JVaAxml
         ygK6A4kQ4paotTPaa4+tK7BCahBO4jfuSSUIoAiDSErwn8UN5ORT3i9vVvs2+5yDgrvV
         UeVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQ7S3EFQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m26sor1086123pgc.83.2017.10.15.11.02.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Oct 2017 11:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQ7S3EFQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ySNBD8AgHzDN+jpdKp+6Jeyip89cI3xL3saKWGYMFM=;
        b=RQ7S3EFQT2XR3JbPDA5rbcbwzurQbEXxOJh+PUg/M3qaaZxgHmkxm8rmv2Gv8jSrJk
         wyzqdHm5A1+vGTA5j2xQFcLDkOhzau8f5XmJcKrmbAqoBNeKT94BJVMTHm6Mktcpbil+
         kvscXBuVA2jE2PDI3gNdI9Nz733eV4HE2hipo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9ySNBD8AgHzDN+jpdKp+6Jeyip89cI3xL3saKWGYMFM=;
        b=mtDIwo3ApbTDRoKFEhy/X2w02uBG6ckl5qC7MAV7CfjxCP9A+BvoUwUX6iqKWYScCc
         c4qA1Lo+OMGw8dT5IiWETr9UaV+7ZK2rFG/epgWorraKhS+QFpKJJyEQiZ4BPVWL67uX
         QovOjFTbEX/408eMXg0k0KsfWrooKWYKbGehN73XIJFokIUrb9/0SvaNLyKlzCc9CICq
         ai/G6WmKxfL1TC5pSy5EpVF2ICuoZiWAKNXxvw20bwk76HpfNBKTbpyLPuLBBM5Jlq4a
         cVrSnVxq8pg/xJnEWFjP9enp2aWmMzsAl0maSJhG6BuEP9i6injh1OlnIRh7l+A40hwT
         kbiA==
X-Gm-Message-State: AMCzsaWo1GepXP4yJmeBTSTmbgp2N1CyQien2FPzWB/f6l58GvIlNz7f
	61owXfVCZB2dL0tQZ2shdr4e7DIL
X-Google-Smtp-Source: AOwi7QBNgPTqomfLj/c9c94moVPR0zhYsXsXRy0M2dNUVDuXGFbGQjrL4KVIiWt3WpuVvmwR7FXwpQ==
X-Received: by 10.99.100.134 with SMTP id y128mr6238823pgb.45.1508090568142;
        Sun, 15 Oct 2017 11:02:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id b68sm11611597pfg.171.2017.10.15.11.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Oct 2017 11:02:47 -0700 (PDT)
Subject: Re: [RFC PATCH 14/30] softfloat: 16 bit helpers for shr, clz and
 rounding and packing
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7afef46-1d05-6701-dce5-39f3070e4129@linaro.org>
Date: Sun, 15 Oct 2017 11:02:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hymg3r4QMn5K

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> Half-precision helpers for float16 maths. I didn't bother hand-coding
> the count leading zeros as we could always fall-back to host-utils if
> we needed to.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/softfloat-macros.h | 39 +++++++++++++++++++++++++++++++++++++++
>  fpu/softfloat.c        | 21 +++++++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/fpu/softfloat-macros.h b/fpu/softfloat-macros.h
> index 9cc6158cb4..73091a88a8 100644
> --- a/fpu/softfloat-macros.h
> +++ b/fpu/softfloat-macros.h
> @@ -89,6 +89,31 @@ this code that are retained.
>  # define SOFTFLOAT_GNUC_PREREQ(maj, min) 0
>  #endif
>  
> +/*----------------------------------------------------------------------------
> +| Shifts `a' right by the number of bits given in `count'.  If any nonzero
> +| bits are shifted off, they are ``jammed'' into the least significant bit of
> +| the result by setting the least significant bit to 1.  The value of `count'
> +| can be arbitrarily large; in particular, if `count' is greater than 16, the
> +| result will be either 0 or 1, depending on whether `a' is zero or nonzero.
> +| The result is stored in the location pointed to by `zPtr'.
> +*----------------------------------------------------------------------------*/
> +
> +static inline void shift16RightJamming(uint16_t a, int count, uint16_t *zPtr)
> +{
> +    uint16_t z;
> +
> +    if ( count == 0 ) {
> +        z = a;
> +    }
> +    else if ( count < 16 ) {
> +        z = ( a>>count ) | ( ( a<<( ( - count ) & 16 ) ) != 0 );
> +    }
> +    else {
> +        z = ( a != 0 );
> +    }
> +    *zPtr = z;
> +
> +}

When are you going to use a SRJ of a uint16_t?  Isn't most of your actual
arithmetic actually done on uint32_t?

> +/*----------------------------------------------------------------------------
> +| Returns the number of leading 0 bits before the most-significant 1 bit of
> +| `a'.  If `a' is zero, 16 is returned.
> +*----------------------------------------------------------------------------*/
> +
> +static int8_t countLeadingZeros16( uint16_t a )
> +{
> +    if (a) {
> +        return __builtin_clz(a);
> +    } else {
> +        return 16;
> +    }
> +}

__builtin_clz works on "int".  You need to use clz32(a) - 16.

> +/*----------------------------------------------------------------------------
> +| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
> +| and significand `zSig', and returns the proper single-precision floating-

s/single/half/

> +| point value corresponding to the abstract input.  This routine is just like
> +| `roundAndPackFloat32' except that `zSig' does not have to be normalized.
> +| Bit 15 of `zSig' must be zero, and `zExp' must be 1 less than the ``true''
> +| floating-point exponent.
> +*----------------------------------------------------------------------------*/
> +
> +static float16
> + normalizeRoundAndPackFloat16(flag zSign, int zExp, uint16_t zSig,
> +                              float_status *status)
> +{
> +    int8_t shiftCount;
> +
> +    shiftCount = countLeadingZeros16( zSig ) - 1;
> +    return roundAndPackFloat16(zSign, zExp - shiftCount, zSig<<shiftCount,
> +                               true, status);

Do I recall correctly that your lsb is between bits 7:6, like
roundAndPackFloat32?  You've got 11 bits of sig.  Plus 7 bits of extra equals
18 bits.  Which doesn't fit in uint16_t.

So, the reason that roundAndPackFloat32 uses 7 bits is that 7 + 24 == 31.

We can either use a split at (15 - 11 =) 4 bits, and still fit in a uint16_t,
or we can drop uint16_t and admit that the compiler is going to promote to int,
or uint32_t, anyway.  If we do that, we have options of a split between 4 and
(31 - 11 =) 20 bits.

We talked this week re fp->int conversion, it did seem Really Useful when we
noted that sig << exp is representable in a uint32_t.  Which does suggest a
choice at or below (32 - 11 - 14 =) 7.


r~

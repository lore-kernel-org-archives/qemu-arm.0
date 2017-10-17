Received: by 10.223.197.9 with SMTP id q9csp4043816wrf;
        Mon, 16 Oct 2017 17:06:21 -0700 (PDT)
X-Received: by 10.84.157.74 with SMTP id u10mr10706755plu.402.1508198781608;
        Mon, 16 Oct 2017 17:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508198781; cv=none;
        d=google.com; s=arc-20160816;
        b=LBa0qqmwIaJFdkRFgX3ss7DVTEOitNlLLilV1cv6tq/5SjcLOcV/UsIKeEOhLdvrJA
         eFSkrdWyBuVcVoXxbldHFESVZxlAFrszEeyjCnVb3bgyoduiyXek1JFFfg86QOU/wFST
         ZR46BZnhF96uvOKpfR1alY7gQub4pRCvMtyVkNyYm2tXMNlA1WKkLcqCAHSB5v9TfG6i
         IprPvCGpx1AapE2HO5UhSlYf87uXHWcFvuOCEChnfNzv38i0rhPNFWSv+cf2bL6ar4pf
         2VgwzMe+661v/52H//osMJVtAioOtiQiOZYF2soGQMUYjhYwCvmdR7s+rGqtQBlqtXQv
         GADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=R3iYoaLGZtDZxtYPGWzCyRTq28D4trbytLgIlbLW3HI=;
        b=WQr3myMUHqLz/e4WAIwmm8YBVRr4frRBnpbwTWAEFc0pczEXAKHiqzby5YrJ93TTZn
         G+B8XGg2eiexNJIl1i4M4Ym8+EJOV+Esf8mFjiDnSQz4a2VTA8eant+5LA7VDlvTTcoD
         Oh3fplpVFBocNrjJ5Lc6omuMMBrsHxFB39xzx/OpSyWsZAeDwXM/lJTcGGGXXvdrQb3t
         bwQTH9OmhkyHPwssZhe2NkIovY+c0hdFwIMF+/yP3mU8ESJhwK3+uH4k0Z4IUOFwZQIq
         QDMUfV+SY+V0KrAtDmfntw/JT5M2Qu36qkN6pEkFi5rY669LmX9GkHjIht747mLJHV5i
         V0mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgyvT2KQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j5sor192306pgn.173.2017.10.16.17.06.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 17:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgyvT2KQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R3iYoaLGZtDZxtYPGWzCyRTq28D4trbytLgIlbLW3HI=;
        b=TgyvT2KQ/SdyCxBDDAn6frGMz0mUgevQ+66K2bQ8kBdoyrutAw382kQbTu01zSNxPa
         FWonuWV1vJLbcr45fGa7qH2+2WE2CDaK1D3Xv4sM/LIlXrV6S0CSToIduiJzG99UFOo3
         ohYzAFGOClazDaSlQqkdfhJuCvvpRBQc4Iw7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R3iYoaLGZtDZxtYPGWzCyRTq28D4trbytLgIlbLW3HI=;
        b=Zu6Vge9I3bn8lv2OW8Xna4E7RIVk8I0EkMjbJjhPs3ZAiSMyAcPrSwMtRucdDpRb5v
         BLua+xCFAyXXq4gxSpIprH7uduRzFyVD0vT5h3OdENB75qFkuJQ/ovlffoIYe8xeApBq
         rxTV+avn6Pp9N7AVZPG9PTodn3X8qaElFkx4smueJQQa2D+x0+QrZ6H1NDxDMzfB50xZ
         fTNDXi/mfeN2ostRZp2Co90YrKDSWYl7L9rdyiNcKZLZ+EDtKxQvOShe+P1XE3ryRYO0
         GXD65BRI70QCjPXHnRXKK6TujZB4CbwTtMP5HEYE+DyR6LjYgrCs1p7ufu4f8O8nWROk
         HvkQ==
X-Gm-Message-State: AMCzsaVwx+ArYIwnuMPpSAFP22FAQA57RI79DEhryeL7uNIbpw5RGa5K
	ph8ed4t4MgFk1vC8N0oyuq9XPNTa
X-Google-Smtp-Source: AOwi7QDTjLmDxpR8TK3IVtcEy3NvkR+iM3rmUTkdgM9lgoLXABSf7igqQQLB+awqVjt2/7JfEFlqVg==
X-Received: by 10.99.160.71 with SMTP id u7mr9455327pgn.22.1508198781177;
        Mon, 16 Oct 2017 17:06:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id v14sm14363336pgq.72.2017.10.16.17.06.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 17:06:20 -0700 (PDT)
Subject: Re: [RFC PATCH 20/30] softfloat: half-precision compare functions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f63c357-6071-158b-f174-adafbffa704f@linaro.org>
Date: Mon, 16 Oct 2017 17:06:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ptNHnqYUKvir

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> +int float16_eq(float16 a, float16 b, float_status *status)
> +{
> +    uint32_t av, bv;
> +    a = float16_squash_input_denormal(a, status);
> +    b = float16_squash_input_denormal(b, status);
> +
> +    if (    ( ( extractFloat16Exp( a ) == 0x1F ) && extractFloat16Frac( a ) )
> +         || ( ( extractFloat16Exp( b ) == 0x1F ) && extractFloat16Frac( b ) )

float16_is_any_nan

> +       ) {
> +        float_raise(float_flag_invalid, status);
> +        return 0;
> +    }
> +    av = float16_val(a);
> +    bv = float16_val(b);
> +    return ( av == bv ) || ( (uint32_t) ( ( av | bv )<<1 ) == 0 );

For this trick to work you have to truncate to uint16_t not uint32_t.
It might be easier to read as

  a == b || float16_is_zero(a | b)

That said, I wonder if it wouldn't be better to implement all of these in terms
of float16_compare, rather than duplicating all of this code.


r~

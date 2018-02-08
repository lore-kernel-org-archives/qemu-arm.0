Received: by 10.28.71.27 with SMTP id u27csp3831wma;
        Thu, 8 Feb 2018 14:32:53 -0800 (PST)
X-Received: by 2002:a17:902:560f:: with SMTP id h15-v6mr510362pli.302.1518129173336;
        Thu, 08 Feb 2018 14:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518129173; cv=none;
        d=google.com; s=arc-20160816;
        b=AA+JBm/ozDslDA2vJ/nPEWrxk7uX3y8bw3qKvYxruaKRqt7FOq/VwjentxW7imw9/5
         S0tBs0gAgwV4XO0zzXu9F0g+oDYBfXnTyw/wHdSM4EytL2yslPa2I5ccy7M0Mxw14ns+
         JUcXlvF3OcZy5NC72qXmwVZA+yReJdPjPSCJxHF1JW8hUyjK7dIgjAEIVGXx0CJqHuCE
         Z+QpTUHDtJ3TzXc0pI851nrK86X8Diaww0Vj4E5VwKMJWxOzOLgmwsjYtfhqdKUtmGON
         Nj+2LpaWmBX+aYXhqz5SemN7QUDGnmsyJYxWrdjlAHUPvgOdL9oHj/NM4WX2fldBcNr2
         MafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=GP7gjwBsOnkvlTXr8w1NKdgyFu9cO9Om8dv3nXZAoAw=;
        b=lsm/31bl4aFjES3mUQ5y2oXKRgAenHDIR4229jWbHAYTytpSIX/mHXDmhntn00ZhM2
         aj9jNvrHY8ytoxWD1mjwTz8Dz3ceDgDTBy4xN8XgkoNdS26GewUM46XrjRM+ffwMCkZC
         ckwEEE8oiIbL7vOI1tq68eYnHOxYt+7C8pfMj/RkgY2KzPmWCCPyEl9GtOw94RmAPj1H
         5hugNgpM6MyahGEcMG/UuQt4xZdfhIzXnIehoYYpGyXjvOj3E/HBcxatcy5VvvohUhNF
         4KiKtG8CZ442z2mhgbcJjxqi2CfeaQtwSaj05UqRLObWlJn7sVZDw6A1iNPF/LaJN4zT
         DF6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkAoejuF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r7-v6sor336302ple.45.2018.02.08.14.32.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 14:32:53 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YkAoejuF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GP7gjwBsOnkvlTXr8w1NKdgyFu9cO9Om8dv3nXZAoAw=;
        b=YkAoejuF1d6WTkpPaYcMBp5N5e5gvfnnTfl3BvlmqippCW1B1i+niuF3c88olVDE8Z
         ektCX0vPvxGHm0p1BjQa2BFD0E7k3AzUTFFAD39kZAG15oUIsqoj+lpI/laDJdvRfSVe
         pYqIqSQz/403PZxP84skB9BFQfxfgnCSfMuEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GP7gjwBsOnkvlTXr8w1NKdgyFu9cO9Om8dv3nXZAoAw=;
        b=tjC498CxyST6owinPJ0RwiTAdJigSEp+LBcQES1VroNXXjenp73FByV6XuNELrtJTF
         MD2Nvvpgi4Rl2MKLFYfQK3klGiO7wEt9RUSAMr3qnguzGq/YbNvS1sE5OH+fAM4b1vHU
         UqW3ctTXTiVJz1WXEfEapemxiAhy3mVr03t6OPHcDl4UbD6Ic+eBA2W4YxYjLrJI/tDl
         PCcVlsFs9NxIsB7FsnKF5aJax/lCJgj4BEF3dKozk8yTcn55BgcG/tzA3Ig6jxLRYHum
         XJSEIl3n8Tz93xFc5Xbv4jeROasW2YN/JGQRByRVqklBTTZAduEm8Oo9BKbKD9UyEsp4
         B+jw==
X-Gm-Message-State: APf1xPDbsp4XKHdNfqhyrX8EFTwDy/GNNg2nB3QTu/Ylzb5yXbtAgdnR
	zbcdhD/NPvLc01npLUGX0XyvCT+uEr2xDA==
X-Google-Smtp-Source: AH8x225zhStAZGdgarKkymEkQi3RI0mFAlEVaMUCtSWOdZ9XqrGeWuEQMnn3Jnf6Z1zZ5jYNzcE8Lw==
X-Received: by 2002:a17:902:5814:: with SMTP id m20-v6mr492522pli.434.1518129172819;
        Thu, 08 Feb 2018 14:32:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id q65sm1967489pfj.148.2018.02.08.14.32.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 14:32:51 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 18/32] arm/translate-a64: add FP16 FPRINTx
 to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6e52f89-a881-cdde-e995-a4fb59ca60b9@linaro.org>
Date: Thu, 8 Feb 2018 14:32:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: D4P8JQBO6NtX

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> @@ -10727,40 +10727,152 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>  /* AdvSIMD [scalar] two register miscellaneous (FP16)
>   *
>   *   31  30  29 28  27     24  23 22 21       17 16    12 11 10 9    5 4    0
> - * +---+---+---+---+--------+---+-------------+--------+-----+------+------+
> + * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
>   * | 0 | Q | U | S | 1 1 1 0 | a | 1 1 1 1 0 0 | opcode | 1 0 |  Rn  |  Rd  |
> - * +---+---+---+---+--------+---+-------------+--------+-----+------+------+
> + * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
>   *   mask: 1000 1111 0111 1110 0000 1100 0000 0000 0x8f7e 0c00
>   *   val:  0000 1110 0111 1000 0000 1000 0000 0000 0x0e78 0800
>   *
> - * ???While the group is listed with bit 28 always set to 1 this is not
> - * always the case.????
> - *
> - * This actually covers two groups,
> + * This actually covers two groups where scalar access is governed by
> + * bit 28. A bunch of the instructions (float to integral) only exist
> + * in the vector form and are un-allocated for the scalar decode. Also
> + * in the scalar decode Q is always 1.
>   */

Fold this hunk back into previous patch.

> 
> +
> +    /* Check additional constraints for the scalar encoding */
> +    if (is_scalar) {
> +        if (!is_q) {
> +            unallocated_encoding(s);
> +            return;
> +        }
> +        /* FRINTxx is only in the vector form */
> +        if (only_in_vector && is_scalar) {
> +            unallocated_encoding(s);
> +            return;
> +        }
> +    }

Testing is_scalar twice.
Otherwise it looks good.


r~

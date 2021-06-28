Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4082491lfg;
        Mon, 28 Jun 2021 08:05:00 -0700 (PDT)
X-Received: by 2002:a63:1841:: with SMTP id 1mr14101825pgy.377.1624892700262;
        Mon, 28 Jun 2021 08:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624892700; cv=none;
        d=google.com; s=arc-20160816;
        b=rvVvPGwL2z8AX3lw3u53KHNEf9gW4Zv+Kc94Sa/9+UakC+1I0N2hLBDEtgGfribNvz
         Gqox2k4yYjSv40cPaWSvHVs0EC/qsQcaaSQ3LGINyJXXWSHt2cbrfYz7zZD4mKmBXbnp
         /q5BHZPXjC/w9M/h3KGSdpjq4xjiOujP/dDqzYaZUMg0m232iFmL/PKUTqVtSfid76cf
         cByrYpD/h6OwKg9AAcoh+zSH0dII6o9t7pHGaL2F+pcvSpRGqNmXH9yK47/8PZGHj945
         FIV2z+DXNdrF0WWONOiU5qSTKjsH0WeHSoOmfc1fkH7qUZkwRaNQr1b7VTNGQt3Kyqqx
         n+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=PUywesX7lF2HuhE3R4LcaZPpZv75bs4yLUICjDbuMpI=;
        b=MIRnrGJvi9PfoNXeQ1JSWagI2AGbXkxh+G6xo8Cd4r48HSI8TZK8WUOeZRsDVIYtNL
         9m6O3VMfO57IZvA7OUR+HwAYnXRkmX7FEUX64Q8TbnODG1SuSdNNUZRbTCOJOrIRCcwF
         hamcwYv2uqtulbX9EBT7PmmUJL1W6S4z475yAzLgRcvU4YujQaO3NZi91NtPj0AIVScy
         sa61X/PWJ/l4rW8L2ShP0U5axfarltd8am6D6dRxlTEu31A9YdXLe/pQYVU/5dfdU25A
         7rZH5FBZHwgrkEuQ4e+3GxhKtVMHotrkZSnM7l2KcBoBX+W4kyjMltl6M0BMlDIebTIn
         LZhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuVHRNsh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p5sor7281140pjg.37.2021.06.28.08.05.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Jun 2021 08:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuVHRNsh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PUywesX7lF2HuhE3R4LcaZPpZv75bs4yLUICjDbuMpI=;
        b=XuVHRNshn2kyoYoYv8gDh2uQQOaD6x1KlNrOUPnvxMK7BMsfqV4qQDyGzwEVfRhS7d
         oSGYbqqvq18iRT5cySbwyP+H4H2z84utu+Tv30j8ZZXrYIVFyvM41IUzIuicFdyuRERR
         b1cbc2yrBBvxWzuB5qyozrJHtY+Jo06Ll5TLYP2YTQLsLyDPQWVpKvEDF2ddMqffyo+C
         RQ3/xG6Z/e6k+rpopC11UGKa9BjcXDeyHY4NDh8kWeFRCcJ4wyGqhrgdoDwHGiS7HyDp
         6Y0vzHJqhFtEmkbcmbVwfADWu+LqZlguvDjylKqINVNsML4HKy/6doZyQfncdx4kynAP
         LUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PUywesX7lF2HuhE3R4LcaZPpZv75bs4yLUICjDbuMpI=;
        b=fRUbfDoKwxqQWQUPH87XwLNrmvyhzPGl+BAn+CgIP4IKR/FBBNCZi5X5RX0OI91svX
         m+zvy1g3bG04I+pXU36gH1/Mk256pPfa0u/OkSSieDMNhPAZ6DfBg1qXXuRspimx2d8Z
         CKyR1e9Ik+asaOF9gfOX5UW8+uzZoPy73bs83fK/Xlb2XhsxDL6xvDeSHjHWO+fnB0In
         7qblub6A4kJ0uSm2kzcCJvT6zeTi+hPOKMDILY2/B0uUCjvOPXJ3tHvEHGuZlWjoCujk
         OAg6L35vygXD78cvJE+s/76iNtHKI/kG8SI/9rYFDsYf/X0Mf7VD2KApr+WlucizDleD
         +1Uw==
X-Gm-Message-State: AOAM531OivA5t8+b5Zg+V4NU4nfqrWS8Ymn6V8iXwqgJ4j2VuxjyBtBr
	QPAWtYI6oqYXmhJzdtOyVG7h0wDVNQ96P9Ms
X-Google-Smtp-Source: ABdhPJwsaMI+jIE7OLAtv/p0bBSIJB14sjnRzdnI5bz6RUUSpEZkcLbtMQyTjZBl6nRukrCmS1m2KA==
X-Received: by 2002:a17:90a:fd11:: with SMTP id cv17mr6483464pjb.8.1624892699675;
        Mon, 28 Jun 2021 08:04:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id o34sm16141257pgm.6.2021.06.28.08.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 08:04:59 -0700 (PDT)
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Peter Maydell <peter.maydell@linaro.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
Date: Mon, 28 Jun 2021 08:04:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: WAP24Fv383Hs

On 6/28/21 7:54 AM, Peter Maydell wrote:
> Richard, Alex: what is the assertion trying to achieve ? It doesn't
> seem entirely obvious to me that because we're in default-NaN mode
> (which is a property of the *output* of FPU insns) that we should
> blow up on calling float*_silence_nan() (which is typically an action
> performed on the *input* of FPU insns).

This was in response to e9e5534ff30.

My assumption in adding the assert is that it was probably a configuration error.  If you 
disagree, I suppose we can revert it, as it's not critical.

> If we do want to keep the assertion, somebody should audit the
> other frontends that use float*_silence_nan() (i386, m68k, s390x)
> to see if they also need updating.

Easily done.  None of them ever set default_nan mode.


r~

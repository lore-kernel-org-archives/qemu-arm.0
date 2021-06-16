Received: by 2002:a05:6214:c86:0:0:0:0 with SMTP id r6csp1123605qvr;
        Wed, 16 Jun 2021 10:40:59 -0700 (PDT)
X-Received: by 2002:a65:6911:: with SMTP id s17mr778087pgq.128.1623865258853;
        Wed, 16 Jun 2021 10:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623865258; cv=none;
        d=google.com; s=arc-20160816;
        b=sZijC3rJoKf5Xm6Pc3dXBjW5H/AK6AMR/aK2ODgw+JGXTgkxXb6AKGw0p7VRjI4egk
         gUwwqvI4d2QW66g9CbQrZT/AWPN07zNmvU+/hyi/VClg9uIJJCrLUNUuDEye4YYa0VKX
         u+ZXRuztOt2cia8Oj70zMrIqbqhERe3S/s5Ox7h0Luc5kwUSyoPrDqVzCy+QktsrG+kg
         wWsVLZt3Bswr9OF94wDB6hbIvXfpeuYVCOKROSJm9VkmygGP2qbt6npAGBEAVTvvtcXw
         mwOQ3JFqeUEBzSw6dCOX/xfULAYLlSRxyr9ewBP/2P0pIBGkDoiWywPwSKm3FUT788gD
         LHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=TfYWu4LZt60DcT140T1hl/rnF7DyK95ypZd+TzuelCk=;
        b=QFLUy3AGXZQGXs/Q86i5aUJKKnyGV3wavs9nvcR1Q1mKLUjWIEPeyo7aXAwu/NZnpB
         pcOUJesxKzNRYCGEIoWTdDPm316emu2Ag41ENvabNDU/0PA74z6bKy46NwwTrHvLJY7a
         M22oB4FzZU8u9g9tglAo/e4f+7ZJsjSG+qZiSd6PrEhuHtk4rihQX0mYu0eS9LHKQRO8
         EhRkmc2jhVXCiYSbdrKqhzT+zjrtGfxFSd8Hf7I8raAbJzpShcHH7k5HZGMHP5qOO/J6
         QT3HyEBF/RzYVR+5/bcVd35CXt0ZJGZ8AizwmC1YMoqTbF4oaws8AU028xM4jG04PADq
         y0Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a5lTm0iy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my10sor3799333pjb.2.2021.06.16.10.40.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Jun 2021 10:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a5lTm0iy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TfYWu4LZt60DcT140T1hl/rnF7DyK95ypZd+TzuelCk=;
        b=a5lTm0iyy7pmQ+eHbIkfnXJ3Hg196Lz18wJX/d6WJ1hogbvLT+1EZEoe13JJbPRyoB
         1Sho3xRpIODPvAFAlPyqWJO1SLKsBLog6O2uITcJt87vfBt37OnWVTijUzL+HY+IU7fv
         3L8ai+eK3MXTb7nqpeNwAPKu8BCfzgY5aDcXmQ8kx2PeC0Qm8G8pwfcjZT36+VSvWEIt
         c0nvIklLdGGUx7PF5MlQ1nmBbx/R4WmTTh6Y0hp22SLhh4t44MrTr6Z0YNKw5ouPqAzy
         GSOGehL1zI8hn1z8GANf3nXq2+VJlbh3XnG+AnR5+FYD299NrBoSvROP7fWtSt5MZgVo
         xMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TfYWu4LZt60DcT140T1hl/rnF7DyK95ypZd+TzuelCk=;
        b=o9iQHtZ+6HlzyLZlzaeLfT9HhlkjJxO/Xo+TwQgVTEuQCW9P9OGM92/z7tUgugA4gy
         PkfVNwpQQB9abfQbQCKMvhIz+svgNn981ic616IIdcbGkOGccjD6uZVui7uF5ZzV0VJS
         3XRT/DkWK6jK8NmM7X4ivCwJw/gdzSCBsHrVqwq3wNesmx75mLOu+IY62Bol8PbOHvUE
         IyOKr6SfpXGpKW3yVS9tRoYCVYuXwW6OJKAls3MtoGM6B/MaxkqOK8+TgDbxV5XuC15y
         Hk+wT4hgas6LVpGFB+UXHIfdCqPffHzmrCi3k+bqFu69Ud+Zbe3Bzd5AMEJlKBAXgfPP
         hYnA==
X-Gm-Message-State: AOAM532MwIi6ghb84Qt/Ch33CeyTQIdYR3GjEqOnLSKEJqj3wZTw2V+f
	tfbj579aJrAlOFtNvGjKg6A3YYmXTrKhGQJT
X-Google-Smtp-Source: ABdhPJyZhvX63xFmddmKnz+XGXMRVu74K0kq5qTk5PpLs7VuA4WNPp5QMFJroD65sj0Tdw75jrBHfQ==
X-Received: by 2002:a17:90b:1908:: with SMTP id mp8mr987064pjb.106.1623865258254;
        Wed, 16 Jun 2021 10:40:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id l5sm2686799pff.20.2021.06.16.10.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:40:57 -0700 (PDT)
Subject: Re: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-5-richard.henderson@linaro.org>
 <87y2b9gbx7.fsf@linaro.org> <87tulxgbqw.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <915fbc3c-29a8-3fe3-1deb-4da917212cb9@linaro.org>
Date: Wed, 16 Jun 2021 10:40:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87tulxgbqw.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: E+x2AYct9npJ

On 6/16/21 6:49 AM, Alex Bennée wrote:
>    ../../linux-user/arm/signal.c: In function ‘setup_sigtramp’:
>    ../../linux-user/arm/signal.c:847:47: error: expected ‘,’ before ‘)’ token
>         _Static_assert(SIGFRAME_FDPIC_OFS <= 0xfff);

Heh.  Apparently, _Static_assert with no message parameter is a further extension, present 
in c17 but not c11.  I presume it's enabled with gnu11 on my compiler version, but not yours.

I'll change to use QEMU_BUILD_BUG_ON, and give up on removing that macro for a while.


r~
